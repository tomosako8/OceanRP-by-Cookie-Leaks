local configFile = LoadResourceFile(GetCurrentResourceName(), "config/config.json")
local cfgFile = json.decode(configFile)

local localsFile = LoadResourceFile(GetCurrentResourceName(), "locals/"..cfgFile['locals']..".json")
local lang = json.decode(localsFile)

CreateThread(function()
	local DeathReason, Killer, DeathCauseHash, Weapon
	while true do
		Wait(250)
		if IsEntityDead(PlayerPedId()) then
			local PedKiller = GetPedSourceOfDeath(PlayerPedId())
			local killername = GetPlayerName(PedKiller)
			DeathCauseHash = GetPedCauseOfDeath(PlayerPedId())
			Weapon = ClientWeapons.WeaponNames[tostring(DeathCauseHash)]
			if IsEntityAPed(PedKiller) and IsPedAPlayer(PedKiller) then
				Killer = NetworkGetPlayerIndexFromPed(PedKiller)
			elseif IsEntityAVehicle(PedKiller) and IsEntityAPed(GetPedInVehicleSeat(PedKiller, -1)) and IsPedAPlayer(GetPedInVehicleSeat(PedKiller, -1)) then
				Killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(PedKiller, -1))
			end
			
			if (Killer == PlayerId()) then
				DeathReason = lang['DeathReasons'].Suicide
			elseif (Killer == nil) then
				DeathReason = lang['DeathReasons'].Died
			else
				if ClientFunc.IsMelee(DeathCauseHash) then
					DeathReason = lang['DeathReasons'].Murdered
				elseif ClientFunc.IsTorch(DeathCauseHash) then
					DeathReason = lang['DeathReasons'].Torched
				elseif ClientFunc.IsKnife(DeathCauseHash) then
					DeathReason = lang['DeathReasons'].Knifed
				elseif ClientFunc.IsPistol(DeathCauseHash) then
					DeathReason = lang['DeathReasons'].Pistoled
				elseif ClientFunc.IsSub(DeathCauseHash) then
					DeathReason = lang['DeathReasons'].Riddled
				elseif ClientFunc.IsRifle(DeathCauseHash) then
					DeathReason = lang['DeathReasons'].Rifled
				elseif ClientFunc.IsLight(DeathCauseHash) then
					DeathReason = lang['DeathReasons'].MachineGunned
				elseif ClientFunc.IsShotgun(DeathCauseHash) then
					DeathReason = lang['DeathReasons'].Pulverized
				elseif ClientFunc.IsSniper(DeathCauseHash) then
					DeathReason = lang['DeathReasons'].Sniped
				elseif ClientFunc.IsHeavy(DeathCauseHash) then
					DeathReason = lang['DeathReasons'].Obliterated
				elseif ClientFunc.IsMinigun(DeathCauseHash) then
					DeathReason = lang['DeathReasons'].Shredded
				elseif ClientFunc.IsBomb(DeathCauseHash) then
					DeathReason = lang['DeathReasons'].Bombed
				elseif ClientFunc.IsVeh(DeathCauseHash) then
					DeathReason = lang['DeathReasons'].MowedOver
				elseif ClientFunc.IsVK(DeathCauseHash) then
					DeathReason = lang['DeathReasons'].Flattened
				else
					DeathReason = lang['DeathReasons'].Killed
				end
			end
			local odleglosc = math.floor(GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(PlayerId())), GetEntityCoords(GetPlayerPed(Killer)), true))
			if DeathReason == lang['DeathReasons'].Suicide or DeathReason == lang['DeathReasons'].Died then
			  	TriggerServerEvent('exile_logs:playerDied', GetPlayerServerId(PlayerId()), 'Gracz: **' ..GetPlayerName(PlayerId()).. '**\nPow??d: **' .. DeathReason .. '.** ', Weapon)
			else
				TriggerServerEvent('exile_logs:playerDied', GetPlayerServerId(Killer), 'Gracz: **' ..GetPlayerName(Killer).. '**\nKogo: **' .. GetPlayerName(PlayerId()) .. '**\nPow??d: **' .. DeathReason .. '** \nOdleg??o????: **' .. odleglosc .. 'm**\nBro??: **'..Weapon..'**')
			end

			Killer = nil
			DeathReason = nil
			DeathCauseHash = nil
			Weapon = nil

		end
		while IsEntityDead(PlayerPedId()) do
			Wait(1000)
		end
	end
end)

EXILEDMG = {}
EXILEDMG.Weapons = {
		[`WEAPON_ADVANCEDRIFLE`] = 1.0,-- 4 hit??w advancedrifle
		[`WEAPON_MILITARYRIFLE`] = 1.3,-- 3 hit??w militaryrifle
		[`WEAPON_COMBATPDW`] = 0.8,--6 hit??w combatpdw
		[`WEAPON_SPECIALCARBINE`] = 0.9,-- 4 hit??w specialcarbine
		[`WEAPON_GUSENBERG`] = 1.0,-- 4 hit??w gusenberg
		[`WEAPON_COMPACTRIFLE`] = 0.7,-- 5 hit??w compactrifle
		[`WEAPON_CARBINERIFLE`] = 1.1,-- 5 hit??w carbinerifle
		[`WEAPON_CARBINERIFLE_MK2`] = 1.0,-- 4 hit??w carbinerifle_mk2
		[`WEAPON_HEAVYRIFLE`] = 1.25,-- 3 hit??w heavyrifle
		[`WEAPON_COMPACTLAUNCHER`] = 2.0,-- 1 hit??w rakietnica
		[`WEAPON_HOMINGLAUNCHER`] = 4.0,-- 1 hit??w rakietnica
		[`WEAPON_EMPLAUNCHER`] = 0.0,-- 0 hit??w
		[`WEAPON_DBSHOTGUN`] = 8.0,-- 1 hit??w pompa
		[`WEAPON_SAWNOFFSHOTGUN`] = 3.5,-- 1 hit??w pompa
		[`WEAPON_PUMPSHOTGUN`] = 3.5,-- 1 hit??w pompa
		[`WEAPON_BULLPUPSHOTGUN`] = 8.0,-- 1 hit??w pompa
		[`WEAPON_SMOKEGRENADE`] = 0.0,-- 0 hit??w granat
		[`WEAPON_MINIGUN`] = 8.0,-- 1 hit??w minigun
		[`WEAPON_MUSKET`] = 1.05,-- 1 hit??w muszkiet
		[`WEAPON_SNIPERRIFLE`] = 8.0,-- 1 hit??w snajperka
		[`WEAPON_SMG`] = 0.9,--6 hit??w smg 
		[`WEAPON_MINISMG`] = 0.8,-- 7 hit??w minismg
		[`WEAPON_MICROSMG`] = 0.8,-- 7 hit??w microsmg
		[`WEAPON_ASSAULTRIFLE`] = 1.2,-- 3 hit??w assualtrifle 
		[`WEAPON_ASSAULTRIFLE_MK2`] = 1.2,-- 3 hit??w assualtrifle_mk2
		[`WEAPON_GADGETPISTOL`] = 0.2,-- 3 hit??w gadgetpistol
		[`WEAPON_HEAVYPISTOL`] = 1.6,-- 4 hit??w heavypistol 
		[`WEAPON_REVOLVER`] = 0.8,-- 2 hit??w revolver
		[`WEAPON_DOUBLEACTION`] = 1.0,-- 3 hit??w double action revolver
		[`WEAPON_MACHINEPISTOL`] = 0.55,-- 7 hit??w machinepistol
}

RegisterNetEvent('exile_handler:send')
AddEventHandler('exile_handler:send', function(a)
local client_trigger = tostring(a)
Wait(0)
	CreateThread(function()
		local aiming, shooting, curMul, _, weapon = nil, nil, nil

		for weaponHash,weaponDamage in pairs(EXILEDMG.Weapons) do _SET_WEAPON_DAMAGE_MODIFIER(weaponHash, weaponDamage) end

		while true do
			aiming, shooting = IsControlPressed(0, 25), IsPedShooting(PlayerPedId())
			
			if aiming or shooting then            
				_, weapon = GetCurrentPedWeapon(PlayerPedId(), true)

				if _ then
					curMul = GetPlayerWeaponDamageModifier(PlayerId())
					_SET_WEAPON_DAMAGE_MODIFIER(weapon, (EXILEDMG.Weapons[weapon] or 1.0))
					if curMul > 1.0 then 
						if curMul-0.001 > (EXILEDMG.Weapons[weapon] or 1.0) then
						-- if curMul > 1.0 then
							TriggerServerEvent(client_trigger, curMul, (EXILEDMG.Weapons[weapon] or 1.0))
							Citizen.Wait(60000)
						end
					end
				end
			else
				Citizen.Wait(10)
			end

			Citizen.Wait(0)
		end
	end)
end)

_SET_WEAPON_DAMAGE_MODIFIER = function(weaponHash, damageFloat)
    Citizen.InvokeNative(0x4757F00BC6323CFE, weaponHash, damageFloat)
end

RegisterNetEvent("exile_quit")
AddEventHandler("exile_quit", function(id, crds, name, reason)
    Display(id, crds, name, reason)
end)

function Display(id, crds, name, reason)
    local displaying = true
	local _reason = reason or ""

    CreateThread(function()
        Wait(30000)
        displaying = false
    end)
	
    CreateThread(function()
        while displaying do
            Wait(5)
            local pcoords = GetEntityCoords(PlayerPedId())
            if #(crds - pcoords) < 15.0 then
                DrawText3DSecond(crds.x, crds.y, crds.z+0.15, "Gracz opu??ci?? gr??")
                DrawText3D(crds.x, crds.y, crds.z, "ID: "..id.." ("..name..")\n".._reason)
            else
                Citizen.Wait(1000)
            end
        end
    end)
end

function DrawText3DSecond(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.45, 0.45)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 0, 0, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.45, 0.45)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end