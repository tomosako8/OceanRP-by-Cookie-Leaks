RegisterNetEvent("esx_shops:getrequest")
TriggerServerEvent("esx_shops:request")
AddEventHandler("esx_shops:getrequest", function(a)
	_G.sell = a
	local donttouchme = _G.sell

ESX                           = nil
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local PlayerData              = {}

CreateThread(function()
	while ESX == nil do
		TriggerEvent('exilerp:getSharedObject', function(obj) 
			ESX = obj 
		end)
		
		Citizen.Wait(250)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)


function OpenShopMenu(zone)
	PlayerData = ESX.GetPlayerData()

	local elements = {}
	for k,v in pairs(Config.Zones[zone].Items) do
		table.insert(elements, 
			{
				label =  v.title..' <span style="color: #7cfc00;">$'..v.price..'</span>',
				item = v.item,
				price = v.price,
				titleconfirm = v.title,
				value      = 1,
				type       = 'slider',
				min        = 1,
				max        = v.limit
			}
		)
	end
	if zone == 'Lombard' then
		table.insert(elements, {label = 'Spzedaj przedmioty', value = 'lombard'})
	end

	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop', {
		title    = 'Sklep',
		align    = 'center',
		elements = elements
	}, function(data, menu)
	
		if data.current.value == 'lombard' then
			menu.close()
			OpenLombardMenu()
		else
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
				title    = 'Czym chcesz zapłacić za '..data.current.titleconfirm..' za '..data.current.price..'$?',
				align    = 'center',
				elements = {
					{label = 'Gotówką',  value = 'gotowka'},
					{label = 'Kartą', value = 'karta'},
					{label = 'Nie chce nic kupywać', value = 'niechce'},
				}
			}, function(data2, menu2)
					if data2.current.value == 'gotowka' then
						TriggerServerEvent('esx_shops:buyItem', data.current.item, data.current.value, data.current.price, data.current.max, 'money', zone)
				elseif data2.current.value == 'karta' then
					TriggerServerEvent('esx_shops:buyItem', data.current.item, data.current.value, data.current.price, data.current.max, 'bank', zone)
				elseif data2.current.value == 'niechce' then
					menu2.close()
					menu.open()
				end

				menu2.close()
			end, function(data2, menu2)
				menu2.close()
			end)			
		end
	end, function(data, menu)
		menu.close()
		CurrentAction     = 'shop_menu'
		CurrentActionMsg  = 'Naciśnij ~INPUT_CONTEXT~ aby skorzystać ze ~y~sklepu~s~.'
		CurrentActionData = {zone = zone}
	end)
end

AddEventHandler('esx_shops:hasEnteredMarker', function(zone)
	CurrentAction     = 'shop_menu'
	CurrentActionMsg  = 'Naciśnij ~INPUT_CONTEXT~ aby skorzystać ze ~y~sklepu~s~.'
	CurrentActionData = {zone = zone}
end)

AddEventHandler('esx_shops:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

-- Enter / Exit marker events
CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords, sleep      = GetEntityCoords(PlayerPedId()), true
		local isInMarker  = false
		local currentZone = nil

		for k,v in pairs(Config.Zones) do
			for i = 1, #v.Pos, 1 do
				if #(coords - vec3(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)) < Config.Size.x then
					sleep = false
					isInMarker  = true
					ShopItems   = v.Items
					currentZone = k
					LastZone    = k
				end
			end
		end
		if isInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
			TriggerEvent('esx_shops:hasEnteredMarker', currentZone)
		end
		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_shops:hasExitedMarker', LastZone)
		end
		if sleep then
			Citizen.Wait(500)
		end
	end
end)

RegisterNetEvent("shop:open:cookie")
AddEventHandler("shop:open:cookie", function()
	OpenShopMenu(CurrentActionData.zone)
end)

function OpenLombardMenu()
	local elements = {}
	for i=1, #Config.LombardItems, 1 do
		local item = Config.LombardItems[i]
		table.insert(elements, {
			label      = item.label .. ' - <span style="color: #7cfc00;">$' .. item.price .. '</span>',
			itemLabel = item.label,
			item       = item.item,
			price      = item.price,
		})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'lombard', {
		title    = "Lombard",
		align    = 'center',
		elements = elements
	}, function(data, menu)
		local counter = data.current.item
		local inventory = ESX.GetPlayerData().inventory
			  for i=1, #inventory, 1 do                          
				  if inventory[i].name == counter then
					counter= inventory[i].count
				  end
			  end
		local total = data.current.price * counter
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'lombard_q', {
			title    = "Potwierdź sprzedaż",
			align    = 'center',
			elements = {
				{label = "== Sprzedaj <span style='color:yellow;'>x"..counter.." "..data.current.itemLabel.."</span> za <span style='color:green;'>"..total.."$</span> ==",  value = 'no'},
				{label = "Tak",  value = 'yes'},
				{label = "Nie", value = 'no'}
		}}, function(data2, menu2)

			if data2.current.value == 'yes' then
				TriggerServerEvent(donttouchme,GetCurrentResourceName(), data.current.item)
			end
			menu2.close()
		end, function(data2, menu2)
			menu2.close()
		end)

	end, function(data, menu)
		menu.close()
		CurrentAction     = 'shop_menu'
		CurrentActionMsg  = 'Naciśnij ~INPUT_CONTEXT~ aby skorzystać ze ~y~sklepu~s~.'
		CurrentActionData = {zone = zone}
	end)
end
end)