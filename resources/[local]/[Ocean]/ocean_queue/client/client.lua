CreateThread(function()
	while ESX == nil do
		TriggerEvent('exilerp:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local connected = false

AddEventHandler("playerSpawned", function()
	if not connected then
		TriggerServerEvent("exile_queue:playerConnected")
		connected = true
	end
end)