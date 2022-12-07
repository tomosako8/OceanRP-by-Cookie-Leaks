local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["centerSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["centerCTRL"] = 36, ["centerALT"] = 19, ["SPACE"] = 22, ["centerCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["center"] = 174, ["center"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local Player = {}
local cayoMines = {}
local minesExploded = {}
local Schowki = {}
local cayoConfig = {}

local boughtItems = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	Player.Identifier = xPlayer.identifier
	Player.Job = xPlayer.job
	Player.Ped = GetPlayerPed(-1)
end)

AddEventHandler('onClientResourceStart', function(resource)
	if GetCurrentResourceName() == resource then
		local xPlayer = ESX.GetPlayerData()
		while xPlayer == nil do
			xPlayer = ESX.GetPlayerData()
			Wait(300)
		end
		Player.Identifier = xPlayer.identifier
		Player.Job = xPlayer.job
		Player.Ped = GetPlayerPed(-1)
	end
end)

RegisterNetEvent('cayo_perico:load')
AddEventHandler('cayo_perico:load', function()
	local xPlayer = ESX.GetPlayerData()
	while xPlayer == nil do
		xPlayer = ESX.GetPlayerData()
		Wait(300)
	end
	Player.Identifier = xPlayer.identifier
	Player.Job = xPlayer.job
	Player.Ped = GetPlayerPed(-1)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job, response)
	Player.Job = job
end)

RegisterNetEvent('cayo_perico:catchDATA')
AddEventHandler('cayo_perico:catchDATA', function(DATA)
	cayoMines = DATA.cayoMines
	Schowki = DATA.cayoSchowki
	cayoConfig = DATA.cayoConfig
	updateMines()
end)

RegisterNetEvent('cayo_perico:placeMine')
AddEventHandler('cayo_perico:placeMine', function()
	placeMine()
end)

RegisterNetEvent('cayo_perico:catchMinesExploded')
AddEventHandler('cayo_perico:catchMinesExploded', function(pos)
	table.insert(minesExploded, {pos = pos})
	updateMines()
end)

function placeMine()
	if not IsPedSwimming(Player.Ped) then
		ESX.ShowNotification("Ten rodzaj miny mozna stawiac tylko w wodzie!")
		return
	end
	Citizen.CreateThread(function()
		ESX.ShowNotification("Stawianie miny wodnej...")
		FreezeEntityPosition(Player.Ped, true)
		TaskPlayAnim(Player.Ped, 'anim@mp_fireworks', 'place_firework_3_box', 8.0, 8.0, 4000, 0, 0.0, 0, 0, 0)
		Citizen.Wait(4100)
		FreezeEntityPosition(Player.Ped, false)
		TriggerServerEvent('cayo_perico:placeMine')
		ESX.ShowNotification("~g~Mina wodna podlozona!")
	end)
end

function updateMines()
	for _,v in ipairs(cayoMines) do
		local obj = GetClosestObjectOfType(v.pos.x, v.pos.y, v.pos.z, 3.0, -1785866776, false, false, false)
		if obj == 0 then
			CreateObject(-1785866776, v.pos.x, v.pos.y, v.pos.z, false, true, false)
		else
			for m,mine in ipairs(minesExploded) do
				if obj ~= 0 then
					SetEntityAsMissionEntity(obj, true, true)
					DeleteObject(obj)
					table.remove(minesExploded, m)
				end
			end
		end
	end
end

function removeMine(coords)
	for _,v in ipairs(cayoMines) do
		if v.pos.x == coords.x and v.pos.y == coords.y then
			table.remove(cayoMines, _)
			TriggerServerEvent('cayo_perico:mineExploded', v.id, v.pos)
			table.insert(minesExploded, {pos = v.pos})
			break
		end
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if Player.Job.name ~= 'org17' then
			local pedCoords = GetEntityCoords(Player.Ped)
			local obj = GetClosestObjectOfType(pedCoords.x, pedCoords.y, pedCoords.z, 30.0, -1785866776, false, false, false)
			local model = GetEntityModel(obj)
			if model == -1785866776 then
				local entCoords = GetEntityCoords(obj)
				local distance = GetDistanceBetweenCoords(pedCoords, entCoords, false)
				if distance < 8 then
					AddExplosion(entCoords.x, entCoords.y, entCoords.z+1, 81, 3.0, true, false, true)
					SetEntityAsMissionEntity(obj, true, true)
					DeleteEntity(obj)
					removeMine(entCoords)
				end
			end
		end
	end
end)

local bossMenuOpen = false

function bossMenuBlip()
	local pedCoords = GetEntityCoords(Player.Ped)
	local coords = Config.BossMenu.coords
	local distance = GetDistanceBetweenCoords(pedCoords, coords.x, coords.y, coords.z, false)
	if distance < 10 then
		DrawMarker(27, coords.x, coords.y, coords.z, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 14, 216, 18, 0.8, false, true, 2, true, nil, nil, false)
		if distance < 1.5 and not bossMenuOpen then
			ESX.ShowHelpNotification("Kliknij ~INPUT_CONTEXT~, aby otworzyc akcje ~g~Cayo Perico")
			if IsControlJustPressed(0, Keys["E"]) then
				openBossMenu()
			end
		elseif distance > 1.5 and bossMenuOpen then
			bossMenuOpen = false
			ESX.UI.Menu.CloseAll()
		end
	end
end

function openBossMenu()
	bossMenuOpen = true
	ESX.TriggerServerCallback('cayo_perico:runAction', function(data)
		print(data)
		local elements = {
			{label = "==================", value = 'a'},
			{label = "Pieniadze kartelu <font color=\"green\">"..data.."$<font color=\"white\">", value = 'cartel_money'},
			{label = "==================", value = 'b'},
			{label = "Zarzadzanie pracownikami", value = 'manage_employee'},
			{label = "Zatrudnianie pracownikow", value = 'recruit_employee'},
			{label = "==================", value = 'c'}
		}
		if not cayoConfig.boughtPonton then
			table.insert(elements, {label = "Wykup pontony 25000$", value = 'buy_ponton'})
		end
		if not cayoConfig.boughtProm then
			table.insert(elements, {label = "Wykup prom 200000$", value = 'buy_prom'})
		end
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'boss_menu', {
			title    = "Akcje Cayo Perico",
			align    = 'center',
			elements = elements
		}, function(data, menu)
			if data.current.value == 'cartel_money' then
				cartelMoney()
			elseif data.current.value == 'manage_employee' then
				manageEmployee()
			elseif data.current.value == 'recruit_employee' then
				recruitEmployee()
			elseif data.current.value == 'buy_ponton' then
				TriggerServerEvent('cayo_perico:buyUpgrade', 'ponton')
			elseif data.current.value == 'buy_prom' then
				TriggerServerEvent('cayo_perico:buyUpgrade', 'prom')
			end
		end, function(data2, menu2)
			menu2.close()
			bossMenuOpen = false
		end)
	end, {action = 'getmoney'})
end

function manageEmployee()
	ESX.TriggerServerCallback('cayo_perico:getEmployees', function(employee)
		local elements = {}
		for k,v in pairs(employee) do
			if v.grade == 0 then
				table.insert(elements, {label = v.firstname.." "..v.lastname.." <font color=\"#2ECC71\">"..v.joblabel.."<font color=\"white\">", value = v})
			elseif v.grade == 1 then
				table.insert(elements, {label = v.firstname.." "..v.lastname.." <font color=\"#16A085\">"..v.joblabel.."<font color=\"white\">", value = v})
			elseif v.grade == 2 then
				table.insert(elements, {label = v.firstname.." "..v.lastname.." <font color=\"#F39C12\">"..v.joblabel.."<font color=\"white\">", value = v})
			elseif v.grade == 3 then
				table.insert(elements, {label = v.firstname.." "..v.lastname.." <font color=\"#F1C40F\">"..v.joblabel.."<font color=\"white\">", value = v})
			elseif v.grade == 4 then
				table.insert(elements, {label = v.firstname.." "..v.lastname.." <font color=\"#7D3C98\">"..v.joblabel.."<font color=\"white\">", value = v})
			elseif v.grade == 5 then
				table.insert(elements, {label = v.firstname.." "..v.lastname.." <font color=\"#3498DB\">"..v.joblabel.."<font color=\"white\">", value = v})
			elseif v.grade == 6 then
				table.insert(elements, {label = v.firstname.." "..v.lastname.." <font color=\"#CB4335\">"..v.joblabel.."<font color=\"white\">", value = v})
			elseif v.grade == 7 then
				table.insert(elements, {label = v.firstname.." "..v.lastname.." <font color=\"#A93226\">"..v.joblabel.."<font color=\"white\">", value = v})
			end
		end
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'boss_menu_dialog', {
			title = 'Pracownicy',
			align = 'center',
			elements = elements
		}, function(data, menu)

		end, function(data, menu)
			menu.close()
			bossMenuOpen = false
		end)
	end)
end

function recruitEmployee()
	local players = ESX.Game.GetPlayers()

	local elements = {}
	local playerCoords = GetEntityCoords(Player.Ped)

	for k,v in ipairs(players) do
		local targetPed = GetPlayerPed(v)
		local entityCoords = GetEntityCoords(targetPed)
		local entityServerID = GetPlayerServerId(v)
		local distance = GetDistanceBetweenCoords(playerCoords, entityCoords, false)
		if distance < 30 then
			table.insert(elements, {label = ""..GetPlayerName(v), value = {serverID = entityServerID, ped = targetPed, playerID = v}})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'boss_menu_recruit', {
		title    = "Akcje Cayo Perico",
		align    = 'center',
		elements = elements
	}, function(data, menu)
		local choosen = data.current.value
		local elements2 = {
			{label = "Zrekrutuj", value = 'recruit'},
			{label = "Anuluj", value = 'cancel'}
		}
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'boss_menu_dialog', {
			title = 'Rekrutujesz '..GetPlayerName(choosen.playerID),
			align = 'center',
			elements = elements2
		}, function(data2, menu2)
			if data2.current.value == 'recruit' then
				TriggerServerEvent('cayo_perico:recruitPlayer', choosen.serverID)
				bossMenuOpen = false
				ESX.UI.Menu.CloseAll()
			elseif data2.current.value == 'cancel' then
				menu2.close()
			end
		end, function(data2, menu2)
			menu2.close()
			bossMenuOpen = false
		end)
	end, function(data, menu)
		menu.close()
		bossMenuOpen = false
	end)
end

function cartelMoney()
	bossMenuOpen = true
	local elements = {
		{label = "Wyplac pieniadze", value = 'withdraw'},
		{label = "Wplac pieniadze", value = 'deposit'}
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'boss_menu_cartelmoney', {
		title    = "Pieniadze Cayo Perico",
		align    = 'center',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'deposit' then
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'boss_menu_dialog', {
				title = "Ilosc"
			}, function(data2, menu2)
				local amount = tonumber(data2.value)
				ESX.TriggerServerCallback('cayo_perico:runAction', function(data)
					print(data)
					if data then
						ESX.UI.Menu.CloseAll()
						bossMenuOpen = false
						ESX.ShowNotification("Wplacono ~g~"..amount.."$ ~w~do kartelu")
					else
						ESX.UI.Menu.CloseAll()
						bossMenuOpen = false
					end
				end, {action = 'addmoney', amount = amount})
			end, function(data2, menu2)
				menu2.close()
				bossMenuOpen = false
			end)
		elseif data.current.value == 'withdraw' then
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'boss_menu_dialog', {
				title = "Ilosc"
			}, function(data2, menu2)
				local amount = tonumber(data2.value)
				ESX.TriggerServerCallback('cayo_perico:runAction', function(data)
					print(data)
					if data then
						ESX.UI.Menu.CloseAll()
						bossMenuOpen = false
						ESX.ShowNotification("Wyplacono ~g~"..amount.."$ ~w~z kartelu")
					else
						ESX.UI.Menu.CloseAll()
						bossMenuOpen = false
					end
				end, {action = 'removemoney', amount = amount})
			end, function(data2, menu2)
				menu2.close()
				bossMenuOpen = false
			end)		
		end
	end, function(data2, menu2)
		menu2.close()
		bossMenuOpen = false
	end)
end

function openGates()
	local pedCoords = GetEntityCoords(Player.Ped)
	for i,v in ipairs(Config.Gates) do
		local obj = GetClosestObjectOfType(pedCoords.x, pedCoords.y, pedCoords.z, 30.0, v.model, false, false, false)
		if IsEntityPositionFrozen(obj) then
			FreezeEntityPosition(obj, false)
		end
	end
end

local isGarageOpen = false

function Garage()

	local pedCoords = GetEntityCoords(Player.Ped)
	for i,v in ipairs(Config.VehiclesGarage) do
		local coords = v.coords
		local distance = nil
		if GetVehiclePedIsIn(Player.Ped, false) ~= 0 then
			distance = GetDistanceBetweenCoords(pedCoords, v.deleteCoords.x, v.deleteCoords.y, v.deleteCoords.z, false)
		else
			distance = GetDistanceBetweenCoords(pedCoords, coords.x, coords.y, coords.z, false)
		end
		if distance < 15 then
			if GetVehiclePedIsIn(Player.Ped, false) ~= 0 then
				DrawMarker(27, v.deleteCoords.x, v.deleteCoords.y, v.deleteCoords.z+0.3, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0, 2.5, 2.5, 1.0, 14, 216, 18, 0.8, false, true, 2, true, nil, nil, false)
			else
				DrawMarker(27, coords.x, coords.y, coords.z, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 14, 216, 18, 0.8, false, true, 2, true, nil, nil, false)
			end
			if distance < 2 then
				if GetVehiclePedIsIn(Player.Ped, false) ~= 0 then
					ESX.ShowHelpNotification("Kliknij ~INPUT_CONTEXT~, aby odlozyc pojazd")
					if IsControlJustPressed(0, Keys["E"]) then
						DeleteVehicle(GetVehiclePedIsIn(Player.Ped, false))
						SetEntityCoords(Player.Ped, coords.x, coords.y, coords.z, false, false, false, false)
					end
				else
					ESX.ShowHelpNotification("Kliknij ~INPUT_CONTEXT~, aby otworzyc garaz")
					if IsControlJustPressed(0, Keys["E"]) then
						isGarageOpen = true
						openGarage(v.spawnCoords, v.type)
					end
				end
			end
		end
	end

end


function openGarage(coords, type)
	local elements = {}
	if type == 'land' then
		elements = {
			{label = "Przewoz broni", value = 'Barracks'},
			{label = "Buggy", value = 'dune'},
			{label = "Mechanicy", value = 'flatbed'},
			{label = "Narko bus", value = 'burrito'},
			{label = "Patrol wyspy", value = 'winky'},
			{label = "SUV Pancerz", value = 'baller5'},
			{label = "Przewoz towaru wyspa", value = 'vetir'},
			{label = "Quad", value = 'verus'},
			{label = "Cross", value = 'manchez2'},
			{label = "Duzy przemyt", value = 'mule5'}
		}
	elseif type == 'port' then
		elements = {
			{label = "Skuter", value = 'seashark'}
		}
		if cayoConfig.boughtPonton then
			table.insert(elements, {label = "Ponton", value = 'dinghy'})
		end
	end
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'garazcayo', {
		title    = "Garaz",
		align    = 'center',
		elements = elements
	}, function(data, menu)
		ESX.Game.SpawnVehicle(data.current.value, coords, GetEntityHeading(Player.Ped), function(vehicle)
			TaskWarpPedIntoVehicle(Player.Ped, vehicle, -1)
			isGarageOpen = false
			menu.close()
		end)
	end, function(data2, menu2)
		isGarageOpen = false
		menu2.close()
	end)
end

function prom()
	local pedCoords = GetEntityCoords(Player.Ped)
	if cayoConfig.boughtProm then
		
	end
end

local isSchowekOpen = false

function Schowkii()
	local pedCoords = GetEntityCoords(Player.Ped)
	for k,v in pairs(Config.Schowki) do
		local distance = GetDistanceBetweenCoords(pedCoords, v.coords.x, v.coords.y, v.coords.z, false)
		if distance < 10 then
			DrawMarker(27, v.coords.x, v.coords.y, v.coords.z, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 14, 216, 18, 0.8, false, true, 2, true, nil, nil, false)
			if distance < 1.5 and not isSchowekOpen then
				ESX.ShowHelpNotification("Kliknij ~INPUT_CONTEXT~, aby otworzyc schowek")
				if IsControlJustPressed(0, Keys["E"]) then
					openSchowek(k)
				end
			elseif distance > 1.5 and isSchowekOpen then
				isSchowekOpen = false
				ESX.UI.Menu.CloseAll()
			end
		end
	end
end

function openSchowek(name)
	for k,v in pairs(Schowki) do
		if v.name == name then
			isSchowekOpen = true
			local elements = {
				{label = "Zdeponuj przedmiot", value = 'deposit'}
			}
			if Player.Job.grade >= 6 then
				table.insert(elements, {label = "Wyciagnij przedmiot", value = 'withdraw'})
			end
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'schowekcayo', {
				title    = "Schowek ["..name.."]",
				align    = 'center',
				elements = elements
			}, function(data, menu)
				if data.current.value == 'deposit' then
					ESX.TriggerServerCallback('cayo_perico:getInventoryPlayer', function(inv)
						local elements2 = {}
						for k,v in pairs(inv) do
							table.insert(elements2, {label = v.label.." x"..v.count, value = {item = v.name, itemname = v.label, count = v.count}})
						end
						ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'deposit_schowek_cayo', {
							title    = "Schowek depozyt",
							align    = 'center',
							elements = elements2
						}, function(data2, menu2)
							local item = data2.current.value
							ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'howmuch', {
								title = "Ile?"
							}, function(data3, menu3)
								menu2.close()
								local amount = tonumber(data3.value)

								if amount == nil then
									ESX.ShowNotification("Zla wartosc")
								else
									if item.count >= amount then
										TriggerServerEvent('cayo_perico:addToSchowek', name, {item = item.item, itemname = item.itemname, count = amount})
									else
										ESX.ShowNotification("Nie posiadasz tyle tego przedmiotu!")
									end
									menu3.close()
								end

							end, function(data3, menu3)
								menu3.close()
								isSchowekOpen = false
							end)
							menu2.close()
							isSchowekOpen = false
						end, function(data2, menu2)
							isSchowekOpen = false
							menu2.close()
						end)
					end)
				elseif data.current.value == 'withdraw' then
					local elements2 = {}
					for k2,v2 in pairs(v.contents) do
						table.insert(elements2, {label = v2.itemname.." x"..v2.count, value = v2})
					end
					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'withdraw_schowek_cayo', {
						title    = "Schowek wyciaganie",
						align    = 'center',
						elements = elements2
					}, function(data2, menu2)
							local item = data2.current.value
							ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'howmuch', {
								title = "Ile?"
							}, function(data3, menu3)
								menu2.close()
								local amount = tonumber(data3.value)

								if amount == nil then
									ESX.ShowNotification("Zla wartosc")
								else
									if item.count >= amount then
										TriggerServerEvent('cayo_perico:removeFromSchowek', name, {item = item.item, itemname = item.itemname, count = amount})
									else
										ESX.ShowNotification("Nie posiadasz tyle tego przedmiotu w schowku!")
									end
									menu3.close()
								end

							end, function(data3, menu3)
								menu3.close()
								isSchowekOpen = false
							end)
						menu2.close()
						isSchowekOpen = false
					end, function(data2, menu2)
						menu2.close()
						isSchowekOpen = false
					end)
				end
			end, function(data, menu)
				menu.close()
				isSchowekOpen = false
			end)
		end
	end
end

local isStatuePacking = false

function packingStatue()
	local pedCoords = GetEntityCoords(Player.Ped)
	local transformCoords = Config.StatuePacking.coords
	local distance = GetDistanceBetweenCoords(pedCoords, transformCoords.x, transformCoords.y, transformCoords.z, false)
	if distance < 10 then
		DrawMarker(27, transformCoords.x, transformCoords.y, transformCoords.z, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 14, 216, 18, 0.8, false, true, 2, true, nil, nil, false)
		if distance < 1.0 and not isStatuePacking then
			ESX.ShowHelpNotification("Kliknij ~INPUT_CONTEXT~, aby pakowac ~r~figurki")
			if IsControlJustPressed(0, Keys["E"]) then
				isStatuePacking = true
				startPackingStatue()
			end
		elseif distance < 1.0 and isStatuePacking then
			ESX.ShowHelpNotification("Kliknij ~INPUT_CONTEXT~, aby anulowac")
			if not IsEntityPlayingAnim(Player.Ped, 'mini@repair', 'fixing_a_ped', 3) then
				RequestAnimDict('mini@repair')
				TaskPlayAnim(Player.Ped, 'mini@repair', 'fixing_a_ped', 8.0, 3.0, -1, 0, 1, false, false, false)
			end
			if IsControlJustPressed(0, Keys["E"]) then
				isStatuePacking = false
			end
		end
	end
end

RegisterNetEvent('cayo_perico:turnOffStatue')
AddEventHandler('cayo_perico:turnOffStatue', function()
	isStatuePacking = false
	ClearPedTasksImmediately(Player.Ped)
	ESX.ShowNotification("Przerwano pakowanie z powodu braku ilosci figurek")
end)

function startPackingStatue()
	ESX.ShowNotification("Pakowanie figurek...")
	Citizen.CreateThread(function()
		while isStatuePacking do
			Citizen.Wait(10000)
			if isStatuePacking then
				TriggerServerEvent('cayo_perico:cocaineStatue')
			end
		end
	end)
end


local isTransforming = false

function transformCocaine()
	local pedCoords = GetEntityCoords(Player.Ped)
	local transformCoords = Config.CocaineTransform.coords
	local distance = GetDistanceBetweenCoords(pedCoords, transformCoords.x, transformCoords.y, transformCoords.z, false)
	if distance < 10 then
		DrawMarker(27, transformCoords.x, transformCoords.y, transformCoords.z, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 14, 216, 18, 0.8, false, true, 2, true, nil, nil, false)
		if distance < 1.0 and not isTransforming then
			ESX.ShowHelpNotification("Kliknij ~INPUT_CONTEXT~, aby przerobic ~g~liscie")
			if IsControlJustPressed(0, Keys["E"]) then
				isTransforming = true
				startTransformCocaine()
			end
		elseif distance < 1.0 and isTransforming then
			ESX.ShowHelpNotification("Kliknij ~INPUT_COVER~, aby anulowac")
			if not IsEntityPlayingAnim(Player.Ped, 'mini@repair', 'fixing_a_ped', 3) then
				RequestAnimDict('mini@repair')
				TaskPlayAnim(Player.Ped, 'mini@repair', 'fixing_a_ped', 8.0, 3.0, -1, 0, 1, false, false, false)
			end
			if IsControlJustReleased(0, Keys["Q"]) then
				isTransforming = false
			end
		end
		if distance > 1.5 and isTransforming then
			isTransforming = false
			ESX.ShowNotification("Przerwano transformacje z powodu dalekiego odejscia")
		end
	end
end

RegisterNetEvent('cayo_perico:turnOffTransform')
AddEventHandler('cayo_perico:turnOffTransform', function()
	isTransforming = false
	ClearPedTasksImmediately(Player.Ped)
	ESX.ShowNotification("Przerwano transformacje z powodu braku lisci")
end)

function startTransformCocaine()
	ESX.ShowNotification("Trwa transformacja liści w kokainę...")
	Citizen.CreateThread(function()
		while isTransforming do
			Citizen.Wait(15000)
			if isTransforming then
				TriggerServerEvent("cayo_perico:cocaineTransform")
			end
		end
	end)
end

local isGaining = false

local leavesGained = 0
local level = {false, false, false, false, false}
local keyRandomed = nil

local leavesCooldown = {}


function cocaineLeaves()
	local pedCoords = GetEntityCoords(Player.Ped)
	local obj = GetClosestObjectOfType(pedCoords.x, pedCoords.y, pedCoords.z, 10.0, Config.CocaineLeaves.model, false, false, false)
	if obj ~= 0 then
		local objCoords = GetEntityCoords(obj)
		local distance = GetDistanceBetweenCoords(pedCoords, objCoords, false)
		if distance < 1.5 and not isGaining and canGain(obj) then
			ESX.ShowHelpNotification("Kliknij ~INPUT_CONTEXT~, aby zbierac ~g~liscie koki")
			if IsControlJustPressed(0, Keys["E"]) then
				startGainingCocaineLeaves()
			end
		elseif isGaining then
			if keyRandomed ~= nil then
				if not IsEntityPlayingAnim(Player.Ped, 'mini@repair', 'fixing_a_player', 3) then
					RequestAnimDict('mini@repair')
					TaskPlayAnim(Player.Ped, 'mini@repair', 'fixing_a_player', 8.0, 3.0, -1, 0, 1, false, false, false)
				end
				ESX.ShowHelpNotification("Szybko kliknij przycisk ~g~["..keyRandomed.key.."]")
				if IsControlJustPressed(0, Keys[keyRandomed.key]) then
					leavesGained = leavesGained+1
					level[keyRandomed.id] = true
					keyRandomed = nil
					if checkAllLevels() then
						giveLeaves(obj)
					end
				end
			end
		elseif not canGain(obj) then
			ESX.ShowHelpNotification("Musisz odczekac chwile przed nastepnym zrywaniem!")
		end
	end
end

function canGain(obj)
	for i,v in ipairs(leavesCooldown) do
		if leavesCooldown[i].object == obj then
			return false
		end
	end
	return true
end

function checkAllLevels()
	for i,v in ipairs(level) do
		if level[i] == false then
			return false
		end
	end
	return true
end

function giveLeaves(obj)
	ESX.ShowNotification("Udalo ci sie zebrac ~g~"..leavesGained.." lisci")
	TriggerServerEvent("cayo_perico:gainLeaves", leavesGained)
	isGaining = false
	leavesGained = 0
	keyRandomed = nil
	level = {false, false, false, false, false}
	table.insert(leavesCooldown, {object = obj, cd = 60})
	TriggerServerEvent('cayo_perico:leavesCD', {object = obj, cd = 60})
end

RegisterNetEvent('cayo_perico:leavesCan')
AddEventHandler('cayo_perico:leavesCan', function(leaves)
	for i,v in ipairs(leavesCooldown) do
		if leavesCooldown[i].object == leaves then
			table.remove(leavesCooldown, leavesCooldown[i])
		end
	end
end)

function startGainingCocaineLeaves()
	isGaining = true
	local start = 1
	local keys = { 'E', 'Q', 'R' }
	Citizen.CreateThread(function()
		while isGaining do
			Citizen.Wait(10)
			if level[start] == false then
				keyRandomed = {key = keys[math.random(#keys)], id = start}
				Citizen.Wait(2000)
				if level[start] == false then
					ClearPedTasksImmediately(Player.Ped)
					giveLeaves()
				end
			end
			start = start+1
		end
	end)
end

function podrozProm(type)
	isTeleporting = true
	local entity = nil
	if GetVehiclePedIsIn(Player.Ped, false) ~= 0 then
		entity = GetVehiclePedIsIn(Player.Ped, false)
	else
		entity = Player.Ped
	end
	if type == 'cp' then
		DoScreenFadeOut(500)
		Citizen.Wait(1000)
		SetEntityCoords(entity, Config.Prom.CP.x, Config.Prom.CP.y, Config.Prom.CP.z, false, false, false, false)
		SetEntityHeading(entity, Config.Prom.CP.h)
		Citizen.Wait(2000)
		DoScreenFadeIn(1000)
		isTeleporting = false
	elseif type == 'sa' then
		DoScreenFadeOut(500)
		Citizen.Wait(1000)
		SetEntityCoords(entity, Config.Prom.SA.x, Config.Prom.SA.y, Config.Prom.SA.z, false, false, false, false)
		SetEntityHeading(entity, Config.Prom.SA.h)
		Citizen.Wait(2000)
		DoScreenFadeIn(1000)
		isTeleporting = false
	end
end

function prom()
	local pedCoords = GetEntityCoords(Player.Ped)
	local distance = GetDistanceBetweenCoords(pedCoords, Config.Prom.CP.x, Config.Prom.CP.y, Config.Prom.CP.z, true)
	if distance < 30 then
		DrawMarker(27, Config.Prom.CP.x, Config.Prom.CP.y, Config.Prom.CP.z, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0, 2.5, 2.5, 1.0, 14, 216, 18, 0.8, false, true, 2, true, nil, nil, false)
		if distance < 3 and not isTeleporting then
			ESX.ShowHelpNotification("Kliknij ~INPUT_CONTEXT~, aby rozpoczac podroz promem")
			if IsControlJustPressed(0, Keys["E"]) then
				podrozProm('sa')
			end
		end
	end
	local distance2 = GetDistanceBetweenCoords(pedCoords, Config.Prom.SA.x, Config.Prom.SA.y, Config.Prom.SA.z, true)
	if distance2 < 30 then
		DrawMarker(27, Config.Prom.SA.x, Config.Prom.SA.y, Config.Prom.SA.z, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0, 2.5, 2.5, 1.0, 14, 216, 18, 0.8, false, true, 2, true, nil, nil, false)
		if distance2 < 3 and not isTeleporting then
			ESX.ShowHelpNotification("Kliknij ~INPUT_CONTEXT~, aby rozpoczac podroz promem")
			if IsControlJustPressed(0, Keys["E"]) then
				podrozProm('cp')
			end
		end
	end
end

local isTeleporting = false

Citizen.CreateThread(function()
	print("Starting thread...")
	Citizen.Wait(3000)
	print("Job "..Player.Job.name)
	while true do
		Citizen.Wait(1)
		if Player.Job.name == 'org17' then
			if Player.Job.grade == 0 or Player.Job.grade >= 5 then
				cocaineLeaves()
			end
			if Player.Job.grade >= 5 then
				transformCocaine()
				packingStatue()
			end
			if Player.Job.grade >= 3 then
				Garage()
			end
			if Player.Job.grade >= 6 then
				bossMenuBlip()
			end
			Schowkii()
			openGates()
			if cayoConfig.boughtProm then
				prom()
			end
			local playerCoords = GetEntityCoords(Player.Ped)
			for k,v in pairs(Config.Teleports) do
				if isTeleporting then
					goto koniec
				end
				local enterPos = v.enter
				local exitPos = v.exit
				local enterDist = GetDistanceBetweenCoords(enterPos.x, enterPos.y, enterPos.z, playerCoords, true)
				local exitDist = GetDistanceBetweenCoords(exitPos.x, exitPos.y, exitPos.z, playerCoords, true)
				if enterDist < 10 then
					DrawMarker(21, enterPos.x, enterPos.y, enterPos.z, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 14, 216, 18, 0.8, true, true, 2, true, nil, nil, false)
					if enterDist < 1.5 then
						ESX.ShowHelpNotification("Kliknij ~INPUT_CONTEXT~, aby wejsc")
						if IsControlJustPressed(0, Keys["E"]) then
							isTeleporting = true
							DoScreenFadeOut(1000)
							Citizen.Wait(1000)
							local interior = GetInteriorAtCoords(exitPos.x, exitPos.y, exitPos.z)
							while IsInteriorDisabled(interior) do
								SetInteriorActive(interior, true)
								PinInteriorInMemory(interior)
								Citizen.Wait(500)
							end
							SetEntityCoords(Player.Ped, exitPos.x, exitPos.y, exitPos.z, false, false, false, false)
							Citizen.Wait(3000)
							DoScreenFadeIn(1000)
							isTeleporting = false
						end
					end
				end
				if exitDist < 10 then
					DrawMarker(21, exitPos.x, exitPos.y, exitPos.z, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 199, 18, 18, 0.8, true, true, 2, true, nil, nil, false)
					if exitDist < 1.5 then
						ESX.ShowHelpNotification("Kliknij ~INPUT_CONTEXT~, aby wyjsc")
						if IsControlJustPressed(0, Keys["E"]) then
							isTeleporting = true
							DoScreenFadeOut(1000)
							Citizen.Wait(1000)
							local interior = GetInteriorAtCoords(enterPos.x, enterPos.y, enterPos.z)
							while IsInteriorDisabled(interior) do
								SetInteriorActive(interior, true)
								PinInteriorInMemory(interior)
								Citizen.Wait(500)
							end
							SetEntityCoords(Player.Ped, enterPos.x, enterPos.y, enterPos.z, false, false, false, false)
							Citizen.Wait(3000)
							DoScreenFadeIn(1000)
							isTeleporting = false
						end
					end
				end
				::koniec::
			end
		end
	end
end)