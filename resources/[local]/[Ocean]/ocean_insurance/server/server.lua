ESX = nil
Licenses = {}

TriggerEvent('exilerp:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('exile_insurance:sell')
AddEventHandler('exile_insurance:sell', function(station, hLong)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local iType = ""
	
	if station == "NNW" then
		iType = "ems_insurance"
	elseif station == "OC" then
		iType = "oc_insurance"
	end
	
	local year1 = round(os.date('%Y'),0)
	local month1 = round(os.date('%m'),0)
	local day1 = round(os.date('%d')+hLong,0)
	local hour1 = round(os.date('%H'),0)
	local minutes1 = round(os.date('%M'),0)
	local seconds1 = round(os.date('%S'),0)
	local mTime = {year = year1, month = month1, day = day1, hour = hour1, min = minutes1, sec = seconds1}
	local dt = os.time(mTime)
	
	local needMoney
	if hLong == 3 then
		needMoney = 20000
	elseif hLong == 7 then
		needMoney = 40000
	elseif hLong == 14 then
		needMoney = 70000
	elseif hLong == 31 then
		needMoney = 130000
	end
	
	if xPlayer.getMoney() >= needMoney then
		
		if xPlayer ~= nil then
			TriggerEvent('esx_license:addAdvancedLicense', xPlayer.source, iType, 0, dt)
		end
		
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('bought_ins', station, hLong))
		xPlayer.removeMoney(needMoney)
		local fraction
		if station == "NNW" then
			fraction = 'society_ambulance'
		elseif station == "OC" then
			local randomMechanik = math.random(1,2)
			if randomMechanik == 1 then
				randomMechanik = 'society_mechanik'
			elseif randomMechanik == 2 then
				randomMechanik = 'society_gheneraugarage'
			end
			fraction = tostring(randomMechanik)
		end
		TriggerEvent('esx_addonaccount:getSharedAccount', fraction, function(account)
			local KoncowaKwota = ESX.Math.Round(needMoney / 100 * 50)
			account.addAccountMoney(KoncowaKwota)
		end)
	else
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('not_enought'))
	end
end)

ESX.RegisterServerCallback('exile_insurance:check',function(source, cb, station)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local iType = ""
	
	if station == "NNW" then
		iType = "ems_insurance"
	elseif station == "OC" then
		iType = "oc_insurance"
	end
	
	MySQL.query('SELECT time as timestamp FROM user_licenses WHERE owner = ? AND digit = ? AND type = ?', {  xPlayer.identifier, xPlayer.getDigit(), iType},function(result)
		if result[1] ~= nil then
			local tr = tostring(result[1].timestamp)
			local fromUnix = os.date('%Y-%m-%d %H:%M:%S', tr)
			cb(fromUnix)
		else
			cb(nil)
		end
	end)
	
end)

function round(num, numDecimalPlaces)
  if numDecimalPlaces and numDecimalPlaces>0 then
    local mult = 10^numDecimalPlaces
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end

CreateThread(function()
	while true do
		CheckUb()
		Citizen.Wait(3600000)
	end
end)

function CheckUb()
	MySQL.query('SELECT owner, digit, type, time AS timestamp FROM user_licenses WHERE type = ? OR type = ?', {'ems_insurance', 'oc_insurance'}, function(result)
		local nowTime = os.time()
		for i=1, #result, 1 do
			local aboTime = result[i].timestamp
			if tonumber(aboTime) <= tonumber(nowTime) then
				MySQL.update('DELETE FROM user_licenses WHERE type = ? AND owner = ? AND digit = ?', { result[i].type, result[i].owner, result[i].digit})
			end
		end
	end)
end

ESX.RegisterServerCallback('exile_insurance:getLicenses', function(source, cb)
	MySQL.query('SELECT * FROM jobs_insurance ORDER BY oc, nnw ASC', function (results)
		cb(results)
	end)
end)

RegisterServerEvent('exile_insurance:setInsurance')
AddEventHandler('exile_insurance:setInsurance', function(type, insurance, job)
	if type == 'SET' then
		MySQL.update('UPDATE jobs_insurance SET ' .. insurance .. '=@' .. insurance .. ' WHERE name = @name', 
		{
			['@name'] = job,
			['@'..insurance] = 1,
		})
	elseif type == 'REMOVE' then
		MySQL.update('UPDATE jobs_insurance SET ' .. insurance .. '=@' .. insurance .. ' WHERE name = @name', 
		{
			['@name'] = job,
			['@'..insurance] = 0,
		})
	end	
end)

RegisterServerEvent('exile_insurance:addInsurance')
AddEventHandler('exile_insurance:addInsurance', function(job_name, job_label)
	local _source = source
	local job = string.lower(job_name)

	if ESX.DoesJobExist(job, 0) then
		MySQL.query('SELECT name FROM jobs_insurance WHERE name = @name', {
			['@name'] = job
		}, function (results)
			if results[1] ~= nil then
				TriggerClientEvent('esx:showNotification', _source, "Podana praca ~r~znajduje się~w~ już na liście!")
			else
				MySQL.update('INSERT INTO jobs_insurance (name, job_label) VALUES (@name, @job_label)', {
					['@name'] = job,
					['@job_label'] = job_label
				})
				TriggerClientEvent('esx:showNotification', _source, "Pomyślnie ~g~dodano ~w~firmę " .. job_label .. " do listy")
			end
		end)	
	else
		TriggerClientEvent('esx:showNotification', _source, "Podana praca ~r~nie istnieje~w~, proszę wprowadzić ~g~poprawną ~w~nazwę!")
	end
end)