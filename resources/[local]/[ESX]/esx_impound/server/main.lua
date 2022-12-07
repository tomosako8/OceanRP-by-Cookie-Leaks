ESX = nil

TriggerEvent('exilerp:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_impound:checkVehicleOwner', function(source, cb, plate)

	MySQL.query('SELECT owner, digit, vehicle FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
	
		if result[1] ~= nil then
			MySQL.query('SELECT firstname, lastname FROM characters WHERE identifier = @identifier AND digit = @digit',  {
				['@identifier'] = result[1].owner,
				['@digit']	= result[1].digit
			}, function(result2)
				 
				cb(true, json.decode(result[1].vehicle), (result2[1].firstname..' '..result2[1].lastname))
			end)
		else
			cb(false)
		end
	end)
end)


