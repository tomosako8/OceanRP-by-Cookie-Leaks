ESX = nil
mandatAmount = nil

TriggerEvent('exilerp:getSharedObject', function(obj)
  ESX = obj
end)

function SendLog(name, message, color)
	local embeds = {
		{
			["description"]=message,
			["type"]="rich",
			["color"] =5793266,
			["footer"]=  {
			["text"] = os.date() .. " | Tablet",
			},
		}
	}
	if message == nil or message == '' then return FALSE end
	
	local webhook = ''	
	PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

RegisterNetEvent('tablet_frakcje:SendMessage')
AddEventHandler('tablet_frakcje:SendMessage', function(target, mandatAmount, mandatReason)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	local mandat = tonumber(mandatAmount)
	
	local society = 'society_'..sourceXPlayer.job.name

	if (sourceXPlayer.job.name == 'ambulance' or sourceXPlayer.job.name == 'gheneraugarage' or sourceXPlayer.job.name == 'mechanik' or sourceXPlayer.job.name == 'doj') then
		print('[OceanRP] Załadowano tablet')
	else
		TriggerEvent("exilerp:banPlr", "nigger", _source, "Tried to exploit tablet (tablet_frakcje)")
		return
	end

	TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
		account.addAccountMoney(mandat)
	end)

	targetXPlayer.removeAccountMoney('bank', mandat)
	sourceXPlayer.addAccountMoney('bank', mandat * 0.40)
	SendLog("**Faktura "..sourceXPlayer.job.label..":**\n\n**Kto wystawił:** " ..GetPlayerName(_source).. "**\nID:** " .._source.. "**\n\nKto otrzymał:** " ..GetPlayerName(target).. "**\nID:** " ..target.. "**\nTreść: **" ..mandatReason.. "**\nIlość: **" ..mandat.."$", 56108)
end)

RegisterNetEvent('exile_ban')
AddEventHandler('exile_ban', function()
	TriggerEvent("exilerp:banPlr", "nigger", source, "Tried to give invoice (tablet_frakcje)")
end)