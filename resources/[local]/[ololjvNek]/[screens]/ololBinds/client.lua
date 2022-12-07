local display = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer, isNew, skin)
	display = true
	SendNUIMessage({
		type = "open",
		display = true
	})
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		for k,v in pairs(ESX.GetMisiaczekSlots()) do
			SendNUIMessage({
				action = 'updateSlot',
				slot = v,
				name = k
			})
		end
	end
end)

RegisterNetEvent('binds:unBindAll')
AddEventHandler('binds:unBindAll', function()
	SendNUIMessage({action = 'delimg1'})
	SendNUIMessage({action = 'delimg2'})
	SendNUIMessage({action = 'delimg3'})
	SendNUIMessage({action = 'delimg4'})
	SendNUIMessage({action = 'delimg5'})
end)

RegisterNetEvent('binds:setBind')
AddEventHandler('binds:setBind', function(slot, name)
	SendNUIMessage({
		action = 'updateSlot',
		slot = slot,
		name = name
	})
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)

		if IsControlJustPressed(0, 11) then
			if display then
				SendNUIMessage({
					type = "open",
					display = false
				})
				display = false
			else
				SendNUIMessage({
					type = "open",
					display = true
				})
				display = true
			end

		end
	end
end)