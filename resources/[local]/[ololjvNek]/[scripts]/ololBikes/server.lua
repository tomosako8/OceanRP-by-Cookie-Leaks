ESX = nil

TriggerEvent('exilerp:getSharedObject', function(obj)
	ESX = obj
	Config.check()
end)

RegisterServerEvent('ololBikes:returnPayback')
AddEventHandler('ololBikes:returnPayback', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addMoney(Config.returnPayback)
end)

RegisterServerEvent('ololBikes:payBorrow')
AddEventHandler('ololBikes:payBorrow', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeMoney(Config.returnPayback)
end)

