--[[
          _                               
         | |                              
__      _| |__  _   _   _   _  ___  _   _ 
\ \ /\ / / '_ \| | | | | | | |/ _ \| | | |
 \ V  V /| | | | |_| | | |_| | (_) | |_| |
  \_/\_/ |_| |_|\__, |  \__, |\___/ \__,_|
                 __/ |   __/ |            
                |___/   |___/             
     _                       _                     _                       
    | |                     (_)                   (_)                      
  __| |_   _ _ __ ___  _ __  _ _ __   __ _   _ __  _  __ _  __ _  ___ _ __ 
 / _` | | | | '_ ` _ \| '_ \| | '_ \ / _` | | '_ \| |/ _` |/ _` |/ _ \ '__|
| (_| | |_| | | | | | | |_) | | | | | (_| | | | | | | (_| | (_| |  __/ |   
 \__,_|\__,_|_| |_| |_| .__/|_|_| |_|\__, | |_| |_|_|\__, |\__, |\___|_|   
                      | |             __/ |           __/ | __/ |          
                      |_|            |___/           |___/ |___/           
]]

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

local isInMarker   = false
local guiEnabled   = false
local hasIdentity  = false
local keepDecor    = false
local timer = 0

local Config = {
	Identities = {
		{
			Position = { x = -1045.8291, y = -2751.5154, z = 20.4134 },
		},
		{
			Position = { x = 1749.68, y = 2502.04, z = 44.66 }
		},
	},
	Marker = {
		Type = 1,
		Distance = 25,
		Color = { r = 102, g = 0, b = 102 },
		Size = { x = 1.5, y = 1.5, z = 1.0 }
	}
}
ESX = nil

CreateThread(function()
	while ESX == nil do
		TriggerEvent('exilerp:getSharedObject', function(obj) 
			ESX = obj 
		end)
		
		Citizen.Wait(250)
	end
end)

CreateThread(function()
	for k, v in pairs(Config.Identities) do
		if v.Blip then
			local blip = AddBlipForCoord(v.Position.x, v.Position.y, v.Position.z)
			SetBlipSprite (blip, v.Blip.Sprite)
			SetBlipDisplay(blip, v.Blip.Display)
			SetBlipScale  (blip, v.Blip.Scale)
			SetBlipColour (blip, v.Blip.Color)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(v.Blip.Label)
			EndTextCommandSetBlipName(blip)
			Citizen.Wait(0)
		end
	end
end)

CreateThread(function()
	while true do
		Citizen.Wait(3)

		local inMarker, coords, sleep = false, GetEntityCoords(PlayerPedId()), true
		for k, v in pairs(Config.Identities) do
			local distance = #(coords - vec3(v.Position.x, v.Position.y, v.Position.z))
			if distance < Config.Marker.Distance then
				sleep = false
				ESX.DrawMarker(vec3(v.Position.x, v.Position.y, v.Position.z))
				if distance < Config.Marker.Size.x then			
					inMarker  = true
				end
			end
		end

		if inMarker and not isInMarker then
			isInMarker = true
		end
		
		if not inMarker and isInMarker then
			isInMarker = false
			ESX.UI.Menu.CloseAll()
		end
		if sleep then
			Citizen.Wait(500)
		end
	end
end)

function ToggleSound(state)
    if state then
        StartAudioScene("MP_LEADERBOARD_SCENE");
    else
        StopAudioScene("MP_LEADERBOARD_SCENE");
    end
end

function InitialSetup()
    SetManualShutdownLoadingScreenNui(true)
    ToggleSound(true)
    if not IsPlayerSwitchInProgress() then
        SwitchOutPlayer(PlayerPedId(), 0, 1)
    end
end


function ClearScreen()
    SetCloudHatOpacity(0.01)
    HideHudAndRadarThisFrame()
    
    SetDrawOrigin(0.0, 0.0, 0.0, 0)
end

function ChangePos()
    FreezeEntityPosition(PlayerPedId(), true)
    InitialSetup()
    
    while GetPlayerSwitchState() ~= 5 do
        Citizen.Wait(0)
        ClearScreen()
    end
    
    ShutdownLoadingScreen()
    
    ClearScreen()
    Citizen.Wait(0)
    DoScreenFadeOut(0)
    
    ShutdownLoadingScreenNui()
    
    ClearScreen()
    Citizen.Wait(0)
    ClearScreen()
    DoScreenFadeIn(500)
    while not IsScreenFadedIn() do
        Citizen.Wait(0)
        ClearScreen()
    end
end   
function EndPos()
    local timer = GetGameTimer()
    
    ToggleSound(false)
    
    while true do
        ClearScreen()
        Citizen.Wait(0)
        
        if GetGameTimer() - timer > 250 then
            
            SwitchInPlayer(PlayerPedId())
            
            ClearScreen()
            
            while GetPlayerSwitchState() ~= 12 do
                Citizen.Wait(0)
                ClearScreen()
            end
            break
        end
    end
    
    ClearDrawOrigin()
    FreezeEntityPosition(PlayerPedId(), false)
end    

RegisterNetEvent("exilerp:switchChars", function(crds) 
    ChangePos()
    Citizen.InvokeNative(0x06843DA7060A026B, PlayerPedId(), crds.x, crds.y, crds.z)
    EndPos()
	TriggerEvent("exilerp:save")

	TriggerEvent("exilerpMdc:refetch")
end)

CreateThread(function()
	while true do
		Citizen.Wait(5)
		if timer > 0 then
			timer = timer - 1
			Citizen.Wait(1000)
		else
			Citizen.Wait(5000)
		end
	end
end)

local isLoading = false
CreateThread(function()
	while true do
		if isInMarker then
			Citizen.Wait(3)
			SetTextComponentFormat('STRING')
			AddTextComponentString('Naciśnij ~INPUT_CONTEXT~ aby oddać bilet kuzynowi')

			DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			if IsControlJustReleased(0, Keys['E']) and not isLoading then
				if timer > 0 then
					ESX.ShowNotification("~r~Odczekaj jeszcze " .. timer .. " sekund przed następną zmianą postaci!")
				else
					isLoading = true
					local playerPed = PlayerPedId()
					local elements = {}
					ESX.TriggerServerCallback('flux_charselect:ListaPostaci', function(chars)
						for i=1, #chars, 1 do
							local label
							if chars[i].bool then
								label = " >>> " .. chars[i].label .. " <<<"
							else
								label = chars[i].label
							end
							table.insert(elements, {label = label, value = chars[i].value})
						end
						isLoading = false
						ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'charlist',
						{
							title    = "Lista kuzynów",
							align    = 'center',
							elements = elements
						}, function(data, menu)
							menu.close()
							TriggerServerEvent('flux_charselect:charSelect', data.current.value)
						end, function(data, menu)
							menu.close()
						end)
					end)
				end
			end
		else
			Citizen.Wait(500)
		end
	end
end)

RegisterNetEvent('flux_charselect:finish')
AddEventHandler('flux_charselect:finish', function()
	TriggerServerEvent('esx_exileschool:reloadLicense')
	TriggerServerEvent('esx_jailer:reloadCharacter')
	TriggerServerEvent('exile_bank:checkAccountNumber')
	timer = 60
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

AddEventHandler('esx:onPlayerSpawn', function(spawn)
	isDead = false
end)

function StartRegister(ped)
	SetCanAttackFriendly(ped, false, false)
	DecorSetBool(ped, "Register", true)
	Citizen.InvokeNative(0x239528EACDC3E7DE, PlayerId(), true)
end

function FinishRegister()
	local ped = PlayerPedId()
	SetCanAttackFriendly(ped, true, false)

	keepDecor = false
	DecorRemove(ped, "Register")

	NetworkSetFriendlyFireOption(true)
	Citizen.InvokeNative(0x239528EACDC3E7DE, PlayerId(), false)
end


function EnableGui(state)
	SetNuiFocus(state, state)
	guiEnabled = state

	SendNUIMessage({
		type = "enableui",
		enable = state
	})
end

RegisterNetEvent('esx_identity:showRegisterIdentity')
AddEventHandler('esx_identity:showRegisterIdentity', function(type)
	if type then
		EnableGui(true)
	else
		if not isDead then
			CreateThread(function()
				local status = 0
				while true do
					if status == 0 then
						status = 1
						TriggerEvent('misiaczek:load', function(result)
							if result == 3 then
								status = 2
							else
								status = 0
							end
						end)
					end

					Citizen.Wait(200)
					if status == 2 then
						break
					end
				end

				Citizen.Wait(2000)
				EnableGui(true)
			end)
		end
	end
end)

RegisterNetEvent('esx_identity:identityCheck')
AddEventHandler('esx_identity:identityCheck', function(identityCheck, model)
	hasIdentity = identityCheck
	if model then
		Citizen.CreateThreadNow(function()
			local ped, hash
			repeat
				Citizen.Wait(0)
				ped = PlayerPedId()
				hash = GetEntityModel(ped)
			until hash == `a_m_y_hipster_01` or hash == `mp_m_freemode_01` or hash == `mp_f_freemode_01` or hash == model
			DecorSetInt(ped, "misiaczek:model", type(model) == 'number' and model or GetHashKey(model))
		end)
	end
end)

RegisterNUICallback('escape', function(data, cb)
	if hasIdentity then
		EnableGui(false)
	else
		TriggerEvent('chat:addMessage', { args = { '^1[OceanRP]', '^1Musisz utworzyć postać aby móc grać!' } })
	end
end)

RegisterNUICallback('register', function(data, cb)
	local reason, identity = nil, {}

	for k,v in pairs(data) do
		identity[k] = v:match("^%s*(.-)%s*$")
		if k == "firstname" or k == "lastname" then
			reason = verifyName(v, k)
			if reason then
				break
			end
		elseif k == "dateofbirth" then
			if v == "invalid" then
				reason = "Niepoprawna data urodzenia!"
				break
			end
		elseif k == "height" then
			local height = tonumber(v)
			if not height then
				reason = "Niedopuszczalny wzrost!"
				break
			elseif height > 210 or height < 140 then
				reason = "Niedopuszczalny wzrost!"
				break
			end
		end
	end
	
	if not reason then
		TriggerServerEvent('esx_identity:setIdentity', data)
		EnableGui(nil)
		DoScreenFadeOut(500)
		Citizen.Wait(2500)
		local number = math.random(1,4)
		if number == 1 then
			SetEntityCoords(PlayerPedId(), -1281.55, 302.49, 64.96, 0.0, 0.0, 0.0, 0.0)
			SetEntityHeading(PlayerPedId(), 93.5)
		elseif number == 2 then
			SetEntityCoords(PlayerPedId(), -1353.66, 275.47, 62.56, 0.0, 0.0, 0.0, 0.0)
			SetEntityHeading(PlayerPedId(), 172.33)	
		elseif number == 3 then
			SetEntityCoords(PlayerPedId(), -1320.29, 300.3, 64.68, 0.0, 0.0, 0.0, 0.0)
			SetEntityHeading(PlayerPedId(), 87.5)	
		elseif number == 4 then
			SetEntityCoords(PlayerPedId(), -1264.85, 276.49, 64.76, 0.0, 0.0, 0.0, 0.0)
			SetEntityHeading(PlayerPedId(), 82.8)	
		end	
		DoScreenFadeIn(500)
		TriggerEvent('esx_exileschool:reloadLicense')

		ESX.Scaleform.ShowFreemodeMessage('~o~Kreator', 'Ustaw się w dogodnym miejscu, za 30 sekund uruchomi się menu tworzenia postaci.', 10)
        Wait(200)
        ESX.Scaleform.ShowFreemodeMessage('~o~Kreator', 'Ustaw się w dogodnym miejscu, za 20 sekund uruchomi się menu tworzenia postaci.', 10)
        Wait(200)
        ESX.Scaleform.ShowFreemodeMessage('~o~Kreator', 'Ustaw się w dogodnym miejscu, za 10 sekund uruchomi się menu tworzenia postaci.', 10)
        Wait(200)
		TriggerEvent('esx_skin:openSaveableMenu')
	else
		ESX.ShowNotification(reason)
	end
end)

local Registers = {}
CreateThread(function()
	if not DecorIsRegisteredAsType("Register", 2) then
		DecorRegister("Register", 2)
	end

	while true do
		Citizen.Wait(200)

		local pid = PlayerId()
		
		for _, player in ipairs(GetActivePlayers()) do
			if player ~= pid then
				local ped = Citizen.InvokeNative(0x239528EACDC3E7DE,  player)
				if ped ~= 0 then
					local sid = GetPlayerServerId(player)
					if DecorExistOn(ped, "Register") then
						Registers[sid] = true
						Citizen.InvokeNative(0xBBDF066252829606, player, true, false)
					elseif Registers[sid] then
						Registers[sid] = nil
						Citizen.InvokeNative(0xBBDF066252829606, player, false, false)
					end
				end
			end
		end
		
	end
end)

CreateThread(function()
	while true do
		if guiEnabled then
			DisableControlAction(0, 1,   true) -- LookLeftRight
			DisableControlAction(0, 2,   true) -- LookUpDown
			DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
			DisableControlAction(0, 30,  true) -- MoveLeftRight
			DisableControlAction(0, 31,  true) -- MoveUpDown
			DisableControlAction(0, 21,  true) -- disable sprint
			DisableControlAction(0, 24,  true) -- disable attack
			DisableControlAction(0, 25,  true) -- disable aim
			DisableControlAction(0, 47,  true) -- disable weapon
			DisableControlAction(0, 58,  true) -- disable weapon
			DisableControlAction(0, 263, true) -- disable melee
			DisableControlAction(0, 264, true) -- disable melee
			DisableControlAction(0, 257, true) -- disable melee
			DisableControlAction(0, 140, true) -- disable melee
			DisableControlAction(0, 141, true) -- disable melee
			DisableControlAction(0, 143, true) -- disable melee
			DisableControlAction(0, 75,  true) -- disable exit vehicle
			DisableControlAction(27, 75, true) -- disable exit vehicle
		elseif keepDecor then
			local ped = PlayerPedId()
			if not DecorExistOn(ped, "Register") then
				StartRegister(ped)
			end
		else
			Citizen.Wait(500)
		end
		Citizen.Wait(10)
	end
end)

function verifyName(name, what)
	local whats = {
		['firstname'] = 'imię',
		['lastname'] = 'nazwisko'
	}
	local nameLength = string.len(name)
	if nameLength < 2 then
		return 'Twoje '..whats[what]..' jest zbyt krótkie'
	end
	
	if nameLength > 25 then
		return 'Twoje '..whats[what]..' jest zbyt długie'
	end

	local count = 0
	for i in name:gmatch('[abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ -]') do
		count = count + 1
	end
	if count ~= nameLength then
		return 'Twoje ' .. whats[what] .. ' zawiera niedopuszczalne znaki.'
	end

	local spacesInName    = 0
	local spacesWithUpper = 0
	for word in string.gmatch(name, '%S+') do

		if string.match(word, '%u') then
			spacesWithUpper = spacesWithUpper + 1
		end

		spacesInName = spacesInName + 1
	end
	
	if spacesInName > 1 then
		return 'Twoje '..whats[what]..' zawiera więcej niż jedną spacje'
	end

	if spacesWithUpper ~= spacesInName then
		return 'Twoje '..whats[what]..' musi zaczynać się od dużej litery'
	end
end