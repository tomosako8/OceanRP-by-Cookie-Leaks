ESX = nil

CreateThread(function()
    while ESX == nil do
        TriggerEvent('exilerp:getSharedObject', function(obj) 
			ESX = obj 
		end)
    
		Citizen.Wait(250)
    end
end)

RegisterNetEvent("exilerp_temp:setPlate", function(veh, plate)
    SetVehicleNumberPlateText(veh, plate)
end)

function checkPrzebita(plate)
    local returned = nil
    ESX.TriggerServerCallback("exilerp_temp:checkPlate", function(is) 
        returned = is
    end, plate)
    while returned == nil do
        Citizen.Wait(100)
    end
    return returned
end