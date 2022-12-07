-- GLOBALNE
playerPed = PlayerPedId()
playerid = PlayerId()
playercoords = GetEntityCoords(playerPed)
inVehicle = IsPedInAnyVehicle(playerPed, false)
vehicle = GetVehiclePedIsIn(playerPed, false)
status, weapon = GetCurrentPedWeapon(playerPed, true)

CreateThread( function()
    while true do
        playerPed = PlayerPedId()
        playerid = PlayerId()
		playercoords = GetEntityCoords(playerPed)
		inVehicle = IsPedInAnyVehicle(playerPed, false)
		vehicle = GetVehiclePedIsIn(playerPed, false)
		status, weapon = GetCurrentPedWeapon(playerPed, true)
        Citizen.Wait(500)
    end
end)

SetRelationshipBetweenGroups(3, `AMBIENT_GANG_HILLBILLY`, `PLAYER`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_BALLAS`, `PLAYER`)
SetRelationshipBetweenGroups(2, `AMBIENT_GANG_MEXICAN`, `PLAYER`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_FAMILY`, `PLAYER`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MARABUNTE`, `PLAYER`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_SALVA`, `PLAYER`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_LOST`, `PLAYER`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_CULT`, `PLAYER`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_WEICHENG`, `PLAYER`)
SetRelationshipBetweenGroups(3, `GANG_1`, `PLAYER`)
SetRelationshipBetweenGroups(3, `GANG_2`, `PLAYER`)
SetRelationshipBetweenGroups(3, `GANG_9`, `PLAYER`)
SetRelationshipBetweenGroups(3, `GANG_10`, `PLAYER`)
SetRelationshipBetweenGroups(3, `FIREMAN`, `PLAYER`)
SetRelationshipBetweenGroups(3, `MEDIC`, `PLAYER`)
SetRelationshipBetweenGroups(3, `COP`, `PLAYER`)
SetRelationshipBetweenGroups(3, `PRISONER`, `PLAYER`)
SetRelationshipBetweenGroups(3, `SECURITY_GUARD`, `PLAYER`)

AddEventHandler('esx:onPlayerSpawn', function() 
	canUsePropfix = false
	Citizen.Wait(5000)
	canUsePropfix = true
end)

local strike = 0
local newPlayer = false
 
Config = {
	FirstPersonShoot = true,
	
	DisplayCrosshair = {
		'WEAPON_SNIPERRIFLE',
		'WEAPON_HEAVYSNIPER',
		'WEAPON_HEAVYSNIPER_MK2',
		'WEAPON_MARKSMANRIFLE',
		'WEAPON_MARKSMANRIFLE_MK2'
	},

	Weapons = {
		[`WEAPON_ADVANCEDRIFLE`] = 1.0,-- 4 hitów advancedrifle
		[`WEAPON_MILITARYRIFLE`] = 1.3,-- 3 hitów militaryrifle
		[`WEAPON_COMBATPDW`] = 0.8,--6 hitów combatpdw
		[`WEAPON_SPECIALCARBINE`] = 0.9,-- 4 hitów specialcarbine
		[`WEAPON_GUSENBERG`] = 1.0,-- 4 hitów gusenberg
		[`WEAPON_COMPACTRIFLE`] = 0.7,-- 5 hitów compactrifle
		[`WEAPON_CARBINERIFLE`] = 1.1,-- 5 hitów carbinerifle
		[`WEAPON_CARBINERIFLE_MK2`] = 1.0,-- 4 hitów carbinerifle_mk2
		[`WEAPON_HEAVYRIFLE`] = 1.25,-- 3 hitów heavyrifle
		[`WEAPON_COMPACTLAUNCHER`] = 2.0,-- 1 hitów rakietnica
		[`WEAPON_HOMINGLAUNCHER`] = 4.0,-- 1 hitów rakietnica
		[`WEAPON_EMPLAUNCHER`] = 0.0,-- 0 hitów
		[`WEAPON_DBSHOTGUN`] = 8.0,-- 1 hitów pompa
		[`WEAPON_SAWNOFFSHOTGUN`] = 3.5,-- 1 hitów pompa
		[`WEAPON_PUMPSHOTGUN`] = 3.5,-- 1 hitów pompa
		[`WEAPON_BULLPUPSHOTGUN`] = 8.0,-- 1 hitów pompa
		[`WEAPON_SMOKEGRENADE`] = 0.0,-- 0 hitów granat
		[`WEAPON_MINIGUN`] = 8.0,-- 1 hitów minigun
		[`WEAPON_MUSKET`] = 1.05,-- 1 hitów muszkiet
		[`WEAPON_SNIPERRIFLE`] = 8.0,-- 1 hitów snajperka
		[`WEAPON_SMG`] = 0.9,--6 hitów smg 
		[`WEAPON_MINISMG`] = 0.8,-- 7 hitów minismg
		[`WEAPON_MICROSMG`] = 0.8,-- 7 hitów microsmg
		[`WEAPON_ASSAULTRIFLE`] = 1.2,-- 3 hitów assualtrifle 
		[`WEAPON_ASSAULTRIFLE_MK2`] = 1.2,-- 3 hitów assualtrifle_mk2
		[`WEAPON_GADGETPISTOL`] = 0.2,-- 3 hitów gadgetpistol
		[`WEAPON_HEAVYPISTOL`] = 1.6,-- 4 hitów heavypistol 
		[`WEAPON_REVOLVER`] = 0.8,-- 2 hitów revolver
		[`WEAPON_DOUBLEACTION`] = 1.0,-- 3 hitów double action revolver
		[`WEAPON_MACHINEPISTOL`] = 0.55,-- 7 hitów machinepistol
	},

	Melees = {
		[`WEAPON_NIGHTSTICK`] = 0.4,
		[`WEAPON_UNARMED`] = 0.1,
		[`WEAPON_GOLFCLUB`] = 0.4,
		[`WEAPON_FLASHLIGHT`] = 0.2,
		[`WEAPON_KNUCKLE`] = 0.7,
		[`WEAPON_BAT`] = 0.7,
		[`WEAPON_CROWBAR`] = 0.4,
		[`WEAPON_HAMMER`] = 0.4,
		[`WEAPON_WRENCH`] = 0.4,
		[`WEAPON_DAGGER`] = 1.0,
		[`WEAPON_MACHETE`] = 1.0,
		[`WEAPON_STONE_HATCHET`] = 1.0,
		[`WEAPON_SWITCHBLADE`] = 1.0,
		[`WEAPON_BATTLEAXE`] = 1.0,
		[`WEAPON_HATCHET`] = 1.0,
		[`WEAPON_KNIFE`] = 1.0
	},
	
	Visuals = {
		["trafficLight.near.intensity"] = 0.0,
		["trafficLight.near.radius"] = 0.0,
		["trafficLight.near.outerConeAngle"] = 20.0,
		["trafficLight.near.coronaHDR"] = 2.0,
		["trafficLight.near.coronaSize"] = 0.0,
		["trafficLight.farFadeStart"] = 200.0,
		["trafficLight.farFadeEnd"] = 250.0,
		["trafficLight.nearFadeStart"] = 100.0,
		["trafficLight.nearFadeEnd"] = 130.0,
		["car.sirens.ShadowFade"] = 35.0,
		["car.sirens.intensity"] = 75.0,
		["car.sirens.radius"] = 50.0,
		["Tonemapping.dark.filmic.A"] = 0.3,
		["Tonemapping.dark.filmic.B"] = 0.23,
		["Tonemapping.dark.filmic.C"] = 0.2,
		["lodlight.corona.size"] = 1.75,
		["misc.coronas.sizeScaleGlobal"] = 1.25,
		["misc.coronas.intensityScaleGlobal"] = 0.0,
		["misc.coronas.intensityScaleWater"] = 0.0,
		["misc.coronas.sizeScaleWater"] = 0.0,
		["misc.coronas.screenspaceExpansionWater"] = 0.0,
		["misc.coronas.zBiasMultiplier"] = 25.0,
		["misc.coronas.zBias.fromFinalSizeMultiplier"] = 0.1,
		["misc.coronas.underwaterFadeDist"] = 2.0,
		["misc.coronas.screenEdgeMinDistForFade"] = 0.0,
	},
	
	Strefy = {
		{
			Pos = vector3(-229.99, -1519.53, 31.46),
			Radius = 55.0,
			Colour = 2
		},
		{
			Pos = vector3(840.55, -2355.71, 30.33),
			Radius = 60.0,
			Colour = 17
		},
		{
			Pos = vector3(904.98, -485.84, 59.44),
			Radius = 60.0,
			Colour = 10
		},
		{
			Pos = vector3(-1980.32, 254.74, 87.21),
			Radius = 60.0,
			Colour = 24
		},
		{
			Pos = vector3(-725.46, -863.49, 26.78),
			Radius = 60.0,
			Colour = 4
		},
		{
			Pos = vector3(-94.0637, -1790.0352, 28.0442),
			Radius = 60.0,
			Colour = 7
		},
		{
			Pos = vector3(333.2, -2038.74, 21.05),
			Radius = 50.0,
			Colour = 5
		},
		{
			Pos = vector3(-1305.42, 286.71, 64.75),
			Radius = 55.0,
			Colour = 2
		},
		{
			Pos = vector3(972.63, -122.37, 74.34),
			Radius = 50.0,
			Colour = 72
		},
		{
			Pos = vector3(1377.49, -1552.52, 56.58),
			Radius = 70.0,
			Colour = 3
		},
		{
			Pos = vector3(-1555.9609, -401.6158, 41.0377),
			Radius = 70.0,
			Colour = 1
		},
		{
			Pos = vector3(449.031, -1894.219, 25.8005),
			Radius = 65.0,
			Colour = 29
		},
		{
			Pos = vector3(1378.9091, -2078.6506, 51.0489),
			Radius = 80.0,
			Colour = 40
		},
		{
			Pos = vector3(-1152.9735, -1526.145, 3.2986),
			Radius = 60.0,
			Colour = 8
		},
	}
	
}

local DisableShuffle = true
local can = true

local currentWeather = 'EXTRASUNNY'
local lastweather = currentWeather
local blackout = false

local baseTime = 0
local timeOffset = 0
local timer = 0
local freezeTime = false

local loadingStatus = 0
local loadingPosition = false

local inProperty = false
local beltOn = false

function AddTextEntry(key, value)
	Citizen.InvokeNative(`ADD_TEXT_ENTRY`, key, value)
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	PlayerLoaded = true
	if not loadingPosition then
		print('[OceanRP]: Załadowano gracza')
		loadingStatus = 1
		ESX.UI.HUD.SetDisplay(0.0)
		loadingPosition = (xPlayer.coords or {x = -1037.86, y = -2738.11, z = 20.16})

		Citizen.InvokeNative(0x239528EACDC3E7DE, playerid, true)
		Citizen.InvokeNative(0xEA1C610A04DB6BBB, playerPed, false)
		
		FreezeEntityPosition(playerPed, true)
		SetEntityCoords(playerPed, 0, 0, 0)
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

local DisableShuffle = true
function DisableSeatShuffle(status)
	DisableShuffle = status
end

function SeatShuffle()
	if inVehicle then
		if GetPedInVehicleSeat(vehicle, 0) == playerPed then
			DisableSeatShuffle(false)
			Citizen.Wait(5000)
			DisableSeatShuffle(true)
		else
			TaskShuffleToNextVehicleSeat(playerPed, vehicle)
		end
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		id = PlayerId()
		DisablePlayerVehicleRewards(id)	
	end
end)

RegisterCommand("shuff", function(source, args, raw) 
    SeatShuffle()
end, false)

RegisterCommand("duty", function(source, args, raw)
    TriggerServerEvent("komendaduty:onoff")
end, false)

RegisterCommand("clearnui", function()
	StopAudioScene("MP_LEADERBOARD_SCENE")
    SetNuiFocus(false, false)
	SendNUIMessage({type = 'close'})
end)

CreateThread(function ()
	while true do
		Wait(0)
		if IsPedArmed(playerPed, 6) then
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
		else
			Wait(500)
		end
	end
end)

local blockwheel = false


CreateThread(function() 
	while true do
		Citizen.Wait(500)
		for _, ped in ipairs(ESX.Game.GetPeds()) do
			SetPedDropsWeaponsWhenDead(ped, false)
		end
		inProperty = exports['esx_property']:isProperty()
		beltOn = exports['ocean_blackout']:pasyState()
		N_0xf4f2c0d4ee209e20()
		N_0x9e4cfff989258472()
		SetWeaponDrops()
		ClearAreaOfCops(playercoords.x, playercoords.y, playercoords.z, 400.0)
		blockwheel = exports['esx_ambulancejob']:IsBlockWeapon()
		if blockwheel then
			SetCurrentPedWeapon(playerPed, `WEAPON_UNARMED`, true)
		end
	end
end)

CreateThread(function()
	for i = 1, 15 do
		EnableDispatchService(i, false)
	end

	while true do
		Citizen.Wait(0)		
		if beltOn then
			DisableControlAction(0, 75)			
		end
		WaterOverrideSetStrength(0.5)
		SetPedDensityMultiplierThisFrame(0.99)
		SetScenarioPedDensityMultiplierThisFrame(0.99, 0.99)
		SetRandomVehicleDensityMultiplierThisFrame(0.04)
		SetParkedVehicleDensityMultiplierThisFrame(0.02)
		SetVehicleDensityMultiplierThisFrame(0.06)

		SetCreateRandomCops(false)
		SetCreateRandomCopsNotOnScenarios(false)
		SetCreateRandomCopsOnScenarios(false)
		SetGarbageTrucks(false)
		SetRandomBoats(false)

		if inProperty then
			ClearAreaOfPeds(playercoords.x, playercoords.y, playercoords.z, 10.0, 0)
		end

		AllowPauseMenuWhenDeadThisFrame()	
		for _, iter in ipairs({1, 2, 3, 4, 6, 7, 8, 9, 13, 17, 18,20,22}) do -- 6
			HideHudComponentThisFrame(iter)
		end
		DisableControlAction(1, 157)
		DisableControlAction(1, 158)
		DisableControlAction(1, 160)
		DisableControlAction(1, 164)
		DisableControlAction(1, 165)
		DisableControlAction(0, 37)
	end
end)

CreateThread(function()
    local SCENARIO_TYPES = {
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL", 
        "WORLD_VEHICLE_MILITARY_PLANES_BIG",
		"WORLD_VEHICLE_POLICE_BIKE",
		"WORLD_VEHICLE_POLICE_CAR",
		"WORLD_VEHICLE_POLICE",
		"WORLD_VEHICLE_POLICE_NEXT_TO_CAR",
		"WORLD_VEHICLE_AMBULANCE",
    }
    local SCENARIO_GROUPS = {
        2017590552, 
        2141866469, 
        1409640232, 
        "ng_planes", 
    }
    local SUPPRESSED_MODELS = {
        "SHAMAL", 
        "LUXOR", 
        "LUXOR2", 
        "JET", 
        "LAZER",
        "TITAN", 
        "BARRACKS",
        "BARRACKS2", 
        "CRUSADER", 
        "RHINO",
        "AIRTUG",
        "RIPLEY", 
        'FROGGER',
        'MAVERICK',
        'SWIFT',
        'SWIFT2',
    }

    while true do
        for _, sctyp in next, SCENARIO_TYPES do
            SetScenarioTypeEnabled(sctyp, false)
        end
        for _, scgrp in next, SCENARIO_GROUPS do
            SetScenarioGroupEnabled(scgrp, false)
        end
        for _, model in next, SUPPRESSED_MODELS do
            SetVehicleModelIsSuppressed(GetHashKey(model), true)
        end
        Citizen.Wait(10000)
    end
end)

local recoils = {
	[`WEAPON_STUNGUN`] = {0.1, 1.1}, -- STUN GUN
	[`WEAPON_STUNGUN_MP`] = {0.1, 1.1}, -- STUN GUN
	[`WEAPON_FLAREGUN`] = {0.9, 1.9}, -- FLARE GUN

	[`WEAPON_SNSPISTOL`] = {2.2, 3.2}, -- SNS PISTOL
	[`WEAPON_SNSPISTOL_MK2`] = {1.5, 2.4}, -- SNS PISTOL MK2
	[`WEAPON_NAVYREVOLVER`] = {1.5, 2.4}, -- SNS PISTOL MK2
	[`WEAPON_GADGETPISTOL`] = {1.5, 2.4}, -- SNS PISTOL MK2
	[`WEAPON_VINTAGEPISTOL`] = {1.8, 2.8}, -- VINTAGE PISTOL
	[`WEAPON_PISTOL`] = {2.2, 2.8}, -- PISTOL
	[`WEAPON_PISTOL_MK2`] = {2.2, 2.8}, -- PISTOL MK2
	[`WEAPON_DOUBLEACTION`] = {2.0, 2.5}, -- DOUBLE ACTION REVOLVER
	[`WEAPON_REVOLVER_MK2`] = {2.0, 2.5}, -- DOUBLE ACTION REVOLVER
	[`WEAPON_REVOLVER`] = {2.0, 2.5}, -- DOUBLE ACTION REVOLVER
	[`WEAPON_COMBATPISTOL`] = {2.0, 3.0}, -- COMBAT PISTOL
	[`WEAPON_HEAVYPISTOL`] = {0.5, 1.0}, -- HEAVY PISTOL
	[`WEAPON_PISTOL50`] = {2.9, 3.4}, -- 50 PISTOL
	[`WEAPON_CERAMICPISTOL`] = {1.5, 2.5}, -- Ceramicpistol

	[`WEAPON_DBSHOTGUN`] = {0.1, 0.6}, -- DOUBLE BARREL SHOTGUN
	[`WEAPON_SAWNOFFSHOTGUN`] = {2.1, 2.6}, -- SAWNOFF SHOTGUN
	[`WEAPON_PUMPSHOTGUN`] = {8.7, 10.2}, -- PUMP SHOTGUN
	[`WEAPON_PUMPSHOTGUN_MK2`] = {2.7, 3.2}, -- PUMP SHOTGUN MK2
	[`WEAPON_BULLPUPSHOTGUN`] = {1.5, 2.0}, -- BULLPUP SHOTGUN

	[`WEAPON_MICROSMG`] = {0.01, 0.05}, -- MICRO SMG (UZI)
	[`WEAPON_SMG`] = {0.01, 0.01}, -- SMG
	[`WEAPON_MINISMG`] = {0.05, 0.55}, -- MINISMG
	[`WEAPON_SMG_MK2`] = {0.001, 0.01}, -- SMG MK2
	[`WEAPON_ASSAULTSMG`] = {0.04, 0.54}, -- ASSAULT SMG
	[`WEAPON_COMBATPDW`] = {0.01, 0.02}, -- COMBAT PDW
	[`WEAPON_GUSENBERG`] = {0.075, 0.575}, -- GUSENBERG
	[`WEAPON_ASSAULTRIFLE_MK2`] = {0.075, 0.575}, -- GUSENBERG
	[`WEAPON_CARBINERIFLE_MK2`] = {0.075, 0.575}, -- GUSENBERG

	[`WEAPON_COMPACTRIFLE`] = {0.01, 0.03}, -- COMPACT RIFLE
	[`WEAPON_ASSAULTRIFLE`] = {0.1, 0.4}, -- ASSAULT RIFLE
	[`WEAPON_EMPLAUNCHER`] = {0.35, 0.75}, -- ASSAULT RIFLE
	[`WEAPON_HEAVYRIFLE`] = {0.40, 0.74}, -- ASSAULT RIFLE
	[`WEAPON_CARBINERIFLE`] = {0.40, 0.74}, -- CARBINE RIFLE

	[`WEAPON_MARKSMANRIFLE`] = {0.5, 1.0}, -- MARKSMAN RIFLE
	[`WEAPON_SNIPERRIFLE`] = {0.5, 1.0}, -- SNIPER RIFLE
}

local effects = {
	[`WEAPON_STUNGUN`] = {0.01, 0.02}, -- STUN GUN
	[`WEAPON_STUNGUN_MP`] = {0.01, 0.02}, -- STUN GUN
	[`WEAPON_FLAREGUN`] = {0.01, 0.02}, -- FLARE GUN

	[`WEAPON_SNSPISTOL`] = {0.08, 0.16}, -- SNS PISTOL
	[`WEAPON_SNSPISTOL_MK2`] = {0.07, 0.14}, -- SNS PISTOL MK2
	[`WEAPON_NAVYREVOLVER`] = {0.07, 0.14}, -- SNS PISTOL MK2
	[`WEAPON_GADGETPISTOL`] = {0.07, 0.14}, -- SNS PISTOL MK2
	[`WEAPON_VINTAGEPISTOL`] = {0.08, 0.16}, -- VINTAGE PISTOL
	[`WEAPON_PISTOL`] = {0.10, 0.20}, -- PISTOL
	[`WEAPON_PISTOL_MK2`] = {0.11, 0.22}, -- PISTOL MK2
	[`WEAPON_CERAMICPISTOL`] = {0.07, 0.14}, -- Ceramicpistol
	[`WEAPON_DOUBLEACTION`] = {0.1, 0.2}, -- DOUBLE ACTION REVOLVER
	[`WEAPON_REVOLVER_MK2`] = {0.1, 0.2}, -- DOUBLE ACTION REVOLVER
	[`WEAPON_REVOLVER`] = {0.1, 0.2}, -- DOUBLE ACTION REVOLVER
	[`WEAPON_COMBATPISTOL`] = {0.1, 0.2}, -- COMBAT PISTOL
	[`WEAPON_HEAVYPISTOL`] = {0.1, 0.2}, -- HEAVY PISTOL
	[`WEAPON_PISTOL50`] = {0.1, 0.2}, -- 50 PISTOL

	[`WEAPON_DBSHOTGUN`] = {0.1, 0.2}, -- DOUBLE BARREL SHOTGUN
	[`WEAPON_SAWNOFFSHOTGUN`] = {0.095, 0.19}, -- SAWNOFF SHOTGUN
	[`WEAPON_PUMPSHOTGUN`] = {0.09, 0.18}, -- PUMP SHOTGUN
	[`WEAPON_PUMPSHOTGUN_MK2`] = {0.09, 0.18}, -- PUMP SHOTGUN MK2
	[`WEAPON_BULLPUPSHOTGUN`] = {0.085, 0.19}, -- BULLPUP SHOTGUN

	[`WEAPON_MICROSMG`] = {0.05, 0.1}, -- MICRO SMG (UZI)
	[`WEAPON_SMG`] = {0.01, 0.1}, -- SMG
	[`WEAPON_MINISMG`] = {0.05, 0.08}, -- MINISMG
	[`WEAPON_SMG_MK2`] = {0.01, 0.01}, -- SMG MK2
	[`WEAPON_ASSAULTSMG`] = {0.035, 0.07}, -- ASSAULT SMG
	[`WEAPON_COMBATPDW`] = {0.01, 0.02}, -- COMBAT PDW
	[`WEAPON_GUSENBERG`] = {0.035, 0.07}, -- GUSENBERG
	[`WEAPON_ASSAULTRIFLE_MK2`] = {0.035, 0.07}, -- GUSENBERG

	[`WEAPON_COMPACTRIFLE`] = {0.03, 0.08}, -- COMPACT RIFLE
	[`WEAPON_ASSAULTRIFLE`] = {0.023, 0.064}, -- ASSAULT RIFLE
	[`WEAPON_EMPLAUNCHER`] = {0.023, 0.064}, -- ASSAULT RIFLE
	[`WEAPON_HEAVYRIFLE`] = {0.03, 0.06}, -- ASSAULT RIFLE
	[`WEAPON_CARBINERIFLE`] = {0.03, 0.06}, -- CARBINE RIFLE

	[`WEAPON_MARKSMANRIFLE`] = {0.025, 0.05}, -- MARKSMAN RIFLE
	[`WEAPON_SNIPERRIFLE`] = {0.025, 0.05}, -- SNIPER RIFLE	

	[`WEAPON_FIREWORK`] = {0.5, 1.0} -- FIREWORKS
}

local drugged = false
function DisableEffects()
	drugged = true
end

function EnableEffects()
	drugged = false
end

CreateThread(function()
	while true do
		Citizen.Wait(2)
		if DoesEntityExist(playerPed) and Config.FirstPersonShoot then
			if status == 1 then
				if weapon == `WEAPON_HEAVYSNIPER` or weapon == `WEAPON_SNIPERRIFLE` or weapon == `WEAPON_HEAVYSNIPER_MK2` then
					ShowHudComponentThisFrame(14)
				else
					HideHudComponentThisFrame(14)
				end
				if weapon == 'WEAPON_FIREEXTINGUISHER' then
					Citizen.InvokeNative(0x3EDCB0505123623B, playerPed, true, 'WEAPON_FIREEXTINGUISHER')
				elseif IsPedShooting(playerPed) then
					if can then							
						local recoil = recoils[weapon]
						if recoil and #recoil > 0 then
							local i, tv = (inVehicle and 2 or 1), 0
							if GetFollowPedCamViewMode() ~= 4 then
								repeat
									SetGameplayCamRelativePitch(GetGameplayCamRelativePitch() + 0.1, 0.2)
									tv = tv + 0.1
									Citizen.Wait(1)
								until tv >= recoil[i]
							else
								repeat
									local t = GetRandomFloatInRange(0.1, recoil[i])
									SetGameplayCamRelativePitch(GetGameplayCamRelativePitch() + t, (recoil[i] > 0.1 and 1.2 or 0.333))
									tv = tv + t
									Citizen.Wait(1)
								until tv >= recoil[i]
							end
						end
						if not drugged then	
							local effect = effects[weapon]
							if effect and #effect > 0 then
								ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', (inVehicle and (effect[1] * 3) or effect[2]))
							end
						end
					end
				end
			else
				Citizen.Wait(250)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

CreateThread(function()
	AddTextEntry('FE_THDR_GTAO', 'OceanRP WL OFF ~s~| ~b~ID: ' .. GetPlayerServerId(playerid))
	AddTextEntryByHash('BLIP_APARTCAT', 'Mieszkania')
	while true do
		Citizen.Wait(0)

		local show = false
		for _, model in ipairs(Config.DisplayCrosshair) do
			if weapon == GetHashKey(model) then
				show = true
				break
			end
		end
		if not show then
			local aiming, shooting = IsControlPressed(0,25), IsPedShooting(playerPed)
			if aiming or shooting then
				if shooting and not aiming then
					isShooting = true
					aimTimer = 0
				else
					isShooting = false
				end
				if not isAiming then
					isAiming = true

					lastCamera = GetFollowPedCamViewMode()
					if lastCamera ~= 4 and ESX.PlayerData.name ~= 'GigaaaaGrzesiu' then
						SetFollowPedCamViewMode(4)
					end
				elseif GetFollowPedCamViewMode() ~= 4 and ESX.PlayerData.name ~= 'GigaaaaGrzesiu' then
					SetFollowPedCamViewMode(4)
				end
			elseif isAiming then
				local off = true
				if isShooting then
					off = false

					aimTimer = aimTimer + 20
					if aimTimer == 3000 then
						isShooting = false
						aimTimer = 0
						off = true
					end
				end
				if off then
					isAiming = false
					if lastCamera ~= 4 and ESX.PlayerData.name ~= 'GigaaaaGrzesiu' then
						SetFollowPedCamViewMode(lastCamera)
					end
				end
			elseif not inVehicle then
				DisableControlAction(0, 24, true)
				DisableControlAction(0, 140, true)
				DisableControlAction(0, 141, true)
				DisableControlAction(0, 142, true)
				DisableControlAction(0, 257, true)
				DisableControlAction(0, 263, true)
				DisableControlAction(0, 264, true)
			end
		else
			Wait(500)
		end
	end
end)


local veh,vehFront, vehFrontProps,vehBehind, f, g, h, i, j, fmodel, fvspeed, fplate, bmodel, bvspeed, bplate

local radar = {
	shown = false,
	freeze = false,
	info = "~w~Radar gotowy do działania! Naciśnij [Num8] aby zamrozić",
	info2 = "~w~Radar gotowy do działania! Naciśnij [Num8] aby zamrozić",
	plate = "",
	model = "",
	plate2 = "",
	model2 = "",
}

function DrawAdvancedText(x, y, w, h, sc, text, r, g, b, a, font, jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
    N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - 0.1 + w, y - 0.02 + h)
end

function GetVehicleInDirection( entFrom, coordFrom, coordTo )
	local rayHandle = StartShapeTestCapsule( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 5.0, 10, entFrom, 7 )
	local _, _, _, _, vehicle = GetShapeTestResult( rayHandle )
	return vehicle
end

function Round( num, numDecimalPlaces )
	return tonumber( string.format( "%." .. ( numDecimalPlaces or 0 ) .. "f", num ) )
end

function GetEntityRelativeDirection( myAng, tarAng )
	local angleDiff = math.abs( ( myAng - tarAng + 180 ) % 360 - 180 )

	if ( angleDiff < 45 ) then
		return 1
	elseif ( angleDiff > 135 ) then
		return 2
	end

	return 0
end

Citizen.CreateThread(function()
	print("Running...")
	while true do
		Citizen.Wait(100)
		if radar.shown then

			local playerPed = GetPlayerPed(PlayerId())
			local playerVeh = GetVehiclePedIsIn(playerPed, false)

			local vCoords = GetEntityCoords(playerPed)
			
			local startFront = GetOffsetFromEntityInWorldCoords( playerVeh, 0.0, ( 5.0 * 1 ), 0.0 )
			local offsetFront = GetOffsetFromEntityInWorldCoords( playerVeh, -2.5, ( 50.0 * 1 ), 0.0 )
			local startBehind = GetOffsetFromEntityInWorldCoords( playerVeh, 0.0, ( 5.0 * -1 ), 0.0 )
			local offsetBehind = GetOffsetFromEntityInWorldCoords( playerVeh, -2.5, ( 50.0 * -1 ), 0.0 )
			

			local targetVehFront = GetVehicleInDirection(playerVeh, startFront, offsetFront)
			local targetVehBehind = GetVehicleInDirection(playerVeh, startBehind, offsetBehind)

			if DoesEntityExist(targetVehFront) and IsEntityAVehicle(targetVehFront) and GetIsVehicleEngineRunning(targetVehFront) then
				local pHeading = Round(GetEntityHeading(playerVeh), 0)
				local tHeading = Round(GetEntityHeading(targetVehFront), 0)

				local dir = GetEntityRelativeDirection(pHeading, tHeading)
				if(dir > 0) then
					vehFront = targetVehFront
					vehFrontProps = ESX.Game.GetVehicleProperties(targetVehFront)
				end
			end
			if DoesEntityExist(targetVehBehind) and IsEntityAVehicle(targetVehBehind) and GetIsVehicleEngineRunning(targetVehBehind) then
				local pHeading = Round(GetEntityHeading(playerVeh), 0)
				local tHeading = Round(GetEntityHeading(targetVehBehind), 0)

				local dir = GetEntityRelativeDirection(pHeading, tHeading)
				if(dir > 0) then
					vehBehind = targetVehBehind
				end
			end
		else
			Wait(1000)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(3)
		sleep = true
		if radar.shown then
			sleep = false
			if radar.freeze then
				DrawAdvancedText(0.591, 0.833, 0.005, 0.0028, 0.40, "~y~Zatrzymano radar", 0, 191, 255, 255, 6, 0)
			end
			if not radar.freeze then
				if IsEntityAVehicle(vehFront) then
					radar.plate = GetVehicleNumberPlateText(vehFront)
					radar.model = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehFront)))
					radar.info = string.format("~y~Rejestracja: ~w~%s  ~y~Pojazd: ~w~%s  ~y~Prędkość: ~w~%s km/h", radar.plate, radar.model, math.floor(GetEntitySpeed(vehFront) * 3.6 + 0.5))
				end

				if IsEntityAVehicle(vehBehind) then
					radar.plate2 = GetVehicleNumberPlateText(vehBehind)
					radar.model2 = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehBehind)))
					radar.info2 = string.format("~y~Rejestracja: ~w~%s  ~y~Pojazd: ~w~%s  ~y~Prędkość: ~w~%s km/h", radar.plate2, radar.model2, math.floor(GetEntitySpeed(vehBehind) * 3.6 + 0.5))		
				end
			end

			DrawAdvancedText(0.602, 0.903, 0.005, 0.0028, 0.4, "~b~RADAR - Front ([Num4] aby sprawdzić bazę)", 0, 153, 0, 255, 6, 0)
			DrawAdvancedText(0.602, 0.953, 0.005, 0.0028, 0.4, "~b~RADAR - Tył ([Num6] aby sprawdzić bazę)", 0, 153, 0, 255, 6, 0)
			DrawAdvancedText(0.602, 0.928, 0.005, 0.0028, 0.4, radar.info, 255, 255, 255, 255, 6, 0)
			DrawAdvancedText(0.602, 0.979, 0.005, 0.0028, 0.4, radar.info2, 255, 255, 255, 255, 6, 0)
		end

		if not IsPedInAnyVehicle(PlayerPedId()) then
			radar.shown = false
			radar.freeze = false
			radar.model = nil
			radar.model2 = nil
			radar.plate = nil
			radar.plate2 = nil
		end
		if sleep then 
			Wait(500) 
		end
	end
end)

RegisterCommand("-radarSASP", function(source, args)
	if (IsPedInAnyPoliceVehicle(playerPed) or (IsVehicleModel(GetVehiclePedIsIn(playerPed, false), 'police65')) and not IsPedInAnyHeli(playerPed)) then
		if PlayerData == nil then
			PlayerData = ESX.PlayerData
		end
		if PlayerData.job ~= nil and (PlayerData.job.name == 'police' or PlayerData.job.name == 'sheriff') then
			radar.shown = not radar.shown
		end
	end
end, false)

RegisterCommand("-radarSASP2", function(source, args)
	if (IsPedInAnyPoliceVehicle(playerPed) or (IsVehicleModel(GetVehiclePedIsIn(playerPed, false), `police65`)) and not IsPedInAnyHeli(playerPed)) then
		if PlayerData.job ~= nil and (PlayerData.job.name == 'police' or PlayerData.job.name == 'sheriff') then
			radar.freeze = not radar.freeze
		end
	end
end, false)

RegisterKeyMapping("-radarSASP", "Radar policyjny", "keyboard", "NUMPAD5")
RegisterKeyMapping("-radarSASP2", "Zatrzymaj radar", "keyboard", "NUMPAD8")

RegisterCommand("-blachaSASP", function(source, args)
	if PlayerData.job ~= nil and (PlayerData.job.name == 'police' or PlayerData.job.name == 'sheriff') then
		if (IsPedInAnyPoliceVehicle(playerPed) or (IsVehicleModel(GetVehiclePedIsIn(playerPed, false), `police65`)) and not IsPedInAnyHeli(playerPed)) and radar.shown then
			if radar.plate then
				TriggerEvent('esx_sprawdz:blachy', radar.plate:gsub("%s$", ""), radar.model)
			else
				ESX.ShowNotification('Brak rejestracji pojazdu z przodu')
			end
		end
	end
end, false)

RegisterCommand("-blachaSASP2", function(source, args)
	if PlayerData.job ~= nil and (PlayerData.job.name == 'police' or PlayerData.job.name == 'sheriff') then
		if (IsPedInAnyPoliceVehicle(playerPed) or (IsVehicleModel(vehicle, `police65`))) and not IsPedInAnyHeli(playerPed) and radar.shown then
			if radar.plate2 then
				TriggerEvent('esx_sprawdz:blachy', radar.plate2:gsub("%s$", ""), radar.model2)
			else
				ESX.ShowNotification('Brak rejestracji pojazdu z tyłu')
			end
		end
	end
end, false)

RegisterKeyMapping("-blachaSASP", "Sprawdź blache [FRONT]", "keyboard", "NUMPAD4")
RegisterKeyMapping("-blachaSASP2", "Sprawdź blache [TYŁ]", "keyboard", "NUMPAD6")



RegisterNetEvent('esx_sprawdz:blachy')
AddEventHandler('esx_sprawdz:blachy', function(plate, model)
	ESX.ShowAdvancedNotification('OceanRP', plate, '~y~Pojazd: ~s~'..model..'\n~y~Właściciel: ~s~Wyszukiwanie')
	Wait(2000)

	ESX.TriggerServerCallback('esx_misiaczek:getVehicleFromPlate', function(data)
		CreateThread(function()			
			local poszukiwany = '~r~Nie'
			if data.poszukiwany then
				PlaySound(-1, "TIMER_STOP", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
				poszukiwany = '~g~Tak'
			end
			
		
			local str = "Data urodzenia: ~y~"..data.dob.."~s~\n"
			str = str .. "Wzrost: ~y~"..data.height .. "~s~\n"
			str = str .. "Płeć: ~y~" ..data.sex

			TriggerEvent("FeedM:showAdvancedNotification", data.owner, '~s~Poszukiwany: ' ..poszukiwany, str, 'CHAR_BANK_MAZE', 10000)
		end)
		
	end, plate)
end)

CreateThread(function()
	while true do
		Citizen.Wait(60000)
		
		ESX.TriggerServerCallback("esx_scoreboard:getConnectedCops", function(MisiaczekPlayers)
			if MisiaczekPlayers then
				SetDiscordAppId(1044577604583305306)

				SetDiscordRichPresenceAsset('oceanrp')
				name = GetPlayerName(playerid)
				id = GetPlayerServerId(playerid)
				SetDiscordRichPresenceAssetText("ID: "..id.." | "..name.." ")
				SetRichPresence("ID: "..id.." | "..name.." | "..MisiaczekPlayers['players'].."/"..MisiaczekPlayers['maxPlayers'])
				SetDiscordRichPresenceAction(1, "Discord!", "https://discord.gg/CgRSDypCEp")
				SetDiscordRichPresenceAction(0, "Zagraj z nami!", "cfx.re/join/6dpl6j")
			end
		end)
	end
end)

function SetWeaponDrops()
	local handle, ped = FindFirstPed()
	local finished = false

	repeat
		if not IsEntityDead(ped) then
			SetPedDropsWeaponsWhenDead(ped, false)
		end
		finished, ped = FindNextPed(handle)
	until not finished

	EndFindPed(handle)
end

AddEventHandler('skinchanger:modelLoaded', function()
	ModelLoaded()
end)

AddEventHandler('misiaczek:newplayer', function()
	newPlayer = true
	ModelLoaded()
end)

function ModelLoaded()
	if loadingPosition ~= true and loadingStatus < 2 then
		print('[OceanRP]: Załadowano model')
		CreateThread(function()
			while not loadingPosition do
				Citizen.Wait(10)
			end
			
			Citizen.Wait(1000)
			loadingStatus = 2
			SendLoadingScreenMessage(json.encode({allow = true}))
		end)
	end
end

CreateThread(function()
	SetManualShutdownLoadingScreenNui(false)
	StartAudioScene("MP_LEADERBOARD_SCENE")
	SendLoadingScreenMessage(json.encode({ready = true}))

	TriggerEvent('chat:display', false)
	while true do
		Citizen.Wait(10)
		if loadingStatus == 2 and (IsControlJustPressed(0, 18) or IsDisabledControlPressed(0, 18)) then
			StartWyspa()
			print('[OceanRP]: Wczytano')
			break
		end
	end
end)

RegisterCommand('play', function(source, args, raw)
	if loadingStatus == 2 then
		CreateThread(StartWyspa)
	end
end, false)

function StartRegister(ped)
	NetworkSetPlayerIsPassive(true)
	SetCanAttackFriendly(ped, false, false)
	DecorSetBool(ped, "Register", true)
	Citizen.InvokeNative(0x239528EACDC3E7DE, playerid, true)
end

function FinishRegister()
	NetworkSetPlayerIsPassive(false)
	SetCanAttackFriendly(playerPed, true, false)

	DecorRemove(playerPed, "Register")

	NetworkSetFriendlyFireOption(true)
	Citizen.InvokeNative(0x239528EACDC3E7DE, playerid, false)
end

local isinintroduction = false
local introstep = 0

RegisterCommand('trailer', function()
	startTrailer(true)
end)

function startTrailer(allow)
	local introcam
	local coords = playercoords
	SetEntityVisible(playerPed, false, 0)
	FreezeEntityPosition(playerPed, true)
	SetFocusEntity(playerPed)
	Citizen.Wait(1)
	BeginSrl()
	introstep = 9
	isinintroduction = true
	Citizen.Wait(1)
	DoScreenFadeIn(500)
	Citizen.Wait(100)
	PrepareMusicEvent("MP_MC_START")
	TriggerMusicEvent("MP_MC_START")
	NetworkOverrideClockTime(20,  10,  00)
	TriggerEvent('chat:clear')
	TriggerEvent('exilerp:csskroublesmiec')
	DoScreenFadeOut(800)
	Wait(1800)
	DoScreenFadeIn(2500)
	while true do
		Wait(0)
		DisableControlAction(0, 249, true)
		NetworkSetTalkerProximity(0.0)
		if introstep == 1 then
			SendNUIMessage({transactionType = 'showTitle', txtTitle = 'Dev-Team OceanRP'})
			introcam = CreateCam("DEFAULT_SCRIPTED_CAMERA", false)
			SetCamActive(introcam, true)
			SetFocusArea(-399.2823, 1301.6515, 409.57, 0.0, 0.0, 0.0)
			SetCamParams(introcam, -399.2823, 1301.6515, 409.57, -10.0, 50.0, 200.3524, 42.2442, 0, 1, 1, 2)
			SetCamParams(introcam, -481.4334, 945.07, 308.17, 0.0, 0.0, 200.8659, 44.8314, 6000, 0, 0, 2)
			ShakeCam(introcam, "HAND_SHAKE", 0.15)
			RenderScriptCams(true, false, 3000, 1, 1)
			timer = GetNetworkTime() + 5000
			introstep = 1.5
		elseif introstep == 1.5 then
			Wait(800)
			while GetNetworkTime() < timer do
				Wait(0)
			end
			introstep = 2
		elseif introstep == 2 then
			DoScreenFadeOut(800)
			Wait(800)
			DoScreenFadeIn(800)
			SetFocusArea(-2195.572, -661.93, 11.49, 0.0, 0.0, 0.0)
			SetCamParams(introcam, -2195.572, -661.93, 11.49, 1.6106, 0.5186, 18.58, 45.0069, 0, 1, 1, 2)
			SetCamParams(introcam, -2452.572, -721.93, 34.49, 2.8529, 0.5186, 90.58, 70.0069, 7000, 0, 0, 2)
			ShakeCam(introcam, "HAND_SHAKE", 0.15)
			RenderScriptCams(true, false, 3000, 1, 1)
			timer = GetNetworkTime() + 5000
			introstep = 2.5
			SendNUIMessage({transactionType = 'showTitle', txtTitle = 'prezentuje'})
		elseif introstep == 2.5 then
			Wait(800)
			while GetNetworkTime() < timer do
				Wait(0)
			end
			introstep = 3
		elseif introstep == 3 then
			DoScreenFadeOut(800)
			Wait(800)
			NetworkOverrideClockTime(23,  10,  00)
			SetFocusArea(176.29, -659.53, 108.59, 0.0, 0.0, 0.0)
			
			Wait(320)
			DoScreenFadeIn(800)
			-- SetCamParams(introcam, -233.32, -2101.08, 34.59, 1.6106, 0.5186, 18.58, 45.0069, 0, 1, 1, 2)
			-- SetCamParams(introcam, -188.94, -2036.98, 34.57, 2.8529, 0.5186, 90.58, 70.0069, 7000, 0, 0, 2)
			SetCamParams(introcam, 176.29, -659.53, 108.59, -20.6106, 0.5186, 200.58, 45.0069, 0, 1, 1, 2)
			SetCamParams(introcam, 152.17, -1031.88, 28.57, -10.8529, 0.5186, 150.58, 70.0069, 7000, 0, 0, 2)
			RenderScriptCams(true, false, 3000, 1, 1)
			timer = GetNetworkTime() + 6000
			SendNUIMessage({transactionType = 'showLabel', txtLabel = "Miejsce spotkań"})
			introstep = 3.5
		elseif introstep == 3.5 then
			Wait(800)
			while GetNetworkTime() < timer do
				Wait(0)
			end
			SendNUIMessage({transactionType = 'hideLabel'})
			introstep = 4
		elseif introstep == 4 then
			DoScreenFadeOut(800)
			Wait(800)
			NetworkOverrideClockTime(20,  10,  00)
			SetFocusArea(-876.737, -1199.3153, 16.6188, 0.0, 0.0, 0.0)
			
			Wait(320)
			DoScreenFadeIn(800)
			SetCamParams(introcam, -876.737, -1199.3153, 16.6188, 0.7142, 0.3156, -105.7306, 40.033, 0, 1, 1, 2)
			SetCamParams(introcam, -838.899, -1204.4563, 7.1000, 0.9614, 0.5214, -140.7306, 40.033, 6000, 0, 0, 2)
			RenderScriptCams(true, false, 3000, 1, 1)
			timer = GetNetworkTime() + 5000
			SendNUIMessage({transactionType = 'showLabel', txtLabel = "Pełne ciekawych ludzi"})
			introstep = 4.5
		elseif introstep == 4.5 then
			Wait(800)
			while GetNetworkTime() < timer do
				Wait(0)
			end
			SendNUIMessage({transactionType = 'hideLabel'})
			introstep = 5
		elseif introstep == 5 then
			DoScreenFadeOut(800)
			Wait(800)
			SetEntityCoordsNoOffset(playerPed, -64.63, -790.4, 44.64, false, false, false, true)
			SetFocusArea(403.95, -981.39, 47.58, 0.0, 0.0, 0.0)
			
			Wait(320)
			DoScreenFadeIn(800)
			SetCamParams(introcam, 403.95, -981.39, 47.58, -50.7142, 0.3156, 240.607, 20.033, 0, 1, 1, 2)
			--SetCamParams(introcam, 418.08, -980.62, 32.58, 32.9614, 0.5214, 69.60, 40.033, 10000, 0, 0, 2)
			SetCamParams(introcam, 437.617, -981.91, 30.58, 15.9614, 0.5214, 270.60, 40.033, 6000, 0, 0, 2)
			RenderScriptCams(true, false, 3000, 1, 1)
			timer = GetNetworkTime() + 5000
			SendNUIMessage({transactionType = 'showLabel', txtLabel = "Innowacyjnych skryptów i rozwiązań"})
			introstep = 5.5
		elseif introstep == 5.5 then
			Wait(800)
			while GetNetworkTime() < timer do
				Wait(0)
			end
			SendNUIMessage({transactionType = 'hideLabel'})
			introstep = 6
		elseif introstep == 6 then
			DoScreenFadeOut(800)
			Wait(800)
			SetFocusArea(173.16, -946.22, 30.57, 0.0, 0.0, 0.0)
			
			Wait(320)
			DoScreenFadeIn(800)
			SetCamParams(introcam, 173.16, -946.22, 30.57, 0.7142, 0.3156, 270.595, 20.033, 0, 1, 1, 2)
			SetCamParams(introcam, 167.48, -974.4, 33.95, -2.9614, 0.5214, 258.59, 70.033, 10000, 0, 0, 2)
			RenderScriptCams(true, false, 3000, 1, 1)
			timer = GetNetworkTime() + 9000
			SendNUIMessage({transactionType = 'showLabel', txtLabel = "Dobrego poziomu"})
			introstep = 6.5
		elseif introstep == 6.5 then
			Wait(800)
			while GetNetworkTime() < timer do
				Wait(0)
			end
			SendNUIMessage({transactionType = 'hideLabel'})
			introstep = 7
		elseif introstep == 7 then
			DoScreenFadeOut(800)
			Wait(800)
			SetFocusArea(1123.93, -710.21, 55.19627, 0.0, 0.0, 0.0)
			
			Wait(320)
			DoScreenFadeIn(800)
			SetCamParams(introcam, 1123.93, -710.21, 56.19627, -5.7142, 0.3156, -170.7306, 60.033, 0, 1, 1, 2)
			SetCamParams(introcam, 1092.09, -634.21, 56.19627, -5.9614, 0.5214, -240.7306, 60.033, 7000, 0, 0, 2)
			RenderScriptCams(true, false, 3000, 1, 1)
			timer = GetNetworkTime() + 6000
			SendNUIMessage({transactionType = 'showLabel', txtLabel = "I dobrej zabawy"})
			introstep = 7.5
		elseif introstep == 7.5 then
			Wait(800)
			while GetNetworkTime() < timer do
				Wait(0)
			end
			SendNUIMessage({transactionType = 'hideLabel'})
			introstep = 8
		elseif introstep == 8 then
			DoScreenFadeOut(800)
			Wait(800)
			SetFocusArea(1542.44, 3890.90, 44.887, 0.0, 0.0, 0.0)
			Wait(320)
			DoScreenFadeIn(800)
			SetCamParams(introcam, 1542.44, 3890.90, 44.887, -1.6106, 0.5186, 150.3786, 45.0069, 0, 1, 1, 2)
			SetCamParams(introcam, 1476.52, 3879.90, 31.887, -2.8529, 0.5186, 80.8262, 45.0069, 10100, 0, 0, 2)
			RenderScriptCams(true, false, 3000, 1, 1)
			timer = GetNetworkTime() + 9100
			Wait(3500)
			SendNUIMessage({transactionType = 'showTitle', txtTitle = 'coś nowego i świeżego'})
			introstep = 8.5
		elseif introstep == 8.5 then
			Wait(800)
			while GetNetworkTime() < timer do
				Wait(0)
			end
			introstep = 9
		elseif introstep == 9 then
			DoScreenFadeOut(800)
			Wait(800)
			SetFocusArea(-4.6668, -900.9736, 184.887, 0.0, 0.0, 0.0)
			Wait(320)
			DoScreenFadeIn(800)
			SetCamParams(introcam, -4.6668, -900.9736, 184.887, -1.6106, -0.5186, 78.3786, 45.0069, 0, 1, 1, 2)
			SetCamParams(introcam, -23.0087, -896.4288, 184.1939, -2.8529, -0.5186, 81.8262, 45.0069, 18000, 0, 0, 2)
			RenderScriptCams(true, false, 3000, 1, 1)
			timer = GetNetworkTime() + 17000
			
			TriggerEvent('esx_exileschool:reloadLicense')

			local coords = playercoords
			DoScreenFadeOut(800)
			Wait(800)
			SetEntityCoordsNoOffset(playerPed, coords, false, false, false, true)
			FreezeEntityPosition(playerPed, true)
			SetEntityVisible(playerPed, true, 0)
			FreezeEntityPosition(playerPed, false)
			SendNUIMessage({transactionType = 'stopVideo'})
			DestroyCam(createdCamera, 0)
			DestroyCam(createdCamera, 0)
			RenderScriptCams(0, 0, 1, 1, 1)
			createdCamera = 0
			ClearTimecycleModifier("scanline_cam_cheap")
			SetFocusEntity(GetPlayerPed(playerid))    
			Citizen.Wait(1000)
			Wait(320)
			DoScreenFadeIn(800)
			SendNUIMessage({transactionType = 'stopSoundTrailer'})
			TriggerEvent('exilerp:csskroublesmiec')
			local number = math.random(1,4)
			CancelMusicEvent("MP_MC_START")
			if number == 1 then
				SetEntityCoords(playerPed, -1038.25, -2738.67, 20.16, 0.0, 0.0, 0.0, 0.0)
				SetEntityHeading(playerPed, 93.5)
			elseif number == 2 then
				SetEntityCoords(playerPed, -1038.25, -2738.67, 20.16, 0.0, 0.0, 0.0, 0.0)
				SetEntityHeading(playerPed, 172.33)	
			elseif number == 3 then
				SetEntityCoords(playerPed, -1038.25, -2738.67, 20.16, 0.0, 0.0, 0.0, 0.0)
				SetEntityHeading(playerPed, 87.5)	
			elseif number == 4 then
				SetEntityCoords(playerPed, -1038.25, -2738.67, 20.16, 0.0, 0.0, 0.0, 0.0)
				SetEntityHeading(playerPed, 82.8)	
			end
			EnableControlAction(0, 249, true)
			NetworkSetTalkerProximity(3.5)
			ESX.Scaleform.ShowFreemodeMessage('~o~Kreator', 'Ustaw się w dogodnym miejscu, za 30 sekund uruchomi się menu tworzenia postaci.', 10)
			Wait(200)
			ESX.Scaleform.ShowFreemodeMessage('~o~Kreator', 'Ustaw się w dogodnym miejscu, za 20 sekund uruchomi się menu tworzenia postaci.', 10)
			Wait(200)
			ESX.Scaleform.ShowFreemodeMessage('~o~Kreator', 'Ustaw się w dogodnym miejscu, za 10 sekund uruchomi się menu tworzenia postaci.', 10)
			Wait(200)
			TriggerEvent('esx_skin:openSaveableMenu')
			break
		end
	end
end

local displayStreet = true


function DisplayingStreet()
	return displayStreet
end

AddEventHandler('ExileRP:setDisplayStreet', function(val)
	displayStreet = val
end)


function StartWyspa()
	TriggerEvent('esx_status:startStrataTask')
	Citizen.InvokeNative(0xABA17D7CE615ADBF, "FMMC_STARTTRAN")
	Citizen.InvokeNative(0xBD12F8228410D9B4, 4)
	PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

	SetEntityCoords(playerPed, loadingPosition.x, loadingPosition.y, loadingPosition.z)
	FreezeEntityPosition(playerPed, false)

	Citizen.InvokeNative(0xEA1C610A04DB6BBB, playerPed, true)
	Citizen.InvokeNative(0x239528EACDC3E7DE, playerid, false)
	StopAudioScene("MP_LEADERBOARD_SCENE")

	DoScreenFadeOut(0)	
	ShutdownLoadingScreen()
	ShutdownLoadingScreenNui()

	SetPedMaxHealth(playerPed, 200)
	Citizen.InvokeNative(0x6B76DC1F3AE6E6A3, playerPed, 200)

	loadingPosition = true
	loadingStatus = 3
	Citizen.Wait(1000)

	DoScreenFadeIn(1000)
	while IsScreenFadingIn() do
		Citizen.Wait(10)
	end

	Citizen.Wait(2000)

	ESX.UI.HUD.SetDisplay(1.0)
	
	TriggerEvent('chat:clear')
	TriggerEvent('wybranopostac', true)
	TriggerEvent('route68:kino_state', false)
	Citizen.InvokeNative(0x10D373323E5B9C0D)
	
	if newPlayer then
		TriggerEvent('skinchanger:loadDefaultModel', function()
			TriggerEvent('esx_skin:openSaveableRestrictedMenuCreate', FinishRegister, FinishRegister, {
			'sex',
			'skin',
			'skin_2',
			'blend_skin',
			'face',
			'face_2',
			'blend_face',
			'skin_3',
			'face_3',
			'blend',
			'eye_color',
			'nose_1',
			'nose_2',
			'nose_3',
			'nose_4',
			'nose_5',
			'nose_6',
			'eyebrow_1',
			'eyebrow_2',
			'cheeks_1',
			'cheeks_2',
			'cheeks_3',
			'lips',
			'jaw_1',
			'jaw_2',
			'chimp_1',
			'chimp_2',
			'chimp_3',
			'chimp_4',
			'neck',
			'age_1',
			'age_2',
			'sun_1',
			'sun_2',
			'moles_1',
			'moles_2',
			'complexion_1',
			'complexion_2',
			'blemishes_1',
			'blemishes_2',
			'hair_1',
			'hair_2',
			'hair_3',
			'hair_color_1',
			'hair_color_2',
			'eyebrows_1',
			'eyebrows_2',
			'eyebrows_3',
			'eyebrows_4',
			'makeup_1',
			'makeup_2',
			'makeup_3',
			'makeup_4',
			'blush_1',
			'blush_2',
			'blush_3',
			'lipstick_1',
			'lipstick_2',
			'lipstick_3',
			'lipstick_4',
			'beard_1',
			'beard_2',
			'beard_3',
			'beard_4',
			'chest_1',
			'chest_2',
			'chest_3',
			'bodyb_1',
			'bodyb_2',
			'tshirt_1',
			'tshirt_2',
			'torso_1',
			'torso_2',
			'decals_1',
			'decals_2',
			'arms',
			'arms_2',
			'pants_1',
			'pants_2',
			'shoes_1',
			'shoes_2',
			'chain_1',
			'chain_2',
			'helmet_1',
			'helmet_2',
			'bags_1',
			'bags_2'
			})
		end)
		startTrailer(allow)
		Citizen.Wait(500)
	end
	TriggerEvent("exilerp:connected")
	TriggerServerEvent('cookierp:checkVIP')
	TriggerEvent('cayo_perico:load')
end

AddEventHandler('misiaczek:load', function(cb)
	cb(loadingStatus)
end)

function _DrawText(x, y, width, height, scale, text, r, g, b, a)
	SetTextFont(4)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()

	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - width / 2, y - height / 2 + 0.005)
end


CreateThread(function()
	while true do
		SetBlackout(blackout)
		if lastWeather ~= currentWeather then
			lastWeather = currentWeather
			SetWeatherTypeOverTime(currentWeather, 30.0)
			Citizen.Wait(30000)
		end

		Citizen.Wait(200)
		ClearOverrideWeather()
		ClearWeatherTypePersist()

		SetWeatherTypePersist(lastWeather)
		SetWeatherTypeNow(lastWeather)
		SetWeatherTypeNowPersist(lastWeather)

		if lastWeather == 'XMAS' then
			SetForceVehicleTrails(true)
			SetForcePedFootstepsTracks(true)
		else
			SetForceVehicleTrails(false)
			SetForcePedFootstepsTracks(false)
		end
	end
end)

RegisterNetEvent('misiaczek:updateWeather')
AddEventHandler('misiaczek:updateWeather', function(_weather, _blackout)
	currentWeather = _weather
	blackout = _blackout
end)

RegisterNetEvent('misiaczek:updateTime')
AddEventHandler('misiaczek:updateTime', function(base, offest, freeze)
	freezeTime = freeze
	timeOffset = offest
	baseTime = base
end)

CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		if inVehicle then
			SetPedHelmet(playerPed, false)
			DisablePlayerVehicleRewards(playerid)
			if DisableShuffle then					
				if GetPedInVehicleSeat(vehicle, 0) == playerPed and GetIsTaskActive(playerPed, 165) then
					SetPedIntoVehicle(playerPed, vehicle, 0)
				end
			else
				Wait(250)
			end
		else
			Wait(500)
		end
	end
end)

CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/weather', 'Zmień pogode.', {{ name="Pogoda", help="Dostępne: extrasunny, clear, neutral, smog, foggy, overcast, clouds, clearing, rain, thunder, snow, blizzard, snowlight, xmas & halloween"}})
    TriggerEvent('chat:addSuggestion', '/freezeweather', 'Zamroź/odmroź opcje Dynamic Weather.')
    TriggerEvent('chat:addSuggestion', '/blackout', 'Zmień tryb blackout.')
	StatSetProfileSetting(226, 0)	
	for key, value in pairs(Config.Visuals) do
		SetVisualSettingFloat(key, value)
	end
	while not Citizen.InvokeNative(0xB8DFD30D6973E135, playerid) do
		Citizen.Wait(100)
	end
	
	TriggerServerEvent('misiaczek:playerConnected')
end)

local time = 7000
CreateThread(function()
	local pausing = false
	while true do
		Citizen.Wait(200)
		if IsPedBeingStunned(playerPed) then
			SetPedMinGroundTimeForStungun(playerPed, 6000)
		end
		local status, weapon = GetCurrentPedWeapon(playerPed, true)
		if status == 1 then

			local mul = Config.Weapons[weapon]
			if mul then
				SetPlayerWeaponDamageModifier(playerid, mul)
			else
				mul = Config.Melees[weapon]
				if mul then
					SetPlayerMeleeWeaponDamageModifier(playerid, mul)
				else
					SetPlayerWeaponDamageModifier(playerid, 1.0)
					SetPlayerMeleeWeaponDamageModifier(playerid, 1.0)
				end
			end
		else
			SetPlayerMeleeWeaponDamageModifier(playerid, Config.Melees[`WEAPON_UNARMED`])
		end
	end
end)

function weather()
    CreateThread(function()
        while true do
            SetWeatherTypePersist("HALLOWEEN")
            SetWeatherTypeNowPersist("HALLOWEEN")
            SetWeatherTypeNow("HALLOWEEN")
            SetOverrideWeather("HALLOWEEN")
            Citizen.Wait(100)
        end
    end)
end
local vehicleRollThresh = 60
local vehicleClassDisable = {
    [0] = true,     --compacts
    [1] = true,     --sedans
    [2] = true,     --SUV's
    [3] = true,     --coupes
    [4] = true,     --muscle
    [5] = true,     --sport classic
    [6] = true,     --sport
    [7] = true,     --super
    [8] = false,    --motorcycle
    [9] = true,     --offroad
    [10] = true,    --industrial
    [11] = true,    --utility
    [12] = true,    --vans
    [13] = false,   --bicycles
    [14] = false,   --boats
    [15] = false,   --helicopter
    [16] = false,   --plane
    [17] = true,    --service
    [18] = true,    --emergency
    [19] = false    --military
}

CreateThread(function()
    while true do
        Citizen.Wait(10)
        local vehicleClass = GetVehicleClass(vehicle)
        if ((GetPedInVehicleSeat(vehicle, -1) == playerPed) and vehicleClassDisable[vehicleClass]) then
			if not IsEntityInAir(vehicle) then
				local vehicleRoll = GetEntityRoll(vehicle)
				if (math.abs(vehicleRoll) > vehicleRollThresh) then
					DisableControlAction(2, 59)
					DisableControlAction(2, 60)
				end
			else
				Wait(200)
            end
        else
            Wait(500)
        end
    end
end)

local blackBars = false
RegisterNetEvent('route68:kino_state')
AddEventHandler('route68:kino_state', function(rodzaj)
	if rodzaj then
		blackBars = true
		ESX.UI.HUD.SetDisplay(0.0)
		TriggerEvent('chat:toggleChat', true)
		TriggerServerEvent('misiaczek:kino', true)
		TriggerEvent('hungerthirst:hud_state', true)
		TriggerEvent('bodycam:state', true)
		TriggerEvent('esx_status:setDisplay', 0.0)
		TriggerEvent('esx_voice:setDisplay', 0.0)
		TriggerEvent('radar:setHidden', true)
		TriggerEvent('carhud:display', false)
		TriggerEvent('esx_customui:toggle', false)
		TriggerEvent('misiaczek_dzwon:display', false)
	elseif rodzaj == false then
		blackBars = false
		ESX.UI.HUD.SetDisplay(1.0)
		TriggerEvent('chat:toggleChat', false)
		TriggerEvent('hungerthirst:hud_state', false)
		TriggerEvent('bodycam:state', false)
		TriggerEvent('esx_status:setDisplay', 1.0)
		TriggerEvent('esx_voice:setDisplay', 1)
		TriggerEvent('radar:setHidden', false)
		TriggerEvent('carhud:display', true)
		TriggerEvent('misiaczek_dzwon:display', true)
		TriggerEvent('esx_customui:toggle', true)
	end
end)

RegisterNetEvent('route68:kino')
AddEventHandler('route68:kino', function()
	cam = not cam
	
	if cam then
		blackBars = true
		ESX.UI.HUD.SetDisplay(0.0)
		TriggerEvent('chat:toggleChat', true)
		TriggerServerEvent('misiaczek:kino', true)
		TriggerEvent('hungerthirst:hud_state', true)
		TriggerEvent('bodycam:state', true)
		TriggerEvent('esx_status:setDisplay', 0.0)
		TriggerEvent('radar:setHidden', true)
		TriggerEvent('carhud:display', false)
		TriggerEvent('exile:pasy', false)
		TriggerEvent('esx_customui:toggle', false)
	elseif not cam then
		blackBars = false
		ESX.UI.HUD.SetDisplay(1.0)
		TriggerEvent('chat:toggleChat', false)
		TriggerEvent('hungerthirst:hud_state', false)
		TriggerEvent('bodycam:state', false)
		TriggerEvent('esx_status:setDisplay', 1.0)
		TriggerEvent('radar:setHidden', false)
		TriggerEvent('carhud:display', true)
		TriggerEvent('exile:pasy', true)
		TriggerEvent('esx_customui:toggle', true)
	end
end)

CreateThread(function()
    while true do
        Citizen.Wait(2)
        if blackBars then
            DrawRect(1.0, 1.0, 2.0, 0.25, 0, 0, 0, 255)
            DrawRect(1.0, 0.0, 2.0, 0.25, 0, 0, 0, 255)
		else
			Citizen.Wait(333)
		end
    end
end)

local holstered = false
local hand = false
local weapons = {
    --BRON BIALA--
    "WEAPON_DAGGER",
    "WEAPON_BAT",
    "WEAPON_BOTTLE",
    "WEAPON_CROWBAR",
    "WEAPON_FLASHLIGHT",
    "WEAPON_GOLFCLUB",
    "WEAPON_HAMMER",
    "WEAPON_HATCHET",
    "WEAPON_KNIFE",
    "WEAPON_MACHETE",
    "WEAPON_NIGHTSTICK",
    "WEAPON_WRENCH",
    "WEAPON_BATTLEAXE",
    "WEAPON_POOLCUE",
    "WEAPON_STONE_HATCHET",

    --PISTOLETY--
    "WEAPON_PISTOL",
    "WEAPON_PISTOL_MK2",
	"WEAPON_NAVYREVOLVER",
    "WEAPON_COMBATPISTOL",
    "WEAPON_APPISTOL",
    "WEAPON_STUNGUN",
    "WEAPON_PISTOL50",
    "WEAPON_SNSPISTOL",
    "WEAPON_SNSPISTOL_MK2",
    "WEAPON_HEAVYPISTOL",
    "WEAPON_VINTAGEPISTOL",
    "WEAPON_FLAREGUN",
    "WEAPON_MARKSMANPISTOL",
	"WEAPON_SMOKEGRENADE",
	"WEAPON_NAVYREVOLVER",
	"WEAPON_GADGETPISTOL",
	"WEAPON_STUNGUN_MP",
    "WEAPON_REVOLVER",
    "WEAPON_REVOLVER_MK2",
    
    --MACHINE PISTOLE--
    "WEAPON_MICROSMG",
    "WEAPON_SMG",
    "WEAPON_SMG_MK2",
    "WEAPON_ASSAUTSMG",
    "WEAPON_COMBATPDW",
    "WEAPON_MACHINEPISTOL",
    "WEAPON_MINISMG",
    
   --POMPY-- 
    "WEAPON_PUMPSHOTGUN",
    "WEAPON_PUMPSHOTGUN_MK2",
    "WEAPON_SAWNOFFSHOTGUN",
    "WEAPON_ASSAULTSHOTGUN",
    "WEAPON_BULLPUPSHOTGUN",
    "WEAPON_MUSKET",
    "WEAPON_HEAVYSHOTGUN",
    "WEAPON_DBSHOTGUN",
    "WEAPON_AUTOSHOTGUN",

    --DLUGIE--
    "WEAPON_ASSAULTRIFLE",
	"weapon_bullpuprifle",
	"WEAPON_PIPEBOMB",
	"WEAPON_PROXMINE",
    "WEAPON_ASSAULTRIFLE_MK2",
	"WEAPON_HEAVYRIFLE",
	"WEAPON_FERTILIZERCAN",
	"WEAPON_EMPLAUNCHER",
    "WEAPON_CARBINERIFLE",
    "WEAPON_ADVANCEDRIFLE",
	"WEAPON_REVOLVER_MK2",
    "WEAPON_CARBINERIFLE_MK2",
    "WEAPON_MILITARYRIFLE",
    "WEAPON_SPECIALRIFLE",
    "WEAPON_SPECIALRIFLE_MK2",
    "WEAPON_BULLPUPRIFLE",
    "WEAPON_BULLPUPRIFLE_MK2",
    "WEAPON_COMPACTRIFLE",
    "WEAPON_MG",
    "WEAPON_COMBATMG",
    "WEAPON_COMBATMG_MK2",
    "WEAPON_GUSENBERG",
	"WEAPON_RPG",

    --SNIPERKI--
    "WEAPON_SNIPERRIFLE",
    "WEAPON_HEAVYSNIPER",
    "WEAPON_HEAVYSNIPER_MK2",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_COMPACTLAUNCHER",
    "WEAPON_MARKSMANRIFLE",
    "WEAPON_MARKSMANRIFLE_MK2",

    --DODATKOWE--
    "WEAPON_GRANADE",
    "WEAPON_BZGAS",
    "WEAPON_MOLOTOV",
    "WEAPON_STICKYBOMB",
    "WEAPON_PROXMINE",
    "WEAPON_SNOWBALL",
    "WEAPON_BALL",

    "WEAPON_FLARE",
	"WEAPON_FIREEXTINGUISHER",
	"WEAPON_STICKYBOMB",
	"WEAPON_FLASHBANG",

}

local simples = {
	`WEAPON_STUNGUN`,
	`WEAPON_FLAREGUN`,

	`WEAPON_SNSPISTOL`,
	`WEAPON_SNSPISTOL_MK2`,
	`WEAPON_VINTAGEPISTOL`,
	`WEAPON_PISTOL`,
	`WEAPON_PISTOL_MK2`,
	`WEAPON_GADGETPISTOL`,
	`WEAPON_DOUBLEACTION`,
	`WEAPON_COMBATPISTOL`,
	`WEAPON_APPISTOL`,
	`WEAPON_HEAVYPISTOL`,
	`WEAPON_CERAMICPISTOL`,
	`WEAPON_SNOWBALL`,
	`WEAPON_BALL`,
	`WEAPON_FLARE`,
	`WEAPON_FLASHLIGHT`,
	`WEAPON_KNUCKLE`,
	`WEAPON_SWITCHBLADE`,
	`WEAPON_NIGHTSTICK`,
	`WEAPON_KNIFE`,
	`WEAPON_DAGGER`,
	`WEAPON_MACHETE`,
	`WEAPON_HAMMER`,
	`WEAPON_WRENCH`,
	`WEAPON_CROWBAR`,
	`WEAPON_FERTILIZERCAN`,
	'WEAPON_REVOLVER',
	'WEAPON_REVOLVER_MK2',
	`WEAPON_STUNGUN_MP`,
	"WEAPON_FLASHBANG",

	`WEAPON_STICKYBOMB`,
	`WEAPON_MOLOTOV`,
	`WEAPON_COMPACTLAUNCHER`,
	`WEAPON_DBSHOTGUN`,
	`WEAPON_SAWNOFFSHOTGUN`,
	`WEAPON_MICROSMG`,
	`WEAPON_SMG_MK2`,

	`WEAPON_NAVYREVOLVER`,
}

local types = {
	[2] = true,
	[3] = true,
	[5] = true,
	[6] = true,
	[10] = true,
	[12] = true
}

local holstered = 0
CreateThread(function()
	RequestAnimDict("rcmjosh4")
	while not HasAnimDictLoaded("rcmjosh4") do
		Citizen.Wait(0)
	end

	RequestAnimDict("reaction@intimidation@1h")
	while not HasAnimDictLoaded("reaction@intimidation@1h") do
		Citizen.Wait(0)
	end

	RequestAnimDict("weapons@pistol@")
	while not HasAnimDictLoaded("weapons@pistol@") do
		Citizen.Wait(0)
	end

	while true do
		Citizen.Wait(185)
		if DoesEntityExist(playerPed) and not IsEntityDead(playerPed) and not inVehicle then
			local weapon = GetSelectedPedWeapon(playerPed)
			if weapon ~= `WEAPON_UNARMED` then
				if holstered == 0 then
					local t = 0
					if `WEAPON_SWITCHBLADE` == weapon then
						t = 1
					elseif CheckSimple(weapon) then
						TaskPlayAnim(playerPed, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 5, 0, 0, 0)
						t = 1
					elseif types[GetWeaponDamageType(weapon)] then
						TaskPlayAnim(playerPed, "reaction@intimidation@1h", "intro", 3.0,1.0, -1, 48, 0, 0, 0, 0)
						SetCurrentPedWeapon(playerPed, `WEAPON_UNARMED` , true)
						t = 2
					end

					holstered = weapon
					if t > 0 then
						if t == 1 then
							Citizen.Wait(600)
						elseif t == 2 then
							Citizen.Wait(1000)
							SetCurrentPedWeapon(playerPed, weapon, true)
							Citizen.Wait(1500)
						end

						ClearPedTasks(playerPed)
					end
				elseif holstered ~= weapon then
					local t, h = 0, false
					if `WEAPON_SWITCHBLADE` == holstered then
						Citizen.Wait(1500)
						ClearPedTasks(playerPed)

						if CheckSimple(weapon) then
							TaskPlayAnim(playerPed, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 5, 0, 0, 0)
							t = 600
						elseif types[GetWeaponDamageType(weapon)] then
							TaskPlayAnim(playerPed, "reaction@intimidation@1h", "intro", 3.0,1.0, -1, 48, 0, 0, 0, 0)
							SetCurrentPedWeapon(playerPed, `WEAPON_UNARMED` , true)
							h = true
							t = 1000
						end
					elseif `WEAPON_SWITCHBLADE` == weapon then
						t = 600
					elseif CheckSimple(holstered) and CheckSimple(weapon) then
						TaskPlayAnim(playerPed, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 5, 0, 0, 0)
						t = 600
					elseif types[GetWeaponDamageType(holstered)] and types[GetWeaponDamageType(weapon)] then
						TaskPlayAnim(playerPed, "reaction@intimidation@1h", "intro", 3.0,1.0, -1, 48, 0, 0, 0, 0)
						SetCurrentPedWeapon(playerPed, holstered, true)
						h = true
						t = 1000
					end

					holstered = weapon
					if t > 0 then
						Citizen.Wait(t)
						if h then
							SetCurrentPedWeapon(playerPed, weapon, true)
							Citizen.Wait(1500)
						end

						ClearPedTasks(playerPed)
					end
				end
			elseif holstered ~= 0 then
				local t, h = 0, false
				if `WEAPON_DOUBLEACTION` == holstered or `WEAPON_SWITCHBLADE` == holstered then
					t = 1500
				elseif CheckSimple(holstered) then
					TaskPlayAnim(playerPed, "weapons@pistol@", "aim_2_holster", 8.0, 2.0, -1, 48, 5, 0, 0, 0)
					t = 600
				elseif types[GetWeaponDamageType(holstered)] then
					TaskPlayAnim(playerPed, "reaction@intimidation@1h", "outro", 8.0,2.0, -1, 48, 1, 0, 0, 0)
					SetCurrentPedWeapon(playerPed, holstered, true)
					h = true
					t = 1500
				end

				holstered = 0
				if t > 0 then
					Citizen.Wait(t)
					if h then
						SetCurrentPedWeapon(playerPed, `WEAPON_UNARMED` , true)
					end

					ClearPedTasks(playerPed)
				end
			end
		end
	end
end)

function CheckSimple(weapon)
	for _, simple in ipairs(simples) do
		if simple == weapon then
			return true
		end
	end

	return false
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(50)
    end
end

CreateThread(function()
    Citizen.Wait(1000)
	for i=1, #Config.Strefy, 1 do
		local blip = AddBlipForRadius(Config.Strefy[i].Pos, Config.Strefy[i].Radius)
		
		SetBlipHighDetail(blip, true)
		SetBlipColour(blip, Config.Strefy[i].Colour)
		SetBlipAlpha(blip, 150)
		SetBlipAsShortRange(blip, true)
	end
end)

local canUsePropfix = true
RegisterCommand("propfix", function()
	if GetEntityHealth(playerPed) > 0 and not exports["esx_ambulancejob"]:isDead() then
		if not IsPedCuffed(playerPed) then
		if not IsPedSittingInAnyVehicle(playerPed) then
			if canUsePropfix then
					TriggerEvent('skinchanger:getSkin', function(skin)
					wait = true
					Citizen.Wait(50)
					local armour = Citizen.InvokeNative(0x9483AF821605B1D8, playerPed)
					local health = Citizen.InvokeNative(0xEEF059FAD016D209, playerPed)
					if skin.sex == 0 then
							TriggerEvent('skinchanger:loadSkin', {sex=1})
							Citizen.Wait(1000)
							TriggerEvent('skinchanger:loadSkin', {sex=0})
					elseif skin.sex == 1 then
							TriggerEvent('skinchanger:loadSkin', {sex=0})
							Citizen.Wait(1000)
							TriggerEvent('skinchanger:loadSkin', {sex=1})
					end
					--TriggerServerEvent('exile_logs:triggerLog', "Użył komendy /propfix", 'propfix')
					Citizen.Wait(1000)
					ESX.ShowNotification('Załadowano ~g~HP / ARMOR ~w~sprzed użycia ~g~/propfix')
					TriggerEvent("exilerp:save")
					Citizen.InvokeNative(0x6B76DC1F3AE6E6A3, playerPed, health)
					Citizen.InvokeNative(0xCEA04D83135264CC, playerPed, armour)
					canUsePropfix = false
					Citizen.Wait(300000)
					canUsePropfix = true
					end)
				else
					ESX.ShowNotification('~r~Nie możesz tak często używać tej komendy!')
				end
			else
				ESX.ShowNotification('~r~Nie możesz używać propfixa w aucie')
			end
		else
			ESX.ShowNotification('~r~Nie możesz używać tej komendy podczas bycia zakutym.')
		end
	else
		ESX.ShowNotification('~r~Nie możesz używać tej komendy podczas BW.')
	end
end)

if not IsDuplicityVersion() then

	local _decorExists, _drawMarker = DecorExistOn, DrawMarker
	function DrawMarker(...)
		if playerPed and not _decorExists(playerPed, "misiaczek:marker") then
			_drawMarker(...)
		end
	end

	local _getVehicleNumberPlateText = GetVehicleNumberPlateText
	function GetVehicleNumberPlateText(vehicle, unveil)
		local plate = _getVehicleNumberPlateText(vehicle)
		if plate and unveil and plate:gsub("^%s*(.-)%s*$", "%1") == "" and _decorExists(vehicle, "misiaczek:plate") then
			return exports['esx_plates']:GetPlate(DecorGetInt(vehicle, "misiaczek:plate"))
		end

		return plate
	end
end

local HUD = {
	Blip = nil,
  }
  
CreateThread(function()
	SetMapZoomDataLevel(0, 0.96, 0.9, 0.08, 0.0, 0.0)
	SetMapZoomDataLevel(1, 1.6, 0.9, 0.08, 0.0, 0.0)
	SetMapZoomDataLevel(2, 8.6, 0.9, 0.08, 0.0, 0.0)
	SetMapZoomDataLevel(3, 12.3, 0.9, 0.08, 0.0, 0.0)
	SetMapZoomDataLevel(4, 22.3, 0.9, 0.08, 0.0, 0.0)

	SetBlipAlpha(GetMainPlayerBlipId(), 0)
	SetBlipAlpha(GetNorthRadarBlip(), 0)
	while true do
		Citizen.Wait(500)
		if IsPedOnFoot(playerPed) then 
			SetRadarZoom(1100)
		elseif IsPedInAnyVehicle(playerPed, true) then
			SetRadarZoom(1100)
		end
		local heading = GetEntityHeading(playerPed)
		if HUD.Blip and DoesBlipExist(HUD.Blip) then
			RemoveBlip(HUD.Blip)
		end

		HUD.Blip = AddBlipForEntity(playerPed)
		SetBlipSprite(HUD.Blip, (inVehicle and 545 or 1))

		SetBlipScale(HUD.Blip, 1.0)
		SetBlipCategory(HUD.Blip, 1)
		SetBlipPriority(HUD.Blip, 10)
		SetBlipColour(HUD.Blip, 55)
		SetBlipAsShortRange(HUD.Blip, true)

		SetBlipRotation(HUD.Blip, math.ceil(heading))
		ShowHeadingIndicatorOnBlip(HUD.Blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Twoja pozycja")
		EndTextCommandSetBlipName(HUD.Blip)
	end
end)

local ExileBlips = {
	{
        coords = {-329.02, -1967.93, 66.7},
        sprite = 127,
        display = 4,
        scale = 0.7,
        color = 27,
        shortrange = true,
        name = "Maze Bank Arena",
        exileBlip = false,
        exileBlipId = ""
    },
	{
        coords = {243.89, -1079.78, 29.29},
        sprite = 525,
        display = 4,
        scale = 0.7,
        color = 27,
        shortrange = true,
        name = "Department of Justice",
        exileBlip = false,
        exileBlipId = ""
    },
    {
        coords = {-75.96, 6256.21, 31.09},
        sprite = 178,
        display = 4,
        scale = 0.7,
        color = 70,
        shortrange = true,
        name = "Catch Chickens",
        exileBlip = false,
        exileBlipId = ""
    },
	{
		coords = {289.09, -1095.04, 29.41},
        sprite = 473,
        display = 4,
        scale = 0.7,
        color = 56,
        shortrange = true,
        name = "Magazyn",
        exileBlip = false,
        exileBlipId = ""
    },
    {
        coords = {54.19, -1574.98, 29.46},
        sprite = 442,
        display = 4,
        scale = 0.7,
        color = 4,
        shortrange = true,
        name = "Milkman",
        exileBlip = true,
        exileBlipId = "exilerp_mleczarz"
    },
	{
        coords = {-1202.41, -895.03, 13.99},
        sprite = 126,
        display = 4,
        scale = 0.7,
        color = 5,
        shortrange = true,
        name = "Burgershot",
        exileBlip = true,
        exileBlipId = "exilerp_burgerownia"
    },

	{
        coords = {796.1, -749.96, 31.26},
        sprite = 488,
        display = 4,
        scale = 0.7,
        color = 0,
        shortrange = true,
        name = "Pizza This",
        exileBlip = true,
        exileBlipId = "exilerp_pizzathis"
    },
	{
        coords = {-332.15, -2792.74, 4.1},
        sprite = 471,
        display = 4,
        scale = 0.7,
        color = 3,
        shortrange = true,
        name = "Sklep z łodziami",
        exileBlip = true,
        exileBlipId = "boat4"
    },
	{
        coords = {-718.77, -1326.51, 0.7},
        sprite = 404,
        display = 4,
        scale = 0.7,
        color = 6,
        shortrange = true,
        name = "Port SAMS",
        exileBlip = true,
        exileBlipId = "boat4"
    },
	{
        coords = {1736.29, 3976.24, 31.08},
        sprite = 404,
        display = 4,
        scale = 0.7,
        color = 6,
        shortrange = true,
        name = "Port SAMS",
        exileBlip = true,
        exileBlipId = "boat4"
    },
	{
        coords = {-285.01, 6627.6, 6.24},
        sprite = 404,
        display = 4,
        scale = 0.7,
        color = 6,
        shortrange = true,
        name = "Port SAMS",
        exileBlip = true,
        exileBlipId = "boat4"
    },
	{
        coords = {-3420.4172, 955.6319, 7.396},
        sprite = 404,
        display = 4,
        scale = 0.7,
        color = 6,
        shortrange = true,
        name = "Port SAMS",
        exileBlip = true,
        exileBlipId = "boat4"
    },
	{
        coords = {2836.5044, -732.4112, 0.3822},
        sprite = 404,
        display = 4,
        scale = 0.7,
        color = 6,
        shortrange = true,
        name = "Port SAMS",
        exileBlip = true,
        exileBlipId = "boat4"
    },
	{
        coords = {3373.8213, 5183.4863, 0.5161},
        sprite = 404,
        display = 4,
        scale = 0.7,
        color = 6,
        shortrange = true,
        name = "Port SAMS",
        exileBlip = true,
        exileBlipId = "boat4"
    },
	{
        coords = {-941.13, -2954.42, 13.05},
        sprite = 584,
        display = 4,
        scale = 0.7,
        color = 30,
        shortrange = true,
        name = "Sklep z samolotami",
        exileBlip = true,
        exileBlipId = "airport2"
    },
	{
        coords = {-804.27, -1368.97, 4.32},
        sprite = 481,
        display = 4,
        scale = 0.7,
        color = 38,
        shortrange = true,
        name = "Extreme Sports",
        exileBlip = true,
        exileBlipId = "exilerp_extremesports"
    },
	{
        coords = {-1013.67, -481.0, 39.32},
        sprite = 133,
        display = 4,
        scale = 0.7,
        color = 7,
        shortrange = true,
        name = "Psycholog",
        exileBlip = true,
        exileBlipId = "exilerp_psycholog"
    },
	{
        coords = {-550.9989, -912.3848, 28.8366},
        sprite = 184,
        display = 4,
        scale = 0.7,
        color = 37,
        shortrange = true,
        name = "Weazel News",
        exileBlip = true,
        exileBlipId = "exilerp_weazelnews"
    },
	{
        coords = {-627.85 , 222.70, 94.60},
        sprite = 112,
        display = 4,
        scale = 0.7,
        color = 0,
        shortrange = true,
        name = "X-Gamer",
        exileBlip = true,
        exileBlipId = "exilerp_xgamer"
    },
	{
        coords = {-2068.93 , -486.59, 12.98},
        sprite = 621,
        display = 4,
        scale = 0.7,
        color = 57,
        shortrange = true,
        name = "Molo Miłości",
        exileBlip = true,
        exileBlipId = "exilerp_molom"
    },
	{
        coords = {-1045.8291, -2751.5154, 20.41348},
        sprite = 307,
        display = 4,
        scale = 0.7,
        color = 76,
        shortrange = true,
        name = "Lotnisko",
        exileBlip = true,
        exileBlipId = "airport"
    },
	{
        coords = {-1684.17 , -278.34, 74.7},
        sprite = 305,
        display = 4,
        scale = 0.7,
        color = 0,
        shortrange = true,
        name = "Kościół",
        exileBlip = true,
        exileBlipId = "church"
    },
	{
        coords = {932.25, 41.13, 80.29},
        sprite = 679,
        display = 4,
        scale = 0.7,
        color = 5,
        shortrange = true,
        name = "Casino Royale",
        exileBlip = true,
        exileBlipId = "casino"
    },
	{
        coords = {-1651.14, -904.38, 8.59},
        sprite = 135,
        display = 4,
        scale = 0.7,
        color = 7,
        shortrange = true,
        name = "Kino Samochodowe",
        exileBlip = true,
        exileBlipId = "cinemacar"
    },
	{
        coords = {-552.91, -191.45, 38.21},
        sprite = 498,
        display = 4,
        scale = 0.7,
        color = 15,
        shortrange = true,
        name = "Urząd Miasta",
        exileBlip = true,
        exileBlipId = "cityhall"
    },
	{
        coords = {-682.38, -2239.51, 5.94},
        sprite = 440,
        display = 4,
        scale = 0.7,
        color = 49,
        shortrange = true,
        name = "Pralnia Pieniędzy",
        exileBlip = true,
        exileBlipId = "exilerp_pralnia"
    },
	{
        coords = {100.5097, -1506.061, 28.3058},
        sprite = 523,
        display = 4,
        scale = 0.7,
        color = 46,
        shortrange = true,
        name = "Luxury Motosports",
        exileBlip = true,
        exileBlipId = "cardealer"
    },
	{
        coords = {-414.8303, -2796.4055, 5.0504},
        sprite = 363,
        display = 4,
        scale = 0.7,
        color = 30,
        shortrange = true,
        name = "PostOP",
        exileBlip = true,
        exileBlipId = "exilerp_kurier"
    },
	{
        coords = {715.05798339844, -971.34069824219, 36.854461669922},
        sprite = 366,
        display = 4,
        scale = 0.7,
        color = 2,
        shortrange = true,
        name = "Fly Beliodas",
        exileBlip = true,
        exileBlipId = "exilerp_krawiec"
    },
	{
        coords = {-1927.351, 2063.881, 139.7437},
        sprite = 479,
        display = 4,
        scale = 0.7,
        color = 27,
        shortrange = true,
        name = "Winiarz",
        exileBlip = true,
        exileBlipId = "exilerp_winiarz"
    },
	{
        coords = {892.95, -162.61, 76.89},
        sprite = 205,
        display = 4,
        scale = 0.7,
        color = 60,
        shortrange = true,
        name = "Downtown Cab. Co.",
        exileBlip = true,
        exileBlipId = "taxi"
    },
	{
        coords = {-555.53161621094, -618.80426025391, 34.676345825195},
        sprite = 525,
        display = 4,
        scale = 0.7,
        color = 24,
        shortrange = true,
        name = "Muzeum",
        exileBlip = true,
        exileBlipId = "taxi"
    },
}

CreateThread(function()
	for i,v in ipairs(ExileBlips) do
		local blip = AddBlipForCoord(v.coords[1], v.coords[2], v.coords[3])

		SetBlipSprite (blip, v.sprite)
		SetBlipDisplay(blip, v.display)
		SetBlipScale  (blip, v.scale)
		SetBlipColour (blip, v.color)
		SetBlipAsShortRange(blip, v.shortrange)
	
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(v.name)
		EndTextCommandSetBlipName(blip)
	end	
end)