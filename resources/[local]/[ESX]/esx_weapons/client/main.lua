local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local HasAlreadyEnteredMarker = false
local LastZone = nil
local CurrentAction = nil
local CurrentActionMsg = ''
local CurrentActionData = {}
local ShopOpen = false
local Weapons = {}
local AmmoTypes = {}

local AmmoInClip = {}
local firsttime = false
local CurrentWeapon = nil

local IsShooting = false
local AmmoBefore = 0
local checkload = false
local checkload2 = false
local checkload3 = false

local currentweapon,WeaponsUpdate = {},{}


ESX	= nil
local PlayerData = {}

-- load jobData
CreateThread(function()
	while ESX == nil do
		TriggerEvent('exilerp:getSharedObject', function(obj) 
			ESX = obj 
		end)
		Citizen.Wait(250)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end
	PlayerData = ESX.GetPlayerData()
end)
RegisterNetEvent("esx:setJob", function(job) 
	PlayerData.job = job
end)
RegisterNetEvent("esx:setThirdJob", function(hjob) 
	PlayerData.thirdjob = hjob
end)

function OpenShopMenu(zone)
	local elements = {}
	local buyAmmo = {}
	ShopOpen = true
	local playerPed = PlayerPedId()
	PlayerData = ESX.GetPlayerData()

	for k,v in ipairs(Config.Zones[zone].Items) do
		local label

		if v.item then
			if v.price > 0 then
				label = ('%s: <span style="color:green;">%s</span>'):format(v.label, _U('gunshop_item', ESX.Math.GroupDigits(v.price)))
			else
				label = ('%s: <span style="color:green;">%s</span>'):format(v.label, _U('gunshop_free'))
			end		
			
			table.insert(elements, {
				label = label,
				weaponLabel = v.label,
				name = v.weapon,
				price = v.price,
				ammoNumber = v.AmmoToGive,
				item = v.item
			})
		else
			if v.price > 0 then
				label = ('%s: <span style="color:green;">%s</span>'):format(v.label, _U('gunshop_item', ESX.Math.GroupDigits(v.price)))
			else
				label = ('%s: <span style="color:green;">%s</span>'):format(v.label, _U('gunshop_free'))
			end
			
			table.insert(elements, {
				label = label,
				weaponLabel = v.label,
				name = v.weapon,
				price = v.price,
				ammoNumber = v.AmmoToGive,
				item = v.item
			})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gunshop_buy_weapons', {
		title    = _U('gunshop_weapontitle'),
		align    = 'center',
		elements = elements
	}, function(data, menu)

		if data.current.item then			
			ESX.TriggerServerCallback('esx_newweaponshop:buyWeapon', function(bought)
				if bought then					
					PlaySoundFrontend(-1, 'NAV', 'HUD_AMMO_SHOP_SOUNDSET', false)
				else
					PlaySoundFrontend(-1, 'ERROR', 'HUD_AMMO_SHOP_SOUNDSET', false)
				end
			end, data.current.name, 2, zone)
		else
			ESX.TriggerServerCallback('esx_newweaponshop:buyWeapon', function(bought)
				if bought then
					if data.current.price > 0 then
						ESX.ShowNotification('Zakupiłeś broń!')
					end
					PlaySoundFrontend(-1, 'NAV', 'HUD_AMMO_SHOP_SOUNDSET', false)
				else
					PlaySoundFrontend(-1, 'ERROR', 'HUD_AMMO_SHOP_SOUNDSET', false)
				end
			end, data.current.name, 1, zone)
		end

	end, function(data, menu)
		ShopOpen = false
		menu.close()
	end)

end

AddEventHandler('esx_newweaponshop:hasEnteredMarker', function(zone)
	PlayerData = ESX.GetPlayerData()

	if zone == 'GunShop' or zone == 'Ballas' then
		CurrentAction     = 'shop_menu'
		CurrentActionMsg  = _U('shop_menu_prompt')
		CurrentActionData = { zone = zone }
	end
	if zone == 'GunShopDS' then
		CurrentAction     = 'shop_menu2'
		CurrentActionMsg  = _U('shop_menu_prompt')
		CurrentActionData = { zone = zone }
	end
end)

AddEventHandler('esx_newweaponshop:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		if ShopOpen then
			ESX.UI.Menu.CloseAll()
		end
	end
end)

-- Create Blips
CreateThread(function()
	for k,v in pairs(Config.Zones) do
		if v.Legal then
			for i = 1, #v.Locations, 1 do
				local blip = AddBlipForCoord(v.Locations[i])

				SetBlipSprite (blip, 110)
				SetBlipDisplay(blip, 4)
				SetBlipScale  (blip, 0.7)
				SetBlipColour (blip, 2)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentSubstringPlayerName(_U('map_blip'))
				EndTextCommandSetBlipName(blip)
			end
		end
	end
end)

-- Enter / Exit marker events
CreateThread(function()
	while true do
		Citizen.Wait(60)
		local coords, sleep = GetEntityCoords(PlayerPedId()), true
		local isInMarker, currentZone = false, nil

		for k,v in pairs(Config.Zones) do
			for i=1, #v.Locations, 1 do
			
				if #(coords - v.Locations[i]) < Config.Size.x then
					sleep = false
					isInMarker, ShopItems, currentZone, LastZone = true, v.Items, k, k
				end
			end
		end
		if isInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
			TriggerEvent('esx_newweaponshop:hasEnteredMarker', currentZone)
		end
		
		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_newweaponshop:hasExitedMarker', LastZone)
		end

		if sleep then
			Citizen.Wait(500)
		end
	end
end)

RegisterNetEvent("weaponshop:openShop")
AddEventHandler("weaponshop:openShop", function()
	if CurrentAction ~= nil then
		ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
			if hasWeaponLicense then
				OpenShopMenu(CurrentActionData.zone)
			else
				ESX.ShowNotification("Nie posiadasz licencji na broń!")
			end
		end, GetPlayerServerId(PlayerId()), 'weapon')
	end
end)

RegisterNetEvent("weaponshop:openDarkShop")
AddEventHandler("weaponshop:openDarkShop", function()
	if CurrentAction ~= nil then
		OpenShopMenu('GunShopDS')
	end
end)

function ReachedMaxAmmo(weaponName)

	local ammo = GetAmmoInPedWeapon(PlayerPedId(), weaponName)
	local _,maxAmmo = GetMaxAmmo(PlayerPedId(), weaponName)

	if ammo ~= maxAmmo then
		return false
	else
		return true
	end

end

function IsWeapon(name) 
	local is = false
	for weaponHash,v in pairs(Weapons) do
		if v.item == name then
			is = true
			break
		end
	end
	return is
end

local Weapons = {}

CreateThread(function()
	while true do
		local playerPed = PlayerPedId()
    Wait(1000)
		for i=1, #Config.RealWeapons, 1 do
      local weaponHash = GetHashKey(Config.RealWeapons[i].name)
      if HasPedGotWeapon(playerPed, weaponHash, false) then
        local onPlayer = false
				for k, entity in pairs(Weapons) do
				  if entity then
            if entity.weapon == Config.RealWeapons[i].name then
              onPlayer = true
              break
            end
				  end
        end
        
        if not onPlayer and weaponHash ~= GetSelectedPedWeapon(playerPed) then
          SetGear(Config.RealWeapons[i].name)
        elseif onPlayer and weaponHash == GetSelectedPedWeapon(playerPed) then
          RemoveGear(Config.RealWeapons[i].name)
        end
			else
				RemoveGear(Config.RealWeapons[i].name)
    	end
  	end
	end
end)

RegisterNetEvent('removeWeapon')
AddEventHandler('removeWeapon', function(weaponName)
	RemoveGear(weaponName)
end)
RegisterNetEvent('removeWeapons')
AddEventHandler('removeWeapons', function()
	RemoveGears()
end)

function RemoveGear(weapon)
	local _Weapons = {}

	for i, entity in pairs(Weapons) do
		if entity.weapon ~= weapon then
			_Weapons[i] = entity
		else
			DeleteWeapon(entity.obj)
		end
	end

	Weapons = _Weapons
end

function RemoveGears()
	for i, entity in pairs(Weapons) do
		DeleteWeapon(entity.obj)
	end
	Weapons = {}
end

function SpawnObject(model, coords, cb)

  local model = (type(model) == 'number' and model or GetHashKey(model))
  if not IsModelInCdimage(model) then return 0 end
  CreateThread(function()

    RequestModel(model)

    while not HasModelLoaded(model) do
      Citizen.Wait(0)
    end

    local obj = CreateObject(model, coords.x, coords.y, coords.z, true, true, true)

    if cb ~= nil then
      cb(obj)
    end

  end)

end

function DeleteWeapon(object)
  SetEntityAsMissionEntity(object,  false,  true)
  DeleteObject(object)
end
function SetGear(weapon)
	local bone       = nil
	local boneX      = 0.0
	local boneY      = 0.0
	local boneZ      = 0.0
	local boneXRot   = 0.0
	local boneYRot   = 0.0
	local boneZRot   = 0.0
	local playerPed  = GetPlayerPed(-1)
	local model      = nil
	local playerWeapons = getWeapons()
		
	for i=1, #Config.RealWeapons, 1 do
		if Config.RealWeapons[i].name == weapon then
			bone     = Config.RealWeapons[i].bone
			boneX    = Config.RealWeapons[i].x
			boneY    = Config.RealWeapons[i].y
			boneZ    = Config.RealWeapons[i].z
			boneXRot = Config.RealWeapons[i].xRot
			boneYRot = Config.RealWeapons[i].yRot
			boneZRot = Config.RealWeapons[i].zRot
			model    = Config.RealWeapons[i].model
			break
		end
	end

	SpawnObject(model, {
		x = x,
		y = y,
		z = z
	}, function(obj)
		local playerPed = GetPlayerPed(-1)
		local boneIndex = GetPedBoneIndex(playerPed, bone)
		local bonePos 	= GetWorldPositionOfEntityBone(playerPed, boneIndex)
		AttachEntityToEntity(obj, playerPed, boneIndex, boneX, boneY, boneZ, boneXRot, boneYRot, boneZRot, false, false, false, false, 2, true)
		table.insert(Weapons,{weapon = weapon, obj = obj})
	end)
end

local weapon_types = {
  "WEAPON_KNIFE",
  "WEAPON_STUNGUN",
  "WEAPON_FLASHLIGHT",
  "WEAPON_NIGHTSTICK",
  "WEAPON_HAMMER",
  "WEAPON_BAT",
  "WEAPON_GOLFCLUB",
  "WEAPON_CROWBAR",
  "WEAPON_PISTOL",
  "WEAPON_COMBATPISTOL",
  "WEAPON_APPISTOL",
  "WEAPON_PISTOL50",
  "WEAPON_MICROSMG",
  "WEAPON_SMG",
  "WEAPON_ASSAULTSMG",
  "WEAPON_ASSAULTRIFLE",
  "WEAPON_CARBINERIFLE",
  "WEAPON_SPECIALCARBINE",
  "WEAPON_ADVANCEDRIFLE",
  "WEAPON_MG",
  "WEAPON_COMBATMG",
  "WEAPON_PUMPSHOTGUN",
  "WEAPON_SAWNOFFSHOTGUN",
  "WEAPON_ASSAULTSHOTGUN",
  "WEAPON_BULLPUPSHOTGUN",
  "WEAPON_STUNGUN",
  "WEAPON_SNIPERRIFLE",
  "WEAPON_HEAVYSNIPER",
  "WEAPON_REMOTESNIPER",
  "WEAPON_GRENADELAUNCHER",
  "WEAPON_GRENADELAUNCHER_SMOKE",
  "WEAPON_RPG",
  "WEAPON_PASSENGER_ROCKET",
  "WEAPON_AIRSTRIKE_ROCKET",
  "WEAPON_STINGER",
  "WEAPON_MINIGUN",
  "WEAPON_GRENADE",
  "WEAPON_STICKYBOMB",
  "WEAPON_SMOKEGRENADE",
  "WEAPON_BZGAS",
  "WEAPON_MOLOTOV",
  "WEAPON_FIREEXTINGUISHER",
  "WEAPON_PETROLCAN",
  "WEAPON_DIGISCANNER",
  "WEAPON_BRIEFCASE",
  "WEAPON_BRIEFCASE_02",
  "WEAPON_BALL",
  "WEAPON_FLARE",
  "WEAPON_BOTTLE",
  "WEAPON_ANIMAL",
  "WEAPON_KNUCKLE",
  "WEAPON_SNSPISTOL",
  "WEAPON_COUGAR",
  "WEAPON_KNIFE",
  "WEAPON_NIGHTSTICK",
  "WEAPON_HAMMER",
  "WEAPON_BAT",
  "WEAPON_GOLFCLUB",
  "WEAPON_CROWBAR",
  "WEAPON_PISTOL",
  "WEAPON_COMBATPISTOL",
  "WEAPON_APPISTOL",
  "WEAPON_PISTOL50",
  "WEAPON_MICROSMG",
  "WEAPON_SMG",
  "WEAPON_ASSAULTSMG",
  "WEAPON_ASSAULTRIFLE",
  "WEAPON_CARBINERIFLE",
  "WEAPON_ADVANCEDRIFLE",
  "WEAPON_MG",
  "WEAPON_COMBATMG",
  "WEAPON_PUMPSHOTGUN",
  "WEAPON_SAWNOFFSHOTGUN",
  "WEAPON_ASSAULTSHOTGUN",
  "WEAPON_BULLPUPSHOTGUN",
  "WEAPON_STUNGUN",
  "WEAPON_SNIPERRIFLE",
  "WEAPON_HEAVYSNIPER",
  "WEAPON_REMOTESNIPER",
  "WEAPON_GRENADELAUNCHER",
  "WEAPON_GRENADELAUNCHER_SMOKE",
  "WEAPON_RPG",
  "WEAPON_PASSENGER_ROCKET",
  "WEAPON_AIRSTRIKE_ROCKET",
  "WEAPON_STINGER",
  "WEAPON_MINIGUN",
  "WEAPON_GRENADE",
  "WEAPON_STICKYBOMB",
  "WEAPON_SMOKEGRENADE",
  "WEAPON_BZGAS",
  "WEAPON_MOLOTOV",
  "WEAPON_FIREEXTINGUISHER",
  "WEAPON_PETROLCAN",
  "WEAPON_DIGISCANNER",
  "WEAPON_BRIEFCASE",
  "WEAPON_BRIEFCASE_02",
  "WEAPON_BALL",
  "WEAPON_FLARE",
  "WEAPON_VEHICLE_ROCKET",
  "WEAPON_BARBED_WIRE",
  "WEAPON_DROWNING",
  "WEAPON_DROWNING_IN_VEHICLE",
  "WEAPON_BLEEDING",
  "WEAPON_ELECTRIC_FENCE",
  "WEAPON_EXPLOSION",
  "WEAPON_FALL",
  "WEAPON_HIT_BY_WATER_CANNON",
  "WEAPON_RAMMED_BY_CAR",
  "WEAPON_RUN_OVER_BY_CAR",
  "WEAPON_HELI_CRASH",
  "WEAPON_FIRE",
  "GADGET_NIGHTVISION",
  "GADGET_PARACHUTE",
  "WEAPON_HEAVYSHOTGUN",
  "WEAPON_MARKSMANRIFLE",
  "WEAPON_HOMINGLAUNCHER",
  "WEAPON_PROXMINE",
  "WEAPON_SNOWBALL",
  "WEAPON_FLAREGUN",
  "WEAPON_GARBAGEBAG",
  "WEAPON_HANDCUFFS",
  "WEAPON_COMBATPDW",
  "WEAPON_MARKSMANPISTOL",
  "WEAPON_HATCHET",
  "WEAPON_RAILGUN",
  "WEAPON_MACHETE",
  "WEAPON_MACHINEPISTOL",
  "WEAPON_AIR_DEFENCE_GUN",
  "WEAPON_SWITCHBLADE",
  "WEAPON_REVOLVER"
}

function getWeapons()
  local player = GetPlayerPed(-1)

  local ammo_types = {}

  local weapons = {}
  for k,v in pairs(weapon_types) do
    local hash = GetHashKey(v)
    if HasPedGotWeapon(player,hash) then
      local weapon = {}
      weapons[v] = weapon

      local atype = Citizen.InvokeNative(0x7FEAD38B326B9F74, player, hash)
      if ammo_types[atype] == nil then
        ammo_types[atype] = true
        weapon.ammo = GetAmmoInPedWeapon(player,hash)
      else
        weapon.ammo = 0
      end
    end
  end

  return weapons
end

function SetGears()
	local bone       = nil
	local boneX      = 0.0
	local boneY      = 0.0
	local boneZ      = 0.0
	local boneXRot   = 0.0
	local boneYRot   = 0.0
	local boneZRot   = 0.0
	local playerPed  = GetPlayerPed(-1)
	local model      = nil
	local playerWeapons = getWeapons()
	local weapon 	 = nil
	
	for k,v in pairs(playerWeapons) do
		
		for j=1, #Config.RealWeapons, 1 do
			if Config.RealWeapons[j].name == k then
				
				bone     = Config.RealWeapons[j].bone
				boneX    = Config.RealWeapons[j].x
				boneY    = Config.RealWeapons[j].y
				boneZ    = Config.RealWeapons[j].z
				boneXRot = Config.RealWeapons[j].xRot
				boneYRot = Config.RealWeapons[j].yRot
				boneZRot = Config.RealWeapons[j].zRot
				model    = Config.RealWeapons[j].model
				weapon   = Config.RealWeapons[j].name 
				
				break

			end
		end

		local _wait = true

		SpawnObject(model, {
			x = x,
			y = y,
			z = z
		}, function(obj)
			
			local playerPed = GetPlayerPed(-1)
			local boneIndex = GetPedBoneIndex(playerPed, bone)
			local bonePos 	= GetWorldPositionOfEntityBone(playerPed, boneIndex)

			AttachEntityToEntity(obj, playerPed, boneIndex, boneX, boneY, boneZ, boneXRot, boneYRot, boneZRot, false, false, false, false, 2, true)						

			table.insert(Weapons,{weapon = weapon, obj = obj})

			_wait = false

		end)

		while _wait do
			Wait(0)
		end
    end
end