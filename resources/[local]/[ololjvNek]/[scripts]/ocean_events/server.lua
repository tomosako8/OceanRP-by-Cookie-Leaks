ESX = nil

TriggerEvent('exilerp:getSharedObject', function(obj)
	ESX = obj
	Config.check()
end)

local ArenaPlayers = {}
local ArenaLadder = {}

local ArenaData = {
	isStarted = false,
	isFighting = false,
	actualFight = {},
	round = 0,
	roundTimer = -1,
	winners = {}
}

function sendMessage(source, message)
	TriggerClientEvent("chatMessage", source, '^*^0[^3Event Arena 1VS1^0] ', { 0, 0, 0 }, message)
end

function sendMessageToArena(text)
	for _,arenaPlayer in ipairs(ArenaPlayers) do
		sendMessage(arenaPlayer.playerID, text)
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if ArenaData.isStarted then
			if not ArenaData.isFighting then
				if ArenaData.roundTimer ~= -1 and ArenaData.roundTimer > GetGameTimer() then
					sendMessageToArena("Walka wystartuje za "..ESX.Math.Round(((ArenaData.roundTimer-GetGameTimer())/1000)))
				elseif ArenaData.roundTimer ~= -1 and GetGameTimer() > ArenaData.roundTimer then
					sendMessageToArena("Walka wystartowala!")
					for i,v in ipairs(ArenaPlayers) do
						if ArenaPlayers[i].playerID == ArenaData.actualFight.firstPlayer.playerID then
							ArenaPlayers[i].isFighting = true
						elseif ArenaPlayers[i].playerID == ArenaData.actualFight.secondPlayer.playerID then
							ArenaPlayers[i].isFighting = true
						end
					end
					TriggerClientEvent('cookie_events:roundStarted', ArenaData.actualFight.firstPlayer.playerID)
					TriggerClientEvent('cookie_events:roundStarted', ArenaData.actualFight.secondPlayer.playerID)

					ArenaData.roundTimer = -1
					ArenaData.isFighting = true

				end
			else
				checkWinnerRound()
			end
			for _,player in ipairs(ArenaPlayers) do
				TriggerClientEvent('cookie_events:canAttack', player.playerID, ArenaData.actualFight)
				TriggerClientEvent('cookie_events:arenaUser', player.playerID, player)
			end
		end
	end
end)

RegisterServerEvent('cookie_events:setDeadPlayer')
AddEventHandler('cookie_events:setDeadPlayer', function(dead,playerID)
	if ArenaData.actualFight.firstPlayer ~= nil and ArenaData.actualFight.firstPlayer.playerID == playerID then
		ArenaData.actualFight.firstPlayer.isDead = dead
		print(ArenaData.actualFight.firstPlayer.isDead)
	elseif ArenaData.actualFight.secondPlayer ~= nil and ArenaData.actualFight.secondPlayer.playerID == playerID then
		ArenaData.actualFight.secondPlayer.isDead = dead
		print(ArenaData.actualFight.secondPlayer.isDead)
	end
	for i,player in ipairs(ArenaPlayers) do
		if player.playerID == playerID then
			ArenaPlayers[i].isDead = dead
			print(ArenaPlayers[i].isDead)
		end
	end

end)

function existInWinners(playerID)
	for k,v in ipairs(ArenaData.winners) do
		if v.playerID == playerID then
			return true
		end
	end
	return false
end

function removeInventory(playerID)
	local xPlayer = ESX.GetPlayerFromId(playerID)
	for _,item in pairs(xPlayer.getInventory()) do
		if item.name == 'WEAPON_KNIFE' or item.name == 'WEAPON_COMBATPISTOL' then
			xPlayer.removeInventoryItem(item.name, item.count)
		end
	end
end

function checkWinnerRound()
	if ArenaData.isFighting then
		if ArenaData.actualFight.firstPlayer.isDead then
			table.insert(ArenaData.winners, ArenaData.actualFight.secondPlayer)
			TriggerClientEvent('hypex_ambulancejob:hypexreviveblack', ArenaData.actualFight.firstPlayer.playerID)
		elseif ArenaData.actualFight.secondPlayer.isDead then
			table.insert(ArenaData.winners, ArenaData.actualFight.firstPlayer)
			TriggerClientEvent('hypex_ambulancejob:hypexreviveblack', ArenaData.actualFight.secondPlayer.playerID)
		end
		if existInWinners(ArenaData.actualFight.firstPlayer.playerID) then
			for i,v in ipairs(ArenaPlayers) do
				if ArenaPlayers[i].playerID == ArenaData.actualFight.firstPlayer.playerID then
					ArenaPlayers[i].isFighting = false
				elseif ArenaPlayers[i].playerID == ArenaData.actualFight.secondPlayer.playerID then
					ArenaPlayers[i].isFighting = false
				end
			end
			removeInventory(ArenaData.actualFight.firstPlayer.playerID)
			removeInventory(ArenaData.actualFight.secondPlayer.playerID)
			TriggerClientEvent('cookie_events:roundEnded', ArenaData.actualFight.firstPlayer.playerID)
			TriggerClientEvent('cookie_events:roundEnded', ArenaData.actualFight.secondPlayer.playerID)
			ArenaData.actualFight.winner = ArenaData.actualFight.firstPlayer
			nextRound()
		elseif existInWinners(ArenaData.actualFight.secondPlayer.playerID) then
			for i,v in ipairs(ArenaPlayers) do
				if ArenaPlayers[i].playerID == ArenaData.actualFight.firstPlayer.playerID then
					ArenaPlayers[i].isFighting = false
				elseif ArenaPlayers[i].playerID == ArenaData.actualFight.secondPlayer.playerID then
					ArenaPlayers[i].isFighting = false
				end
			end
			removeInventory(ArenaData.actualFight.firstPlayer.playerID)
			removeInventory(ArenaData.actualFight.secondPlayer.playerID)
			TriggerClientEvent('cookie_events:roundEnded', ArenaData.actualFight.firstPlayer.playerID)
			TriggerClientEvent('cookie_events:roundEnded', ArenaData.actualFight.secondPlayer.playerID)
			ArenaData.actualFight.winner = ArenaData.actualFight.secondPlayer
			nextRound()
		end
	end
end

function nextRound()
	if #ArenaLadder == 1 then
		for _,arenaPlayer in ipairs(ArenaPlayers) do
			local xTarget = ESX.GetPlayerFromId(arenaPlayer.playerID)
			TriggerClientEvent('cookie_events:arenaEnded', xTarget.source, arenaPlayer.lastPosition)
		end
		local xPlayer = ESX.GetPlayerFromId(ArenaLadder[1].winner.playerID)
		sendMessageToArena("Koniec gry! Wygrywa "..xPlayer.getName())
		ArenaData = {
			isStarted = false,
			isFighting = false,
			actualFight = {},
			round = 0,
			roundTimer = -1,
			winners = {}
		}
		ArenaPlayers = {}
		ArenaLadder = {}
		return
	end
	if #ArenaData.winners == #ArenaLadder then
		ArenaData.round = ArenaData.round+1
		ArenaLadder = {}
		sendMessageToArena("Rozpoczynamy runde "..ArenaData.round)
		for i=1, ESX.Math.Round(#ArenaData.winners/2), 1 do
			local idOne = 1
			local idSecond = #ArenaData.winners
			local playerOne = table.clone(ArenaData.winners[idOne])
			local playerSecond = table.clone(ArenaData.winners[idSecond])
			table.remove(ArenaData.winners, idOne)
			table.remove(ArenaData.winners, idSecond)

			table.insert(ArenaLadder, {
					firstPlayer = playerOne,
					secondPlayer = playerSecond,
					winner = nil,
					pairName = "pair"..i
				})
		end
		ArenaData.winners = {}
	end
	ArenaData.actualFight = ArenaLadder[math.random(#ArenaLadder)]
	while ArenaData.actualFight.winner ~= nil do
		ArenaData.actualFight = ArenaLadder[math.random(#ArenaLadder)]
		Citizen.Wait(50)
	end
	ArenaData.roundTimer = GetGameTimer()+5000
	ArenaData.isFighting = false
	arenaSetupPair()
end

function startArena()

	print("Starting")

	local cloneArenaPlayers = table.clone(ArenaPlayers)
	print(#cloneArenaPlayers)

	for i=1, ESX.Math.Round(#ArenaPlayers/2), 1 do
		local idOne = 1
		local idSecond = #cloneArenaPlayers
		local playerOne = table.clone(cloneArenaPlayers[idOne])
		local playerSecond = table.clone(cloneArenaPlayers[idSecond])
		--[[if idOne == idSecond then
			sendMessageToArena("Aby wystartowac potrzebna jest parzysta ilosc graczy")
			return
		end]]--
		print(playerOne)
		table.insert(ArenaLadder, {
				firstPlayer = playerOne,
				secondPlayer = playerSecond,
				winner = nil,
				pairName = "pair"..i
			})
		table.remove(cloneArenaPlayers, idOne)
		table.remove(cloneArenaPlayers, idSecond)
	end
	print(#ArenaPlayers)

	ArenaData.actualFight = ArenaLadder[math.random(#ArenaLadder)]
	ArenaData.round = 1
	ArenaData.roundTimer = GetGameTimer()+5000
	ArenaData.isStarted = true
	arenaSetupPair()
end

function arenaSetupPair()
	local xPlayerFirst = ESX.GetPlayerFromId(ArenaData.actualFight.firstPlayer.playerID)
	local xPlayerSecond = ESX.GetPlayerFromId(ArenaData.actualFight.secondPlayer.playerID)
	if ArenaData.round < 3 then
		if ArenaData.round == 2 then
			xPlayerFirst.addInventoryItem('WEAPON_KNIFE', 1)
			xPlayerSecond.addInventoryItem('WEAPON_KNIFE', 1)
			TriggerClientEvent('cookie_events:setSlot', xPlayerFirst.source, 1, 'WEAPON_KNIFE')
			TriggerClientEvent('cookie_events:setSlot', xPlayerSecond.source, 1, 'WEAPON_KNIFE')
		end
	else
		xPlayerFirst.addInventoryItem('WEAPON_COMBATPISTOL', 1)
		xPlayerSecond.addInventoryItem('WEAPON_COMBATPISTOL', 1)
		xPlayerFirst.addInventoryItem('pistol_ammo', 120)
		xPlayerSecond.addInventoryItem('pistol_ammo', 120)
		TriggerClientEvent('cookie_events:setSlot', xPlayerFirst.source, 1, 'WEAPON_COMBATPISTOL')
		TriggerClientEvent('cookie_events:setSlot', xPlayerSecond.source, 1, 'WEAPON_COMBATPISTOL')
	end
	TriggerClientEvent('cookie_events:playerSetup', ArenaData.actualFight.firstPlayer.playerID, ArenaData.round, 'first')
	TriggerClientEvent('cookie_events:playerSetup', ArenaData.actualFight.secondPlayer.playerID, ArenaData.round, 'second')
end

RegisterCommand('event', function(source, args, raw)
	if args[1] ~= nil then
		local xPlayer = ESX.GetPlayerFromId(source)
		if args[1] == 'arena' then
			joinPlayer(xPlayer)
		elseif args[1] == 'startArena' then
			if xPlayer.getGroup() == 'best' then
				startArena()
			end
		elseif args[1] == 'restoreEQ' then
			if isPlayerJoined(xPlayer) then
				for k,v in ipairs(ArenaPlayers) do
					if v.playerID == xPlayer.source then
						for _,item in ipairs(v.inventory) do
							print(item.name)
							xPlayer.addInventoryItem(item.name, item.count)
						end
					end
				end
			end
		elseif args[1] == 'opusc' then
			leavePlayer(xPlayer)
		elseif args[1] == 'giveall' then
			if xPlayer.getGroup() == 'best' then
				local item = args[2]
				local amount = tonumber(args[3])
				for _,player in pairs(ESX.GetExtendedPlayers()) do
					player.addInventoryItem(item, amount)
					player.showNotification("Otrzymales przedmiot od administratora ~r~"..xPlayer.getName())
				end
				xPlayer.showNotification("Kazdy otrzymal przedmiot ~g~"..item.."~w~ w ilosci x~g~"..amount)
			end
		end
	end
end)

function getArenaPlayer(xPlayer)
	for _,arenaPlayer in ipairs(ArenaPlayers) do
		if xPlayer == arenaPlayer.playerID then
			return arenaPlayer
		end
		if xPlayer.source == arenaPlayer.playerID then
			return arenaPlayer
		end
	end
	return nil
end

function isPlayerJoined(xPlayer)
	for _,v in ipairs(ArenaPlayers) do
		if v.playerID == xPlayer.source then
			return true
		end
	end
	return false
end

function leavePlayer(xPlayer)
	if not ArenaData.isStarted then
		if isPlayerJoined(xPlayer) then
			local arenaPlayer = getArenaPlayer(xPlayer)

			TriggerClientEvent('cookie_events:arenaEnded', xPlayer.source, arenaPlayer.lastPosition)
			TriggerClientEvent('cookie_events:setSlots', xPlayer.source, arenaPlayer.slots)
			for i,v in ipairs(ArenaPlayers) do
				if ArenaPlayers[i].playerID == xPlayer.source then
					table.remove(ArenaPlayers, i)
				end
			end
			sendMessageToArena("[-] "..xPlayer.getName().." zapisanych: "..#ArenaPlayers)
		end
	end
end

function joinPlayer(xPlayer)
	if ArenaData.isStarted then
		xPlayer.showNotification("Ten event juz dawno wystartowal. Wpisz /event obserwuj aby obserwowac")
		return
	end
	if not isPlayerJoined(xPlayer) then
		TriggerClientEvent('cookie_events:joinArena', xPlayer.source, {playerID = xPlayer.source, isFighting = false, enemyPlayer = 0, inventory = table.clone(xPlayer.getInventory()), lastPosition = xPlayer.getCoords(), isDead = false})
		table.insert(ArenaPlayers, {playerID = xPlayer.source, isFighting = false, enemyPlayer = 0, inventory = table.clone(xPlayer.getInventory()), lastPosition = xPlayer.getCoords(), isDead = false, slots = table.clone(xPlayer.getSlots())})
		xPlayer.showNotification("Zapisałeś się na event ~g~ARENA 1v1")
		sendMessageToArena("[+] "..xPlayer.getName().." zapisanych: "..#ArenaPlayers)
		TriggerClientEvent('binds:unBindAll', xPlayer.source)
		TriggerClientEvent('cookie_events:setSlots', xPlayer.source, nil)
	else
		xPlayer.showNotification("~r~Już się zapisałeś na ten event!")
	end
end