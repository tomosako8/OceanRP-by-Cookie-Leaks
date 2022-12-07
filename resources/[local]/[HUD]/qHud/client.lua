
local directions = { [0] = 'N', [45] = 'NW', [90] = 'W', [135] = 'SW', [180] = 'S', [225] = 'SE', [270] = 'E', [315] = 'NE', [360] = 'N', }
local Ped = {
    Id = nil,
    Vehicle = nil,
    VehicleClass = nil,
    VehicleStopped = true,
    VehicleEngine = false,
    VehicleGear = nil,
    Health = 0,
    Armor = 0,
    Stamina = 0,
    Underwater = false,
    UnderwaterTime = 0,
    Driver = false,
    PhoneVisible = false,
    DisplayStreet = false,
    PauseMenu = false
}

local PlayerData = nil


Citizen.CreateThread(function()
    local minimap = RequestScaleformMovie("minimap")
    SetRadarBigmapEnabled(true, false)
    Wait(0)
    SetRadarBigmapEnabled(false, true)
	SetRadarZoom(1200)
    while true do
        Wait(0)
        BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
		SetRadarBigmapEnabled(false, true)
		SetRadarZoom(1200)
        ScaleformMovieMethodAddParamInt(3)
        EndScaleformMovieMethod()
    end
end)

CreateThread(function()
    while true do
        Wait(400)
        local state = NetworkIsPlayerTalking(PlayerId())
        local mode = Player(GetPlayerServerId(PlayerId())).state.proximity.mode
        SendNUIMessage({
            type = 'UPDATE_VOICE',
            isTalking = state,
            mode = mode
        })
    end
end)

CreateThread(function()
    while true do
        Wait(100)
        if IsPedInAnyVehicle(PlayerPedId()) and not IsPauseMenuActive() then
            Wait(100)
            local PedCar = GetVehiclePedIsUsing(PlayerPedId(), false)
            Speed = math.floor(GetEntitySpeed(PedCar) * 3.6 + 0.5)
            MaxSpeed = math.ceil(GetVehicleEstimatedMaxSpeed(PedCar) * 3.6 + 0.5)
            SpeedPercent = Speed / MaxSpeed * 100
            rpm = GetVehicleCurrentRpm(PedCar) * 100

			SendNUIMessage({
                speedometer = true,
				speed = Speed,
				percent = SpeedPercent,
				rpmx = rpm,
			})
        else
            Citizen.Wait(1000)
        end
    end
end)

CreateThread(function()
    while true do
        Wait(450)
        if IsPedInAnyVehicle(PlayerPedId()) and not IsPauseMenuActive() then
			DisplayRadar(true)
            local PedCar = GetVehiclePedIsUsing(PlayerPedId(), false)
			local coords = GetEntityCoords(PlayerPedId())

			local fuel = tostring(math.ceil(GetVehicleFuelLevel(PedCar)))
			local _,lightsOn,highbeamsOn = GetVehicleLightsState(PedCar)
			local lightMode = 1
			if lightsOn == 1 then lightMode = lightMode + 1 end
			if highbeamsOn == 1 then lightMode = lightMode + 1 end

			SetMapZoomDataLevel(0, 0.96, 0.9, 0.08, 0.0, 0.0) -- Level 0
			SetMapZoomDataLevel(1, 1.6, 0.9, 0.08, 0.0, 0.0) -- Level 1
			SetMapZoomDataLevel(2, 8.6, 0.9, 0.08, 0.0, 0.0) -- Level 2
			SetMapZoomDataLevel(3, 12.3, 0.9, 0.08, 0.0, 0.0) -- Level 3
			SetMapZoomDataLevel(4, 22.3, 0.9, 0.08, 0.0, 0.0) -- Level 4

            SendNUIMessage({
                showhud = true,
				lights = lightMode,
				paliwo = fuel,
            })
			SendNUIMessage({
				type = 'UPDATE_SEATBELT',
				belt = exports['ocean_blackout']:pasyState()
			})
		else
			SendNUIMessage({
				showhud = false
			})
            if exports["qs-smartphone"]:isPhoneOpen() then
                DisplayRadar(true)
            else
                DisplayRadar(false)
            end
			Wait(2000)
		end
	end
end)

local hash1, hash2;
CreateThread(function()
    while true do
        Wait(10)
        local ped, direction = PlayerPedId(), nil
        for k, v in pairs(directions) do
            direction = GetEntityHeading(ped)
            if math.abs(direction - k) < 22.5 then
                direction = v
                break
            end
        end
        local coords = GetEntityCoords(ped, true)
        local zone = GetNameOfZone(coords.x, coords.y, coords.z)
        local zoneLabel = GetLabelText(zone)
        local var1, var2 = GetStreetNameAtCoord(coords.x, coords.y, coords.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
        hash1 = GetStreetNameFromHashKey(var1);
		hash2 = GetStreetNameFromHashKey(var2);
        local street2;
        if (hash2 == '') then
			street2 = zoneLabel;
		else
			street2 = hash2..', '..zoneLabel;
		end
		local blip = GetFirstBlipInfoId(8)
    local distance = 0
		local ghahahah = 0
    if (blip ~= 0) then
			local coord = GetBlipCoords(blip)
			ghahahah = CalculateTravelDistanceBetweenPoints(GetEntityCoords(Citizen.InvokeNative(0x43A66C31C68491C0,-1)), coord)

			if blip ~= 0 then
				if ghahahah ~= 0 then
					distance = ghahahah
				else
					distance = 0
				end
			end
		else
      distance = 'off'
    end
        SendNUIMessage({
            street = street2,
			direction = (direction or 'N'),
			direction2 = direction .. ' | ' .. street2,
			waypoint = distance,
        })
    end
end)

local Status = nil

RegisterNetEvent('qHud:aktualizejszn')
AddEventHandler('qHud:aktualizejszn', function(stats)
  Status = stats
end)

CreateThread(function()
    while true do
        Wait(1000)
        if Status ~= nil then
          for i,v in ipairs(Status) do
            if Status[i].name == 'hunger' then
              hunger = Status[i].percent
            end
            if Status[i].name == 'thirst' then
              thirst = Status[i].percent
            end
          end
        end


        local armor = GetPedArmour(PlayerPedId())
        local hp = GetEntityHealth(PlayerPedId()) - 100
		local nurkowanie = GetPlayerUnderwaterTimeRemaining(PlayerId()) * 10
		--local inwater = IsPedSwimmingUnderWater(PlayerPedId()),
        SendNUIMessage({
            type = 'UPDATE_HUD',
			hunger = hunger,
			thirst = thirst,
            armor = armor,
            nurkowanie = nurkowanie,
            --inwater = inwater,
            zycie = hp,
            isdead = hp <= 0
        })

    end
end)

CreateThread(function()
    while true do
        Wait(2000)
        local data = exports['rp-radio']:GetRadioData()
        if tostring(data[3]) == "0" then
            SendNUIMessage({
                hideradio = true
            })
        else
            SendNUIMessage({
                showradio = true
            })
        end
        SendNUIMessage({
            radionumber = data[2],
            radiocount = data[3],
        })
    end
end)

CreateThread(function()
    while true do
        Wait(5000)
        local idpedala = GetPlayerServerId(PlayerId())
        SendNUIMessage({
            type = 'UPDATE_ID',
			id = idpedala
        })
    end
end)

radardisplayed = true
CreateThread(function()
    while true do
        Citizen.Wait(2000)
        if hudhidden then
            radardisplayed = false
            DisplayRadar(0)
        else
            if Ped.Vehicle or Ped.PhoneVisible then
                radardisplayed = true
                DisplayRadar(1)
            else
                radardisplayed = false
                DisplayRadar(0)
            end
        end
    end
end)


function GetStreetsCustom(coords)
	local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
	local street1, street2 = GetStreetNameFromHashKey(s1), GetStreetNameFromHashKey(s2)
	return "~y~" .. street1 .. (street2 ~= "" and "~s~ / " .. street2 or "")
end
local streetLabel = {}

CreateThread(function()
    while true do
        Citizen.Wait(citizenWait3)

        Ped.Id = PlayerPedId()
        if IsPedInAnyVehicle(Ped.Id, true) then
            Ped.InVehicle = true
            Ped.Vehicle = GetVehiclePedIsIn(Ped.Id, false)
            Ped.VehicleClass = GetVehicleClass(Ped.Vehicle)
            Ped.VehicleStopped = IsVehicleStopped(Ped.Vehicle)
            Ped.VehicleEngine = GetIsVehicleEngineRunning(Ped.Vehicle)
            Ped.VehicleGear = GetVehicleCurrentGear(Ped.Vehicle)
            Ped.Driver = GetPedInVehicleSeat(Ped.Vehicle, -1) == Ped.Id
        else
            Ped.Vehicle = nil

            Ped.InVehicle = false

            local pid = PlayerId()
            Ped.Stamina = GetPlayerSprintStaminaRemaining(pid)

            Ped.UnderwaterTime = GetPlayerUnderwaterTimeRemaining(pid)
            if Ped.UnderwaterTime < 0.0 then
                Ped.UnderwaterTime = 0.0
            end
        end

        Ped.Health = GetEntityHealth(Ped.Id)
        Ped.Armor = GetPedArmour(Ped.Id)
        Ped.Underwater = IsPedSwimmingUnderWater(Ped.Id)

        Ped.DisplayStreet = exports['OceanRP']:DisplayingStreet()

        local coords = GetEntityCoords(Ped.Id, true)
        local zone = GetNameOfZone(coords.x, coords.y, coords.z)

        streetLabel.street = GetStreetsCustom(coords)
    end
end)

--true stary false nowy
local progressAlign = "top"
RegisterNUICallback("progressalign", function(data,cb)
    if data.align == "1" then
        progressAlign = "top"
    elseif data.align == "2" then
        progressAlign = "bottom"
    elseif data.align == "3" then
        progressAlign = "left"
    elseif data.align == "4" then
        progressAlign = "right"
    end
    cb({})
end)

function getAlign()
    return progressAlign
end

RegisterNetEvent("hud:Speedo", function(b)
    SendNUIMessage({
        type = "HIDE_SPEDDO",
        bool = b
    })
end)

function RadarShown()
    return radardisplayed
end

function toboolean(str)
    local bool = false
    if str == "true" then
        bool = true
    end
    return bool
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    while PlayerData == nil do
        PlayerData = xPlayer
        Citizen.Wait(100)
    end

    Status = PlayerData.status

    local slots = PlayerData.slots
    local loadout = PlayerData.loadout
    local inventory = PlayerData.inventory

    for k,v in pairs(slots) do
        local found = false

        for k2,v2 in pairs(loadout) do
            if k == v2.id then
                found = true
                if v.slot then
                    count = v.count and 'x' .. v.count

                    SendNUIMessage({
                        action = 'updateSlot',
                        item = v.name,
                        count = count,
                        slot = v.slot
                    })
                end
            end
        end
        for k3,v3 in pairs(inventory) do
            if v3.count > 0 then
                if k == v3.name then
                    found = true
                    if v.slot then
                        count = v.count and 'x' .. v.count

                        SendNUIMessage({
                            action = 'updateSlot',
                            item = v.name,
                            count = count,
                            slot = v.slot
                        })
                    end
                end
            end
        end

        if not found then
            ESX.SetSlot(k, nil, true)
        end
    end
end)

RegisterNetEvent('hud:updateSlot')
AddEventHandler('hud:updateSlot', function(slot, count, item)
    count = count and 'x' .. count

    SendNUIMessage({
        action = 'updateSlot',
        item = item,
        count = count,
        slot = slot
    })
end)

function ToggleSlots()
    if not ESX.UI.Menu.IsOpen('default', 'es_extended', 'inventory') then
        SendNUIMessage({action = 'toggleslots'})
    end
end

RegisterCommand("+toggleslots", ToggleSlots)
RegisterKeyMapping("+toggleslots", "Przełączanie widoczności slotów", "keyboard", "TAB")

RegisterCommand("off", function(source, args, raw)
	ESX.DisplaySlots(false)
end)

RegisterCommand("edithud", function(source, args, raw)
	SendNUIMessage({ action = 'show_hud' })
	SetNuiFocus(true, true)
	cameraLocked = true -- wyjebac
end)

RegisterNUICallback("stopedit", function()
	SetNuiFocus(false, false)
	cameraLocked = false -- wyjebac
end)

-- wyjebac --
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if cameraLocked == true then
            DisableControlAction(0, 1, true)
            DisableControlAction(0, 2, true)
        end
    end
end)
