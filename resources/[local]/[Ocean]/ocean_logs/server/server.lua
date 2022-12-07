ESX 			    			= nil
TriggerEvent('exilerp:getSharedObject', function(obj) ESX = obj end)

-- UŻYCIE PO SERVER: exports['ocean_logs']:SendLog(source, message, 'channel', 'color')
-- UŻYCIE PO CLIENT: TriggerServerEvent('exile_logs:triggerLog', message, 'channel')

--[[_G.LoadResourceFile = function(...)
	local _source = source
	SendLog(_source, "Gracz próbował załadować plik \nIP: " .. GetPlayerEndpoint(source), 'anticheat')
end]]

local configFile = LoadResourceFile(GetCurrentResourceName(), "./config/config.json")
local cfgFile = json.decode(configFile)

local localsFile = LoadResourceFile(GetCurrentResourceName(), "locals/"..cfgFile['locals']..".json")
local lang = json.decode(localsFile)

if lang == nil then
    return StopResource(GetCurrentResourceName())
end

if cfgFile == nil then
    return StopResource(GetCurrentResourceName())
end

SendLog = function(source, text, channel, color)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if channel ~= nil and Config.Webhooks[channel] ~= nil then
		local embed = {}
		if color == nil then
			color = "5793266"
		end
		if _source == nil then
			embed = {
				{
					["color"] = color,
					["title"] = "OceanRP",
					["description"] = text,
					["footer"] = {
						["text"] = os.date() .. " | OceanRP",
					},
				}
			}
		else
			local steamhex = GetPlayerIdentifiers(_source)[2]
			
			if steamhex ~= nil then
				steamhex = string.sub(steamhex, 9)
				local author = _source .. " - " .. steamhex .. " - " .. GetPlayerName(_source)
				if channel == 'anticheat' or channel == 'connect' or channel == 'disconnect' or channel == 'money' or channel == 'kills' or channel == 'characters' then
				local hex, dc = 'Brak SteamHEX', 'Brak DiscordID'
					for k,v in ipairs(GetPlayerIdentifiers(_source)) do
						if string.sub(v, 1, string.len("steam:")) == "steam:" then
							hex = v
						elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
							dc = v
						end
					end
					author = author .. " | " .. hex .. " | " .. dc
				elseif channel == 'item_give' or channel == 'item_drop' then
					local digit = "Digit: " .. xPlayer.getDigit()
					author = author .. " - " .. digit
				end
				embed = {
					{
						["color"] = color,
						["title"] = author,
						["description"] = text,
						["footer"] = {
							["text"] = os.date() .. " | OceanRP",
						},
					}
				}
			end
		end
		
		PerformHttpRequest(Config.Webhooks[channel], function(err, text, headers) end, 'POST', json.encode({username = 'Logi OceanRP', embeds = embed}), { ['Content-Type'] = 'application/json' })
	end
end

RegisterServerEvent('exile_logs:triggerLog')
AddEventHandler('exile_logs:triggerLog', function(message, channel)
	local _source = source
	SendLog(_source, message, channel)
end)

AddEventHandler('playerConnecting', function()
    local _source = source
	SendLog(_source, "Gracz łączy się z serwerem", 'connect')
end)
	
AddEventHandler('playerDropped', function(reason)
	local _source = source
	local crds = GetEntityCoords(GetPlayerPed(_source))
	local name = GetPlayerName(_source)
    TriggerClientEvent("exile_quit", -1, _source, crds, name, reason)
	SendLog(_source, "Gracz wychodzi z wyspy. \nPowód: " .. reason, 'disconnect')
end)		

RegisterServerEvent('exile_logs:playerDied')
AddEventHandler('exile_logs:playerDied', function(Killer, Message, Weapon)
	local _source = Killer
	local _src = source
	if Weapon then
		Message = Message .. ' **[' .. Weapon .. ']**'
	end

	for k,v in pairs(GetPlayerIdentifiers(_source))do
		if string.sub(v, 1, string.len("license:")) == "license:" then
			license = v
	  	end
	end

	for k,v in pairs(GetPlayerIdentifiers(_src))do
		if string.sub(v, 1, string.len("license:")) == "license:" then
			license_gracz = v
	  	end
	end

	SendLog(_source, Message .. '\n Licencja Zabijającego: **' .. license_gracz .. '**\n Licencja Zabitego: **' .. license .. '**', 'kills')
end)