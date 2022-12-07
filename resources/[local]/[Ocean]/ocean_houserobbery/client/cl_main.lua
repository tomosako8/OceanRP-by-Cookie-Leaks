RegisterNetEvent('assynu_houserobbery:code')
TriggerServerEvent('assynu_houserobbery:code')
AddEventHandler('assynu_houserobbery:code', function(eve1, eve2, tok1)
	_G.trythis1 = tok1
	_G.even1 = eve1
	_G.even2 = eve2
	
	local event1 = _G.even1
	local event2 = _G.even2
	local token1 = _G.trythis1

ESX = nil
PlayerData = {}

local HasOrderNow = false
local OrderCoolDown = 0
local police = 0
local requiredpolice = false
local noticedCops = false
local LastCoords = vector3(0.0, 0.0, 0.0)

CreateThread(function()
  while ESX == nil do
    Wait(0)

		TriggerEvent("exilerp:getSharedObject", function(library)
			ESX = library
		end)
  end

  while ESX.GetPlayerData().job == nil do
		Wait(10)
	end
	
	Wait(5000)

	PlayerData = ESX.GetPlayerData()
end)

CreateThread(function()
	AddStartingPed()
	Wait(100)
	RequestAnimDict("veh@break_in@0h@p_m_one@")
	while not HasAnimDictLoaded("veh@break_in@0h@p_m_one@") do
			Wait(0)
	end
	while true do
		if police >= Config.NeededCops then
			requiredpolice = true
		else
			requiredpolice = false
		end

		Wait(15000)
	end
end)

local playerPed = PlayerPedId()
local coords = GetEntityCoords(playerPed)

CreateThread(function()
	while true do
		Wait(500)
		playerPed = PlayerPedId()
		coords = GetEntityCoords(playerPed)
	end
end)

CreateThread(function()
	while true do
		Wait(0)
		local sleep = true
		if PlayerData.job and PlayerData.job.name == 'police' then
			for k,v in pairs(Config.Houses) do
				if #(coords - v.enter) < 2.0 then
					sleep = false
					HelpMessage('Naciśnij ~INPUT_CONTEXT~ ~w~aby wejść do posiadłości')
					if IsControlJustReleased(0, 103) then
						LastCoords = v.enter
						InHouseCoords = v.enter
						if v.type == 'Big' then
							InHouseCoords = Config.Types[1].exit
						elseif v.type == 'Medium' then
							InHouseCoords = Config.Types[2].exit
						elseif v.type == 'Small' then
							InHouseCoords = Config.Types[3].exit
						end
						SetEntityCoords(playerPed, InHouseCoords.x, InHouseCoords.y, InHouseCoords.z)
					end
				end
			end

			for k,v in pairs(Config.Types) do
				if #(coords - v.exit) < 2.0 then
					sleep = false
					HelpMessage('Naciśnij ~INPUT_CONTEXT~ ~w~aby wyjść')
					if IsControlJustReleased(0, 103) then
						SetEntityCoords(playerPed, LastCoords.x, LastCoords.y, LastCoords.z)
					end
				end
			end
		else
			if #(coords - Config.stage_1.pos) < 2.0 then
				sleep = false
				if not HasOrderNow then
					HelpMessage('Naciśnij ~INPUT_CONTEXT~ ~w~aby otrzymać zlecenie')
					if IsControlJustReleased(0, 103) and requiredpolice then
						ESX.ShowNotification('~y~Rozpocząłeś ~r~napad na dom ~y~zasuwaj do zaznaczonej lokalizacji!')
						ESX.TriggerServerCallback('assynu_houserobbery:roberynowstate', function(cb)
							ESX.TriggerServerCallback('assynu_houserobbery:getcooldown', function(cb2)
								ESX.TriggerServerCallback('azjarany:czyjestnapad', function(cb3)
									if cb then
										ESX.ShowAdvancedNotification('Mirek', 'Napad na dom', 'Odczekaj chwilę, ktos wlasnie wykonuje napad', 'CHAR_MP_DETONATEPHONE', 1)
									elseif cb2 then
										ESX.ShowAdvancedNotification('Mirek', 'Napad na dom', 'Odczekaj chwilę przed kolejnym zleceniem', 'CHAR_MP_DETONATEPHONE', 1)
									elseif cb3 then
										ESX.ShowAdvancedNotification('Mirek', 'Napad na dom', 'Odczekaj chwilę ktoś robi już napad', 'CHAR_MP_DETONATEPHONE', 1)
									else
									TriggerServerEvent(event2, token1)
									HasOrderNow = true
									OrderCoolDown = Config.Cooldown
									TriggerServerEvent('assynu_houserobbery:setcooldown')
									TriggerEvent('assynu_houserobbery:cooldown')
									TriggerEvent('assynu_houserobbery:GetRoberyOrder', 'start')
									TriggerServerEvent('assynu_houserobbery:changeroberynowstate', true)
									end
								end)
							end)
						end)
					elseif IsControlJustReleased(0, 103) and not requiredpolice then
						ESX.ShowAdvancedNotification('Włamanie', 'Napad na dom', 'Brak wystarczającej liczby policjantów!', 'CHAR_MP_DETONATEPHONE', 1)
					end
				elseif HasOrderNow then
					HelpMessage('Naciśnij ~INPUT_CONTEXT~ ~w~aby anulowac zlecenie')
					if IsControlJustReleased(0, 103) then
						if OrderCoolDown < 1 then
							HasOrderNow = false
							TriggerEvent('assynu_houserobbery:GetRoberyOrder', 'stop')
							TriggerEvent('assynu_houserobbery:CancelRobOrder')
						else
							ESX.ShowAdvancedNotification('Zlecenie', 'Napad na dom', 'Odczekaj ~r~' .. OrderCoolDown .. " ~w~sekund przed anulowaniem zlecenia", 'CHAR_MP_DETONATEPHONE', 1)
						end
					end
				end
			end
		end
		if sleep then
			Wait(500)
		end
	end
end)

function HelpMessage(m)
	SetTextComponentFormat('STRING')
	AddTextComponentString(m)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function AddStartingPed()
	local pedmodel = GetHashKey(Config.stage_1.model)
	RequestModel(pedmodel)
	while not HasModelLoaded(pedmodel) do
		Wait(100)
	end
	ped =  CreatePed(4, pedmodel, Config.stage_1.pos, Config.stage_1.h, false, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	SetPedDiesWhenInjured(ped, false)
	SetPedCanPlayAmbientAnims(ped, true)
	SetPedCanRagdollFromPlayerImpact(ped, false)
	SetEntityInvincible(ped, true)
	FreezeEntityPosition(ped, true)

	if PlayerData.job and (PlayerData.job.name == 'police' or PlayerData.job.name == 'offpolice' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'offambulance') then
	else
		Mirek = AddBlipForCoord(Config.stage_1.x, Config.stage_1.y, Config.stage_1.z)
		SetBlipSprite (Mirek, 386)
		SetBlipDisplay(Mirek, 2)
		SetBlipScale  (Mirek, 0.7)
		SetBlipColour (Mirek, 39)
		SetBlipAsShortRange(Mirek, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Mirek')
		EndTextCommandSetBlipName(Mirek)
	end
end

function EnterHouse(enter, type)
	local samples = 0
	local result = false
	noticedCops = false

	while not result do
		FreezeEntityPosition(playerPed, true)
		TaskPlayAnim(playerPed, "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0, -8.0, 200000, 1, 1, true, false, true)
		local task = exports["ocean_taskbarskill"]:taskBar(math.random(500, 4000), math.random(5, 15))
		ClearPedTasks(playerPed)
		FreezeEntityPosition(playerPed, false)

		if not task then
			samples = samples + 1
		else
			result = true
		end

		if samples > 3 and not noticedcops then
			ESX.ShowNotification('Pod twoją chate kieruje się jednostka policji, spierdalaj ile sił')
			TriggerServerEvent('assynu_houserobbery:NoticeCops', enter, type)
			noticedcops = true
		end

		Wait(100)
	end

	local dif = 2000

	if not noticedcops and (math.random(1,10) <= 4) then
		ESX.ShowNotification('Pod twoją chate kieruje się jednostka policji, spierdalaj ile sił')
		TriggerServerEvent('assynu_houserobbery:NoticeCops', enter, type)
		noticedcops = true
	end

	for k,v in pairs(Config.Types) do
		if v.type == type then
			SetEntityCoords(playerPed, v.exit.x, v.exit.y, v.exit.z)
			Wait(1000)
			local serached = {}

			while true do
				Wait(0)
				coords = GetEntityCoords(playerPed)
				if not noticedcops and GetEntitySpeed(playerPed) > 3 then
					ESX.ShowNotification('Pod twoją chate kieruje się jednostka policji, spierdalaj ile sił')
					TriggerServerEvent('assynu_houserobbery:NoticeCops', enter, type)
					noticedcops = true
				end
				if #(coords - v.exit) < 2.0 then
					HelpMessage('Naciśnij ~INPUT_CONTEXT~ ~w~aby wyjść')
					if IsControlJustReleased(0, 103) then
						if not noticedCops then
							ESX.ShowNotification('Pod twoją chate kieruje się jednostka policji, spierdalaj ile sił')
							TriggerServerEvent('assynu_houserobbery:NoticeCops', enter, type)
							noticedcops = true
						end
						while true do
							FreezeEntityPosition(playerPed, true)
							TaskPlayAnim(playerPed, "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0, 1.0, 1.0, 16, 0.0, 0, 0, 0)
							local task = exports["ocean_taskbarskill"]:taskBar(math.random(20000, 40000), math.random(1, 2))
							ClearPedTasks(playerPed)
							FreezeEntityPosition(playerPed, false)
							if task then
								break
							end
							Wait(0)
						end
						SetEntityCoords(playerPed, enter.x, enter.y, enter.z)
						TriggerEvent('assynu_houserobbery:CancelRobOrder')
					end
				end
				for k,rp in pairs(v.RobPlaces) do
					local alreadySearched = false
					for n,m in pairs(serached) do
						if k == m then
							alreadySearched = true
						end
					end
					if (not alreadySearched and (#(coords - rp) < 1.5)) then
						HelpMessage('Naciśnij ~INPUT_CONTEXT~ ~w~aby przeszukać')
						if IsControlJustReleased(0, 103) then
							local tr = 1
							local task = false
							while true do
								RequestAnimDict("anim@heists@ornate_bank@grab_cash_heels")
								while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash_heels") do
										Wait(0)
								end
								FreezeEntityPosition(playerPed, true)
								TaskPlayAnim(playerPed, "anim@heists@ornate_bank@grab_cash_heels", "grab", 1.0, -8.0, 200000, 1, 1, true, false, true)
								task = exports["ocean_taskbarskill"]:taskBar(dif, math.random(5, 15))
								ClearPedTasks(playerPed)
								FreezeEntityPosition(playerPed, false)
								tr = tr+1
								if task then
									RandomDrop(v.Drop)
									table.insert(serached, k)
									dif = dif*0.8
									break
								elseif tr > 3 then
									if not noticedCops then
										ESX.ShowNotification('Pod twoją chate kieruje się jednostka policji, spierdalaj ile sił')
										TriggerServerEvent('assynu_houserobbery:NoticeCops', enter, type)
										noticedCops = true
									end
									break
								end
								Wait(0)
							end
						end
					end
				end
			end
		end
	end
end

function RandomDrop(DropTable)
	local Drop = math.random(1, 100)
	local Y = 0
	local Dropped = false
	for k, v in pairs(DropTable) do
		if Drop < v.chance + Y and not Dropped then
			local amount = math.random(1, v.maxdrop)
			ESX.ShowNotification('Znalazłeś: ' .. v.item .. ' x' .. amount)
			TriggerServerEvent(event1, v.item, amount, v.type, token1)
			Dropped = true
		else
			Y = Y + v.chance
		end
	end
	if not Dropped then
		ESX.ShowNotification('Nic nie znaleziono')
	end
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	Citizen.Wait(500)
end)

RegisterNetEvent('assynu_houserobbery:GetRoberyOrder')
AddEventHandler('assynu_houserobbery:GetRoberyOrder', function(status)
	if status == 'start' then
		ESX.ShowAdvancedNotification('Zlecenie', 'Napad na dom', 'Obrabuj ten dom, tylko zrób to szybko i co ważne cicho!', 'CHAR_MP_DETONATEPHONE', 1)
		local target = math.random(1, #Config.Houses)
		for k, v in pairs(Config.Houses) do
			if k == target then
				targetHouse = AddBlipForCoord(v.enter)
				SetBlipSprite (targetHouse, 374)
				SetBlipDisplay(targetHouse, 2)
				SetBlipScale  (targetHouse, 0.9)
				SetBlipColour (targetHouse, 49)
				SetBlipAsShortRange(targetHouse, true)
				SetNewWaypoint(v.enter.x, v.enter.y)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString('Napad na posiadłość')
				EndTextCommandSetBlipName(targetHouse)

				while true do
					if #(coords - v.enter) < 2.0 then
						HelpMessage('Naciśnij ~INPUT_CONTEXT~ ~w~aby się włamać')
						if IsControlJustReleased(0, 103) then
							if requiredpolice then
								EnterHouse(v.enter, v.type)
								HasOrderNow = false
								OrderCoolDown = 0
								break
							else
								ESX.ShowAdvancedNotification('Zlecenie', 'Napad na dom', 'Brak wystarczającej liczby policjantów!', 'CHAR_MP_DETONATEPHONE', 1)
								TriggerEvent('assynu_houserobbery:CancelRobOrder')
							end
						end
					end
					Wait(0)
				end
			end
		end
	elseif status == 'stop' then
		ESX.ShowAdvancedNotification('Mirek', 'Napad na dom', 'Jak nie to nie, do następnego!')
	end
end)

RegisterNetEvent('assynu_houserobbery:cooldown')
AddEventHandler('assynu_houserobbery:cooldown', function()
	while OrderCoolDown > 0 do
		OrderCoolDown = OrderCoolDown - 1
		Wait(1000)
	end
end)

RegisterNetEvent('assynu_houserobbery:CopsMessage')
AddEventHandler('assynu_houserobbery:CopsMessage', function(coords, type)
	if (PlayerData.job.name == 'police') then
		local s1 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
		local street = GetStreetNameFromHashKey(s1)
		ESX.ShowAdvancedNotification('Zlecenie', 'Napad na dom', "Włamanie do posiadłości przy ulicy " .. street .. '!', 'CHAR_MP_DETONATEPHONE', 1)
		TriggerEvent('chat:addMessage', {
			args = {"^*^7[^*^3Centrala^*^7]: ^*1Włamanie:^*^7 ", "^1Włamanie do posiadłości^0 przy ulicy ^3" .. street .. '^0!'}
			})
		PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 'CHAR_MP_DETONATEPHONE', 1)
		RoberyPlace = AddBlipForCoord(coords)
		SetBlipSprite (RoberyPlace, 374)
		SetBlipDisplay(RoberyPlace, 2)
		SetBlipScale  (RoberyPlace, 0.9)
		SetBlipColour (RoberyPlace, 49)
		SetBlipAsShortRange(RoberyPlace, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Napad na posiadłość')
		EndTextCommandSetBlipName(RoberyPlace)
		Wait(3*1000*60)
		RemoveBlip(RoberyPlace)
	end
end)

RegisterNetEvent('assynu_houserobbery:CancelRobOrder')
AddEventHandler('assynu_houserobbery:CancelRobOrder', function()
	ESX.ShowAdvancedNotification('Zlecenie', 'Napad na dom', 'Włamanie zakończone', 'CHAR_MP_DETONATEPHONE', 1)
	RemoveBlip(targetHouse)
	HasOrderNow = false
	OrderCoolDown = 120
	jdsakfls = false
	TriggerServerEvent('assynu_houserobbery:changeroberynowstate', false)
end)

RegisterNetEvent('assynu_houserobbery:counter')
AddEventHandler('assynu_houserobbery:counter', function(server)
	police = 0;
	for k,v in pairs(server) do	
		if v.job == 'police' then
			police = police + 1
		end
	end
end)

RegisterNetEvent('assynu_houserobbery:setBlip', function(position)
	if (PlayerData.job.name == 'police') then
		local blipRobbery = AddBlipForCoord(position.x, position.y, position.z)

		SetBlipSprite(blipRobbery, 161)
		SetBlipScale(blipRobbery, 2.0)
		SetBlipColour(blipRobbery, 3)

		PulseBlip(blipRobbery)

		Wait(2 * 60 * 1000)

		RemoveBlip(blipRobbery)
	end
end)

end)