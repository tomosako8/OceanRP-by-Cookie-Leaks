ESX = nil

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

RegisterNetEvent("exile_legalwiniarz:getrequest")
TriggerServerEvent("exile_legalwiniarz:request")
AddEventHandler("exile_legalwiniarz:getrequest", function(a, b, c)
	_G.donttouch = a
	_G.exile_krawic = b
	_G.exile_krawi2 = c

	local donttouchme = _G.donttouch
	local exile_legalwiniarz = _G.exile_krawic
	local exile_legalwiniarz2 = _G.exile_krawi2

local PlayerData, pCoords, CafeBlips, CanWork, alreadyOut = {}, nil, {}, false, false
local CurrentAction				= nil
local HasAlreadyEnteredMarker	= false
local LastZone					= nil
local CurrentActionMsg			= ''
local CurrentActionData			= {}
local inAction = false
local cooldown = false
local blokada = false

local Cfg = {
	CollectSeeds = {
		{
			coords = vector3(-1686.4, 2348.52, 54.05),
		},
	},
	TransferingSeeds = {
		{
			coords = vector3(-1933.763, 2038.848, 139.8388),
		},
	},
	Garage = {
		{
			coords = vector3(-1922.122, 2040.434, 139.7447)
		},
		{
			coords = vector3(-1679.422, 2356.699, 50.62415)
		},
	},
	BossActions = {
		{
			coords = vector3(-1928.708, 2060.148, 139.8467)
		},
	},
	Cloakroom = {
		{
			coords = vector3(-1937.036, 2051.218, 139.8416)
		},
		{
			coords = vector3(-1674.851, 2354.505, 50.88343)
		},
	},
	Clothes = {
		Male = {
			['tshirt_1'] = 15, ['tshirt_2'] = 0,--TSHIRT
			['torso_1'] = 241,   ['torso_2'] = 5,
            ['decals_1'] = 19,   ['decals_2'] = 0,
            ['arms'] = 41,
            ['pants_1'] = 90,   ['pants_2'] = 0,
            ['shoes_1'] = 51,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['mask_1'] = 0,   ['mask_2'] = 0,
            ['bags_1'] =  173,  ['bags_2'] = 0
		},
		Female = {
			['tshirt_1'] = 6, ['tshirt_2'] = 0,--TSHIRT
			['torso_1'] = 358, ['torso_2'] = 3, --TUŁÓW
			['arms'] = 4, --RAMIONA
			['pants_1'] = 93, ['pants_2'] = 0, --SPODNIE
			['shoes_1'] = 27, ['shoes_2'] = 0, --BUTY
			['helmet_1'] = -1, ['helmet_2'] = 0, --CZAPKA_TUTAJ_-1_OZNACZA_BRAK_CZAPKI
			['chain_1'] = 0, ['chain_2'] = 0, --ŁAŃCUCH
			['mask_1'] = 0, ['mask_2'] = 0, --MASKA
			['bags_1'] = 0, ['bags_2'] = 0 --TORBA
        },
	},
}

local Blips = {
	{title="#1 Szatnia", colour=2, id=143, see = true, coords = vector3(-1937.036, 2051.218, 139.8416)},
	{title="#2 Zbieranie Winogron", colour=2, id=143, see = true, coords = vector3(-1686.4, 2348.52, 54.05)},
	{title="#3 Przeróbka Winogron", colour=2, id=143, see = true, coords = vector3(-1933.763, 2038.848, 139.8388)}
}

CreateThread(function()
	while ESX == nil do
		TriggerEvent('exilerp:getSharedObject', function(obj) 
			ESX = obj 
		end)
		
		Citizen.Wait(250)
	end
	
	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
	refreshBlips()
end)


CreateThread(function()
	while PlayerData.secondjob == nil do
		Citizen.Wait(100)
	end
	while true do
		if PlayerData.secondjob.name == 'winiarz' then
			local playerPed = PlayerPedId()
			pCoords = GetEntityCoords(playerPed)
		else
			local playerPed = PlayerPedId()
			tCoords = GetEntityCoords(playerPed)
		end
		Citizen.Wait(500)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	refreshBlips()
end)

RegisterNetEvent('esx:setSecondJob')
AddEventHandler('esx:setSecondJob', function(secondjob)
	PlayerData.secondjob = secondjob
	CanWork = false
	deleteBlip()
	refreshBlips()
end)

refreshBlips = function()
	if PlayerData.secondjob ~= nil and PlayerData.secondjob.name == 'winiarz' then
		for i=1, #Blips, 1 do
			if Blips[i].see then
				local blip = AddBlipForCoord(Blips[i].coords)
				SetBlipSprite(blip, Blips[i].id)
				SetBlipDisplay(blip, 4)
				SetBlipScale(blip, 0.9)
				SetBlipColour(blip, Blips[i].colour)
				SetBlipAsShortRange(blip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(Blips[i].title)
				EndTextCommandSetBlipName(blip)

				table.insert(CafeBlips, blip)
			end
		end
	end
end

deleteBlip = function()
	if CafeBlips[1] ~= nil then
		for i=1, #CafeBlips, 1 do
			RemoveBlip(CafeBlips[i])
			CafeBlips[i] = nil
		end
	end
end

CreateThread(function()
	while PlayerData.secondjob == nil do
		Citizen.Wait(1000)
	end
	while true do
		Citizen.Wait(1)
		if PlayerData.secondjob ~= nil and PlayerData.secondjob.name == 'winiarz' then
			local found = false
			local isInMarker	= false
			local currentZone	= nil
			local zoneNumber 	= nil
			for k,v in pairs(Cfg) do
				for i=1, #v, 1 do
					if CanWork or (k == 'Cloakroom' or k == 'BossActions' and PlayerData.secondjob.grade >= 7) then
						if k == 'CollectSeeds' or k == 'Garage' or k == 'TransferingSeeds' then
							if #(pCoords - v[i].coords) < 15.0 then
								found = true
								ESX.DrawBigMarker(vec3(v[i].coords.x, v[i].coords.y, v[i].coords.z))
							end
						else
							if #(pCoords - v[i].coords) < 15.0 then
								found = true
								ESX.DrawMarker(vec3(v[i].coords.x, v[i].coords.y, v[i].coords.z))
							end
						end

						if k == 'Cloakroom' or k == 'BossActions' then
							if #(pCoords - v[i].coords) < 1.5 then
								isInMarker	= true
								currentZone = k
								zoneNumber = i
							end
						elseif k == 'CollectSeeds' then
							if #(pCoords - v[i].coords) < 5.0 then
								isInMarker	= true
								currentZone = k
								zoneNumber = i
							end
						else
							if #(pCoords - v[i].coords) < 2.0 then
								isInMarker	= true
								currentZone = k
								zoneNumber = i
							end
						end
						
					end
				end
			end

			if isInMarker and not hasAlreadyEnteredMarker then
				hasAlreadyEnteredMarker = true
				lastZone				= currentZone
				TriggerEvent('exile_legalwiniarz:hasEnteredMarker', currentZone, zoneNumber)
			end
	
			if not isInMarker and hasAlreadyEnteredMarker then
				hasAlreadyEnteredMarker = false
				TriggerEvent('exile_legalwiniarz:hasExitedMarker', lastZone)
			end

			if isInMarker and inAction then
				TriggerEvent('exile_legalwiniarz:hasEnteredMarker', 'exitMarker')
			end

			if not found then
				Citizen.Wait(2000)
			end
		else
			Citizen.Wait(2000)
		end
	end
end)

CreateThread(function()
	while true do
		Citizen.Wait(10)
		if PlayerData.secondjob and PlayerData.secondjob.name == 'winiarz' then
			if CurrentAction ~= nil and not cooldown then
				ESX.ShowHelpNotification(CurrentActionMsg)
				if IsControlJustReleased(0, 38) then
					if CurrentAction == 'collect' then
						StartCollect()
						inAction = true
					elseif CurrentAction == 'transfering' then
						TransferingSeeds()
					elseif CurrentAction == 'boss_actions' then
						OpenBossMenu()
					elseif CurrentAction == 'garage' then
						CarOut()
					elseif CurrentAction == 'cloakroom' then
						OpenCloakroom()
					elseif CurrentAction == 'exit' then
						inAction = false
						FreezeEntityPosition(PlayerPedId(), false)
						ClearPedTasks(PlayerPedId())
					else
						inAction = false
					end
					CurrentAction = nil
				end
			end
			if IsControlJustReleased(0, 167) and IsInputDisabled(0) and PlayerData.secondjob.grade >= 7 then
				OpenMobilewiniarzActionsMenu()
			end
		else
			Citizen.Wait(2000)
		end
	end
end)

CreateThread(function()
    while true do
        Citizen.Wait(0)
        if blokada then
            DisableControlAction(2, 24, true)
			DisableControlAction(2, 18, true)
            DisableControlAction(2, 257, true)
            DisableControlAction(2, 25, true)
            DisableControlAction(2, 263, true)
            DisableControlAction(2, Keys['TOP'], true)
            DisableControlAction(2, Keys['X'], true)
            DisableControlAction(2, Keys['PAGEDOWN'], true)
            DisableControlAction(2, Keys['B'], true)
            DisableControlAction(2, Keys['TAB'], true)
            DisableControlAction(2, Keys['F1'], true)
            DisableControlAction(2, Keys['F2'], true)
            DisableControlAction(2, Keys['F3'], true)
			DisableControlAction(2, Keys['G'], true)
			DisableControlAction(2, Keys['~'], true)
			DisableControlAction(2, Keys['['], true)
			DisableControlAction(2, Keys[']'], true)
			DisableControlAction(2, Keys['X'], true)
            DisableControlAction(2, 59, true)
            DisableControlAction(0, 47, true)
            DisableControlAction(0, 264, true)
            DisableControlAction(0, 257, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)
            DisableControlAction(0, 143, true)
		else
			Citizen.Wait(500)
        end
    end
end)

playanim = function(lib, anim, time)
	RequestAnimDict(lib)
	while not HasAnimDictLoaded(lib) do
		Citizen.Wait(10)
	end
	TaskPlayAnim(PlayerPedId(), lib, anim, 3.0, 3.0, time, 1, 0, false, false, false)
end

StartCollect = function()
	local playerPed = PlayerPedId()
	TriggerServerEvent('exile_legalwiniarz:collect', 'pear')
	ClearPedTasks(playerPed)
	FreezeEntityPosition(playerPed, true)
	blokada = true
	playanim("anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 600000)
end

TransferingSeeds = function()
	ESX.UI.Menu.CloseAll()
	local inventory = ESX.GetPlayerData().inventory
	local count = 0
	for i=1, #inventory, 1 do
		if inventory[i].name == 'pear' then
			count = inventory[i].count
		end
	end

	if count >= 100 then
		ESX.ShowNotification('~y~Trwa przygotowywanie Winogron...')
		DisableControlAction(0, 289, true) -- F2
		FreezeEntityPosition(PlayerPedId(), true)
		playanim("anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 600000)
		blokada = true
			exports['OceanRP']:DrawProcent(600, function()
				Citizen.InvokeNative(0xAAA34F8A7CB32098, PlayerPedId())
				TriggerServerEvent(exile_legalwiniarz2, count, donttouchme)
				FreezeEntityPosition(PlayerPedId(), false)
				DisableControlAction(0, 289, false) -- F2
				ClearPedTasks(PlayerPedId())
		end)
	else
		ESX.ShowNotification('~r~Potrzebujesz 100 ciasta aby rozpocząć przerabianie!')
	end
end

CarOut = function()
	local player = PlayerPedId()
	if IsPedInAnyVehicle(player, false) then
		local carCafe = GetVehiclePedIsIn(player, false)
		if IsVehicleModel(carCafe, GetHashKey("kalahari")) then
			ESX.Game.DeleteVehicle(carCafe)
			alreadyOut = false
		else
			ESX.ShowNotifcation('~r~Możesz zwrócić tylko auto firmowe!')
		end
	else
		if ESX.Game.IsSpawnPointClear(GetEntityCoords(PlayerPedId()), 7) then
			ESX.Game.SpawnVehicle('kalahari', GetEntityCoords(PlayerPedId()), 227.04, function(vehicle)
				platenum = math.random(10, 99)
				SetVehicleNumberPlateText(vehicle, "WINI"..platenum)
				TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
				TriggerServerEvent('exile_legalwiniarz:insertPlayer', GetVehicleNumberPlateText(vehicle))
			end)
			alreadyOut = true
		else
			ESX.ShowNotification('~r~Miejsce parkingowe jest już zajęte przez inny pojazd!')
		end
	end
end

OpenCloakroom = function()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom',
	{
		title    = 'Przebieralnia',
		align = 'center',
		elements = {
			{label = 'Ubrania robocze',     value = 'secondjob_wear'},
			{label = 'Ubrania prywatne', value = 'citizen_wear'}
		}
	}, function(data, menu)
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
			if data.current.value == 'citizen_wear' then
				CanWork = false
				ESX.ShowNotification('~g~Założono ubrania cywilne')
				TriggerEvent('skinchanger:loadSkin', skin)
			elseif data.current.value == 'secondjob_wear' then
				CanWork = true
				ESX.ShowNotification('~g~Założono ubrania robocze')
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, Cfg.Clothes.Male)
				else
					TriggerEvent('skinchanger:loadClothes', skin, Cfg.Clothes.Female)
				end
			end
		end)

		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end

OpenBossMenu = function()
	local elements = {
		{label = "Akcje szefa", value = '1'},
    }
    if PlayerData.secondjob.grade >= 7 then
		table.insert(elements, {label = "Zarządzanie frakcją", value = '4'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'winiarz_boss', {
		title    = "Praca Legalna",
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)

		if data.current.value == '1' then
			if PlayerData.secondjob.grade == 7 then
				TriggerEvent('esx_society:openSecondBossMenu', 'winiarz', function(data, menu)
					menu.close()
				end, { showmoney = false, withdraw = false, deposit = true, wash = false, employees = true})
			elseif PlayerData.secondjob.grade >= 8 then
				TriggerEvent('esx_society:openSecondBossMenu', 'winiarz', function(data, menu)
					menu.close()
				end, { showmoney = true, withdraw = true, deposit = true, wash = false, employees = true})
			else
				TriggerEvent('esx_society:openSecondBossMenu', 'winiarz', function(data, menu)
					menu.close()
				end, { showmoney = false, withdraw = false, deposit = true, wash = false, employees = false})
            end
        elseif data.current.value == '2' then
			menu.close()
			ESX.TriggerServerCallback('ExileRP:getCourses', function(kursy)
				if kursy then
					local elements = {
						head = {'Imię i nazwisko', 'Liczba kursów', 'Stopień'},
						rows = {}
					}
					for i=1, #kursy, 1 do
						if kursy[i].secondjob_grade == 0 then
							grade = 'Okres Próbny'
						elseif kursy[i].secondjob_grade == 1 then
							grade = 'Rekrut'
						elseif kursy[i].secondjob_grade == 2 then
							grade = 'Pracownik'
						elseif kursy[i].secondjob_grade == 3 then
							grade = 'Stażysta'
						elseif kursy[i].secondjob_grade == 4 then
							grade = 'Zawodowiec'
						elseif kursy[i].secondjob_grade == 5 then
							grade = 'Specjalista'
						elseif kursy[i].secondjob_grade == 6 then
							grade = 'Koordynator'
						elseif kursy[i].secondjob_grade == 7 then
							grade = 'Manager'
						elseif kursy[i].secondjob_grade == 8 then
							grade = 'Zastępca'
						elseif kursy[i].secondjob_grade == 9 then
							grade = 'Szef'
						end
						local name = kursy[i].firstname .. ' ' ..kursy[i].lastname
						table.insert(elements.rows, {
							data = kursy[i],
							cols = {
								name, 
								kursy[i].courses_count, 
								grade
							}
						})
						ESX.UI.Menu.Open('list', GetCurrentResourceName(), 'winiarz_courses', elements, function(data, menu)
						end, function(data, menu)
							menu.close()
						end)
                    end
                else
                    ESX.ShowNotification("~r~Lista kursów jest pusta!")
				end
			end, 'winiarz')
		elseif data.current.value == '4' then
			menu.close()
			exports['ocean_legaljobs']:OpenLicensesMenu(PlayerData.secondjob.name)
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'boss_actions'
		CurrentActionMsg  = "Naciśnij ~INPUT_CONTEXT~, aby wejść do menu"
		CurrentActionData = {}
	end)
end

RegisterNetEvent('exile_legalwiniarz:Cancel')
AddEventHandler('exile_legalwiniarz:Cancel', function()
	local playerPed = PlayerPedId()
	FreezeEntityPosition(playerPed, false)
	ClearPedTasks(playerPed)
	blokada = false
end)

AddEventHandler('exile_legalwiniarz:hasEnteredMarker', function(zone, number)

	if zone == 'exitMarker' then
		CurrentAction     = 'exit'
		CurrentActionMsg  = 'Naciśnij ~INPUT_CONTEXT~ aby przerwać ~g~czynność~s~'
		CurrentActionData = {}
	end

	if zone == 'CollectSeeds' then
		CurrentAction		= 'collect'
		CurrentActionMsg	= "Naciśnij ~INPUT_CONTEXT~, aby zebrać ~g~winogrona"
		CurrentActionData	= {}
	end

	if zone == 'Cloakroom' then
		CurrentAction		= 'cloakroom'
		CurrentActionMsg	= "Naciśnij ~INPUT_CONTEXT~, aby otworzyć ~g~szatnię"
		CurrentActionData	= {}
	end

	if zone == 'TransferingSeeds' then
		CurrentAction		= 'transfering'
		CurrentActionMsg	= "Naciśnij ~INPUT_CONTEXT~, aby przerobić ~g~winogrona"
		CurrentActionData	= {}
	end

	if zone == 'Garage' then
		if IsPedInAnyVehicle(PlayerPedId(), false) then
			msg = "Naciśnij ~INPUT_CONTEXT~, aby schować ~g~pojazd"
		else
			msg = "Naciśnij ~INPUT_CONTEXT~, aby wyciągnąć ~g~pojazd"
		end
		CurrentAction		= 'garage'
		CurrentActionMsg	= msg
		CurrentActionData	= {}
	end

	if zone == 'BossActions' then
		CurrentAction		= 'boss_actions'
		CurrentActionMsg	= "Naciśnij ~INPUT_CONTEXT~ aby otworzyć ~g~menu zarządzania"
		CurrentActionData	= {}
	end
end)

AddEventHandler('exile_legalwiniarz:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	TriggerServerEvent('exile_legalwiniarz:stopPickup', zone)

	CurrentAction = nil
	blokada = false
	cooldown = true
	if zone == 'CollectSeeds' then
		Citizen.Wait(90000)
		cooldown = false
	else
		Citizen.Wait(2000)
		cooldown = false
	end
end)

OpenMobilewiniarzActionsMenu = function()
	while PlayerData == nil do
		Wait(200)
	end
	ESX.UI.Menu.CloseAll()
	local elements = {}
	local playerPed = PlayerPedId()
	local vehicle   = GetVehiclePedIsIn(playerPed, false)
	if IsVehicleModel(vehicle, GetHashKey("kalahari")) then
		if IsPedInAnyVehicle(playerPed, false) and GetPedInVehicleSeat(vehicle, -1) == playerPed then
			ESX.TriggerServerCallback('exile_legalwiniarz:checkSiedzacy', function(siedzi)
				if siedzi then
					local plate =  GetVehicleNumberPlateText(vehicle)
					for i=1, #siedzi, 1 do
						if siedzi[i].plate == plate then
							table.insert(elements, {label = siedzi[i].label, value = siedzi[i].plate})	
						end
					end
					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'lastdriver_'..PlayerData.secondjob.name, {
						title    = "Lista kierowców ["..plate..']',
						align    = 'bottom-right',
						elements = elements
					}, function(data, menu)
					end, function(data, menu)
						menu.close()
					end)
				end
			end)
		else
			ESX.ShowNotification("~r~Musisz znajdować się w pojeździe jako kierwoca!")
		end
	end
end
end)