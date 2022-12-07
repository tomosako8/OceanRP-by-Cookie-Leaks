ESX	= nil
local PlayerData = {}

-- load jobData
CreateThread(function()
	while ESX == nil do
		TriggerEvent('exilerp:getSharedObject', function(obj) 
			ESX = obj 
		end)
		Citizen.Wait(250)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end
	PlayerData = ESX.GetPlayerData()
end)
RegisterNetEvent("esx:setJob", function(job) 
	PlayerData.job = job
end)
RegisterNetEvent("esx:setThirdJob", function(thirdjob) 
	PlayerData.thirdjob = thirdjob
end)

local society = 'org71'
local hasAlreadyEnteredMarker, lastZone, currentAction, currentActionMsg
local Changed = {}
Plates              = {}

Plates.DrawDistance = 10.0
Plates.MarkerSize   = {x = 3.0, y = 3.0, z = 1.5}
Plates.MarkerColor  = {r = 0, g = 242, b = 96}
Plates.MarkerType   = 25
Plates.WaitTime 	= 30000

Plates.Zones = { 
    vector3(318.16, 494.25, 152.78-0.85),
}

RegisterNetEvent('esx:setThirdJob')
AddEventHandler('esx:setThirdJob', function(thirdjob)
	PlayerData.thirdjob = thirdjob
end)


AddEventHandler('exile-plates:hasEnteredMarker', function(zone)
	currentAction = 'plate_menu'
	currentActionMsg = 'Naciśnij ~INPUT_CONTEXT~ aby zmienić ~b~rejestracje pojazdu'
end)

AddEventHandler('exile-plates:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	currentAction = nil
end)

CreateThread(function()
	while PlayerData == nil do
		Citizen.Wait(200)
	end
	while true do
		Citizen.Wait(3)
		if PlayerData.thirdjob ~= nil then
			if PlayerData.thirdjob.name == society then
				local playerCoords, isInMarker, currentZone, letSleep = GetEntityCoords(PlayerPedId()), false, nil, true

				for k,v in pairs(Plates.Zones) do
					local distance = #(playerCoords - v)

					if distance < Plates.DrawDistance then
						letSleep = false
						ESX.DrawBigMarker(vec3(v))
						if distance < Plates.MarkerSize.x then
							isInMarker, currentZone = true, k
						end
					end
				end

				if (isInMarker and not hasAlreadyEnteredMarker) or (isInMarker and lastZone ~= currentZone) then
					hasAlreadyEnteredMarker, lastZone = true, currentZone
					TriggerEvent('exile-plates:hasEnteredMarker', currentZone)
				end

				if not isInMarker and hasAlreadyEnteredMarker then
					hasAlreadyEnteredMarker = false
					TriggerEvent('exile-plates:hasExitedMarker', lastZone)
				end

				if letSleep then
					Citizen.Wait(500)
				end
			else
				Citizen.Wait(5000)
			end
		else
			Citizen.Wait(5000)
		end
	end
end)

CreateThread(function()
	while true do
		Citizen.Wait(3)

		if currentAction then
			ESX.ShowHelpNotification(currentActionMsg)

			if IsControlJustReleased(0, 38) and PlayerData.thirdjob and PlayerData.thirdjob.name == society then
				if currentAction == 'plate_menu' then
					WybijBlachyMenu()
				end
				currentAction = nil
			end
		else
			Citizen.Wait(1000)
		end
	end
end)

function WybijBlachyMenu()
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
		local plate = GetVehicleNumberPlateText(vehicle)
		local carIndex = GetVehicleIndexFromEntityIndex(vehicle)
		if not exports["OceanRP"]:checkPrzebita(plate) then
			if vehicle then
				ESX.UI.Menu.CloseAll()
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'plates', {
					title = 'Wybić blachy? ' .. plate,
					align = 'center',
					elements = {
						{label = 'Tak', value = true},
						{label = 'Nie', value = false}
					}
				}, function(data, menu)
					menu.close()
					if data.current.value == true then
						exports["ocean_taskbar"]:taskBar(30000, "Wybijanie blach", false, function(cb) 
							if cb then
								TriggerServerEvent("exilerp_temp:tempPlate", vehicle, plate)
								ESX.ShowNotification('~g~Blachy wrócą po schowaniu auta do garażu')
							end
							
						end)

					end
				end, function(data, menu)
					menu.close()
				end)
			end
		else
			ESX.ShowNotification('~r~Ten pojazd ma już wybite blachy!')
		end
	else
		ESX.ShowNotification("~r~Musisz znajdować się w pojeździe!")
	end
end

RegisterNetEvent('exile-plates:buy')
AddEventHandler('exile-plates:buy', function(plate, index, vehicle)
	SetVehicleNumberPlateText(vehicle, " ")
	Changed[index] = true
	Citizen.Wait(120 * Plates.WaitTime)
	TriggerServerEvent('exile-plates:delete', plate, vehicle, index)
	ESX.ShowNotification("~g~Wybite blachy odpadły!")
end)

RegisterNetEvent('exile-plates:delete')
AddEventHandler('exile-plates:delete', function(plate, vehicle, index)
	SetVehicleNumberPlateText(vehicle, plate)
	Changed[index] = false
end)
