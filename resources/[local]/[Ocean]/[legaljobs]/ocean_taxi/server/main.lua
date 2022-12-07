ESX = nil

PlayerSalary = {}
Events = {}

TriggerEvent('exilerp:getSharedObject', function(obj) ESX = obj end)

local taxiTable = {
	{
        name = "taxi",
        organizationName = "DownTown Cab"
    }
}

for i=1, #taxiTable, 1 do
    TriggerEvent('esx_society:registerSociety', taxiTable[i].name, taxiTable[i].organizationName, 'society_'..taxiTable[i].name, 'society_'..taxiTable[i].name, 'society_'..taxiTable[i].name, {type = 'private'})
end

RegisterServerEvent('exile_taxi:registerNewNPCTrack')
AddEventHandler('exile_taxi:registerNewNPCTrack', function(trackLenght)
	local xPlayer = ESX.GetPlayerFromId(source)

	if (Config.Zones[xPlayer.secondjob.name]) then
		if Events[xPlayer.source] == nil then
			Events[xPlayer.source] = {
				type = 0,
				driver = xPlayer.source,
				lenght = trackLenght
			}
		end
	end
end)

RegisterServerEvent('exile_taxi:unregisterNPCTrack')
AddEventHandler('exile_taxi:unregisterNPCTrack', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	if (Config.Zones[xPlayer.secondjob.name]) then
		if Events[xPlayer.source] ~= nil then
			Events[xPlayer.source] = nil
		end
	end
end)

RegisterServerEvent('exile_taxi:registerNewPlayerTrack')
AddEventHandler('exile_taxi:registerNewPlayerTrack', function(passager, trackLenght)
	local xPlayer = ESX.GetPlayerFromId(source)

	if (Config.Zones[xPlayer.secondjob.name]) then
		if Events[xPlayer.source] == nil then
			Events[xPlayer.source] = {
				type = 1,
				driver = xPlayer.source,
				passager = passager,
				lenght = trackLenght
			}
		end
	end
end)

RegisterServerEvent('exile_taxi:setTrackAsDone')
AddEventHandler('exile_taxi:setTrackAsDone', function(passager)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if (Config.Zones[xPlayer.secondjob.name]) then
		if (Events[xPlayer.source] ~= nil) then
			if Events[xPlayer.source].type == 0 then
				if (xPlayer.source == Events[xPlayer.source].driver) then
					local total = ((Events[xPlayer.source].lenght/1000) * SConfig.Pricing["PER_KM"])
					if xPlayer.secondjob.grade == 9 then
						total = total * 1.50
					elseif xPlayer.secondjob.grade == 8 then
						total = total * 1.45
					elseif xPlayer.secondjob.grade == 7 then
						total = total * 1.40
					elseif xPlayer.secondjob.grade == 6 then
						total = total * 1.35
					elseif xPlayer.secondjob.grade == 5 then
						total = total * 1.29
					elseif xPlayer.secondjob.grade == 4 then
						total = total * 1.23
					elseif xPlayer.secondjob.grade == 3 then
						total = total * 1.17
					elseif xPlayer.secondjob.grade == 2 then
						total = total * 1.11
					elseif xPlayer.secondjob.grade == 1 then
						total = total * 1.05
					end

					if xPlayer.group == 'vip' then
						total = (total*1.15)
					end

					if total < 80000 then
						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_taxi', function(account)
							if account then
								local playerMoney  = ESX.Math.Round(total)
								local societyMoney = ESX.Math.Round(total / 100 * 20)

								xPlayer.addMoney(playerMoney)
								account.addAccountMoney(societyMoney)
								if xPlayer.secondjob.grade == 8 or xPlayer.secondjob.grade == 9 then
									xPlayer.showNotification("Twoja firma zarobiła ~g~" .. societyMoney .."$ ~s~\nZarobiłeś ~g~" .. playerMoney .. "$")
								else
									xPlayer.showNotification("Zarobiłeś ~g~" .. playerMoney .. "$")
								end
								exports['ocean_logs']:SendLog(_source, "TAXI: Zakończono kurs. Zarobek: " .. playerMoney .. "$", 'taxi', '15844367')
							else
								xPlayer.addMoney(total)
								xPlayer.showNotification("Zarobiłeś ~g~" .. total .. "$")
								exports['ocean_logs']:SendLog(_source, "TAXI: Zakończono kurs. Zarobek: " .. total .. "$", 'taxi', '15844367')
							end
						end)

						TriggerEvent('ExileRP:saveCours', xPlayer.secondjob.name, xPlayer.secondjob.grade, xPlayer.source)

						Events[xPlayer.source] = nil
						--TriggerClientEvent('ocean_taxi:nextOrder', xPlayer.source)
					else
						TriggerEvent("exilerp:banPlr", "nigger", source, "Tried to add money (Prace legalne)")
					end
				end
			end
		else
			TriggerEvent("exilerp:banPlr", "nigger", source, "Tried to add money too fast (Prace legalne)")
		end
	end
end)

RegisterNetEvent(GetCurrentResourceName() .. ':sellInvoices')
AddEventHandler(GetCurrentResourceName() .. ':sellInvoices', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local item = xPlayer.getInventoryItem('fakturataxi')

	if xPlayer.secondjob.name == 'taxi' then
		if item.count >= 5 then
			xPlayer.removeInventoryItem('fakturataxi', 5)
			TriggerClientEvent('exile_taxi:invoicesSold', _source)
			exports['ocean_logs']:SendLog(_source, "TAXI: Oddano 5 faktur", 'taxi', '15105570')
		else
			xPlayer.showNotification("Nie masz wystarczająco ~y~faktur")
		end
	end
end)

local SmiecieSiedzace = {}
RegisterServerEvent('taxi:insertSmiec')
AddEventHandler('taxi:insertSmiec', function(tablice)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local insertLabel = GetPlayerName(_source)..' ['..xPlayer.character.firstname ..' '.. xPlayer.character.lastname..'] '..os.date("%H:%M:%S")
	table.insert(SmiecieSiedzace, {label = insertLabel, plate = tablice})
end)

ESX.RegisterServerCallback('taxi:checkSiedzacy', function(source, cb)
	cb(SmiecieSiedzace)
end)
