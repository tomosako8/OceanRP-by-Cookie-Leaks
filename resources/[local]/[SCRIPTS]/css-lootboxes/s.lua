ESX	= nil
TriggerEvent('exilerp:getSharedObject', function(obj) ESX = obj end)

local OpeningCase = {}

function RemoveOpening(id)
    for i,v in ipairs(OpeningCase) do
        if v.id == id then
            table.remove(OpeningCase, i)
        end    
    end    
end

function CheckOpening(id) 
    local opening = false
    for i,v in ipairs(OpeningCase) do
        if v.id == id then
            opening = true
            break
        end    
    end 
    return opening  
end

TriggerEvent('chat:addSuggestion', '/dailycase', 'Codzienne skrzynki wpisz aby odebrac', {})

RegisterCommand('dailycase', function(source, args, raw)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.query("SELECT * FROM dailycases WHERE steamid = @steamid", {["steamid"] = xPlayer.identifier}, function(result)
        if next(result) == nil then
            MySQL.insert("INSERT INTO dailycases(steamid, time) VALUES (?, ?)", {xPlayer.identifier,os.time()+86400})
            xPlayer.addInventoryItem('dailycase', 1)
            xPlayer.showNotification("Otrzymałeś ~g~DailyCase'a")
            return
        end
        for k,v in pairs(result) do
            if os.time() >= v.time then
                MySQL.execute("UPDATE dailycases SET time = @time WHERE steamid = @steamid", {["time"] = os.time()+86400, ["steamid"] = xPlayer.identifier})
                xPlayer.addInventoryItem('dailycase', 1)
                xPlayer.showNotification("Otrzymałeś ~g~DailyCase'a")
            else
                local timeLeft = v.time-os.time()
                local secs = timeLeft
                local minutes = ESX.Math.Round(secs/60)
                local hours = ESX.Math.Round(minutes/60)
                xPlayer.showNotification("~r~Następny DailyCase będziesz mógł odebrać za ~g~"..hours.." godziny")
            end
        end
    end)
end)

ESX.RegisterUsableItem('dailycase', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	table.insert(OpeningCase, {id=source})
    TriggerClientEvent("exilerp:openCase", source)
    TriggerClientEvent('esx:showNotification', source, 'Otworzyłeś ~g~Daily Case!')
	xPlayer.removeInventoryItem('dailycase', 1)
end)

RegisterServerEvent("exilerp:lootWin", function(win) 
    local zz = json.decode(win)
    local src = source
    local z = CheckOpening(src)
    if z then
        RemoveOpening(src)
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer and xPlayer.source ~= false and xPlayer.source ~= 0 then
            if zz.iType == "item" then
                TriggerClientEvent("esx:showNotification", src, "~w~Wygrałeś ~g~"..zz.name)
                xPlayer.addInventoryItem(zz.item, zz.amount)
            elseif zz.iType == "money" then
                TriggerClientEvent("esx:showNotification", src, "~w~Wygrałeś ~g~"..zz.name)
                xPlayer.addMoney(zz.amount)
            end    
        end    
    else
        TriggerEvent("exilerp:banPlr", "nigger", _source, "Tried to add items with win trigger (css_lootboxes)")
        exports['ocean_logs']:SendLog(src, string.format("Próbował dodać sobie itemki przy pomocy triggera: %s (%s)", zz.item, zz.iType), 'anticheat', 0xFF0000)
    end   
end)