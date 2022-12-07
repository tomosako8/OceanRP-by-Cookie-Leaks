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

local Player = {}

Citizen.CreateThread(function()
	SendNUIMessage({type = "close"})
	Citizen.Wait(500)
	Player.Ped = GetPlayerPed(-1)
	Player.isMenuOpened = false
	Player.Documents = {}
	Player.isArchiwumOpened = false
	Player.RequestDocuments = {}
	Player.What = false
	startThread()
	while not threadStarted do
		Citizen.Wait(5100)
		startThread()
	end
end)

RegisterNetEvent('cookie_fbi:receiveDocuments')
AddEventHandler('cookie_fbi:receiveDocuments', function(documents)
	Player.Documents = {}
	if documents ~= nil then
		for i,doc in pairs(documents) do
			Player.Documents[doc.name] = doc.url
		end
	end
end)

RegisterNetEvent('cookie_fbi:requestShowDocument')
AddEventHandler('cookie_fbi:requestShowDocument', function(name, urlToOpen)
	print("received "..name.."/"..urlToOpen)
	table.insert(Player.RequestDocuments, {name = name, url = urlToOpen, acceptTime = GetGameTimer()+10000})
end)

RegisterNetEvent('cookie_fbi:openDocument', function(document)
	print("opening document: "..document)
	SendNUIMessage({type = "open", document = document})
	SetNuiFocus(true, true)
end)

RegisterNUICallback("exit", function(data)
	print("exited")
	SendNUIMessage({type = "close"})
	SetNuiFocus(false, false)
end)

function openArchiwum(archiwumName)

	Player.isArchiwumOpened = true

	local elements = {
		{label = "Dokumenty", value = 'open_documents'},
		{label = "Zdeponuj dokument", value = 'deposit_document'},
		{label = "Wyciagnij dokument", value = 'withdraw_document'}
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'archiwum', {
		title = "Archiwum "..archiwumName,
		align = 'center',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'open_documents' then
			ESX.TriggerServerCallback('cookie_fbi:getArchiwumSociety', function(archiwumDokumenty)
				if archiwumDokumenty then
					local elements2 = {}
					for k,dokument in pairs(archiwumDokumenty) do
						table.insert(elements2, {label = "Dokument "..dokument.name, value = dokument.url})
					end
					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dokumenty', {
						title = "Archiwum "..archiwumName,
						align = 'center',
						elements = elements2
					}, function(data2, menu)
						TriggerEvent('cookie_fbi:openDocument', data2.current.value)
					end, function(data2, menu)
						menu.close()
					end)

				end
			end, archiwumName)
		elseif data.current.value == 'deposit_document' then
			openDocumentsDeposit(archiwumName)
		elseif data.current.value == 'withdraw_document' then
			openDocumentsWithdraw(archiwumName)
		end
	end, function(data, menu)
		menu.close()
		Player.isArchiwumOpened = false
	end)

end

function openDocumentsWithdraw(archiwumName)
	ESX.TriggerServerCallback('cookie_fbi:getArchiwumSociety', function(archiwumDokumenty)
		if archiwumDokumenty then
			local elements = {}
			print(archiwumDokumenty[1].name)
			for k,dokument in pairs(archiwumDokumenty) do
				table.insert(elements, {label = "Dokument "..dokument.name, value = {name = dokument.name, url = dokument.url}})
			end
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'withdraw_doc', {
				title = "Archiwum "..archiwumName,
				align = 'center',
				elements = elements
			}, function(data, menu)
				TriggerServerEvent('cookie_fbi:removeFromArchiwum', archiwumName, data.current.value)
				menu.close()
			end, function(data, menu)
				menu.close()
			end)
		end
	end, archiwumName)

end

function removeDocumentFromPlayer(name)
	for k,v in pairs(Player.Documents) do
		if k == name then
			table.remove(Player.Documents, k)
			break
		end
	end
end

function openDocumentsDeposit(archiwumName)

	local elements = {}

	for k,v in pairs(Player.Documents) do
		table.insert(elements, {label = "Dokument: "..k, value = {name = k, url = v}})
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'deposit_doc', {
		title = "Archiwum "..archiwumName,
		align = 'center',
		elements = elements
	}, function(data, menu)
		TriggerServerEvent('cookie_fbi:addToArchiwum', archiwumName, data.current.value)
		Player.Documents = {}
		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end

function openDocumentsMenu()
	Player.isMenuOpened = true
	local elements = {}
	for k,v in pairs(Player.Documents) do
		table.insert(elements, {label = "Dokument: "..k, value = {name = k, url = v}})
	end
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dokumenty', {
		title = "Twoje Dokumenty",
		align = 'center',
		elements = elements
	}, function(data, menu)
		local elements2 = {
			{label = "Otworz dokument", value = 'open_doc'},
			{label = "Pokaz dokument", value = 'show_doc'},
			{label = "Usun dokument", value = 'delete_doc'}
		}
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dokument', {
			title = "Dokument "..data.current.value.name,
			align = 'center',
			elements = elements2
		}, function(data2, menu2)
			if data2.current.value == 'open_doc' then
				TriggerEvent('cookie_fbi:openDocument', data.current.value.url)
			elseif data2.current.value == 'show_doc' then
				local players = ESX.Game.GetPlayers()
				local elements3 = {}
				for index,value in ipairs(players) do
					local targetPed = GetPlayerPed(value)
					table.insert(elements3, {label = GetPlayerName(value), value = GetPlayerServerId(value)})
				end
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gracze', {
					title = "",
					align = 'center',
					elements = elements3
				}, function(data3, menu3)

					TriggerServerEvent('cookie_fbi:openDoc', data.current.value.name, data.current.value.url, data3.current.value)
					menu3.close()
				end, function(data3, menu3)
					menu3.close()
				end)
			elseif data2.current.value == 'delete_doc' then
				TriggerServerEvent('cookie_fbi:deleteDocument', data.current.value.name)
				menu2.close()
				menu.close()
				Player.isMenuOpened = false
				ESX.ShowNotification("Usunieto dokument "..data.current.value.name)
			end
		end, function(data2, menu2)
			menu2.close()
		end)
	end, function(data, menu)
		menu.close()
		Player.isMenuOpened = false
	end)
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded',function(xPlayer)
	TriggerServerEvent('cookie_fbi:loadPlayer')
	startThread()
end)

local threadStarted = false

function startThread()
	if threadStarted then
		print("thread started")
		return
	end
	Citizen.Wait(5000)
	while true do
		Citizen.Wait(5)
		if not threadStarted then
			threadStarted = true
		end
		if #Player.RequestDocuments > 0 then
			for k,v in ipairs(Player.RequestDocuments) do
				if v.acceptTime > GetGameTimer() then
					ESX.ShowHelpNotification("Kliknij ~INPUT_MP_TEXT_CHAT_TEAM~, aby zobaczyc dokument "..v.name)
					if IsControlJustPressed(0, Keys["Y"]) then
						TriggerEvent('cookie_fbi:openDocument', v.url)
						table.remove(Player.RequestDocuments, k)
					end
				end
			end
		end
		if not Player.isMenuOpened then
			if IsControlJustPressed(0, Keys["HOME"]) then
				openDocumentsMenu()
			end
		end
		if not Player.isArchiwumOpened then
			for k,v in pairs(Config.Archiwa) do
				local pedCoords = GetEntityCoords(Player.Ped)
				local archiwumCoords = v
				local distance = GetDistanceBetweenCoords(pedCoords, archiwumCoords.x, archiwumCoords.y, archiwumCoords.z, true)
				if distance < 10 then
					DrawMarker(27, archiwumCoords.x, archiwumCoords.y, archiwumCoords.z, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 14, 216, 18, 0.8, false, true, 2, true, nil, nil, false)
					if distance < 1.5 then
						ESX.ShowHelpNotification("Kliknij ~INPUT_CONTEXT~, aby otworzyc archiwum "..k)
						if IsControlJustPressed(0, Keys["E"]) then
							openArchiwum(k)
						end
					end
				end
			end
		end
	end
end
