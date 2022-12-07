ESX = nil

TriggerEvent('exilerp:getSharedObject', function(obj)
	ESX = obj
	Config.check()
end)

local DATA = {}

AddEventHandler('onResourceStart', function(resource)
	if GetCurrentResourceName() == resource then
		local cayoMines = {}
		MySQL.query("SELECT * FROM cayo_mines", {}, function(result)
			for _,v in ipairs(result) do
				table.insert(cayoMines, {id = v.id, pos = json.decode(v.position)})
			end
		end)
		local cayoSchowki = {}
		MySQL.query("SELECT * FROM cayo_schowki", {}, function(result)
			for _,v in ipairs(result) do
				table.insert(cayoSchowki, {name = v.name, contents = json.decode(v.contents)})
			end
		end)
		MySQL.query("SELECT * FROM cayo_config", {}, function(result)
			for _,v in ipairs(result) do
				DATA.cayoConfig = json.decode(v.cayoconfig)
			end
		end)
		local cayoEmployee = {}
		MySQL.query("SELECT * FROM users WHERE job = @job", {["@job"] = 'org17'}, function(result)
			for _,v in ipairs(result) do
				MySQL.query("SELECT label FROM job_grades WHERE job_name = @job_name AND grade = @grade", {["job_name"] = v.job, ["grade"] = v.job_grade}, function(result2)
					table.insert(cayoEmployee, {job = v.job, grade = v.job_grade, joblabel = result2[1].label, firstname = v.firstname, lastname = v.lastname})
				end)
			end
		end)
		DATA.cayoMines = cayoMines
		DATA.cayoSchowki = cayoSchowki
		DATA.cayoEmployee = cayoEmployee
		Citizen.CreateThread(function()
			while true do
				Citizen.Wait(1000)
				TriggerEvent('cayo_perico:sendDATA')
			end
		end)
	end
end)

RegisterCommand('removeitem', function(source, args, raw)
		local xTarget = ESX.GetPlayerFromId(tonumber(args[0]))
		local item = args[1]
		local amount = tonumber(args[2])
		xTarget.removeInventoryItem(item, amount)
end)

RegisterServerEvent('cayo_perico:buyUpgrade')
AddEventHandler('cayo_perico:buyUpgrade', function(upgrade)
	local xPlayer = ESX.GetPlayerFromId(source)
	if upgrade == 'ponton' then
		if xPlayer.getMoney() >= 25000 then
			xPlayer.removeMoney(25000)
			DATA.cayoConfig.boughtPonton = true
			MySQL.execute("UPDATE cayo_config SET cayoconfig = @cayocfg", {["cayocfg"] = json.encode(DATA.cayoConfig)})
			xPlayer.showNotification("Zakupiles ponton dla kartelu")
		else
			xPlayer.showNotification("Nie posiadasz wystarczajaco pieniedzy")
		end
	elseif upgrade == 'prom' then
		if xPlayer.getMoney() >= 200000 then
			xPlayer.removeMoney(200000)
			DATA.cayoConfig.boughtProm = true
			MySQL.execute("UPDATE cayo_config SET cayoconfig = @cayocfg", {["cayocfg"] = json.encode(DATA.cayoConfig)})
			xPlayer.showNotification("Zakupiles prom dla kartelu do san andreas")
		else
			xPlayer.showNotification("Nie posiadasz wystarczajaco pieniedzy")
		end
	end
end)

RegisterServerEvent('cayo_perico:recruitPlayer')
AddEventHandler('cayo_perico:recruitPlayer', function(serverID)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(serverID)
	xTarget.setJob('org17', 0)
	xTarget.showNotification("Zostałeś zatrudniony do kartelu ~g~Cayo Perico")
	xPlayer.showNotification("Zatrudniłeś ~g~"..xTarget.getName())
end)

ESX.RegisterServerCallback('cayo_perico:getInventoryPlayer', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb(xPlayer.getInventory())
end)

ESX.RegisterServerCallback('cayo_perico:getEmployees', function(source, cb)
	cb(DATA.cayoEmployee)
end)

ESX.RegisterServerCallback('cayo_perico:runAction', function(source, cb, action)
	local callback = false
	if action.action == 'getmoney' then
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_org17', function(account)
			print(account.account_money.."/"..account.money)
			callback = account.account_money
		end)
	elseif action.action == 'addmoney' then
		local xPlayer = ESX.GetPlayerFromId(source)
		if xPlayer.getMoney() >= action.amount then
			xPlayer.removeMoney(action.amount)
			TriggerEvent('esx_addonaccount:getSharedAccount', 'society_org17', function(account)
				account.addAccountMoney(action.amount)
				callback = true
			end)
		else
			xPlayer.showNotification("Nie masz tyle pieniedzy")
		end
	elseif action.action == 'removemoney' then
		local xPlayer = ESX.GetPlayerFromId(source)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_org17', function(account)
			if account.money >= action.amount then
				account.removeAccountMoney(action.amount)
				xPlayer.addMoney(action.amount)
				callback = true
			else
				xPlayer.showNotification("Twoj kartel nie ma tyle pieniedzy")
			end
		end)
	elseif action.action == 'getemployee' then

	end
	cb(callback)
end)

RegisterServerEvent('cayo_perico:addToSchowek')
AddEventHandler('cayo_perico:addToSchowek', function(name, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	for i,v in ipairs(DATA.cayoSchowki) do
		if v.name == name then
			for index,value in ipairs(DATA.cayoSchowki[i].contents) do
				if value.item == item.item then
					DATA.cayoSchowki[i].contents[index].count = DATA.cayoSchowki[i].contents[index].count+item.count
					MySQL.execute("UPDATE cayo_schowki SET contents = @contents WHERE name = @name", {["@contents"] = json.encode(DATA.cayoSchowki[i].contents), ["@name"] = name})
					xPlayer.removeInventoryItem(item.item, item.count)
					TriggerEvent('cayo_perico:sendDATA')
					return
				end
			end
			table.insert(DATA.cayoSchowki[i].contents, item)
			MySQL.execute("UPDATE cayo_schowki SET contents = @contents WHERE name = @name", {["@contents"] = json.encode(DATA.cayoSchowki[i].contents), ["@name"] = name})
			break
		end
	end
	xPlayer.removeInventoryItem(item.item, item.count)
	TriggerEvent('cayo_perico:sendDATA')
end)

RegisterServerEvent('cayo_perico:removeFromSchowek')
AddEventHandler('cayo_perico:removeFromSchowek', function(name, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	for i,v in ipairs(DATA.cayoSchowki) do
		if v.name == name then
			for index,value in ipairs(DATA.cayoSchowki[i].contents) do
				if value.item == item.item then
					DATA.cayoSchowki[i].contents[index].count = DATA.cayoSchowki[i].contents[index].count-item.count
					MySQL.execute("UPDATE cayo_schowki SET contents = @contents WHERE name = @name", {["@contents"] = json.encode(DATA.cayoSchowki[i].contents), ["@name"] = name})
					xPlayer.addInventoryItem(item.item, item.count)
					TriggerEvent('cayo_perico:sendDATA')
					return
				end
			end
			table.remove(DATA.cayoSchowki[i].contents, item)
			MySQL.execute("UPDATE cayo_schowki SET contents = @contents WHERE name = @name", {["@contents"] = json.encode(DATA.cayoSchowki[i].contents), ["@name"] = name})
			break
		end
	end
	xPlayer.addInventoryItem(item.item, item.count)
	TriggerEvent('cayo_perico:sendDATA')
end)

function createMineBomb(coords)
	MySQL.insert("INSERT INTO cayo_mines(position) VALUES (?)", {json.encode(coords)})
	table.insert(DATA.cayoMines, {id = #DATA.cayoMines+1, pos = coords})
end

function mineExploded(id, position, source)
	MySQL.execute("DELETE FROM cayo_mines WHERE id = @id", {["@id"] = id})
	removeMine(position)
	TriggerClientEvent('cayo_perico:catchMinesExploded', source, position)
end

function removeMine(coords)
	for _,v in ipairs(DATA.cayoMines) do
		if v.pos.x == coords.x and v.pos.y == coords.y then
			table.remove(DATA.cayoMines, _)
			TriggerEvent('cayo_perico:sendDATA')
			break
		end
	end
end

ESX.RegisterUsableItem('cayo_mine', function(playerId)
	local xPlayer = ESX.GetPlayerFromId(playerId)
	xPlayer.removeInventoryItem('cayo_mine', 1)
	TriggerClientEvent('cayo_perico:placeMine', playerId)
end)

ESX.RegisterUsableItem('cayopackstatue', function(playerId)
	local xPlayer = ESX.GetPlayerFromId(playerId)
	xPlayer.removeInventoryItem('cayopackstatue', 1)
	xPlayer.addInventoryItem('coke_pooch', 30)
	xPlayer.showNotification("Rozbito figurkę...")
end)

RegisterServerEvent('cayo_perico:gainLeaves')
AddEventHandler('cayo_perico:gainLeaves', function(gained)
	local xPlayer = ESX.GetPlayerFromId(source)
	local hasItem = xPlayer.getInventoryItem('cocaineleaves')
	if hasItem and hasItem.count < 100 and (hasItem.count+gained) <= 100 then
		xPlayer.addInventoryItem('cocaineleaves', gained)
	else
		if hasItem.count ~= 100 then
			xPlayer.addInventoryItem('cocaineleaves', (hasItem.count-(hasItem.count-gained)))
		end
		xPlayer.showNotification("Masz przy sobie juz maksymalna ilosc lisci!")
	end
end)

RegisterServerEvent('cayo_perico:placeMine')
AddEventHandler('cayo_perico:placeMine', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local coords = xPlayer.getCoords(true)
	local pos = {x = coords.x, y = coords.y, z = coords.z-4}
	createMineBomb(pos)
end)

RegisterServerEvent('cayo_perico:mineExploded')
AddEventHandler('cayo_perico:mineExploded', function(id, coords)
	mineExploded(id, coords, source)
end)

RegisterServerEvent('cayo_perico:sendDATA')
AddEventHandler('cayo_perico:sendDATA', function()
	for _,xPlayer in pairs(ESX.GetExtendedPlayers()) do
		TriggerClientEvent('cayo_perico:catchDATA', xPlayer.source, DATA)
	end 
end)

RegisterServerEvent('cayo_perico:leavesCD')
AddEventHandler('cayo_perico:leavesCD', function(data)
	local _source = source
	ESX.SetTimeout(data.cd*1000,function()
		TriggerClientEvent('cayo_perico:leavesCan', _source, data.object)
	end)
end)


RegisterServerEvent('cayo_perico:cocaineStatue')
AddEventHandler('cayo_perico:cocaineStatue', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local hasItem = xPlayer.getInventoryItem('cayostatue')
	if hasItem and hasItem.count >= 1 then
		xPlayer.addInventoryItem('cayopackstatue', 1)
		xPlayer.removeInventoryItem('cayostatue', 1)
	else
		TriggerClientEvent('cayo_perico:turnOffStatue', source)
	end
end)

RegisterServerEvent('cayo_perico:cocaineTransform')
AddEventHandler('cayo_perico:cocaineTransform', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local hasItem = xPlayer.getInventoryItem('cocaineleaves')
	if hasItem and hasItem.count >= 20 then
		xPlayer.addInventoryItem('cayostatue', 1)
		xPlayer.removeInventoryItem('cocaineleaves', 20)
	else
		TriggerClientEvent('cayo_perico:turnOffTransform', source)
	end
end)