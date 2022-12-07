local Status = {}
local PlayerData = nil

local loaded = false
local armored = true
local modelThread = nil

local isPaused = false
local display = false

local isDead = false

function GetStatusData(ped)
	PlayerData = ESX.GetPlayerData()
	if Status == nil then
		Status = PlayerData.status
	end
	local ghowno = {}
	for _, status in ipairs(Status) do
		table.insert(ghowno, {
			name	= status.name,
			val		= status.val,
			percent	= (status.val / 3600000) * 100
		})
	end

	return ghowno
end

Citizen.CreateThread(function()
	Citizen.Wait(100)
	while PlayerData == nil or not PlayerData do
		PlayerData = ESX.PlayerData
		Citizen.Wait(300)
	end
	Status = PlayerData.status
	print("starting")
	Citizen.Wait(5000)
	startDel()
end)

RegisterNetEvent('esx_status:load')
AddEventHandler('esx_status:load', function(status)
	loaded = true

	TriggerEvent('esx_status:loaded', status)
	for i=1, #Status, 1 do
		for j=1, #status, 1 do
			if Status[i].name == status[j].name then
				Status[i].set(status[j].val)
			end
		end
	end


end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded',function(xPlayer, isNew, skin)
	ESX.PlayerData = xPlayer
	PlayerData = xPlayer
end)

RegisterNetEvent('esx_status:startStrataTask')
AddEventHandler('esx_status:startStrataTask', function()
	print("starting")
	Citizen.Wait(5000)
	startDel()
end)

function startDel()
	print("Running hunger/thirst removing")
	Citizen.CreateThread(function()
		Citizen.Wait(0)
		while true do
			Citizen.Wait(1000)
			strata()
		end
	end)
end

RegisterNetEvent('esx_status:resetStatsDeath')
AddEventHandler('esx_status:resetStatsDeath', function()
	Status = PlayerData.status
	for i=1, #Status, 1 do
		if Status[i].name == 'hunger' then
			Status[i].val = 1800000
			Status[i].percent = (Status[i].val / 3600000) * 100
		end
		if Status[i].name == 'thirst' then
			Status[i].val = 1800000
			Status[i].percent = (Status[i].val / 3600000) * 100
		end
	end
	print("executed reset stats")
end)

function strata()
	local playerPed = GetPlayerPed(PlayerId())
	local prevHealth = GetEntityHealth(playerPed)
	local health = prevHealth

	if PlayerData.status ~= nil and not isDead then
		for i=1, #Status, 1 do

			if Status[i].name == 'drunk' then
				TriggerEvent('esx_basicneeds:checkDrunk')
				if Status[i].val > 0 then
					Status[i].val = Status[i].val - 1000
				end
			end

			if Status[i].name == 'drug' then
				TriggerEvent('esx_basicneeds:checkDrug')
				if Status[i].val > 0 then
					Status[i].val = Status[i].val - 1000
				end
			end

			if Status[i].name == 'thirst' then


				if Status[i].percent <= 0 then
					health = health - 5
				else
					Status[i].val = Status[i].val - 250
					Status[i].percent = (Status[i].val / 3600000) * 100
				end
			end

			if Status[i].name == 'hunger' then

				if Status[i].percent <= 0 then
					health = health - 5
				else
					Status[i].val = Status[i].val - 250
					Status[i].percent = (Status[i].val / 3600000) * 100
				end

			end
		end
	end
	if prevHealth ~= health then
		SetEntityHealth(playerPed, health)
	end
end

RegisterCommand('removehunger', function(source, args, raw)
	TriggerEvent('esx_status:remove', 'hunger', 50000)
end, false)

RegisterNetEvent('esx_status:set')
AddEventHandler('esx_status:set', function(name, val)
	for i=1, #Status, 1 do
		if Status[i].name == name then
			Status[i].val = val
			Status[i].percent = (Status[i].val / 3600000) * 100
			break
		end
	end
end)


RegisterNetEvent('esx_status:add')
AddEventHandler('esx_status:add', function(name, val)
	for i=1, #Status, 1 do
		if Status[i].name == name then
			Status[i].val = Status[i].val + val
			Status[i].percent = (Status[i].val / 3600000) * 100
			break
		end
	end
	TriggerServerEvent('esx_status:update', GetStatusData())
end)

RegisterNetEvent('esx_status:remove')
AddEventHandler('esx_status:remove', function(name, val)
	for i=1, #Status, 1 do
		if Status[i].name == name then
			Status[i].val = Status[i].val - val
			Status[i].percent = (Status[i].val / 3600000) * 100
			break
		end
	end

	TriggerServerEvent('esx_status:update', GetStatusData())
end)

RegisterNetEvent('esx_status:updateColor')
AddEventHandler('esx_status:updateColor', function(name, color)
	for _, status in ipairs(Status) do
		if status.name == name then
			status.updateColor(color)
			break
		end
	end

	TriggerServerEvent('esx_status:update', GetStatusData())
end)

RegisterNetEvent('esx_status:registerStatus')
AddEventHandler('esx_status:registerStatus', function(name, default, color, visible, tickCallback)
	local s = CreateStatus(name, default, color, visible, tickCallback)
	table.insert(Status, s)
end)

AddEventHandler('esx_status:getStatus', function(name, cb)
	if Status == nil then
		Status = PlayerData.status
	end
	for _, status in ipairs(Status) do
		if status.name == name then
			cb(status)
			return
		end
	end
end)

AddEventHandler('skinchanger:modelComplete', function()
	if not armored then
		armored = true
	elseif loaded == nil then
		loaded = false
	else
		local old = loaded
		if modelThread then
			TerminateThread(modelThread)
			modelThread = nil
		end

		loaded = false
		Citizen.CreateThreadNow(function()
			modelThread = GetIdOfThisThread()

			Citizen.Wait(1000)
			if loaded == false then
				loaded = old
			end
		end)
	end
end)

AddEventHandler('esx_status:setDisplay', function(val)
	display = tonumber(val) ~= 0
end)

function drwRct(x, y, width, height, r, g, b, a)
	DrawRect(x + width / 2, y + height / 2, width, height, r, g, b, a)
end

function drwTxt(x, y, width, height, scale, text, r, g, b, a)
	SetTextFont(0)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()

	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - width / 2, y - height / 2 + 0.005)
end

CreateThread(function()
	RequestStreamedTextureDict('mpleaderboard')
	while not HasStreamedTextureDictLoaded('mpleaderboard') do
			Citizen.Wait(0)
	end

	local updateTimer, tickTimer, updateGlobal
	while true do
		Wait(500)
		if IsPauseMenuActive() and not isPaused then
			isPaused = true
			TriggerEvent('esx_status:setDisplay', 0.0)
		elseif not IsPauseMenuActive() and isPaused then
			isPaused = false
			TriggerEvent('esx_status:setDisplay', 0.5)
		end
	end
end)

CreateThread(function()
	while true do
		Citizen.Wait(Config.UpdateInterval)
		TriggerServerEvent('esx_status:update', GetStatusData(true))
	end
end)

-- go pro

function PlayAnim()
	local ped = PlayerPedId()
	TaskStartScenarioInPlace(ped, "PROP_HUMAN_PARKING_METER", 0, true)
	Wait(2000)
    Citizen.InvokeNative(0xAAA34F8A7CB32098, ped)
end

function StartGPS()
	PlayAnim()

	SendNuiMessage({
		action = "gopro",
		state = true
	})
end

function StopGPS()
	PlayAnim()

	SendNuiMessage({
		action = "gopro",
		state = false
	})
end

RegisterNetEvent('ls_gopro:goproMenu')
AddEventHandler('ls_gopro:goproMenu', function()
	local _elements = {
		{label = 'Włącz GoPro', value = 'start1'},
		{label = 'Zniszcz GoPro', value = 'destroy'},
		{label = 'Wyłącz GoPro', value = 'stop'},
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gopro', {
		title    = 'Menu GoPro',
		align    = 'center',
		elements = _elements
	}, function(data, menu)
		if data.current.value == 'start1' then
			menu.close()
			StartGPS()
			TriggerEvent('esx:showNotification', '~h~~w~[GoPro] ~g~Nagrywanie zostało włączone.')
		elseif data.current.value == 'destroy' then
			menu.close()
			StopGPS()
			TriggerServerEvent("ls_gopro:destroyItem")
		elseif data.current.value == 'stop' then
			menu.close()
			StopGPS()
			TriggerEvent('esx:showNotification', '~h~~w~[GoPro] ~p~Nagrywanie zostało wyłączone.')
		end
	end, function(data, menu)
		menu.close()
	end)
end)
