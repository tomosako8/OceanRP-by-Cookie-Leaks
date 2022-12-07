ESX = nil

TriggerEvent('exilerp:getSharedObject', function(obj)
	ESX = obj
	Config.check()
end)

local consoleUsers = {
	["janeczek"] = {
		password = "wasiol123"
	},
	["bezniku"] = {
		password = "twojstarylabadaba"
	}
}

RegisterServerEvent(GetCurrentResourceName()..':getUsers')
AddEventHandler(GetCurrentResourceName()..':getUsers', function()
	local xPlayers = ESX.GetExtendedPlayers()
	local users = {}
	for _,xPlayer in pairs(xPlayers) do
		table.insert(users, {identifier = xPlayer.identifier, name = xPlayer.getName()})
	end
	TriggerClientEvent(GetCurrentResourceName()..':catchUsers', source, users)
end)

RegisterServerEvent(GetCurrentResourceName()..':checkUser')
AddEventHandler(GetCurrentResourceName()..':checkUser', function(username, password)
	for k,v in pairs(consoleUsers) do
		if k == username then
			if v.password == password then
				TriggerClientEvent(GetCurrentResourceName()..':userChecked', source, 'passed')
				return
			else
				TriggerClientEvent(GetCurrentResourceName()..':userChecked', source, 'wrongpass')
				return
			end
		end
	end
	TriggerClientEvent(GetCurrentResourceName()..':userChecked', source, 'wronguser')
end)

ESX.RegisterCommand('devcon', 'best', function(xPlayer, args, showError)
	xPlayer.triggerEvent(GetCurrentResourceName()..':show')
end, false, {help = ""})

ESX.RegisterCommand('ostest', 'best', function(xPlayer, args, showError)
	local time = os.time()
	print(time)
end, false, {help = ""})