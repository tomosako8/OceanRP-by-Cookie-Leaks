PedAXD = {
	Active = false,
	Id = 0,
	Visible = false,
	InVehicle = false
}
CreateThread(function()
	while not HasAnimSetLoaded("move_ped_crouched") do
		RequestAnimSet("move_ped_crouched")
		Citizen.Wait(0)
	end
	while true do
		Citizen.Wait(500)

		PedAXD.Id = PlayerPedId()
		if DoesEntityExist(PedAXD.Id) then
			PedAXD.Active = not IsPauseMenuActive()
			PedAXD.Visible = IsEntityVisible(PedAXD.Id)
			PedAXD.InVehicle = IsPedInAnyVehicle(PedAXD.Id, false)
		end
	end
end)

--RECE
local handsup = false
local _animation = nil

local animations = { --enter nie wymagany
	{ lib = 'random@mugging3' , base = 'handsup_standing_base', enter = 'handsup_standing_enter', exit = 'handsup_standing_exit', fade = 1 }
}

RegisterCommand('-handsup', function(source, args, rawCommand)
	if handsup then
		handsup = false
		TaskPlayAnim(PedAXD.Id, _animation.lib, _animation.exit, 8.0, 8.0, 1.0, 48, 0, 0, 0, 0)	
		Wait(_animation.fade)
		ClearPedTasks(PedAXD.Id)	
	elseif not IsPedInAnyVehicle(PedAXD.Id, false) and not IsPedSwimming(PedAXD.Id) and not IsPedShooting(PedAXD.Id) and not IsPedClimbing(PedAXD.Id) and not IsPedCuffed(PedAXD.Id) and not IsPedDiving(PedAXD.Id) and not IsPedFalling(PedAXD.Id) and not IsPedJumping(PedAXD.Id) and not IsPedJumpingOutOfVehicle(PedAXD.Id) and IsPedOnFoot(PedAXD.Id) and not IsPedInParachuteFreeFall(PedAXD.Id) then							
		handsup = true			
		_animation = animations[math.random(1, #animations)]
		RequestAnimDict(_animation.lib)

		while not HasAnimDictLoaded(_animation.lib) do
			Citizen.Wait(1)
		end

		TaskPlayAnim(PedAXD.Id, _animation.lib, _animation.enter, 8.0, 8.0, 1.0, 50, 0, 0, 0, 0)
	end
end, false)

RegisterKeyMapping('-handsup', 'Podnoszenie rak', 'keyboard', 'OEM_3')

--KUCANIE
local crouched = false
local mode = 0

RegisterCommand('-crouch', function(source, args, rawCommand)
	if PedAXD.Active then
		if not PedAXD.InVehicle and PedAXD.Visible then
			if not IsPedFalling(PedAXD.Id) and not IsPedCuffed(PedAXD.Id) and not IsPedDiving(PedAXD.Id) and not IsPedInCover(PedAXD.Id, false) and not IsPedInParachuteFreeFall(PedAXD.Id) and (GetPedParachuteState(PedAXD.Id) == 0 or GetPedParachuteState(PedAXD.Id) == -1) and not IsPedBeingStunned(PedAXD.Id) then
				mode = mode+1
				if mode == 1 then
					SetPedMovementClipset(PedAXD.Id, "move_ped_crouched", 0.25)
				elseif mode == 2 then
					ResetPedMovementClipset(PedAXD.Id, 0)
					SetPedStealthMovement(PedAXD.Id ,true, "")
				elseif mode == 3 then
					mode = 0
					SetPedStealthMovement(PedAXD.Id ,false, "")
				end
			end
		end
	end
end, false)

RegisterKeyMapping('-crouch', 'Kucanie', 'keyboard', 'LCONTROL')

local mp_pointing = false

startPointing = function()
	if not PedAXD.InVehicle then
		local ped = PlayerPedId()
		RequestAnimDict("anim@mp_point")
		while not HasAnimDictLoaded("anim@mp_point") do
			Wait(0)
		end
		SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
		SetPedConfigFlag(ped, 36, 1)
		TaskMoveNetworkByName(ped, 'task_mp_pointing', 0.5, false, 'anim@mp_point', 24)
		RemoveAnimDict("anim@mp_point")
	end
end

stopPointing = function()
	if not PedAXD.InVehicle then
		local ped = PlayerPedId()
		RequestTaskMoveNetworkStateTransition(ped, 'Stop')
		if not IsPedInjured(ped) then
			ClearPedSecondaryTask(ped)
		end
		if not IsPedInAnyVehicle(ped, 1) then
			SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
		end
		SetPedConfigFlag(ped, 36, 0)
		ClearPedSecondaryTask(ped)
	end
end

RegisterCommand('point', function()
    if not PedAXD.InVehicle then
        if mp_pointing then
            stopPointing()
            mp_pointing = false
        else
            startPointing()
            mp_pointing = true
        end
        while mp_pointing do
            local ped = PlayerPedId()
            local camPitch = GetGameplayCamRelativePitch()
            if camPitch < -70.0 then
                camPitch = -70.0
            elseif camPitch > 42.0 then
                camPitch = 42.0
            end
            camPitch = (camPitch + 70.0) / 112.0

            local camHeading = GetGameplayCamRelativeHeading()
            local cosCamHeading = Cos(camHeading)
            local sinCamHeading = Sin(camHeading)
            if camHeading < -180.0 then
                camHeading = -180.0
            elseif camHeading > 180.0 then
                camHeading = 180.0
            end
            camHeading = (camHeading + 180.0) / 360.0

            local blocked

            local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
            local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7)
            _, blocked = GetRaycastResult(ray)
			SetTaskMoveNetworkSignalFloat(ped, "Pitch", camPitch)
			SetTaskMoveNetworkSignalFloat(ped, "Heading", camHeading * -1.0 + 1.0)
			SetTaskMoveNetworkSignalBool(ped, "isBlocked", blocked)
			SetTaskMoveNetworkSignalBool(ped, "isFirstPerson", GetCamViewModeForContext(GetCamActiveViewModeContext()) == 4)
            Wait(1)
        end
    end
end)

RegisterKeyMapping('point', 'Pokazywanie palcem', 'keyboard', 'b')