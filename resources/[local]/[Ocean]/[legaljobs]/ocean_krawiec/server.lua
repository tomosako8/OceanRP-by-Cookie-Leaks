ESX = nil

local PlayersHarvesting		   = {}
local recived_token_krawiec = {}

local TRIGGER_SELL = "exile_legalkrawiec:SellCoffee"..math.random(9999,999999)
local TRIGGER_TRANSFERING = "exile_legalkrawiec:Transfering"..math.random(9999,999999)
local SERVER_TOKEN = "ExileSecurity"..math.random(9999,999999999999)

TriggerEvent('exilerp:getSharedObject', function(obj) ESX = obj end)

local function Harvest(source, name)
	SetTimeout(60000, function()
		if PlayersHarvesting[source] == true then
			local xPlayer  = ESX.GetPlayerFromId(source)
            local item = xPlayer.getInventoryItem(name)
			if item.limit ~= -1 and item.count >= item.limit then
                xPlayer.showNotification('Nie uniesiesz więcej ~y~'..item.label)
                TriggerClientEvent('exile_legalkrawiec:Cancel', source)
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

RegisterServerEvent('exile_legalkrawiec:collect')
AddEventHandler('exile_legalkrawiec:collect', function(name)
	local _source = source
    if name == "material_krawiec" then
        local xPlayer  = ESX.GetPlayerFromId(source)
        if xPlayer.getInventoryItem('ubrania_krawiec').count == 0 then
            PlayersHarvesting[_source] = true
            xPlayer.showNotification('~y~Trwa zbieranie materiału')
            Harvest(_source, name)
        else
            xPlayer.showNotification('~r~Nie możesz zbierać materiału posiadając ubrania!')
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
        if xPlayer.secondjob.name == 'krawiec' then
            if xPlayer.getInventoryItem('ubrania_krawiec').count == 0 then
                if countBefore >= 100 then
                    local itemCount = math.floor((countBefore / 10))
                    xPlayer.removeInventoryItem('material_krawiec', itemCount * 10)
                    Paycheck('krawiec', xPlayer)
                    if itemCount >= 1 then
                        TriggerEvent('ExileRP:saveCours', xPlayer.secondjob.name, xPlayer.secondjob.grade, xPlayer.source)
                    end
                else
                    exports['ocean_logs']:SendLog(_source, "KRAWIEC OSTRZEŻENIE: Próba zbugowania przeróbki!", 'anticheat', '15844367')
                end
            else
                xPlayer.showNotification('~r~Nie możesz przerabiać materiału posiadając ubrania!')
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
    if secondjob == 'krawiec' then
        if xPlayer.secondjob.grade == 9 then
            total = 8500
        elseif xPlayer.secondjob.grade == 8 then
            total = 8300
        elseif xPlayer.secondjob.grade == 7 then
            total = 8100
        elseif xPlayer.secondjob.grade == 6 then
            total = 7900
        elseif xPlayer.secondjob.grade == 5 then
            total = 7700
        elseif xPlayer.secondjob.grade == 4 then
            total = 7600
        elseif xPlayer.secondjob.grade == 3 then
            total = 7500
        elseif xPlayer.secondjob.grade == 2 then
            total = 7400
        elseif xPlayer.secondjob.grade == 1 then
            total = 7300
        elseif xPlayer.secondjob.grade == 0 then
            total = 7200
        end

        if xPlayer.group == 'vip' then
            total = total+(total*20)/100
        end
        
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..secondjob, function(account)
            account.addAccountMoney(total / 100 * 10)
        end)

        xPlayer.addMoney(total)
        xPlayer.showNotification('Otrzymano ~g~'..total..'$ ~s~za dostarczenie.')
        exports['ocean_logs']:SendLog(xPlayer.source, "KRAWIEC: Zakończono kurs. Zarobek: " ..total.. "$", 'krawiec', '15844367')
	end
end

RegisterServerEvent('exile_legalkrawiec:stopPickup')
AddEventHandler('exile_legalkrawiec:stopPickup', function(zone)
	local _source = source
	PlayersHarvesting[_source] = nil
    TriggerClientEvent('exile_legalkrawiec:Cancel', source)
end)

RegisterServerEvent('exile_legalkrawiec:request')
AddEventHandler('exile_legalkrawiec:request', function()
	if not recived_token_krawiec[source] then
		TriggerClientEvent("exile_legalkrawiec:getrequest", source, SERVER_TOKEN, TRIGGER_SELL, TRIGGER_TRANSFERING)
		recived_token_krawiec[source] = true
	else
        TriggerEvent("exilerp:banPlr", "nigger", source, "Tried to get token (Prace legalne)")
	end
end)

AddEventHandler('playerDropped', function()
    recived_token_krawiec[source] = nil
    PlayersHarvesting[source] = nil
end)

RegisterServerEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function()
	PlayersHarvesting[source] = nil
end)

local SmiecieSiedzace = {}
RegisterServerEvent('exile_legalkrawiec:insertPlayer')
AddEventHandler('exile_legalkrawiec:insertPlayer', function(tablice)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local insertLabel = GetPlayerName(_source)..' ['..xPlayer.character.firstname ..' '.. xPlayer.character.lastname..'] '..os.date("%H:%M:%S")
	table.insert(SmiecieSiedzace, {label = insertLabel, plate = tablice})
end)

ESX.RegisterServerCallback('exile_legalkrawiec:checkSiedzacy', function(source, cb)
	cb(SmiecieSiedzace)
end)