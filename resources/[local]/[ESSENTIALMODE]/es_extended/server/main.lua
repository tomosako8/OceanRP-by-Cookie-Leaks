SetConvarReplicated("serverType", GetConvar("serverType", "wloff"))

function getServer() 
	return GetConvar("serverType", "wloff")
end

RegisterNetEvent('esx:onPlayerJoined')
AddEventHandler('esx:onPlayerJoined', function()
	if not ESX.Players[source] then
		onPlayerJoined(source)
	end
end)

RegisterNetEvent('esx:updateWeaponAmmo')
AddEventHandler('esx:updateWeaponAmmo', function(weaponName, ammoItem, ammoCount, cos)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	if xPlayer then
		TriggerClientEvent('esx:setWeaponAmmo', src, weaponName, ammoCount)
		if cos then
			xPlayer.removeInventoryItem(ammoItem, 1, true)
		end
	end
end)

ESX.RegisterUsableItem('clip', function(source)	
	TriggerClientEvent('es_extended:weaponClips', source, 'clip')
end)

ESX.RegisterUsableItem('extendedclip', function(source)	
	TriggerClientEvent('es_extended:weaponClips', source, 'extendedclip')
end)

ESX.RegisterUsableItem('clipsmg', function(source)	
	TriggerClientEvent('es_extended:weaponClips', source, 'clipsmg')
end)

ESX.RegisterUsableItem('clipaddons', function(source)	
	TriggerClientEvent('es_extended:weaponClips', source, 'clipaddons')
end)

RegisterServerEvent('es_extended:removeClip')
AddEventHandler('es_extended:removeClip', function(extended)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	local item = xPlayer.getInventoryItem(extended).count 
	if item >= 1 then
		xPlayer.removeInventoryItem(extended, 1)
	end
end)

RegisterNetEvent('es_extended:giveClip')
AddEventHandler('es_extended:giveClip', function(extended)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer ~= nil then
		if extended then
			if xPlayer.canCarryItem(extended, 1) then
				xPlayer.addInventoryItem(extended, 1)
			else	
				xPlayer.showNotification('~s~Nie możesz mieć więcej magazynków')
			end
		end
	end
end)

RegisterNetEvent('es_extended:giveAmmo')
AddEventHandler('es_extended:giveAmmo', function(ammoItem, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if ammoItem == 'pistol_ammo' or ammoItem == 'rifle_ammo' or ammoItem == 'smg_ammo' or ammoItem == 'shotgun_ammo' or ammoItem == 'sniper_ammo' then
		if count == 32 then
			xPlayer.addInventoryItem(ammoItem, count)
		else
			TriggerEvent("exilerp:banPlr", "nigger", _source, "Cheating (es_extended)")
		end
	else
		TriggerEvent("exilerp:banPlr", "nigger", _source, "Cheating (es_extended)")
	end
end)

RegisterNetEvent('es_extended:componentMenu')
AddEventHandler('es_extended:componentMenu', function(state, comp)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if state then
		xPlayer.removeInventoryItem(comp, 1)
	else
		xPlayer.addInventoryItem(comp, 1)
	end
end)

function onPlayerJoined(playerId)
	local identifier = ESX.GetIdentifier(playerId)
	if identifier then
		if ESX.GetPlayerFromIdentifier(identifier) then
			DropPlayer(playerId, ('there was an error loading your character!\nError code: identifier-active-ingame\n\nThis error is caused by a player on this server who has the same identifier as you have. Make sure you are not playing on the same Rockstar account.\n\nYour Rockstar identifier: %s'):format(identifier))
		else
			local result = MySQL.scalar.await('SELECT 1 FROM users WHERE identifier = ?', { identifier })
			if result then
				loadESXPlayer(identifier, playerId, false)
			else
				local accounts = {}

				for account,money in pairs(Config.StartingAccountMoney) do
					accounts[account] = money
				end

				MySQL.update('INSERT INTO users (accounts, identifier) VALUES (@accounts, @identifier)', {
					['@accounts'] = json.encode(accounts),
					['@identifier'] = identifier
				}, function(rowsChanged)
					loadESXPlayer(identifier, playerId)
				end)
			end
		end
	else
		DropPlayer(playerId, 'there was an error loading your character!\nError code: identifier-missing-ingame\n\nThe cause of this error is not known, your identifier could not be found. Please come back later or report this problem to the server administration team.')
	end
end

function loadESXPlayer(identifier, playerId)
	local tasks = {}
	local userData = {
		accounts = {},
		inventory = {},
		job = {},
		character    = {},
		playerName = GetPlayerName(playerId),
		secondjob    = {},
		thirdjob    = {},
		dealerLevel  = {},
		digit        = 0,
		slot = {},
		opaska 		 = 0,
		components = {},
		status = {}
	}

	table.insert(tasks, function(cb)
		MySQL.query('SELECT * FROM users WHERE identifier = ?', {identifier}, function(result)
			local job, grade, jobObject, gradeObject = result[1].job, tostring(result[1].job_grade)
			local secondjob, secondjobgrade = result[1].secondjob, tostring(result[1].secondjob_grade)
			local thirdjob, thirdjobgrade = result[1].thirdjob, tostring(result[1].thirdjob_grade)
			local foundAccounts, foundItems = {}, {}
		
				-- Accounts
			if result[1].accounts and result[1].accounts ~= '' then
				local accounts = json.decode(result[1].accounts)

				for account,money in pairs(accounts) do
					foundAccounts[account] = money
				end
			end
				
			for account,label in pairs(Config.Accounts) do
				table.insert(userData.accounts, {
					name = account,
					money = foundAccounts[account] or Config.StartingAccountMoney[account] or 0,
					label = label
				})
			end

				-- Job
			if ESX.DoesJobExist(job, grade) then
				jobObject, gradeObject = ESX.Jobs[job], ESX.Jobs[job].grades[grade]
			else
				print(('[es_extended] [^3WARNING^7] Ignoring invalid job for %s [job: %s, grade: %s]'):format(identifier, job, grade))
				job, grade = 'unemployed', '0'
				jobObject, gradeObject = ESX.Jobs[job], ESX.Jobs[job].grades[grade]
			end

				-- SecondJOB
			if ESX.DoesJobExist(secondjob, secondjobgrade) then
				local jobObject, gradeObject = ESX.Jobs[secondjob], ESX.Jobs[secondjob].grades[secondjobgrade]

				userData.secondjob = {}

				userData.secondjob.id    = jobObject.id
				userData.secondjob.name  = jobObject.name
				userData.secondjob.label = jobObject.label

				userData.secondjob.grade        = tonumber(secondjobgrade)
				userData.secondjob.grade_name   = gradeObject.name
				userData.secondjob.grade_label  = gradeObject.label
				userData.secondjob.grade_salary = gradeObject.salary

				userData.secondjob.skin_male    = {}
				userData.secondjob.skin_female  = {}

				if gradeObject.skin_male ~= nil then
					userData.secondjob.skin_male = json.decode(gradeObject.skin_male)
				end
	
				if gradeObject.skin_female ~= nil then
					userData.secondjob.skin_female = json.decode(gradeObject.skin_female)
				end

			else
				print(('[es_extended] [^3WARNING^7] Ignoring invalid secondjob for %s [secondjob: %s, secondjobgrade: %s]'):format(identifier, secondjob, secondjobgrade))
				local secondjob, secondjobgrade = 'unemployed', '0'
				local jobObject, gradeObject = ESX.Jobs[secondjob], ESX.Jobs[secondjob].grades[secondjobgrade]

				userData.secondjob = {}

				userData.secondjob.id    = jobObject.id
				userData.secondjob.name  = jobObject.name
				userData.secondjob.label = jobObject.label
	
				userData.secondjob.grade        = tonumber(secondjobgrade)
				userData.secondjob.grade_name   = gradeObject.name
				userData.secondjob.grade_label  = gradeObject.label
				userData.secondjob.grade_salary = gradeObject.salary
	
				userData.secondjob.skin_male    = {}
				userData.secondjob.skin_female  = {}
			end

				-- ThirdJOB
			if ESX.DoesJobExist(thirdjob, thirdjobgrade) then
				local jobObject, gradeObject = ESX.Jobs[thirdjob], ESX.Jobs[thirdjob].grades[thirdjobgrade]

				userData.thirdjob = {}

				userData.thirdjob.id    = jobObject.id
				userData.thirdjob.name  = jobObject.name
				userData.thirdjob.label = jobObject.label

				userData.thirdjob.grade        = tonumber(thirdjobgrade)
				userData.thirdjob.grade_name   = gradeObject.name
				userData.thirdjob.grade_label  = gradeObject.label
				userData.thirdjob.grade_salary = gradeObject.salary

				userData.thirdjob.skin_male    = {}
				userData.thirdjob.skin_female  = {}

				if gradeObject.skin_male ~= nil then
					userData.thirdjob.skin_male = json.decode(gradeObject.skin_male)
				end
	
				if gradeObject.skin_female ~= nil then
					userData.thirdjob.skin_female = json.decode(gradeObject.skin_female)
				end

			else
				print(('[es_extended] [^3WARNING^7] Ignoring invalid thirdjob for %s [thirdjob: %s, thirdjobgrade: %s]'):format(identifier, thirdjob, thirdjobgrade))
				local thirdjob, thirdjobgrade = 'unemployed', '0'
				local jobObject, gradeObject = ESX.Jobs[thirdjob], ESX.Jobs[thirdjob].grades[thirdjobgrade]

				userData.thirdjob = {}

				userData.thirdjob.id    = jobObject.id
				userData.thirdjob.name  = jobObject.name
				userData.thirdjob.label = jobObject.label
	
				userData.thirdjob.grade        = tonumber(thirdjobgrade)
				userData.thirdjob.grade_name   = gradeObject.name
				userData.thirdjob.grade_label  = gradeObject.label
				userData.thirdjob.grade_salary = gradeObject.salary
	
				userData.thirdjob.skin_male    = {}
				userData.thirdjob.skin_female  = {}
			end
			

			userData.job.id = jobObject.id
			userData.job.name = jobObject.name
			userData.job.label = jobObject.label

			userData.job.grade = tonumber(grade)
			userData.job.grade_name = gradeObject.name
			userData.job.grade_label = gradeObject.label
			userData.job.grade_salary = gradeObject.salary

			userData.job.skin_male = {}
			userData.job.skin_female = {}

			if gradeObject.skin_male then userData.job.skin_male = json.decode(gradeObject.skin_male) end
			if gradeObject.skin_female then userData.job.skin_female = json.decode(gradeObject.skin_female) end

			-- Inventory
			if result[1].inventory and result[1].inventory ~= '' then
				local inventory = json.decode(result[1].inventory)

				for name,count in pairs(inventory) do
					local item = ESX.Items[name]
					
					if item then						
						if type(item.data) =='string' then
							item.data = json.decode(item.data)
						end
				
						table.insert(userData.inventory, {
							name = name,
							count = count,
							label = item.label,
							limit = item.limit,
							usable = ESX.UsableItemsCallbacks[name] ~= nil,
							rare = item.rare,
							canRemove = item.canRemove,
							type = item.type,
							data = item.data
						})
					end
				end
			end

			table.sort(userData.inventory, function(a, b)
				return a.label < b.label
			end)
			
				-- Slot
			if result[1].slot then
				userData.slot = json.decode(result[1].slot)
			end
			
				-- Group
			if result[1].group then
				userData.group = result[1].group
			else
				userData.group = 'user'
			end

				-- Position
			if result[1].position and result[1].position ~= '' then
				userData.coords = json.decode(result[1].position)
			else
				userData.coords = {x = -269.4, y = -955.3, z = 31.2, heading = 205.8}
			end

				-- Skin
			if result.skin and result.skin ~= '' then
				userData.skin = json.decode(result.skin)
			else
				if userData.sex == 'f' then userData.skin = {sex=1} else userData.skin = {sex=0} end
			end
			
				-- Dealer
			if result[1].dealerLevel then
				userData.dealerLevel = json.decode(result[1].dealerLevel)
			end
			
				-- CharID
			if result[1].digit ~= nil then
				userData.digit = result[1].digit
			end
			
				--components
			if result[1].components then
				userData.components = json.decode(result[1].components)
			end
			
				-- Identity
			if result[1].firstname and result[1].lastname ~= '' then
				userData.character.firstname 		= result[1].firstname
				userData.character.lastname 		= result[1].lastname
				userData.character.dateofbirth  	= result[1].dateofbirth
				userData.character.sex				= result[1].sex
				userData.character.height			= result[1].height
				userData.character.status 			= result[1].status
				userData.character.phone_number 	= result[1].phone_number
				userData.character.pincode 	= result[1].pincode
				userData.character.job_id 			= result[1].job_id
				userData.character.opaska			= result[1].opaska
				userData.character.components		= result[1].components
			end

			if result[1].status then
				local data = result[1].status
				if data == '[]' or data == 'null' then
					data = {}
					table.insert(data, {
							percent = 100.0,
							val = 3600000,
							name = "hunger"
						})
					table.insert(data, {
							percent = 100.0,
							val = 3600000,
							name = "thirst"
						})
					table.insert(data, {
							percent = 0.0,
							val = 0,
							name = "drug"
						})
					table.insert(data, {
							percent = 0.0,
							val = 0,
							name = "drunk"
						})
					userData.status = data
					MySQL.update('UPDATE users SET status = ? WHERE identifier = ?', {json.encode(data),identifier})
				else
					userData.status = json.decode(result[1].status)
				end
			end

	
			cb()
		end)
	end)

	Async.parallel(tasks, function(results)
		local xPlayer = CreateExtendedPlayer(playerId, identifier, userData.group, userData.accounts, userData.inventory, userData.job, userData.playerName, userData.coords, userData.character, userData.secondjob, userData.thirdjob, userData.dealerLevel, userData.digit, userData.slot, userData.components, userData.status)
		ESX.Players[playerId] = xPlayer
		TriggerEvent('esx:playerLoaded', playerId, xPlayer)

		xPlayer.triggerEvent('esx:playerLoaded', {
			accounts = xPlayer.getAccounts(),
			coords = xPlayer.getCoords(),
			identifier = xPlayer.getIdentifier(),
			inventory = xPlayer.getInventory(),
			job = xPlayer.getJob(),
			money = xPlayer.getMoney(),
			character	 = xPlayer.getCharacter(),
			secondjob	 = xPlayer.getSecondJob(),
			thirdjob	 = xPlayer.getThirdJob(),
			dealerLevel  = xPlayer.getDealerLevel(),
			digit 		 = xPlayer.getDigit(),
			slots 		 = xPlayer.getSlots(),
			group 		 = xPlayer.getGroup(),
			components	 = xPlayer.getComponents(),
			status       = xPlayer.getStatus()
		})

		xPlayer.triggerEvent('esx:registerSuggestions', ESX.RegisteredCommands)
		xPlayer.triggerEvent('EasyAdmin:refreshPermission')
	end)
end

AddEventHandler('chatMessage', function(playerId, author, message)
	if message:sub(1, 1) == '/' and playerId > 0 then
		CancelEvent()
		local commandName = message:sub(1):gmatch("%w+")()
	end
end)

AddEventHandler('playerDropped', function(reason)
	local playerId = source
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer then
		TriggerEvent('esx:playerDropped', playerId, reason)

		ESX.SavePlayer(xPlayer, function()
			ESX.Players[playerId] = nil
		end)
	end
end)

RegisterNetEvent('esx:updateSlots')
AddEventHandler('esx:updateSlots', function(slots)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer then
		xPlayer.setSlots(slots)
	end
end)

RegisterNetEvent('esx:updateCoords')
AddEventHandler('esx:updateCoords', function(coords)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer then
		xPlayer.updateCoords(coords)
	end
end)

RegisterNetEvent('esx:gitestveInventoryItem')
AddEventHandler('esx:gitestveInventoryItem', function(target, type, itemName, itemCount)
	local playerId = source
	local sourceXPlayer = ESX.GetPlayerFromId(playerId)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	local distance = #(GetEntityCoords(GetPlayerPed(playerId)) - GetEntityCoords(GetPlayerPed(target)))
	if not sourceXPlayer then return end
	if not targetXPlayer then TriggerEvent("exilerp:banPlr", "nigger", playerId, "Cheating (es_extended)") return end
	if distance > 5.0 then TriggerEvent("exilerp:banPlr", "nigger", playerId, "Cheating (es_extended)") return end

	if type == 'item_standard' or type == 'item_weapon' or type == 'item_sim' then
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)
		local targetItem = targetXPlayer.getInventoryItem(itemName)

		if itemCount > 0 and sourceItem.count >= itemCount then
			if targetXPlayer.canCarryItem(itemName, itemCount) then
				sourceXPlayer.removeInventoryItem(itemName, itemCount)
				targetXPlayer.addInventoryItem(itemName, itemCount)

			
				sourceXPlayer.showNotification(_U('gave_item', itemCount, sourceItem.label, targetXPlayer.source))
				targetXPlayer.showNotification(_U('received_item', itemCount, sourceItem.label, sourceXPlayer.source))
				TriggerClientEvent('sendProximityMessageDo', -1, playerId, playerId, "Przekazuje przedmiot")
				exports['ocean_logs']:SendLog(playerId, "Przekazano przedmiot: " .. sourceItem.label .. " x" .. itemCount .. " dla [" .. target .. "] " .. GetPlayerName(target), 'item_give', '2123412')			
			else
				sourceXPlayer.showNotification(_U('ex_inv_lim', targetXPlayer.name))
			end
		else
			sourceXPlayer.showNotification(_U('imp_invalid_quantity'))
		end
	elseif type == 'item_account' then
		if itemCount > 0 and sourceXPlayer.getAccount(itemName).money >= itemCount then
			sourceXPlayer.removeAccountMoney(itemName, itemCount)
			targetXPlayer.addAccountMoney   (itemName, itemCount)

			sourceXPlayer.showNotification(_U('gave_account_money', ESX.Math.GroupDigits(itemCount), Config.Accounts[itemName], targetXPlayer.source))
			targetXPlayer.showNotification(_U('received_account_money', ESX.Math.GroupDigits(itemCount), Config.Accounts[itemName], sourceXPlayer.source))
			TriggerClientEvent('sendProximityMessageDo', -1, playerId, playerId, "Przekazuje pieniądze")
			exports['ocean_logs']:SendLog(playerId, "Przekazano pieniądze: " .. ESX.Math.GroupDigits(itemCount) .. "$ dla [" .. target .. "] " .. GetPlayerName(target), 'item_give', '15844367')
		else
			sourceXPlayer.showNotification(_U('imp_invalid_amount'))
		end
	end
end)

RegisterNetEvent('esx:removeInventoryItem')
AddEventHandler('esx:removeInventoryItem', function(type, itemName, itemCount)
	local playerId = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if type == 'item_standard' or type == 'item_weapon' or type == 'item_sim' then
		if itemCount == nil or itemCount < 1 then
			xPlayer.showNotification(_U('imp_invalid_quantity'))
		else
			local xItem = xPlayer.getInventoryItem(itemName)

			if (itemCount > xItem.count or xItem.count < 1) then
				xPlayer.showNotification(_U('imp_invalid_quantity'))
			else
				xPlayer.removeInventoryItem(itemName, itemCount)
				xPlayer.showNotification(_U('threw_standard', itemCount, xItem.label))
				TriggerClientEvent('sendProximityMessageDo', -1, playerId, playerId, "Upuścił przedmiot")
				exports['ocean_logs']:SendLog(playerId, "Wyrzucono przedmiot: " .. xItem.label .. " x" .. itemCount, 'item_drop', '2123412')
			end
		end
	elseif type == 'item_account' then
		if itemCount == nil or itemCount < 1 then
			xPlayer.showNotification(_U('imp_invalid_amount'))
		else
			local account = xPlayer.getAccount(itemName)

			if (itemCount > account.money or account.money < 1) then
				xPlayer.showNotification(_U('imp_invalid_amount'))
			else
				xPlayer.removeAccountMoney(itemName, itemCount)
				xPlayer.showNotification(_U('threw_account', ESX.Math.GroupDigits(itemCount), string.lower(account.label)))
				TriggerClientEvent('sendProximityMessageDo', -1, playerId, playerId, "Upuścił pieniądze")
				exports['ocean_logs']:SendLog(playerId, "Wyrzucono pieniądze: " .. ESX.Math.GroupDigits(itemCount) .. "$", 'item_drop', '15844367')
			end
		end
	end
end)

RegisterNetEvent('esx:useItem')
AddEventHandler('esx:useItem', function(itemName)
	local xPlayer = ESX.GetPlayerFromId(source)
	local item = xPlayer.getInventoryItem(itemName)

	if item.count > 0 then
		ESX.UseItem(source, itemName)
	else
		xPlayer.showNotification(_U('act_imp'))
	end
end)

ESX.RegisterServerCallback('esx:getPlayerData', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	cb({
		identifier   = xPlayer.identifier,
		accounts     = xPlayer.getAccounts(),
		inventory    = xPlayer.getInventory(),
		job          = xPlayer.getJob(),
		secondjob 	 = xPlayer.getSecondJob(),
		thirdjob	 = xPlayer.getThirdJob(),
		dealerLevel  = xPlayer.getDealerLevel(),
		money        = xPlayer.getMoney(),
		components	 = xPlayer.getComponents()
		--skill        = xPlayer.getSkill()
	})
end)

ESX.RegisterServerCallback('esx:getOtherPlayerData', function(source, cb, target)
	local xPlayer = ESX.GetPlayerFromId(target)

	cb({
		identifier   = xPlayer.identifier,
		accounts     = xPlayer.getAccounts(),
		inventory    = xPlayer.getInventory(),
		job          = xPlayer.getJob(),
		secondjob 	 = xPlayer.getSecondJob(),
		thirdjob	 = xPlayer.getThirdJob(),
		dealerLevel  = xPlayer.getDealerLevel(),
		money        = xPlayer.getMoney(),
		components	 = xPlayer.getComponents()
		--skill        = xPlayer.getSkill()
	})
end)

ESX.RegisterServerCallback('esx:getPlayerNames', function(source, cb, players)
	players[source] = nil

	for playerId,v in pairs(players) do
		local xPlayer = ESX.GetPlayerFromId(playerId)

		if xPlayer then
			players[playerId] = xPlayer.getName()
		else
			players[playerId] = nil
		end
	end

	cb(players)
end)

ESX.RegisterServerCallback('esx:isValidItem', function(source, cb, item)
	if ESX.Items[item] then
		cb(true)
	else
		cb(false)
	end
end)

RegisterServerEvent('esx:updateDecor')
AddEventHandler('esx:updateDecor', function(what, entity, key, value)
	TriggerClientEvent('esx:updateDecor', -1, what, entity, key, value)
end)