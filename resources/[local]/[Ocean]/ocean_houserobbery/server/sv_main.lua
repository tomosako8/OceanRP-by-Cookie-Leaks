ESX = nil

TriggerEvent('exilerp:getSharedObject', function(obj) ESX = obj end)

local RoberyNow = false
local whoismaking = 0

RegisterServerEvent('assynu_houserobbery:NoticeCops')
AddEventHandler('assynu_houserobbery:NoticeCops', function(coords, type)
    exports['ocean_logs']:SendLog(source, "Napad na mieszkanie Coords:"..coords, 'napadnamieszkanie')
    TriggerClientEvent('assynu_houserobbery:CopsMessage', -1, coords, type)
    TriggerClientEvent("assynu_houserobbery:setBlip", -1, coords)
end)

RegisterServerEvent('assynu_houserobbery:changeroberynowstate')
AddEventHandler('assynu_houserobbery:changeroberynowstate', function(state)
    RoberyNow = state
    if state then
        whoismaking = source
        ADSFSTERGDXC(source)
    else
        whoismaking = 0
    end
end)

function ADSFSTERGDXC(src)
    local sdfg = src
    if RoberyNow then
        Wait(20*60*1000)
        if (RoberyNow and whowasmaking == sdfg) then
            RoberyNow = false
        end
    end
end

ESX.RegisterServerCallback('assynu_houserobbery:roberynowstate', function(source, cb)
	if RoberyNow then
		cb(true)
	else
		cb(false)
	end
end)

local connectedPlayers = {}

AddEventHandler('esx:setJob', function(playerId, job)
    connectedPlayers[playerId] = {}
	connectedPlayers[playerId].job = job.name

	TriggerClientEvent('assynu_houserobbery:counter', -1, connectedPlayers)
end)

AddEventHandler('esx:playerDropped', function(playerId)
	connectedPlayers[playerId] = nil

	TriggerClientEvent('assynu_houserobbery:counter', -1, connectedPlayers)
end)


AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
	connectedPlayers[playerId] = {}
	connectedPlayers[playerId].job = xPlayer.job.name

    TriggerClientEvent('assynu_houserobbery:counter', -1, connectedPlayers)
end)

local event1 = 'assynu_houserobbery:giveitem_' .. math.random(1000,1000000)
local event2 = 'assynu_houserobbery:sendlog_' .. math.random(1000,1000000)
local token = math.random(100000,99999999)

RegisterServerEvent(event1)
AddEventHandler(event1, function(item, amount, type, recivedtoken)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    if token == recivedtoken then
        if type == 'item' then
            xPlayer.addInventoryItem(item, amount)
        elseif type == 'money' then
            xPlayer.addMoney(amount)
        end
    else
        exports['ocean_logs']:SendLog(_source, "HouseRobery: Próba dodania pieniędzy/itemu przez houserobery", 'anticheat', '15844367')
    end
end)

RegisterServerEvent(event2)
AddEventHandler(event2, function(recivedtoken)
    if recivedtoken == token then
        local src = source
        local xPlayer = ESX.GetPlayerFromId(src)
        local hex, discordid
        for k,v in ipairs(GetPlayerIdentifiers(src)) do
            if string.sub(v, 1, string.len("steam:")) == "steam:" then
                hex = v
            elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                discordid = v
            end
        end
        local embed = {
            {
                ["title"] = src .. " - " .. hex .. " - " .. GetPlayerName(src),
                ["description"] = GetPlayerName(src)..' zaczął kręcić napad na dom',
                ["footer"] = {
                ["text"] = os.date() .. " | Exile-Handler",
                },
            }
        }
        PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({username = 'Exile-Handler', embeds = embed}), { ['Content-Type'] = 'application/json' })
    end
end)

local get_code = {}
RegisterNetEvent("assynu_houserobbery:code")
AddEventHandler("assynu_houserobbery:code", function()   
    if not get_code[source] then
        TriggerClientEvent("assynu_houserobbery:code", source, event1, event2, token)
        get_code[source] = true
    else
        return
    end
end)

CreateThread(function()
	while true do
		local loadFile = LoadResourceFile(GetCurrentResourceName(), "./cooldown.json")  
		local cooldowndata = {}
		local newdata = {}
		local actualtime = getActualDateAndTime()

		cooldowndata = json.decode(loadFile)

		if cooldowndata ~= nil then
			for k,v in pairs(cooldowndata) do
				if v.Time <= actualtime then
					
				else
					table.insert(newdata, v)
				end
			end
		end
		SaveResourceFile(GetCurrentResourceName(), "cooldown.json", json.encode(newdata), -1)
		Wait(1000*60)
	end
end)

ESX.RegisterServerCallback('assynu_houserobbery:getcooldown', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local loadFile = LoadResourceFile(GetCurrentResourceName(), "./cooldown.json")  
	local bandata = {}
  local Identifier = xPlayer.getIdentifier()
  local hasactivecooldown = false
	bandata = json.decode(loadFile)
	if bandata ~= nil then
		for k,v in pairs(bandata) do
			if v.Identifier == Identifier then
				hasactivecooldown = true
			end
		end
	end
  cb(hasactivecooldown)
end)

RegisterServerEvent('assynu_houserobbery:setcooldown')
AddEventHandler('assynu_houserobbery:setcooldown', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local loadFile = LoadResourceFile(GetCurrentResourceName(), "./cooldown.json")
	local bandata = {}
	local newdata = {}
	local banendtime = getActualDateAndTime() + Config.Cooldown
	cooldowndata = json.decode(loadFile)
	if cooldowndata ~= nil then
		newdata = cooldowndata
	end
	table.insert(newdata, {
		Identifier = xPlayer.getIdentifier(), 
		Time = banendtime,
	})
	SaveResourceFile(GetCurrentResourceName(), "cooldown.json", json.encode(newdata), -1)
end)

function getActualDateAndTime()
  local date_table = os.date("*t")
  local year = date_table.year
  local month = date_table.month
  local day = date_table.day
  local hour = date_table.hour
  local minute = date_table.min
  if month < 10 then
      month = '0'..month
  end
  if day < 10 then
      day = '0'..day
  end
  if hour < 10 then
      hour = '0'..hour
  end
  if minute < 10 then
      minute = '0'..minute
  end
  local date = year..month..day..hour..minute
  local actdate = tonumber(date)
  return actdate
end