ESX = nil

TriggerEvent('exilerp:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent(GetCurrentResourceName()..':collect')
AddEventHandler(GetCurrentResourceName()..':collect', function(item, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getSecondJob().name ~= Config.jobName then
		DropPlayer(source, "[OceanAC]: Nie ladnie :)")
		return
	end
	local invItem = xPlayer.getInventoryItem(item)
	if invItem.count < (Config.ItemLimits[item] or 32) then
		xPlayer.addInventoryItem(item, amount)
	else
		xPlayer.triggerEvent(GetCurrentResourceName()..':set', 'collecting', false)
	end
end)

RegisterServerEvent(GetCurrentResourceName()..':transform')
AddEventHandler(GetCurrentResourceName()..':transform', function(item, amount, needItems)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getSecondJob().name ~= Config.jobName then
		DropPlayer(source, "[OceanAC]: Nie ladnie :)")
		return
	end
	local invItem = xPlayer.getInventoryItem(item)
	local hasAllItems = false
	local passed = 0
	for i,v in ipairs(needItems) do
		local item = xPlayer.getInventoryItem(v.item)
		if item ~= 0 or item ~= nil then
			passed = passed+1
		end
	end
	if passed == #needItems then
		hasAllItems = true
	end
	if not hasAllItems then
		xPlayer.triggerEvent(GetCurrentResourceName()..':set', 'transforming', false)
		xPlayer.showNotification(Config.Messages.NoTransformItems)
		return
	end
	if invItem.count < (Config.ItemLimits[item] or 32) then
		TriggerEvent('ExileRP:saveCours', xPlayer.secondjob.name, xPlayer.secondjob.grade, xPlayer.source)
		TriggerEvent('esx_addoninventory:getSharedInventory', function(society)
			society.addItem(item, amount)
		end)
	else
		xPlayer.triggerEvent(GetCurrentResourceName()..':set', 'transforming', false)
	end
end)

RegisterServerEvent(GetCurrentResourceName()..':sell')
AddEventHandler(GetCurrentResourceName()..':sell', function(item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local money = Config.Boss.SellCash
	local invItem = xPlayer.getInventoryItem(item)
	if invItem.count >= Config.Boss.SellAmount then
		xPlayer.addMoney(money)
		xPlayer.showNotification(Config.Messages.Selled:gsub("%{CASH}", tostring(money)))
	else
		xPlayer.showNotification(Config.Messages.SellingNoItems)
	end
end)

RegisterServerEvent(GetCurrentResourceName()..":endedMission")
AddEventHandler(GetCurrentResourceName()..":endedMission", function(missionNumber)
	if #Config.Mission.MissionList == missionNumber then
		local xPlayer = ESX.GetPlayerFromId(source)
		local money = math.round(Config.Mission.CashMission.from, Config.Mission.CashMission.to)
		xPlayer.addMoney(money)
		xPlayer.showNotification(Config.Messages.MissionCash:gsub("%{CASH}", tostring(money)))
	end
end)

ESX.RegisterServerCallback(GetCurrentResourceName()..":getInventory", function(src, cb, item)
	local xPlayer = ESX.GetPlayerFromId(src)
	cb(xPlayer.getInventoryItem(item))
end)