ESX = nil

local categoriesLastUpdateMillis = nil
local categoriesData = nil
local tagsLastUpdateMillis = nil
local tagsData = nil
local citizenTagPrefix = 'lspd.citizen.tag.'
local vehicleTagPrefix = 'lspd.vehicle.tag.'

TriggerEvent('exilerp:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_mdc:getAllTags', function(source, cb, target)
	if updateTimeExpired(tagsLastUpdateMillis, Config.expirationCacheMillis) then
		tagsData = MySQL.query.await('SELECT * FROM lspd_mdc_tag_suggestion',  {});
		tagsLastUpdateMillis = now()
	end
	cb(tagsData)
end)

ESX.RegisterServerCallback('esx_mdc:getConvictionCategories', function(source, cb, target)
	if updateTimeExpired(categoriesLastUpdateMillis, Config.expirationCacheMillis) then
		local categories = MySQL.query.await('SELECT id, name as categoryName, color FROM lspd_mdc_judgments_suggestion_category',  {});
		categoriesData = {}
		if categories[1] ~= nil then
			for _, catSuggestion in ipairs(categories) do
				local items = MySQL.query.await('SELECT * FROM lspd_mdc_judgments_suggestion WHERE categoryId = @categoryId', {
					['@categoryId'] = catSuggestion.id
				});
				catSuggestion.items = items
				table.insert(categoriesData, catSuggestion)
			end
		end
		categoriesLastUpdateMillis = now()
	end
	cb(categoriesData)
end)

function updateTimeExpired(timeMillis, expirationMillis)
	return timeMillis == nil or timeMillis <= now() - expirationMillis
end

function now()
	return os.time() * 1000 -- ms
end

ESX.RegisterServerCallback('esx_mdc:getPlayerName', function(source, cb, target, jobName, jobGrade)
	local xPlayer = ESX.GetPlayerFromId(target)
	local resultUser = MySQL.query.await('SELECT * FROM users WHERE identifier = @identifier AND digit = @digit',  {
		['@identifier'] = xPlayer.identifier,
		['@digit'] = xPlayer.digit
	});
	local userData = resultUser[1]
	local resultDepartment = MySQL.query.await('SELECT CONCAT(\'(\',job.label,\' - \', grade.label,\')\') as departmentGrade FROM `jobs` job join `job_grades` grade on job.name = grade.job_name WHERE job.name=@job and grade.grade = @job_grade', {
		['job'] = jobName,
		['job_grade'] = jobGrade
	} );
	local departmentData = resultDepartment[1]
	print(departmentData.departmentGrade)
	cb(userData.firstname .. ' ' .. userData.lastname, departmentData.departmentGrade)
end)

ESX.RegisterServerCallback('esx_mdc:getCitizensWarrantsList', function(source, cb, target)
	MySQL.query('SELECT CONCAT(FIRSTNAME, \' \', LASTNAME) AS `citizenName`, \'\' AS photo, `sex`, `dateofbirth` AS birthdate FROM `users` WHERE identifier IN (SELECT userId FROM `user_properties` WHERE value = \'Poszukiwany\')',  {}, 
		function(result)
			local users = result;
			local users = {}
			for _, userData in ipairs(result) do
				if userData.sex == 'm' then
					userData.sex = "Mężczyzna"
				else
					userData.sex = "Kobieta"
				end
				table.insert(users, userData)
			end
			cb(users)
		end
	);
end)

ESX.RegisterServerCallback('esx_mdc:getVehicleByPlate', function(source, cb, plate)
	MySQL.query('SELECT * FROM `owned_vehicles` WHERE LOWER(`plate`) = LOWER(@plate) OR LOWER(REPLACE(`plate`, \' \', \'\')) like LOWER(REPLACE(\'%' .. plate .. '%\', \' \', \'\'))',  {
		['@plate'] = plate
	}, 
		function(vehicleResult)
			local vehicleData = vehicleResult[1]
			if vehicleData == nil then
				cb({})
			else
				local owner = MySQL.query.await('SELECT job, job_grade, CONCAT(FIRSTNAME, \' \', LASTNAME) AS fullName FROM users WHERE identifier = @owner AND digit = @digit', {
					['@owner'] = vehicleData.owner,
					['@digit'] = vehicleData.digit
				});
				vehicleData.ownerName = owner[1].fullName

				local notes = MySQL.query.await('SELECT *, DATE_FORMAT(date, "%d/%m/%Y %H:%i:%s") AS date from lspd_mdc_vehicle_notes WHERE vehicleId = @vehicleId ORDER BY date DESC', {
					['vehicleId'] = vehicleData.id
				} );
				if notes == nil then motes = {} end
				vehicleData.mdcNotes = notes

				local lspdTags = MySQL.query.await('SELECT value from vehicle_properties WHERE vehicleId = @vehicleId and name like \'' .. vehicleTagPrefix .. '%\'', {
					['vehicleId'] = vehicleData.id
				});

				vehicleData.modelname = json.decode(vehicleData.vehicle).name

				local lspdVehicleTags = {}
				for _, tag in ipairs(lspdTags) do
					table.insert(lspdVehicleTags, tag.value)
				end
				vehicleData.lspdTags = lspdVehicleTags
				cb(vehicleData)
			end
		end
	);
end)

RegisterServerEvent('esx_mdc:addNewVehicleNote')
AddEventHandler('esx_mdc:addNewVehicleNote', function(vehicleId, noteData)
	MySQL.update.await('INSERT INTO `lspd_mdc_vehicle_notes` (`addedBy`, `text`, `vehicleId`) VALUES (@addedBy, @text, @vehicle)',
	{
		['@addedBy'] = noteData.addedBy,
		['@text']    = noteData.text,
		['@vehicle'] = vehicleId
	})
end)

function GetRPName(playerId, data)
	local xPlayer = ESX.GetPlayerFromId(playerId)
	if xPlayer ~= nil then
		data(xPlayer.character.firstname, xPlayer.character.lastname)
	end
end

RegisterServerEvent('esx_mdc:addNewCitizenConviction')
AddEventHandler('esx_mdc:addNewCitizenConviction', function(playerJobName, citizenId, convictionData)
	local xCitizen = ESX.GetPlayerFromIdentifier(citizenId)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name ~= "police" or xPlayer.job.name ~= "sheriff" then
		TriggerEvent('csskrouble:banPlr', "nigger", _source, "Tried to send player to jail without job (policemdc)")
		return
	end
	if xCitizen ~= nil then
		local citizenServerId = xCitizen.source
		local jailLength = convictionData.length
		local fee = convictionData.fee
		local crimes = convictionData.crimes
		local sentencespan = 0
		print('1')
		if jailLength == nil or jailLength == 0 then
			xCitizen.removeAccountMoney('bank', fee)
			TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..xPlayer.job.name, function(account)
				account.addAccountMoney(math.floor(fee * 70 / 100))
				xPlayer.addMoney(math.floor(fee * 30 / 100))
			end)
			GetRPName(citizenServerId, function(firstname, lastname)
				TriggerClientEvent('chatMessage', -1, "[SĘDZIA] ^4" .. firstname .. " " .. lastname .. "^7 otrzymał mandat w wysokości ^4" .. fee .. "$^7 za ^4" .. crimes)
			end)
			exports['ocean_logs']:SendLog(source, "Wystawiono mandat dla [" .. citizenServerId .. "] " .. GetPlayerName(citizenServerId) .. ":\nPowód: " .. crimes .. "\nKwota: " .. fee, 'fines', '10181046')
		else
			sentencespan = jailLength
			TriggerEvent('xlem0n_jailer:wpierdolchuja', citizenServerId, jailLength * 60)
			xCitizen.removeAccountMoney('bank', fee)
			TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..xPlayer.job.name, function(account)
				account.addAccountMoney(fee)
			end)
			GetRPName(citizenServerId, function(firstname, lastname)
				TriggerClientEvent('chatMessage', -1, "[SĘDZIA] ^4" .. firstname .. " " .. lastname .. "^7 otrzymał karę więzenia: ^4".. jailLength.. " miesięcy ^7za ^4" .. crimes .. "^7 oraz karę o wartości: ^4" .. fee.. '$')
				exports['ocean_logs']:SendLog(source, "Obywatel: "..firstname.." "..lastname.."\nWyrok: "..crimes.."\nOtrzymane miesiące: "..jailLength.."\nOtrzymana grzywna: "..fee, 'wyroki', '5793266')
			end)
			TriggerEvent('xlem0n_policejob:unrestrain', citizenServerId)
			exports['ocean_logs']:SendLog(source, "Wysłano [" .. citizenServerId .. "] " .. GetPlayerName(citizenServerId) .. " do więzienia:\nPowód: " .. crimes .. "\nKwota: " .. fee .. "\nCzas: " .. jailLength, 'fines', '15158332')
		end
		print('2')
		MySQL.update.await('INSERT INTO `lspd_user_judgments` (`userId`, `crimes`, `note`, `addedBy`, `length`, `fee`, `digit`) VALUES (@userId, @crimes, @note, @addedBy, @length, @fee, @digit)',
		{
			['@userId']  = citizenId,
			['@crimes']  = convictionData.crimes,
			['@note']    = convictionData.note,
			['@addedBy'] = convictionData.addedBy,
			['@length']  = convictionData.length,
			['@fee']     = convictionData.fee,
			['@digit'] = citizenId.digit
		})
	else
		print('MDC ERROR - xCitizen not found for ' .. citizenId)
	end
end)


RegisterServerEvent('esx_mdc:saveVehicle')
AddEventHandler('esx_mdc:saveVehicle', function(vehicleData)
	-- update properties
	MySQL.update.await('DELETE FROM `vehicle_properties` WHERE `vehicleId` = @vehicleId and `name` like \'' .. vehicleTagPrefix .. '%\'',
	{
		['@vehicleId'] = vehicleData.id
	})

	local values = 'INSERT INTO `vehicle_properties` (`vehicleId`, `name`, `value`) VALUES '
	local count = 1
	for _, tag in ipairs(vehicleData.lspdTags) do
		if( count ~= 1 ) then
			values = values .. ', '
		end
		values = values .. '(\'' .. vehicleData.id .. '\', \'' .. vehicleTagPrefix .. count .. '\', \'' .. tag .. '\')'
		count = count + 1
	end
	if count ~= 1 then
		MySQL.update.await(values, {})
	end
end)

ESX.RegisterServerCallback('esx_mdc:getVehiclesWarrantsList', function(source, cb, target)
	MySQL.query('SELECT owner, digit plate AS plateText, firstmodel, digit AS model, CONCAT(FIRSTNAME, \' \', LASTNAME) AS owner FROM `owned_vehicles` join `users` on owner = identifier on digit = digit WHERE id IN (SELECT vehicleId FROM `vehicle_properties` WHERE value = \'Poszukiwany\')',  {}, 
		function(vehicleResult)
			cb(vehicleResult)
		end
	);
end)

MySQL.ready(function()
	MySQL.update.await("DELETE FROM lspd_mdc_user_notes WHERE (DATEDIFF(CURRENT_DATE, date) > 7)")
	--MySQL.update.await("DELETE FROM lspd_mdc_vehicle_notes WHERE (DATEDIFF(CURRENT_DATE, date) > 7)")
end)

ESX.RegisterServerCallback("esx_mdc:getCitizenByID", function(source,cb,id) 
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	if xPlayer.job.name == 'police' or xPlayer.job.name == 'offpolice' or xPlayer.job.name == 'sheriff' or xPlayer.job.name == 'offsheriff' then
		local targetPlayer = ESX.GetPlayerFromId(id)
		if targetPlayer and targetPlayer.source ~= 0 then
			MySQL.query("SELECT * FROM users WHERE identifier = @identifier AND digit = @digit", {
				["@identifier"] = targetPlayer.getIdentifier(),
				["@digit"] = targetPlayer.getDigit()
			}, function(results) 
				local userData = results[1]
				if userData == nil then
					cb({})
				else
					local licenses = MySQL.query.await('SELECT * from user_licenses WHERE owner = @owner AND digit = @digit', {
						['@owner'] = userData.identifier,
						['@digit'] = userData.digit
					} );
					local tempdrive = false 
					local drive = false
					local weapon = false
					for _, license in ipairs(licenses) do
						if license.type == 'drive' then
							drive = true
						end
						if license.type == 'tempdrive' then
							tempdrive = true
						end
						if license.type == 'weapon' then
							weapon = true
						end
					end
					userData.driverLicense = drive and tempdrive
					userData.weaponLicense = weapon

					local resultApartments = MySQL.query.await('SELECT * from owned_properties WHERE owner = @owner AND digit = @digit', {
						['owner'] = userData.identifier,
						["@digit"] = userData.digit
					} );
					userData.houses = resultApartments

					--[[local resultBusinesses = MySQL.query.await('SELECT * from srp_businesses WHERE owner = @owner', {
						['owner'] = userData.identifier
					} );]]
					userData.businesses = resultBusinesses

					local notes = MySQL.query.await('SELECT *, DATE_FORMAT(date, "%d/%m/%Y %H:%i:%s") AS date from lspd_mdc_user_notes WHERE userId = @owner AND digit = @digit ORDER BY id DESC', {
						['owner'] = userData.identifier,
						["@digit"] = userData.digit
					} );
					if notes == nil then motes = {} end
					userData.mdcNotes = notes

					local lspdTags = MySQL.query.await('SELECT value from user_properties WHERE userId = @owner AND digit = @digit and name like \'' .. citizenTagPrefix .. '%\'', {
						['owner'] = userData.identifier,
						["@digit"] = userData.digit
					});

					local lspdUserTags = {}
					for _, tag in ipairs(lspdTags) do
						table.insert(lspdUserTags, tag.value)
					end
					userData.lspdTags = lspdUserTags

					local convictions = MySQL.query.await('SELECT *, DATE_FORMAT(date, "%d/%m/%Y %H:%i:%s") AS date from lspd_user_judgments WHERE userId = @owner AND digit = @digit ORDER BY date DESC', {
						['owner'] = userData.identifier,
						["@digit"] = userData.digit
					});
					userData.convictions = convictions

					if userData.sex == 'm' then
						userData.sex = "Mężczyzna"
					else
						userData.sex = "Kobieta"
					end
					cb(userData)
				end
			end)
		else
			xPlayer.showNotification("~r~Nie ma gracza o id ~y~["..id.."] ~r~na serwerze!")
		end
	end
end)

ESX.RegisterServerCallback('esx_mdc:getCitizenByName', function(source, cb, citizenName, citizenId)
	local whereClausure
	local xPlayer = ESX.GetPlayerFromId(source)
	if (xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff') then
		if citizenId ~= nil then
			whereClausure = 'T.identifier = \'' .. citizenId .. '\''
		else
			whereClausure = 'LOWER(T.fullName) like LOWER(\'%' .. citizenName .. '%\')'
		end
		MySQL.query('SELECT * from (select *, CONCAT(FIRSTNAME, \' \', LASTNAME) AS fullName FROM users) as T WHERE ' .. whereClausure, {}, 
			function(resultUsers)
				local userData = resultUsers[1] -- ignore other results

				if userData == nil then
					cb({})
				else
					if #resultUsers > 1 then
						cb(resultUsers)
					else
						local licenses = MySQL.query.await('SELECT * from user_licenses WHERE owner = @owner AND digit = @digit', {
							['@owner'] = userData.identifier,
							['@digit'] = userData.digit
						} );
						local tempdrive = false 
						local drive = false
						local weapon = false
						for _, license in ipairs(licenses) do
							if license.type == 'drive' then
								drive = true
							end
							if license.type == 'tempdrive' then
								tempdrive = true
							end
							if license.type == 'weapon' then
								weapon = true
							end
						end
						userData.driverLicense = drive and tempdrive
						userData.weaponLicense = weapon

						local resultApartments = MySQL.query.await('SELECT * from owned_properties WHERE owner = @owner AND digit = @digit', {
							['@owner'] = userData.identifier,
							['@digit'] = userData.digit
						} );
						userData.houses = resultApartments

						--[[local resultBusinesses = MySQL.query.await('SELECT * from srp_businesses WHERE owner = @owner', {
							['owner'] = userData.identifier
						} );]]
						userData.businesses = resultBusinesses

						local notes = MySQL.query.await('SELECT *, DATE_FORMAT(date, "%d/%m/%Y %H:%i:%s") AS date from lspd_mdc_user_notes WHERE userId = @owner AND digit = @digit ORDER BY id DESC', {
							['@owner'] = userData.identifier,
							['@digit'] = userData.digit
						} );
						if notes == nil then motes = {} end
						userData.mdcNotes = notes

						local lspdTags = MySQL.query.await('SELECT value from user_properties WHERE userId = @owner AND digit = @digit AND name like \'' .. citizenTagPrefix .. '%\'', {
							['@owner'] = userData.identifier,
							['@digit'] = userData.digit
						});

						local lspdUserTags = {}
						for _, tag in ipairs(lspdTags) do
							table.insert(lspdUserTags, tag.value)
						end
						userData.lspdTags = lspdUserTags

						local convictions = MySQL.query.await('SELECT *, DATE_FORMAT(date, "%d/%m/%Y %H:%i:%s") AS date from lspd_user_judgments WHERE userId = @owner AND digit = @digit ORDER BY date DESC', {
							['@owner'] = userData.identifier,
							['@digit'] = userData.digit
						});
						userData.convictions = convictions

						if userData.sex == 'm' then
							userData.sex = "Mężczyzna"
						else
							userData.sex = "Kobieta"
						end
						cb(userData)
					end
				end
		end)
	else
		TriggerEvent('exilerp:banPlr', "nigger", source, "Tried to open police tablet without job (policemdc)")
	end
end)

RegisterServerEvent('esx_mdc:addNewCitizenNote')
AddEventHandler('esx_mdc:addNewCitizenNote', function(citizenId, noteData)
	MySQL.update.await('INSERT INTO `lspd_mdc_user_notes` (`addedBy`, `text`, `userId`, `digit`) VALUES (@addedBy, @text, @citizen, @citizendigit)',
	{
		['@addedBy'] = noteData.addedBy,
		['@text']    = noteData.text,
		['@citizen'] = citizenId,
		['@citizendigit'] = citizenId.digit,
	})
end)

RegisterServerEvent('esx_mdc:saveCitizen')
AddEventHandler('esx_mdc:saveCitizen', function(citizenData)
	-- update properties
	MySQL.update.await('DELETE FROM `user_properties` WHERE `userId` = @owner AND digit = @digit and `name` like \'' .. citizenTagPrefix .. '%\'',
	{
		['@owner'] = citizenData.id,
		['@digit'] = citizenData.digit
	})

	local values = 'INSERT INTO `user_properties` (`userId`, `name`, `value`) VALUES '
	local count = 1
	for _, tag in ipairs(citizenData.lspdTags) do
		if( count ~= 1 ) then
			values = values .. ', '
		end
		values = values .. '(\'' .. citizenData.id .. '\', \'' .. citizenTagPrefix .. count .. '\', \'' .. tag .. '\')'
		count = count + 1
	end
	if count ~= 1 then
		MySQL.update.await(values, {})
	end
end)
