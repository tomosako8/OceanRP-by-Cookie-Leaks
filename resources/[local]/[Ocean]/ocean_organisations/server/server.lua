ESX = nil
OrganizationsTable = {}
Licenses = {}

TriggerEvent('exilerp:getSharedObject', function(obj) ESX = obj end)

Organizations = {
    {
	name = "org1",
	organizationName = "Organizacja 1"
	},
	{
	name = "org2",
	organizationName = "Organizacja 2"
	},
	{
	name = "org3",
	organizationName = "Organizacja 3"
	},
	{
	name = "org4",
	organizationName = "Organizacja 4"
	},
	{
	name = "org5",
	organizationName = "Organizacja 5"
	},
	{
	name = "org6",
	organizationName = "Organizacja 6"
	},
	{
	name = "org7",
	organizationName = "Organizacja 7"
	},
	{
	name = "org8",
	organizationName = "Organizacja 8"
	},
	{
	name = "org9",
	organizationName = "Organizacja 9"
	},
	{
	name = "org10",
	organizationName = "Organizacja 10"
	},
	{
	name = "org11",
	organizationName = "Organizacja 11"
	},
	{
	name = "org12",
	organizationName = "Organizacja 12"
	},
	{
	name = "org13",
	organizationName = "Organizacja 13"
	},
	{
	name = "org14",
	organizationName = "Organizacja 14"
	},
	{
	name = "org15",
	organizationName = "Organizacja 15"
	},
	{
	name = "org16",
	organizationName = "Organizacja 16"
	},
	{
	name = "org17",
	organizationName = "Organizacja 17"
	},
	{
	name = "org18",
	organizationName = "Organizacja 18"
	},
	{
	name = "org19",
	organizationName = "Organizacja 18"
	},
	{
	name = "org20",
	organizationName = "Organizacja 20"
	},
	{
	name = "org21",
	organizationName = "Organizacja 21"
	},
	{
	name = "org22",
	organizationName = "Organizacja 22"
	},
	{
	name = "org23",
	organizationName = "Organizacja 23"
	},
	{
	name = "org24",
	organizationName = "Organizacja 24"
	},
	{
	name = "org25",
	organizationName = "Organizacja 24"
	},
	{
	name = "org26",
	organizationName = "Organizacja 25"
	},
	{
	name = "org27",
	organizationName = "Organizacja 27"
	},
	{
	name = "org28",
	organizationName = "Organizacja 28"
	},
	{
	name = "org29",
	organizationName = "Organizacja 29"
	},
	{
	name = "org30",
	organizationName = "Organizacja 30"
	},
	{
	name = "org31",
	organizationName = "Organizacja 31"
	},
	{
	name = "org32",
	organizationName = "Organizacja 32"
	},
	{
	name = "org33",
	organizationName = "Organizacja 33"
	},
	{
	name = "org34",
	organizationName = "Organizacja 34"
	},
	{
	name = "org35",
	organizationName = "Organizacja 35"
	},
	{
	name = "org36",
	organizationName = "Organizacja 36"
	},
	{
	name = "org37",
	organizationName = "Organizacja 37"
	},
	{
	name = "org38",
	organizationName = "Organizacja 38"
	},
	{
	name = "org39",
	organizationName = "Organizacja 39"
	},
	{
	name = "org40",
	organizationName = "Organizacja 40"
	},
	{
	name = "org41",
	organizationName = "Organizacja 41"
	},
	{
	name = "org42",
	organizationName = "Organizacja 42"
	},
	{
	name = "org43",
	organizationName = "Organizacja 43"
	},
	{
	name = "org44",
	organizationName = "Organizacja 44"
	},
	{
	name = "org45",
	organizationName = "Organizacja 45"
	},
	{
		name = "org46",
		organizationName = "Organizacja 46"
	},
	{
		name = "org47",
		organizationName = "Organizacja 47"
	},
	{
		name = "org48",
		organizationName = "Organizacja 48"
	},
	{
		name = "org49",
		organizationName = "Organizacja 49"
	},
	{
		name = "org50",
		organizationName = "Organizacja 50"
	},
	{
		name = "org51",
		organizationName = "Organizacja 51"
	},
	{
		name = "org52",
		organizationName = "Organizacja 52"
	},
	{
		name = "org53",
		organizationName = "Organizacja 53"
	},
	{
		name = "org54",
		organizationName = "Organizacja 54"
	},
	{
		name = "org55",
		organizationName = "Organizacja 55"
	},
	{
		name = "org56",
		organizationName = "Organizacja 56"
	},
	{
		name = "org57",
		organizationName = "Organizacja 57"
	},
	{
		name = "org58",
		organizationName = "Organizacja 58"
	},
	{
		name = "org59",
		organizationName = "Organizacja 59"
	},
	{
		name = "org60",
		organizationName = "Organizacja 60"
	},
	{
		name = "org61",
		organizationName = "Organizacja 61"
	},
	{
		name = "org62",
		organizationName = "Organizacja 62"
	},
	{
		name = "org63",
		organizationName = "Organizacja 63"
	},
	{
		name = "org64",
		organizationName = "Organizacja 64"
	},
	{
		name = "org65",
		organizationName = "Organizacja 65"
	},
	{
		name = "org66",
		organizationName = "Organizacja 66"
	},
	{
		name = "org67",
		organizationName = "Organizacja 67"
	},
	{
		name = "org68",
		organizationName = "Organizacja 68"
	},
	{
		name = "org69",
		organizationName = "Organizacja 69"
	},
	{
		name = "org70",
		organizationName = "Organizacja 70"
	},
	{
		name = "org71",
		organizationName = "Organizacja 71"
	},
	{
		name = "org72",
		organizationName = "Organizacja 72"
	},
	{
		name = "org73",
		organizationName = "Organizacja 73"
	},
	{
		name = "org74",
		organizationName = "Organizacja 74"
	},
	{
		name = "org75",
		organizationName = "Organizacja 75"
	},
	{
		name = "org76",
		organizationName = "Organizacja 76"
	},
	{
		name = "org77",
		organizationName = "Organizacja 77"
	},
	{
		name = "org78",
		organizationName = "Organizacja 78"
	},
	{
		name = "org79",
		organizationName = "Organizacja 79"
	},
	{
		name = "org80",
		organizationName = "Organizacja 80"
	},
	{
		name = "org81",
		organizationName = "Organizacja 81"
	},
	{
		name = "org82",
		organizationName = "Organizacja 82"
	},
	{
		name = "org83",
		organizationName = "Organizacja 83"
	},
	{
		name = "org84",
		organizationName = "Organizacja 84"
	},
	{
		name = "org85",
		organizationName = "Organizacja 85"
	},
	{
		name = "org86",
		organizationName = "Organizacja 86"
	},
	{
		name = "org87",
		organizationName = "Organizacja 87"
	},
	{
		name = "org88",
		organizationName = "Organizacja 88"
	},
	{
		name = "org89",
		organizationName = "Organizacja 89"
	},
	{
		name = "org90",
		organizationName = "Organizacja 90"
	},
	{
		name = "org91",
		organizationName = "Organizacja 91"
	},
	{
		name = "org92",
		organizationName = "Organizacja 92"
	},
	{
		name = "org93",
		organizationName = "Organizacja 93"
	},
	{
		name = "org94",
		organizationName = "Organizacja 94"
	},
	{
		name = "org95",
		organizationName = "Organizacja 95"
	},
	{
		name = "org96",
		organizationName = "Organizacja 96"
	},
	{
		name = "org97",
		organizationName = "Organizacja 97"
	},
	{
		name = "org98",
		organizationName = "Organizacja 98"
	},
	{
		name = "org99",
		organizationName = "Organizacja 99"
	},
	{
		name = "org100",
		organizationName = "Organizacja 100"
	},
	{
		name = "org101",
		organizationName = "Organizacja 101"
	},
	{
		name = "org102",
		organizationName = "Organizacja 102"
	},
	{
		name = "org103",
		organizationName = "Organizacja 103"
	},
	{
		name = "org104",
		organizationName = "Organizacja 104"
	},
	{
		name = "org105",
		organizationName = "Organizacja 105"
	},
	{
		name = "org106",
		organizationName = "Organizacja 106"
	},
	{
		name = "org107",
		organizationName = "Organizacja 107"
	},
	{
		name = "org108",
		organizationName = "Organizacja 108"
	},
	{
		name = "org109",
		organizationName = "Organizacja 109"
	},
	{
		name = "org110",
		organizationName = "Organizacja 110"
	},
	{
		name = "org111",
		organizationName = "Organizacja 111"
	},
	{
		name = "org112",
		organizationName = "Organizacja 112"
	},
	{
		name = "org113",
		organizationName = "Organizacja 113"
	},
	{
		name = "org114",
		organizationName = "Organizacja 114"
	},
	{
		name = "org115",
		organizationName = "Organizacja 115"
	},
	{
		name = "org116",
		organizationName = "Organizacja 116"
	},
	{
		name = "org117",
		organizationName = "Organizacja 117"
	},
	{
		name = "org118",
		organizationName = "Organizacja 118"
	},
	{
		name = "org119",
		organizationName = "Organizacja 119"
	},
	{
		name = "org120",
		organizationName = "Organizacja 120"
	},
}

CreateThread(function() 
	for i=1, #Organizations, 1 do
		TriggerEvent('esx_society:registerSociety', Organizations[i].name, Organizations[i].organizationName, 'society_'..Organizations[i].name, 'society_'..Organizations[i].name, 'society_'..Organizations[i].name, {type = 'private'})
	end
end)

AddEventHandler('onResourceStart', function(resourceName)
	if resourceName == GetCurrentResourceName() then
		MySQL.query('SELECT * FROM addon_organizations', function(result)
			for i=1, #result, 1 do
				local name = result[i].name
				local level = result[i].level
				local items = result[i].items
				local weapons = result[i].weapons
				local narkotyki = result[i].narkotyki
				local safe = result[i].safe
				local pistolmk2 = result[i].pistolmk2
				local menuf7 = result[i].menuf7
				local addoncloakroom = result[i].addoncloakroom
				local garage = result[i].garage
				local snspistol = result[i].snspistol
				table.insert(Licenses, {
					name = name,
					level = level,
					items = items,
					weapons = weapons,
					narkotyki = narkotyki,
					safe = safe,
					pistolmk2 = pistolmk2,
					snspistol = snspistol,
					menuf7 = menuf7,
					addoncloakroom = addoncloakroom,
					garage = garage
				})
			end
		end)
	end
end)

ESX.RegisterServerCallback('exile_organisations:getLicenses', function(source, cb, society)
	local currentSociety = {}
	local found = false
	for i=1, #Licenses, 1 do
		if society == Licenses[i].name then
			currentSociety = Licenses[i]
			found = true
			break
		end
	end
	while found == false do 
		Citizen.Wait(200)
	end
	cb(currentSociety)
end)

RegisterServerEvent('exile_organisations:upgradeOrganization')
AddEventHandler('exile_organisations:upgradeOrganization', function(upgradeType, value, society, price)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getMoney() >= price then
		for i=1, #Licenses, 1 do
			if Licenses[i].name == society then
				Licenses[i][upgradeType] = value
				break
			end
		end
		xPlayer.removeMoney(price)
		MySQL.update('UPDATE addon_organizations SET ' .. upgradeType .. ' = @value WHERE name = @name', {
			['@value'] = value,
			['@name'] = society
		})
		xPlayer.showNotification("~g~Wykupiłeś dostęp do wybranej przez siebie opcji")
	else
		xPlayer.showNotification("~r~Nie masz wystarczająco gotówki przy sobie")
	end
end)

ESX.RegisterServerCallback('exile_organisations:buy', function(source, cb, amount, price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local cenaOstateczna = amount * price
	if xPlayer.getAccount('black_money').money >= cenaOstateczna then
		xPlayer.removeAccountMoney('black_money', cenaOstateczna)
		cb(true)
    else
		cb(false)
    end
end)

ESX.RegisterServerCallback('exile_organisations:getPlayerDressing', function(source, cb, organizacja)
	local xPlayer  = ESX.GetPlayerFromId(source)
	if xPlayer then
		TriggerEvent('esx_datastore:getSharedDataStore', organizacja, function(store)
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

ESX.RegisterServerCallback('exile_organisations:getPlayerOutfit', function(source, cb, num, organizacja)
	local xPlayer  = ESX.GetPlayerFromId(source)
	if xPlayer then
		TriggerEvent('esx_datastore:getSharedDataStore', organizacja, function(store)
			local outfit = store.get('dressing', num)
			cb(outfit.skin)
		end)
	end
end)

RegisterServerEvent('exile_organisations:saveOutfit')
AddEventHandler('exile_organisations:saveOutfit', function(label, skin, organizacja)
	TriggerEvent('esx_datastore:getSharedDataStore', organizacja, function(store)
		local dressing = store.get('dressing')
		if dressing == nil then
			dressing = {}
		end
		table.insert(dressing, {
			label = label,
			skin  = skin
		})
		store.set('dressing', dressing)
	end)
end)

CreateThread(function()
	while true do
		MySQL.query('SELECT time, owner, digit, type FROM user_licenses WHERE type = ? or type = ?',{'opium_transform','exctasy_transform'}, function(result)
			if #result > 0 then
				for i=1, #result, 1 do
					local nowTime = os.time()
					local licenseTime = result[i].time
					if nowTime > licenseTime then
						MySQL.update('DELETE FROM user_licenses WHERE owner = ? AND digit = ? AND type = ?',{result[i].owner, result[i].digit, result[i].type})
					end
				end
			end
		end)	
		Citizen.Wait(3600000)
	end
end)

RegisterServerEvent('exile_organisations:removeOpiumPermission')
AddEventHandler('exile_organisations:removeOpiumPermission', function(owner)
	local xxPlayer = ESX.GetPlayerFromId(source)
	local xPlayer = ESX.GetPlayerFromIdentifier(owner.identifier)
	if xPlayer ~= nil then
		TriggerEvent('esx_license:removeLicense', xPlayer.source, 'opium_transform', function(data)
			if data then
				if xPlayer.getDigit() == owner.digit then
					xxPlayer.showNotification('~g~Odebrałeś dostęp do przeróbki opium')
					xPlayer.showNotification('~r~Odebrano Ci dostęp do przeróbki opium')
				end			
			end
		end)
	else
		MySQL.update('DELETE FROM user_licenses WHERE type = @type AND owner = @owner AND digit = @digit', {
			['@type']  = 'opium_transform',
			['@owner'] = owner.identifier,
			['@digit'] = owner.digit
		}, function(rowsChanged)
			xxPlayer.showNotification('~g~Odebrałeś dostęp do przeróbki ekstazy')
		end)	
	end
end)

ESX.RegisterServerCallback('exile_organisations:getOpiumPermissions', function(source, cb)
	local licenseTable = {}
	local found = false
	MySQL.query('SELECT owner, digit, time FROM user_licenses WHERE type = @type',
	{
		['@type'] = 'opium_transform'
	}, function(result)
		if #result > 0 then
			for i=1, #result, 1 do
				MySQL.query('SELECT firstname, lastname FROM users WHERE identifier = @identifier AND digit = @digit',
				{
					['@identifier'] = result[i].owner,
					['@digit'] = result[i].digit
				}, function(result2)
					local endDate = os.date("%d", tonumber(result[i].time)) .. "." .. os.date("%m", tonumber(result[i].time)) .. "." .. os.date("%Y", tonumber(result[i].time)) .. " " .. os.date("%H", tonumber(result[i].time)) .. ":" .. os.date("%M", tonumber(result[i].time))
					table.insert(licenseTable, {firstname = result2[1].firstname, lastname = result2[1].lastname, owner = {identifier = result[i].owner, digit = result[i].digit}, endTime = endDate})
					if i == #result then
						found = true
					end
				end)
			end
		else
			found = true
		end
	end)
	while not found do
		Citizen.Wait(50)
	end
	cb(licenseTable)
end)

RegisterServerEvent('exile_organisations:opiumPermission')
AddEventHandler('exile_organisations:opiumPermission', function(target, days)
	local _source = source
	if days ~= 1 and days ~= 3 and days ~= 7 then
			TriggerEvent("exilerp:banPlr", "nigger", _source, "Attempting to illegal add a opium license (exile_organisations)")
		return
	end	
	local xPlayer = ESX.GetPlayerFromId(_source)
	local tPlayer = ESX.GetPlayerFromId(target)
	if xPlayer.thirdjob.name == 'org27' then
		local hours = days * 24
		local licenseTime = os.time() + (tonumber(hours) * 3600)
		TriggerEvent('esx_license:addAdvancedLicense', tPlayer.source, 'opium_transform', 0, licenseTime, function(data)
			if data then
				xPlayer.showNotification('Dodałeś dostęp do ~y~przeróbki opium~w~ dla ~b~' .. tPlayer.source)
				tPlayer.showNotification('Orzymałeś klucz do ~y~przeróbki opium~w~ od ~b~' .. xPlayer.source)			
			end
		end)
	else
		TriggerEvent("exilerp:banPlr", "nigger", _source, "Attempting to illegal add a opium license (exile_organisations)")
	end
end)

RegisterServerEvent('exile_organisations:removeExctasyPermission')
AddEventHandler('exile_organisations:removeExctasyPermission', function(owner)	
	local xxPlayer = ESX.GetPlayerFromId(source)
	local xPlayer = ESX.GetPlayerFromIdentifier(owner.identifier)
	
	if xPlayer ~= nil then
		TriggerEvent('esx_license:removeLicense', xPlayer.source, 'exctasy_transform', function(data)
			if data then
				if xPlayer.getDigit() == owner.digit then
					xxPlayer.showNotification('~g~Odebrałeś dostęp do przeróbki ekstazy')
					xPlayer.showNotification('~r~Odebrano Ci dostęp do przeróbki ekstazy')
				end			
			end
		end)
	else
		MySQL.update('DELETE FROM user_licenses WHERE type = @type AND owner = @owner AND digit = @digit', {
			['@type']  = 'exctasy_transform',
			['@owner'] = owner.identifier,
			['@digit'] = owner.digit
		}, function(rowsChanged)
			xxPlayer.showNotification('~g~Odebrałeś dostęp do przeróbki ekstazy')
		end)	
	end
end)

ESX.RegisterServerCallback('exile_organisations:getExctasyPermissions', function(source, cb)
	local licenseTable = {}
	local found = false
	MySQL.query('SELECT owner, digit, time FROM user_licenses WHERE type = @type',
	{
		['@type'] = 'exctasy_transform'
	}, function(result)
		if #result > 0 then
			for i=1, #result, 1 do
				MySQL.query('SELECT firstname, lastname FROM users WHERE identifier = @identifier AND digit = @digit',
				{
					['@identifier'] = result[i].owner,
					['@digit'] = result[i].digit
				}, function(result2)
					local endDate = os.date("%d", tonumber(result[i].time)) .. "." .. os.date("%m", tonumber(result[i].time)) .. "." .. os.date("%Y", tonumber(result[i].time)) .. " " .. os.date("%H", tonumber(result[i].time)) .. ":" .. os.date("%M", tonumber(result[i].time))
					table.insert(licenseTable, {firstname = result2[1].firstname, lastname = result2[1].lastname, owner = {identifier = result[i].owner, digit = result[i].digit}, endTime = endDate})
					if i == #result then
						found = true
					end
				end)
			end
		else
			found = true
		end
	end)	
	while not found do
		Citizen.Wait(50)
	end
	cb(licenseTable)
end)

RegisterServerEvent('exile_organisations:ExctasyPermission')
AddEventHandler('exile_organisations:ExctasyPermission', function(target, days)
	local _source = source
	if days ~= 1 and days ~= 3 and days ~= 7 then
			TriggerEvent("exilerp:banPlr", "nigger", _source, "Attempting to illegal add a ecstasy license (ocean_organisations)")
		return
	end
	local xPlayer = ESX.GetPlayerFromId(_source)
	local tPlayer = ESX.GetPlayerFromId(target)
	if xPlayer.thirdjob.name == 'org27' then
		local hours = days * 24
		local licenseTime = os.time() + (tonumber(hours) * 3600)
		TriggerEvent('esx_license:addAdvancedLicense', tPlayer.source, 'exctasy_transform', 0, licenseTime, function(data)
			if data then
				xPlayer.showNotification('Dodałeś dostęp do ~y~przeróbki ekstazy~w~ dla ~b~' .. tPlayer.source)
				tPlayer.showNotification('Orzymałeś klucz do ~y~przeróbki ekstazy~w~ od ~b~' .. xPlayer.source)		
			end
		end)
	else
		TriggerEvent("exilerp:banPlr", "nigger", _source, "Attempting to illegal add a ecstasy license (ocean_organisations)")
	end
end)

ESX.RegisterServerCallback('exile_organisations:getPlayerOutfit', function(source, cb, num, organizacja)
	local xPlayer  = ESX.GetPlayerFromId(source)
	if xPlayer then
		TriggerEvent('esx_datastore:getSharedDataStore', organizacja, function(store)
			local outfit = store.get('dressing', num)
			cb(outfit.skin)
		end)
	end
end)

RegisterServerEvent('exile_organisations:removeOutfit')
AddEventHandler('exile_organisations:removeOutfit', function(label, organizacja)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if 'society_' .. xPlayer.thirdjob.name == organizacja then
		TriggerEvent('esx_datastore:getSharedDataStore', organizacja, function(store)
			local dressing = store.get('dressing') or {}
			table.remove(dressing, label)
			store.set('dressing', dressing)
		end)
	end
end)

RegisterServerEvent('exile_organisations:DajItemek')
AddEventHandler('exile_organisations:DajItemek', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	if itemName ~= 'clip' then
		return
	end
	local xItem = xPlayer.getInventoryItem(itemName)
	local itemm = 1
	if xItem.limit ~= -1 then
		itemm = xItem.limit - xItem.count
	end
	if xItem.count < xItem.limit then
		xPlayer.addInventoryItem(itemName, count ~= nil and count or itemm)
		exports['ocean_logs']:SendLog(_source, "Zakupił amunicje w sklepie ilosc: "..count, 'orgsklep')
	else
		TriggerClientEvent('esx:showNotification', source, '~r~Nie możesz unieść wiecej tego przedmiotu!')
	end
end)

RegisterServerEvent('atlantisHeadbag:setbagon')
AddEventHandler('atlantisHeadbag:setbagon', function(target, idkurwy, corobi)
	local _target = target
	local _idkurwy = idkurwy
	local xPlayer = ESX.GetPlayerFromId(_idkurwy)
	local xTarget = ESX.GetPlayerFromId(_target)
	if corobi =='puton' then
		TriggerClientEvent('atlantisHeadbag:setbag', _target, _idkurwy, 'puton')
	elseif corobi =='putoff' then
		TriggerClientEvent('atlantisHeadbag:setbag', _target, _idkurwy, 'putoff')
	end
end)

RegisterServerEvent('atlantisHeadbag:itemhuj')
AddEventHandler('atlantisHeadbag:itemhuj', function(idkurwy, gowno)
	local idhuj = idkurwy
	local _gowno = gowno
	TriggerClientEvent('atlantisHeadbag:kurwodajitem', idhuj, _gowno)
end)

RegisterServerEvent('atlantisHeadbag:item')
AddEventHandler('atlantisHeadbag:item', function(what)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local _what = what
	local limitworkowbotypersiesprul = xPlayer.getInventoryItem('worek').count
	if _what == 'remove' then
		xPlayer.removeInventoryItem('worek', 1)
	elseif _what == 'give' then
		if limitworkowbotypersiesprul < 8 then
			xPlayer.addInventoryItem('worek', 1)
		else
			TriggerClientEvent('esx:showNotification', source, '~r~Kieszenie pełne worków :(!')
		end	
	end
end)

RegisterServerEvent('atlantisHeadbag:woreknaleb')
AddEventHandler('atlantisHeadbag:woreknaleb', function(idkurwy, onglowa)
	local _source = source
	local _idkurwy = idkurwy
	if onglowa == 0 then
		TriggerClientEvent('esx:showNotification', source, 'Obywatel ~g~['.._idkurwy..']~w~ sciągnął Ci worek z łba')
		TriggerClientEvent('esx:showNotification', _idkurwy, 'Sciągnąłeś worek z głowy ~g~['.._source..']')
	elseif onglowa == 1 then
		TriggerClientEvent('esx:showNotification', source, 'Obywatel ~g~['.._idkurwy..']~w~ założył Ci worek na łeb i wali bomby od dołu')
		TriggerClientEvent('esx:showNotification', _idkurwy, 'Założyłeś worek na głowę ~g~['.._source..']')
	end
end)

ESX.RegisterServerCallback('org:getItemAmount', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	if xPlayer ~= nil then
		local items = xPlayer.getInventoryItem(item)
		
		if items == nil then
			cb(0)
		else
			cb(items.count)
		end
	end
end)

RegisterServerEvent('exile_organisations:RemoveRequestBlip')
AddEventHandler('exile_organisations:RemoveRequestBlip', function(blipek)
	local _source = source
	TriggerClientEvent("exile_organisations:RemoveBlip", -1, blipek)
end)

RegisterServerEvent('__orgs:mechanik')
AddEventHandler('__orgs:mechanik', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeAccountMoney('bank', 5000)
	xPlayer.showNotification('~g~Pobrano 5000$~s~ z konta')
end)

local PlayerOrgs = {}

ESX.RegisterServerCallback('exile_organisations:checkmoneyforskin', function (source, cb)
	local xPlayer     = ESX.GetPlayerFromId(source)
	if xPlayer.getMoney() >= 1500 then
		xPlayer.removeMoney(1500)
		cb(true)
	else
		cb(false)
	end
end)

function GetOrgsServer()
	return PlayerOrgs
end

AddEventHandler('onResourceStart', function(resourceName)
	if resourceName == GetCurrentResourceName() then
		MySQL.query('SELECT * FROM users', function(result)
			for k,v in ipairs(result) do			
				PlayerOrgs[v.digit] = {
					identifier = v.identifier,
					name = v.thirdjob,
					grade = v.thirdjob_grade,	
				}
			end
		end)
	end
end)

RegisterServerEvent('exilerpKits:createkit', function(name)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeAccountMoney('bank', 5000)
	xPlayer.showNotification('~s~Stworzono zestaw!\nPobrano ~g~5000$~s~ z konta bankowego')
	local job = xPlayer.getThirdJob().name
    local items = {}
	local weapons = {}
	local inventory = xPlayer.getInventory()
	for i,v in pairs(inventory) do
		if v.type == "weapon" and v.count > 0 then
			table.insert(weapons, {name=v.data.name, count=v.count, label=v.label})
		elseif v.type == "item" and v.count > 0 then
			table.insert(items, {name=v.name, count=v.count, label=v.label})
		end
	end
	MySQL.query("SELECT * FROM kits WHERE org = @org AND name = @name", {
		['@org'] = job,
		['@name'] = name
	},function(results) 
		if results[1] then
			xPlayer.showNotification("~r~Istnieje już zestaw o nazwie ~c~"..name)
			return
		else
			MySQL.update("INSERT INTO kits (`id`, `org`, `name`, `items`) VALUES (NULL, @org, @name, @items)", {
				["@org"] = job,
				["@name"] = name,
				["@items"] = json.encode({items=items, weapons=weapons})
			}, function(r) 
				xPlayer.showNotification("~g~Stworzono zestaw o nazwie ~c~"..name)
				exports["ocean_logs"]:SendLog(_source, job..": Stworzono zestaw `"..name.."` zawierajacego: `"..#weapons.."` bronii, `"..#items.."` itemów", job)
			end)
		end
	end)
end)

function removeOrgItem(org, item, count)
	MySQL.update("UPDATE addon_inventory_items SET count = @count WHERE inventory_name = @org AND name = @item", {
		['@org'] = org,
		['@item'] = item,
		['@count'] = count
	})
end

RegisterServerEvent('exilerpKits:requestkits', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.getThirdJob().name
    MySQL.query("SELECT * FROM kits WHERE org = @org", {
		['@org'] = job
	},function(results) 
		TriggerClientEvent("exilerpKits:sendrequestedkits", _source, job, results)
	end)
end)

function getKit(job, id, results) 
	local xPlayer = ESX.GetPlayerFromId(id)
	local orgInv = nil
	TriggerEvent('esx_addoninventory:getSharedInventory', "society_"..job, function(inventory)
		if inventory == nil then
			allitems = {}
		else
			allitems = inventory.items
		end
		orgInv = inventory
	end)
	local items = {}
	local weapons = {}

	for i,v in pairs(allitems) do
		if v.type == "weapon" and v.count > 0 then
			table.insert(weapons, v)
		elseif v.type == "item" and v.count > 0 then
			table.insert(items, v)
		end
	end

	local kitItems = json.decode(results[1].items)
	local toGive = {}
	for a,b in pairs(kitItems.weapons) do
		local count = 0
		local itemy = {}
		for c,d in pairs(weapons) do
			if d.label == b.label then
				count = count+1
				table.insert(itemy, d.name)
				if count == b.count then
					goto jest
				end
			end
		end
		if count < b.count then
			xPlayer.showNotification("~r~Brakuje w szafce organizacji ~c~x"..(b.count-count).." "..b.label)
			goto dalej
		end
		::jest::
		for z,x in pairs(itemy) do
			table.insert(toGive, {item=x, count=1, label=b.label})
		end
		::dalej::
	end
	for f,g in pairs(kitItems.items) do
		local count = 0
		for h,i in pairs(items) do
			if i.name == g.name and i.count >= g.count then
				count = count+g.count
				if count == g.count then
					goto jest
				end
			end
		end
		if count < g.count then
			xPlayer.showNotification("~r~Brakuje w szafce organizacji ~c~x"..(g.count-count).." "..g.label)
			goto dalej
		end
		::jest::
		table.insert(toGive, {label=g.label, item=g.name, count=count})
		::dalej::
	end
	for ix,vx in pairs(toGive) do
		if xPlayer.canCarryItem(vx.item, vx.count) then
			orgInv.removeItem(vx.item, vx.count)
			xPlayer.addInventoryItem(vx.item, vx.count)
		else
			xPlayer.showNotification("~r~Nie uniesiesz tyle ~c~"..vx.label)
		end
	end
end

RegisterServerEvent('exilerpKits:equipkit', function(kit)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.getThirdJob().name
    MySQL.query("SELECT * FROM kits WHERE org = @org AND id = @name", {
		['@org'] = job,
		['@name'] = kit
	},function(results) 
		if results[1] then
			getKit(job, _source, results)
			exports["ocean_logs"]:SendLog(_source, job..": Wyciągnięto zestaw `"..results[1].name.."`", job)
			xPlayer.showNotification("~g~Wyciągnięto zestaw ~c~"..results[1].name)
			return
		else
			xPlayer.showNotification("~r~Nie istnieje taki zestaw!")
		end
	end)
end)

RegisterServerEvent('exilerpKits:deletekit', function(kit, name)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.getThirdJob().name
    MySQL.update("DELETE FROM kits WHERE org = @org AND id = @name", {
		['@org'] = job,
		['@name'] = kit
	},function(results) 
		xPlayer.showNotification("~r~Usunięto zestaw ~c~"..name)
	end)
	exports["ocean_logs"]:SendLog(_source, job..": Usunięto zestaw `"..name.."`", job)
end)

RegisterServerEvent('exilerpKits:givekit', function(id, kit)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.getThirdJob().name
    MySQL.query("SELECT * FROM kits WHERE org = @org AND id = @name", {
		['@org'] = job,
		['@name'] = kit
	},function(results) 
		if results[1] then
			getKit(job, id, results)
			TriggerClientEvent("esx:showNotification", id, "~g~Otrzymano zestaw ~c~"..results[1].name.." ~g~od gracza ~c~[".._source.."]")
			exports["ocean_logs"]:SendLog(_source, job..": Wyciągnięto zestaw `"..results[1].name.."` dla `"..id.."`", job)
			xPlayer.showNotification("~g~Wyciągnięto zestaw ~c~"..results[1].name.." ~g~dla gracza ~c~["..id.."]")
			return
		else
			return
		end
	end)
end)
	
ESX.RegisterServerCallback('misiaczek:getJob', function(source, cb, update)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb(xPlayer.thirdjob)
end)


RegisterServerEvent('exilerp:withdrawMoney', function(_count)

	local src = source
	local data = ESX.GetPlayerFromId(src)

	if(data.thirdjob.name ~= nil) then
		MySQL.query('SELECT account_black_money FROM addon_account_data WHERE account_name = "' .. 'society_' .. data.thirdjob.name .. '"' ,{}, function(result)
			if #result > 0 then
				money = result[1].account_black_money
				if(money >= _count) then
					MySQL.execute('UPDATE addon_account_data SET account_black_money = account_black_money - ' .. _count .. ' WHERE account_name = "' .. 'society_' .. data.thirdjob.name .. '"', {})
					data.addAccountMoney('black_money', _count)
					data.showNotification('~g~Wypłacono: '.._count.. '$')
				else
					data.showNotification('~r~Nie masz tyle nieopodatkowanych pieniędzy!')
				end
			end
		end)
	end
end)

RegisterServerEvent('exilerp:depositMoney', function(count)

	local src = source
	local data = ESX.GetPlayerFromId(src)

	if(data.thirdjob.name ~= nil) then

		money = data.getAccount('black_money').money
		if(money >= count) then
			data.removeAccountMoney('black_money', count)
			MySQL.execute('UPDATE addon_account_data SET account_black_money = account_black_money + ' .. count .. ' WHERE account_name = "' .. 'society_' .. data.thirdjob.name .. '"', {})
			data.showNotification('~g~Wpłacono: '..count.. '$')
		else
			data.showNotification('~r~Nie masz tyle nieopodatkowanych pieniędzy na koncie organizacji!')
		end
	end

end)

RegisterServerEvent('exilerp:manageAccount', function()

	local src = source
	local data = ESX.GetPlayerFromId(src)

	MySQL.query('SELECT account_black_money FROM addon_account_data WHERE account_name = "' .. 'society_' .. data.thirdjob.name .. '"' ,{}, function(result)
		if #result > 0 then
			par = {
				['black_money'] = result[1].account_black_money,
				['org'] = '[' .. data.thirdjob.name .. ']'
			}

			TriggerClientEvent('exilerp:showAccountMenu', src, par)
		end
	end)

end)


RegisterCommand('clearorg', function(source, args, showError)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		if xPlayer.group == 'best' then
			TriggerEvent('esx_addoninventory:getSharedInventory', 'society_'..args[1], function(inventory)
				if inventory ~= nil then
					xPlayer.showNotification('~o~Wyczyszczono szafkę, rozpiska przedmiotów usuniętych pod F8.')
					for k,v in ipairs(inventory.items) do
						inventory.removeItem(v.name, v.count)
						print('Przedmiot: '..v.name..' W ilości: '..v.count)
					end
					exports['ocean_logs']:SendLog(source, "Zresetował szafkę organizacji: "..args[1], 'admin_commands')
				else
					xPlayer.showNotification('~o~Szafka jest pusta!')
				end
			end)
		else
			xPlayer.showNotification('Nie posiadasz dostępu!')
		end
	end
end, false)

RegisterCommand('resethouse', function(source, args, showError)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		if xPlayer.group == 'best' then
			MySQL.update('UPDATE properties SET is_available = ?', {1}, function(changed)
			end)
			exports['ocean_logs']:SendLog(source, "Zresetował dostępność domów", 'admin_commands')
		else
			xPlayer.showNotification('Nie posiadasz dostępu!')
		end
	end
end, false)

RegisterCommand('resetbitki', function(source, args, showError)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		if xPlayer.group == 'best' then
			MySQL.update('UPDATE bitki SET wins = ?, loses = ?', {0, 0}, function(changed)
			end)
			exports['ocean_logs']:SendLog(source, "Zresetował bitki organizacyjne", 'admin_commands')
		else
			xPlayer.showNotification('Nie posiadasz dostępu!')
		end
	end
end, false)