ESX                    = nil

TriggerEvent('exilerp:getSharedObject', function(obj) ESX = obj end)

function setPlayerStatus(xPlayer, data)
	print(xPlayer.getStatus())
	data = data and json.decode(data) or {}
	print(xPlayer.source)
	xPlayer.set('status', data)
	ESX.Players[xPlayer.source] = data
	TriggerClientEvent('esx_status:load', xPlayer.source, data)
end

AddEventHandler('onServerResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  	return
	end

	for _, xPlayer in pairs(ESX.Players) do
		MySQL.scalar.await('SELECT status FROM users WHERE identifier = ?', { xPlayer.identifier }, function(result)
			xPlayer.setPlayerStatus(xPlayer, result)
		end)
	end
end)

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
	MySQL.scalar.await('SELECT status FROM users WHERE identifier = ?', { xPlayer.identifier }, function(result)
		setPlayerStatus(xPlayer, result)
	end)
end)

AddEventHandler('esx:playerDropped', function(playerId, reason)
	local xPlayer = ESX.GetPlayerFromId(playerId)
	local status = xPlayer.getStatus()

	MySQL.update('UPDATE users SET status = ? WHERE identifier = ?', { json.encode(status), xPlayer.identifier })
end)


AddEventHandler('esx_status:getStatus', function(playerId, statusName, cb)
	local status = ESX.GetPlayerFromId(playerId).getStatus()
	for i = 1, #status do
		if status[i].name == statusName then
			return cb(status[i])
		end
	end
end)

RegisterServerEvent('esx_status:update')
AddEventHandler('esx_status:update', function(status)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		xPlayer.setStatus(status)	-- save to xPlayer for compatibility
		TriggerClientEvent('qHud:aktualizejszn', source, status)
	end
end)

CreateThread(function()
	while true do
		Wait(10 * 60 * 1000)
		local parameters = {}
		for _, xPlayer in pairs(ESX.GetExtendedPlayers()) do
			local status = xPlayer.getStatus()
			if status and next(status) then
				parameters[#parameters+1] = {json.encode(status), xPlayer.identifier}
			end
		end
		if #parameters > 0 then
			MySQL.prepare('UPDATE users SET status = ? WHERE identifier = ?', parameters)
		end
	end
end)












ESX.RegisterUsableItem('gopro', function(source)
    local _source = source

    TriggerClientEvent('ls_gopro:goproMenu', _source)
end)

RegisterServerEvent('ls_gopro:destroyItem')
AddEventHandler('ls_gopro:destroyItem', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeInventoryItem('gopro', 1)
end)
