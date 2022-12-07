local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["centerSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["centerCTRL"] = 36, ["centerALT"] = 19, ["SPACE"] = 22, ["centerCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["center"] = 174, ["center"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local Player = {}

Citizen.CreateThread(function()
	Player.Ped = GetPlayerPed(-1)
	Player.CanAttack = false
	Player.arenaUser = nil
	while true do
		Citizen.Wait(1)
		if Player.arenaUser ~= nil then
			ESX.UI.Menu.CloseAll()
			DisableControlAction(0, Keys["F2"], true)
			DisableControlAction(0, Keys["F6"], true)
			if not Player.CanAttack then
				DisableControlAction(0, 24, true)
			else
				DisableControlAction(0, 24, false)
			end
		end
	end
	while true do
		Citizen.Wait(2000)
		if Player.arenaUser ~= nil and not Player.arenaUser.isFighting then
			local coords = GetEntityCoords(Player.Ped)
			local distance = GetDistanceBetweenCoords(coords, Config.Arena.Lobby.x, Config.Arena.Lobby.y, Config.Arena.Lobby.z, false)
			if distance > 5 then
				SetEntityCoords(Player.Ped, Config.Arena.Lobby.x, Config.Arena.Lobby.y, Config.Arena.Lobby.z, false, false, false, false)
			end
		end
	end
end)

RegisterNetEvent(GetCurrentResourceName()..':playerSetup')
AddEventHandler(GetCurrentResourceName()..':playerSetup', function(round, whatPlayer)
	if round < 3 then
		if round == 1 then
			SetCurrentPedWeapon(Player.Ped, GetHashKey('WEAPON_UNARMED'), true)
			if whatPlayer == 'first' then
				SetEntityCoords(Player.Ped, Config.Arena.FirstPlayerPos.x, Config.Arena.FirstPlayerPos.y, Config.Arena.FirstPlayerPos.z, false, false, false, false)
			else
				SetEntityCoords(Player.Ped, Config.Arena.SecondPlayerPos.x, Config.Arena.SecondPlayerPos.y, Config.Arena.SecondPlayerPos.z, false, false, false, false)
			end
		elseif round == 2 then
			SetCurrentPedWeapon(Player.Ped, GetHashKey('WEAPON_KNIFE'), true)
			if whatPlayer == 'first' then
				SetEntityCoords(Player.Ped, Config.Arena.FirstPlayerPos.x, Config.Arena.FirstPlayerPos.y, Config.Arena.FirstPlayerPos.z, false, false, false, false)
			else
				SetEntityCoords(Player.Ped, Config.Arena.SecondPlayerPos.x, Config.Arena.SecondPlayerPos.y, Config.Arena.SecondPlayerPos.z, false, false, false, false)
			end
		end
	else
		SetCurrentPedWeapon(Player.Ped, GetHashKey('WEAPON_PISTOL'), true)
		SetPedAmmo(Player.Ped, GetHashKey('WEAPON_PISTOL'), 120)
		if whatPlayer == 'first' then
			SetEntityCoords(Player.Ped, Config.Arena.FirstPlayerPos.x, Config.Arena.FirstPlayerPos.y, Config.Arena.FirstPlayerPos.z, false, false, false, false)
		else
			SetEntityCoords(Player.Ped, Config.Arena.SecondPlayerPos.x, Config.Arena.SecondPlayerPos.y, Config.Arena.SecondPlayerPos.z, false, false, false, false)
		end
	end
	FreezeEntityPosition(Player.Ped, true)
end)

AddEventHandler('DamageEvents:EntityDamaged', function(entity, attacker, weaponHash, isMeleeDamage)
	if not Player.CanAttack and Player.Ped == entity and Player.arenaUser ~= nil then
		SetEntityHealth(entity, 200)
	end
end)

RegisterNetEvent(GetCurrentResourceName()..':arenaUser')
AddEventHandler(GetCurrentResourceName()..':arenaUser', function(player)
	Player.arenaUser = player
end)

RegisterNetEvent(GetCurrentResourceName()..':joinArena')
AddEventHandler(GetCurrentResourceName()..':joinArena', function(player)
	FreezeEntityPosition(Player.Ped, false)
	SetEntityCoords(Player.Ped, Config.Arena.Lobby.x, Config.Arena.Lobby.y, Config.Arena.Lobby.z, false, false, false, false)
	Player.arenaUser = player
end)

RegisterNetEvent(GetCurrentResourceName()..':roundStarted')
AddEventHandler(GetCurrentResourceName()..':roundStarted', function()
	FreezeEntityPosition(Player.Ped, false)
	Player.arenaUser.isFighting = true
	Player.CanAttack = true
end)

RegisterNetEvent(GetCurrentResourceName()..':roundEnded')
AddEventHandler(GetCurrentResourceName()..':roundEnded', function()
	SetCurrentPedWeapon(Player.Ped, GetHashKey('WEAPON_UNARMED'), true)
	SetEntityCoords(Player.Ped, Config.Arena.Lobby.x, Config.Arena.Lobby.y, Config.Arena.Lobby.z, false, false, false, false)
	Player.arenaUser.isFighting = false
	Player.CanAttack = false
end)

RegisterNetEvent(GetCurrentResourceName()..':arenaEnded')
AddEventHandler(GetCurrentResourceName()..':arenaEnded', function(lastPos)
	SetEntityCoords(Player.Ped, lastPos.x, lastPos.y, lastPos.z, false, false, false, false)
	Player.arenaUser = nil
end)

RegisterNetEvent(GetCurrentResourceName()..':setSlots')
AddEventHandler(GetCurrentResourceName()..':setSlots', function(slots)
	if slots == nil then
		for k,v in pairs(ESX.GetMisiaczekSlots()) do
			print(k.."."..v)
			ESX.SetSlot(nil, v, true)
		end
	else
		for k,v in pairs(slots) do
			ESX.SetSlot(k,v,true)
		end
	end
end)

RegisterNetEvent(GetCurrentResourceName()..':setSlot')
AddEventHandler(GetCurrentResourceName()..':setSlot', function(slot, name)
	TriggerEvent('binds:setBind', slot, name)
	ESX.SetSlot(name, slot, true)
end)

RegisterNetEvent(GetCurrentResourceName()..':canAttack')
AddEventHandler(GetCurrentResourceName()..':canAttack', function(actualFight)
	if actualFight.firstPlayer == nil or actualFight.secondPlayer == nil then
		Player.CanAttack = false
	end
	if GetPlayerServerId(PlayerId()) == actualFight.firstPlayer.playerID then
		Player.CanAttack = true
	elseif GetPlayerServerId(PlayerId()) == actualFight.firstPlayer.playerID then
		Player.CanAttack = true
	else
		Player.CanAttack = false
	end
end)