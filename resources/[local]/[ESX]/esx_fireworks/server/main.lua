ESX = nil

TriggerEvent('exilerp:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('trailburst', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('fireworks:box', source)
	xPlayer.removeInventoryItem('trailburst', 1)
end)

ESX.RegisterUsableItem('fountain', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('fireworks:cone', source)
	xPlayer.removeInventoryItem('fountain', 1)
end)

ESX.RegisterUsableItem('shotburst', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('fireworks:cylinder', source)
	xPlayer.removeInventoryItem('shotburst', 1)
end)

ESX.RegisterUsableItem('starburst', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('fireworks:rocket', source)
	xPlayer.removeInventoryItem('starburst', 1)
end)


RegisterServerEvent("syncbad1")
AddEventHandler("syncbad1", function(x, y, z)
    TriggerClientEvent("syncbad_cl1", -1, x, y, z)
end)
RegisterServerEvent("syncbad2")
AddEventHandler("syncbad2", function(x, y, z)
    TriggerClientEvent("syncbad_cl2", -1, x, y, z)
end)
RegisterServerEvent("syncbad3")
AddEventHandler("syncbad3", function(x, y, z)
    TriggerClientEvent("syncbad_cl3", -1, x, y, z)
end)
RegisterServerEvent("syncbad4")
AddEventHandler("syncbad4", function(x, y, z)
    TriggerClientEvent("syncbad_cl4", -1, x, y, z)
end)