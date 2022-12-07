ESX = nil

TriggerEvent('exilerp:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('xk3ly-bodycam:getPlayerName', function(source, cb)
	local data = {
		name = GetCharacterName(source),
	}
	cb(data)
end)

function GetCharacterName(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	local badge = json.decode(xPlayer.character.job_id)
	local odznaka = ''
	if xPlayer ~= nil then
		if badge.id == 0 then
			odznaka = '[Empty]'
		else
			odznaka = '['..badge.id..']'
		end
		return ('%s %s %s'):format(xPlayer.character.firstname, xPlayer.character.lastname, odznaka)
	else
		return ('%s %s %s'):format('Brak', 'Brak', '[Empty]')
	end
end

RegisterServerEvent('bodycam:save')
AddEventHandler('bodycam:save', function(time)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer ~= nil then
		MySQL.query('SELECT time FROM users WHERE identifier = ?', {xPlayer.identifier}, function(timee)
			if timee[1] ~= nil then
				MySQL.update('UPDATE users SET time = ? WHERE identifier = ?', {timee[1].time + time, xPlayer.identifier})
			end
		end)	
	end
end)