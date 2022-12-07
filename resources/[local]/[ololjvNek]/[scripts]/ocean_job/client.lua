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
local PlayerData = nil
local blipLoaded = {}

Citizen.CreateThread(function()
	while PlayerData == nil do
		PlayerData = ESX.GetPlayerData()
		Wait(300)
	end
	print("Loaded Player "..PlayerData.secondjob.name)
	Player.Ped = GetPlayerPed(-1)
	Player.Job = PlayerData.secondjob
	Player.IsCollecting = false
	Player.IsTransforming = false
	Player.IsMission = false
	Player.MissionStatus = 'nomission'
	Player.AntiSpam = {Collecting = -1, Transforming = -1}
	loadThread()
end)

function loadBlips()
	for k,v in pairs(Config.Blips) do
		local newBlip = v
		local blip = AddBlipForCoord(newBlip.coords.x, newBlip.coords.y, newBlip.coords.z)
		SetBlipSprite(blip, newBlip.blipDisplay)
		SetBlipDisplay(blip, 4)
		SetBlipScale(blip, 0.9)
		SetBlipColour(blip, newBlip.colour)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(newBlip.name)
		EndTextCommandSetBlipName(blip)
		table.insert(blipLoaded, {id = blip})
	end
end

RegisterNetEvent('esx:setSecondJob')
AddEventHandler('esx:setSecondJob', function(job)
	Player.Job = job
	if Player.Job.name == Config.jobName then
		loadThread()
	end
end)

RegisterNetEvent(GetCurrentResourceName()..':set')
AddEventHandler(GetCurrentResourceName()..':set', function(what, to)
	if what == 'collecting' then
		Player.IsCollecting = to
	elseif what == 'transforming' then
		Player.IsTransforming = to
		Player.MissionStatus.missionData.transformed = true
	end
end)

function isPlayerDoingSomething()
	if Player.IsCollecting then
		return true
	elseif Player.IsTransforming then
		return true
	end
end

function startAnim(anim, dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(200)
	end
	TaskPlayAnim(Player.Ped, dict, anim, 8.0, 3.0, -1, 0, 1, false, false, false)
end

function runCollecting(pos)
	if Player.AntiSpam.Collecting ~= -1 then
		if GetGameTimer() < Player.AntiSpam.Collecting then
			ESX.ShowNotification("Nie tak szybko kolego")
			return
		else
			Player.AntiSpam.Collecting = -1
		end
	end
	startAnim(Config.Animations.Collecting.anim, Config.Animations.Collecting.dict)
	local coll = pos.collectItem
	Citizen.CreateThread(function()
		while Player.IsCollecting do

			Citizen.Wait(Config.CollectTime*1000)
			local playerPos = GetEntityCoords(Player.Ped)
			local distance = GetDistanceBetweenCoords(playerPos, pos.x, pos.y, pos.z, true)
			if distance > 1.5 then
				Player.IsCollecting = false
				return
			end
			TriggerServerEvent(GetCurrentResourceName()..':collect', coll.item, coll.amount)
			startAnim(Config.Animations.Collecting.anim, Config.Animations.Collecting.dict)
		end
	end)
end

function runTransforming(coll)
	startAnim(Config.Animations.Transforming.anim, Config.Animations.Transforming.dict)
	Citizen.CreateThread(function()
		while Player.IsTransforming do
			Citizen.Wait(Config.TransformTime*1000)
			TriggerServerEvent(GetCurrentResourceName()..':transform', coll.item, coll.amount, coll.needItems)
			startAnim(Config.Animations.Transforming.anim, Config.Animations.Transforming.dict)
		end
	end)
end

function loadThread()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(1)
			local playerPos = GetEntityCoords(Player.Ped)
			while Player.Job == nil do
				Player.Job = ESX.GetPlayerData().secondjob
				Citizen.Wait(300)
			end
			if Player.Job.name == Config.jobName then
				if #blipLoaded < #Config.Blips then
					loadBlips()
					Citizen.Wait(500)
				end
				for i,v in ipairs(Config.Collect) do
					local pos = v
					local distance = GetDistanceBetweenCoords(playerPos, pos.x, pos.y, pos.z, true)
					if distance < Config.DistanceToShow then
						DrawMarker(Config.Marker.ID, pos.x, pos.y, pos.z, Config.Marker.sizeX, Config.Marker.sizeY, Config.Marker.sizeZ, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 14, 216, 18, 0.8, false, true, 2, true, nil, nil, false)
						if distance < 1.5 and not Player.IsCollecting then
							ESX.ShowHelpNotification(Config.Messages.CollectHelp)
							if IsControlJustPressed(0, Keys["E"]) then
								Player.IsCollecting = true
								runCollecting(pos)
								ESX.ShowNotification("Zbieranie")
								Player.AntiSpam.Collecting = GetGameTimer()+5000
							end
						elseif distance < 1.5 and Player.IsCollecting then
							ESX.ShowHelpNotification(Config.Messages.CollectCancel)
							if IsControlJustPressed(0, Keys["E"]) then
								Player.IsCollecting = false
								ClearPedTasksImmediately(Player.Ped)
								Player.AntiSpam.Collecting = GetGameTimer()+5000
							end
						end
					end
				end
				for i,v in ipairs(Config.Transform) do
					local pos = v
					local distance = GetDistanceBetweenCoords(playerPos, pos.x, pos.y, pos.z, true)
					if distance < Config.DistanceToShow then
						DrawMarker(Config.Marker.ID, pos.x, pos.y, pos.z, Config.Marker.sizeX, Config.Marker.sizeY, Config.Marker.sizeZ, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 14, 216, 18, 0.8, false, true, 2, true, nil, nil, false)
						if distance < 1.5 and not Player.IsTransforming then
							ESX.ShowHelpNotification(Config.Messages.TransformHelp)
							if IsControlJustPressed(0, Keys["E"]) then
								Player.IsTransforming = true
								runTransforming({item = Config.MainItem, amount = 1, needItems = Config.TransformItems})
							end
						elseif distance < 1.5 and Player.IsTransforming then
							ESX.ShowHelpNotification(Config.Messages.TransformCancel)
							if IsControlJustPressed(0, Keys["E"]) then
								Player.IsTransforming = false
								ClearPedTasksImmediately(Player.Ped)
							end
						end
					end
				end
				if Config.Mission.Enabled then
					local startPos = Config.Mission.StartPos
					local distance = GetDistanceBetweenCoords(playerPos, startPos.x, startPos.y, startPos.z, true)
					if distance < Config.DistanceToShow then
						DrawMarker(Config.Marker.ID, startPos.x, startPos.y, startPos.z, Config.Marker.sizeX, Config.Marker.sizeY, Config.Marker.sizeZ, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 14, 216, 18, 0.8, false, true, 2, true, nil, nil, false)
						if distance < 1.5 and not Player.IsMission then
							ESX.ShowHelpNotification(Config.Messages.MissionHelp)
							if IsControlJustPressed(0, Keys["E"]) then
								runMission()
							end
						end
					end
				end
				if Config.Boss.SellEnabled then
					local startPos = Config.Boss.SellCoords
					local distance = GetDistanceBetweenCoords(playerPos, startPos.x, startPos.y, startPos.z, true)
					if distance < Config.DistanceToShow then
						DrawMarker(Config.Marker.ID, startPos.x, startPos.y, startPos.z, Config.Marker.sizeX, Config.Marker.sizeY, Config.Marker.sizeZ, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 14, 216, 18, 0.8, false, true, 2, true, nil, nil, false)
						if distance < 1.5 then
							ESX.ShowHelpNotification(Config.Messages.SellingHelp)
							if IsControlJustPressed(0, Keys["E"]) then
								TriggerServerEvent(GetCurrentResourceName()..':sell', Config.MainItem)
							end
						end
					end
				end
				if Config.Boss.MenuEnabled then
					local startPos = Config.Boss.Menu
					local distance = GetDistanceBetweenCoords(playerPos, startPos.x, startPos.y, startPos.z, true)
					if distance < Config.DistanceToShow then
						DrawMarker(Config.Marker.ID, startPos.x, startPos.y, startPos.z, Config.Marker.sizeX, Config.Marker.sizeY, Config.Marker.sizeZ, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 14, 216, 18, 0.8, false, true, 2, true, nil, nil, false)
						if distance < 1.5 then
							ESX.ShowHelpNotification(Config.Messages.BossMenu)
							if IsControlJustPressed(0, Keys["E"]) then
								OpenBossMenu()
							end
						end
					end
				end
				if Config.Boss.MenuEnabled then
					local startPos = Config.ClothesCoords
					local distance = GetDistanceBetweenCoords(playerPos, startPos.x, startPos.y, startPos.z, true)
					if distance < Config.DistanceToShow then
						DrawMarker(Config.Marker.ID, startPos.x, startPos.y, startPos.z, Config.Marker.sizeX, Config.Marker.sizeY, Config.Marker.sizeZ, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 14, 216, 18, 0.8, false, true, 2, true, nil, nil, false)
						if distance < 1.5 then
							ESX.ShowHelpNotification(Config.Messages.ClothesHelp)
							if IsControlJustPressed(0, Keys["E"]) then
								OpenShelfMenu()
							end
						end
					end
				end
				if Config.VehicleGarage.Enabled then
					for k,v in pairs(Config.VehicleGarage.Coords) do
						local garageData = v
						local distance = GetDistanceBetweenCoords(playerPos, garageData.xMarker, garageData.yMarker, garageData.zMarker, true)
						if distance < Config.DistanceToShow then
							DrawMarker(Config.Marker.ID, garageData.xMarker, garageData.yMarker, garageData.zMarker, Config.Marker.sizeX, Config.Marker.sizeY, Config.Marker.sizeZ, 0.0, 0.0, 0.0, 3.0, 3.0, 1.0, 14, 216, 18, 0.8, false, true, 2, true, nil, nil, false)
							if distance < 3.0 then
								if k == 'spawn' then
									ESX.ShowHelpNotification(Config.Messages.VehicleGarage)
									if IsControlJustPressed(0, Keys["E"]) then
										OpenVehicleGarage({x = garageData.xSpawn, y = garageData.ySpawn, z = garageData.zSpawn})
									end
								elseif k == 'back' then
									ESX.ShowHelpNotification(Config.Messages.VehicleDeposit)
									if IsControlJustPressed(0, Keys["E"]) then
										DeleteEntity(GetVehiclePedIsIn(Player.Ped, false))
									end
								end
							end
						end
					end
				end
			end
		end
	end)
end

local missionPos = nil
local missionNumber = 0

local function nextMission()
	missionNumber = missionNumber+1
	if Config.Mission.MissionList[missionNumber] == nil and Player.MissionStatus ~= 'nomission' then
		Player.IsMission = false
		Player.MissionStatus = 'nomission'
		ESX.ShowNotification(Config.Messages.MissionEnd)
		TriggerServerEvent(GetCurrentResourceName()..":endedMission", (missionNumber-1))
		return
	end
	Player.MissionStatus = Config.Mission.MissionList[missionNumber]
	if Player.MissionStatus.missionType == 'driveToPoint' then
		missionPos = Player.MissionStatus.missionData.point
		SetNewWaypoint(missionPos.x, missionPos.y)
	elseif Player.MissionStatus.missionType == 'transformItem' then
		Player.MissionStatus.missionData.transformed = false
	elseif Player.MissionStatus.missionType == 'getInCar' then
		Player.MissionStatus.missionData.inCar = false
	end
end

function runMission()
	Player.IsMission = true
	if Player.MissionStatus == 'nomission' then
		nextMission()
	end
	Citizen.CreateThread(function()
		while Player.IsMission do
			Citizen.Wait(10)
			local playerPos = GetEntityCoords(Player.Ped)
			if Player.MissionStatus.missionType == 'driveToPoint' then
				local distance = GetDistanceBetweenCoords(playerPos, missionPos.x, missionPos.y, missionPos.z, true)
				ESX.ShowHelpNotification(Player.MissionStatus.missionData.text)
				if distance < 5.0 then
					nextMission()
				end
			elseif Player.MissionStatus.missionType == 'collectItem' then
				Citizen.Wait(3000)
				ESX.TriggerServerCallback(GetCurrentResourceName()..':getInventory', function(item)
					if item and item.count >= Player.MissionStatus.missionData.amount then
						nextMission()
					end
				end, Player.MissionStatus.missionData.item)
			elseif Player.MissionStatus.missionType == 'transformItem' then
				if not IsTransforming then
					ESX.ShowHelpNotification(Player.MissionStatus.missionData.text)
				end
				if Player.MissionStatus.missionData.transformed then
					nextMission()
					Player.MissionStatus.missionData.transformed = false
				end
			elseif Player.MissionStatus.missionType == 'getInCar' then
				if not Player.MissionStatus.missionData.inCar then
					ESX.ShowHelpNotification(Player.MissionStatus.missionData.text)
					local vehicle = GetVehiclePedIsIn(Player.Ped, false)
					if vehicle ~= 0 and IsVehicleModel(vehicle, GetHashKey(Player.MissionStatus.missionData.vehicleToGet)) then
						Player.MissionStatus.missionData.inCar = true
					end
				else
					nextMission()
				end
			elseif Player.MissionStatus.missionType == 'getClothes' then
				if not Player.MissionStatus.missionData.isClothed then
					ESX.ShowHelpNotification(Player.MissionStatus.missionData.text)
				else
					nextMission()
				end
			end
			if Player.MissionStatus.missionType == 'collectItem' then
				ESX.ShowHelpNotification(Player.MissionStatus.missionData.text)
			end
		end
	end)
end

OpenVehicleGarage = function(spawnLocation)
	local elements = {}

	for k,v in pairs(Config.VehicleGarage.Models) do
		table.insert(elements, {label = v.name, value = v.model})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'garage', {
		title = "Garaz",
		align = 'center',
		elements = elements
	}, function(data, menu)
		ESX.Game.SpawnVehicle(data.current.value, spawnLocation, 90.0, function(vehicle)
			TaskWarpPedIntoVehicle(Player.Ped, vehicle, -1)
		end)
		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end

OpenShelfMenu = function()
	local elements = {
		{label = "Przebierz sie", value = 'clothes'},
		{label = "Zaloz stroj cywilny", value = 'cywil'}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'szafka', {
		title = "Szafka",
		align = 'center',
		elements = elements
	}, function(data, menu)
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
			if data.current.value == 'cywil' then
				if Player.MissionStatus ~= 'nomission' and Player.MissionStatus.missionType == 'getClothes' then
					Player.MissionStatus.missionData.isClothed = false
				end
				ESX.ShowNotification('~g~Założono ubrania cywilne')
				TriggerEvent('skinchanger:loadSkin', skin)
			elseif data.current.value == 'clothes' then
				if Player.MissionStatus ~= 'nomission' and Player.MissionStatus.missionType == 'getClothes' then
					Player.MissionStatus.missionData.isClothed = true
				end
				ESX.ShowNotification('~g~Założono ubrania robocze')
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, Config.Clothes.Male)
				else
					TriggerEvent('skinchanger:loadClothes', skin, Config.Clothes.Female)
				end
			end
		end)
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

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), Config.jobName..'boss', {
		title    = "Praca Legalna",
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)

		if data.current.value == '1' then
			if PlayerData.secondjob.grade == 7 then
				TriggerEvent('esx_society:openSecondBossMenu', Config.jobName, function(data, menu)
					menu.close()
				end, { showmoney = false, withdraw = false, deposit = true, wash = false, employees = true})
			elseif PlayerData.secondjob.grade >= 8 then
				TriggerEvent('esx_society:openSecondBossMenu', Config.jobName, function(data, menu)
					menu.close()
				end, { showmoney = true, withdraw = true, deposit = true, wash = false, employees = true})
			else
				TriggerEvent('esx_society:openSecondBossMenu', Config.jobName, function(data, menu)
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
						ESX.UI.Menu.Open('list', GetCurrentResourceName(), Config.jobName..'_courses', elements, function(data, menu)
						end, function(data, menu)
							menu.close()
						end)
                    end
                else
                    ESX.ShowNotification("~r~Lista kursów jest pusta!")
				end
			end, Config.jobName)
		elseif data.current.value == '4' then
			menu.close()
			exports['ocean_legaljobs']:OpenLicensesMenu(PlayerData.secondjob.name)
		end

	end, function(data, menu)
		menu.close()
	end)
end