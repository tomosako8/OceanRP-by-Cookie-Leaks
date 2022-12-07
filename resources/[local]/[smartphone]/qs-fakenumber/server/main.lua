QSPhone = nil
TriggerEvent('qs-smartphone:CallBacks', function(Library) QSPhone = Library end)

ESX = nil
QS = nil
QBCore = nil

if Config.Framework == 'ESX' then
    TriggerEvent(Config.getSharedObject, function(obj) ESX = obj end)
    TriggerEvent('qs-base:getSharedObject', function(ASD) QS = ASD end)
elseif Config.Framework == 'QBCore' then
    QBCore = exports[Config.QBCoreGetCoreObject]:GetCoreObject()
    print('^4[qs-smartphone] ^2The QBCore version of Quasar Smartphone is running.^0')
end

local start = "1"
local finish = "9"
Citizen.CreateThread(function()
	for i = 1, (Config.NumberDigits - 1) do 
		start = start .. "1"
		finish = finish .. "9"
	end
	start = tonumber(start)
	finish = tonumber(finish)
end)

if Config.Framework == 'ESX' then
    ESX.RegisterUsableItem(Config.simitems, function(source)
        local itemsconfig = Config.simitems
        local player = GetPlayerFromIdFramework(source)
        local number = tostring(Config.NumberPrefix) .. math.random(start, finish)
        saveNewSim(source, number)
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.removeInventoryItem(itemsconfig, 1)
    end)
elseif Config.Framework == 'QBCore' then
    QBCore.Functions.CreateUseableItem(Config.simitems, function(source, item)
        local player = GetPlayerFromIdFramework(source)
        local number = tostring(Config.NumberPrefix) .. math.random(start, finish)
        saveNewSim(source, number)
        local xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.Functions.RemoveItem(Config.simitems, 1)
    end)
end

function saveNewSim(source, number, checkHas)
    local player = GetPlayerFromIdFramework(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local result = MySQL.Sync.fetchAll("SELECT * from phone_numbers where identifier = ? AND digit = ?", { player.identifier, xPlayer.getDigit() })
    if result and result[1] then
        local numbers = json.decode(result[1].data)
        if #numbers > 0 then
            local br = false
            if checkHas then 
                for _,v in pairs(numbers) do
                    if v == number then br = true end
                end
            end
            if br then return end
            table.insert(numbers, number)
            MySQL.Sync.execute('update phone_numbers set data = ? where identifier = ? and digit = ?', {json.encode(numbers), player.identifier, xPlayer.getDigit()})
        else
            local a = {}
            table.insert(a, number)
            MySQL.Sync.execute('insert into phone_numbers (?, ?, ?) values (?, ?, ?)', {player.identifier, json.encode(a), xPlayer.getDigit()})
        end
    else
        local a = {}
        table.insert(a, number)
        MySQL.Sync.execute('insert into phone_numbers (identifier, data, defaultNumber, digit) values (?, ?, ?, ?)', {player.identifier, json.encode(a), player.PlayerData.charinfo.phone, xPlayer.getDigit() })
    end
    TriggerClientEvent("qs-fakenumber:sendMessage", source, Lang("NEW_SIM") .. Config.NumberPrefix .. number, 'success')
end

function Lang(item)
    local lang = Config.Languages[Config.Language]

    if lang and lang[item] then
        return lang[item]
    end

    return item
end

QSPhone.RegisterServerCallback('qs-fakenumber:GetSims', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local player = GetPlayerFromIdFramework(source)
    local result = MySQL.Sync.fetchAll("SELECT * from phone_numbers where identifier = ? AND digit = ?", {player.identifier, xPlayer.getDigit()})
    if result[1] then
        cb(json.decode(result[1].data))
    else
        cb(false)
    end
end)

RegisterNetEvent('qs-fakenumber:newPhone')
AddEventHandler('qs-fakenumber:newPhone', function(phone)
    if Config.Framework == 'ESX' then
        local src = source
        local player = GetPlayerFromIdFramework(src)
        local oldPhone = player.PlayerData.charinfo.phone
        saveNewSim(src, oldPhone, true)
        player.SetPhoneNumber(phone)
        TriggerClientEvent("qs-fakenumber:sendMessage", player.source, Lang("CHANGE_NUMBER_SUCCESS").. ' '..phone..' '..Lang("CHANGE_NUMBER_OLD")..' '..oldPhone, 'success')
        TriggerClientEvent('qs-smartphone:RefreshContacts', src)
    elseif Config.Framework == 'QBCore' then
        local src = source
        local player = GetPlayerFromIdFramework(src)
        if player then 
            local oldPhone = player.PlayerData.charinfo.phone
            player.Functions.SetPhoneNumber(phone)
            saveNewSim(src, oldPhone, true)
            TriggerClientEvent("qs-fakenumber:sendMessage", player.source, Lang("CHANGE_NUMBER_SUCCESS").. ' '..phone..' '..Lang("CHANGE_NUMBER_OLD")..' '..oldPhone, 'success')
            TriggerClientEvent('qs-smartphone:RefreshContacts', src)
        end

    end
end)