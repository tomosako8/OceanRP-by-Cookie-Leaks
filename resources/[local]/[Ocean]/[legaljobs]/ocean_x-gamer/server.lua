ESX = nil

local PlayersHarvesting		   = {}
local recived_token_xgamer = {}

local TRIGGER_SELL = "exile_legalxgamer:SellCoffee"..math.random(9999,999999)
local TRIGGER_TRANSFERING = "exile_legalxgamer:Transfering"..math.random(9999,999999)
local SERVER_TOKEN = "ExileSecurity"..math.random(9999,999999999999)

TriggerEvent('exilerp:getSharedObject', function(obj) ESX = obj end)

local function Harvest(source, name)
	SetTimeout(60000, function()
		if PlayersHarvesting[source] == true then
			local xPlayer  = ESX.GetPlayerFromId(source)
            local item = xPlayer.getInventoryItem(name)
			if item.limit ~= -1 and item.count >= item.limit then
                xPlayer.showNotification('Nie uniesiesz więcej ~y~'..item.label)
                TriggerClientEvent('exile_legalxgamer:Cancel', source)
			else
				xPlayer.addInventoryItem(name, 20)
				Harvest(source, name)
			end
		else
			return
		end
	end)
end

function SalaryCheck(grade)
    if grade == 9 then
        return true
    else
        return false
    end
end

RegisterServerEvent('exile_legalxgamer:collect')
AddEventHandler('exile_legalxgamer:collect', function(name)
	local _source = source
    if name == "ziarnokawy" then
        local xPlayer  = ESX.GetPlayerFromId(source)
        if xPlayer.getInventoryItem('ziarnokawy').count == 0 then
            PlayersHarvesting[_source] = true
            xPlayer.showNotification('~y~Trwa zbieranie proszku')
            Harvest(_source, name)
        else
            xPlayer.showNotification('~r~Twoja torba nie pomieści więcej ziaren kawy !')
        end
    else
        TriggerEvent("exilerp:banPlr", "nigger", source, string.format("Tried to get item %s (Prace legalne)", name))
    end
end)

RegisterServerEvent(TRIGGER_TRANSFERING)
AddEventHandler(TRIGGER_TRANSFERING, function(countBefore, token)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if SERVER_TOKEN == token then
        if xPlayer.secondjob.name == 'x-gamer' then
            if xPlayer.getInventoryItem('xgamermieszanka').count == 0 then
                if countBefore >= 100 then
                    local itemCount = math.floor((countBefore / 10))
                    xPlayer.removeInventoryItem('ziarnokawy', itemCount * 10)
                    Paycheck('x-gamer', xPlayer)
                    if itemCount >= 1 then
                        TriggerEvent('ExileRP:saveCours', xPlayer.secondjob.name, xPlayer.secondjob.grade, xPlayer.source)
                    end
                else
                    exports['ocean']:SendLog(_source, "X-GAMER OSTRZEŻENIE: Próba zbugowania przeróbki!", 'anticheat', '15844367')
                end
            else
                xPlayer.showNotification('~r~Nie możesz przerabiać mieszanki X-Gamer posiadając mieszanke X-Gamer!')
            end
        else
            TriggerEvent("exilerp:banPlr", "nigger", source, "Tried to collect item without secondjob (Prace legalne)")
        end
    else
        TriggerEvent("exilerp:banPlr", "nigger", source, "Tried to collect item with wrong token (Prace legalne)")
    end
end)

Paycheck = function(secondjob, xPlayer)
	local total = nil
	if secondjob == 'x-gamer' then
        if xPlayer.secondjob.grade == 9 then
            total = 11000
        elseif xPlayer.secondjob.grade == 8 then
            total = 10500
        elseif xPlayer.secondjob.grade == 7 then
            total = 10000
        elseif xPlayer.secondjob.grade == 6 then
            total = 9500
        elseif xPlayer.secondjob.grade == 5 then
            total = 9000
        elseif xPlayer.secondjob.grade == 4 then
            total = 8900
        elseif xPlayer.secondjob.grade == 3 then
            total = 8800
        elseif xPlayer.secondjob.grade == 2 then
            total = 8700
        elseif xPlayer.secondjob.grade == 1 then
            total = 8600
        elseif xPlayer.secondjob.grade == 0 then
            total = 8500
        end

        if xPlayer.group == 'vip' then
            total = (total*1.15)
        end
        
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..secondjob, function(account)
            account.addAccountMoney(total / 100 * 10)
        end)

        xPlayer.addMoney(total)
        xPlayer.showNotification('Otrzymano ~g~'..total..'$ ~s~za dostarczenie.')
        exports['ocean_logs']:SendLog(xPlayer.source, "X-GAMER: Zakończono kurs. Zarobek: " ..total.. "$", 'x-gamer', '15844367')
	end
end

RegisterServerEvent('exile_legalxgamer:stopPickup')
AddEventHandler('exile_legalxgamer:stopPickup', function(zone)
	local _source = source
	PlayersHarvesting[_source] = nil
    TriggerClientEvent('exile_legalxgamer:Cancel', source)
end)

RegisterServerEvent('exile_legalxgamer:request')
AddEventHandler('exile_legalxgamer:request', function()
	if not recived_token_xgamer[source] then
		TriggerClientEvent("exile_legalxgamer:getrequest", source, SERVER_TOKEN, TRIGGER_SELL, TRIGGER_TRANSFERING)
		recived_token_xgamer[source] = true
	else
        TriggerEvent("exilerp:banPlr", "nigger", source, "Tried to get token (Prace legalne)")
	end
end)

AddEventHandler('playerDropped', function()
    recived_token_xgamer[source] = nil
    PlayersHarvesting[source] = nil
end)

RegisterServerEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function()
	PlayersHarvesting[source] = nil
end)

local SmiecieSiedzace = {}
RegisterServerEvent('exile_legalxgamer:insertPlayer')
AddEventHandler('exile_legalxgamer:insertPlayer', function(tablice)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local insertLabel = GetPlayerName(_source)..' ['..xPlayer.character.firstname ..' '.. xPlayer.character.lastname..'] '..os.date("%H:%M:%S")
	table.insert(SmiecieSiedzace, {label = insertLabel, plate = tablice})
end)

ESX.RegisterServerCallback('exile_legalxgamer:checkSiedzacy', function(source, cb)
	cb(SmiecieSiedzace)
end)