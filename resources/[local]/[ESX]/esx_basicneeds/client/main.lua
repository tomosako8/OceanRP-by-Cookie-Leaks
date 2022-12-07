local IsDead = false
local IsAnimated = false
local onSamarka = false
local IsAlreadyDrug = false
local DrugLevel = -1

local IsAlreadyDrunk = false
local DrunkLevel     = -1

-- ENERGY DRINK
local energyDrinkTimeLeft = 0


AddEventHandler('esx_basicneeds:resetStatus', function()
	TriggerEvent('esx_status:set', 'hunger', 1800000)
	TriggerEvent('esx_status:set', 'thirst', 1800000)
	TriggerEvent('esx_status:set', 'drug', 0)
	TriggerEvent('esx_status:set', 'drunk', 0)

end)

RegisterNetEvent('esx_basicneeds:healPlayer')
AddEventHandler('esx_basicneeds:healPlayer', function()
	-- restore hunger & thirst
	TriggerEvent('esx_status:set', 'hunger', 3600000)
	TriggerEvent('esx_status:set', 'thirst', 3600000)
	TriggerEvent('esx_status:set', 'drug', 0)
	TriggerEvent('esx_status:set', 'drunk', 0)
	-- restore hp
	local playerPed = PlayerPedId()
	Citizen.InvokeNative(0x6B76DC1F3AE6E6A3, playerPed, GetEntityMaxHealth(playerPed))
end)

AddEventHandler('esx:onPlayerDeath', function()
	IsDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	if IsDead then
		TriggerEvent('esx_basicneeds:resetStatus')
	end

	IsDead = false
end)

AddEventHandler('esx_status:loaded', function(status)

	TriggerEvent('esx_status:registerStatus', 'hunger', 1800000, {255, 210, 0}, true, function(status)
		if not GetPlayerInvincible(PlayerId()) then
			status.remove(4000)
		end
	end)

	TriggerEvent('esx_status:registerStatus', 'thirst', 1800000, {0, 198, 255}, true, function(status)
		if not GetPlayerInvincible(PlayerId()) then
			status.remove(4000)
		end
	end)
	
	TriggerEvent('esx_status:registerStatus', 'drug', 0, {255, 0, 246}, false, function(status)
		if status.val > 1500 then
			status.remove(1500)
			return true
		else
			return false
		end
    end)

	TriggerEvent('esx_status:registerStatus', 'drunk', 0, {255, 0, 246}, false, function(status)
    	if status.val > 0 then
        	return true
      	else
        	return false
      	end
    end, function(status)
    	status.remove(1500)
    end)
end)

function Drunk(level, start)
  
  CreateThread(function()

    local playerPed = PlayerPedId()

    if start then
      DoScreenFadeOut(800)
      Wait(1000)
    end

    if level == 0 then

      RequestAnimSet("move_m@drunk@slightlydrunk")
      
      while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
        Wait(0)
      end

      SetPedMovementClipset(playerPed, "move_m@drunk@slightlydrunk", true)

    elseif level == 1 then

      RequestAnimSet("move_m@drunk@moderatedrunk")
      
      while not HasAnimSetLoaded("move_m@drunk@moderatedrunk") do
        Wait(0)
      end

      SetPedMovementClipset(playerPed, "move_m@drunk@moderatedrunk", true)

    elseif level == 2 then

      RequestAnimSet("move_m@drunk@verydrunk")
      
      while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
        Wait(0)
      end

      SetPedMovementClipset(playerPed, "move_m@drunk@verydrunk", true)

    end

    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    SetPedIsDrunk(playerPed, true)

    if start then
      DoScreenFadeIn(800)
    end

  end)

end

function Reality()
	CreateThread(function()
		local playerPed = PlayerPedId()

		DoScreenFadeOut(800)
		Wait(1000)

		ClearTimecycleModifier()
		ResetScenarioTypesEnabled()
		ResetPedMovementClipset(playerPed, 0)
		SetPedIsDrunk(playerPed, false)
		SetPedMotionBlur(playerPed, false)

		DoScreenFadeIn(800)

	end)
end
--[[
Citizen.CreateThread(function()
	Citizen.Wait(0)
	while true do
		Citizen.Wait(1000)
		TriggerEvent('esx_status:getStatus', 'hunger', function(status)
			status.remove(4000)
		end)

		TriggerEvent('esx_status:getStatus', 'thirst', function(status)
			status.remove(4000)
		end)
	end
end)--]]


AddEventHandler('esx_status:onTick', function(data)
	local playerPed  = PlayerPedId()
	local prevHealth = GetEntityHealth(playerPed)
	local health     = prevHealth

	for k, v in pairs(data) do
		if v.name == 'hunger' and v.percent == 0 then
			if prevHealth <= 150 then
				health = health - 5
			else
				health = health - 1
			end
		elseif v.name == 'thirst' and v.percent == 0 then
			if prevHealth <= 150 then
				health = health - 5
			else
				health = health - 1
			end
		end
	end
	
	if health ~= prevHealth then SetEntityHealth(playerPed, health) end

	--[[TriggerEvent('esx_status:getStatus', 'hunger', function(status)
		status.remove(4000)
	end)

	TriggerEvent('esx_status:getStatus', 'thirst', function(status)
		status.remove(4000)
	end)--]]
	TriggerEvent('esx_status:getStatus', 'drug', function(status)
		if status.val > 0 then
			local start = true

			if IsAlreadyDrug then
				start = false
			end

			local level = 0

			if status.val <= 999999 then
				level = 0
			else
				overdose()
			end

			IsAlreadyDrug = true
			DrugLevel = level
		end

		if status.val == 0 then
	  
			if IsAlreadyDrug then
				Normal()
			end

			IsAlreadyDrug = false
			DrugLevel     = -1
		end
	end)
	
	TriggerEvent('esx_status:getStatus', 'drunk', function(status)
		if status.val > 0 then
			local start = true
			if IsAlreadyDrunk then
				start = false
			end
			local level = 0
			if status.val <= 300000 then
				level = 0
			elseif status.val <= 1200000 then
				level = 1
			else
				level = 2
			end

			if level ~= DrunkLevel then
				Drunk(level, start)
			end

			IsAlreadyDrunk = true
			DrunkLevel     = level
		end

		if status.val == 0 then
			if IsAlreadyDrunk then
				Reality()
			end
			IsAlreadyDrunk = false
			DrunkLevel     = -1
		end
	end)
end)

RegisterNetEvent('esx_basicneeds:checkDrunk')
AddEventHandler('esx_basicneeds:checkDrunk', function()
	checkDrunk()
end)

RegisterNetEvent('esx_basicneeds:checkDrug')
AddEventHandler('esx_basicneeds:checkDrug', function()
	checkDrug()
end)

function checkDrug()
	TriggerEvent('esx_status:getStatus', 'drug', function(status)
		if status.val > 0 then
			local start = true

			if IsAlreadyDrug then
				start = false
			end

			local level = 0

			if status.val <= 999999 then
				level = 0
			else
				overdose()
			end

			IsAlreadyDrug = true
			DrugLevel = level
		end

		if status.val == 0 then
	  
			if IsAlreadyDrug then
				Normal()
			end

			IsAlreadyDrug = false
			DrugLevel     = -1
		end
	end)
end

function checkDrunk()
	TriggerEvent('esx_status:getStatus', 'drunk', function(status)
		if status.val > 0 then
			local start = true
			if IsAlreadyDrunk then
				start = false
			end
			local level = 0
			if status.val <= 300000 then
				level = 0
			elseif status.val <= 1200000 then
				level = 1
			else
				level = 2
			end

			if level ~= DrunkLevel then
				Drunk(level, start)
			end

			IsAlreadyDrunk = true
			DrunkLevel     = level
		end

		if status.val == 0 then
			if IsAlreadyDrunk then
				Reality()
			end
			IsAlreadyDrunk = false
			DrunkLevel     = -1
		end
	end)
end

function isDrunk()
	if DrunkLevel == -1 then
		return false
	elseif DrunkLevel >= 0 then
		return true
	end
end

function Normal()
	CreateThread(function()
		local playerPed = PlayerPedId()
		ClearTimecycleModifier()
		ResetScenarioTypesEnabled()
		SetPedIsDrug(playerPed, false)
		SetPedMotionBlur(playerPed, false)
	end)
end

function overdose()
	CreateThread(function()
		local playerPed = PlayerPedId()
		Citizen.InvokeNative(0x6B76DC1F3AE6E6A3, playerPed, 0)
		ClearTimecycleModifier()
		ResetScenarioTypesEnabled()
		ResetPedMovementClipset(playerPed, 0)
		SetPedIsDrug(playerPed, false)
		SetPedMotionBlur(playerPed, false)
	end)
end

-- Weed Effect
RegisterNetEvent('xlem0n_drugs:onPot')
AddEventHandler('xlem0n_drugs:onPot', function()
	RequestAnimSet("MOVE_M@DRUNK@SLIGHTLYDRUNK")
	while not HasAnimSetLoaded("MOVE_M@DRUNK@SLIGHTLYDRUNK") do
		Wait(0)
	end
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SMOKING_POT", 0, true)
	Wait(5000)
	DoScreenFadeOut(1000)
	Wait(1000)
	Citizen.InvokeNative(0xAAA34F8A7CB32098, PlayerPedId())
	SetTimecycleModifier("spectator5")
	SetPedMotionBlur(PlayerPedId(), true)
	SetPedMovementClipset(PlayerPedId(), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
	SetPedIsDrunk(PlayerPedId(), true)
	DoScreenFadeIn(1000)
	Wait(600000)
	DoScreenFadeOut(1000)
	Wait(1000)
	DoScreenFadeIn(1000)
	ClearTimecycleModifier()
	ResetScenarioTypesEnabled()
	ResetPedMovementClipset(PlayerPedId(), 0)
	SetPedIsDrunk(PlayerPedId(), false)
	SetPedMotionBlur(PlayerPedId(), false)
end)

AddEventHandler('esx_basicneeds:isEating', function(cb)
	cb(IsAnimated)
end)

RegisterNetEvent('esx_basicneeds:onEat')
AddEventHandler('esx_basicneeds:onEat', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_sandwich_01'
		IsAnimated = true

		CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.135, 0.02, 0.05, -30.0, -120.0, -60.0, 1, 1, 0, 1, 1, 1)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger', 8.0, 3.0, -1, 51, 1, 0, 0, 0)

				Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:hamburger')
AddEventHandler('esx_basicneeds:hamburger', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_cs_burger_01'
		IsAnimated = true

		CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.135, 0.02, 0.05, 180.0, 0.0, 0.0, 1, 1, 0, 1, 1, 1)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger', 8.0, 3.0, -1, 51, 1, 0, 0, 0)
				Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:onEatChocolate')
AddEventHandler('esx_basicneeds:onEatChocolate', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_choc_ego'
		IsAnimated = true

		CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.035, 0.009, -30.0, -240.0, -120.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)

				Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:onEatFruit')
AddEventHandler('esx_basicneeds:onEatFruit', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'ng_proc_food_ornge1a'
		IsAnimated = true

		CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.135, 0.02, 0.05, -30.0, -120.0, -60.0, 1, 1, 0, 1, 1, 1)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger', 8.0, 3.0, -1, 51, 1, 0, 0, 0)

				Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:onCola')
AddEventHandler('esx_basicneeds:onCola', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'ng_proc_sodacan_01a'
		IsAnimated = true

		CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 57005)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.105, -0.07, -0.045, -80.0, 0.0, -20.0, 1, 1, 0, 1, 1, 1)

			ESX.Streaming.RequestAnimDict('amb@world_human_drinking@coffee@male@idle_a', function()
				TaskPlayAnim(playerPed, 'amb@world_human_drinking@coffee@male@idle_a', 'idle_a', 8.0, 3.0, -1, 51, 1, 0, 0, 0)
				Wait(5500)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:onEatCupCake')
AddEventHandler('esx_basicneeds:onEatCupCake', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'ng_proc_food_ornge1a'
		IsAnimated = true

		CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.045, 0.06, 45.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)

				Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)


RegisterNetEvent('esx_basicneeds:crisps')
AddEventHandler('esx_basicneeds:crisps', function()
	if not IsAnimated then
		local playerPed  = PlayerPedId()
		local coords     = GetEntityCoords(playerPed)
		local boneIndex = GetPedBoneIndex(playerPed, 57005)

		IsAnimated = true
		ESX.Game.SpawnObject('prop_cs_crisps_01', {
			x = coords.x,
			y = coords.y,
			z = coords.z - 3
		}, function(object)
			RequestAnimDict('amb@code_human_wander_eating_donut@male@idle_a')
			while not HasAnimDictLoaded('amb@code_human_wander_eating_donut@male@idle_a') do
				Wait(0)
			end

			TaskPlayAnim(playerPed, "amb@code_human_wander_eating_donut@male@idle_a", "idle_c", 3.5, -8.0, -1, 48, 0.0, false, false, false)
			AttachEntityToEntity(object, playerPed, boneIndex, 0.15, 0.01, -0.06, 80.0, 215.0, 180.0, true, true, false, true, 1, true)
			Wait(3000)

			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			DeleteObject(object)
		end)
	end
end)

-------------
--- PICIE ---
-------------

RegisterNetEvent('esx_basicneeds:onDrink')
AddEventHandler('esx_basicneeds:onDrink', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_ld_flow_bottle'
		IsAnimated = true

		CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x , y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.09, -0.065, 0.045, -100.0, 0.0, -25.0, 1, 1, 0, 1, 1, 1)

			ESX.Streaming.RequestAnimDict('mp_player_intdrink', function()
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 8.0, -8.0, 2000, 48, 0, false, false, false)

				Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)
--[[
RegisterNetEvent('esx_basicneeds:onDrinkKawa')
AddEventHandler('esx_basicneeds:onDrinkKawa', function()
	if not IsAnimated then
		local playerPed  = PlayerPedId()
		local coords     = GetEntityCoords(playerPed)
		local boneIndex  = GetPedBoneIndex(playerPed, 18905)

		IsAnimated = true
		ESX.Game.SpawnObject('prop_ld_flow_bottle', {
			x = coords.x,
			y = coords.y,
			z = coords.z - 3
		}, function(object)
			RequestAnimDict('mp_player_intdrink')  
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Wait(0)
			end

			AttachEntityToEntity(object, playerPed, boneIndex, 0.09, -0.065, 0.045, -100.0, 0.0, -25.0, 1, 1, 0, 1, 1, 1)
			TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, -1, 48, 0.0, false, false, false)
			Wait(3000)

	        IsAnimated = false
	        ClearPedSecondaryTask(playerPed)
			DeleteObject(object)
			
			local player = PlayerId()
			local timer = 0
			while timer < 900 do
				ResetPlayerStamina(player)
				SetRunSprintMultiplierForPlayer(player, 1.3)
				Wait(2000)
				timer = timer + 2
				SetRunSprintMultiplierForPlayer(player, 1.0)
			end
		end)
	end
end)
]]
RegisterNetEvent('esx_basicneeds:onEatBaton')
AddEventHandler('esx_basicneeds:onEatBaton', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_choc_meto'
		IsAnimated = true

		CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.135, 0.02, 0.05, -30.0, -120.0, -60.0, 1, 1, 0, 1, 1, 1)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger', 8.0, 3.0, -1, 51, 1, 0, 0, 0)

				Wait(2500)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:onDrinkKawa')
AddEventHandler('esx_basicneeds:onDrinkKawa', function()
	local playerPed  = PlayerPedId()
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('mp_player_intdrink')
	while not HasAnimDictLoaded('mp_player_intdrink') do
		Wait(1)
	end
	
	ESX.Game.SpawnObject('prop_energy_drink', {
		x = coords.x,
		y = coords.y,
		z = coords.z + 0.2
	}, function(object)
		TaskPlayAnim(playerPed, "mp_player_intdrink", "loop_bottle", 8.0, -8.0, 2000, 48, 0, false, false, false)
		AttachEntityToEntity(object, playerPed, boneIndex,  0.09, -0.065, 0.045, -100.0, 0.0, -25.0, 1, 1, 0, 1, 1, 1)
		Wait(3000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)

	ESX.ShowNotification('Wypiłeś ~b~X-Gamer Energy')

	energyDrinkTimeLeft = 300

	SetRunSprintMultiplierForPlayer(PlayerId(), 1.25)
end)

CreateThread(function()
	while true do
		Wait(1000)
		if energyDrinkTimeLeft > 0 then
			local playerid = PlayerId()
			ResetPlayerStamina(playerid)
			energyDrinkTimeLeft = energyDrinkTimeLeft - 1
			if energyDrinkTimeLeft == 1 or exports["esx_ambulancejob"]:isDead() then
				SetRunSprintMultiplierForPlayer(playerid, 1.0)
				ESX.ShowNotification('~r~Czujesz, że X-Gamer Energy przestaje działać...')
				energyDrinkTimeLeft = 0
			end
		end
	end
end)

RegisterNetEvent('itemki-roza')
AddEventHandler('itemki-roza', function()
	local playerPed = PlayerPedId()
	local coords	= GetEntityCoords(playerPed)
	local boneIndex = GetPedBoneIndex(playerPed, 57005)
	
	RequestAnimDict('amb@code_human_wander_drinking@beer@male@base')
	while not HasAnimDictLoaded('amb@code_human_wander_drinking@beer@male@base') do
		Wait(0)
	end
	
	ESX.Game.SpawnObject('p_single_rose_s', {
		x = coords.x,
		y = coords.y,
		z = coords.z + 2
	}, function(object)
		AttachEntityToEntity(object, playerPed, boneIndex, 0.10, 0, -0.001, 80.0, 150.0, 200.0, true, true, false, true, 1, true)
		TaskPlayAnim(playerPed, "amb@code_human_wander_drinking@beer@male@base", "static", 3.5, -8, -1, 49, 0, 0, 0, 0)
		Wait(60000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
end)

RegisterNetEvent('itemki-kocyk')
AddEventHandler('itemki-kocyk', function()
	local playerPed = PlayerPedId()
	local coords	= GetEntityCoords(playerPed)

	ESX.Game.SpawnObject('prop_yoga_mat_03',  {
		x = coords.x,
		y = coords.y,
		z = coords.z - 1
	}, function(object)
	end)
	ESX.Game.SpawnObject('prop_yoga_mat_03',  {
		x = coords.x,
		y = coords.y - 0.9,
		z = coords.z - 1
	}, function(object)
	end)
	ESX.Game.SpawnObject('prop_yoga_mat_03',  {
		x = coords.x,
		y = coords.y + 0.9,
		z = coords.z - 1
	}, function(object)
	end)
	ESX.Game.SpawnObject('prop_champset',  {
		x = coords.x,
		y = coords.y,
		z = coords.z - 1
	}, function(object)
	end)
end)

RegisterNetEvent('esx_basicneeds:onSamarka')
AddEventHandler('esx_basicneeds:onSamarka', function()
	if not IsAnimated then
		local playerPed  = PlayerPedId()
		local coords     = GetEntityCoords(playerPed)
		local boneIndex  = GetPedBoneIndex(playerPed, 18905)

		IsAnimated = true
		ESX.Game.SpawnObject('p_meth_bag_01_s', {
			x = coords.x,
			y = coords.y,
			z = coords.z - 3
		}, function(object)
			local timer = GetGameTimer() + (15 * 60000)
				
			AttachEntityToEntity(object, playerPed, boneIndex, 0.09, -0.065, 0.045, -100.0, 0.0, -25.0, 1, 1, 0, 1, 1, 1)
			Wait(1500)
			ClearPedSecondaryTask(playerPed)
			DetachEntity(object)
			
			CreateThread(function()
			
				while timer >= GetGameTimer() do
					Wait(5)
					
					local DrawTime = math.ceil((timer - GetGameTimer()) / 1000)
					_DrawText(0.183, 0.97, 0.4, '~b~Samarka: ~w~pozostało ~b~' .. DrawTime .. '~w~ sekund')
				end
				
				ESX.ShowNotification('~b~Samarka ~w~zużyła się')
				timer = timerMax
				TriggerServerEvent('esx_basicneeds:offSamarka')
			end)

			IsAnimated = false
		end)
	end
end)

function _DrawText(x, y, scale, text)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextScale(scale, scale)
	SetTextColour(255, 255, 255, 255)
	SetTextOutline()

	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end