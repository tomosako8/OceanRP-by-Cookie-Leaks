ESX = nil

local SignList = {}

TriggerEvent('exilerp:getSharedObject', function(obj)
	ESX = obj
	Config.check()
end)

function sendSigns()
	local players = ESX.GetExtendedPlayers()
	for k,v in pairs(players) do
		TriggerClientEvent('cookie_sign:signs', v.source, SignList)
	end
end

function removeSign(text)
	MySQL.execute("DELETE FROM signs WHERE text = @text", {["text"] = text})
end

function addNewSign(location, text)
	MySQL.insert("INSERT INTO signs(id, location, text) VALUES (NULL, ?, ?)", {json.encode(location), text})
	table.insert(SignList, {location = location, text = text})
end

Citizen.CreateThread(function()
	MySQL.query("SELECT * FROM signs", {}, function(result)
		for k,v in pairs(result) do
			table.insert(SignList, {location = json.decode(v.location), text = v.text})
		end
	end)
	while true do
		Citizen.Wait(3000)
		sendSigns()
	end
end)

RegisterServerEvent('cookie_sign:removeSign')
AddEventHandler('cookie_sign:removeSign', function(id, sign)
	table.remove(SignList, id)
	removeSign(sign.text)
end)

RegisterCommand('opis2usun', function(source, args, raw)
	TriggerClientEvent('cookie_sign:deleteSign', source)
end)

RegisterCommand('opis2', function(source, args, raw)
	local text = ""
	for k,v in ipairs(args) do
		text = text.." "..args[k]
	end
	local xPlayer = ESX.GetPlayerFromId(source)
	addNewSign(xPlayer.getCoords(), text)
	sendSigns()
end)
