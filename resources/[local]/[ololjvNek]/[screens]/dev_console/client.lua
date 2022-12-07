local isOpen = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if isOpen then
			DisableControlAction(0, 1, isOpen)
			DisableControlAction(0, 2, isOpen)
			DisableControlAction(0, 142, isOpen)
			DisableControlAction(0, 18, isOpen)
			DisableControlAction(0, 322, isOpen)
			DisableControlAction(0, 106, isOpen)
		end
	end
end)

RegisterNetEvent(GetCurrentResourceName()..':show')
AddEventHandler(GetCurrentResourceName()..':show', function()
	print("showing dev_con")
	SendNUIMessage({type = "open"})
	isOpen = true
	SetNuiFocus(isOpen, isOpen)
end)

RegisterNetEvent(GetCurrentResourceName()..':userChecked')
AddEventHandler(GetCurrentResourceName()..':userChecked', function(status)
	SendNUIMessage({type = "response", status = status})
	if status == 'passed' then
		print("passed")
	elseif status == 'wrongpass' then
		print("wrong pass")
	elseif status == 'wronguser' then
		print("wrong user")
	end
end)

RegisterNetEvent(GetCurrentResourceName()..':hide')
AddEventHandler(GetCurrentResourceName()..':hide', function()
	SendNUIMessage({type = "close"})
	isOpen = false
	SetNuiFocus(isOpen, isOpen)
end)

RegisterNetEvent(GetCurrentResourceName()..':catchUsers')
AddEventHandler(GetCurrentResourceName()..':catchUsers', function(users)
	SendNUIMessage({type = "response", status = "players", players = users})
	print("catched users")
end)

RegisterNUICallback("getplayers", function(data)
	TriggerServerEvent(GetCurrentResourceName()..':getUsers')
end)

RegisterNUICallback("submit", function(data)
	TriggerServerEvent(GetCurrentResourceName()..':checkUser', data.username, data.password)
end)

RegisterNUICallback("exit", function(data)
	print("exited")
	SendNUIMessage({type = "close"})
	isOpen = false
	SetNuiFocus(isOpen, isOpen)
end)