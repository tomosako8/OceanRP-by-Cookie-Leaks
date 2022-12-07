ESX = nil

TriggerEvent('exilerp:getSharedObject', function(obj)
	ESX = obj
	Config.check()
end)

local documents = {}
local archiwum = {}

Citizen.CreateThread(function()
	MySQL.query("SELECT * FROM dokumenty", {}, function(result)
		for index,dokument in pairs(result) do
			if documents[dokument.identifier] == nil then
				documents[dokument.identifier] = {}
			end
			table.insert(documents[dokument.identifier], {name = dokument.name, url = dokument.url})
		end
	end)
	MySQL.query("SELECT * FROM archiwum_dokumenty", {}, function(result)
		for index,archiwa in pairs(result) do
			if archiwum[archiwa.society] == nil then
				archiwum[archiwa.society] = {}
			end
			print(archiwa.society.."/"..archiwa.documents)
			local archiwumDocuments = json.decode(archiwa.documents)
			archiwum[archiwa.society] = archiwumDocuments
		end
	end)
	while true do
		sendDocuments()
		Citizen.Wait(8000)
	end
end)

RegisterServerEvent('cookie_fbi:addToArchiwum')
AddEventHandler('cookie_fbi:addToArchiwum', function(archiwumName, document)
	local xPlayer = ESX.GetPlayerFromId(source)
	if archiwum[archiwumName] ~= nil then
		table.insert(archiwum[archiwumName], document)
		for k,v in ipairs(documents[xPlayer.identifier]) do
			if v.name == document.name then
				table.remove(documents[xPlayer.identifier], k)
			end
		end
		updateArchiwum()
		deleteDocumentPlayer(xPlayer.identifier, document.name)
		xPlayer.showNotification("Zdeponowano dokument do archiwum")
	end
end)

RegisterServerEvent('cookie_fbi:removeFromArchiwum')
AddEventHandler('cookie_fbi:removeFromArchiwum', function(archiwumName, document)
	local xPlayer = ESX.GetPlayerFromId(source)
	if archiwum[archiwumName] ~= nil then
		createDocument(xPlayer.identifier, document.name, document.url)
		for k,v in ipairs(archiwum[archiwumName]) do
			if v.name == document.name then
				table.remove(archiwum[archiwumName], k)
			end
		end
		updateArchiwum()
		xPlayer.showNotification("Wyciagnieto dokument z archiwum")
	end
end)

ESX.RegisterServerCallback('cookie_fbi:getArchiwumSociety', function(source, cb, society)
	local dokumentyArchiwum = archiwum[society]
	if dokumentyArchiwum ~= nil then
		cb(dokumentyArchiwum)
	else
		cb(false)
	end
end)

function updateArchiwum()
	for k,v in pairs(archiwum) do
		MySQL.execute("UPDATE archiwum_dokumenty SET documents = @docs WHERE society = @society", {["@docs"] = json.encode(v), ["@society"] = k})
	end
end

function deleteDocumentPlayer(identifier, name)
	MySQL.execute("DELETE FROM dokumenty WHERE identifier = @id AND name = @name", {["@id"] = identifier, ["@name"] = name})
end

RegisterServerEvent('cookie_fbi:deleteDocument')
AddEventHandler('cookie_fbi:deleteDocument', function(name)
	local xPlayer = ESX.GetPlayerFromId(source)
	if documents[xPlayer.identifier] ~= nil then
		for k,v in ipairs(documents[xPlayer.identifier]) do
			if v.name == name then
				table.remove(documents[xPlayer.identifier], k)
			end
		end
	end
	deleteDocumentPlayer(xPlayer.identifier, name)
end)

function sendDocuments()
	for k,xPlayer in pairs(ESX.GetExtendedPlayers()) do
		if documents[xPlayer.identifier] ~= nil then
			TriggerClientEvent('cookie_fbi:receiveDocuments', xPlayer.source, documents[xPlayer.identifier])
		else
			TriggerClientEvent('cookie_fbi:receiveDocuments', xPlayer.source, nil)
		end
	end
end

function createDocument(identifier, name, url)
	if documents[identifier] == nil then
		documents[identifier] = {}
	end
	table.insert(documents[identifier], {name = name, url = url})
	MySQL.insert("INSERT INTO dokumenty(identifier, name, url) VALUES (?, ?, ?)", {identifier, name, url})
end

RegisterCommand('stworzdokument', function(source,args,raw)
	local xPlayer = ESX.GetPlayerFromId(source)

	if args[1] ~= nil and args[2] ~= nil then

		local documentName = args[1]
		local documentUrl = args[2]
		createDocument(xPlayer.identifier, documentName, documentUrl)

		xPlayer.showNotification("Stworzono dokument o nazwie "..documentName)

	else
		xPlayer.showNotification("Poprawne uzycie: /stworzdokument [nazwadokumentu] [url(docs.google.com)]")
	end
end)

RegisterServerEvent('cookie_fbi:loadPlayer')
AddEventHandler('cookie_fbi:loadPlayer', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('cookie_fbi:receiveDocuments', source, documents[xPlayer.identifier])
end)

RegisterServerEvent('cookie_fbi:openDoc')
AddEventHandler('cookie_fbi:openDoc', function(name, url, targetPlayer)
	TriggerClientEvent('cookie_fbi:requestShowDocument', targetPlayer, name, url)
end)

ESX.RegisterUsableItem('dokument', function(playerId)
	print("dokument")
	local xPlayer = ESX.GetPlayerFromId(playerId)
	local documentItem = xPlayer.getInventoryItem('dokument')
	local documentToOpen = documentItem.data['url']
	TriggerClientEvent('cookie_fbi:openDocument', playerId, documentToOpen)
end)
