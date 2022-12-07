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

local borrowBike = nil

Citizen.CreateThread(function()
	local isHelpShowed = false
	while true do
		Citizen.Wait(5)
		for i,v in ipairs(Config.bikes) do
			local playerPed = GetPlayerPed(-1)
			local bikeCoords = Config.bikes[i].pos
			local pedCoords = GetEntityCoords(playerPed)
			local distance = GetDistanceBetweenCoords(bikeCoords.x, bikeCoords.y, bikeCoords.z, pedCoords, true)
			if distance < 15 then

				DrawMarker(38, bikeCoords.x, bikeCoords.y, bikeCoords.z, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 245, 181, 39, 0.8, false, true, 2, true, nil, nil, false)
				if distance < 1.5 then
					if IsPedInAnyVehicle(playerPed, false) then
						if not isHelpShowed then
							SendTextMessage("Kliknij [E], aby zwrocic rower", 'inform', -1)
							isHelpShowed = true
						end
						if IsControlJustPressed(0, Keys["E"]) then
							local veh = GetVehiclePedIsIn(playerPed, false)
							if borrowBike ~= nil and borrowBike == veh then
								ESX.ShowNotification("Dziekujemy za zwrot, otrzymujesz kaucje w wysokosci ~g~"..Config.returnPayback.."$")
								DeleteVehicle(veh)
								TriggerServerEvent('ololBikes:returnPayback')
								borrowBike = nil
							end
						end
					else
						if not isHelpShowed then
							SendTextMessage("Kliknij [E], aby wypozyczyc rower", 'inform', -1)
							isHelpShowed = true
						end
						if IsControlJustPressed(0, Keys["E"]) then
							local random = math.random(0, #Config.bikeModels)
							if Config.bikeModels[random] ~= nil then
								local bike = Config.bikeModels[random]
								print(bike)
								ESX.Game.SpawnVehicle(bike.model, bikeCoords, GetEntityHeading(playerPed), function(vehicle)
									TriggerServerEvent('ololBikes:payBorrow')
									TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
									borrowBike = vehicle
									ESX.ShowNotification("Wypozyczono rower za ~g~"..Config.borrowCost.."$\n~g~Pamietaj przy zwrocie otrzymujesz kaucje")
								end)
							end
						end
					end
					
				else
					if isHelpShowed then
						exports['qHelpNotify']:Close()
						isHelpShowed = false
					end
				end
			end
		end
	end
end)

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