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

Citizen.CreateThread(function()
	while PlayerData == nil do
		PlayerData = ESX.GetPlayerData()
	end
	Player.Ped = GetPlayerPed(-1)
	Player.IsCarJacking = false
	Player.CarJackingPed = nil
	Player.CarJackingVehicle = nil
	Player.IsInVehicle = false
	Player.VehicleModel = nil
	Player.VehicleCoords = nil
	Player.GarageCoords = nil
	Player.Status = nil
	Player.Blip = nil
	Player.PoliceBlip = nil
	Player.GarageBlip = nil
	Player.TimeToAbort = nil
	if PlayerData.job.name ~= 'police' and PlayerData.job.name ~= 'sheriff' then
		addBlipStart({x = Config.CarJacking.StartCoords.x, y = Config.CarJacking.StartCoords.y, z = Config.CarJacking.StartCoords.z})
	end
end)

local policeBlips = {}

RegisterNetEvent('cookie_sprowadzanie:policeAlarm')
AddEventHandler('cookie_sprowadzanie:policeAlarm', function(model, entity)
	TriggerEvent("FeedM:showAdvancedNotification", 'Alarm policyjny', '~r~Kradziez drogiego samochodu','Trwa wlasnie kradziez drogiego auta zlap go zanim ucieknie.', 'CHAR_CALL911', 5000, nil, function()
	end)
	local timer = GetGameTimer()+40000
	Citizen.CreateThread(function()
		while timer > GetGameTimer() do
			Citizen.Wait(2500)

			if Player.PoliceBlip == nil then
				addBlipForPoliceTo(entity)
			else
				RemoveBlip(Player.PoliceBlip)
				addBlipForPoliceTo(entity)
			end
		end
		if Player.PoliceBlip ~= nil then
			RemoveBlip(Player.PoliceBlip)
			Player.PoliceBlip = nil
		end
		for k,v in pairs(policeBlips) do
			RemoveBlip(v)
		end
	end)
end)

local notifyOpened = false

function SendTextMessage(msg, type, time)
	if time ~= -1 then
	    if type == 'inform' then
	        exports["qHelpNotify"]:Open(msg, 'darkblue', 'left')
	        Citizen.Wait(time)
	        exports['qHelpNotify']:Close()
	    end
	    if type == 'error' then 
	        exports["qHelpNotify"]:Open(msg, 'darkblue', 'left')
	        Citizen.Wait(time)
	        exports['qHelpNotify']:Close()
	    end
	    if type == 'success' then 
	        exports["qHelpNotify"]:Open(msg, 'darkblue', 'left')
	        Citizen.Wait(time)
	        exports['qHelpNotify']:Close()
	    end
	else
	    if type == 'inform' then
	        exports["qHelpNotify"]:Open(msg, 'darkblue', 'left')
	    end
	    if type == 'error' then 
	        exports["qHelpNotify"]:Open(msg, 'darkblue', 'left')
	    end
	    if type == 'success' then 
	        exports["qHelpNotify"]:Open(msg, 'darkblue', 'left')
	    end
	    notifyOpened = true
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local coords = GetEntityCoords(Player.Ped)
		local carJacking = Config.CarJacking
		local distance = GetDistanceBetweenCoords(coords, carJacking.StartCoords.x, carJacking.StartCoords.y, carJacking.StartCoords.z, false)
		if distance < 40.0 then
			if Player.CarJackingPed == nil then
				Player.CarJackingPed = CreatePed(0, GetHashKey('csb_tomcasino'), carJacking.StartCoords.x, carJacking.StartCoords.y, carJacking.StartCoords.z, 250.0, false, false)
			else
				RequestAnimDict('amb@world_human_stand_guard@male@base')
				TaskPlayAnim(Player.CarJackingPed, 'amb@world_human_stand_guard@male@base', 'base', 8.0, 3.0, -1, 51, 1, true, true, true)
				SetPedCanBeTargetted(Player.CarJackingPed, false)
				SetEntityCoords(Player.CarJackingPed, carJacking.StartCoords.x, carJacking.StartCoords.y, carJacking.StartCoords.z, false, false, false, false)
				
				if distance < 2.0 and not Player.IsCarJacking then
					if not notifyOpened then
						SendTextMessage("Kliknij [E], aby wziac zlecenie", 'inform', -1)
					end
					if IsControlJustPressed(0, Keys["E"]) then
						ESX.TriggerServerCallback('cookie_sprowadzanie:isCooldown', function(isCooldown)
							if isCooldown then
								local timeLeft = isCooldown-GetGameTimer()
								local secs = timeLeft/1000
								local minutes = secs/60
								ESX.ShowNotification("Nie mam nowych zlecen, przyjdz do mnie za ~g~"..ESX.Math.Round(minutes).."m")
							else
								startMission()
								notifyOpened = false
								exports['qHelpNotify']:Close()
							end
						end)
					end
				elseif distance > 2.0 and not Player.IsCarJacking and notifyOpened then
					notifyOpened = false
					exports['qHelpNotify']:Close()
				end
			end
		elseif distance > 40 and Player.CarJackingPed ~= nil then
			DeleteEntity(Player.CarJackingPed)
			Player.CarJackingPed = nil
		end
	end
end)

function addBlipForPoliceTo(entity)
	if policeBlips[1] ~= nil then
		RemoveBlip(policeBlips[1])
		policeBlips = {}
	end
	local coords = GetEntityCoords(NetworkGetEntityFromNetworkId(entity))
	local blip = AddBlipForEntity(NetworkGetEntityFromNetworkId(entity))
	SetBlipSprite(blip, 595)
	SetBlipColour(blip, 1)
	SetBlipDisplay(blip, 2)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Skradziony pojazd")
	EndTextCommandSetBlipName(blip)
	Player.PoliceBlip = blip

	local blip2 = AddBlipForCoord(coords.x, coords.y, coords.z)
	SetBlipSprite(blip2, 161)
	SetBlipColour(blip2, 1)
	SetBlipDisplay(blip2, 2)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Ostatnia pozycja skradzionego pojazdu")
	EndTextCommandSetBlipName(blip2)
	table.insert(policeBlips, blip2)
end

function addBlipStart(coords)
	local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
	SetBlipSprite(blip, 810)
	SetBlipColour(blip, 5)
	SetBlipDisplay(blip, 3)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Sprowadzanie samochodow")
	EndTextCommandSetBlipName(blip)
end

function addBlipCoords(coords)
	local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
	SetBlipSprite(blip, 530)
	SetBlipColour(blip, 2)
	SetBlipDisplay(blip, 2)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Auto do sprowadzenia")
	EndTextCommandSetBlipName(blip)
	Player.Blip = blip
end

function addBlipCoordsGarage(coords)
	local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
	SetBlipSprite(blip, 369)
	SetBlipColour(blip, 2)
	SetBlipDisplay(blip, 2)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Garaz do sprowadzania")
	EndTextCommandSetBlipName(blip)
	Player.GarageBlip = blip
end

function addBlipTo(entity)
	if Player.Blip ~= nil then
		RemoveBlip(Player.Blip)
	end
	local blip = AddBlipForEntity(entity)
	SetBlipColour(blip, 2)
	SetBlipSprite(blip, 530)
	SetBlipDisplay(blip, 2)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Auto do sprowadzenia")
	EndTextCommandSetBlipName(blip)
	if Player.Blip == nil then
		Player.Blip = blip
	end
end

local isVehicleSpawning = false

function startMission()
	Player.IsCarJacking = true
	Player.VehicleModel = Config.CarJacking.Models[math.random(#Config.CarJacking.Models)]
	Player.VehicleCoords = Config.CarJacking.Vehicles[math.random(#Config.CarJacking.Vehicles)]
	Player.GarageCoords = Config.CarJacking.Garages[math.random(#Config.CarJacking.Garages)]
	Player.Status = 'carJack'
	print(Player.VehicleCoords.x.."/"..Player.VehicleCoords.y.."/"..Player.VehicleCoords.z)
	Citizen.CreateThread(function()
		ESX.ShowNotification("Rozpoczeto prace, zabierz auto oznaczone na GPS'ie")
		while Player.IsCarJacking do
			Citizen.Wait(5)
			local playerCoords = GetEntityCoords(Player.Ped)
			if Player.Status == 'carJack' then
				local distance = GetDistanceBetweenCoords(playerCoords, Player.VehicleCoords.x, Player.VehicleCoords.y, Player.VehicleCoords.z, false)
				if distance < 80.0 and Player.CarJackingVehicle == nil and not isVehicleSpawning then
					isVehicleSpawning = true
					ESX.Game.SpawnVehicle(Player.VehicleModel.model, Player.VehicleCoords, 90.0, function(vehicleSpawned)
						Player.CarJackingVehicle = vehicleSpawned
						NetworkRegisterEntityAsNetworked(Player.Ped)
						local netID = NetworkGetNetworkIdFromEntity(Player.Ped)
						SetNetworkIdExistsOnAllMachines(netID, true)
						SetNetworkIdCanMigrate(netID, true)
						isVehicleSpawning = false
					end)
					Citizen.Wait(300)
				elseif distance > 80.0 and Player.CarJackingVehicle == nil then
					if Player.Blip == nil then
						addBlipCoords(Player.VehicleCoords)
						Citizen.Wait(300)
					end
				end
				local vehicleIn = GetVehiclePedIsIn(Player.Ped, false)
				if vehicleIn ~= 0 and GetEntityModel(vehicleIn) == GetHashKey(Player.VehicleModel.model) then
					Player.Status = 'carGarage'
					Player.IsInVehicle = true
					ESX.ShowNotification("Oddaj pojazd we wskazane miejsce ustawione na GPS")
					SetNewWaypoint(Player.GarageCoords.x, Player.GarageCoords.y)
					TriggerServerEvent('cookie_sprowadzanie:carJackingProcess', {model = Player.VehicleModel.model, entity = NetworkGetNetworkIdFromEntity(Player.Ped)})
					addBlipCoordsGarage(Player.GarageCoords)
					Citizen.Wait(500)
				end
			elseif Player.Status == 'carGarage' then
				if GetVehiclePedIsIn(Player.Ped, false) == 0 and Player.IsInVehicle then
					Player.IsInVehicle = false
					Player.TimeToAbort = GetGameTimer()+60000
				elseif GetVehiclePedIsIn(Player.Ped, false) ~= 0 and not Player.IsInVehicle then
					Player.IsInVehicle = true
					Player.TimeToAbort = nil
				end
				if not Player.IsInVehicle and Player.TimeToAbort ~= nil then
					local timeLeft = Player.TimeToAbort-GetGameTimer()
					local secs = timeLeft/1000
					ESX.ShowHelpNotification("Wroc do auta w ciagu "..secs.."s inaczej zlecenie bedzie anulowane")
					if GetGameTimer() > Player.TimeToAbort then
						RemoveBlip(Player.Blip)
						RemoveBlip(Player.GarageBlip)
						DeleteEntity(Player.CarJackingVehicle)
						Player.Blip = nil
						Player.GarageBlip = nil
						Player.CarJackingVehicle = nil
						Player.VehicleCoords = nil
						Player.VehicleModel = nil
						Player.GarageCoords = nil
						Player.Status = nil
						Player.IsCarJacking = false
						ESX.ShowNotification("Anulowano zlecenie z powodem pozostawienia auta")
					end
				end
				local distance = GetDistanceBetweenCoords(playerCoords, Player.GarageCoords.x, Player.GarageCoords.y, Player.GarageCoords.z, false)
				if distance < 30.0 then
					DrawMarker(27, Player.GarageCoords.x, Player.GarageCoords.y, Player.GarageCoords.z, 2.5, 2.5, 1.0, 0.0, 0.0, 0.0, 2.5, 2.5, 1.0, 14, 216, 18, 0.8, false, true, 2, true, nil, nil, false)
					if distance < 3.0 then
						ESX.ShowHelpNotification("Kliknij ~INPUT_CONTEXT~, aby oddac auto")
						if IsControlJustPressed(0, Keys["E"]) then
							TriggerServerEvent('cookie_sprowadzanie:carJackingSuccess', {engineHealth = GetVehicleEngineHealth(Player.CarJackingVehicle), bodyHealth = GetVehicleBodyHealth(Player.CarJackingVehicle)})
							RemoveBlip(Player.Blip)
							RemoveBlip(Player.GarageBlip)
							DeleteEntity(Player.CarJackingVehicle)
							Player.Blip = nil
							Player.GarageBlip = nil
							Player.CarJackingVehicle = nil
							Player.VehicleCoords = nil
							Player.VehicleModel = nil
							Player.GarageCoords = nil
							Player.Status = nil
							Player.IsCarJacking = false
						end
					end
				end
			end
		end
	end)
end