ESX                = nil

TriggerEvent('exilerp:getSharedObject', function(obj) ESX = obj end)

local SERVER_TOKEN = "ExileSecurity"..math.random(9999,999999999999)

local TRIGGER_SELL = "exile_weazel:sellNewspaper"..math.random(99999,999999999999)

RegisterNetEvent('Cam:ToggleCam')
AddEventHandler('Cam:ToggleCam', function()
    local src = source
    TriggerClientEvent("Cam:ToggleCam", src)
end)

RegisterNetEvent('Mic:ToggleBMic')
AddEventHandler('Mic:ToggleBMic', function()
    local src = source
    TriggerClientEvent("Mic:ToggleBMic", src)
end)

RegisterNetEvent('Mic:ToggleMic')
AddEventHandler('Mic:ToggleMic', function()
    local src = source
    TriggerClientEvent("Mic:ToggleMic", src)
end)

RegisterNetEvent('exile_weazel:giveItem')
AddEventHandler('exile_weazel:giveItem', function(itemName, itemCount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xItem = xPlayer.getInventoryItem(itemName)

    local countToAdd = itemCount

    if itemName == 'photos' then
        if xItem.count >= xItem.limit then
            xPlayer.showNotification('~r~Nie uniesiesz więcej zdjęć!')
            return
        elseif xItem.limit ~= -1 and (xItem.count + itemCount) > 100 then
            countToAdd = 100-xItem.count
        end
    else
        TriggerEvent("exilerp:banPlr", "nigger", source, string.format("Tried to give item %s (Prace legalne)", itemName))
    end

    xPlayer.addInventoryItem(xItem.name, countToAdd)
end)

ESX.RegisterServerCallback('exile_weazel:changeToAnother', function(source, cb, itemBeforeName, itemAfterName, countBefore)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItemBefore = xPlayer.getInventoryItem(itemBeforeName)
	local xItemAfter = xPlayer.getInventoryItem(itemAfterName)

	local itemCount = math.floor((countBefore / 5))

	if (countBefore - itemCount) <= 0 then
		xPlayer.setInventoryItem(xItemBefore.name, 0)
	else
		xPlayer.removeInventoryItem(xItemBefore.name, countBefore)
	end

	if (xItemAfter.count + itemCount) > xItemAfter.limit then
		xPlayer.setInventoryItem(xItemAfter.name, xItemAfter.limit)
	else
		xPlayer.addInventoryItem(xItemAfter.name, itemCount)
	end

	cb(itemCount)
end)

RegisterNetEvent(TRIGGER_SELL)
AddEventHandler(TRIGGER_SELL, function(token)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if token == SERVER_TOKEN then
        local xItem = xPlayer.getInventoryItem('gazeta')
        local reward = 360
        local total = xItem.count * reward
        if xItem.count == 20 then
            if xPlayer.secondjob.name == 'weazel' then
                if xPlayer.secondjob.grade == 8 then
                    total = total * 1.5
                elseif xPlayer.secondjob.grade == 7 then
                    total = total * 1.45
                elseif xPlayer.secondjob.grade == 6 then
                    total = total * 1.4
                elseif xPlayer.secondjob.grade == 5 then
                    total = total * 1.35
                elseif xPlayer.secondjob.grade == 4 then
                    total = total * 1.28
                elseif xPlayer.secondjob.grade == 3 then
                    total = total * 1.21
                elseif xPlayer.secondjob.grade == 2 then
                    total = total * 1.14
                elseif xPlayer.secondjob.grade == 1 then
                    total = total * 1.07
                elseif xPlayer.secondjob.grade == 0 then
                    total = total
                end

                if xPlayer.group == 'vip' then
                    total = total+(total*20)/100
                end

                if total < 80000 then
                    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_weazel', function(account)
                        account.addAccountMoney(total / 100 * 10)
                    end) 
                    xPlayer.addMoney(total)
                    xPlayer.showNotification('Otrzymano ~g~'..total..'$ ~s~za dostarczenie.')
                    exports['ocean_logs']:SendLog(xPlayer.source, "WEAZEL NEWS: Zakończono kurs. Zarobek: " ..total.. "$", 'weazel', '15844367')
                    if xItem.count >= 20 then
                        TriggerEvent('ExileRP:saveCours', xPlayer.secondjob.name, xPlayer.secondjob.grade, xPlayer.source)
                    end
                else
                    TriggerEvent("exilerp:banPlr", "nigger", source, "Tried to add money (Prace legalne)")
                end
            end
        else
            TriggerEvent("exilerp:banPlr", "nigger", source, "Tried to add money without secondjob (Prace legalne)")
        end
    else
        TriggerEvent("exilerp:banPlr", "nigger", source, "Tried to add money without a token (Prace legalne)")
    end
end)

local recived_token_weazel = {}
RegisterServerEvent('exile_weazel:request')
AddEventHandler('exile_weazel:request', function()
	if not recived_token_weazel[source] then
		TriggerClientEvent("exile_weazel:getrequest", source, SERVER_TOKEN, TRIGGER_SELL)
		recived_token_weazel[source] = true
	else
        TriggerEvent("exilerp:banPlr", "nigger", source, "Tried to get token (Prace legalne)")
	end
end)

AddEventHandler('playerDropped', function()
    recived_token_weazel[source] = nil
end)

local SmiecieSiedzace = {}
RegisterServerEvent('exile_weazel:insertPlayer')
AddEventHandler('exile_weazel:insertPlayer', function(tablice)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local insertLabel = GetPlayerName(_source)..' ['..xPlayer.character.firstname ..' '.. xPlayer.character.lastname..'] '..os.date("%H:%M:%S")
	table.insert(SmiecieSiedzace, {label = insertLabel, plate = tablice})
end)

ESX.RegisterServerCallback('exile_weazel:checkSiedzacy', function(source, cb)
	cb(SmiecieSiedzace)
end)

