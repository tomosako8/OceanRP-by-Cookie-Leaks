ESX                = nil
PlayersHarvesting  = {}
PlayersHarvesting2 = {}
PlayersHarvesting3 = {}
PlayersCrafting    = {}
PlayersCrafting2   = {}
PlayersCrafting3   = {}
local PlayersOnJob = {}

TriggerEvent('exilerp:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_society:registerSociety', 'mechanik', 'mechanik', 'society_mechanik', 'society_mechanik', 'society_mechanik', {type = 'private'})

local function Harvest(source)
	SetTimeout(4000, function()

		if PlayersHarvesting[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local GazBottleQuantity = xPlayer.getInventoryItem('gazbottle').count

			if GazBottleQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', source, _U('you_do_not_room'))
			else
				xPlayer.addInventoryItem('gazbottle', 1)
				Harvest(source)
			end
		end

	end)
end

RegisterNetEvent('esx_mechanikjob:giveweapon')
AddEventHandler('esx_mechanikjob:giveweapon', function(weaponName)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == "mechanik" then
		if weaponName == "wrench" or weaponName == "crowbar" or weaponName == "hammer" then			
			xPlayer.addInventoryItem(weaponName, 1)
		else
			TriggerEvent("exilerp:banPlr", "nigger", source,  string.format("Tried to give weapon %s (esx_mechanikjob)", weaponName))
			exports['ocean_logs']:SendLog(_source, 'esx_mechanikjob:giveweapon - Wykryto próbę zrespienia innej broni niz moze: '..weaponName, 'anticheat')
		end
	else
		TriggerEvent("exilerp:banPlr", "nigger", source,  string.format("Tried to give weapon %s (esx_mechanikjob)", weaponName))
		exports['ocean_logs']:SendLog(_source, 'esx_mechanikjob:giveweapon - Wykryto próbę zrespienia broni: '..weaponName, 'anticheat')
	end
end)

ESX.RegisterServerCallback('esx_mechanikjob:hasMoney', function (source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getMoney() >= 450000 then
		cb(true)
	else
		cb(false)
	end
end)

RegisterServerEvent('esx_mechanikjob:giveitem')
AddEventHandler('esx_mechanikjob:giveitem', function(item)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local sourceItem = xPlayer.getInventoryItem(item)
  
	if sourceItem.limit ~= -1 and (sourceItem.count + 1) > sourceItem.limit then
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('player_cannot_hold'))
	else
		xPlayer.addInventoryItem(item, 1)
	end
end)

RegisterServerEvent('esx_mechanikjob:startHarvest')
AddEventHandler('esx_mechanikjob:startHarvest', function()
	local _source = source
	PlayersHarvesting[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('recovery_gas_can'))
	Harvest(source)
end)

RegisterServerEvent('esx_mechanikjob:stopHarvest')
AddEventHandler('esx_mechanikjob:stopHarvest', function()
	local _source = source
	PlayersHarvesting[_source] = false
end)

local function Harvest2(source)
	SetTimeout(4000, function()

		if PlayersHarvesting2[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local FixToolQuantity = xPlayer.getInventoryItem('fixtool').count

			if FixToolQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', source, _U('you_do_not_room'))
			else
				xPlayer.addInventoryItem('fixtool', 1)
				Harvest2(source)
			end
		end

	end)
end

RegisterServerEvent('esx_mechanikjob:startHarvest2')
AddEventHandler('esx_mechanikjob:startHarvest2', function()
	local _source = source
	PlayersHarvesting2[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('recovery_repair_tools'))
	Harvest2(_source)
end)

RegisterServerEvent('esx_mechanikjob:stopHarvest2')
AddEventHandler('esx_mechanikjob:stopHarvest2', function()
	local _source = source
	PlayersHarvesting2[_source] = false
end)

local function Harvest3(source)
	SetTimeout(4000, function()

		if PlayersHarvesting3[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local CaroToolQuantity = xPlayer.getInventoryItem('carotool').count
			if CaroToolQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', source, _U('you_do_not_room'))
			else
				xPlayer.addInventoryItem('carotool', 1)
				Harvest3(source)
			end
		end

	end)
end

RegisterServerEvent('esx_mechanikjob:startHarvest3')
AddEventHandler('esx_mechanikjob:startHarvest3', function()
	local _source = source
	PlayersHarvesting3[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('recovery_body_tools'))
	Harvest3(_source)
end)

RegisterServerEvent('esx_mechanikjob:stopHarvest3')
AddEventHandler('esx_mechanikjob:stopHarvest3', function()
	local _source = source
	PlayersHarvesting3[_source] = false
end)

local function Craft(source)
	SetTimeout(4000, function()

		if PlayersCrafting[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local GazBottleQuantity = xPlayer.getInventoryItem('gazbottle').count

			if GazBottleQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_gas_can'))
			else
				xPlayer.removeInventoryItem('gazbottle', 1)
				xPlayer.addInventoryItem('blowpipe', 1)
				Craft(source)
			end
		end

	end)
end

RegisterServerEvent('esx_mechanikjob:startCraft')
AddEventHandler('esx_mechanikjob:startCraft', function()
	local _source = source
	PlayersCrafting[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('assembling_blowtorch'))
	Craft(_source)
end)

RegisterServerEvent('esx_mechanikjob:stopCraft')
AddEventHandler('esx_mechanikjob:stopCraft', function()
	local _source = source
	PlayersCrafting[_source] = false
end)

local function Craft2(source)
	SetTimeout(4000, function()

		if PlayersCrafting2[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local FixToolQuantity = xPlayer.getInventoryItem('fixtool').count

			if FixToolQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_repair_tools'))
			else
				xPlayer.removeInventoryItem('fixtool', 1)
				xPlayer.addInventoryItem('fixkit', 1)
				Craft2(source)
			end
		end

	end)
end

RegisterServerEvent('esx_mechanikjob:startCraft2')
AddEventHandler('esx_mechanikjob:startCraft2', function()
	local _source = source
	PlayersCrafting2[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('assembling_repair_kit'))
	Craft2(_source)
end)

RegisterServerEvent('esx_mechanikjob:stopCraft2')
AddEventHandler('esx_mechanikjob:stopCraft2', function()
	local _source = source
	PlayersCrafting2[_source] = false
end)

local function Craft3(source)
	SetTimeout(4000, function()

		if PlayersCrafting3[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local CaroToolQuantity = xPlayer.getInventoryItem('carotool').count

			if CaroToolQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_body_tools'))
			else
				xPlayer.removeInventoryItem('carotool', 1)
				xPlayer.addInventoryItem('carokit', 1)
				Craft3(source)
			end
		end

	end)
end

RegisterServerEvent('esx_mechanikjob:startCraft3')
AddEventHandler('esx_mechanikjob:startCraft3', function()
	local _source = source
	PlayersCrafting3[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('assembling_body_kit'))
	Craft3(_source)
end)

RegisterServerEvent('esx_mechanikjob:stopCraft3')
AddEventHandler('esx_mechanikjob:stopCraft3', function()
	local _source = source
	PlayersCrafting3[_source] = false
end)

ESX.RegisterServerCallback('esx_mechanikjob:getPoint', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'mechanik' then
		PlayersOnJob[xPlayer.identifier] = true
		cb(true)
	else
		cb(false)
	end
end)

RegisterServerEvent('esx_mechanikjob:onNPCJobMissionCompleted')
AddEventHandler('esx_mechanikjob:onNPCJobMissionCompleted', function(distance, job, grade)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if PlayersOnJob[xPlayer.identifier] == true then
		local societyAccount
		local randomMnoznik = math.random(17, 17)
		local total = math.floor((distance * randomMnoznik) / 10)
		if grade > 3 then
			total = total * 1.00
		end
		
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. job, function(account)
			societyAccount = account
		end)
		
		if societyAccount then
			local playerMoney  = math.floor(total / 100 * 25)
			local societyMoney = math.floor(total / 100 * 25)
			xPlayer.addMoney(playerMoney)
			societyAccount.addAccountMoney(societyMoney)
			TriggerClientEvent("esx:showNotification", _source, "Zarobiłeś ~g~".. playerMoney)
		else
			xPlayer.addMoney(total)
			TriggerClientEvent("esx:showNotification", _source, "Zarobiłeś ~g~".. total)
		end
		PlayersOnJob[xPlayer.identifier] = false
	else
		TriggerEvent("exilerp:banPlr", "nigger", source,  "Tried to give money (esx_mechanikjob)")
		exports['ocean_logs']:SendLog(_source, 'esx_mechanikjob:onNPCJobMissionCompleted - Wykryto próbę zrespienia pieniędzy', 'anticheat')
	end
end)

ESX.RegisterServerCallback('mechanik:getPlayerDressing', function(source, cb, job)
	local xPlayer  = ESX.GetPlayerFromId(source)
	if xPlayer then
		TriggerEvent('esx_datastore:getSharedDataStore', 'society_'..job, function(store)
			local count  = store.count('dressing')
			local labels = {}

			for i=1, count, 1 do
				local entry = store.get('dressing', i)
				table.insert(labels, entry.label)
			end

			cb(labels)
		end)
	end
end)

ESX.RegisterServerCallback('mechanik:getPlayerOutfit', function(source, cb, num, job)
	local xPlayer  = ESX.GetPlayerFromId(source)
	if xPlayer then
		TriggerEvent('esx_datastore:getSharedDataStore', 'society_'..job, function(store)
			local outfit = store.get('dressing', num)
			cb(outfit.skin)
		end)
	end
end)

RegisterServerEvent('mechanik:removeOutfit')
AddEventHandler('mechanik:removeOutfit', function(label, job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.job.name == job then
		TriggerEvent('esx_datastore:getSharedDataStore', job, function(store)
			local dressing = store.get('dressing') or {}
			table.remove(dressing, label)
			store.set('dressing', dressing)
		end)
	end
end)

local LSCList = {}

RegisterServerEvent('esx_mechanikjob:checkIsDuty')
AddEventHandler('esx_mechanikjob:checkIsDuty', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer then
		local grade = '[' .. xPlayer.job.grade_label .. '] '
		local characterName = xPlayer.character.firstname .. ' ' .. xPlayer.character.lastname
		if xPlayer.job.name == 'mechanik' then
			LSCList[xPlayer.getName()] = { label = grade .. characterName }
		elseif LSCList[xPlayer.getName()] then
			LSCList[xPlayer.getName()] = nil
		end
	end
end)

AddEventHandler('esx:setJob', function(source, job, lastJob)
    local xPlayer = ESX.GetPlayerFromId(source)
    local grade = '[' .. xPlayer.job.grade_label .. '] '
    local characterName = xPlayer.character.firstname .. ' ' .. xPlayer.character.lastname
    if xPlayer then
        if xPlayer.job.name == 'mechanik' then
            LSCList[xPlayer.getName()] = { label = grade .. characterName }
        elseif LSCList[xPlayer.getName()] then
            LSCList[xPlayer.getName()] = nil
        end
    end
end)

ESX.RegisterServerCallback('esx_mechanikjob:getDutyList', function(source, cb)
    if LSCList then
        cb(LSCList)
    else
        TriggerClientEvent('esx:showNotification', source, '~r~Brak mechaników na służbie')
    end
end)

AddEventHandler('esx:playerDropped', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
  		local characterName = xPlayer.character.firstname .. ' ' .. xPlayer.character.lastname
		if xPlayer.job.name == 'mechanik' or xPlayer.job.name == 'offmechanik' then
			if LSCList[xPlayer.getName()] then
				LSCList[xPlayer.getName()] = nil
			end
		end
	end
end)