ESX = nil

TriggerEvent('exilerp:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback("qBanking:GetPlayerInfo", function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.query('SELECT * FROM users WHERE identifier = ?', {xPlayer.identifier}, function(result)
		local db = result[1]
		local data = {
			playerName = xPlayer.getName(),
			playerBankMoney = xPlayer.getAccount('bank').money,
			playerIBAN = db.iban,
			walletMoney = xPlayer.getMoney(),
			sex = db.sex,
			firstname = db.firstname,
			lastname = db.lastname
		}

		cb(data)
	end)
end)

ESX.RegisterServerCallback("qBanking:IsIBanUsed", function(source, cb, iban)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	MySQL.query('SELECT * FROM users WHERE iban = ?', { iban}, function(result)
		local db = result[1]
		if db ~= nil then
			
			cb(db, true)
		else
			MySQL.query('SELECT * FROM qbanking_societies WHERE iban = ?', {iban}, function(result2)
				local db2 = result2[1]
				
				cb(db2, false)
			end)
		end
	end)
end)

ESX.RegisterServerCallback("qBanking:GetPIN", function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb(xPlayer.character.pincode)
end)

ESX.RegisterServerCallback("qBanking:SocietyInfo", function(source, cb, society)
	MySQL.query('SELECT * FROM qbanking_societies WHERE society = ?', { society}, function(result)
		local db = result[1]
		cb(db)
	end)
end)

RegisterServerEvent("qBanking:CreateSocietyAccount")
AddEventHandler("qBanking:CreateSocietyAccount", function(society, society_name, value, iban)
	MySQL.insert('INSERT INTO qbanking_societies (society, society_name, value, iban) VALUES (@society, @society_name, @value, @iban)', {
		['@society'] = society,
		['@society_name'] = society_name,
		['@value'] = value,
		['@iban'] = iban:upper(),
	}, function (result)
	end)
end)

RegisterServerEvent("qBanking:SetIBAN")
AddEventHandler("qBanking:SetIBAN", function(iban)
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.update('UPDATE users SET iban = ? WHERE identifier = ?', { iban, xPlayer.identifier }, function (result)
	end)
end)

RegisterServerEvent("qBanking:DepositMoney")
AddEventHandler("qBanking:DepositMoney", function(amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if amount <= playerMoney then
		xPlayer.removeAccountMoney('money', amount)
		xPlayer.addAccountMoney('bank', amount)

		TriggerEvent('qBanking:AddDepositTransaction', amount, source)
		TriggerClientEvent('qBanking:updateTransactions', source, xPlayer.getAccount('bank').money, xPlayer.getMoney())
		TriggerClientEvent('esx:showAdvancedNotification', source, "Pacific Standard", "Informacja", "Zdeponowałeś $"..amount.."")
	else
		TriggerClientEvent('esx:showAdvancedNotification', source, "Pacific Standard", "Informacja", "Nie masz przy sobie tyle pieniędzy")
	end
end)

RegisterServerEvent("qBanking:WithdrawMoney")
AddEventHandler("qBanking:WithdrawMoney", function(amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getAccount('bank').money

	if amount <= playerMoney then
		xPlayer.removeAccountMoney('bank', amount)
		xPlayer.addAccountMoney('money', amount)

		TriggerEvent('qBanking:AddWithdrawTransaction', amount, source)
		TriggerClientEvent('qBanking:updateTransactions', source, xPlayer.getAccount('bank').money, xPlayer.getMoney())
		TriggerClientEvent('esx:showAdvancedNotification', source, "Pacific Standard", "Informacja", "Wypłaciłeś z konta $"..amount)
	else
		TriggerClientEvent('esx:showAdvancedNotification', source, "Pacific Standard", "Informacja", "Nie masz tyle na pieniędzy na koncie bankowym")
	end
end)

RegisterServerEvent("qBanking:TransferMoney")
AddEventHandler("qBanking:TransferMoney", function(amount, ibanNumber, targetIdentifier, acc, targetName)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromIdentifier(targetIdentifier)
	local xPlayers = ESX.GetExtendedPlayers()
	local playerMoney = xPlayer.getAccount('bank').money
	ibanNumber = ibanNumber:upper()
	if xPlayer.identifier ~= targetIdentifier then
		if amount <= playerMoney then
			
			if xTarget ~= nil then
				xPlayer.removeAccountMoney('bank', amount)
				xTarget.addAccountMoney('bank', amount)

				for _, xPlayer in pairs(xPlayers) do	
				    if xPlayer.identifier == targetIdentifier then

				    	TriggerClientEvent('qBanking:updateTransactions', xPlayer.source, xTarget.getAccount('bank').money, xTarget.getMoney())
				    	TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, "Pacific Standard", "Informacja", "Otrzymano "..amount.."€ od "..xPlayer.getName())
				    end
				end
				TriggerEvent('qBanking:AddTransferTransaction', amount, xTarget, source)
				TriggerClientEvent('qBanking:updateTransactions', source, xPlayer.getAccount('bank').money, xPlayer.getMoney())
				TriggerClientEvent('esx:showAdvancedNotification', source, "Pacific Standard", "Informacja", "Wysłałeś "..amount.."€ do "..xTarget.getName())
			elseif xTarget == nil then
				local playerAccount = json.decode(acc)
				playerAccount.bank = playerAccount.bank + amount
				playerAccount = json.encode(playerAccount)

				xPlayer.removeAccountMoney('bank', amount)

				TriggerEvent('qBanking:AddTransferTransaction', amount, xTarget, source, targetName, targetIdentifier)
				TriggerClientEvent('qBanking:updateTransactions', source, xPlayer.getAccount('bank').money, xPlayer.getMoney())
				TriggerClientEvent('esx:showAdvancedNotification', source, "Pacific Standard", "Informacja", "Wysłałeś "..amount.."€ do "..targetName)

				MySQL.update('UPDATE users SET accounts = ? WHERE identifier = ?', { playerAccount, targetIdentifier}, function(changed)
				end)
			end
		else
			TriggerClientEvent('esx:showAdvancedNotification', source, "Pacific Standard", "Informacja", "Nie masz tyle pieniędzy w banku")
		end
	else
		TriggerClientEvent('esx:showAdvancedNotification', source, "Pacific Standard", "Informacja", "Nie możesz wysłać pieniędzy do siebie samego")
	end
end)

RegisterServerEvent("qBanking:DepositMoneyToSociety")
AddEventHandler("qBanking:DepositMoneyToSociety", function(amount, society, societyName)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if amount <= playerMoney then
		MySQL.update('UPDATE qbanking_societies SET value = value + @value WHERE society = @society AND society_name = @society_name', {
			['@value'] = amount,
			['@society'] = society,
			['@society_name'] = societyName,
		}, function(changed)
		end)
		xPlayer.removeAccountMoney('money', amount)

		TriggerEvent('qBanking:AddDepositTransactionToSociety', amount, source, society, societyName)
		TriggerClientEvent('qBanking:updateTransactionsSociety', source, xPlayer.getMoney())
		TriggerClientEvent('esx:showAdvancedNotification', source, "Pacific Standard", "Informacja", "Wpłaciłeś "..amount.."€ na "..societyName)
	else
		TriggerClientEvent('esx:showAdvancedNotification', source, "Pacific Standard", "Informacja", "Nie masz tyle pieniędzy przy sobie")
	end
end)

RegisterServerEvent("qBanking:WithdrawMoneyToSociety")
AddEventHandler("qBanking:WithdrawMoneyToSociety", function(amount, society, societyName, societyMoney)
	local xPlayer = ESX.GetPlayerFromId(source)
	local _source = source
	local db
	local hasChecked = false

	MySQL.query('SELECT * FROM qbanking_societies WHERE society = @society', {
		['@society'] = society
	}, function(result)
		db = result[1]
		hasChecked = true
	end)

	MySQL.update('UPDATE qbanking_societies SET is_withdrawing = 1 WHERE society = @society AND society_name = @society_name', {
		['@value'] = amount,
		['@society'] = society,
		['@society_name'] = societyName,
	}, function(changed)
	end)

	while not hasChecked do 
		Citizen.Wait(100)
	end
	
	if amount <= db.value then
		if db.is_withdrawing == 1 then
			TriggerClientEvent('esx:showAdvancedNotification', _source, "Pacific Standard", "Informacja", "Someone is already withdrawing")
		else

			MySQL.update('UPDATE qbanking_societies SET value = value - @value WHERE society = @society AND society_name = @society_name', {
				['@value'] = amount,
				['@society'] = society,
				['@society_name'] = societyName,
			}, function(changed)
			end)
			
			xPlayer.addAccountMoney('money', amount)
			--xPlayer.addAccountMoney('bank', amount)
			TriggerEvent('qBanking:AddWithdrawTransactionToSociety', amount, _source, society, societyName)
			TriggerClientEvent('qBanking:updateTransactionsSociety', _source, xPlayer.getMoney())
			TriggerClientEvent('esx:showAdvancedNotification', _source, "Pacific Standard", "Informacja", "You have withdrawn "..amount.."€ from "..societyName)
		end
	else
		TriggerClientEvent('esx:showAdvancedNotification', _source, "Pacific Standard", "Informacja", "Your society doesn't have that much money on the bank")
	end

	MySQL.update('UPDATE qbanking_societies SET is_withdrawing = 0 WHERE society = @society AND society_name = @society_name', {
		['@value'] = amount,
		['@society'] = society,
		['@society_name'] = societyName,
	}, function(changed)
	end)
end)

RegisterServerEvent("qBanking:TransferMoneyToSociety")
AddEventHandler("qBanking:TransferMoneyToSociety", function(amount, ibanNumber, societyName, society)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getAccount('bank').money

		if amount <= playerMoney then
			MySQL.update('UPDATE qbanking_societies SET value = value + @value WHERE iban = @iban', {
				['@value'] = amount,
				['@iban'] = ibanNumber
			}, function(changed)
			end)
			xPlayer.removeAccountMoney('bank', amount)
			TriggerEvent('qBanking:AddTransferTransactionToSociety', amount, source, society, societyName)
			TriggerClientEvent('qBanking:updateTransactionsSociety', source, xPlayer.getMoney())
			TriggerClientEvent('esx:showAdvancedNotification', source, "Pacific Standard", "Informacja", "You have transferred "..amount.."€ to "..societyName)
		else
			TriggerClientEvent('esx:showication', source, "Pacific Standard", "Informacja", "Nie masz tyle pieniędzy w banku")
		end
end)

RegisterServerEvent("qBanking:TransferMoneyToSocietyFromSociety")
AddEventHandler("qBanking:TransferMoneyToSocietyFromSociety", function(amount, ibanNumber, societyNameTarget, societyTarget, society, societyName, societyMoney)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromIdentifier(targetIdentifier)
	local xPlayers = ESX.GetPlayers()

	if amount <= societyMoney then
		MySQL.update('UPDATE qbanking_societies SET value = value - @value WHERE society = @society AND society_name = @society_name', {
			['@value'] = amount,
			['@society'] = society,
			['@society_name'] = societyName,
		}, function(changed)
		end)
		MySQL.update('UPDATE qbanking_societies SET value = value + @value WHERE society = @society AND society_name = @society_name', {
			['@value'] = amount,
			['@society'] = societyTarget,
			['@society_name'] = societyNameTarget,
		}, function(changed)
		end)
		TriggerEvent('qBanking:AddTransferTransactionFromSociety', amount, society, societyName, societyTarget, societyNameTarget)
		TriggerClientEvent('qBanking:updateTransactionsSociety', source, xPlayer.getMoney())
		TriggerClientEvent('esx:showAdvancedNotification', source, "Pacific Standard", "Informacja", "You have transferred "..amount.."€ to "..societyNameTarget)
	else
		TriggerClientEvent('esx:showAdvancedNotification', source, "Pacific Standard", "Informacja", "Your society doesn't have that much money on the bank")
	end
end)

RegisterServerEvent("qBanking:TransferMoneyToPlayerFromSociety")
AddEventHandler("qBanking:TransferMoneyToPlayerFromSociety", function(amount, ibanNumber, targetIdentifier, acc, targetName, society, societyName, societyMoney, toMyself)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromIdentifier(targetIdentifier)
	local xPlayers = ESX.GetPlayers()

	if amount <= societyMoney then
		MySQL.update('UPDATE qbanking_societies SET value = value - @value WHERE society = @society AND society_name = @society_name', {
			['@value'] = amount,
			['@society'] = society,
			['@society_name'] = societyName,
		}, function(changed)
		end)
		if xTarget ~= nil then
			xTarget.addAccountMoney('bank', amount)
			if not toMyself then
				for i=1, #xPlayers, 1 do
				    local xForPlayer = ESX.GetPlayerFromId(xPlayers[i])
				    if xForPlayer.identifier == targetIdentifier then
				    	--TriggerClientEvent('qBanking:updateMoney', xPlayers[i], xTarget.getAccount('bank').money)
			    	
			    		TriggerClientEvent('qBanking:updateTransactions', xPlayers[i], xTarget.getAccount('bank').money, xTarget.getMoney())
			    		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], "Pacific Standard", "Informacja", "You have received "..amount.."€ from "..xPlayer.getName())
				    end
				end
			end
			TriggerEvent('qBanking:AddTransferTransactionFromSocietyToP', amount, society, societyName, targetIdentifier, targetName)
			TriggerClientEvent('qBanking:updateTransactionsSociety', source, xPlayer.getMoney())
			TriggerClientEvent('esx:showAdvancedNotification', source, "Pacific Standard", "Informacja", "You have transferred "..amount.."€ to "..xTarget.getName())
		elseif xTarget == nil then
			local playerAccount = json.decode(acc)
			playerAccount.bank = playerAccount.bank + amount
			playerAccount = json.encode(playerAccount)

			--xPlayer.removeAccountMoney('bank', amount)

			--TriggerClientEvent('qBanking:updateMoney', source, xPlayer.getAccount('bank').money)
			TriggerEvent('qBanking:AddTransferTransactionFromSocietyToP', amount, society, societyName, targetIdentifier, targetName)
			TriggerClientEvent('qBanking:updateTransactionsSociety', source, xPlayer.getMoney())
			TriggerClientEvent('esx:showAdvancedNotification', source, "Pacific Standard", "Informacja", "You have transferred "..amount.."€ to "..targetName)

			MySQL.update('UPDATE users SET accounts = @playerAccount WHERE identifier = @target', {
				['@playerAccount'] = playerAccount,
				['@target'] = targetIdentifier
			}, function(changed)

			end)
		end
	else
		TriggerClientEvent('esx:showAdvancedNotification', source, "Pacific Standard", "Informacja", "Your society doesn't have that much money on the bank")
	end
end)

ESX.RegisterServerCallback("qBanking:GetOverviewTransactions", function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerIdentifier = xPlayer.identifier
	local allDays = {}
	local income = 0
	local outcome = 0
	local totalIncome = 0
	local day1_total, day2_total, day3_total, day4_total, day5_total, day6_total, day7_total = 0, 0, 0, 0, 0, 0, 0

	

	MySQL.query('SELECT * FROM qbanking_transactions WHERE receiver_identifier = @identifier OR sender_identifier = @identifier ORDER BY id DESC', {
		['@identifier'] = playerIdentifier
	}, function(result)
		MySQL.query('SELECT *, DATE(date) = CURDATE() AS "day1", DATE(date) = CURDATE() - INTERVAL 1 DAY AS "day2", DATE(date) = CURDATE() - INTERVAL 2 DAY AS "day3", DATE(date) = CURDATE() - INTERVAL 3 DAY AS "day4", DATE(date) = CURDATE() - INTERVAL 4 DAY AS "day5", DATE(date) = CURDATE() - INTERVAL 5 DAY AS "day6", DATE(date) = CURDATE() - INTERVAL 6 DAY AS "day7" FROM `qbanking_transactions` WHERE DATE(date) >= CURDATE() - INTERVAL 7 DAY', {

		}, function(result2)
			for k, v in pairs(result2) do
				local type = v.type
				local receiver_identifier = v.receiver_identifier
				local sender_identifier = v.sender_identifier
				local value = tonumber(v.value)

				if v.day1 == 1 then
					if value ~= nil then
						if type == "deposit" then
							day1_total = day1_total + value
							income = income + value
						elseif type == "withdraw" then
							day1_total = day1_total - value
							outcome = outcome - value
						elseif type == "transfer" and receiver_identifier == playerIdentifier then
							day1_total = day1_total + value
							income = income + value
						elseif type == "transfer" and sender_identifier == playerIdentifier then
							day1_total = day1_total - value
							outcome = outcome - value
						end
					end
					
				elseif v.day2 == 1 then
					if value ~= nil then
						if type == "deposit" then
							day2_total = day2_total + value
							income = income + value
						elseif type == "withdraw" then
							day2_total = day2_total - value
							outcome = outcome - value
						elseif type == "transfer" and receiver_identifier == playerIdentifier then
							day2_total = day2_total + value
							income = income + value
						elseif type == "transfer" and sender_identifier == playerIdentifier then
							day2_total = day2_total - value
							outcome = outcome - value
						end
					end

				elseif v.day3 == 1 then
					if value ~= nil then
						if type == "deposit" then
							day3_total = day3_total + value
							income = income + value
						elseif type == "withdraw" then
							day3_total = day3_total - value
							outcome = outcome - value
						elseif type == "transfer" and receiver_identifier == playerIdentifier then
							day3_total = day3_total + value
							income = income + value
						elseif type == "transfer" and sender_identifier == playerIdentifier then
							day3_total = day3_total - value
							outcome = outcome - value
						end
					end

				elseif v.day4 == 1 then
					if value ~= nil then
						if type == "deposit" then
							day4_total = day4_total + value
							income = income + value
						elseif type == "withdraw" then
							day4_total = day4_total - value
							outcome = outcome - value
						elseif type == "transfer" and receiver_identifier == playerIdentifier then
							day4_total = day4_total + value
							income = income + value
						elseif type == "transfer" and sender_identifier == playerIdentifier then
							day4_total = day4_total - value
							outcome = outcome - value
						end
					end

				elseif v.day5 == 1 then
					if value ~= nil then
						if type == "deposit" then
							day5_total = day5_total + value
							income = income + value
						elseif type == "withdraw" then
							day5_total = day5_total - value
							outcome = outcome - value
						elseif type == "transfer" and receiver_identifier == playerIdentifier then
							day5_total = day5_total + value
							income = income + value
						elseif type == "transfer" and sender_identifier == playerIdentifier then
							day5_total = day5_total - value
							outcome = outcome - value
						end
					end

				elseif v.day6 == 1 then
					if value ~= nil then
						if type == "deposit" then
							day6_total = day6_total + value
							income = income + value
						elseif type == "withdraw" then
							day6_total = day6_total - value
							outcome = outcome - value
						elseif type == "transfer" and receiver_identifier == playerIdentifier then
							day6_total = day6_total + value
							income = income + value
						elseif type == "transfer" and sender_identifier == playerIdentifier then
							day6_total = day6_total - value
							outcome = outcome - value
						end
					end

				elseif v.day7 == 1 then
					if value ~= nil then
						if type == "deposit" then
							day7_total = day7_total + value
							income = income + value
						elseif type == "withdraw" then
							day7_total = day7_total - value
							outcome = outcome - value
						elseif type == "transfer" and receiver_identifier == playerIdentifier then
							day7_total = day7_total + value
							income = income + value
						elseif type == "transfer" and sender_identifier == playerIdentifier then
							day7_total = day7_total - value
							outcome = outcome - value
						end
					end

				end
			end

			totalIncome = day1_total + day2_total + day3_total + day4_total + day5_total + day6_total + day7_total

			table.remove(allDays)
			table.insert(allDays, day1_total)
			table.insert(allDays, day2_total)
			table.insert(allDays, day3_total)
			table.insert(allDays, day4_total)
			table.insert(allDays, day5_total)
			table.insert(allDays, day6_total)
			table.insert(allDays, day7_total)
			table.insert(allDays, income)
			table.insert(allDays, outcome)
			table.insert(allDays, totalIncome)

			cb(result, playerIdentifier, allDays)
		end)
	end)
end)

ESX.RegisterServerCallback("qBanking:GetSocietyTransactions", function(source, cb, society)
	local playerIdentifier = society
	local allDays = {}
	local income = 0
	local outcome = 0
	local totalIncome = 0
	local day1_total, day2_total, day3_total, day4_total, day5_total, day6_total, day7_total = 0, 0, 0, 0, 0, 0, 0

	MySQL.query('SELECT * FROM qbanking_transactions WHERE receiver_identifier = @identifier OR sender_identifier = @identifier ORDER BY id DESC', {
		['@identifier'] = society
	}, function(result)
		MySQL.query('SELECT *, DATE(date) = CURDATE() AS "day1", DATE(date) = CURDATE() - INTERVAL 1 DAY AS "day2", DATE(date) = CURDATE() - INTERVAL 2 DAY AS "day3", DATE(date) = CURDATE() - INTERVAL 3 DAY AS "day4", DATE(date) = CURDATE() - INTERVAL 4 DAY AS "day5", DATE(date) = CURDATE() - INTERVAL 5 DAY AS "day6", DATE(date) = CURDATE() - INTERVAL 6 DAY AS "day7" FROM `qbanking_transactions` WHERE DATE(date) >= CURDATE() - INTERVAL 7 DAY AND receiver_identifier = @identifier OR sender_identifier = @identifier ORDER BY id DESC', {
			['@identifier'] = society
		}, function(result2)
			for k, v in pairs(result2) do
				local type = v.type
				local receiver_identifier = v.receiver_identifier
				local sender_identifier = v.sender_identifier
				local value = tonumber(v.value)

				if v.day1 == 1 then
					if value ~= nil then
						if type == "deposit" then
							day1_total = day1_total + value
							income = income + value
						elseif type == "withdraw" then
							day1_total = day1_total - value
							outcome = outcome - value
						elseif type == "transfer" and receiver_identifier == playerIdentifier then
							day1_total = day1_total + value
							income = income + value
						elseif type == "transfer" and sender_identifier == playerIdentifier then
							day1_total = day1_total - value
							outcome = outcome - value
						end
					end
					
				elseif v.day2 == 1 then
					if value ~= nil then
						if type == "deposit" then
							day2_total = day2_total + value
							income = income + value
						elseif type == "withdraw" then
							day2_total = day2_total - value
							outcome = outcome - value
						elseif type == "transfer" and receiver_identifier == playerIdentifier then
							day2_total = day2_total + value
							income = income + value
						elseif type == "transfer" and sender_identifier == playerIdentifier then
							day2_total = day2_total - value
							outcome = outcome - value
						end
					end

				elseif v.day3 == 1 then
					if value ~= nil then
						if type == "deposit" then
							day3_total = day3_total + value
							income = income + value
						elseif type == "withdraw" then
							day3_total = day3_total - value
							outcome = outcome - value
						elseif type == "transfer" and receiver_identifier == playerIdentifier then
							day3_total = day3_total + value
							income = income + value
						elseif type == "transfer" and sender_identifier == playerIdentifier then
							day3_total = day3_total - value
							outcome = outcome - value
						end
					end

				elseif v.day4 == 1 then
					if value ~= nil then
						if type == "deposit" then
							day4_total = day4_total + value
							income = income + value
						elseif type == "withdraw" then
							day4_total = day4_total - value
							outcome = outcome - value
						elseif type == "transfer" and receiver_identifier == playerIdentifier then
							day4_total = day4_total + value
							income = income + value
						elseif type == "transfer" and sender_identifier == playerIdentifier then
							day4_total = day4_total - value
							outcome = outcome - value
						end
					end

				elseif v.day5 == 1 then
					if value ~= nil then
						if type == "deposit" then
							day5_total = day5_total + value
							income = income + value
						elseif type == "withdraw" then
							day5_total = day5_total - value
							outcome = outcome - value
						elseif type == "transfer" and receiver_identifier == playerIdentifier then
							day5_total = day5_total + value
							income = income + value
						elseif type == "transfer" and sender_identifier == playerIdentifier then
							day5_total = day5_total - value
							outcome = outcome - value
						end
					end

				elseif v.day6 == 1 then
					if value ~= nil then
						if type == "deposit" then
							day6_total = day6_total + value
							income = income + value
						elseif type == "withdraw" then
							day6_total = day6_total - value
							outcome = outcome - value
						elseif type == "transfer" and receiver_identifier == playerIdentifier then
							day6_total = day6_total + value
							income = income + value
						elseif type == "transfer" and sender_identifier == playerIdentifier then
							day6_total = day6_total - value
							outcome = outcome - value
						end
					end

				elseif v.day7 == 1 then
					if value ~= nil then
						if type == "deposit" then
							day7_total = day7_total + value
							income = income + value
						elseif type == "withdraw" then
							day7_total = day7_total - value
							outcome = outcome - value
						elseif type == "transfer" and receiver_identifier == playerIdentifier then
							day7_total = day7_total + value
							income = income + value
						elseif type == "transfer" and sender_identifier == playerIdentifier then
							day7_total = day7_total - value
							outcome = outcome - value
						end
					end

				end
			end

			totalIncome = day1_total + day2_total + day3_total + day4_total + day5_total + day6_total + day7_total

			table.remove(allDays)
			table.insert(allDays, day1_total)
			table.insert(allDays, day2_total)
			table.insert(allDays, day3_total)
			table.insert(allDays, day4_total)
			table.insert(allDays, day5_total)
			table.insert(allDays, day6_total)
			table.insert(allDays, day7_total)
			table.insert(allDays, income)
			table.insert(allDays, outcome)
			table.insert(allDays, totalIncome)

			cb(result, playerIdentifier, allDays)
		end)
	end)
end)


RegisterServerEvent("qBanking:AddDepositTransaction")
AddEventHandler("qBanking:AddDepositTransaction", function(amount, source_)
	local _source = nil
	if source_ ~= nil then
		_source = source_
	else
		_source = source
	end

	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.insert('INSERT INTO qbanking_transactions (receiver_identifier, receiver_name, sender_identifier, sender_name, date, value, type) VALUES (@receiver_identifier, @receiver_name, @sender_identifier, @sender_name, CURRENT_TIMESTAMP(), @value, @type)', {
		['@receiver_identifier'] = 'bank',
		['@receiver_name'] = 'Bank Account',
		['@sender_identifier'] = tostring(xPlayer.identifier),
		['@sender_name'] = tostring(xPlayer.getName()),
		['@value'] = tonumber(amount),
		['@type'] = 'deposit'
	}, function (result)
	end)
end)

RegisterServerEvent("qBanking:AddWithdrawTransaction")
AddEventHandler("qBanking:AddWithdrawTransaction", function(amount, source_)
	local _source = nil
	if source_ ~= nil then
		_source = source_
	else
		_source = source
	end

	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.insert('INSERT INTO qbanking_transactions (receiver_identifier, receiver_name, sender_identifier, sender_name, date, value, type) VALUES (@receiver_identifier, @receiver_name, @sender_identifier, @sender_name, CURRENT_TIMESTAMP(), @value, @type)', {
		['@receiver_identifier'] = tostring(xPlayer.identifier),
		['@receiver_name'] = tostring(xPlayer.getName()),
		['@sender_identifier'] = 'bank',
		['@sender_name'] = 'Bank Account',
		['@value'] = tonumber(amount),
		['@type'] = 'withdraw'
	}, function (result)
	end)
end)

RegisterServerEvent("qBanking:AddTransferTransaction")
AddEventHandler("qBanking:AddTransferTransaction", function(amount, xTarget, source_, targetName, targetIdentifier)
	local _source = nil
	if source_ ~= nil then
		_source = source_
	else
		_source = source
	end

	local xPlayer = ESX.GetPlayerFromId(_source)
	if targetName == nil then
		MySQL.insert('INSERT INTO qbanking_transactions (receiver_identifier, receiver_name, sender_identifier, sender_name, date, value, type) VALUES (@receiver_identifier, @receiver_name, @sender_identifier, @sender_name, CURRENT_TIMESTAMP(), @value, @type)', {
			['@receiver_identifier'] = tostring(xTarget.identifier),
			['@receiver_name'] = tostring(xTarget.getName()),
			['@sender_identifier'] = tostring(xPlayer.identifier),
			['@sender_name'] = tostring(xPlayer.getName()),
			['@value'] = tonumber(amount),
			['@type'] = 'transfer'
		}, function (result)
		end)
	elseif targetName ~= nil and targetIdentifier ~= nil then
		MySQL.insert('INSERT INTO qbanking_transactions (receiver_identifier, receiver_name, sender_identifier, sender_name, date, value, type) VALUES (@receiver_identifier, @receiver_name, @sender_identifier, @sender_name, CURRENT_TIMESTAMP(), @value, @type)', {
			['@receiver_identifier'] = tostring(targetIdentifier),
			['@receiver_name'] = tostring(targetName),
			['@sender_identifier'] = tostring(xPlayer.identifier),
			['@sender_name'] = tostring(xPlayer.getName()),
			['@value'] = tonumber(amount),
			['@type'] = 'transfer'
		}, function (result)
		end)
	end
end)

RegisterServerEvent("qBanking:AddTransferTransactionToSociety")
AddEventHandler("qBanking:AddTransferTransactionToSociety", function(amount, source_, society, societyName)
	local _source = nil
	if source_ ~= nil then
		_source = source_
	else
		_source = source
	end

	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.insert('INSERT INTO qbanking_transactions (receiver_identifier, receiver_name, sender_identifier, sender_name, date, value, type) VALUES (@receiver_identifier, @receiver_name, @sender_identifier, @sender_name, CURRENT_TIMESTAMP(), @value, @type)', {
		['@receiver_identifier'] = society,
		['@receiver_name'] = societyName,
		['@sender_identifier'] = tostring(xPlayer.identifier),
		['@sender_name'] = tostring(xPlayer.getName()),
		['@value'] = tonumber(amount),
		['@type'] = 'transfer'
	}, function (result)
	end)
end)

RegisterServerEvent("qBanking:AddTransferTransactionFromSocietyToP")
AddEventHandler("qBanking:AddTransferTransactionFromSocietyToP", function(amount, society, societyName, identifier, name)

	MySQL.insert('INSERT INTO qbanking_transactions (receiver_identifier, receiver_name, sender_identifier, sender_name, date, value, type) VALUES (@receiver_identifier, @receiver_name, @sender_identifier, @sender_name, CURRENT_TIMESTAMP(), @value, @type)', {
		['@receiver_identifier'] = identifier,
		['@receiver_name'] = name,
		['@sender_identifier'] = society,
		['@sender_name'] = societyName,
		['@value'] = tonumber(amount),
		['@type'] = 'transfer'
	}, function (result)
	end)
end)

RegisterServerEvent("qBanking:AddTransferTransactionFromSociety")
AddEventHandler("qBanking:AddTransferTransactionFromSociety", function(amount, society, societyName, societyTarget, societyNameTarget)
	
	MySQL.insert('INSERT INTO qbanking_transactions (receiver_identifier, receiver_name, sender_identifier, sender_name, date, value, type) VALUES (@receiver_identifier, @receiver_name, @sender_identifier, @sender_name, CURRENT_TIMESTAMP(), @value, @type)', {
		['@receiver_identifier'] = societyTarget,
		['@receiver_name'] = societyNameTarget,
		['@sender_identifier'] = society,
		['@sender_name'] = societyName,
		['@value'] = tonumber(amount),
		['@type'] = 'transfer'
	}, function (result)
	end)
end)

RegisterServerEvent("qBanking:AddDepositTransactionToSociety")
AddEventHandler("qBanking:AddDepositTransactionToSociety", function(amount, source_, society, societyName)
	local _source = nil
	if source_ ~= nil then
		_source = source_
	else
		_source = source
	end

	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.insert('INSERT INTO qbanking_transactions (receiver_identifier, receiver_name, sender_identifier, sender_name, date, value, type) VALUES (@receiver_identifier, @receiver_name, @sender_identifier, @sender_name, CURRENT_TIMESTAMP(), @value, @type)', {
		['@receiver_identifier'] = society,
		['@receiver_name'] = societyName,
		['@sender_identifier'] = tostring(xPlayer.identifier),
		['@sender_name'] = tostring(xPlayer.getName()),
		['@value'] = tonumber(amount),
		['@type'] = 'deposit'
	}, function (result)
	end)
end)

RegisterServerEvent("qBanking:AddWithdrawTransactionToSociety")
AddEventHandler("qBanking:AddWithdrawTransactionToSociety", function(amount, source_, society, societyName)
	local _source = nil
	if source_ ~= nil then
		_source = source_
	else
		_source = source
	end

	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.insert('INSERT INTO qbanking_transactions (receiver_identifier, receiver_name, sender_identifier, sender_name, date, value, type) VALUES (@receiver_identifier, @receiver_name, @sender_identifier, @sender_name, CURRENT_TIMESTAMP(), @value, @type)', {
		['@receiver_identifier'] = tostring(xPlayer.identifier),
		['@receiver_name'] = tostring(xPlayer.getName()),
		['@sender_identifier'] = society,
		['@sender_name'] = societyName,
		['@value'] = tonumber(amount),
		['@type'] = 'withdraw'
	}, function (result)
	end)
end)

RegisterServerEvent("qBanking:UpdateIbanDB")
AddEventHandler("qBanking:UpdateIbanDB", function(iban, amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if amount <= xPlayer.getAccount('bank').money then
		MySQL.update('UPDATE users SET iban = @iban WHERE identifier = @identifier', {
			['@iban'] = iban,
			['@identifier'] = xPlayer.identifier,
		}, function(changed)
		end)

		xPlayer.removeAccountMoney('bank', amount)
		TriggerClientEvent('qBanking:updateMoney', _source, xPlayer.getAccount('bank').money, xPlayer.getMoney())
		TriggerEvent('qBanking:AddTransferTransactionToSociety', amount, _source, "Pacific Standard", "Bank", "Bank (IBAN)")
		TriggerClientEvent('qBanking:updateIban', _source, iban)
		TriggerClientEvent('qBanking:updateIbanPinChange', _source)
		TriggerClientEvent('esx:showAdvancedNotification', _source, "Pacific Standard", "Informacja", "IBAN pomyślnie zmieniony na: "..iban)
	else
		TriggerClientEvent('esx:showAdvancedNotification', _source, "Pacific Standard", "Informacja", "Musisz mieć "..amount.."€ aby zmienić swój IBAN")
	end
end)

RegisterServerEvent("qBanking:UpdatePINDB")
AddEventHandler("qBanking:UpdatePINDB", function(pin, amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if amount <= xPlayer.getAccount('bank').money then
		xPlayer.setCharacter('pincode', pin)
		MySQL.update('UPDATE users SET pincode = ? WHERE identifier = ?', {pin, xPlayer.identifier}, function(changed)
		end)

		xPlayer.removeAccountMoney('bank', amount)
		TriggerClientEvent('qBanking:updateMoney', _source, xPlayer.getAccount('bank').money, xPlayer.getMoney())
		TriggerEvent('qBanking:AddTransferTransactionToSociety', amount, _source, "Pacific Standard", "Bank", "Bank (PIN)")
		TriggerClientEvent('qBanking:updateIbanPinChange', _source)
		TriggerClientEvent('esx:showAdvancedNotification', _source, "Pacific Standard", "Informacja", "PIN został zmieniony na numer "..pin)
	else
		TriggerClientEvent('esx:showAdvancedNotification', _source, "Pacific Standard", "Informacja", "Musisz posidać "..amount.."$ by zmienic PIN!")
	end
end)