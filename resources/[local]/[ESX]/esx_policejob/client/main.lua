
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
  
PlayerData = {}
local HasAlreadyEnteredMarker = false
local LastStation             = nil
local LastPartNum             = nil
local zakuciesprawdz = false
local CurrentAction = nil
local CurrentActionMsg  = ''
local CurrentActionData = {}
local IsDragged 					= false
local IsHandcuffed = false
local HandcuffTimer = nil
local isDead = false
local CopPlayer 					= nil
local Dragging 						= nil
local CurrentTask = {}
local blokada = false
local shieldStatus = false
local playerCoords = GetEntityCoords(PlayerPedId())
ESX                           = nil

CreateThread(function()
	while ESX == nil do
		TriggerEvent('exilerp:getSharedObject', function(library)
			ESX = library
		end)
	  
		Citizen.Wait(250)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)

local playerPed = PlayerPedId()
local pID = PlayerId()
local coords = GetEntityCoords(playerPed)
local inVehicle = IsPedInAnyVehicle(playerPed, false)
local getVeh = GetVehiclePedIsIn(playerPed, false)

CreateThread(function()
	while not HasAnimDictLoaded("random@mugging3") do
        RequestAnimDict("random@mugging3")
        Citizen.Wait(200)
    end
	while true do
		Wait(500)
		playerPed = PlayerPedId()
		pID = PlayerId()
		coords = GetEntityCoords(playerPed)
		inVehicle = IsPedInAnyVehicle(playerPed, false)
		getVeh = GetVehiclePedIsIn(playerPed, false)
	end
end)

CreateThread(function()
	while PlayerData == nil do
		Citizen.Wait(500)
	end
	
	while true do
		Citizen.Wait(10000)
		
		if not PlayerData.job.name == 'police' and not PlayerData.job.name == 'offpolice' and not PlayerData.job.name == 'sheriff' and not PlayerData.job.name == 'offsheriff' then
			local armour = Citizen.InvokeNative(0x9483AF821605B1D8, playerPed)
			
			if armour > 75 then
				TriggerServerEvent('exile_logs:triggerLog', 'Has a vest over 75% without a SASP job (esx_policejob)', 'anticheat')
				Citizen.Wait(30000)			
			end
		end
	end
end)

function IsCuffed()
	return IsHandcuffed
end
  
function SetVehicleMaxMods(vehicle, livery, offroad, wheelsxd, color, extrason, extrasoff, bulletproof, tint, wheel, tuning, plate)
	local t = {
		modArmor        = 4,
		modTurbo        = true,
		modXenon        = true,
		windowTint      = 0,
		dirtLevel       = 0,
		color1			= 0,
		color2			= 0
	}
	
	if tuning then
		t.modEngine = 3
		t.modBrakes = 2
		t.modTransmission = 2
		t.modSuspension = 3
	end

	if offroad then
		t.wheelColor = 5
		t.wheels = 4
		t.modFrontWheels = 17
	end

	if wheelsxd then
		t.wheels = 1
		t.modFrontWheels = 5
	end

	if bulletproof then
		t.bulletProofTyre = true
	end

	if color then
		t.color1 = color
	end

	if tint then
		t.windowTint = tint
	end

	if wheel then
		t.wheelColor = wheel.color
		t.wheels = wheel.group
		t.modFrontWheels = wheel.type
	end
	
	ESX.Game.SetVehicleProperties(vehicle, t)

	if #extrason > 0 then
		for i=1, #extrason do
			SetVehicleExtra(vehicle, extrason[i], false)
		end
	end
	
	if #extrasoff > 0 then
		for i=1, #extrasoff do
			SetVehicleExtra(vehicle, extrasoff[i], true)
		end
	end
	  
	if livery then
		SetVehicleLivery(vehicle, livery)
	end
end
  
function cleanPlayer(playerPed)
	Citizen.InvokeNative(0xCEA04D83135264CC, playerPed, 0)
	ClearPedBloodDamage(playerPed)
	ResetPedVisibleDamage(playerPed)
	ClearPedLastWeaponDamage(playerPed)
	ResetPedMovementClipset(playerPed, 0)
end
  
function setUniform(job, playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			if Config.Uniforms[job].male ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].male)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end
		else
			if Config.Uniforms[job].female ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].female)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end
		end
	end)
end
  
function setLastUniform(clothes, playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
		TriggerEvent('skinchanger:loadClothes', skin, clothes)
	end)
end
  
function setArmour(value, playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin['bproof_1'] ~= 0 and skin['bproof_1'] ~= 10 then
			Citizen.InvokeNative(0xCEA04D83135264CC, playerPed, value)
		else
			ESX.ShowNotification("~r~Nie masz kamizelki, która ma możliwość zaaplikowania wkładów")
		end
	end)
end
  
function OpenCloakroomMenu()
	ESX.UI.Menu.CloseAll()
	local grade = PlayerData.job.grade_name
	local hasSertLicense = false

	local elements = {
		{ label = ('Civilian Uniforms'), value = 'citizen_wear' },		
	}
  
	if PlayerData.job.name == 'police' then
		table.insert(elements, {label = 'Private Uniforms', value = 'player_dressing' })
	elseif PlayerData.job.name == 'sheriff' then
		table.insert(elements, {label = 'Private Uniforms', value = 'player_dressing' })
		table.insert(elements, {label = "Sheriff Uniforms", value = 'sheriffuniforms'})
		table.insert(elements, {label = "Combat Sheriff Uniforms", value = 'combatsheriff'})
	end

	if (PlayerData.job.name == 'police' or PlayerData.job.name == 'sheriff') then
		ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
			if hasWeaponLicense then 
				table.insert(elements, {label = "H.P. Uniforms", value = 'hpuniforms'})
			end
		end, GetPlayerServerId(pID), 'hp')

		ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
			if hasWeaponLicense then 
				table.insert(elements, {label = "D.T.U. Marshal Uniforms", value = 'dtuuniforms'})
			end
		end, GetPlayerServerId(pID), 'dtu')

		ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
			if hasWeaponLicense then 
				table.insert(elements, {label = "High Command Uniforms", value = 'hcuuniforms'})
			end
		end, GetPlayerServerId(pID), 'hp')

		ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
			if hasWeaponLicense then 
				table.insert(elements, {label = "T.D. Uniforms", value = 'tduniforms'})
			end
		end, GetPlayerServerId(pID), 'td')
		
		ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
			if hasWeaponLicense then
				table.insert(elements, {label = "A.I.A.D. Uniforms", value = 'aiaduniforms'})
			end
		end, GetPlayerServerId(pID), 'aiad')
		
		ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
			if hasWeaponLicense then
				hasSertLicense = true
				table.insert(elements, {label = "S.W.A.T. Uniforms", value = 'swatuniforms'})
			end
		end, GetPlayerServerId(pID), 'swat')

		Citizen.Wait(100)
	
		table.insert(elements, {label = "Offical Patrol Uniforms", value = 'mundury1'})
		table.insert(elements, {label = "Combat Patrol Uniforms", value = 'mundury2'})
		table.insert(elements, {label = "Event Uniforms", value = 'mundury3'})
		table.insert(elements, {label = "Accessories", value = 'dodatki'})
	end
  
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = _U('cloakroom'),
		align    = 'center',
		elements = elements
	}, function(data, menu)
		cleanPlayer(playerPed)
		
		if data.current.value == 'job_wear' then
			menu.close()
		end

		if data.current.value == 'mundury1' then
			local elements2 = {
				{label = "Cadet Uniform", value = 'recruit_wear'},
				{label = "Probie Trooper Uniform", value = 'officer_wear'},
				{label = "Trooper Uniform", value = 'officer_wear2'},
				{label = "Senior Trooper Uniform", value = 'officer_wear3'},
				{label = "Sergeant Uniform", value = 'sergeant_wear'},
				{label = "Senior Sergeant Uniform", value = 'sergeant_wear2'},
				{label = "Staff Sergeant Uniform", value = 'sergeant_wear3'},
				{label = "Lieutenant Uniform", value = 'lieutenant_wear'},
				{label = "Staff Lieutenant Uniform", value = 'lieutenant_wear2'},
				{label = "Captain Uniform", value = 'captain_wear'},
				{label = "Staff Captain Uniform", value = 'captain_wear2'},
			}
			
			if PlayerData.job.grade_name == 'boss' then
				table.insert(elements, {label = "I Mundur ACOP/DCOP", value = 'chef_wear'})
				table.insert(elements, {label = "I Mundur COP", value = 'boss_wear'})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mundury1', {
				title    = "S.A.S.P. Uniforms",
				align    = 'center',
				elements = elements2
			}, function(data2, menu2)
				setUniform(data2.current.value, playerPed)
			end, function(data2, menu2)
				menu2.close()
			end)
		end
	  
		if data.current.value == 'sheriffuniforms' then
			local elements2 = {
				{label= "Cadet Uniform", value= "recruit2_wear"},
				{label = "Probie Deputy Uniform", value = 'probie_wear'},
			}
			
			if (PlayerData.job.grade >= 0 and PlayerData.job.grade < 5) or PlayerData.job.grade >= 10 then
				table.insert(elements2, {label = "Deputy Uniform", value = 'deputy_wear2'})
				table.insert(elements2, {label = "Senior Deputy Uniform", value = 'deputy_wear3'})
			end
			
			if (PlayerData.job.grade >= 0 and PlayerData.job.grade < 7) or PlayerData.job.grade >= 10 then
				table.insert(elements2, {label = "Sergeant Uniform", value = 'sergeantsh_wear'})
				table.insert(elements2, {label = "Senior Sergeant Uniform", value = 'sergeantsh_wear2'})
			end
			
			if (PlayerData.job.grade >= 0 and PlayerData.job.grade < 9) or PlayerData.job.grade >= 10 then
				table.insert(elements2, {label = "Lieutenant Uniform", value = 'lieutenantsh_wear'})
				table.insert(elements2, {label = "Senior Lieutenant Uniform", value = 'lieutenantsh_wear2'})
			end
			
			if (PlayerData.job.grade >= 0 and PlayerData.job.grade < 11) or PlayerData.job.grade >= 10 then
				table.insert(elements2, {label = "Captain Uniform", value = 'captainsh_wear'})
				table.insert(elements2, {label = "Senior Captain Uniform", value = 'captainsh_wear2'})

			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mundury1', {
				title    = "S.A.S.D. Uniforms",
				align    = 'center',
				elements = elements2
			}, function(data2, menu2)
				setUniform(data2.current.value, playerPed)
			end, function(data2, menu2)
				menu2.close()
			end)
		end

		if data.current.value == 'hpuniforms' then
			local elements2 = {
				{label = "H.P. Probie Uniform", value = 'probiehp'},
				{label = "H.P. Officer Uniform", value = 'officerhp'},
				{label = "H.P. Sergeant Uniform", value = 'sergeanthp'},
				{label = "H.P. Lieutenant Uniform", value = 'lieutenanthp'},
				{label = "H.P. Captain Uniform", value = 'captainhp'},
				{label = "H.P. Kevlar", value = 'armour'},
			}

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mundury1', {
				title    = "H.P. Uniforms",
				align    = 'center',
				elements = elements2
			}, function(data2, menu2)
				if data2.current.value == 'armour' then
					setArmour(75, playerPed)
				else
					setUniform(data2.current.value, playerPed)
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end

		if data.current.value == 'dtuuniforms' then
			local elements2 = {
				{label = "D.T.U Interview Uniform", value = 'dtu'},
				{label = "D.T.U Investigation Uniform 1", value = 'dtu1'},
				{label = "D.T.U Investigation Uniform 2", value = 'dtu2'},
				{label = "D.T.U Investigation Uniform 3", value = 'dtu3'},
				{label = "D.T.U Investigation Uniform 4", value = 'dtu4'},
				{label = "D.T.U Combat Uniform 1", value = 'dtu6'},
				{label = "D.T.U Combat Uniform 2", value = 'dtu7'},
				{label = "D.T.U Kevlar", value = 'armour'},
			}

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mundury1', {
				title    = "D.T.U. Uniforms",
				align    = 'center',
				elements = elements2
			}, function(data2, menu2)
				if data2.current.value == 'armour' then
					setArmour(75, playerPed)
				else
					setUniform(data2.current.value, playerPed)
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end

		if data.current.value == 'tduniforms' then
			local elements2 = {
				{label = "T.D. Academy Command Uniform", value = 'tdacademy2_uniform'},
				{label = "T.D. Academy Uniform", value = 'tdacademy_uniform'},
				{label = "T.D. Normal Vest", value = 'tdbullet_wear'},
			}

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mundury1', {
				title    = "T.D. Uniforms",
				align    = 'center',
				elements = elements2
			}, function(data2, menu2)
				if data2.current.value == 'armour' then
					setArmour(75, playerPed)
				else
					setUniform(data2.current.value, playerPed)
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end

		if data.current.value == 'hcuuniforms' then
			local elements2 = {
				{label = "Commander Uniform", value = 'hccommander_uniform'},
				{label = "Assistant Chief of Police Uniform", value = 'hcassistant_uniform'},
				{label = "Deputy Chief of Police Uniform", value = 'hcdeputy_uniform'},
				{label = "Chief of Police Uniform", value = 'hcchef_unifor'},
			}

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mundury1', {
				title    = "High Command Unifoms",
				align    = 'center',
				elements = elements2
			}, function(data2, menu2)
				if data2.current.value == 'armour' then
					setArmour(75, playerPed)
				else
					setUniform(data2.current.value, playerPed)
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end
		
		if data.current.value == 'aiaduniforms' then
			local elements2 = {
				{label = "Probie Inspector", value = 'inspector0'},
				{label = "Inspector I", value = 'inspector1'},
				{label = "Inspector II", value = 'inspector2'},
				{label = "Inspector III", value = 'inspector3'},
			}

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mundury5', {
				title    = "A.I.A.D. Uniforms",
				align    = 'center',
				elements = elements2
			}, function(data2, menu2)
				setUniform(data2.current.value, playerPed)
			end, function(data2, menu2)
				menu2.close()
			end)
		end

		if data.current.value == 'swatuniforms' then
			local elements2 = {
				{label = "S.W.A.T. Special Alfa Uniform", value = 'swat_david1'},
				{label = "S.W.A.T. Special Bravo Uniform", value = 'swat_david2'},
				{label = "S.W.A.T. Special Charlie Uniform", value = 'swat_david3'},
				{label = "S.W.A.T. Special Delta Uniform", value = 'swat_david4'},
				{label = "S.W.A.T. Light Alfa Uniform", value = 'swat_koszulka1'},
				{label = "S.W.A.T. Light Bravo Uniform", value = 'swat_koszulka2'},
				{label = "S.W.A.T. Light Charlie Uniform", value = 'swat_koszulka3'},
				{label = "S.W.A.T. Light Delta Uniform", value = 'swat_koszulka4'},
				{label = "S.W.A.T. Normal Heavy Uniform", value = 'swat_wear4'},
				{label = "S.W.A.T. Long Light Uniform", value = 'swat_wear2'},
				{label = "S.W.A.T. Combat Uniform", value = 'swat_wear3'},
				{label = "S.W.A.T. Heavy Kevlar", value = 'armor_sert'},
			}

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mundury7', {
				title    = "S.W.A.T. Uniforms",
				align    = 'center',
				elements = elements2
			}, function(data2, menu2)
				if data2.current.value ~= 'armor_sert' then
					setUniform(data2.current.value, playerPed)
				end
				if data2.current.value == 'armor_sert' then
					setArmour(100, playerPed)
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end
	  
		if data.current.value == 'combatsheriff' then
			local elements2 = {}
			
			if PlayerData.job.grade >= 4 then
				table.insert(elements2, {label = "Sheriff Combat Uniform Sergeant", value = 'sheriff_patrol'})
			end
			
			if PlayerData.job.grade >= 7 then
				table.insert(elements2, {label = "Sheriff Combat Uniform Lieutenant", value = 'sheriff_patrol3'})
			end
			
			if PlayerData.job.grade >= 9 then
				table.insert(elements2, {label = "Sheriff Combat Uniform Capitan", value = 'sheriff_patrol4'})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mundury2', {
				title    = "Combat S.A.S.D. Uniforms",
				align    = 'center',
				elements = elements2
			}, function(data2, menu2)
				setUniform(data2.current.value, playerPed)
			end, function(data2, menu2)
				menu2.close()
			end)
		end
	  
		if data.current.value == 'mundury2' then
			local elements2 = {
				{label = "Combat Uniform Sergeant", value = 'police_patrol'},
				{label = "Combat Uniform Lieutenant", value = 'police_patrol3'},
				{label = "Combat Uniform Capitan", value = 'police_patrol4'},
			}

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mundury2', {
				title    = "Combat S.A.S.P. Uniforms",
				align    = 'center',
				elements = elements2
			}, function(data2, menu2)
				setUniform(data2.current.value, playerPed)
			end, function(data2, menu2)
				menu2.close()
			end)
		end

		if data.current.value == 'mundury3' then
  
			local elements2 = {
				{label = "Official Uniform", value = 'oficjalny_wear'},
				{label = "Motorcycle Uniform", value = 'motocykl_wear'},
				{label = "K-9 Uniform", value = 'k9_wear'},
			}

			ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
				if hasWeaponLicense then
					table.insert(elements2, {label = "Diver Uniform", value = 'nurek_wear'})
				end
				
				if PlayerData.job.name == 'sheriff' then
					table.insert(elements2, {label = "Sheriff Official Uniform", value = 'sheriff_official'})
					table.insert(elements2, {label = "Sheriff Motorcycle Uniform", value = 'motocyklsheriff_wear'})
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mundury3', {
					title    = "Event Uniforms",
					align    = 'center',
					elements = elements2
				}, function(data2, menu2)
					setUniform(data2.current.value, playerPed)
				end, function(data2, menu2)
					menu2.close()
				end)		
			end, GetPlayerServerId(pID), 'nurek')
		end

		if data.current.value == 'dodatki' then
			local elements2 = {
				{label = "Reflective Vest", value = 'gilet_wear'},
				{label = "Heavy Bag", value = 'torba_wear'},
			}
		  
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dodatki', {
				title    = "Addons Uniforms",
				align    = 'center',
				elements = elements2
			}, function(data2, menu2)
				if data2.current.value == 'armour' then
					setArmour(75, playerPed)
				else
					setUniform(data2.current.value, playerPed)
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end

		if data.current.value == 'player_dressing' then
			ESX.TriggerServerCallback('esx_property:getPlayerDressing', function(dressing)
				local elements = {}

				for i=1, #dressing, 1 do
					table.insert(elements, {
						label = dressing[i],
						value = i
					})
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing', {
					title    = "Private Uniforms",
					align    = 'center',
					elements = elements
				}, function(data2, menu2)
					TriggerEvent('skinchanger:getSkin', function(skin)
						ESX.TriggerServerCallback('esx_property:getPlayerOutfit', function(clothes)
							TriggerEvent('skinchanger:loadClothes', skin, clothes)
							TriggerEvent('esx_skin:setLastSkin', skin)

							TriggerEvent('skinchanger:getSkin', function(skin)
								TriggerServerEvent('esx_skin:save', skin)
							end)
						end, data2.current.value)
					end)
				end, function(data2, menu2)
					menu2.close()
				end)
			end)
		end
	  
		if data.current.value == 'citizen_wear' then
			menu.close()
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
		end

		if
			data.current.value == 'recruit_wear' or
			data.current.value == 'recruitszeryf_wear' or
			data.current.value == 'officer_wear' or
			data.current.value == 'officer_wear2' or
			data.current.value == 'officerszeryf_wear' or
			data.current.value == 'sergeant_wear' or
			data.current.value == 'sergeant_wear2' or
			data.current.value == 'sergeantszeryf_wear' or
			data.current.value == 'intendent_wear' or
			data.current.value == 'intendent_wear2' or
			data.current.value == 'intendentszeryf_wear' or
			data.current.value == 'lieutenant_wear' or
			data.current.value == 'lieutenant_wear2' or
			data.current.value == 'lieutenantszeryf_wear' or
			data.current.value == 'captain_wear' or
			data.current.value == 'captain_wear2' or
			data.current.value == 'chef_wear' or
			data.current.value == 'chefszeryf_wear' or
			data.current.value == 'boss_wear' or
			data.current.value == 'bossszeryf_wear' or
			data.current.value == 'sert_wear' or
			data.current.value == 'k9_wear' or
			data.current.value == 'police_patrol2' or
			data.current.value == 'police_patrol3' or
			data.current.value == 'oficjalny_wear' or
			data.current.value == 'motocykl_wear' or
			data.current.value == 'motocyklsheriff_wear' or
			data.current.value == 'nurek_wear' or
			data.current.value == 'sert2_wear' or
			data.current.value == 'bullet_wear' or
			data.current.value == 'bullet2_wear' or
			data.current.value == 'torba_wear' or
			data.current.value == 'gilet_wear' or
			data.current.value == 'gilet2_wear'
		then
			setUniform(data.current.value, playerPed)
		end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	end)
end
  
function OpenVehicleSpawnerMenu(partNum)
	local vehicles = Config.PoliceStations.Vehicles
	
	ESX.UI.Menu.CloseAll()
	local elements = {}
	local found = true
	for i, group in ipairs(Config.VehicleGroups) do
		local elements2 = {}
		
		for _, vehicle in ipairs(Config.AuthorizedVehicles) do
			local let = false
			for _, group in ipairs(vehicle.groups) do
				if group == i then
					let = true
					break
				end
			end

			if let then
				if vehicle.grade then
					if vehicle.hidden == true then
						if i ~= 5 then
							if not CanPlayerUseHidden(vehicle.grade) then
								let = false
							end
						else
							if not CanPlayerUseHidden(vehicle.grade) and not CanPlayerUse(vehicle.grade) then
								let = false
							end
						end
					else
						if not CanPlayerUse(vehicle.grade) then
							let = false
						end
					end
				elseif vehicle.grades and #vehicle.grades > 0 then
					let = false
					for _, grade in ipairs(vehicle.grades) do
						if ((vehicle.swat and IsSWAT) or grade == PlayerData.job.grade) and (not vehicle.label:find('SEU') or IsSEU) then
							let = true
							break
						end
					end
				end

				if let or (PlayerData.job.name == 'police' and PlayerData.job.grade >= 10) or (PlayerData.job.name == 'sheriff' and PlayerData.job.grade >= 11) then
					table.insert(elements2, { label = vehicle.label, model = vehicle.model, livery = vehicle.livery, extrason = vehicle.extrason, extrasoff = vehicle.extrasoff, offroad = vehicle.offroad, wheelsxd = vehicle.wheelsxd, color = vehicle.color, plate = vehicle.plate, tint = vehicle.tint, bulletproof = vehicle.bulletproof, wheel = vehicle.wheel, tuning = vehicle.tuning })
				end
			end
		end
			
		if (PlayerData.job.name == 'police' and PlayerData.job.grade >= 10) or (PlayerData.job.name == 'sheriff' and PlayerData.job.grade >= 11) then
			if #elements2 > 0 then
				table.insert(elements, {label = group, value = elements2, group = i})				
			end
		else
			if i == 5 then
				found = false
				ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
					if hasWeaponLicense then
						table.insert(elements, { label = group, value = elements2, group = i })
					end
					
					found = true
				end, GetPlayerServerId(pID), 'seu')
			elseif i == 6 then
				found = false
				ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
					if hasWeaponLicense then
						table.insert(elements, { label = group, value = elements2, group = i })
					end
					
					found = true
				end, GetPlayerServerId(pID), 'dtu')
			elseif i == 8 then
				if PlayerData.job.name == 'sheriff' then
					table.insert(elements, { label = group, value = elements2, group = i })
				end
			elseif i == 10 then
				found = false
				ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
					if hasWeaponLicense then
						table.insert(elements, { label = group, value = elements2, group = i })
					end
					found = true
				end, GetPlayerServerId(pID), 'hp')
			elseif i == 11 then
				found = false
				ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
					if hasWeaponLicense then
						table.insert(elements, { label = group, value = elements2, group = i })
					end
					found = true
				end, GetPlayerServerId(pID), 'hp')
			elseif i == 12 then
				found = false
				ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
					if hasWeaponLicense then
						table.insert(elements, { label = group, value = elements2, group = i })
					end
					
					found = true
				end, GetPlayerServerId(pID), 'aiad')
			elseif i == 13 then
				found = false
				ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
					if hasWeaponLicense then
						table.insert(elements, { label = group, value = elements2, group = i })
					end
					
					found = true
				end, GetPlayerServerId(pID), 'swat')
			else
				table.insert(elements, { label = group, value = elements2, group = i })
			end
		end
	end
	
	while not found do
		Citizen.Wait(100)
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner', {
	  title    = _U('vehicle_menu'),
	  align    = 'center',
	  elements = elements
	}, function(data, menu)
		menu.close()
		if type(data.current.value) == 'table' and #data.current.value > 0 then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner_' .. data.current.group, {
				title    = data.current.label,
				align    = 'center',
				elements = data.current.value
			}, function(data2, menu2)
				local livery = data2.current.livery
				local extrason = data2.current.extrason
				local extrasoff = data2.current.extrasoff
				local offroad = data2.current.offroad
				local wheelsxd = data2.current.wheelsxd
				local color = data2.current.color
				local bulletproof = data2.current.bulletproof or false
				local tint = data2.current.tint
				local wheel = data2.current.wheel
				local tuning = data2.current.tuning

				local setPlate = true
				if data2.current.plate ~= nil and not data2.current.plate then
					setPlate = false
				end

				local vehicle = GetClosestVehicle(vehicles[partNum].spawnPoint.x,  vehicles[partNum].spawnPoint.y,  vehicles[partNum].spawnPoint.z, 3.0, 0, 71)
				if not DoesEntityExist(vehicle) then
					if Config.MaxInService == -1 then
						ESX.Game.SpawnVehicle(data2.current.model, {
							x = vehicles[partNum].spawnPoint.x,
							y = vehicles[partNum].spawnPoint.y,
							z = vehicles[partNum].spawnPoint.z
						}, vehicles[partNum].heading, function(vehicle)
							SetVehicleMaxMods(vehicle, livery, offroad, wheelsxd, color, data2.current.extrason, data2.current.extrasoff, bulletproof, tint, wheel, tuning)
							
							if setPlate then
								local plate = ""
								if data.current.label == 'UNMARKED' then
									plate = math.random(100, 999) .. "UM" .. math.random(100, 999)
								elseif data.current.label == 'HP UNMARKED' then
									plate = math.random(100, 999) .. "UM" .. math.random(100, 999)
								elseif PlayerData.job.name == 'sheriff' then
									plate = "SASD " .. math.random(100,999)
								elseif PlayerData.job.name == 'hwp' then
									plate = "SAHP " .. math.random(100,999)
								else
									plate = "SASP " .. math.random(100,999)
								end
								
								SetVehicleNumberPlateText(vehicle, plate)
								local localVehPlate = string.lower(GetVehicleNumberPlateText(vehicle))
								TriggerEvent('ls:dodajklucze2', localVehPlate)
								TriggerServerEvent("exilerp_temp:setPolicePlate", localVehPlate)
							else
								local localVehPlate = string.lower(GetVehicleNumberPlateText(vehicle))
								TriggerEvent('ls:dodajklucze2', localVehPlate)
								TriggerServerEvent("exilerp_temp:setPolicePlate", localVehPlate)
							end

							TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
						end)
					else
						ESX.Game.SpawnVehicle(data2.current.model, {
							x = vehicles[partNum].spawnPoint.x,
							y = vehicles[partNum].spawnPoint.y,
							z = vehicles[partNum].spawnPoint.z
						}, vehicles[partNum].heading, function(vehicle)
							SetVehicleMaxMods(vehicle, livery, offroad, wheelsxd, color, data2.current.extrason, data2.current.extrasoff, bulletproof, tint, wheel, tuning)
						 
							if setPlate then
								local plate = ""
								
								if data.current.label == 'UNMARKED' then
									plate = math.random(100, 999) .. "UM" .. math.random(100, 999)
								elseif PlayerData.job.name == 'sheriff' then
									plate = "SASD " .. math.random(100,999)
								else
									plate = "SASP " .. math.random(100,999)
								end
								
								SetVehicleNumberPlateText(vehicle, plate)
								local localVehPlate = string.lower(GetVehicleNumberPlateText(vehicle))
								TriggerEvent('ls:dodajklucze2', localVehPlate)
								TriggerServerEvent("exilerp_temp:setPolicePlate", localVehPlate)
							else
								local localVehPlate = string.lower(GetVehicleNumberPlateText(vehicle))
								TriggerEvent('ls:dodajklucze2', localVehPlate)
								TriggerServerEvent("exilerp_temp:setPolicePlate", localVehPlate)
							end

							TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
						end)
					end
				else
					ESX.ShowNotification('Pojazd znaduje się w miejscu wyciągnięcia następnego')
				end
			end, function(data2, menu2)
				menu.close()
				OpenVehicleSpawnerMenu(partNum)
			end)
		else
			ESX.ShowNotification("~r~Brak pojazdów w tej kategorii")
		end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'menu_vehicle_spawner'
		CurrentActionMsg  = _U('vehicle_spawner')
		CurrentActionData = {station = station, partNum = partNum}
	end)
end
  
  
function OpenLodzieSpawnerMenu(partNum)
	local lodzie = Config.PoliceStations.Lodzie
	ESX.UI.Menu.CloseAll()
	
	local elements = {}
	for i, group in ipairs(Config.LodzieGroups) do
		if (i ~= 10 and i ~= 6) or (i == 10 and IsSheriff) or (i == 6 and IsSEU) then
			local elements2 = {}
			for _, lodz in ipairs(Config.AuthorizedLodzie) do
				local let = false
				for _, group in ipairs(lodz.groups) do
					if group == i then
						let = true
						break
					end
				end

				if let then
					if lodz.grade then
						if not CanPlayerUse(lodz.grade) or (lodz.label:find('SEU') and not IsSEU) then
							let = false
						end
					elseif lodz.grades and #lodz.grades > 0 then
						let = false
						for _, grade in ipairs(lodz.grades) do
							if ((lodz.swat and IsSWAT) or grade == PlayerData.job.grade) and (not lodz.label:find('SEU') or IsSEU) then
								let = true
								break
							end
						end
					end

					if let or (PlayerData.job.name == 'police' and PlayerData.job.grade >= 10) or (PlayerData.job.name == 'sheriff' and PlayerData.job.grade >= 11) then
						table.insert(elements2, { label = lodz.label, model = lodz.model, livery = lodz.livery, offroad = lodz.offroad, wheelsxd = lodz.wheelsxd, color = lodz.color, extrason = lodz.extrason, extrasoff = lodz.extrasoff, plate = lodz.plate, tint = lodz.tint, bulletproof = lodz.bulletproof, wheel = lodz.wheel, tuning = lodz.tuning })
					end
				end
			end

			if #elements2 > 0 then
				table.insert(elements, { label = group, value = elements2, group = i })
			end
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'lodzie_spawner', {
		title    = _U('lodzie_menu'),
		align    = 'center',
		elements = elements
	}, function(data, menu)
		menu.close()
		if type(data.current.value) == 'table' and #data.current.value > 0 then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'lodzie_spawner_' .. data.current.group, {
				title    = data.current.label,
				align    = 'center',
				elements = data.current.value
			}, function(data2, menu2)
					local livery = data2.current.livery
					local offroad = data2.current.offroad
					local wheelsxd = data2.current.wheelsxd
					local color = data2.current.color
					local extrason = data2.current.extrason
					local extrasoff = data2.current.extrasoff
					local bulletproof = data2.current.bulletproof or false
					local tint = data2.current.tint
					local wheel = data2.current.wheel
					local tuning = data2.current.tuning

					local setPlate = true
					if data2.current.plate ~= nil and not data2.current.plate then
						setPlate = false
					end

					local lodz = GetClosestVehicle(lodzie[partNum].spawnPoint.x,  lodzie[partNum].spawnPoint.y,  lodzie[partNum].spawnPoint.z, 3.0, 0, 71)
					if not DoesEntityExist(lodz) then

						ESX.Game.SpawnVehicle(data2.current.model, {
							x = lodzie[partNum].spawnPoint.x,
							y = lodzie[partNum].spawnPoint.y,
							z = lodzie[partNum].spawnPoint.z
						}, lodzie[partNum].heading, function(lodz)
							SetVehicleMaxMods(lodz, livery, offroad, wheelsxd, color, extrason, extrasoff, bulletproof, tint, wheel, tuning)
							
							if setPlate then
								if data.current.label == 'UNMARKED' then
									plate = math.random(100, 999) .. "UM" .. math.random(100, 999)
								elseif PlayerData.job.name == 'sheriff' then
									plate = "SASD " .. math.random(100,999)
								else
									plate = "SASP " .. math.random(100,999)
								end
								
								SetVehicleNumberPlateText(lodz, plate)
								local localVehPlate = string.lower(GetVehicleNumberPlateText(lodz))
								TriggerEvent('ls:dodajklucze2', localVehPlate)
								TriggerServerEvent("exilerp_temp:setPolicePlate", localVehPlate)
							else
								local localVehPlate = string.lower(GetVehicleNumberPlateText(lodz))
								TriggerEvent('ls:dodajklucze2', localVehPlate)
								TriggerServerEvent("exilerp_temp:setPolicePlate", localVehPlate)
							end

							TaskWarpPedIntoVehicle(playerPed,  lodz,  -1)
						end)
					else
						ESX.ShowNotification('Pojazd znaduje się w miejscu wyciągnięcia następnego')
					end
			end, function(data2, menu2)
				menu.close()
				OpenLodzieSpawnerMenu(partNum)
			end)
		end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'menu_lodzie_spawner'
		CurrentActionMsg  = _U('lodzie_spawner')
		CurrentActionData = {station = station, partNum = partNum}
	end)
end

function LokalnyOutOfCar(ped) 
	if IsPedSittingInAnyVehicle(ped) then
		local vehicle = GetVehiclePedIsIn(ped, false)
		TaskLeaveVehicle(ped, vehicle, 16)
		RequestAnimDict('mp_arresting')
		while not HasAnimDictLoaded('mp_arresting') do
			Citizen.Wait(0)
		end

		TaskPlayAnim(ped, 'mp_arresting', 'idle', 8.0, 1.0, -1, 49, 0.0, 0, 0, 0)
		CreateThread(function() 
			Citizen.Wait(300)
			ClearPedTasksImmediately(ped)
			FreezeEntityPosition(ped, true)
		end)
	end
end

function PutLokalnyInCar(ped) 
	local vehicle = nil
	if IsPedInAnyVehicle(ped, false) then
		vehicle = GetVehiclePedIsIn(ped, false)
	else
		vehicle = ESX.Game.GetVehicleInDirection()
		if not vehicle then
			local coords = GetEntityCoords(ped, false)
			if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
				vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
			end
		end
	end

	if vehicle and vehicle ~= 0 then
		local maxSeats =  GetVehicleMaxNumberOfPassengers(vehicle)
		if maxSeats >= 0 then
			local freeSeat
			for i = (maxSeats - 1), 0, -1 do
				if IsVehicleSeatFree(vehicle, i) then
					freeSeat = i
					break
				end
			end

			if freeSeat ~= nil then		
				ClearPedTasksImmediately(ped)			
				local tick = 20
				repeat
					TaskWarpPedIntoVehicle(ped, vehicle, freeSeat)
					tick = tick - 1
					Citizen.Wait(50)
				until IsPedInAnyVehicle(ped, false) or tick == 0
			end
		end
	end
end

function CuffLokalny(ped) 
	RequestAnimDict('mp_arresting')
	while not HasAnimDictLoaded('mp_arresting') do
		Citizen.Wait(0)
	end

	if not IsEntityPlayingAnim(ped, 'mp_arresting', 'idle', 3) then
		TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "Cuff", 0.5)
		TaskPlayAnim(ped, 'mp_arresting', 'idle', 8.0, 1.0, -1, 49, 0.0, 0, 0, 0)
		SetEnableHandcuffs(ped, true)
		TaskSetBlockingOfNonTemporaryEvents(ped, true)
		TaskStandStill(ped, 500 * 1000)
		CreateThread(function() 
			while IsPedCuffed(ped) do
				if not IsEntityPlayingAnim(ped, 'mp_arresting', 'idle', 3) then
					TaskPlayAnim(ped, 'mp_arresting', 'idle', 8.0, 1.0, -1, 49, 0.0, 0, 0, 0)
				end
				Citizen.Wait(200)
			end
		end)
	else
		TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "Uncuff", 0.5)
		UnCuffLokalny(ped)
	end
end
function UnCuffLokalny(ped) 
	SetEnableHandcuffs(ped, false)
	Citizen.Wait(100)
	ClearPedTasksImmediately(ped)
	FreezeEntityPosition(ped, false)
	DetachEntity(ped, true, false)
	TaskSetBlockingOfNonTemporaryEvents(ped, false)
	TaskReactAndFleePed(ped, playerPed)
	Dragging = nil
	DraggingLokal = false
end

local DraggingLokal = false

function DragLokalny(ped) 
	if DraggingLokal and DoesEntityExist(DraggingLokal) then
		ESX.ShowNotification("~r~Puszczono lokalnego")
		DetachEntity(DraggingLokal, true, false)
		FreezeEntityPosition(ped, false)
		TaskSetBlockingOfNonTemporaryEvents(DraggingLokal, true)
		TaskStandStill(DraggingLokal, 500 * 1000)
		Dragging = nil
		DraggingLokal = false
		return
	end
	if not Dragging then
		DraggingLokal = ped
		Dragging = ped
		FreezeEntityPosition(ped, true)
		AttachEntityToEntity(ped, playerPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
		ESX.ShowNotification("~r~Chwycono lokalnego")
		TaskSetBlockingOfNonTemporaryEvents(ped, true)
		TaskStandStill(ped, 500 * 1000)
		CreateThread(function() 
			while DoesEntityExist(ped) do
				Citizen.Wait(1000)
				if IsEntityPlayingAnim(ped, 'mp_arresting', 'idle', 3) or DraggingLokal then
					TaskSetBlockingOfNonTemporaryEvents(ped, true)
					TaskStandStill(ped, 500 * 1000)
				end
			end
			Dragging = nil
			DraggingLokal = false
			DetachEntity(ped, true, false)
			FreezeEntityPosition(ped, true)
		end)
	end
end


function HandcuffMenu()
	ESX.UI.Menu.CloseAll()
	  
	local elements = {}
	if (PlayerData.job.name == 'police' or PlayerData.job.name == 'sheriff') then
		table.insert(elements, {label = "Zakuj/Rozkuj",      value = 'handcuff'})
		table.insert(elements, {label = "Zakuj/Rozkuj agresywnie", value = 'agresivehandcuff'})			
	else
		table.insert(elements, {label = "Zakuj/Rozkuj",      value = 'handcuff'})
	end
	
	table.insert(elements, {label = "Przenieś",      value = 'drag'})
	table.insert(elements, {label = "Przeszukaj",    value = 'body_search'})
	table.insert(elements, {label = "Ściągnij/Załóż ubrania",	value = 'clothes'})
	table.insert(elements, {label = "Włóż do pojazdu",  value = 'put_in_vehicle'})
	table.insert(elements, {label = "Wyciągnij z pojazdu", value = 'out_the_vehicle'})
	table.insert(elements, {label = "Włóż do bagażnika",	value = 'bagol1'})
	table.insert(elements, {label = "Wyciągnij z bagażnika",	value = 'bagol2'})
	table.insert(elements, {label = "Zabierz i ubierz ubranie",	value = 'przebieranko'})
	
	if (PlayerData.job.name == 'police' or PlayerData.job.name == 'sheriff') then
		table.insert(elements, {label = _U('licencja'), value = 'license1'})
		table.insert(elements, {label = _U('GSR-test'), value = 'gsr'})
		table.insert(elements, {label = _U('license_check'), value = 'license' })
		table.insert(elements, {label = "Sprawdź dokumenty",      value = 'identity_card'})
		table.insert(elements, {label = "Wyszukaj w tablecie",      value = 'open_tablet'})
	end

	if PlayerData.job.name == 'ambulance' then
		table.insert(elements, {label = "Sprawdź dokumenty",      value = 'identity_card'})
	end
	
	ESX.UI.Menu.Open( 'default', GetCurrentResourceName(), 'citizen_interaction', {
		title    = "Kajdanki",
		align    = 'center',
		elements = elements
	}, function(data, menu)
		local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
		local closestPed, closestDistancee = ESX.Game.GetClosestPed()
		if (closestPlayer ~= -1 and closestDistance <= 3.0) or (closestPed ~= -1 and closestDistancee <= 3.0) then
			local action = data.current.value
			local targetPed = nil
			local isPlayer = false
			if closestPlayer ~= -1 and closestDistance <= 3.0 then
				targetPed = Citizen.InvokeNative(0x43A66C31C68491C0, closestPlayer)
				isPlayer = true
			elseif closestPed ~= -1 and closestDistancee <= 3.0 then
				targetPed = closestPed
			else
				return
			end
			local hasAnim1 = IsEntityPlayingAnim(targetPed, "missminuteman_1ig_2", "handsup_enter", 3)
			local hasAnim2 = IsEntityPlayingAnim(targetPed, "random@arrests@busted", "enter", 3)
			local hasAnimrece = IsEntityPlayingAnim(targetPed, "random@mugging3", "handsup_standing_base", 3)

			if action == 'handcuff' then
				if not exports['esx_property']:isProperty() then
					if not IsPedCuffed(targetPed) then
						if not CanCuff(targetPed) then
							ESX.ShowNotification("~r~Osoba którą próbujesz zakuć/odkuć nie ma rąk w górze")
							return
						end
					end	
					Citizen.InvokeNative(0xBC045625, targetPed)
					animacjazakuciarozkuciaxd()
					Citizen.Wait(650)
					if isPlayer then
						TriggerServerEvent('xlem0n_policejob:handcuffhype', GetPlayerServerId(closestPlayer))
						ESX.ShowNotification('~o~Zakułeś/Odkułeś ~g~[' .. GetPlayerServerId(closestPlayer) ..']')
					end
					if not isPlayer then
						CuffLokalny(targetPed)
						ESX.ShowNotification('~o~Zakuto/rozkuto lokalnego')
					end	
				end
			elseif action == 'open_tablet' then
				TriggerEvent("exilerpMdc:openCitizen", GetPlayerServerId(closestPlayer))
			elseif action == 'agresivehandcuff' then
				
				if not IsPedCuffed(targetPed) then
					local target, distance = ESX.Game.GetClosestPlayer()
					
					local playerheading = GetEntityHeading(playerPed)
					local playerlocation = GetEntityForwardVector(playerPed)
					
					local target_id = GetPlayerServerId(target)
					if distance <= 2.0 then
						zakuciesprawdz = true
						TriggerServerEvent('esx_policejob:requestarrest', target_id, playerheading, coords, playerlocation)
						ESX.ShowNotification('~o~Zakułeś ~g~[' .. GetPlayerServerId(closestPlayer) ..']')
					else
						ESX.ShowNotification("~r~Brak osób w pobliżu")
					end				
				else
					local target, distance = ESX.Game.GetClosestPlayer()
					
					local playerheading = GetEntityHeading(playerPed)
					local playerlocation = GetEntityForwardVector(playerPed)					
					local target_id = GetPlayerServerId(target)
					if distance <= 2.0 then
						zakuciesprawdz = false
						animacjazakuciarozkuciaxd()
						TriggerServerEvent('xlem0n_policejob:handcuffhype', GetPlayerServerId(closestPlayer))
					else
						ESX.ShowNotification("~r~Brak osób w pobliżu")
					end				
				end	
			elseif action == 'identity_card' then
				OpenIdentityCardMenu(closestPlayer)
			elseif action == 'body_search' then
				if IsPedCuffed(targetPed) then
					if IsPedCuffed(targetPed) or hasAnim1 or hasAnim2 and not IsPlayerDead(closestPlayer) then
						if isPlayer then
							Citizen.Wait(1)
							TriggerServerEvent('xlem0n_policejob:message', GetPlayerServerId(closestPlayer), _U('being_searched'))
							TriggerServerEvent('exile_logs:triggerLog', "Przeszukiwanie gracza " .. GetPlayerServerId(closestPlayer), 'handcuffs', '3066993')
							OpenBodySearchMenu(closestPlayer)
						else
							ESX.ShowNotification('~r~Nie możesz przeszukać lokalnego!')
						end	
					end
				end
			elseif action == 'drag' then
					if IsPedCuffed(targetPed) then
						if isPlayer then
							TriggerServerEvent('esx_policejob:drag', GetPlayerServerId(closestPlayer))
						else
							DragLokalny(targetPed)
						end
					end
			elseif action == 'put_in_vehicle' then
				if IsPedCuffed(targetPed) then
					if isPlayer then
						if Dragging then
							TriggerServerEvent('esx_policejob:drag', Dragging)
						end	
						TriggerServerEvent('xlem0n_policejob:putInVehicle', GetPlayerServerId(closestPlayer))
					else
						if DraggingLokal then
						DragLokalny(targetPed)
						end	
						PutLokalnyInCar(targetPed)
					end	
				end
			elseif action == 'przebieranko' then
				if IsPedCuffed(targetPed) then
					if isPlayer then
						local SelectedPlayer = closestPlayer
						przebieranko(SelectedPlayer)
					else
						ESX.ShowNotification('~r~Nie możesz przebrać się za lokalnego')
					end
				end
			elseif action == 'out_the_vehicle' then
				if IsPedCuffed(targetPed) then
					if isPlayer then
						TriggerServerEvent('xlem0n_policejob:OutVehicle', GetPlayerServerId(closestPlayer))
					else
						LokalnyOutOfCar(targetPed)
					end	
				end
			elseif action == 'bagol1' then
				if IsPedCuffed(targetPed) then
					if isPlayer then 
						if Dragging then
							TriggerServerEvent('esx_policejob:drag', Dragging)
						end			
						TriggerServerEvent('exile:putTargetInTrunk', GetPlayerServerId(closestPlayer))
					else
						ESX.ShowNotification('~r~Nie możesz wsadzić lokalnego do bagażnika')
					end
				end
			elseif action == 'bagol2' then
				if IsPedCuffed(targetPed) then
					if isPlayer then
						TriggerServerEvent('exile:outTargetFromTrunk', GetPlayerServerId(closestPlayer))
					else
						ESX.ShowNotification('~r~Nie możesz wyciągnąć lokalnego z bagażnika')
					end	
				end
			elseif action == 'clothes' then
			
				if IsPedCuffed(targetPed) then
					if not isPlayer then 
						ESX.ShowNotification('~r~Nie możesz rozebrać lokalnego')
					else
						menu.close()
					
						local elements2 = {
							{label = 'Maska', value = 'mask'},
							{label = 'Czapka / Hełm', value = 'hat'},
							{label = 'Okulary', value = 'glasses'},
							{label = 'Łańcuch / Krawat / Plakietka', value = 'chain'},
							{label = 'Lewa ręka / Zegarek', value = 'zegarek'},
							{label = 'Prawa ręka', value = 'branzoleta'},
							{label = 'Tułów', value = 'coat'},
							{label = 'Nogi', value = 'legs'},
							{label = 'Stopy', value = 'shoes'},
							{label = 'Torba / Plecak', value = 'bag'},
							{label = 'Kamizelka', value = 'kamizelka'},
						}

						ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_clothes', {
							title    = 'Kajdanki - Ubrania',
							align    = 'center',
							elements = elements2
						}, function(data2, menu2)
							if data2.current.value ~= nil then
								TriggerServerEvent('esx_ciuchy:takeoff', data2.current.value, GetPlayerServerId(closestPlayer))
							end
						end, function(data2, menu2)
							menu2.close()
							menu.open()
						end)
					end
				end
			elseif action == 'license' then
				if IsPedCuffed(targetPed) then
					if isPlayer then
						ShowPlayerLicense(closestPlayer)
					else
						ESX.ShowNotification('~r~Nie możesz zobaczyć licencji lokalnego')
					end	
				end
			elseif action == 'unpaid_bills' then
				if IsPedCuffed(targetPed) then
					if isPlayer then 
						OpenUnpaidBillsMenu(closestPlayer)
					else
						ESX.ShowNotification('~r~Nie możesz sprawdzić rachunków lokalnego')
					end
				end
			elseif action == 'license1' then
				if IsPedCuffed(targetPed) then
					if isPlayer then
						TriggerServerEvent('xlem0n_policejob:DajLicencje', GetPlayerServerId(closestPlayer))
						TriggerServerEvent('xlem0n_policejob:message', GetPlayerServerId(closestPlayer), _U('otrzymano_licka'))
						ESX.ShowNotification(_U('nadano_licka'))
					else
						ESX.ShowNotification('~r~Nie możesz nadać licencji na broń lokalnemu')
					end
				end
			elseif action == 'gsr' then
				if isPlayer then
					TriggerServerEvent('xlem0n_policejob:message', GetPlayerServerId(closestPlayer), "~y~Funkcjonariusz~w~ sprawdza ~b~proch~w~ na twoich dłoniach")
					ESX.ShowNotification("Sprawdzanie dłoni pod kątem prochu...")
					TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_KNEEL", 0, true)
					if DecorExistOn(Citizen.InvokeNative(0x43A66C31C68491C0, closestPlayer), 'Gunpowder') then
						ESX.ShowNotification("~r~Wykryto proch na dłoniach!")
					else
						ESX.ShowNotification("~g~Nie wykryto prochu na dłoniach.")
					end
				else
					ESX.ShowNotification('~r~Nie możesz sprawdzić prochu lokalnemu')
				end
			end
		else
			local action = data.current.value
			if action == "body_search" then
				BodySearchOffline()
			else	
				ESX.ShowNotification(_U('no_players_nearby'))
			end
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenIdentityCardMenu(player)
  
	ESX.TriggerServerCallback('xlem0n_policejob:getOtherPlayerData', function(data)

		local elements    = {}
		local nameLabel   = _U('name', data.name)
		local jobLabel    = nil
		local sexLabel    = nil
		local dobLabel    = nil
		local heightLabel = nil
		local idLabel     = nil
	
		if data.job.grade_label ~= nil and  data.job.grade_label ~= '' then
			jobLabel = _U('job', data.job.label .. ' - ' .. data.job.grade_label)
		else
			jobLabel = _U('job', data.job.label)
		end
	
		if Config.EnableESXIdentity then
	
			nameLabel = _U('name', data.firstname .. ' ' .. data.lastname)
	
			if data.sex ~= nil then
				if string.lower(data.sex) == 'm' then
					sexLabel = _U('sex', _U('male'))
				else
					sexLabel = _U('sex', _U('female'))
				end
			else
				sexLabel = _U('sex', _U('unknown'))
			end
	
			if data.dob ~= nil then
				dobLabel = _U('dob', data.dob)
			else
				dobLabel = _U('dob', _U('unknown'))
			end
	
			if data.height ~= nil then
				heightLabel = _U('height', data.height)
			else
				heightLabel = _U('height', _U('unknown'))
			end
	
			if data.name ~= nil then
				idLabel = _U('id', data.name)
			else
				idLabel = _U('id', _U('unknown'))
			end
	
		end
	
		local elements = {
			{label = nameLabel, value = nil},
			{label = jobLabel,  value = nil},
		}
	
		if Config.EnableESXIdentity then
			table.insert(elements, {label = sexLabel, value = nil})
			table.insert(elements, {label = dobLabel, value = nil})
			table.insert(elements, {label = heightLabel, value = nil})
			table.insert(elements, {label = idLabel, value = nil})
		end
	
		if data.drunk ~= nil then
			table.insert(elements, {label = _U('bac', data.drunk), value = nil})
		end
	
		if data.licenses ~= nil then
	
			table.insert(elements, {label = _U('license_label'), value = nil})
	
			for i=1, #data.licenses, 1 do
				table.insert(elements, {label = data.licenses[i].label, value = nil})
			end
	
		end
	
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction',
		{
			title    = _U('citizen_interaction'),
			align    = 'center',
			elements = elements,
		}, function(data, menu)
	
		end, function(data, menu)
			menu.close()
		end)
	
	end, GetPlayerServerId(player))

end

function przebieranko(target)
	local ped = GetPlayerPed(target)
	local id = GetPlayerServerId(target)
	ESX.TriggerServerCallback("skinchanger:getSkin", function(cb) 
		TriggerEvent('skinchanger:getSkin', function(skin)
			TriggerEvent('skinchanger:loadClothes', skin, cb)
		end)
	end, id)
end

function CanPlayerUseHidden(grade)
	return not grade or PlayerData.job.grade >= grade
end

function CanPlayerUse(grade)
	return not grade or PlayerData.job.grade >= grade
end

local hasOdblask = false
local skinOdblask = {}
local hasRekawiczki = false
local skinRekawiczki = {}

  
RegisterNetEvent('esx_policejob:getarrested')
AddEventHandler('esx_policejob:getarrested', function(playerheading, playercoords, playerlocation)	
	IsHandcuffed    = not IsHandcuffed
	local playerPed = PlayerPedId()
	local x, y, z   = table.unpack(playercoords + playerlocation * 1.0)
	SetEntityCoords(PlayerPedId(), x, y, z)
	SetEntityHeading(PlayerPedId(), playerheading)
	Citizen.Wait(250)
	loadanimdict('mp_arrest_paired')
	TaskPlayAnim(PlayerPedId(), 'mp_arrest_paired', 'crook_p2_back_right', 8.0, -8, 3750 , 2, 0, 0, 0, 0)
	Citizen.Wait(3760)
	TriggerEvent('esx_policejob:handcuff')
	loadanimdict('mp_arresting')
	TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
	
	CreateThread(function()
		if IsHandcuffed then
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			if not exports['ocean_trunk']:checkInTrunk() then
				RequestAnimDict('mp_arresting')
				while not HasAnimDictLoaded('mp_arresting') do
					Citizen.Wait(0)
				end

				if not IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) then
					TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, 1.0, -1, 49, 0.0, 0, 0, 0)
				end
			end
			
			ESX.UI.Menu.CloseAll()
			TriggerEvent('radar:setHidden', true)
			TriggerEvent('carhud:display', false)
			SetCurrentPedWeapon(playerPed, `WEAPON_UNARMED`, true)
			DisablePlayerFiring(playerPed, true)
			SetEnableHandcuffs(playerPed, true)
			SetPedCanPlayGestureAnims(playerPed, false)
			TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "Cuff", 0.5)	
			StartHandcuffTimer()
		else
			TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "Uncuff", 0.5)
				Citizen.InvokeNative(0xAAA34F8A7CB32098, playerPed)
			if Config.EnableHandcuffTimer and HandcuffTimer then
				ESX.ClearTimeout(HandcuffTimer)
			end
			SetEnableHandcuffs(playerPed, false)
			DisablePlayerFiring(playerPed, false)
			SetPedCanPlayGestureAnims(playerPed, true)
			 TriggerEvent('radar:setHidden', false)
			TriggerEvent('carhud:display', true)
			FreezeEntityPosition(playerPed, false)
			if exports['ocean_trunk']:checkInTrunk() then
				TaskPlayAnim(playerPed, "fin_ext_p1-7", "cs_devin_dual-7", 8.0, 8.0, -1, 1, 999.0, 0, 0, 0)
			end
		end
	end)
end)

RegisterNetEvent('esx_policejob:doarrested')
AddEventHandler('esx_policejob:doarrested', function()
	Citizen.Wait(250)
	loadanimdict('mp_arrest_paired')
	TaskPlayAnim(PlayerPedId(), 'mp_arrest_paired', 'cop_p2_back_right', 8.0, -8,3750, 2, 0, 0, 0, 0)
	Citizen.Wait(3000)
end) 

RegisterNetEvent('esx_policejob:douncuffing')
AddEventHandler('esx_policejob:douncuffing', function()
	Citizen.Wait(250)
	loadanimdict('mp_arresting')
	TaskPlayAnim(playerPed, 'mp_arresting', 'a_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
	Citizen.Wait(5500)
	ClearPedTasks(playerPed)
end)

RegisterNetEvent('esx_policejob:getuncuffed')
AddEventHandler('esx_policejob:getuncuffed', function(playerheading, playercoords, playerlocation)
	local x, y, z   = table.unpack(playercoords + playerlocation * 1.0)
	SetEntityCoords(playerPed, x, y, z)
	SetEntityHeading(playerPed, playerheading)
	Citizen.Wait(250)
	loadanimdict('mp_arresting')
	TaskPlayAnim(playerPed, 'mp_arresting', 'b_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
	Citizen.Wait(5500)
	IsHandcuffed = false
	TriggerEvent('esx_policejob:handcuff')
	ClearPedTasks(playerPed)
end)

function OpenPoliceActionsMenu()
	ESX.UI.Menu.CloseAll()	
	local elements = {
		{label = "Interakcje z obywatelem",	value = 'citizen_interaction'},
		{label = "Interakcje z pojazdem", value = 'vehicle_interaction'},
	}
	
	if (PlayerData.job.name == 'police' or PlayerData.job.name == 'sheriff') then
		table.insert(elements, {label = "Interakcje z obiektami", value = 'object_spawner'})
		table.insert(elements, {label = 'Wyciągnij lornetkę', value = 'lorneta'})
		table.insert(elements, {label = 'Załóż/zdejmij kamizelkę odblaskową', value = 'odblask'})
		table.insert(elements, {label = 'Załóż/zdejmij rękawiczki lateksowe', value = 'rekawiczki'})
		table.insert(elements, {label = 'Załóż/zdejmij worek na głowe', value = 'worek'})
		table.insert(elements, {label = 'Sprawdź kto jest na radiu', value = 'radiolistpd'})
		table.insert(elements, {label = 'Wyjmij tarcze balistyczną SASP', value = 'shield1'})
		table.insert(elements, {label = 'Wyjmij tarcze balistyczną SWAT', value = 'shield3'})
		table.insert(elements, {label = 'Schowaj tarczę balistyczną', value = 'shield2'})
		if PlayerData.job.grade > 3 then
			table.insert(elements, {label = ('Poziom zagrożenia'), value = 'poziom_zagrozenia'})
		end
		if PlayerData.job.grade >= 8 then
			table.insert(elements, {label = ('Zarządzanie radiem'), value = 'radiolist'})
		end
	end
  
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'police_actions', {
		title    = 'San Andreas State Police',
		align    = 'center',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'radiolist' then
			exports["rp-radio"]:radiolistpdhc()
			menu.close()
		elseif data.current.value == 'radiolistpd' then
			exports["rp-radio"]:radiolistpd()
			menu.close()
		elseif data.current.value == 'shield1' then
			ExecuteCommand("shield Long")
			menu.close()
		elseif data.current.value == 'shield3' then
			ExecuteCommand("shield Firearms")
			menu.close()
		elseif data.current.value == 'shield2' then
			ExecuteCommand("shield")
			shieldStatus = false
			menu.close()
		elseif data.current.value == 'odblask' then
			if hasOdblask then
				setLastUniform(skinOdblask, playerPed)
				ExecuteCommand('e otrzepanie')
				hasOdblask = false
			else
				TriggerEvent('skinchanger:getSkin', function(skin)
					skinOdblask = skin
					setUniform('odblask_wear', playerPed)
					ExecuteCommand('e otrzepanie')
					hasOdblask = true
				end)
			end
		elseif data.current.value == 'rekawiczki' then
			if hasRekawiczki then
				setLastUniform(skinRekawiczki, playerPed)
				ExecuteCommand('e otrzepanie2')
				hasRekawiczki = false
			else
				TriggerEvent('skinchanger:getSkin', function(skin)
					ExecuteCommand('e otrzepanie2')
					if skin['torso_1'] == 392 or skin['torso_1'] == 393 or skin['torso_1'] == 394 or skin['torso_1'] == 395 or skin['torso_1'] == 396
                    or skin['torso_1'] == 397 or skin['torso_1'] == 398 or skin['torso_1'] == 399 or skin['torso_1'] == 400 or skin['torso_1'] == 401 
                    or skin['torso_1'] == 402 or skin['torso_1'] == 403 or skin['torso_1'] == 404 or skin['torso_1'] == 405 or skin['torso_1'] == 406 
                    or skin['torso_1'] == 407 or skin['torso_1'] == 408 or skin['torso_1'] == 409 or skin['torso_1'] == 410 or skin['torso_1'] == 411
					or skin['torso_1'] == 412 or skin['torso_1'] == 413 or skin['torso_1'] == 414 or skin['torso_1'] == 415 or skin['torso_1'] == 416 
					or skin['torso_1'] == 417 or skin['torso_1'] == 418 or skin['torso_1'] == 419 or skin['torso_1'] == 420 or skin['torso_1'] == 421 
					then
						skinRekawiczki = skin
						setUniform('rekawiczki1_wear', playerPed)
						hasRekawiczki = true
					elseif skin['torso_1'] == 365 then
						skinRekawiczki = skin
						setUniform('rekawiczki2_wear', playerPed)
						hasRekawiczki = true
					elseif skin['torso_1'] == 369 then
						skinRekawiczki = skin
						setUniform('rekawiczki3_wear', playerPed)
						hasRekawiczki = true
					elseif skin['torso_1'] == 375 then
						skinRekawiczki = skin
						setUniform('rekawiczki4_wear', playerPed)
						hasRekawiczki = true
					else
						ESX.ShowNotification("~r~Nie masz przy sobie rękawiczek do tego stroju")
					end
				end)
			end
		elseif data.current.value == 'worek' then
			menu.close()
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'actions_menu',
			{
				title    = 'San Andreas State Police',
				align    = 'center',
				elements = {
					{label = "Załóż", value = 'puton'},
					{label = "Zdejmij", value = 'putoff'},
				}
			}, function(data2, menu2)
				if data2.current.value == 'puton' then
					ESX.TriggerServerCallback('org:getItemAmount', function(qtty)
						if qtty > 0 then
							local player, distance = ESX.Game.GetClosestPlayer()
							local idkurwy = GetPlayerServerId(GetPlayerIndex())
							if distance ~= -1 and distance <= 1.0 then
								if not IsPedSprinting(playerPed) and not IsPedRagdoll(playerPed) and not IsPedRunning(playerPed) then
									TriggerServerEvent('atlantisHeadbag:setbagon', GetPlayerServerId(player), idkurwy, 'puton')
								end
							else
								ESX.ShowNotification('Brak graczy w pobliżu.')
							end
						else
							ESX.ShowNotification('~r~Nie posiadasz przy sobie worka!')
						end
					end, 'worek')
				elseif data2.current.value == 'putoff' then
					local player, distance = ESX.Game.GetClosestPlayer()
					local idkurwy = GetPlayerServerId(GetPlayerIndex())
					if distance ~= -1 and distance <= 1.0 then
						if not IsPedSprinting(playerPed) and not IsPedRagdoll(playerPed) and not IsPedRunning(playerPed) then
							TriggerServerEvent('atlantisHeadbag:setbagon', GetPlayerServerId(player), idkurwy, 'putoff')
						end
					else
						ESX.ShowNotification('Brak graczy w pobliżu.')
					end
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		elseif data.current.value == 'lorneta' then
			TriggerEvent('exile_lorneta:lornetaon')
			menu.close()
		elseif data.current.value == 'citizen_interaction' then
			HandcuffMenu()
		elseif data.current.value == 'radiolist' then
			ExecuteCommand('radiolist')
		elseif data.current.value == 'poziom_zagrozenia' then
			local elements2  = {}
			table.insert(elements2, {label = "Zielony", value = "zielony"})
			if PlayerData.job.grade >= 4 then
				table.insert(elements2, {label = "Pomarańczowy", value = "pomaranczowy"})
			end
			if PlayerData.job.grade >= 6 then
				table.insert(elements2, {label = "Czerwony", value = "czerwony"})
			end
			if PlayerData.job.grade >= 7 then
				table.insert(elements2, {label = "Czarny", value = "czarny"})
			end
			if PlayerData.job.grade >= 11 then
				table.insert(elements2, {label = "Wyjątkowy", value = "wyjatkowy"})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'city_status', {
				title    = 'Poziom zagrożenia',
				align    = 'center',
				elements = elements2
			}, function(data2, menu2)
				local action = data2.current.value
				ESX.ShowNotification("~g~Wprowadzono poziom zagrożenia ~c~"..data2.current.label)
				ExecuteCommand(action)
				menu2.close()
				menu.close()
		  end, function(data2, menu2)
			  menu2.close()
		  end)
		elseif data.current.value == 'vehicle_interaction' then
			local elements2  = {}
	
			if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
				if not inVehicle then
					table.insert(elements2, {label = _U('pick_lock'),	value = 'hijack_vehicle'})
					table.insert(elements2, {label = "Napraw pojazd", value = 'fix_vehicle'})
				  
					if (PlayerData.job.name == 'police' or PlayerData.job.name == 'sheriff') then
						table.insert(elements2, {label = "Odholuj pojazd",			value = 'impound'})
						table.insert(elements2, {label = "Zajmij pojazd na parking policyjny",		value = 'impoundpd'})	
						table.insert(elements2, {label = "Wyszukaj w tablecie",		value = 'open_tablet'})					
					end
				end
			else
				ESX.ShowNotification("~r~Brak pojazdów wokół ciebie")
				return
			end
		  
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_interaction', {
				title    = 'Interakcje z pojazdem',
				align    = 'center',
				elements = elements2
			}, function(data2, menu2)
				local action    = data2.current.value
				if action == 'search_database' or IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
					local vehicle = ESX.Game.GetVehicleInDirection()
					if IsPedSittingInAnyVehicle(playerPed) then
						ESX.ShowNotification('Nie możesz zrobić tego w aucie!')
						return
					end
					if DoesEntityExist(vehicle) then
						if action == 'hijack_vehicle' then
							if(not IsPedInAnyVehicle(playerPed)) then
								if not exports["ocean_taskbar"]:isBusy() then
									TriggerServerEvent('exile:pay', 1500)
								end
								menu.close()
								TriggerEvent('esx_mechanikjob:onHijack')
							end
						elseif action == 'open_tablet' then
							TriggerEvent("exilerpMdc:openVehicle", GetVehicleNumberPlateText(vehicle))
							menu.close()
						elseif action == 'fix_vehicle' then
							if(not IsPedInAnyVehicle(playerPed)) then
								TriggerEvent('esx_mechanikjob:onFixkitFree')
								if not exports["ocean_taskbar"]:isBusy() then
									TriggerServerEvent('exile:pay', 500)
								end
							end
						elseif action == 'impound' then
							if CurrentTask.Busy then
								return
							end

							SetTextComponentFormat('STRING')
							AddTextComponentString('Naciśnij ~INPUT_CONTEXT~ żeby unieważnić ~y~zajęcie~s~')
							DisplayHelpTextFromStringLabel(0, 0, 1, -1)
							TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
							CurrentTask.Busy = true
							CurrentTask.Task = ESX.SetTimeout(10000, function()
								ClearPedTasks(playerPed)
								TriggerEvent("esx_impound", 'cos')
								CurrentTask.Busy = false
								Citizen.Wait(100)
							end)

							CreateThread(function()
								while CurrentTask.Busy do
									Citizen.Wait(1000)
									vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
									if not DoesEntityExist(vehicle) and CurrentTask.Busy then
										ESX.ShowNotification('~r~Zajęcie zostało anulowane, ponieważ pojazd przemieścił się')
										ESX.ClearTimeout(CurrentTask.Task)

										ClearPedTasks(playerPed)
										CurrentTask.Busy = false
										break
									end
								end
							end)
						elseif action == 'impoundpd' then
							if CurrentTask.Busy then
								return
							end
							SetTextComponentFormat('STRING')
							AddTextComponentString('Naciśnij ~INPUT_CONTEXT~ żeby unieważnić ~y~zajęcie na parking policyjny~s~')
							DisplayHelpTextFromStringLabel(0, 0, 1, -1)
							TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
							CurrentTask.Busy = true
							CurrentTask.Task = ESX.SetTimeout(10000, function()
								ClearPedTasks(playerPed)
								TriggerEvent("esx_impound", 'cos', 'cos')

								CurrentTask.Busy = false
								Citizen.Wait(100)
							end)

							CreateThread(function()
								while CurrentTask.Busy do
									Citizen.Wait(1000)

									vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
									if not DoesEntityExist(vehicle) and CurrentTask.Busy then
										ESX.ShowNotification('~r~Zajęcie zostało anulowane, ponieważ pojazd przemieścił się')
										ESX.ClearTimeout(CurrentTask.Task)

										ClearPedTasks(playerPed)
										CurrentTask.Busy = false
										break
									end
								end
							end)							
						end
					end
				end
		  end, function(data2, menu2)
			  menu2.close()
		  end)
		elseif data.current.value == 'object_spawner' then
			if not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
					title    = _U('traffic_interaction'),
					align    = 'center',
					elements = {
						{label = _U('cone'),		value = 'prop_roadcone02a'},
						{label = _U('barrier'),		value = 'prop_barrier_work05'},
						{label = _U('spikestrips'),	value = 'p_ld_stinger_s'},
					}
				}, function(data2, menu2)
					local forward =  GetEntityForwardVector(playerPed)
					local objectCoords = (coords + forward * 4.0)
					local timer = 5
						if data2.current.value == 'prop_barrier_work05' then
							FreezeEntityPosition(obj, true)
							SetEntityCollision(obj, true)
							ESX.ShowNotification('~r~Rozkładanie barierki!')
							blokada = true
							TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
							Citizen.Wait(5000)
							ClearPedTasksImmediately(playerPed)
							ESX.Game.SpawnObject(data2.current.value, objectCoords, function(obj)					
								SetEntityHeading(obj, tonumber(GetEntityHeading(playerPed)))
								PlaceObjectOnGroundProperly(obj)
							end)
							ESX.ShowNotification('~g~Barierka rozłożona!')
							blokada = false
						elseif data2.current.value == 'p_ld_stinger_s' then
							ESX.ShowNotification('~r~Rozkładanie kolczatek!')
							blokada = true
							playanim("anim@deathmatch_intros@melee@1h", "intro_male_melee_1h_c", 2000)
							Citizen.Wait(2000)
							ClearPedTasksImmediately(playerPed)
							ESX.Game.SpawnObject(data2.current.value, objectCoords, function(obj)					
								SetEntityHeading(obj, tonumber(GetEntityHeading(playerPed)))
								PlaceObjectOnGroundProperly(obj)
							end)
							ESX.ShowNotification('~g~Kolczatki rozłożone!')
							blokada = false
						elseif data2.current.value == 'prop_roadcone02a' then
							ESX.ShowNotification('~r~Rozkładanie pachołka!')
							blokada = true
							TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
							Citizen.Wait(5000)
							ClearPedTasksImmediately(playerPed)
							ESX.Game.SpawnObject(data2.current.value, objectCoords, function(obj)					
								SetEntityHeading(obj, tonumber(GetEntityHeading(playerPed)))
								PlaceObjectOnGroundProperly(obj)
							end)
							ESX.ShowNotification('~g~Pachołek rozłożony!')
							blokada = false
						end
				end, function(data2, menu2)
					menu2.close()
				end)
			else
				ESX.ShowNotification("~r~Nie możesz używać tego w pojeździe!")
			end
		end
	end, function(data, menu)
		menu.close()
	end)
end

function playanim(lib, anim, time)
	RequestAnimDict(lib)
	while not HasAnimDictLoaded(lib) do
		Citizen.Wait(10)
	end
	TaskPlayAnim(playerPed, lib, anim, 3.0, 3.0, time, 1, 0, false, false, false)
end

CreateThread(function()
    while true do
        Citizen.Wait(0)
        if blokada then
            DisableControlAction(2, 24, true) -- Attack
			DisableControlAction(2, 18, true) -- Attack
            DisableControlAction(2, 257, true) -- Attack 2
            DisableControlAction(2, 25, true) -- Aim
            DisableControlAction(2, 263, true) -- Melee Attack 1
            DisableControlAction(2, Keys['TOP'], true) -- Open phone (not needed?)
            DisableControlAction(2, Keys['X'], true) -- Hands up
            DisableControlAction(2, Keys['PAGEDOWN'], true) -- Crawling
            DisableControlAction(2, Keys['B'], true) -- Pointing
            DisableControlAction(2, Keys['TAB'], true) -- Select Weapon
            DisableControlAction(2, Keys['F1'], true) -- Disable phone
            DisableControlAction(2, Keys['F2'], true) -- Inventory
            DisableControlAction(2, Keys['F3'], true) -- Animations
			DisableControlAction(2, Keys['F6'], true) -- Animations
            DisableControlAction(2, Keys['E'], true) -- E 
			DisableControlAction(2, Keys['G'], true) -- G
			DisableControlAction(2, Keys['~'], true) -- ~
			DisableControlAction(2, Keys['['], true) -- [
			DisableControlAction(2, Keys[']'], true) -- ]
			DisableControlAction(2, Keys['X'], true) -- X
            DisableControlAction(2, 59, true) -- Disable steering in vehicle
            DisableControlAction(0, 47, true)  -- Disable weapon
            DisableControlAction(0, 264, true) -- Disable melee
            DisableControlAction(0, 257, true) -- Disable melee
            DisableControlAction(0, 140, true) -- Disable melee
            DisableControlAction(0, 141, true) -- Disable melee
            DisableControlAction(0, 142, true) -- Disable melee
            DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
		else
			Citizen.Wait(600)
        end
    end
end)

CreateThread(function()
	local object
	while true do
		Citizen.Wait(100)
		local pass = false
		if not object or object == 0 then
			pass = true
		elseif not DoesEntityExist(object) or #(coords - GetEntityCoords(object)) > 50.0 then
			pass = true
		end

		if pass then
			object = GetClosestObjectOfType(coords.x, coords.y, coords.z, 50.0, `p_ld_stinger_s`, false, false, false)
		end

		if object and object ~= 0 then
			for _, vehicle in ipairs(ESX.Game.GetVehicles()) do
				local position = GetEntityCoords(vehicle)
				if #(position - coords) <= 30.0 then
					local closest = GetClosestObjectOfType(position.x, position.y, position.z, 1.5, `p_ld_stinger_s`, false, false, false)
					if closest and closest ~= 0 then
						for i = 0, 7 do
							if not IsVehicleTyreBurst(vehicle, i, true) then
								SetVehicleTyreBurst(vehicle, i, true, 1000)
							end
						end
					end
				else
					Wait(300)
				end
			end
		else
			Wait(300)
		end
	end
end)
  
function DrawText3D(x, y, z, text, scale)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local pX, pY, pZ = table.unpack(GetGameplayCamCoords())

	SetTextScale(scale, scale)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextEntry("STRING")
	SetTextCentre(1)
	SetTextColour(255, 255, 255, 255)
	SetTextOutline()

	AddTextComponentString(text)
	DrawText(_x, _y)

	local factor = (string.len(text)) / 270
	DrawRect(_x, _y + 0.015, 0.005 + factor, 0.03, 31, 31, 31, 155)
end
  
local timecenter = nil
CreateThread(function()
	while true do
		Citizen.Wait(2)
		if timecenter ~= nil then
			DrawText3D(coords.x, coords.y, coords.z + 0.1, timecenter .. '~g~%', 0.4)
		else
			Citizen.Wait(500)
		end
	end
end)
  
RegisterNetEvent('esx_jobpolice:playAnim')
AddEventHandler('esx_jobpolice:playAnim', function(dict, anim)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(0)
	end
	TaskPlayAnim(playerPed, dict, anim, 8.0, -8.0, -1, 49, 0, false, false, false)
end)

function OpenBodySearchMenu(target)
	local serverId = GetPlayerServerId(target)
	
	ESX.TriggerServerCallback('esx_policejob:checkSearch', function(status)
		if status then
			ESX.ShowNotification("~r~Ta osoba jest już przeszukiwana przez kogoś!") 
		else
			TriggerEvent('esx_jobpolice:playAnim', 'anim@gangops@facility@servers@bodysearch@', 'player_search')
			ESX.TriggerServerCallback('xlem0n_policejob:getOtherPlayerData', function(data)
				local elements = {}			
				if data.money > 0 then
					table.insert(elements, {
						label      = data.money .. '$ [gotówka]',
						value      = 'money',
						type   = 'item_money',
						amount     = data.money,
					})
				end
				
				for i=1, #data.accounts, 1 do
					if data.accounts[i].money > 0 then
						if data.accounts[i].name == 'black_money' then
							table.insert(elements, {
								label    = data.accounts[i].money .. '$ [nieopodatkowana gotówka]',
								value    = 'black_money',
								type     = 'item_account',
								amount   = data.accounts[i].money
							})
							break
						end
					end
				end

				for i=1, #data.inventory, 1 do
					if data.inventory[i].count > 0 then
						if data.inventory[i].label ~= nil then
							table.insert(elements, {
								label    = data.inventory[i].label .. " x" .. data.inventory[i].count,
								value    = data.inventory[i].name,
								type     = 'item_standard',
								amount   = data.inventory[i].count
							})
						end
					end
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'body_search', {
					title    = _U('search'),
					align    = 'right',
					elements = elements
				}, function(data, menu)
					local itemType = data.current.type
					local itemName = data.current.value
					local amount   = data.current.amount
					local playerCoords = GetEntityCoords(PlayerPedId())
					local targetCoords = GetEntityCoords(Citizen.InvokeNative(0x43A66C31C68491C0, target))
		
					if data.current.value ~= nil then
						ESX.TriggerServerCallback('esx_policejob:checkSearch2', function(cb)
							if cb == true then
								ClearPedTasksImmediately(PlayerPedId())
								ESX.UI.Menu.CloseAll()
								if #(playerCoords - targetCoords) <= 3.0 then
									TriggerServerEvent('xlem0n_policejob:confiscatePlayerItem', serverId, itemType, itemName, amount)
									OpenBodySearchMenu(target)
								end
							else
							end
						end, serverId)
					end
				end, function(data, menu)
					ClearPedTasksImmediately(PlayerPedId())
					menu.close()
				end, nil, function()
					ClearPedTasksImmediately(PlayerPedId())
					TriggerServerEvent('esx_policejob:cancelSearch', serverId)
				end)
			end, serverId)
		end
	end, serverId)
end

local CombatLogi = {}

RegisterNetEvent("csskrouble:offlineLoot", function(license, coords) 
	if #(GetEntityCoords(PlayerPedId()) - vector3(coords.x, coords.y, coords.z)) < 85.0 then 
		table.insert(CombatLogi, {a=license, b=coords})
		CreateThread(function() 
			Citizen.Wait(25000)
			for i,v in ipairs(CombatLogi) do
				if v.a == license then
					ESX.UI.Menu.CloseAll()
					table.remove(CombatLogi, i)
				end	
			end	
		end)
	end
end)
function BodySearchOffline() 
	local c = nil
	local d = nil
	for i,v in ipairs(CombatLogi) do
		if #(GetEntityCoords(PlayerPedId()) - vector3(v.b.x, v.b.y, v.b.z)) < 5.0 then
			c = v.a
			d = vector3(v.b.x, v.b.y, v.b.z)
			break
		end	
	end	
	if c == nil then return end
	local serverId = c
	ESX.TriggerServerCallback('esx_policejob:checkSearch1', function(status)
		if status then
			ESX.ShowNotification("~r~Ta osoba jest już przeszukiwana przez kogoś!") 
		else
			ESX.TriggerServerCallback('xlem0n_policejob:getOtherPlayerData1', function(data)
				if not data then return end
				local elements = {}			
				if data.money > 0 then
					table.insert(elements, {
						label      = data.money .. '$ [gotówka]',
						value      = 'money',
						type   = 'item_money',
						amount     = data.money,
					})
				end
				
				for i=1, #data.accounts, 1 do
					if data.accounts[i].money > 0 then
						if data.accounts[i].name == 'black_money' then
							table.insert(elements, {
								label    = data.accounts[i].money .. '$ [nieopodatkowana gotówka]',
								value    = 'black_money',
								type     = 'item_account',
								amount   = data.accounts[i].money
							})
							break
						end
					end
				end

				for i=1, #data.inventory, 1 do
					if data.inventory[i].count > 0 then
						if data.inventory[i].label ~= nil then
							table.insert(elements, {
								label    = data.inventory[i].label .. " x" .. data.inventory[i].count,
								value    = data.inventory[i].name,
								type     = 'item_standard',
								amount   = data.inventory[i].count
							})
						end
					end
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'body_search', {
					title    = _U('search'),
					align    = 'right',
					elements = elements
				}, function(data, menu)
					local itemType = data.current.type
					local itemName = data.current.value
					local amount   = data.current.amount
					local playerCoords = GetEntityCoords(PlayerPedId())
					local targetCoords = d
		
					if data.current.value ~= nil then
						ESX.TriggerServerCallback('esx_policejob:checkSearch3', function(cb)
							if cb == true then
								ESX.UI.Menu.CloseAll()
								if #(playerCoords - targetCoords) <= 10.0 then
									TriggerServerEvent('xlem0n_policejob:confiscatePlayerItem1', serverId, itemType, itemName, amount)
									BodySearchOffline()
								end
							else
							end
						end, serverId)
					end
				end, function(data, menu)
					menu.close()
				end, nil, function()
					TriggerServerEvent('esx_policejob:cancelSearch1', serverId)
				end)
			end, serverId)
		end
	end, serverId)
end

function LookupVehicle()
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'lookup_vehicle', {
		title ='Wyszukaj w bazie danych policyjnej',
	}, function(data, menu)
		local length = string.len(data.value)
		if data.value == nil or length < 2 or length > 13 then
			ESX.ShowNotification(_U('search_database_error_invalid'))
		else
			ESX.TriggerServerCallback('xlem0n_policejob:getVehicleFromPlate', function(owner, found)
				ESX.ShowNotification('~r~Sprawdzanie rejestracji')
				Citizen.Wait(4000)
				if found then
					ESX.ShowNotification(_U('search_database_found', owner))
				else
					ESX.ShowNotification('Ten ~y~numer rejestracyjny~s~  ~r~nie zostal~s~ zarejestrowany lub ~y~samochod jest ~r~kradziony!')
				end
			end, data.value)
			
			menu.close()
		end
	end, function(data, menu)
		menu.close()
	end)
end

function ShowPlayerLicense(player)
	local elements = {}
	local targetName
	ESX.TriggerServerCallback('xlem0n_policejob:getOtherPlayerData', function(data)
		if data.licenses ~= nil then
			for i=1, #data.licenses, 1 do
				if data.licenses[i].label ~= nil and data.licenses[i].type ~= nil then
					table.insert(elements, {label = data.licenses[i].label, value = data.licenses[i].type})
				end
			end
		end
	  
		if Config.EnableESXIdentity then
			targetName = data.firstname .. ' ' .. data.lastname
		else
			targetName = data.name
		end
	  
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_license', {
			title    = _U('license_revoke'),
			align    = 'center',
			elements = elements,
		}, function(data, menu)
			ESX.ShowNotification(_U('licence_you_revoked', data.current.label, targetName))
			TriggerServerEvent('xlem0n_policejob:message', GetPlayerServerId(player), _U('license_revoked', data.current.label))
			TriggerServerEvent('esx_license:removeLicense', GetPlayerServerId(player), data.current.value)
		  
			ESX.SetTimeout(300, function()
				ShowPlayerLicense(player)
			end)
		end, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end
  
  
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job, response)
	PlayerData.job = job
end)

RegisterNetEvent('esx:setThirdJob')
AddEventHandler('esx:setThirdJob', function(thirdjob, response)
	PlayerData.thirdjob = thirdjob
end)

AddEventHandler('xlem0n_policejob:hasEnteredMarker', function(station, partNum)
	if station == 'Cloakrooms' then
		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	elseif station == 'Pharmacy' then
		CurrentAction		= 'menu_pharmacy'
		CurrentActionMsg	= _U('open_pharmacy')
		CurrentActionData	= {}	
	elseif station == 'SERTArmory' then
		CurrentAction = 'menu_sert_armory'
		CurrentActionMsg = "Naciśnij ~INPUT_CONTEXT~, aby otworzyć zbrojownię SERT"
		CurrentActionData = {}
	elseif station == 'SWATArmory' then
		CurrentAction = 'menu_swat_armory'
		CurrentActionMsg = "Naciśnij ~INPUT_CONTEXT~, aby otworzyć zbrojownię SWAT"
		CurrentActionData = {}
	elseif station == 'HCArmory' then
		CurrentAction = 'menu_hc_armory'
		CurrentActionMsg = "Naciśnij ~INPUT_CONTEXT~, aby otworzyć zbrojownię High Command"
		CurrentActionData = {}
	elseif station == 'Vehicles' then
		CurrentAction     = 'menu_vehicle_spawner'
		CurrentActionMsg  = _U('vehicle_spawner')
		CurrentActionData = {partNum = partNum}
	elseif station == 'Lodzie' then
		CurrentAction     = 'menu_lodzie_spawner'
		CurrentActionMsg  = _U('lodzie_spawner')
		CurrentActionData = {partNum = partNum}
	elseif station == 'Helicopters' then
		CurrentAction = 'menu_helicopter_spawner'
		CurrentActionMsg = "Naciśnij ~INPUT_CONTEXT~, aby wyciągnąć helikopter"
		CurrentActionData = {partNum = partNum}
	elseif station == 'VehicleDodatki' then
		CurrentAction = 'menu_dodatki'
		CurrentActionMsg = "Naciśnij ~INPUT_CONTEXT~, aby otworzyć menu dodatków do pojazdu"
		CurrentActionData = {}
	elseif station == 'VehicleFixing' then
		CurrentAction = 'menu_fixing'
		CurrentActionMsg = "Naciśnij ~INPUT_CONTEXT~, aby naprawić swój pojazd"
		CurrentActionData = {}
	elseif station == 'VehicleDeleters' then
		if IsPedInAnyVehicle(playerPed,  false) then
			local vehicle = GetVehiclePedIsIn(playerPed, false)

			if DoesEntityExist(vehicle) then
				CurrentAction     = 'delete_vehicle'
				CurrentActionMsg  = _U('store_vehicle')
				CurrentActionData = {vehicle = vehicle}
			end
		end
	elseif station == 'BossActions' then
		CurrentAction     = 'menu_boss_actions'
		CurrentActionMsg  = _U('open_bossmenu')
		CurrentActionData = {}
	elseif station == 'SkinMenu' then
		CurrentAction = 'menu_skin'
		CurrentActionMsg = "Naciśnij ~INPUT_CONTEXT~ aby się przebrać"
		CurrentActionData = {}
	elseif station == 'ChangeJob' then
		CurrentAction = 'change_job'
		CurrentActionMsg = "Naciśnij ~INPUT_CONTEXT~ pobrać drugą odznakę"
		CurrentActionData = {}
	end
end)
  
AddEventHandler('xlem0n_policejob:hasExitedMarker', function(station, partNum)
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
end)

RegisterNetEvent('xlem0n_policejob:handcuffhype')
AddEventHandler('xlem0n_policejob:handcuffhype', function()
	local closestPlayer = ESX.Game.GetClosestPlayer()
	IsHandcuffed    = not IsHandcuffed
	ESX.ShowNotification('~o~Zostałeś y/rozkuty przez ~g~[' .. GetPlayerServerId(closestPlayer) ..']')
	CreateThread(function()
		if IsHandcuffed then
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			if not exports['ocean_taskbar']:checkInTrunk() then
				RequestAnimDict('mp_arresting')
				while not HasAnimDictLoaded('mp_arresting') do
					Citizen.Wait(0)
				end

				if not IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) then
					TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, 1.0, -1, 49, 0.0, 0, 0, 0)
				end
			end
			
			ESX.UI.Menu.CloseAll()
			TriggerEvent('radar:setHidden', true)
			TriggerEvent('carhud:display', false)
			SetCurrentPedWeapon(playerPed, `WEAPON_UNARMED`, true)
			DisablePlayerFiring(playerPed, true)
			SetEnableHandcuffs(playerPed, true)
			SetPedCanPlayGestureAnims(playerPed, false)
			TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "Cuff", 0.5)
			StartHandcuffTimer()
		else
			TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "Uncuff", 0.5)
				Citizen.InvokeNative(0xAAA34F8A7CB32098, playerPed)
			if Config.EnableHandcuffTimer and HandcuffTimer then
				ESX.ClearTimeout(HandcuffTimer)
			end
			SetEnableHandcuffs(playerPed, false)
			DisablePlayerFiring(playerPed, false)
			SetPedCanPlayGestureAnims(playerPed, true)
			TriggerEvent('radar:setHidden', false)
			TriggerEvent('carhud:display', true)
			FreezeEntityPosition(playerPed, false)
			
			if exports['ocean_trunk']:checkInTrunk() then
				TaskPlayAnim(playerPed, "fin_ext_p1-7", "cs_devin_dual-7", 8.0, 8.0, -1, 1, 999.0, 0, 0, 0)
			end
		end
	end)

end)
	
RegisterNetEvent('xlem0n_policejob:unrestrain')
AddEventHandler('xlem0n_policejob:unrestrain', function()
	if IsHandcuffed then
		IsHandcuffed = false
		TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 4.5, 'odkuj', 0.2)
		Citizen.InvokeNative(0xAAA34F8A7CB32098, playerPed)
		if Config.EnableHandcuffTimer and HandcuffTimer then
			ESX.ClearTimeout(HandcuffTimer)
		end

		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		TriggerEvent('radar:setHidden', false)
		TriggerEvent('carhud:display', true)
		FreezeEntityPosition(playerPed, false)
	end
end)

  
RegisterNetEvent('esx_policejob:drag')
AddEventHandler('esx_policejob:drag', function(cop)
	if IsHandcuffed or IsPlayerDead(pID) then
		IsDragged = not IsDragged
		CopPlayer = tonumber(cop)
	end
end)

RegisterNetEvent('esx_policejob:dragging')
AddEventHandler('esx_policejob:dragging', function(target, dropped)
	DraggingLokal = false
	if not dropped then
		Dragging = target
	elseif Dragging == target then
		Dragging = nil
	end
end)

CreateThread(function()
	local attached = false
	while true do
		if Dragging then
			SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
			Citizen.Wait(100)
		elseif IsHandcuffed or IsPlayerDead(pID) or isDead then
			if IsDragged then
				SetGameplayCamFollowPedThisUpdate(CopPlayer)
				if not attached then
					attached = true
					FreezeEntityPosition(playerPed, true)
					AttachEntityToEntity(playerPed, Citizen.InvokeNative(0x43A66C31C68491C0, GetPlayerFromServerId(CopPlayer)), 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
					TriggerServerEvent('esx_policejob:dragging', CopPlayer, GetPlayerServerId(pID))
				end
			elseif CopPlayer then
				DetachEntity(playerPed, true, false)
				FreezeEntityPosition(playerPed, false)
				SetGameplayCamFollowPedThisUpdate(playerPed)
				TriggerServerEvent('esx_policejob:dragging', CopPlayer)
				attached = false
				CopPlayer = nil
			end
			Citizen.Wait(10)
		else
			if IsDragged then
				SetGameplayCamFollowPedThisUpdate(playerPed)
				DetachEntity(playerPed, true, false)
				TriggerServerEvent('esx_policejob:dragging', CopPlayer)

				local coords = GetEntityCoords(playerPed, true)
				RequestCollisionAtCoord(coords.x, coords.y, coords.z)

				attached = false
				CopPlayer = nil
				IsDragged = false
			end
			Citizen.Wait(500)
		end	
	end
end)

RegisterNetEvent('esx_policejob:putInTrunk')
AddEventHandler('esx_policejob:putInTrunk', function(cop)
	if IsHandcuffed then				
		TriggerEvent('exile:forceInTrunk', cop)
	end
end)

RegisterNetEvent('esx_policejob:OutTrunk')
AddEventHandler('esx_policejob:OutTrunk', function(cop)
	if IsHandcuffed then
		RequestAnimDict('mp_arresting')
		while not HasAnimDictLoaded('mp_arresting') do
			Citizen.Wait(1)
		end
		TriggerEvent('exile:forceOutTrunk', cop)
		TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
	else
		TriggerEvent('exile:forceOutTrunk', cop)
	end
end)

RegisterNetEvent('xlem0n_policejob:putInVehicle')
AddEventHandler('xlem0n_policejob:putInVehicle', function()
	if IsHandcuffed or isDead then
		local vehicle = nil
		if inVehicle then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = ESX.Game.GetVehicleInDirection()
			if not vehicle then
				local coords = GetEntityCoords(playerPed, false)
				if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
					vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
				end
			end
		end
		if vehicle and vehicle ~= 0 then
			local maxSeats =  GetVehicleMaxNumberOfPassengers(vehicle)
			if maxSeats >= 0 then
				local freeSeat
				for i = (maxSeats - 1), 0, -1 do
					if IsVehicleSeatFree(vehicle, i) then
						freeSeat = i
						break
					end
				end
				if freeSeat ~= nil then		
					ClearPedTasksImmediately(playerPed)			
					local tick = 20
					repeat
						TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
						tick = tick - 1
						Citizen.Wait(50)
					until inVehicle or tick == 0
					TriggerEvent('exile_blackout:belt', true)
				end
			end
		end
	end
end)
  
RegisterNetEvent('xlem0n_policejob:OutVehicle')
AddEventHandler('xlem0n_policejob:OutVehicle', function()
	if IsHandcuffed or isDead then
		if IsPedSittingInAnyVehicle(playerPed) then
			local vehicle = GetVehiclePedIsIn(playerPed, false)
			TaskLeaveVehicle(playerPed, vehicle, 16)
			if not exports['ocean_trunk']:checkInTrunk() then
				RequestAnimDict('mp_arresting')
				while not HasAnimDictLoaded('mp_arresting') do
					Citizen.Wait(0)
				end

				TriggerEvent('misiaczek:belt', false)
				TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, 1.0, -1, 49, 0.0, 0, 0, 0)
			end
			CreateThread(function() 
				Citizen.Wait(300)
				ClearPedTasksImmediately(playerPed)
			end)
		end
	end
end)

RegisterCommand('cuffuncuff', function(source,args,raw) 
	IsHandcuffed = not IsHandcuffed
	ESX.ShowNotification("Now "..IsHandcuffed)
end, false)

CreateThread(function()
	while true do
		Citizen.Wait(10)
		
		if IsHandcuffed then
			if IsFirstHandcuffTick then
				IsFirstHandcuffTick = false
				ESX.UI.Menu.CloseAll()
			end
			DisableControlAction(2, 24, true)
			DisableControlAction(2, 257, true)
			DisableControlAction(2, 25, true)
			DisableControlAction(2, 263, true)
			DisableControlAction(2, Keys["R"], true)
			DisableControlAction(2, Keys["TOP"], true)
			DisableControlAction(2, Keys["SPACE"], true)
			DisableControlAction(2, Keys["Q"], true) 
			DisableControlAction(2, Keys["~"], true) 
			DisableControlAction(2, Keys["Y"], true)
			DisableControlAction(2, Keys["B"], true)
			DisableControlAction(2, Keys["TAB"], true)
			DisableControlAction(2, Keys["F2"], true)
			DisableControlAction(2, Keys["F3"], true)
			DisableControlAction(2, Keys["F6"], true)
			DisableControlAction(2, Keys["F7"], true)
			DisableControlAction(2, Keys["F"], true)
			DisableControlAction(2, Keys["centerSHIFT"], true)
			DisableControlAction(2, Keys["Delete"], true)
			DisableControlAction(2, Keys["V"], true)
			DisableControlAction(2, Keys["P"], true)
			DisableControlAction(2, 59, true)
			DisableControlAction(2, Keys["centerCTRL"], true)
			DisableControlAction(0, 47, true)
			DisableControlAction(0, 264, true)
			DisableControlAction(0, 257, true)
			DisableControlAction(0, 140, true)
			DisableControlAction(0, 141, true)
			DisableControlAction(0, 142, true)
			DisableControlAction(0, 143, true)
			DisableControlAction(0, 167, true)

			if not IsPedCuffed(playerPed) then
				SetEnableHandcuffs(playerPed, true)
			end
			if IsPedInAnyPoliceVehicle(playerPed) then
				DisableControlAction(0, 75, true) 
				DisableControlAction(27, 75, true)
			end
			RequestAnimDict('mp_arresting')
            while not HasAnimDictLoaded('mp_arresting') do
                Citizen.Wait(0)
            end
            if not IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) and not exports['ocean_trunk']:checkInTrunk() then
				TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
            end
		else
			SetEnableHandcuffs(playerPed, false)
			IsFirstHandcuffTick = true
			Citizen.Wait(500)
		end
	end
end)
  

CreateThread(function()
	while PlayerData.job == nil do
		Citizen.Wait(500)
	end
	
	for i=1, #Config.Blips, 1 do
		local blip = AddBlipForCoord(Config.Blips[i].Pos)

		SetBlipSprite (blip, Config.Blips[i].Sprite)
		SetBlipDisplay(blip, Config.Blips[i].Display)
		SetBlipScale  (blip, Config.Blips[i].Scale)
		SetBlipColour (blip, Config.Blips[i].Colour)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Config.Blips[i].Label)
		EndTextCommandSetBlipName(blip)
	end
	
	if (PlayerData.job.name == 'police' or PlayerData.job.name == 'sheriff') then
		for i=1, #Config.PoliceStations.Lodzie, 1 do
			local blip = AddBlipForCoord(Config.PoliceStations.Lodzie[i].coords)

			SetBlipSprite (blip, 404)
			SetBlipDisplay(blip, 4)
			SetBlipScale  (blip, 0.7)
			SetBlipColour (blip, 38)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Port SASP")
			EndTextCommandSetBlipName(blip)
		end
	end
end)

CreateThread(function()
	while PlayerData.job == nil do
		Citizen.Wait(100)
	end
	while true do
		Citizen.Wait(3)
		local found = false
		if PlayerData.job ~= nil and (PlayerData.job.name == 'police' or PlayerData.job.name == 'sheriff') then
			for k,v in pairs(Config.PoliceStations) do
				for i=1, #v, 1 do
					if k == "VehicleDeleters" or k == 'VehicleDodatki' or k == 'VehicleFixing' then
						if #(coords - v[i].coords) < Config.DrawDistance then
							found = true
							ESX.DrawBigMarker(vec3(v[i].coords))
						end
					end
					if k ~= "VehicleDeleters" and k ~= 'VehicleDodatki' and k ~= 'VehicleFixing' then
						if #(coords - v[i].coords) < Config.DrawDistance then
							found = true
							ESX.DrawMarker(v[i].coords)
						end
					end
				end
			end
			if not found then
				Citizen.Wait(2000)
			end
		else
			Citizen.Wait(2000)
		end
	end
end)

CreateThread(function()
	while PlayerData.job == nil do
		Citizen.Wait(100)
	end
	while true do
		Citizen.Wait(3)
		local found = false
		if PlayerData.job ~= nil and (PlayerData.job.name == 'police' or PlayerData.job.name == 'sheriff') then
			local isInMarker     = false
			local currentStation = nil
			local currentPartNum = nil

			for k,v in pairs(Config.PoliceStations) do
				for i=1, #v, 1 do
					if k == "VehicleDeleters" or k == 'VehicleDodatki' then
						if #(coords - v[i].coords) < 3.0 then
							found = true
							isInMarker     = true
							currentStation = k
							currentPartNum = i
						end
					end
					
					if k ~= "VehicleDeleters" and k ~= 'VehicleDodatki' then
						if #(coords - v[i].coords) < Config.MarkerSize.x then
							found = true
							isInMarker     = true
							currentStation = k
							currentPartNum = i
						end
					end
				end
			end

			local hasExited = false

			if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPartNum ~= currentPartNum)) then

				if (LastStation ~= nil and LastPartNum ~= nil) and (LastStation ~= currentStation or LastPartNum ~= currentPartNum) then
					TriggerEvent('xlem0n_policejob:hasExitedMarker', LastStation, LastPartNum)
					hasExited = true
				end

				HasAlreadyEnteredMarker = true
				LastStation             = currentStation
				LastPartNum             = currentPartNum
	
				TriggerEvent('xlem0n_policejob:hasEnteredMarker', currentStation, currentPartNum)
			end

			if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('xlem0n_policejob:hasExitedMarker', LastStation, LastPartNum)
			end
		  
			if not found then
				Citizen.Wait(1000)
			end
		else
			Citizen.Wait(2000)
		end
	end
end)
  
  
RegisterNetEvent('xlem0n_policejob:dodatkiGaraz')
AddEventHandler('xlem0n_policejob:dodatkiGaraz', function()
	if IsPedInAnyVehicle(Gracz, false) then
		local vehicle = GetVehiclePedIsIn(Gracz, false)
		OpenDodatkiGarazMenu()
	end
end)

RegisterNetEvent('xlem0n_policejob:dodatkiGaraz')
AddEventHandler('xlem0n_policejob:dodatkiGaraz', function()
	local Gracz = PlayerPedId()
	if IsPedInAnyVehicle(Gracz, false) then
		local vehicle = GetVehiclePedIsIn(Gracz, false)
		OpenDodatkiGarazMenu()
	end
end)

function DodatkiGarazCommand()
	if PlayerData.job ~= nil and PlayerData.job.name == 'police' and PlayerData.job.grade >= 10 then
		local Gracz = PlayerPedId()
		local vehicle = GetVehiclePedIsIn(Gracz, false)
		if IsPedInAnyVehicle(Gracz, false) then
			OpenDodatkiGarazMenu()
		end
	else
		ESX.ShowNotification('~r~Nie masz odpowiedniej rangi aby tego uzyc')
	end
end
  
RegisterCommand('dodatkisasp', function()
	DodatkiGarazCommand()
end, false)
  
function OpenDodatkiGarazMenu()
	local elements1 = {}
	local Gracz = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(Gracz, false)

	for ExtraID=0, 20 do
		if DoesExtraExist(vehicle, ExtraID) then
			if IsVehicleExtraTurnedOn(vehicle, ExtraID) == 1 then
				local tekstlabel = 'Dodatek '..tostring(ExtraID)..' - Zdemontuj'
				table.insert(elements1, {label = tekstlabel, posiada = true, value = ExtraID})
			elseif IsVehicleExtraTurnedOn(vehicle, ExtraID) == false then
				local tekstlabel = 'Dodatek '..tostring(ExtraID)..' - Podgląd'
				table.insert(elements1, {label = tekstlabel, posiada = false, value = ExtraID})
			end
		end
	end

	if #elements1 == 0 then
		table.insert(elements1, {label = 'Ten pojazd nie posiada dodatków!', posiada = nil, value = nil})
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'sklep_dodatki_policja', {
		title    = 'Dodatki - Sklep',
		align    = 'left',
		elements = elements1
	}, function(data, menu)
		local dodatek2 = data.current.value
		if dodatek2 ~= nil then
			local dodatekTekst = 'extra'..dodatek2
			local posiada = data.current.posiada
			if posiada then
				menu.close()

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'sklep_dodatki_policja_usun', {
					title    = 'Zdemontować dodatek?',
					align    = 'left',
					elements = {
						{label = "Tak", value = "tak"},
						{label = "Nie", value = "nie"},
					}
				}, function(data2, menu2)
					local akcja = data2.current.value
					local vehicleProps  = ESX.Game.GetVehicleProperties(vehicle)
					local tablica = vehicleProps.plate
					if akcja == 'tak' then
						SetVehicleExtra(vehicle, dodatek2, 1)
						TriggerServerEvent('xlem0n_policejob:DodatkiKup', tablica, dodatekTekst, false)
					elseif akcja == 'nie' then
						SetVehicleExtra(vehicle, dodatek2, 0)
					end
					menu2.close()
					Citizen.Wait(200)
					OpenDodatkiGarazMenu()
				end, function(data2, menu2)
					menu2.close()
				end)
				
			elseif posiada == false then
				SetVehicleExtra(vehicle, dodatek2, 0)
				menu.close()

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'sklep_dodatki_policja_kup', {
					title = 'Potwierdzić montaż?',
					align = 'left',
					elements = {
						{label = "Tak - Zamontuj", value = "tak"},
						{label = "Nie - Anuluj", value = "nie"},
					}
				}, function(data3, menu3)
					local akcja = data3.current.value
					local vehicleProps  = ESX.Game.GetVehicleProperties(vehicle)
					local tablica = vehicleProps.plate
					if akcja == 'tak' then
						TriggerServerEvent('xlem0n_policejob:DodatkiKup', tablica, dodatekTekst, true)
					elseif akcja == 'nie' then
						SetVehicleExtra(vehicle, dodatek2, 1)
					end
					
					menu3.close()
					Citizen.Wait(200)
					OpenDodatkiGarazMenu()
				end, function(data3, menu3)
					menu3.close()
				end)
			end
		end
	end, function(data, menu)
		menu.close()
		CurrentAction = 'menu_dodatki'
		CurrentActionMsg = ""
		CurrentActionData = {}
	end)
end
	
	
function SpawnHelicopter(partNum)
	local helicopters = Config.PoliceStations.Helicopters

	if not IsAnyVehicleNearPoint(helicopters[partNum].spawnPoint.x, helicopters[partNum].spawnPoint.y, helicopters[partNum].spawnPoint.z,  3.0) then
		ESX.Game.SpawnVehicle('pd_heli', helicopters[partNum].spawnPoint, helicopters[partNum].heading, function(vehicle)
		  SetVehicleLivery(vehicle, 0)
		  local localVehPlate = string.lower(GetVehicleNumberPlateText(vehicle))
		  TriggerEvent('ls:dodajklucze2', localVehPlate)
	  end)
	end
end

CreateThread(function()
	while true do
		if PlayerData.job ~= nil and (PlayerData.job.name == 'police' or PlayerData.job.name == 'sheriff') then
			if not inVehicle then
				local timer = 10
				local found = false
				for _, prop in ipairs({
					`prop_roadcone02a`,
					`prop_barrier_work06a`,
					`p_ld_stinger_s`,
					`prop_barrier_work05`
				}) do
					local object = GetClosestObjectOfType(coords.x,  coords.y,  coords.z,  2.0,  prop, false, false, false)
					if DoesEntityExist(object) then
						CurrentAction     = 'remove_entity'
						CurrentActionMsg  = _U('remove_prop')
						CurrentActionData = {entity = object}
						found = true
						break
					end
				end

				if not found and CurrentAction == 'remove_entity' then
					CurrentAction = nil
				end

				Citizen.Wait(150)
			else
				Citizen.Wait(1000)
			end
		else
			Citizen.Wait(1000)
		end
	end
end)

local animation = { lib = 'random@mugging3' , base = 'handsup_standing_base', enter = 'handsup_standing_enter', exit = 'handsup_standing_exit', fade = 1 }

function CanCuff(src,l) 
	local playerPed = src
	if l then
		playerPed = GetPlayerPed(src)
	end
	if not playerPed then return end
	local can = false
	if IsEntityPlayingAnim(playerPed, 'dead', 'dead_a', 3) or IsEntityPlayingAnim(playerPed, animation.lib, animation.base, 3) or IsEntityPlayingAnim(playerPed, animation.lib, animation.enter, 3) or IsEntityPlayingAnim(playerPed, animation.lib, animation.exit, 3) or IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) or IsEntityPlayingAnim(playerPed, 'random@mugging3', 'handsup_standing_enter', 3) or IsEntityPlayingAnim(playerPed, 'random@mugging3', 'handsup_standing_exit', 3) or IsEntityPlayingAnim(playerPed, 'mini@cpr@char_b@cpr_def', 'cpr_pumpchest_idle', 3) or IsEntityDead(playerPed) or IsPedBeingStunned(playerPed) or IsPedSwimming(playerPed) or IsPedSwimmingUnderWater(playerPed) or IsEntityPlayingAnim(playerPed, "missminuteman_1ig_2", "handsup_enter", 3) or IsEntityPlayingAnim(playerPed, "random@arrests@busted", "enter", 3) or IsEntityPlayingAnim(playerPed, "random@mugging3", "handsup_standing_base", 3) then
	can = true
	end
	if not l and IsEntityDead(playerPed) then
		can = false
	end
	return can
end

function RestrictedMenu()
	ESX.UI.Menu.CloseAll()
	
	TriggerEvent('skinchanger:getSkin', function(skin)
		currentSkin = skin
	end)
	
	TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)
		menu.close()
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
			title = _U('valid_this_purchase'),
			align = 'center',
			elements = {
				{label = _U('no'), value = 'no'},
				{label = _U('yes'), value = 'yes'}
			}
		}, function(data, menu)
			menu.close()

			local t = true
			if data.current.value == 'yes' then
				ESX.TriggerServerCallback('esx_clotheshop:buyClothes', function(bought)
					if bought then
						
						TriggerEvent('skinchanger:getSkin', function(skin)
							TriggerServerEvent('esx_skin:save', skin)
							currentSkin = skin
						end)

						ESX.TriggerServerCallback('esx_clotheshop:checkPropertyDataStore', function(foundStore)
							if foundStore then
								ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'save_dressing',
								{
									title = _U('save_in_dressing'),
									align = 'center',
									elements = {
										{label = _U('no'),  value = 'no'},
										{label = _U('yes'), value = 'yes'}
									}
								}, function(data2, menu2)
									menu2.close()

									if data2.current.value == 'yes' then
										ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'outfit_name', {
											title = _U('name_outfit')
										}, function(data3, menu3)
											menu3.close()

											TriggerEvent('skinchanger:getSkin', function(skin)
												TriggerServerEvent('esx_clotheshop:saveOutfit', data3.value, skin)
												ESX.ShowNotification('~g~Ubranie zostalo zapisane w domu\n~b~Nazwą zapisanego ubrania: ~g~'..data3.value)
												t = true												
											end)
										end, function(data3, menu3)
											menu3.close()
										end)
									end
								end)
							end
						end)

					else
						t = false
						ESX.ShowNotification(_U('not_enough_money'))
						cleanPlayer()
					end
				end)
			elseif data.current.value == 'no' then
				OpenShopMenu()
				t = false
			end
			
			if t then
				CurrentAction     = 'shop_menu'
				CurrentActionMsg  = _U('press_menu')
				CurrentActionData = {}
			end
		end, function(data, menu)
			menu.close()
			cleanPlayerskin()
		end)

	end, function(data, menu)
		menu.close()
		cleanPlayerskin()
		
		CurrentAction     = 'shop_menu'
		CurrentActionMsg  = _U('press_menu')
		CurrentActionData = {}
	end, {
		'tshirt_1',
		'tshirt_2',
		'torso_1',
		'torso_2',
		'decals_1',
		'decals_2',
		'arms',
		'pants_1',
		'pants_2',
		'shoes_1',
		'shoes_2',
		'chain_1',
		'chain_2',
		'watches_1',
		'watches_2',
		'helmet_1',
		'helmet_2',
		'mask_1',
		'mask_2',
		'glasses_1',
		'glasses_2',
		'bags_1',
		'bags_2',
		'bproof_1',
		'bproof_2'
	})
end

function OpenShopMenu()
	local elements = {
		{label = _U('shop_clothes'),  value = 'shop_clothes'},
		{label = ('Własne ubrania'), value = 'player_dressing'}
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_main', {
		title    = _U('shop_main_menu'),
		align    = 'center',
		elements = elements,
    }, function(data, menu)
		menu.close()
		if data.current.value == 'shop_clothes' then
			RestrictedMenu()
		end

		if data.current.value == 'player_dressing' then
			OpenClothes()
		end
    end, function(data, menu)
		menu.close()
		CurrentAction     = 'shop_menu'
		CurrentActionMsg  = _U('press_menu')
		CurrentActionData = {}
    end)
end

function OpenClothes()
	ESX.TriggerServerCallback('esx_property:getPlayerDressing', function(dressing)
		local elements = {}
		for k,v in pairs(dressing) do
			table.insert(elements, {label = v, value = k})
		end
		
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dress_menu',{
			title    = 'Garderoba',
			align    = 'center',
			elements = elements
		}, function(data, menu)		
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing_opts', {
				title = 'Wybierz ubranie - ' .. data.current.label,
				align = 'center',
				elements = {
					{label = 'Ubierz', value = 'wear'},
					{label = 'Zmień nazwę', value = 'rename'},
					{label = 'Usuń ubranie', value = 'remove'}
				}
			}, function(data2, menu2)
				menu2.close()
				if data2.current.value == 'wear' then
					TriggerEvent('skinchanger:getSkin', function(skin)
						ESX.TriggerServerCallback('esx_property:getPlayerOutfit', function(clothes)
							TriggerEvent('skinchanger:loadClothes', skin, clothes)
							TriggerEvent('esx_skin:setLastSkin', skin)

							TriggerEvent('skinchanger:getSkin', function(skin)
								TriggerServerEvent('esx_skin:save', skin)
							end)
						end, data.current.value)
					end)
				elseif data2.current.value == 'rename' then
					ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'player_dressing_rename', {
						title = 'Zmień nazwę - ' .. data.current.label
					}, function(data3, menu3)
						menu3.close()
						TriggerServerEvent('esx_property:renameOutfit', data.current.value, data3.value)
						ESX.ShowNotification('Zmieniono nazwę ubrania!')
						OpenClothes()
					end, function(data3, menu3)
						menu3.close()
						menu2.open()
					end)
				elseif data2.current.value == 'remove' then
					TriggerServerEvent('esx_property:removeOutfit', data.current.value)
					ESX.ShowNotification('Ubranie usunięte z Twojej garderoby: ' .. data.current.label)
					OpenClothes()
				end
			end, function(data2, menu2)
				menu2.close()
				menu.open()
			end)		
		end, function(data, menu)
			menu.close()
			CurrentAction     = 'shop_menu'
			CurrentActionMsg  = _U('press_menu')
			CurrentActionData = {}
		end)
	end)
end

function cleanPlayerskin()
	TriggerEvent('skinchanger:loadSkin', currentSkin)
	currentSkin = nil
end

  
CreateThread(function()
	while true do
		Citizen.Wait(5)
		if PlayerData.job ~= nil and (PlayerData.job.name == 'police' or PlayerData.job.name == 'sheriff') then
			if CurrentAction ~= nil then
				ESX.ShowHelpNotification(CurrentActionMsg)
				if IsControlJustReleased(0, Keys['E']) then
					if CurrentAction == 'menu_cloakroom' then
						OpenCloakroomMenu()
					elseif CurrentAction == 'menu_pharmacy' then
						OpenPharmacyMenu()
					elseif CurrentAction == 'menu_swat_armory' then
						OpenSWATArmoryMenu()
					elseif CurrentAction == 'menu_hc_armory' then
						OpenHCArmoryMenu()
					elseif CurrentAction == 'menu_vehicle_spawner' then
						OpenVehicleSpawnerMenu(CurrentActionData.partNum)
					elseif CurrentAction == 'delete_vehicle' then
						ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
					elseif CurrentAction == 'menu_lodzie_spawner' then
						OpenLodzieSpawnerMenu(CurrentActionData.partNum)
					elseif CurrentAction == 'menu_helicopter_spawner' then
						ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
							if hasWeaponLicense then
								SpawnHelicopter(CurrentActionData.partNum)
							else
								ESX.ShowNotification("~r~Nie posiadasz odpowiedniej licencji")
							end
						end, GetPlayerServerId(pID), 'heli')
					elseif CurrentAction == 'menu_dodatki' then
						OpenDodatkiGarazMenu()
					elseif CurrentAction == 'menu_fixing' then
						if exports["ocean_localmecano"]:CanRepairVehicle() then
							exports["ocean_localmecano"]:RepairVehicle(true)
						end
					elseif CurrentAction == 'menu_boss_actions' then
						ESX.UI.Menu.CloseAll()
						if (PlayerData.job.name == 'police' and PlayerData.job.grade >= 10) then
							TriggerEvent('esx_society:openBossMenu', 'police', function(data, menu)
								menu.close()
								CurrentAction     = 'menu_boss_actions'
								CurrentActionMsg  = _U('open_bossmenu')
								CurrentActionData = {}
							end, { showmoney = true, withdraw = true, deposit = true, wash = true, employees = true, badges = true, licenses = true})
						elseif (PlayerData.job.name == 'sheriff' and PlayerData.job.grade >= 11) then
							TriggerEvent('esx_society:openBossMenu', 'sheriff', function(data, menu)
								menu.close()
								CurrentAction     = 'menu_boss_actions'
								CurrentActionMsg  = _U('open_bossmenu')
								CurrentActionData = {}
							end, { showmoney = true, withdraw = true, deposit = true, wash = true, employees = true, badges = true, licenses = true})
						elseif (PlayerData.job.name == 'police' and PlayerData.job.grade < 10) then
							TriggerEvent('esx_society:openBossMenu', 'police', function(data, menu)
								menu.close()
								CurrentAction     = 'menu_boss_actions'
								CurrentActionMsg  = _U('open_bossmenu')
								CurrentActionData = {}
							end, { showmoney = false, withdraw = false, deposit = true, wash = true, employees = false, badges = false, licenses = false})
						elseif (PlayerData.job.name == 'sheriff' and PlayerData.job.grade < 11) then
						TriggerEvent('esx_society:openBossMenu', 'sheriff', function(data, menu)
							menu.close()
							CurrentAction     = 'menu_boss_actions'
							CurrentActionMsg  = _U('open_bossmenu')
							CurrentActionData = {}
						end, { showmoney = false, withdraw = false, deposit = true, wash = true, employees = false, badges = false, licenses = false})
					else
						ESX.ShowNotification('Nie posiadasz dostępu!')
					end
					elseif CurrentAction == 'remove_entity' then
						DeleteEntity(CurrentActionData.entity)
					elseif CurrentAction == 'menu_skin' then
						OpenShopMenu()
					elseif CurrentAction == 'change_job' then
						OpenChangeJobMenu()
					end
				
					CurrentAction = nil
				end
			else
				Wait(500)
			end
		else
			Wait(500)
		end
	end
end)

RegisterCommand('-policef6', function(source, args, rawCommand)
	if  not isDead and PlayerData.job ~= nil and (PlayerData.job.name == 'police' or PlayerData.job.name == 'sheriff') and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'police_actions') then
		OpenPoliceActionsMenu()
	end
end, false)

RegisterKeyMapping('-policef6', 'Otwórz policyjne menu', 'keyboard', 'F6')

CreateThread(function()
	while true do
		Wait(10)
		if PlayerData.job ~= nil and (PlayerData.job.name == 'police' or PlayerData.job.name == 'sheriff')then
			if IsControlPressed(0, Keys['centerSHIFT']) then
				DisableControlAction(0, Keys['Q'], true)
				if IsDisabledControlJustPressed(0, Keys['Q']) and not IsPedInAnyVehicle(playerPed) and not isDead and not IsHandcuffed then
					local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
					if closestPlayer ~= -1 and closestDistance <= 3.0 and not IsPedInAnyVehicle(Citizen.InvokeNative(0x43A66C31C68491C0, closestPlayer)) then
						if CanCuff(closestPlayer, true) then
							animacjazakuciarozkuciaxd()
							Citizen.Wait(700)
							TriggerServerEvent('xlem0n_policejob:handcuffhype', GetPlayerServerId(closestPlayer))
							ESX.ShowNotification('~o~Zakułeś/Odkułeś ~g~[' .. GetPlayerServerId(closestPlayer) ..']')
						else
							ESX.ShowNotification("~r~Osoba którą próbujesz zakuć nie ma rąk w górze")
						end	
					else
						ESX.ShowNotification("~r~Brak osób w pobliżu")
					end
				end
				
				if IsControlJustPressed(0, Keys['E']) and not IsPedInAnyVehicle(playerPed) and not isDead and not IsHandcuffed then
					local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
					if closestPlayer ~= -1 and closestDistance <= 3.0 then
						TriggerServerEvent('esx_policejob:drag', GetPlayerServerId(closestPlayer))
					else
						ESX.ShowNotification("~r~Brak osób w pobliżu")
					end
				end
			end

			
			if IsControlJustReleased(0, Keys['E']) and CurrentTask.Busy then
				ESX.ShowNotification(_U('impound_canceled'))
				ESX.ClearTimeout(CurrentTask.Task)
				ClearPedTasks(playerPed)
				
				CurrentTask.Busy = false
			end 
		else
			Wait(500)
		end
	end
end)
  
RegisterNetEvent('esx_policejob:removedGPS')
AddEventHandler('esx_policejob:removedGPS', function(data)
	ESX.ShowNotification("~r~Utracono połączenie z nadajnikiem ~w~\n" .. data.name)
	local alpha = 250
	local gpsBlip = AddBlipForCoord(data.coords)
	SetBlipSprite(gpsBlip, 280)
	SetBlipColour(gpsBlip, 3)
	SetBlipAlpha(gpsBlip, alpha)
	SetBlipScale(gpsBlip, 1.2)
	SetBlipAsShortRange(gpsBlip, false)
	SetBlipCategory(gpsBlip, 15)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("# OSTATNIA LOKALIZACJA " .. data.name)
	EndTextCommandSetBlipName(gpsBlip)
	
	for i=1, 25, 1 do
		PlaySound(-1, "Bomb_Disarmed", "GTAO_Speed_Convoy_Soundset", 0, 0, 1)
		Wait(300)
		PlaySound(-1, "OOB_Cancel", "GTAO_FM_Events_Soundset", 0, 0, 1)
		Wait(300)
	end
	
	while alpha ~= 0 do
		Citizen.Wait(180 * 4)
		alpha = alpha - 1
		SetBlipAlpha(gpsBlip, alpha)
		if alpha == 0 then
			RemoveBlip(gpsBlip)
			return
		end
	end
end)
  
AddEventHandler('playerSpawned', function(spawn)
	isDead = false
	TriggerEvent('xlem0n_policejob:unrestrain')
end)
  
AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)
  
AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('xlem0n_policejob:unrestrain')

		if Config.EnableHandcuffTimer and HandcuffTimer then
			ESX.ClearTimeout(HandcuffTimer)
		end
	end
end)

function StartHandcuffTimer()
	if Config.EnableHandcuffTimer and HandcuffTimer then
		ESX.ClearTimeout(HandcuffTimer)
	end
	
	HandcuffTimer = ESX.SetTimeout(Config.HandcuffTimer, function()
		ESX.ShowNotification("~y~Czujesz jak Twoje kajdanki luzują się...")
		TriggerEvent('xlem0n_policejob:unrestrain')
		TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 3, "Uncuff", 0.4)
	end)
end
  
function ImpoundVehicle(vehicle)
	ESX.Game.DeleteVehicle(vehicle) 
	ESX.ShowNotification(_U('impound_successful'))
	CurrentTask.Busy = false
end
  
RegisterNetEvent('Kajdanki')
AddEventHandler('Kajdanki', function()
	if not inVehicle then
		HandcuffMenu()
	end
end)

function MenuBroni()
	local elements = {}
	
	for _,value in ipairs(Config.WeaponShop) do		
		if value.grade <= PlayerData.job.grade or value.job_name == PlayerData.job.grade_name then	
			if value.type == 'weapon' then
				table.insert(elements, {
					label = (value.label) .. (value.price == 0 and ' [<span style="color:green;">DARMOWE</span>]' or ' [<span style="color:green;">'..value.price..'$</span>]'),
					value = value.name,
					price = value.price
				})
			elseif value.type == 'weaponhc' and (PlayerData.job.name == 'police' or PlayerData.job.name == 'sheriff') and PlayerData.job.grade >= 10 then 
				table.insert(elements, {
					label = (value.label) .. (value.price == 0 and ' [<span style="color:green;">DARMOWE</span>]' or ' [<span style="color:green;">'..value.price..'$</span>]'),
					value = value.name,
					price = value.price
				})
			else
				table.insert(elements, {
					label = value.label .. (value.price == 0 and ' [<span style="color:green;">DARMOWE</span>]' or ' [<span style="color:green;">'..value.price..'$</span>]'),
					value = value.name,
					price = value.price
				})
			end
		end
	end
	
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'menubroni', {
		title    = 'Zbrojownia',
		align    = 'center',
		elements = elements
	}, function(data, menu)		
		TriggerServerEvent('xlem0n_policejob:giveWeapon', data.current.value, 250, data.current.price, data.current.label)
	end, function(data, menu)
		menu.close()
		
		OpenPharmacyMenu()
	end)
end

OpenSWATArmoryMenu = function()
	local elements = {
			{label = _U('put_weapon'),     value = 'put_weapon'}, 	
}

ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
	if hasWeaponLicense or (PlayerData.job and PlayerData.job.name == 'police' and PlayerData.job.grade >= 10) or (PlayerData.job and PlayerData.job.name == 'sheriff' and PlayerData.job.grade >= 11) then
		table.insert(elements, {label = _U('get_weapon'),     value = 'get_weapon'})
	end
end, GetPlayerServerId(pID), 'swat')

Wait(100)

ESX.UI.Menu.CloseAll()

ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'swat_armory', {
	title		= "Zbrojownia SWAT",
	align		= 'center',			
	elements = elements
}, function(data, menu)
	if data.current.value == 'put_weapon' then
		TriggerEvent('exile:putInventoryItem', 'society_swat')
	elseif data.current.value == 'get_weapon' then
		TriggerEvent('exile:getInventoryItem', 'society_swat')
	end
end, function(data, menu)
	menu.close()

	CurrentAction		= 'menu_swat_armory'
	CurrentActionMsg	= "Naciśnij ~INPUT_CONTEXT~, aby otworzyć zbrojownię SWAT"
	CurrentActionData	= {}
end)
end

OpenHCArmoryMenu = function()
	local elements = {
			{label = _U('put_weapon'),     value = 'put_weapon'}, 	
}

ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
	if hasWeaponLicense or (PlayerData.job and PlayerData.job.name == 'police' and PlayerData.job.grade >= 10) or (PlayerData.job and PlayerData.job.name == 'sheriff' and PlayerData.job.grade >= 11) then
		table.insert(elements, {label = _U('get_weapon'),     value = 'get_weapon'})
	end
end, GetPlayerServerId(pID), 'hc')

Wait(100)

ESX.UI.Menu.CloseAll()

ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'hc_armory', {
	title		= "Zbrojownia High Command",
	align		= 'center',			
	elements = elements
}, function(data, menu)
	if data.current.value == 'put_weapon' then
		TriggerEvent('exile:putInventoryItem', 'society_highcommand')
	elseif data.current.value == 'get_weapon' then
		TriggerEvent('exile:getInventoryItem', 'society_highcommand')
	end
end, function(data, menu)
	menu.close()

	CurrentAction		= 'menu_hc_armory'
	CurrentActionMsg	= "Naciśnij ~INPUT_CONTEXT~, aby otworzyć zbrojownię High Command"
	CurrentActionData	= {}
end)
end
  
function OpenPharmacyMenu()
  
	local elements = {}

	if (PlayerData.job.name == 'police' or PlayerData.job.name == 'sheriff') then
		elements = {
			{label = 'Pobierz wyposażenie patrolowe', value = 'get_wypo'},
			{label = 'Weź wyposażenie specjalne', value = 'get_wypo2'},
			{label = 'Weź broń',     value = 'get_weapon'}, 	
			{label = _U('remove_object'),  value = 'get_stock'}, 		
			{label = _U('deposit_object'), value = 'put_stock'}, 
		}
	end
  
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pharmacy', {
		title		= _U('pharmacy_menu_title'),
		align		= 'center',			
		elements = elements
	}, function(data, menu)
		if data.current.value == 'put_stock' then
			TriggerEvent('exile:putInventoryItem', 'society_police')
		elseif data.current.value == 'get_wypo' then
			OpenGetWypoMenu()
		elseif data.current.value == 'get_wypo2' then
				ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
					if hasWeaponLicense then
						hasSertLicense = true
						table.insert(elements, {label = "S.W.A.T. Uniforms", value = 'swatuniforms'})
					end
				end, GetPlayerServerId(pID), 'swat')
			if PlayerData.job.grade >= 1 and hasSertLicense then
			OpenGetWypo2Menu()
			else
				ESX.ShowNotification('~r~Nie posiadasz dostępu do tego elementu!')
			end
		elseif data.current.value == 'get_weapon' then
			MenuBroni()
		elseif data.current.value == 'get_stock' then
			TriggerEvent('exile:getInventoryItem', 'society_police')
		end
	end, function(data, menu)
		menu.close()

		CurrentAction		= 'menu_pharmacy'
		CurrentActionMsg	= _U('open_pharmacy')
		CurrentActionData	= {}
	end)
end
  
function OpenGetWypoMenu()
	local elements = {
		{label = _U('pharmacy_takeclip', "Magazynek do pistoletu"), value = 'clip', count = 1},
		{label = _U('pharmacy_takeradio', "Gps"), value = 'gps', count = 1},
		{label = _U('pharmacy_takeradio', "BodyCam"), value = 'bodycam', count = 1},
		{label = _U('pharmacy_takeradio', "Panic Button"), value = 'panic', count = 3},
		{label = _U('pharmacy_takeradio', "Radio"), value = 'radio', count = 1},
		{label = _U('pharmacy_takeradio', "Kamizelka Policyjna 75%"), value = 'kamzasaspsmall', count = 1},
	}
  
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_take_wposazenie', {
		title    = 'Wyposażenie',
		align    = 'center',
		elements = elements
	}, function(data, menu)
		TriggerServerEvent('xlem0n_policejob:giveItem', data.current.value, data.current.count)
	end, function(data, menu)
		menu.close()

		OpenPharmacyMenu()
	end)
end

function OpenGetWypo2Menu()
	local elements = {
		{label = _U('pharmacy_takeflashlight', _U('flashlight')), value = 'flashlight_dodatek', count = 1},
		{label = _U('pharmacy_takeopaska', "Opaska Lokalizacyjna"), value = 'opaska', count = 1},
		{label = _U('pharmacy_takeclip', "Magazynek do pistoletu"), value = 'clip', count = 1},
		{label = _U('pharmacy_takeradio', "Magazynek do broni długiej"), value = 'extendedclip', count = 1},
		{label = _U('pharmacy_takeradio', "IronSights"), value = 'ironsights', count = 1},
		{label = _U('pharmacy_takeradio', "Uchwyt"), value = 'grip', count = 1},
		{label = _U('pharmacy_takeradio', "Celownik"), value = 'scope', count = 1},
		{label = _U('pharmacy_takeradio', "Powiększony Magazynek"), value = 'clip_extended', count = 1},
		{label = _U('pharmacy_takeradio', "Tłumik"), value = 'suppressor', count = 1},
		{label = _U('pharmacy_takeradio', "Kamizelka SWAT 100%"), value = 'kamzasaspbigswat', count = 1},
		{label = _U('pharmacy_takeradio', "Kask SWAT 100%"), value = 'kasksaspswat', count = 1},
	}
  
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_take_wposazenie2', {
		title    = 'Wyposażenie',
		align    = 'center',
		elements = elements
	}, function(data, menu)
		TriggerServerEvent('xlem0n_policejob:giveItem', data.current.value, data.current.count)
		TriggerServerEvent('exile_logs:triggerLog', "Gracz wyjął z Wyposażenia SWAT / HC item: " ..data.current.value.." w ilości: "..data.current.count, 'wyposazenieswatsert')
	end, function(data, menu)
		menu.close()
		
		OpenPharmacyMenu()
	end)
end
  
function loadanimdict(dictname)
	if not HasAnimDictLoaded(dictname) then
		RequestAnimDict(dictname) 
		while not HasAnimDictLoaded(dictname) do 
			Citizen.Wait(1)
		end
	end
end


  
function animacjazakuciarozkuciaxd()
	local ad = "mp_arresting"
	local anim = "a_uncuff"

	if ( DoesEntityExist(playerPed) and not IsEntityDead(playerPed) and not isDead) then
		loadanimdict(ad)
		if (IsEntityPlayingAnim(playerPed, ad, anim, 8)) then
			TaskPlayAnim(playerPed, ad, "exit", 8.0, 3.0, 2000, 26, 1, 0, 0, 0)
			ClearPedSecondaryTask(playerPed)
		else
			TaskPlayAnim(playerPed, ad, anim, 8.0, 3.0, 2000, 26, 1, 0, 0, 0)
		end
	end
end
  
RegisterNetEvent('xlem0n_naprawka')
AddEventHandler('xlem0n_naprawka', function()	
	local vehicle = nil
	if inVehicle then
		vehicle = GetVehiclePedIsIn(playerPed, false)
	else
		vehicle = ESX.Game.GetVehicleInDirection()
		if not vehicle then
			if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
				vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
			end
		end
	end

	if vehicle and vehicle ~= 0 then
		CreateThread(function()
			while not HasAnimDictLoaded("mp_fm_intro_cut") do
				RequestAnimDict("mp_fm_intro_cut")
				Citizen.Wait(0)
			end

			TaskPlayAnim(playerPed, "mp_fm_intro_cut", "fixing_a_ped", 3.0, 1.0, -1, 1, 0, 0, 0, 0)
			Citizen.Wait(20000)
	
			local id = NetworkGetNetworkIdFromEntity(vehicle)
			SetNetworkIdCanMigrate(id, false)

			local tries = 0
			while not NetworkHasControlOfNetworkId(id) and tries < 10 do
				tries = tries + 1
				NetworkRequestControlOfNetworkId(id)
				Citizen.Wait(100)
			end

			local first = true
			while first or not GetIsVehicleEngineRunning(vehicle) do
				SetVehicleEngineHealth(vehicle, 1000.0)
				SetVehicleUndriveable(vehicle, false)

				SetVehicleEngineOn(vehicle, true, true)
				first = false
				Citizen.Wait(0)
			end

			SetNetworkIdCanMigrate(id, true)
			Citizen.InvokeNative(0xAAA34F8A7CB32098, playerPed)
			ESX.ShowNotification('~g~Silnik został naprawiony!')
		end)
	end
end)
  
  
  
RegisterNetEvent('xlem0n_policejob:onHijack')
AddEventHandler('xlem0n_policejob:onHijack', function()
	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
		local vehicle
		if inVehicle then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
		end

		if DoesEntityExist(vehicle) then
			local model = GetEntityModel(vehicle)
			if not IsThisModelAHeli(model) and not IsThisModelAPlane(model) and not IsThisModelABoat(model) then

				CreateThread(function()
					if not exports["ocean_taskbar"]:isBusy() then
						TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
						FreezeEntityPosition(playerPed, true)
					end

					exports["ocean_taskbar"]:taskBar(15000, "Trwa Odblokowywanie", true, function(cb) 
						if cb then
						while GetVehicleDoorsLockedForPlayer(vehicle, pID) ~= false do
							SetVehicleDoorsLocked(vehicle, 1)
							SetVehicleDoorsLockedForAllPlayers(vehicle, false)
							Citizen.Wait(0)
						end
							Citizen.InvokeNative(0xAAA34F8A7CB32098, playerPed)
						ESX.ShowNotification(_U('vehicle_unlocked'))
						FreezeEntityPosition(playerPed, false)
						end
						
					end)
					

				end)
			end
		end
	else
		ESX.ShowNotification('~r~Brak pojazdu w pobliżu')
	end
end)

local fov_max = 150.0
local fov_min = 7.0 
local zoomspeed = 10.0 
local speed_lr = 8.0
local speed_ud = 8.0
local toggle_helicam = 51
local toggle_rappel = 154
local toggle_spotlight = 183 
local toggle_lock_on = 22 

local helicam = false
local pd_heli_hash = `pcj`
local fov = (fov_max+fov_min)*0.5
local vision_state = 0 
  
CreateThread(function()
	while true do
		Wait(3)
		if helicam then
			local heli = GetVehiclePedIsIn(playerPed)
			if not ( IsPedSittingInAnyVehicle( playerPed ) ) then
				CreateThread(function()
					TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_BINOCULARS", 0, 1)
					PlayAmbientSpeech1(playerPed, "GENERIC_CURSE_MED", "SPEECH_PARAMS_FORCE")
				end)
			end	
			
			Wait(2000)
			SetTimecycleModifier("heliGunCam")
			SetTimecycleModifierStrength(0.3)
			local scaleform = RequestScaleformMovie("HELI_CAM")
			while not HasScaleformMovieLoaded(scaleform) do
				Wait(3)
			end

			local cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA", true)

			AttachCamToEntity(cam, playerPed, 0.0,0.0,1.0, true)
			SetCamRot(cam, 0.0,0.0,GetEntityHeading(playerPed))
			SetCamFov(cam, fov)
			RenderScriptCams(true, false, 0, 1, 0)
			PushScaleformMovieFunction(scaleform, "SET_CAM_LOGO")
			PushScaleformMovieFunctionParameterInt(1)
			PopScaleformMovieFunctionVoid()

			local locked_on_vehicle = nil

			while helicam and not IsEntityDead(playerPed) and not isDead and (GetVehiclePedIsIn(playerPed) == heli) and true do

				if IsControlJustPressed(0, 177) then
					PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
					ClearPedTasks(playerPed)
					helicam = false
				end

				if not locked_on_vehicle then
					local zoomvalue = (1.0/(fov_max-fov_min))*(fov-fov_min)
					CheckInputRotation(cam, zoomvalue)
					local vehicle_detected = GetVehicleInView(cam)
				end

				HandleZoom(cam)
				HideHUDThisFrame()

				DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
				Wait(3)

			end

			helicam = false

			ClearTimecycleModifier()

			fov = (fov_max+fov_min)*0.5

			RenderScriptCams(false, false, 0, 1, 0)

			SetScaleformMovieAsNoLongerNeeded(scaleform)

			DestroyCam(cam, false)
			SetNightvision(false)
			SetSeethrough(false)
		else
			Citizen.Wait(1000)
		end
	end
end)

RegisterNetEvent('exile_lorneta:lornetaon')
AddEventHandler('exile_lorneta:lornetaon', function()
	helicam = not helicam
	ESX.UI.Menu.CloseAll()
end)
  
function IsPlayerInPolmav()
	local vehicle = GetVehiclePedIsIn(playerPed)
	return IsVehicleModel(vehicle, polmav_hash)
end
  
function ChangeVision()
	if vision_state == 0 then
		SetNightvision(true)
		vision_state = 1
	elseif vision_state == 1 then
		SetNightvision(false)
		SetSeethrough(true)
		vision_state = 2
	else
		SetSeethrough(false)
		vision_state = 0
	end
end
  
function HideHUDThisFrame()
	HideHelpTextThisFrame()
	HideHudComponentThisFrame(19) 
	HideHudComponentThisFrame(1) 
	HideHudComponentThisFrame(2) 
	HideHudComponentThisFrame(3)
	HideHudComponentThisFrame(4)
	HideHudComponentThisFrame(13)
	HideHudComponentThisFrame(11) 
	HideHudComponentThisFrame(12) 
	HideHudComponentThisFrame(15) 
	HideHudComponentThisFrame(18)
end
  
function CheckInputRotation(cam, zoomvalue)
	local centerAxisX = GetDisabledControlNormal(0, 220)
	local centerAxisY = GetDisabledControlNormal(0, 221)
	local rotation = GetCamRot(cam, 2)
	if centerAxisX ~= 0.0 or centerAxisY ~= 0.0 then
		new_z = rotation.z + centerAxisX*-1.0*(speed_ud)*(zoomvalue+0.1)
		new_x = math.max(math.min(20.0, rotation.x + centerAxisY*-1.0*(speed_lr)*(zoomvalue+0.1)), -89.5)
		SetCamRot(cam, new_x, 0.0, new_z, 2)
	end
end
  
function HandleZoom(cam)
	if not ( IsPedSittingInAnyVehicle( playerPed ) ) then
		if IsControlJustPressed(0,32) then 
			fov = math.max(fov - zoomspeed, fov_min)
		end
		if IsControlJustPressed(0,8) then
			fov = math.min(fov + zoomspeed, fov_max)	
		end
		local current_fov = GetCamFov(cam)
		if math.abs(fov-current_fov) < 0.1 then 
			fov = current_fov
		end
		SetCamFov(cam, current_fov + (fov - current_fov)*0.05) 
	else
		if IsControlJustPressed(0,241) then 
			fov = math.max(fov - zoomspeed, fov_min)
		end
		if IsControlJustPressed(0,242) then
			fov = math.min(fov + zoomspeed, fov_max)
		end
		local current_fov = GetCamFov(cam)
		if math.abs(fov-current_fov) < 0.1 then
			fov = current_fov
		end
		SetCamFov(cam, current_fov + (fov - current_fov)*0.05)
	end
end

function GetVehicleInView(cam)
	local coords = GetCamCoord(cam)
	local forward_vector = RotAnglesToVec(GetCamRot(cam, 2))
	local rayhandle = CastRayPointToPoint(coords, coords+(forward_vector*200.0), 10, GetVehiclePedIsIn(playerPed), 0)
	local _, _, _, _, entityHit = GetRaycastResult(rayhandle)
	if entityHit>0 and IsEntityAVehicle(entityHit) then
		return entityHit
	else
		return nil
	end
end

AddEventHandler('esx:onPlayerDeath', function(reason)
	TriggerServerEvent("exilerp:CLdeath")
end)
AddEventHandler('playerSpawned', function() 
	TriggerServerEvent("exilerp:CLrev")
end)

function RotAnglesToVec(rot)
	local z = math.rad(rot.z)
	local x = math.rad(rot.x)
	local num = math.abs(math.cos(x))
	return vector3(-math.sin(z)*num, math.cos(z)*num, math.sin(x))
end

RegisterCommand("ulecz",function(source, cmd)
	if PlayerData.job.name == 'ambulance' then
		ESX.TriggerServerCallback("esx_scoreboard:getConnectedCops", function(MisiaczekPlayers)
			if MisiaczekPlayers then
				if PlayerData.job.grade >= 2 then 
					TriggerServerEvent('esx_policejob:es', cmd)
				elseif PlayerData.job.grade <= 1 and MisiaczekPlayers['ambulance'] <= 1 then
					TriggerServerEvent('esx_policejob:es', cmd)
				else
					ESX.ShowNotification('Nie możesz używać uleczki')
				end
			end
		end)
	else
		if (PlayerData.job.name == 'police' or PlayerData.job.name == 'sheriff') then
			if PlayerData.job.grade > 4 and PlayerData.job.grade <= 10 then
				ESX.TriggerServerCallback("esx_scoreboard:getConnectedCops", function(MisiaczekPlayers)
					if MisiaczekPlayers then
						if MisiaczekPlayers['ambulance'] == 0 then
							TriggerServerEvent('esx_policejob:es', cmd)
						else
							ESX.ShowNotification('~r~Aby pomóc wezwij EMS')
						end
					end
				end)
			elseif PlayerData.job.grade > 10 then
				TriggerServerEvent('esx_policejob:es', cmd)
			elseif PlayerData.job.grade <= 2 then
				ESX.ShowNotification('~r~Nie masz odpowiedniego wyszkolenia do pomocy obywatelom')
			end
		end
	end
end)

--10-13
local cooldown = 0

AddEventHandler("onClientMapStart", function()
	TriggerEvent("chat:addSuggestion", "/10-13", "10-13")
	TriggerEvent("chat:addTemplate", "10-13", "<img src='data:image/png;base64,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' height='16'> <b>{0}</b>: {1}")
end)

CreateThread(function()
	while true do
		if cooldown > 0 then
			Citizen.Wait(1000)
			cooldown = cooldown - 1
		else
			Citizen.Wait(2000)
		end
	end
end)

RegisterCommand("10-13", function()
	if PlayerData.job.name == 'police' or PlayerData.job.name == 'sheriff' or PlayerData.job.name == 'ambulance' then
		if exports["esx_ambulancejob"]:isDead() then
			if cooldown <= 0 then
			
				cooldown = 60
				local Officer = {}
				Officer.Player = pID
				Officer.Ped = playerPed
				Officer.Coords = coords
				Officer.Location = {}
				Officer.Location.Street, Officer.Location.CrossStreet = GetStreetNameAtCoord(Officer.Coords.x, Officer.Coords.y, Officer.Coords.z)
				Officer.Location.Street = GetStreetNameFromHashKey(Officer.Location.Street)
				if Officer.Location.CrossStreet ~= 0 then
					Officer.Location.CrossStreet = GetStreetNameFromHashKey(Officer.Location.CrossStreet)
					Officer.Location = Officer.Location.Street .. " X " .. Officer.Location.CrossStreet
				else
					Officer.Location = Officer.Location.Street
				end
				TriggerServerEvent("break_10-13srp:request", Officer)
			else
				ESX.ShowNotification('~r~Nie możesz używać 10-13 tak często!')
			end
		else
			ESX.ShowNotification('~r~Czujesz się zbyt dobrze, aby użyć 10-13')
		end
	else
		ESX.ShowNotification("Nie jesteś do tego ~r~uprawniony")
	end
end)

RegisterNetEvent("break_10-13srp:alert")
AddEventHandler("break_10-13srp:alert", function(Officer, name, jobTxt)
	PlaySoundFrontend(-1, "HACKING_CLICK_GOOD", 0, 1)

	TriggerEvent("chatMessage", '^0[^3Centrala^0] ', { 0, 0, 0 }, "^*^110-13: ^*^7 " .. jobTxt .. " " .. name .. " | ^*^1Ulica ^*^7" .. Officer.Location)
	
	CreateThread(function()
		local Blip = AddBlipForCoord(Officer.Coords.x, Officer.Coords.y, Officer.Coords.z)
		SetBlipSprite (Blip, 303)
		SetBlipDisplay(Blip, 4)
		SetBlipScale  (Blip, 1.0)
		SetBlipColour (Blip, 3)
		SetBlipAsShortRange(Blip, false)
		SetBlipCategory(Blip, 14)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("[10-13] " .. name)
		EndTextCommandSetBlipName(Blip)
		Citizen.Wait(60000)
		RemoveBlip(Blip)
		Blip = nil
	end)
end)

RegisterNetEvent('flux:getCoords')
AddEventHandler('flux:getCoords', function()
	local Officer = {}
	Officer.Player = pID
	Officer.Ped = playerPed
	Officer.Coords = coords
	Officer.Location = {}
	Officer.Location.Street, Officer.Location.CrossStreet = GetStreetNameAtCoord(Officer.Coords.x, Officer.Coords.y, Officer.Coords.z)
	Officer.Location.Street = GetStreetNameFromHashKey(Officer.Location.Street)
	if Officer.Location.CrossStreet ~= 0 then
		Officer.Location.CrossStreet = GetStreetNameFromHashKey(Officer.Location.CrossStreet)
		Officer.Location = Officer.Location.Street .. " X " .. Officer.Location.CrossStreet
	else
		Officer.Location = Officer.Location.Street
	end
	TriggerServerEvent("flux:panicrequest", Officer)
end)

RegisterNetEvent("flux:triggerpanic")
AddEventHandler("flux:triggerpanic", function(Officer, name)
	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 1.0, 'panic2', 0.1)
	
	TriggerEvent("chatMessage", '^0[^3Centrala^0] ', {0, 0, 0}, "^*CODE 0:^*^7 " .. name .. " | ^*^1Ulica ^*^7" .. Officer.Location)

	CreateThread(function()
		local Blip = AddBlipForCoord(Officer.Coords.x, Officer.Coords.y, Officer.Coords.z)
		SetBlipSprite (Blip, 378)
		SetBlipDisplay(Blip, 4)
		SetBlipScale  (Blip, 1.0)
		SetBlipColour (Blip, 3)
		SetBlipAsShortRange(Blip, false)
		SetBlipCategory(Blip, 14)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("[CODE 0] " .. name)
		EndTextCommandSetBlipName(Blip)
		Citizen.Wait(90000)
		RemoveBlip(Blip)
		Blip = nil
	end)
end)

--Okup
local Walizki = {}
local Walizka = nil

RegisterNetEvent('esx_policejob:spawnWalizka')
AddEventHandler('esx_policejob:spawnWalizka', function(waliza)
	local forward   = GetEntityForwardVector(playerPed)
	local x, y, z   = table.unpack(coords + forward * 1.0)
	
	ESX.ShowNotification('~y~Rozstawiłeś walizkę z okupem.')
	ESX.Game.SpawnObject('prop_cash_case_02', { x = x, y = y, z = z }, function(obj)
		SetEntityHeading(obj, GetEntityHeading(playerPed) + 180)
		PlaceObjectOnGroundProperly(obj)

		x, y, z = table.unpack(GetEntityCoords(obj))
		TriggerServerEvent('esx_policejob:spawnWalizka', waliza, { x = x, y = y, z = z })
	end)
end)

RegisterNetEvent('esx_policejob:spawnedWalizka')
AddEventHandler('esx_policejob:spawnedWalizka', function(waliza, coords, amount)
	table.insert(Walizki, {id = waliza, coords = coords, amount = amount})
end)

RegisterNetEvent('esx_policejob:despawnWalizka')
AddEventHandler('esx_policejob:despawnWalizka', function(walizka)
	for i, waliza in ipairs(Walizki) do
		if waliza.id == walizka then
			local object = GetClosestObjectOfType(waliza.coords.x, waliza.coords.y, waliza.coords.z, 3.0, `prop_cash_case_02`, false, false, false)
			if DoesEntityExist(object) then
				DeleteObject(object)
			end

			table.remove(Walizki, i)
			break
		end
	end
end)

function DrawText3Ds(x, y, z, text)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = #(vec3(px, py, pz) - vec3(x, y, z))

    local scale = (1 / dist) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    
    SetTextScale(0.4, 0.4)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextCentre(1)

    SetTextEntry("STRING")
    AddTextComponentString(text)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    DrawText(_x,_y)

	local factor = text:len() / 250
	DrawRect(_x, _y + 0.0125, 0.005 + factor, 0.03, 41, 11, 41, 68)
end

CreateThread(function()
	while true do
		Citizen.Wait(2)
		if PlayerData.job ~= nil and PlayerData.job.name ~= 'police' and PlayerData.job.name ~= 'offpolice' and PlayerData.job.name ~= 'ambulance' and PlayerData.job.name ~= 'offambulance' and PlayerData.job.name ~= 'sheriff' and PlayerData.job.name ~= 'offsheriff' then
			local sleep =  true
			for i, waliza in ipairs(Walizki) do
				local objectDistance = #(coords - vec3(waliza.coords.x, waliza.coords.y, waliza.coords.z))
				if objectDistance < 5.0 then
					sleep = false
					DrawText3Ds(waliza.coords.x, waliza.coords.y, waliza.coords.z + 0.2, "Naciśnij [E] aby podnieść okup")
					if objectDistance < 1.3 and IsControlJustPressed(0, 38) then
						local PlayerData = ESX.GetPlayerData
						ESX.TriggerServerCallback('esx_policejob:tryWalizka', function(allow)
							if allow then
								RequestAnimDict("amb@prop_human_bum_bin@idle_b")
								while not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b") do
									Citizen.Wait(0)
								end

								TaskPlayAnim(playerPed, "amb@prop_human_bum_bin@idle_b", "idle_d", 100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0)
								Citizen.Wait(2000)
								StopAnimTask(playerPed, "amb@prop_human_bum_bin@idle_b", "idle_d", 1.0)

								ESX.ShowNotification("~o~Podniosłeś walizkę. Otworzysz ją za 60 sekund.")							
								TriggerServerEvent('esx_policejob:grabWalizka', waliza.id)

								Walizka = {obj = CreateObject(`prop_security_case_01`, 0, 0, 0, true, true, true), timer = 60, id = waliza.id, amount = waliza.amount}
								AttachEntityToEntity(Walizka.obj, playerPed, GetPedBoneIndex(playerPed, 57005), 0.12, 0, -0.02, 0, 270.0, 60.0, true, true, false, true, 1, true)
							end
						end, waliza.id)
					end
				end
			end
			if sleep then
				Citizen.Wait(666)
			end
		else
			Citizen.Wait(666)
		end
	end
end)

CreateThread(function()
	while true do
		Citizen.Wait(2)
		if Walizka then
			while Walizka.timer > 0 do
				Citizen.Wait(1000)
				Walizka.timer = Walizka.timer - 1
			end

			TriggerServerEvent('esx_policejob:openWalizka', Walizka.id)
			DeleteObject(Walizka.obj)
			Walizka = nil
		else
			Citizen.Wait(666)
		end
	end
end)

CreateThread(function()
	while true do
		Citizen.Wait(2)
		if Walizka and Walizka.timer > 0 then
			SetTextFont(4)
			SetTextProportional(1)
			SetTextScale(0.45, 0.45)
			SetTextColour(255, 255, 255, 255)
			SetTextDropShadow(0, 0, 0, 0, 255)
			SetTextEdge(1, 0, 0, 0, 255)
			SetTextDropShadow()
			SetTextOutline()

			SetTextEntry('STRING')
			AddTextComponentString("Otworzysz walizkę ($" .. Walizka.amount .. " brudnej gotówki) za: " .. math.floor(Walizka.timer))
			DrawText(table.unpack({ 0.175, 0.955 }))
			SetCurrentPedWeapon(playerPed, `WEAPON_UNARMED`, true)
		else
			Citizen.Wait(666)
		end
	end
end)
local shield = {
    active = false,
    id = 0,
    prop = 0,
    inVehicle = false,
}

local shieldTypes = ""
Citizen.CreateThread(function()
    for k, v in pairs(shields) do
        if shieldTypes == "" then
            shieldTypes = v.name
        else
            shieldTypes = shieldTypes..", "..v.name
        end
    end

    while true do
        if shield.active then
            Wait(0)
            local ped = PlayerPedId()
            DisablePlayerFiring(ped)
            if IsPedInAnyVehicle(ped, true) then
                if not shield.inVehicle then
                    SetEntityCollision(shield.prop, false, true)
                    shield.inVehicle = true
                end
            else
                if shield.inVehicle then
					removeShield(notify)
                    shield.inVehicle = false
                end
            end
            if not shield.inVehicle then
                if shields[shield.id] ~= nil and shields[shield.id].animDict ~= nil and shields[shield.id].animName ~= nil then
                    if not IsEntityPlayingAnim(ped, shields[shield.id].animDict, shields[shield.id].animName, 3) then
                        TaskPlayAnim(ped, shields[shield.id].animDict, shields[shield.id].animName, 8.0, -8.0, -1, 50, 0.0, 0, 0, 0)
                    end
                end
                
            end
        else
            Wait(1000)
        end
    end
end)

RegisterNetEvent('Client:toggleShield')
AddEventHandler('Client:toggleShield', function(type)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    if vehicle ~= 0 and vehicle ~= nil then
        ESX.ShowNotification(translations.outsideVehicle) return
    end
    if shield.active then
        if type == nil then removeShield(true) return end
        createShield(type)
    else
        if type == nil then ESX.ShowNotification(translations.noArguments) return end
        createShield(type)
    end
end)

function removeShield(notify)
	DisableControlAction(2, 24, false) 
	DisableControlAction(2, 18, false)
    if DoesEntityExist(shield.prop) then
        local ped = PlayerPedId()
		shieldStatus = false 
        DetachEntity(shield.prop)
        DeleteEntity(shield.prop)
        shield.id = 0
        shield.active = false
        ClearPedTasks(ped)
        ClearPedTasksImmediately(ped)
        SetWeaponAnimationOverride(ped, GetHashKey("Default"))
        if notify then
            ESX.ShowNotification(translations.shieldRemoved)
        end
    end
end

CreateThread(function()

	while(1) do
	
		Wait(1000)

		if(shieldStatus) then
		
			if(IsPedInAnyVehicle(PlayerPedId(), false)) then
			
				removeShield(false)

				ESX.ShowNotification('~r~Nie można wsiąść do auta z Tarczą!')

			end

		end
		
	end

end)

function createShield(type)
    local found = false
    local id = 0
    for k, v in pairs(shields) do
        if v.name == type then
            found = true
            id = k
            break
        end
    end
    if not found then
        ESX.ShowNotification(translations.invalidShieldType) return
    end
    shield.id = id
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    if shield.active then removeShield(false) end
    RequestModel(shields[id].model)
    while not HasModelLoaded(shields[id].model) do Wait(0) end
    shield.prop = CreateObject(shields[id].model, coords.x, coords.y, coords.z, true, true, true)
    while not DoesEntityExist(shield.prop) do Wait(0) end
    if not shields[id].collision then
        SetEntityCollision(shield.prop, false, true)
    end
    SetWeaponAnimationOverride(ped, GetHashKey("Gang1H"))
	shieldStatus = true
	DisableControlAction(2, 24, true) DisableControlAction(2, 18, true)
    SetEnableHandcuffs(ped, false)
    RequestAnimDict(shields[id].animDict)
    while not HasAnimDictLoaded(shields[id].animDict) do Wait(0) end
    TaskPlayAnim(ped, shields[id].animDict, shields[id].animName, 8.0, -8.0, -1, 50, 0.0, 0, 0, 0)
    local bone = GetPedBoneIndex(ped, shields[id].boneIndex)
    AttachEntityToEntity(shield.prop, ped, bone, shields[id].offSet[1], shields[id].offSet[2], shields[id].offSet[3], shields[id].rotation[1], shields[id].rotation[2], shields[id].rotation[3], true, true, shields[id].collision, false, 1, true)
    shield.active = true
end