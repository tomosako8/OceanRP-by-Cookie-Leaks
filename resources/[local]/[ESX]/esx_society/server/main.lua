ESX = nil
local Jobs = {}
local RegisteredSocieties = {}
local Licenses = {}

TriggerEvent('exilerp:getSharedObject', function(obj) ESX = obj end)

function GetSociety(name)
	for i=1, #RegisteredSocieties, 1 do
		if RegisteredSocieties[i].name == name then
			return RegisteredSocieties[i]
		end
	end
end

AddEventHandler('onResourceStart', function(resourceName)
	if resourceName == GetCurrentResourceName() then
		local result = MySQL.query.await('SELECT * FROM jobs')

		for i = 1, #result, 1 do
			Jobs[result[i].name] = result[i]
			Jobs[result[i].name].grades = {}
		end

		local result2 = MySQL.query.await('SELECT * FROM job_grades')

		for i = 1, #result2, 1 do
			Jobs[result2[i].job_name].grades[tostring(result2[i].grade)] = result2[i]
		end
	end
end)

RegisterServerEvent('esx_society:giveMoney')
AddEventHandler('esx_society:giveMoney', function(target, society, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local tPlayer = ESX.GetPlayerFromId(target)
	local society = GetSociety(society)
	amount = ESX.Math.Round(tonumber(amount))
	
	if xPlayer.job.name == society.name then
		TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
			if amount > 0 and account.account_money >= amount then
				account.removeAccountMoney(amount)
				tPlayer.addAccountMoney('bank', amount)

				xPlayer.showNotification("Przelałeś ~g~" .. amount .. "$~w~ na konto ~y~wybranego obywatela")
				tPlayer.showNotification("Otrzymałeś ~g~przelew~w~ na kwotę ~y~" .. amount .. "$")
				exports['ocean_logs']:SendLog(source, "Przelano pieniądze z konta frakcji:\nKonto: " .. society.account .. "\nKwota: " .. amount .. "\nGracz: " .. GetPlayerName(target) .. " [" .. target .. "]", 'boss_menu', '3066993')
			else
				xPlayer.showNotification(_U('invalid_amount'))
			end
		end)
	else
		--print(('esx_society: %s attempted to call withdrawMoney!'):format(xPlayer.identifier))
	end
end)

AddEventHandler('esx_society:registerSociety', function(name, label, account, datastore, inventory, data)
	local found = false

	local society = {
		name      = name,
		label     = label,
		account   = account,
		datastore = datastore,
		inventory = inventory,
		data      = data
	}
	
	for i=1, #RegisteredSocieties, 1 do
		if RegisteredSocieties[i].name == name then
			found = true
			RegisteredSocieties[i] = society
			break
		end
	end

	if not found then
		table.insert(RegisteredSocieties, society)
	end
end)

RegisterServerEvent('exilerp:kickFromDuty')
AddEventHandler('exilerp:kickFromDuty', function(id, job, grade)
	local xPlayer = ESX.GetPlayerFromId(id)
	if xPlayer.job then
		xPlayer.showNotification('Zostałeś wyrzucony ze służby przez szefa')
		xPlayer.setJob('off'..job, grade) 
	end	
end)

ESX.RegisterServerCallback('exilerp:societyDutyList', function(source,cb, society) 
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == society then
		local elements = {}
		for _, xPlayer in pairs(ESX.GetExtendedPlayers('job', society)) do	
			if xPlayer.job and xPlayer.job.name == society then
				table.insert(elements, {"["..xPlayer.job.grade_label.."] "..xPlayer.character.firstname.." "..xPlayer.character.lastname, {xPlayer.source, xPlayer.job.grade, xPlayer.character.firstname.." "..xPlayer.character.lastname}})
			end	
		end
		cb(elements)	
	end	
end)

AddEventHandler('esx_society:getSocieties', function(cb)
	cb(RegisteredSocieties)
end)

AddEventHandler('esx_society:getSociety', function(name, cb)
	cb(GetSociety(name))
end)

RegisterServerEvent('esx_society:setBadge')
AddEventHandler('esx_society:setBadge', function(data, number)
	local _source = source

	MySQL.update('UPDATE users SET job_id = @newbadge WHERE identifier = @identifier', {
		['@newbadge'] = json.encode({name = 'nojob', id = number}),
		['@identifier'] = data.identifier
	}, function (onRowChange)
		local xPlayer = ESX.GetPlayerFromIdentifier(data.identifier)

		TriggerClientEvent('esx:showNotification', _source, '~b~Zaktualizowałeś/aś odznakę ' .. data.name .. ' ~o~[ '..  number .. ' ]~b~!')		
	
		if xPlayer then
			xPlayer.setCharacter('job_id', json.encode({name = 'nojob', id = number}))
			TriggerClientEvent('esx:showNotification', xPlayer.source, '~b~Aktualizacja odznaki ~o~[ '.. number .. ' ]~b~!')
		end
	end)
end)

RegisterServerEvent('exilerp:withdrawMoney')
AddEventHandler('exilerp:withdrawMoney', function(society, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local society = GetSociety(society)
	amount = ESX.Math.Round(tonumber(amount))

	if xPlayer.job.name == society.name then
		TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
			if amount > 0 and account.account_money >= amount then
				account.removeAccountMoney(amount)
				xPlayer.addMoney(amount)

				--xPlayer.showNotification(_U('have_withdrawn', ESX.Math.GroupDigits(amount)))
				TriggerClientEvent('esx:showNotification', source,  _U('have_withdrawn', ESX.Math.GroupDigits(amount)))
				exports['ocean_logs']:SendLog(source, "Wypłacono pieniądze z konta frakcji:\nKonto: " .. society.account .. "\nKwota: " .. amount, 'boss_menu', '3066993')
			else
				--xPlayer.showNotification(_U('invalid_amount'))
				TriggerClientEvent('esx:showNotification', source,  _U('invalid_amount'))
			end
		end)
	else
		--print(('esx_society: %s attempted to call withdrawMoney!'):format(xPlayer.identifier))
	end
end)

RegisterServerEvent('exilerp:withdrawThirdMoney')
AddEventHandler('exilerp:withdrawThirdMoney', function(society, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local society = GetSociety(society)
	amount = ESX.Math.Round(tonumber(amount))

	if xPlayer.thirdjob.name ~= society.name then
		return
	end

	TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
		if amount > 0 and account.account_money >= amount then
			account.removeAccountMoney(amount)
			xPlayer.addMoney(amount)

			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn', ESX.Math.GroupDigits(amount)))
			exports['ocean_logs']:SendLog(source, "Wypłacono pieniądze z konta organizacji:\nKonto: " .. society.account .. "\nKwota: " .. amount, 'boss_menu', '15158332')
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
		end
	end)
end)

RegisterServerEvent('exilerp:withdrawSecondMoney')
AddEventHandler('exilerp:withdrawSecondMoney', function(society, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local society = GetSociety(society)
	amount = ESX.Math.Round(tonumber(amount))

	if xPlayer.secondjob.name ~= society.name then
		return
	end

	TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
		if amount > 0 and account.account_money >= amount then
			account.removeAccountMoney(amount)
			xPlayer.addMoney(amount)

			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn', ESX.Math.GroupDigits(amount)))
			exports['ocean_logs']:SendLog(source, "Wypłacono pieniądze z konta organizacji:\nKonto: " .. society.account .. "\nKwota: " .. amount, 'boss_menu', '15158332')
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
		end
	end)
end)

RegisterServerEvent('exilerp:depositMoney')
AddEventHandler('exilerp:depositMoney', function(society, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local society = GetSociety(society)
	amount = ESX.Math.Round(tonumber(amount))
	-- print(xPlayer.job.name)
	-- print(society.name)
	if xPlayer.job.name == society.name then
		if amount > 0 and xPlayer.getMoney() >= amount then
			TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
				xPlayer.removeMoney(amount)
				account.addAccountMoney(amount)
				exports['ocean_logs']:SendLog(source, "Wpłacono pieniądze na konto frakcji:\nKonto: " .. society.account .. "\nKwota: " .. amount, 'boss_menu', '3066993')
			end)

			TriggerClientEvent('esx:showNotification', source,  _U('have_deposited', ESX.Math.GroupDigits(amount)))
			
		else
			TriggerClientEvent('esx:showNotification', source,  _U('invalid_amount'))
		end
	end
end)

RegisterServerEvent('exilerp:depositThirdMoney')
AddEventHandler('exilerp:depositThirdMoney', function(society, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local society = GetSociety(society)
	amount = ESX.Math.Round(tonumber(amount))

	if xPlayer.thirdjob.name ~= society.name then
		--print(('esx_society: %s attempted to call depositMoney!'):format(xPlayer.identifier))
		return
	end

	if amount > 0 and xPlayer.getMoney() >= amount then
		TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
			xPlayer.removeMoney(amount)
			account.addAccountMoney(amount)
			exports['ocean_logs']:SendLog(source, "Wpłacono pieniądze na konto frakcji:\nKonto: " .. society.account .. "\nKwota: " .. amount, 'boss_menu', '3066993')
		end)

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_deposited', ESX.Math.GroupDigits(amount)))
		else
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
	end
end)

RegisterServerEvent('exilerp:depositSecondMoney')
AddEventHandler('exilerp:depositSecondMoney', function(society, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local society = GetSociety(society)
	amount = ESX.Math.Round(tonumber(amount))

	if xPlayer.secondjob.name ~= society.name then
		--print(('esx_society: %s attempted to call depositMoney!'):format(xPlayer.identifier))
		return
	end

	if amount > 0 and xPlayer.getMoney() >= amount then
		TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
			xPlayer.removeMoney(amount)
			account.addAccountMoney(amount)
			exports['ocean_logs']:SendLog(source, "Wpłacono pieniądze na konto frakcji:\nKonto: " .. society.account .. "\nKwota: " .. amount, 'boss_menu', '3066993')
		end)

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_deposited', ESX.Math.GroupDigits(amount)))
		else
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
	end
end)

RegisterServerEvent('exilerp:washMoney')
AddEventHandler('exilerp:washMoney', function(societyName, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local account = xPlayer.getAccount('black_money')
	amount = ESX.Math.Round(tonumber(amount))
	local society = GetSociety(societyName)
	
	if xPlayer.job.name == societyName then
		if amount and amount > 0 and account.money >= amount then
			
			TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
				xPlayer.removeAccountMoney('black_money', amount)
				account.addAccountMoney(math.floor(amount * 0.9))
			end)
			xPlayer.showNotification("Wyprałeś ~g~" .. ESX.Math.GroupDigits(amount) .. "$ ~y~brudnej gotówki")
			exports['ocean_logs']:SendLog(source, "Wyprano brudne pieniądze:\nKonto: " .. societyName .. "\nKwota: " .. amount, 'boss_menu', '3066993')
		else
			xPlayer.showNotification(_U('invalid_amount'))
		end
		
	else
		--print(('esx_society: %s attempted to call washMoney!'):format(xPlayer.identifier))
	end
end)

RegisterServerEvent('exilerp:washThirdMoney')
AddEventHandler('exilerp:washThirdMoney', function(society, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local account = xPlayer.getAccount('black_money')
	amount = ESX.Math.Round(tonumber(amount))

	if xPlayer.thirdjob.name ~= society then
		--print(('esx_society: %s attempted to call washMoney!'):format(xPlayer.identifier))
		return
	end

	if amount and amount > 0 and account.money >= amount then
		local amountToAdd = math.floor(amount*0.9)
		xPlayer.removeAccountMoney('black_money', amount)
		xPlayer.addMoney(amountToAdd)
		TriggerClientEvent('esx:showNotification', xPlayer.source, ("Przeprałeś %s$ i otrzymałeś %s$ czystej gotówki!"):format(amount, amountToAdd))
		exports['ocean_logs']:SendLog(source, "Wyprano brudne pieniądze:\nKonto: " .. society .. "\nKwota: " .. amount, 'boss_menu', '15158332')
	else
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
	end
end)

RegisterServerEvent('exilerp:washSecondMoney')
AddEventHandler('exilerp:washSecondMoney', function(society, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local account = xPlayer.getAccount('black_money')
	amount = ESX.Math.Round(tonumber(amount))

	if xPlayer.secondjob.name ~= society then
		--print(('esx_society: %s attempted to call washMoney!'):format(xPlayer.identifier))
		return
	end

	if amount and amount > 0 and account.money >= amount then
		local amountToAdd = math.floor(amount*0.9)
		xPlayer.removeAccountMoney('black_money', amount)
		xPlayer.addMoney(amountToAdd)
		TriggerClientEvent('esx:showNotification', xPlayer.source, ("Przeprałeś %s$ i otrzymałeś %s$ czystej gotówki!"):format(amount, amountToAdd))
		exports['ocean_logs']:SendLog(source, "Wyprano brudne pieniądze:\nKonto: " .. society .. "\nKwota: " .. amount, 'boss_menu', '15158332')
	else
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
	end
end)

ESX.RegisterServerCallback('esx_society:getSocietyMoney', function(source, cb, societyName)
	local society = GetSociety(societyName)

	if society then
		TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
			cb(account.account_money)
		end)
	else
		cb(0)
	end
end)

RegisterServerEvent('esx_society:giveLicense')
AddEventHandler('esx_society:giveLicense', function(employee, license)
	local xPlayer2 = ESX.GetPlayerFromId(source)
	local xPlayer = ESX.GetPlayerFromIdentifier(employee.identifier)
	if xPlayer ~= nil then
		TriggerEvent('esx_license:addLicense', xPlayer.source, license, function(data)
			if data then
				xPlayer2.showNotification('Nadano licencję ~b~' .. string.upper(license) .. '~w~ dla ~y~' .. employee.name)
			end
		end)
	else
		MySQL.update('INSERT INTO user_licenses (type, grade, owner, digit) VALUES (@type, @grade, @owner, @digit)', {
			['@type']  = license,
			['@grade'] = 1,
			['@owner'] = employee.identifier,
			['@digit'] = employee.digit
		}, function(rowsChanged)
			xPlayer2.showNotification('Nadano licencję ~b~' .. string.upper(license) .. '~w~ dla ~y~' .. employee.name)
		end)	
	end
end)

RegisterServerEvent('esx_society:getLicense')
AddEventHandler('esx_society:getLicense', function(employee, license)
	local xPlayer2 = ESX.GetPlayerFromId(source)
	local xPlayer = ESX.GetPlayerFromIdentifier(employee.identifier)
	if xPlayer ~= nil then
		TriggerEvent('esx_license:removeLicense', xPlayer.source, license, function(data)
			if data then
				xPlayer2.showNotification('Nadano licencję ~b~' .. string.upper(license) .. '~w~ dla ~y~' .. employee.name)
			end
		end)
	else
		MySQL.update('DELETE FROM user_licenses WHERE owner = @owner AND digit = @digit AND type = @type', {
			['@type']  = license,
			['@owner'] = employee.identifier,
			['@digit'] = employee.digit
		}, function(rowsChanged)
			xPlayer2.showNotification('Odebrano licencję ~b~' .. string.upper(license) .. '~w~ dla ~y~' .. employee.name)
		end)	
	end
end)

ESX.RegisterServerCallback('exilerp:showLicense', function(source, cb, society)
	MySQL.query('SELECT firstname, lastname, identifier, digit, job FROM users WHERE job = @job OR job = @job2 ORDER BY job_grade DESC', {
		['@job'] = society,
		['@job2'] = 'off'..society
	}, function (results)
		local employees = {}
		local found = false
		for i=1, #results, 1 do
			MySQL.query('SELECT type FROM user_licenses WHERE owner = @owner AND digit = @digit', {
				['@owner'] = results[i].identifier,
				['@digit'] = results[i].digit
			}, function(result2)
				local license = {}
				if result2[1] then
					for i=1, #result2, 1 do
						table.insert(license, {name = result2[i].type})
					end
				end
				table.insert(employees, {
					name       = results[i].firstname .. ' ' .. results[i].lastname,
					identifier = results[i].identifier,
					digit 	   = results[i].digit,
					licenses   = license
				})
				if #results == i then
					found = true
				end
			end)
		end
		
		while not found do
			Citizen.Wait(100)
		end
		
		cb(employees)
	end)
end)

ESX.RegisterServerCallback('exilerp:showWorker', function(source, cb, society)
	local kursykurwa = {}
	MySQL.query('SELECT identifier, digit, courses_count FROM user_courses WHERE secondjob = @job ORDER BY secondjob_grade DESC', {
		['@job'] = society,
	}, function (results2)
		for i=1, #results2, 1 do
			table.insert(kursykurwa, {identifier = results2[i].identifier, digit = results2[i].digit, count = results2[i].courses_count})
		end
		
		MySQL.query('SELECT firstname, lastname, identifier, digit,job, job_grade, job_id, time FROM users WHERE job = @job or job = @job2 ORDER BY job_grade DESC', {
			['@job'] = society,
			['@job2'] = 'off'..society
		}, function (results)
			local employees = {}
			for i=1, #results, 1 do
				local badge = json.decode(results[i].job_id)
				local _courses = 0
				for k,v in pairs(kursykurwa) do
					if v.identifier == results[i].identifier and v.digit == results[i].digit then
						_courses = v.count
					end
				end
				table.insert(employees, {
					name       = results[i].firstname .. ' ' .. results[i].lastname,
					identifier = results[i].identifier,
					digit = results[i].digit,
					job = {
						name        = results[i].job,
						label       = Jobs[results[i].job].label,
						courses		= _courses,
						grade       = results[i].job_grade,
						grade_name  = Jobs[results[i].job].grades[tostring(results[i].job_grade)].name,
						grade_label = Jobs[results[i].job].grades[tostring(results[i].job_grade)].label
					},
					badge = {
						label        = badge.name,
						number       = badge.id
					},
					time = results[i].time / 3600
				})
			end

			cb(employees)
		end)
	end)
end)

ESX.RegisterServerCallback('exilerp:showSecondWorker', function(source, cb, society)
	local kursykurwa = {}
	MySQL.query('SELECT identifier, digit, courses_count FROM user_courses WHERE secondjob = ? ORDER BY secondjob_grade DESC', {society}, function (results2)
		for i=1, #results2 do
			table.insert(kursykurwa, {identifier = results2[i].identifier, digit = results2[i].digit, count = results2[i].courses_count})
		end
		MySQL.query('SELECT firstname, lastname, identifier, digit, secondjob, secondjob_grade FROM users WHERE secondjob = ? ORDER BY secondjob_grade DESC', {society}, function (results)
			local employees = {}
			for i=1, #results do
				local _course = 0
				for k,v in pairs(kursykurwa) do
					if v.identifier == results[i].identifier and v.digit == results[i].digit then
						_course = v.count
					end
				end
				table.insert(employees, {
					name = results[i].firstname .. ' ' .. results[i].lastname,
					identifier = results[i].identifier,
					secondjob = {
						name = society,
						label       = Jobs[results[i].secondjob].label,
						courses		= _course,
						grade       = results[i].secondjob_grade,
						grade_name  = Jobs[results[i].secondjob].grades[tostring(results[i].secondjob_grade)].name,
						grade_label = Jobs[results[i].secondjob].grades[tostring(results[i].secondjob_grade)].label
					}
				})
			end
			cb(employees)
		end)
	end)
end)

ESX.RegisterServerCallback("esx_society:zeruj_kursy",function(source, cb, value)
	MySQL.update('UPDATE user_courses SET courses_count = @courses_count WHERE identifier = @identifier AND digit = @digit', {
		['@identifier']        = value.identifier,
		['@digit']  = value.digit,
		['@courses_count'] = 0
	}, function(rowsChanged)
		cb()
	end)	
end)

ESX.RegisterServerCallback("esx_society:zeruj_kursy_all",function(source, cb, value)
	MySQL.update('UPDATE user_courses SET courses_count = 0 WHERE job = @job', {
		['@job']        = value,
		['@courses_count'] = 0
	}, function(rowsChanged)
		cb()
	end)	
end)

ESX.RegisterServerCallback("esx_society:getMeNames",function(source, callback, ids)
    local identities = {}
    for k,v in pairs(ids) do
        local xPlayer = ESX.GetPlayerFromId(v)
		
		if xPlayer ~= nil then
			identities[v] = xPlayer.character.firstname..' '..xPlayer.character.lastname
		end
    end
	
    callback(identities)
end)

ESX.RegisterServerCallback('society:countMembers', function(source, cb, society)
	local employees = {}
	local result = MySQL.scalar.await("SELECT COUNT(1) FROM users WHERE `job` = '"..society.."'")
	cb(result)
end)

ESX.RegisterServerCallback('society:countHiddenMembers', function(source, cb, society)
	local employees = {}
	local result = MySQL.scalar.await("SELECT COUNT(1) FROM users WHERE `thirdjob` = '"..society.."'")
	cb(result)
end)

ESX.RegisterServerCallback('society:countSecondMembers', function(source, cb, society)
	local employees = {}
	local result = MySQL.scalar.await("SELECT COUNT(1) FROM users WHERE `secondjob` = '"..society.."'")
	cb(result)
end)

ESX.RegisterServerCallback('society:countLicenseMembers', function(source, cb, society)
	local result = MySQL.scalar.await("SELECT COUNT(1) FROM user_licenses WHERE `type` = 'hp'")
	cb(result)
end)

local hwpGrades = {
	"Probie Officer",
	"Officer",
	"Sergeant",
	"Lieutenant",
	"Captain",
	"Commander",
	"Deputy Chief",
	"Chief"
}

local swatGrades = {
	"Probie Operator",
	"Operator",
	"Advanced Operator",
	"Team Leader",
	"Deputy Chief",
	"Chief"
}

local sertGrades = {
	"Probie Operator",
	"Operator",
	"Team Leader",
	"Commander"
}

local dtuGrades = {
	"Probie Detective",
	"Detective",
	"Commander"
}

ESX.RegisterServerCallback('exilerp:showLicensePracownicy', function(source, cb, society)
	local usersWithLicense = MySQL.query.await('SELECT owner,digit,grade FROM user_licenses ORDER BY grade DESC', {})
	local employees = {}
	for i=1, #usersWithLicense, 1 do
		local results = MySQL.query.await('SELECT firstname, lastname, identifier FROM users WHERE identifier = @identifier', {
			['@identifier'] = usersWithLicense[i].owner
		})
		if results then
			local grade = usersWithLicense[i].grade
			if not grade then
				grade = 1
			end	
			table.insert(employees, {
				name       = results[1].firstname .. ' ' .. results[1].lastname,
				identifier = results[1].identifier,
				hiddenjob = {
					name        = "hp",
					label       = "Highway Patrol",
					grade       = grade,
					grade_name  = "boss",
					_test = "xd",
					grade_label = hwpGrades[grade],
				}
			})
		end
	end	
	cb(employees)
end)


RegisterServerEvent('exilerp:awansLicense', function(identifier)
	MySQL.update('UPDATE user_licenses SET grade = grade + 1 WHERE owner = @identifier',
	{
		['@identifier'] = identifier,
	}, function(rowsChanged)
	end)
end)

ESX.RegisterServerCallback('exilerp:showLicenseMemberDTU', function(source, cb, society)
	local usersWithLicense = MySQL.query.await('SELECT owner,digit,grade FROM user_licenses ORDER BY grade DESC', {})
	local employees = {}
	for i=1, #usersWithLicense, 1 do
		local results = MySQL.query.await('SELECT firstname, lastname, identifier FROM users WHERE identifier = @identifier AND digit = @digit', {
			['@identifier'] = usersWithLicense[i].owner,
			['@digit'] = usersWithLicense[i].digit
		})
		if results then
			local grade = usersWithLicense[i].grade
			if not grade then
				grade = 1
			end	

			if(results[1].firstname ~= nil) then
				imie = results[1].firstname
			else
				imie = 'Brak'
			end

			if(results[1].lastname ~= nil) then
				nazwisko = results[1].lastname
			else
				nazwisko = 'brak'
			end
		
			table.insert(employees, {
				name       = imie .. ' ' .. nazwisko,
				identifier = results[1].identifier,
				digit = _digit,
				hiddenjob = {
					name        = "dtu",
					label       = "DTU",
					grade       = grade,
					grade_name  = "boss",
					grade_label = dtuGrades[grade],
				}
			})
		end
	end	
	cb(employees)
end)

ESX.RegisterServerCallback('exilerp:showLicenseMemberSERT', function(source, cb, society)
	local usersWithLicense = MySQL.query.await('SELECT owner,digit,grade FROM user_licenses ORDER BY grade DESC', {})
	local employees = {}
	for i=1, #usersWithLicense, 1 do
		local results = MySQL.query.await('SELECT firstname, lastname, identifier FROM users WHERE identifier = @identifier AND digit = @digit', {
			['@identifier'] = usersWithLicense[i].owner,
			['@digit'] = usersWithLicense[i].digit
		})
		if results then
			local grade = usersWithLicense[i].grade
			if not grade then
				grade = 1
			end	

			if(results[1].firstname ~= nil) then
				imie = results[1].firstname
			else
				imie = 'Brak'
			end

			if(results[1].lastname ~= nil) then
				nazwisko = results[1].lastname
			else
				nazwisko = 'brak'
			end
		
			table.insert(employees, {
				name       = imie .. ' ' .. nazwisko,
				identifier = results[1].identifier,
				digit = _digit,
				hiddenjob = {
					name        = "sert",
					label       = "SERT",
					grade       = grade,
					grade_name  = "boss",
					grade_label = sertGrades[grade],
				}
			})
		end
	end	
	cb(employees)
end)

ESX.RegisterServerCallback('exilerp:showLicenseMemberSWAT', function(source, cb, society)
	local usersWithLicense = MySQL.query.await('SELECT owner,digit,grade FROM user_licenses ORDER BY grade DESC', {})
	local employees = {}
	for i=1, #usersWithLicense, 1 do
		local results = MySQL.query.await('SELECT firstname, lastname, identifier FROM users WHERE identifier = @identifier AND digit = @digit', {
			['@identifier'] = usersWithLicense[i].owner,
			['@digit'] = usersWithLicense[i].digit
		})
		if results then
			local grade = usersWithLicense[i].grade
			if not grade then
				grade = 1
			end	

			if(results[1].firstname ~= nil) then
				imie = results[1].firstname
			else
				imie = 'Brak'
			end

			if(results[1].lastname ~= nil) then
				nazwisko = results[1].lastname
			else
				nazwisko = 'brak'
			end
		
			table.insert(employees, {
				name       = imie .. ' ' .. nazwisko,
				identifier = results[1].identifier,
				digit = _digit,
				hiddenjob = {
					name        = "swat",
					label       = "Special Weapons and Tactics",
					grade       = grade,
					grade_name  = "boss",
					grade_label = swatGrades[grade],
				}
			})
		end
	end	
	cb(employees)
end)

ESX.RegisterServerCallback('exilerp:showLicenseMember', function(source, cb, society)
	local usersWithLicense = MySQL.query.await('SELECT owner,digit,grade FROM user_licenses WHERE `type` = "' .. society .. '" ORDER BY grade DESC ', {})
	local employees = {}
	
	for i=1, #usersWithLicense, 1 do
		local results = MySQL.query.await('SELECT firstname, lastname, identifier FROM users WHERE digit = @digit', {
			['@identifier'] = usersWithLicense[i].owner,
			['@digit'] = usersWithLicense[i].digit
		})
		if results then
			local grade = usersWithLicense[i].grade
			if not grade then
				grade = 1
			end	

			if(results[1].firstname ~= nil) then
				imie = results[1].firstname
			else
				imie = 'Brak'
			end

			if(results[1].lastname ~= nil) then
				nazwisko = results[1].lastname
			else
				nazwisko = 'brak'
			end
		
			table.insert(employees, {
				name       = imie .. ' ' .. nazwisko,
				identifier = results[1].identifier,
				digit = usersWithLicense[i].digit,
				hiddenjob = {
					name        = "hp",
					label       = "Highway Patrol",
					grade       = grade,
					grade_name  = "boss",
					grade_label = hwpGrades[grade],
				}
			})
		end
	end	
	cb(employees)
end)

ESX.RegisterServerCallback('exilerp:showThirdWorker', function(source, cb, society)
	local employees = {}
	local result = MySQL.query.await('SELECT firstname, lastname, identifier, thirdjob, thirdjob_grade FROM users WHERE thirdjob = @thirdjob ORDER BY thirdjob_grade DESC', {
		['@thirdjob'] = society
	})
	for i=1, #result, 1 do
		table.insert(employees, {
			name       = result[i].firstname .. ' ' .. result[i].lastname,
			identifier = result[i].identifier,
			thirdjob = {
				name        = result[i].thirdjob,
				label       = Jobs[result[i].thirdjob].label,
				grade       = result[i].thirdjob_grade,
				grade_name  = Jobs[result[i].thirdjob].grades[tostring(result[i].thirdjob_grade)].name,
				grade_label = Jobs[result[i].thirdjob].grades[tostring(result[i].thirdjob_grade)].label,
			}
		})
	end
	cb(employees)
end)


ESX.RegisterServerCallback('esx_society:getJob', function(source, cb, society)
	local job    = json.decode(json.encode(Jobs[society]))
	local grades = {}

	for k,v in pairs(job.grades) do
		table.insert(grades, v)
	end

	table.sort(grades, function(a, b)
		return a.grade < b.grade
	end)

	job.grades = grades

	cb(job)
end)


ESX.RegisterServerCallback('esx_society:setJob', function(source, cb, identifier, job, grade, typee)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = nil
	
	if type(identifier) == 'number' then
		xTarget = ESX.GetPlayerFromId(identifier)
		identifier = xTarget.identifier
	else
		xTarget = ESX.GetPlayerFromIdentifier(identifier)
	end

	if xTarget then
		xTarget.setJob(job, grade)

		--[[if xTarget.source then
			if typee == 'hire' then
				TriggerClientEvent('esx:showNotification', xTarget.source,  _U('you_have_been_hired', xTarget.getJob().label))
			elseif typee == 'promote' then
				TriggerClientEvent('esx:showNotification', xTarget.source,  _U('you_have_been_promoted'))
			elseif typee == 'fire' then
				TriggerClientEvent('esx:showNotification', xTarget.source,  _U('you_have_been_fired', xTarget.getJob().label))
			end
			
			MySQL.update('UPDATE users SET job = @job, job_grade = @job_grade, digit = @digit WHERE identifier = @identifier',
			{
				['@job']        = job,
				['@job_grade']  = grade,
				['@identifier'] = xTarget.identifier,
				['@digit'] = xTarget.digit,
			}, function(rowsChanged)
				cb()
			end)
		else
			MySQL.update('UPDATE users SET job = @job, job_grade = @job_grade, digit = @digit WHERE identifier = @identifier',
			{
				['@job']        = job,
				['@job_grade']  = grade,
				['@identifier'] = identifier,
				['@digit'] = xTarget.digit,
			}, function(rowsChanged)
				cb()
			end)		
		end
	else
		MySQL.update('UPDATE users SET job = @job, job_grade = @job_grade, digit = @digit WHERE identifier = @identifier', {
			['@job']        = job,
			['@job_grade']  = grade,
			['@identifier'] = identifier,
			['@digit'] = xTarget.digit,
		}, function(rowsChanged)
			cb()
		end)]]
		if xTarget.source then
			if typee == 'hire' then
				TriggerClientEvent('esx:showNotification', xTarget.source,  _U('you_have_been_hired', xTarget.getJob().label))
			elseif typee == 'promote' then
				TriggerClientEvent('esx:showNotification', xTarget.source,  _U('you_have_been_promoted'))
			elseif typee == 'fire' then
				TriggerClientEvent('esx:showNotification', xTarget.source,  _U('you_have_been_fired', xTarget.getJob().label))
			end
			
			MySQL.update('UPDATE users SET job = @job, job_grade = @job_grade WHERE identifier = @identifier',
			{
				['@job']        = job,
				['@job_grade']  = grade,
				['@identifier'] = xTarget.identifier,
			}, function(rowsChanged)
				cb()
			end)
		else
			MySQL.update('UPDATE users SET job = @job, job_grade = @job_grade WHERE identifier = @identifier',
			{
				['@job']        = job,
				['@job_grade']  = grade,
				['@identifier'] = identifier,
			}, function(rowsChanged)
				cb()
			end)		
		end
	else
		MySQL.update('UPDATE users SET job = @job, job_grade = @job_grade WHERE identifier = @identifier', {
			['@job']        = job,
			['@job_grade']  = grade,
			['@identifier'] = identifier,
		}, function(rowsChanged)
			cb()
		end)
	end
end)

ESX.RegisterServerCallback('esx_society:setThirdJob', function(source, cb, identifier, job, grade, typee)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = nil

	if type(identifier) == 'number' then
		xTarget = ESX.GetPlayerFromId(identifier)
		identifier = xTarget.identifier
	else
		xTarget = ESX.GetPlayerFromIdentifier(identifier)
	end

	if xTarget then
		xTarget.setThirdJob(job, grade)

		--[[if xTarget.source then
			if typee == 'hire' then
				TriggerClientEvent('esx:showNotification', xTarget.source, _U('you_have_been_hired', job))
			elseif typee == 'promote' then
				TriggerClientEvent('esx:showNotification', xTarget.source, _U('you_have_been_promoted'))
			elseif typee == 'fire' then
				TriggerClientEvent('esx:showNotification', xTarget.source, _U('you_have_been_fired', xTarget.getThirdJob().label))
			end

			MySQL.update('UPDATE users SET thirdjob = @thirdjob, thirdjob_grade = @thirdjob_grade, digit = @digit WHERE identifier = @identifier',
			{
				['@thirdjob']        = job,
				['@thirdjob_grade']  = grade,
				['@identifier'] = xTarget.identifier,
				['@digit'] = xTarget.digit,
			}, function(rowsChanged)
				cb()
			end)
		else
			MySQL.update('UPDATE users SET thirdjob = @thirdjob, thirdjob_grade = @thirdjob_grade, digit = @digit WHERE identifier = @identifier', {
				['@thirdjob']        = job,
				['@thirdjob_grade']  = grade,
				['@identifier'] 	  = identifier,
				['@digit'] = xTarget.digit,
			}, function(rowsChanged)
				cb()
			end)
		end
	else
		MySQL.update('UPDATE users SET thirdjob = @thirdjob, thirdjob_grade = @thirdjob_grade, digit = @digit WHERE identifier = @identifier', {
			['@thirdjob']        = job,
			['@thirdjob_grade']  = grade,
			['@identifier'] 	  = identifier,
			['@digit'] = xTarget.digit,
		}, function(rowsChanged)
			cb()
		end)]]
		if xTarget.source then
			if typee == 'hire' then
				TriggerClientEvent('esx:showNotification', xTarget.source, _U('you_have_been_hired', job))
			elseif typee == 'promote' then
				TriggerClientEvent('esx:showNotification', xTarget.source, _U('you_have_been_promoted'))
			elseif typee == 'fire' then
				TriggerClientEvent('esx:showNotification', xTarget.source, _U('you_have_been_fired', xTarget.getThirdJob().label))
			end

			MySQL.update('UPDATE users SET thirdjob = @thirdjob, thirdjob_grade = @thirdjob_grade WHERE identifier = @identifier',
			{
				['@thirdjob']        = job,
				['@thirdjob_grade']  = grade,
				['@identifier'] = xTarget.identifier,
			}, function(rowsChanged)
				cb()
			end)
		else
			MySQL.update('UPDATE users SET thirdjob = @thirdjob, thirdjob_grade = @thirdjob_grade WHERE identifier = @identifier', {
				['@thirdjob']        = job,
				['@thirdjob_grade']  = grade,
				['@identifier'] 	  = identifier,
			}, function(rowsChanged)
				cb()
			end)
		end
	else
		MySQL.update('UPDATE users SET thirdjob = @thirdjob, thirdjob_grade = @thirdjob_grade WHERE identifier = @identifier', {
			['@thirdjob']        = job,
			['@thirdjob_grade']  = grade,
			['@identifier'] 	  = identifier,
		}, function(rowsChanged)
			cb()
		end)
	end
end)

ESX.RegisterServerCallback('esx_society:setSecondJob', function(source, cb, identifier, job, grade, typee)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = nil

	if type(identifier) == 'number' then
		xTarget = ESX.GetPlayerFromId(identifier)
		identifier = xTarget.identifier
	else
		xTarget = ESX.GetPlayerFromIdentifier(identifier)
	end

	if xTarget then
		xTarget.setSecondJob(job, grade)

		if xTarget.source then
			if typee == 'hire' then
				TriggerClientEvent('esx:showNotification', xTarget.source, _U('you_have_been_hired', job))
			elseif typee == 'promote' then
				TriggerClientEvent('esx:showNotification', xTarget.source, _U('you_have_been_promoted'))
			elseif typee == 'fire' then
				TriggerClientEvent('esx:showNotification', xTarget.source, _U('you_have_been_fired', xTarget.getSecondJob().label))
			end

			MySQL.update('UPDATE users SET secondjob = @secondjob, secondjob_grade = @secondjob_grade WHERE identifier = @identifier',
			{
				['@secondjob']        = job,
				['@secondjob_grade']  = grade,
				['@identifier'] = xTarget.identifier,
			}, function(rowsChanged)
				cb()
			end)
		else
			MySQL.update('UPDATE users SET secondjob = @secondjob, secondjob_grade = @secondjob_grade WHERE identifier = @identifier', {
				['@secondjob']        = job,
				['@secondjob_grade']  = grade,
				['@identifier'] 	  = identifier,
			}, function(rowsChanged)
				cb()
			end)
		end
	else
		MySQL.update('UPDATE users SET secondjob = @secondjob, secondjob_grade = @secondjob_grade WHERE identifier = @identifier', {
			['@secondjob']        = job,
			['@secondjob_grade']  = grade,
			['@identifier'] 	  = identifier,
		}, function(rowsChanged)
			cb()
		end)
	end
end)

ESX.RegisterServerCallback('esx_society:setLicenseJob', function(source, cb, identifier, job, grade, typee)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = nil
	

	if type(identifier) == 'number' then
		xTarget = ESX.GetPlayerFromId(identifier)
		identifier = xTarget.identifier
	else
		xTarget = ESX.GetPlayerFromIdentifier(identifier)
	end

	if xTarget then

		if xTarget.source then
			if typee == 'hire' then
				TriggerClientEvent('esx:showNotification', xTarget.source, _U('you_have_been_hired', "Highway Patrol"))
			elseif typee == 'promote' then
				TriggerClientEvent('esx:showNotification', xTarget.source, _U('you_have_been_promoted'))
			elseif typee == 'fire' then
				TriggerClientEvent('esx:showNotification', xTarget.source, _U('you_have_been_fired', "Highway Patrol"))
			end
			if typee == "fire" then
				MySQL.update('DELETE FROM user_licenses WHERE owner = @identifier',
				{
					['@type']        = job,
					['@digit'] = xTarget.digit,
					['@identifier'] = xTarget.identifier
				}, function(rowsChanged)
					cb()
				end)
			elseif typee == "hire" then
				MySQL.update('INSERT INTO user_licenses (`id`, `type`, `grade`, `owner`, `digit`, `time`) VALUES (NULL, @type, @grade, @identifier, @digit, @time)',
				{
					['@type'] = job,
					['@grade'] = 1,
					['@digit'] = xTarget.digit,
					['@identifier'] = xTarget.identifier,
					['@time'] = "-1"
				}, function(rowsChanged)
					cb()
				end)
			else	
				MySQL.update('UPDATE user_licenses SET grade = @grade, digit = @digit, type = @type WHERE owner = @identifier',
				{
					['@type']        = job,
					['@digit'] = xTarget.digit,
					['@grade']  = grade,
					['@identifier'] = xTarget.identifier
				}, function(rowsChanged)
					cb()
				end)
			end
		else
			MySQL.update('UPDATE user_licenses SET grade = @grade, digit = @digit, type = @type WHERE owner = @identifier',
			{
				['type']        = job,
				['digit'] = xTarget.digit,
				['grade']  = grade,
				['@identifier'] = xTarget.identifier
			}, function(rowsChanged)
				cb()
			end)
		end
	else
		xPlayer.showNotification("Aby zwolnić gościa musi być na swojej głównej postaci")
	end
end)

ESX.RegisterServerCallback('esx_society:getVehiclesInGarage', function(source, cb, societyName)
	local society = GetSociety(societyName)

	TriggerEvent('esx_datastore:getSharedDataStore', society.datastore, function(store)
		local garage = store.get('garage') or {}
		cb(garage)
	end)
end)

RegisterServerEvent('esx_society:clearhours')
AddEventHandler('esx_society:clearhours', function (identifier)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
  	MySQL.update(
    	'UPDATE users SET time = @time, digit = @digit WHERE identifier = @identifier',
    	{
     	['@time'] = 0,
		['@digit'] = xPlayer.digit,
      	['@identifier'] = identifier
    	},	
    	function (rowsChanged)
	end)
end)