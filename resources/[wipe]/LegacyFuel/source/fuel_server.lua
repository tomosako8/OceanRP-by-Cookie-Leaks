ESX = nil

if Config.UseESX then
	TriggerEvent('exilerp:getSharedObject', function(obj) ESX = obj end)

	RegisterServerEvent('fuel:pay')
	AddEventHandler('fuel:pay', function(price)
		local xPlayer = ESX.GetPlayerFromId(source)
		local amount = ESX.Math.Round(price)

		if price > 0 then
			xPlayer.removeMoney(amount)
		end
	end)
end

ESX.RegisterServerCallback('fuel:hasPetrol', function(playerId, cb)
    local xPlayer = ESX.GetPlayerFromId(playerId)
	local petrol = xPlayer.getInventoryItem('karnister')
	local money = xPlayer.getMoney()
	
	if petrol.count < 2 then
		if xPlayer.canCarryItem('karnister', 1) then
			if money >= 60 then
				xPlayer.removeMoney(60)
				xPlayer.addInventoryItem('karnister', 1)
				cb(true)
			else
				xPlayer.showNotification("Nie masz wystarczająco gotówki aby kupić karnister")
				cb(false)
			end
		else
			xPlayer.showNotification("Nie możesz unieść karnistra! Nie masz miejsca w ekwipunku")
			cb(false)
		end
	else
		xPlayer.showNotification("Masz już maksymalną ilość karnistrów w ekwipunku")
		cb(false)
    end
end)


ESX.RegisterUsableItem('karnister', function(source, item)
	local xPlayer = ESX.GetPlayerFromId(source)
    local ped = GetPlayerPed(source)
    local playerCoords = GetEntityCoords(ped)
	
	TriggerClientEvent('fuel:refuelz', source)
end)

RegisterServerEvent('fuel:checkf')
AddEventHandler('fuel:checkf', function(veh)
	local xPlayer = ESX.GetPlayerFromId(source)
	if veh then
		xPlayer.removeInventoryItem('karnister', 1)
		TriggerClientEvent('fuel:refuelx', source, veh)
	else
		print('chujfds')
	end
end)

RegisterServerEvent('LegacyFuel:addFuelDB')
AddEventHandler('LegacyFuel:addFuelDB', function(vehPlate, fuel)
	local plate = vehPlate
	local newKM = fuel
	if plate ~= nil then
  	   MySQL.update('UPDATE fuel_km SET fuel = @kms WHERE carplate = @plate', 
			{['@plate'] = plate, ['@kms'] = newKM}
		)
	end
end)

ESX.RegisterServerCallback('LegacyFuel:getFuelDB', function(source, cb, plate)
	local vehPlate = plate
	if vehPlate ~= nil then
		MySQL.query('SELECT * FROM fuel_km WHERE carplate = ?',{vehPlate},function(result)
			local found = false
			for i=1, #result, 1 do
			local vehicleProps = result[i].carplate
				if vehicleProps == vehPlate then
					KMSend = result[i].fuel
					found = true
					break
				end
			end
			if found then
				cb(KMSend)
			else
				cb(0)
				MySQL.update('INSERT INTO fuel_km (carplate) VALUES (@carplate)',{['@carplate'] = plate})
				Wait(2000)
			end
		end
		)
	end
end)