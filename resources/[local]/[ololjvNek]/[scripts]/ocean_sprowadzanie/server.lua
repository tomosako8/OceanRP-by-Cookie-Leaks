ESX = nil

TriggerEvent('exilerp:getSharedObject', function(obj)
	ESX = obj
	Config.check()
end)

local SprowadzanieCooldown = {}

ESX.RegisterServerCallback('cookie_sprowadzanie:isCooldown', function(source, cb)
	for k,v in pairs(SprowadzanieCooldown) do
		if v.player == source then
			if v.time > GetGameTimer() then
				cb(v.time)
			end
		end
	end
	cb(false)
end)

RegisterServerEvent('cookie_sprowadzanie:carJackingProcess')
AddEventHandler('cookie_sprowadzanie:carJackingProcess', function(info)
	Citizen.CreateThread(function()
		Citizen.Wait(30000)
		for _,xPlayer in pairs(ESX.GetExtendedPlayers("job", "police")) do
			TriggerClientEvent('cookie_sprowadzanie:policeAlarm', xPlayer.source, info.model, info.entity)
		end
		for _,xPlayer in pairs(ESX.GetExtendedPlayers("job", "sheriff")) do
			TriggerClientEvent('cookie_sprowadzanie:policeAlarm', xPlayer.source, info.model, info.entity)
		end
	end)
end)

RegisterServerEvent('cookie_sprowadzanie:carJackingSuccess')
AddEventHandler('cookie_sprowadzanie:carJackingSuccess', function(carDeformation)
	local xPlayer = ESX.GetPlayerFromId(source)
	local money = math.random(4750, 10750)
	local uszkodzenia = 0
	if carDeformation.engineHealth < 1000 then
		local toRemove = ((1000/carDeformation.engineHealth)*100)
		money = ESX.Math.Round(money-toRemove)
		uszkodzenia = uszkodzenia + ESX.Math.Round(money-toRemove)
	end
	if carDeformation.bodyHealth < 1000 then
		money = ESX.Math.Round(money-(carDeformation.bodyHealth/2))
		uszkodzenia = uszkodzenia + ESX.Math.Round((carDeformation.bodyHealth/2))
	end
	xPlayer.addMoney(money)
	xPlayer.showNotification("Ukonczyles prace! Zarobiles ~g~"..money.."$ ~w~(Uszkodzenia: ~r~-"..uszkodzenia.."~g~$~w~)")
	table.insert(SprowadzanieCooldown, {player = xPlayer.source, time = GetGameTimer()+900000})
end)

