ESX                       = nil

TriggerEvent('exilerp:getSharedObject', function(obj)
	ESX = obj
end)

local cd = os.time()
local BlockTable = {}
local BlockTWT = {}
local BlockDW = {}
local opisy = {}

ESX.RegisterServerCallback("esx_marker:fetchUserRank", function(source, cb)
    local player = ESX.GetPlayerFromId(source)

    if player ~= nil then
        local playerGroup = player.getGroup()

        if playerGroup ~= nil then 
            cb(playerGroup)
        else
            cb("user")
        end
    else
        cb("user")
    end
end)

CreateThread(function()
	while true do
		Citizen.Wait(10000)
		for i=1, #BlockTable, 1 do
			local timeNow = os.time()
			if BlockTable[i].unix < timeNow then
				if BlockTable[i].chat == 'twt' then
					if BlockTWT[BlockTable[i].identifier] == true then
						BlockTWT[BlockTable[i].identifier] = nil
						table.remove(BlockTable, i)
						MySQL.update('DELETE FROM chat_bans WHERE identifier = ? AND chat = ?', {BlockTable[i].identifier, BlockTable[i].chat})
						break
					end
				else
					if BlockDW[BlockTable[i].identifier] == true then
						BlockDW[BlockTable[i].identifier] = nil
						table.remove(BlockTable, i)
						MySQL.update('DELETE FROM chat_bans WHERE identifier = ? AND chat = ?', {BlockTable[i].identifier,BlockTable[i].chat})
						break
					end
				end
			end
		end
	end
end)

RegisterServerEvent('exile_chat:checkBlocklist')
AddEventHandler('exile_chat:checkBlocklist', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer then
		MySQL.query("SELECT * FROM chat_bans WHERE identifier = ?", {xPlayer.identifier}, function(result)
			if result then
				for i=1, #result, 1 do
					local timeNow = os.time()
					if result[i].unix < timeNow then
						MySQL.update('DELETE FROM chat_bans WHERE identifier = ? AND chat = ?', {result[i].identifier, result[i].chat})
					else
						local found = false
						for j=1, #BlockTable, 1 do
							if BlockTable[j].identifier == result[i].identifier and BlockTable[j].chat == result[i].chat then
								found = true
								break
							end
						end

						if not found then
							if result[i].chat == 'twt' then
								table.insert(BlockTable, {identifier = result[i].identifier, unix = result[i].unix, chat = result[i].chat})
								BlockTWT[result[i].identifier] = true
							else
								table.insert(BlockTable, {identifier = result[i].identifier, unix = result[i].unix, chat = result[i].chat})
								BlockDW[result[i].identifier] = true
							end
						end
					end
				end
			end
		end)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
	PlayerData = xPlayer
	if xPlayer ~= nil then
		local group = 'user'
		if xPlayer.group == nil then
			group = 'user'
		else
			group = xPlayer.group
		end
		TriggerClientEvent('es_admin:setGroup', playerId, group)
	end
end)

local mode = "delete"
local kickmessage = "ocean_queue: Takie słowa to są zakazane!"
local blacklist = {
	"Hitler",
	"Hilter",
	"Himler",
	"Himmler",
	"Stalin",
	"Putin",
	"PixaRP",
	"NotRP",
	"213rp",
	'213RP',
	"sativa",
	"SativaRP",
	"HypeRP",
	"richrp.pl",
	"richrp",
	"213rp.pl",
	"213rp",
	"adrenalinarp.pl",
	"adrenalinarp",
	"asgard.",
	"asgard",
	"eulen.",
	"eulen",
	"skript.gg",
	"skript",
	"kosmici",
	"kosmici.space",
	"nigga",
	"nigga",
	"niga",
	"niger",
	"nigger",
	"pedal",
	"pedał",
	"pedała",
	"pedale",
	"simp",
	"down",
	"faggot",
	"upośledzony",
	"upośledzona",
	"retarded",
	"czarnuch",
	"cwel",
	"czarnuh",
	"żyd",
	"zyd",
	"hitler",
	"jebac disa",
	"nygus",
	"ciota",
	"cioty",
	"cioto",
	"cwelu",
	"cwele",
	"czarnuchu",
	"niggerze",
	"nigerze",
	"downie",
	"nygusie",
	"karzeł",
	"karzel",
	"simpie",
	"pedalskie",
	"zydzie",
	"żydzie",
	"geju",
	"administrator",
    "admin",
    "adm1n",
    "adm!n",
    "admln",
    "moderator",
    "owner",
    "nigger",
    "n1gger",
    "moderator",
    "eulencheats",
    "lynxmenu",
    "atgmenu",
    "hacker",
    "bastard",
    "hamhaxia",
    "333gang",
    "ukrp",
    "eguk",
    "n1gger",
    "n1ga",
    "nigga",
    "n1gga",
    "nigg3r",
    "nig3r",
    "shagged",
    "4dm1n",
    "4dmin",
    "m0d3r4t0r",
    "n199er",
    "n1993r",
    "rustchance.com",
    "rustchance",
    "hellcase.com",
    "hellcase",
    "youtube.com",
    "youtu.be",
    "youtube",
    "twitch.tv",
    "twitch",
    "anticheat",
    "fucking",
    "ψ",
    "@",
    "&",
    "{",
    "}",
    ";",
    "ϟ",
    "♕",
    "Æ",
    "Œ",
    "‰",
    "™",
    "š",
    "œ",
    "Ÿ",
    "µ",
    "ß",
    "±",
    "¦",
    "»",
    "«",
    "¼",
    "½",
    "¾",
    "¬",
    "¿",
    "Ñ",
    "®",
    "©",
    "²",
    "·",
    "•",
    "°",
    "þ",
    "ベ",
    "ル",
    "ろ",
    "ぬ",
    "ふ",
    "う",
    "え",
    "お",
    "や",
    "ゆ",
    "よ",
    "わ",
    "ほ",
    "へ",
    "た",
    "て",
    "い",
    "す",
    "か",
    "ん",
    "な",
    "に",
    "ら",
    "ぜ",
    "む",
    "ち",
    "と",
    "し",
    "は",
    "き",
    "く",
    "ま",
    "の",
    "り",
    "れ",
    "け",
    "む",
    "つ",
    "さ",
    "そ",
    "ひ",
    "こ",
    "み",
    "も",
    "ね",
    "る",
    "め",
    "ロ",
    "ヌ",
    "フ",
    "ア",
    "ウ",
    "エ",
    "オ",
    "ヤ",
    "ユ",
    "ヨ",
    "ワ",
    "ホ",
    "ヘ",
    "タ",
    "テ",
    "イ",
    "ス",
    "カ",
    "ン",
    "ナ",
    "ニ",
    "ラ",
    "セ",
    "ム",
    "チ",
    "ト",
    "シ",
    "ハ",
    "キ",
    "ク",
    "マ",
    "ノ",
    "リ",
    "レ",
    "ケ",
    "ム",
    "ツ",
    "サ",
    "ソ",
    "ヒ",
    "コ",
    "ミ",
    "モ",
    "ネ",
    "ル",
    "メ",
    "✪",
    "Ä",
    "ƒ",
    "Ã",
    "¢",
    "?",
    "†",
    "€",
    "웃",
    "и",
    "】",
    "【",
    "j4p.pl",
    "ֆ",
    "ȶ",
    "你",
    "好",
    "爱",
    "幸",
    "福",
    "猫",
    "狗",
    "微",
    "笑",
    "中",
    "安",
    "東",
    "尼",
    "杰",
    "诶",
    "西",
    "开",
    "陈",
    "瑞",
    "华",
    "馬",
    "塞",
    "洛",
    "ダ",
    "仇",
    "觉",
    "感",
    "衣",
    "德",
    "曼",
    "L͙",
    "a͙",
    "l͙",
    "ľ̶̚͝",
    "Ḩ̷̤͚̤͑͂̎̎͆",
    "a̸̢͉̠͎͒͌͐̑̇",
    "♚",
    "я",
    "Ʒ",
    "Ӂ̴",
    "Ƹ̴",
    "≋",
    "civilgamers.com",
    "civilgamers",
    "csgoempire.com",
    "csgoempire",
    "g4skins.com",
    "g4skins",
    "gameodds.gg",
    "duckfuck.com",
    "crysishosting.com",
    "crysishosting",
    "key-drop.com",
    "key-drop.pl",
    "skinhub.com",
    "skinhub",
    "`",
    "¤",
    "¡",
    "casedrop.eu",
    "casedrop",
    "cs.money",
    "rustypot.com",
    "✈",
    "⛧",
    "☭",
    "☣",
    "✠",
    "dkb.xss.ht",
    "( . )( . )",
    "⚆",
    "╮",
    "╭",
    "rampage.lt",
    "?",
    "xcasecsgo.com",
    "xcasecsgo",
    "csgocases.com",
    "csgocases",
    "K9GrillzUK.co.uk",
    "moat.gg",
    "princevidz.com",
    "princevidz",
    "pvpro.com",
    "Pvpro",
    "ez.krimes.ro",
    "loot.farm",
    "arma3fisherslife.net",
    "arma3fisherslife",
    "egamers.io",
    "ifn.gg",
    "key-drop",
    "sups.gg",
    "tradeit.gg",
    "§",
    "csgotraders.net",
    "csgotraders",
    "Σ","Ξ",
    "hurtfun.com",
    "hurtfun",
    "gamekit.com",
    "¥",
    "t.tv",
    "yandex.ru",
    "yandex",
    "csgofly.com",
    "csgofly",
    "pornhub.com",
    "pornhub",
    "一",
    "",
    "Ｊ",
    "◢",
    "◤",
    "⋡",
    "℟",
    "ᴮ",
    "ᴼ",
    "ᴛᴇᴀᴍ",
    "cs.deals",
    "twat",
    "STRESS.PW",
    "<script",
	"skript.gg",
	"skript",
}

AddEventHandler("chatMessage", function(source, name, message)
	if(IsPlayerAceAllowed(source, "chatfilter:bypass")) then else
		CancelEvent()
		local finalmessage = message:lower()
		finalmessage = finalmessage:gsub(" ", "")
		finalmessage = finalmessage:gsub("%-", "")
		finalmessage = finalmessage:gsub("%.", "")
		finalmessage = finalmessage:gsub("$", "s")
		finalmessage = finalmessage:gsub("€", "e")
		finalmessage = finalmessage:gsub(",", "")
		finalmessage = finalmessage:gsub(";", "")
		finalmessage = finalmessage:gsub(":", "")
		finalmessage = finalmessage:gsub("*", "")
		finalmessage = finalmessage:gsub("_", "")
		finalmessage = finalmessage:gsub("|", "")
		finalmessage = finalmessage:gsub("/", "")
		finalmessage = finalmessage:gsub("<", "")
		finalmessage = finalmessage:gsub(">", "")
		finalmessage = finalmessage:gsub("ß", "ss")
		finalmessage = finalmessage:gsub("&", "")
		finalmessage = finalmessage:gsub("+", "")
		finalmessage = finalmessage:gsub("¦", "")
		finalmessage = finalmessage:gsub("§", "s")
		finalmessage = finalmessage:gsub("°", "")
		finalmessage = finalmessage:gsub("#", "")
		finalmessage = finalmessage:gsub("@", "a")
		finalmessage = finalmessage:gsub("\"", "")
		finalmessage = finalmessage:gsub("%(", "")
		finalmessage = finalmessage:gsub("%)", "")
		finalmessage = finalmessage:gsub("=", "")
		finalmessage = finalmessage:gsub("?", "")
		finalmessage = finalmessage:gsub("!", "")
		finalmessage = finalmessage:gsub("´", "")
		finalmessage = finalmessage:gsub("`", "")
		finalmessage = finalmessage:gsub("'", "")
		finalmessage = finalmessage:gsub("%^", "")
		finalmessage = finalmessage:gsub("~", "")
		finalmessage = finalmessage:gsub("%[", "")
		finalmessage = finalmessage:gsub("]", "")
		finalmessage = finalmessage:gsub("{", "")
		finalmessage = finalmessage:gsub("}", "")
		finalmessage = finalmessage:gsub("£", "e")
		finalmessage = finalmessage:gsub("¨", "")
		finalmessage = finalmessage:gsub("ç", "c")
		finalmessage = finalmessage:gsub("¬", "")
		finalmessage = finalmessage:gsub("\\", "")
		finalmessage = finalmessage:gsub("1", "i")
		finalmessage = finalmessage:gsub("3", "e")
		finalmessage = finalmessage:gsub("4", "a")
		finalmessage = finalmessage:gsub("5", "s")
		finalmessage = finalmessage:gsub("0", "o")

		local lastchar = ""
		local output = ""
		for char in finalmessage:gmatch(".") do
			if(char ~= lastchar) then
				output = output .. char
			end
			lastchar = char
		end

		local send = true
		for i in pairs(blacklist) do
			if(output:find(blacklist[i])) then
				if(mode == "delete") then

				elseif(mode == "kick") then
					DropPlayer(source, kickmessage)
				end
				send = false
				break
			end
		end
		if(send) then
			if string.sub(message, 1, string.len("/")) ~= "/" then
				local xPlayer = ESX.GetPlayerFromId(source)
				exports['ocean_logs']:SendLog(source, "LOOC: " .. message, 'chat', '9807270')
				local ident = xPlayer.getIdentifier()
				local prefix = Config.privPrefix[ident] or ""
				local color = Config.privColor[ident] or {}
				
				if xPlayer ~= nil then
					TriggerClientEvent("sendProximityMessage", -1, xPlayer.name, source, xPlayer.group, message, prefix, color)
				end
			end
			CancelEvent()
		end
	end
end)

RegisterCommand('me', function(source, args, message, rawCommand)
	if(IsPlayerAceAllowed(source, "chatfilter:bypass")) then else
		CancelEvent()
		local finalmessage = message:lower()
		finalmessage = finalmessage:gsub(" ", "")
		finalmessage = finalmessage:gsub("%-", "")
		finalmessage = finalmessage:gsub("%.", "")
		finalmessage = finalmessage:gsub("$", "s")
		finalmessage = finalmessage:gsub("€", "e")
		finalmessage = finalmessage:gsub(",", "")
		finalmessage = finalmessage:gsub(";", "")
		finalmessage = finalmessage:gsub(":", "")
		finalmessage = finalmessage:gsub("*", "")
		finalmessage = finalmessage:gsub("_", "")
		finalmessage = finalmessage:gsub("|", "")
		finalmessage = finalmessage:gsub("/", "")
		finalmessage = finalmessage:gsub("<", "")
		finalmessage = finalmessage:gsub(">", "")
		finalmessage = finalmessage:gsub("ß", "ss")
		finalmessage = finalmessage:gsub("&", "")
		finalmessage = finalmessage:gsub("+", "")
		finalmessage = finalmessage:gsub("¦", "")
		finalmessage = finalmessage:gsub("§", "s")
		finalmessage = finalmessage:gsub("°", "")
		finalmessage = finalmessage:gsub("#", "")
		finalmessage = finalmessage:gsub("@", "a")
		finalmessage = finalmessage:gsub("\"", "")
		finalmessage = finalmessage:gsub("%(", "")
		finalmessage = finalmessage:gsub("%)", "")
		finalmessage = finalmessage:gsub("=", "")
		finalmessage = finalmessage:gsub("?", "")
		finalmessage = finalmessage:gsub("!", "")
		finalmessage = finalmessage:gsub("´", "")
		finalmessage = finalmessage:gsub("`", "")
		finalmessage = finalmessage:gsub("'", "")
		finalmessage = finalmessage:gsub("%^", "")
		finalmessage = finalmessage:gsub("~", "")
		finalmessage = finalmessage:gsub("%[", "")
		finalmessage = finalmessage:gsub("]", "")
		finalmessage = finalmessage:gsub("{", "")
		finalmessage = finalmessage:gsub("}", "")
		finalmessage = finalmessage:gsub("£", "e")
		finalmessage = finalmessage:gsub("¨", "")
		finalmessage = finalmessage:gsub("ç", "c")
		finalmessage = finalmessage:gsub("¬", "")
		finalmessage = finalmessage:gsub("\\", "")
		finalmessage = finalmessage:gsub("1", "i")
		finalmessage = finalmessage:gsub("3", "e")
		finalmessage = finalmessage:gsub("4", "a")
		finalmessage = finalmessage:gsub("5", "s")
		finalmessage = finalmessage:gsub("0", "o")

		local lastchar = ""
		local output = ""
		for char in finalmessage:gmatch(".") do
			if(char ~= lastchar) then
				output = output .. char
			end
			lastchar = char
		end

		local send = true
		for i in pairs(blacklist) do
			if(output:find(blacklist[i])) then
				if(mode == "delete") then

				elseif(mode == "kick") then
					DropPlayer(source, kickmessage)
				end
				send = false
				break
			end
		end
		if(send) then
			local xPlayer = ESX.GetPlayerFromId(source)
			local czas = os.date("%Y/%m/%d %X")
			TriggerClientEvent("sendProximityMessageMe", -1, source, source, table.concat(args, " "))
		
			local text = ''
			for i = 1,#args do
				text = text .. ' ' .. args[i]
			end
		
			color = {r = 255, g = 152, b = 247, alpha = 255}
			exports['ocean_logs']:SendLog(source, "ME: " .. text, 'chat', '15158332')
			TriggerClientEvent('esx_rpchat:triggerDisplay', -1, text, source, color)
		end
	end
end, false)

RegisterCommand('news', function(source, args, message, rawCommand)
	if(IsPlayerAceAllowed(source, "chatfilter:bypass")) then else
		CancelEvent()
		local finalmessage = message:lower()
		finalmessage = finalmessage:gsub(" ", "")
		finalmessage = finalmessage:gsub("%-", "")
		finalmessage = finalmessage:gsub("%.", "")
		finalmessage = finalmessage:gsub("$", "s")
		finalmessage = finalmessage:gsub("€", "e")
		finalmessage = finalmessage:gsub(",", "")
		finalmessage = finalmessage:gsub(";", "")
		finalmessage = finalmessage:gsub(":", "")
		finalmessage = finalmessage:gsub("*", "")
		finalmessage = finalmessage:gsub("_", "")
		finalmessage = finalmessage:gsub("|", "")
		finalmessage = finalmessage:gsub("/", "")
		finalmessage = finalmessage:gsub("<", "")
		finalmessage = finalmessage:gsub(">", "")
		finalmessage = finalmessage:gsub("ß", "ss")
		finalmessage = finalmessage:gsub("&", "")
		finalmessage = finalmessage:gsub("+", "")
		finalmessage = finalmessage:gsub("¦", "")
		finalmessage = finalmessage:gsub("§", "s")
		finalmessage = finalmessage:gsub("°", "")
		finalmessage = finalmessage:gsub("#", "")
		finalmessage = finalmessage:gsub("@", "a")
		finalmessage = finalmessage:gsub("\"", "")
		finalmessage = finalmessage:gsub("%(", "")
		finalmessage = finalmessage:gsub("%)", "")
		finalmessage = finalmessage:gsub("=", "")
		finalmessage = finalmessage:gsub("?", "")
		finalmessage = finalmessage:gsub("!", "")
		finalmessage = finalmessage:gsub("´", "")
		finalmessage = finalmessage:gsub("`", "")
		finalmessage = finalmessage:gsub("'", "")
		finalmessage = finalmessage:gsub("%^", "")
		finalmessage = finalmessage:gsub("~", "")
		finalmessage = finalmessage:gsub("%[", "")
		finalmessage = finalmessage:gsub("]", "")
		finalmessage = finalmessage:gsub("{", "")
		finalmessage = finalmessage:gsub("}", "")
		finalmessage = finalmessage:gsub("£", "e")
		finalmessage = finalmessage:gsub("¨", "")
		finalmessage = finalmessage:gsub("ç", "c")
		finalmessage = finalmessage:gsub("¬", "")
		finalmessage = finalmessage:gsub("\\", "")
		finalmessage = finalmessage:gsub("1", "i")
		finalmessage = finalmessage:gsub("3", "e")
		finalmessage = finalmessage:gsub("4", "a")
		finalmessage = finalmessage:gsub("5", "s")
		finalmessage = finalmessage:gsub("0", "o")

		local lastchar = ""
		local output = ""
		for char in finalmessage:gmatch(".") do
			if(char ~= lastchar) then
				output = output .. char
			end
			lastchar = char
		end

		local send = true
		for i in pairs(blacklist) do
			if(output:find(blacklist[i])) then
				if(mode == "delete") then

				elseif(mode == "kick") then
					DropPlayer(source, kickmessage)
				end
				send = false
				break
			end
		end
		if(send) then
			local xPlayer = ESX.GetPlayerFromId(source)
			if CheckPhone(xPlayer.source) <= 0 then
				xPlayer.showNotification('Nie posiadasz telefonu.')
				return
			end
			
			if os.time() < cd then
				xPlayer.showNotification('~b~Poczekaj chwilę, aż wszyscy odczytają najnowszego newsa!')
				return
			end
			
			if xPlayer.job.name == 'police' or xPlayer.job.name == 'ambulance' then
				args = table.concat(args, ' ')
				cd = os.time() + 60
				TriggerClientEvent("exilerpChat:sendNews", -1, xPlayer.source, xPlayer.job.label, {120, 255, 120}, args)
				--TriggerClientEvent('chat:addMessage1', -1, xPlayer.job.label, {255, 206, 10}, args, "fas fa-newspaper")
				exports['ocean_logs']:SendLog(source, "NEWS: [" .. xPlayer.job.label .. "]: " .. args, 'chat', '8359053')
			elseif xPlayer.job.name == 'casino' or xPlayer.job.name == 'mechanik' or xPlayer.job.name == 'gheneraugarage' then
				if xPlayer.getAccount('bank').money <= 200 then
					xPlayer.showNotification('~r~Nie posiadasz wystarczająco gotówki w banku, aby wysłać wiadomość na wiadomościach')
					return
				end
				args = table.concat(args, ' ')
				local jobLabel = xPlayer.job.label
				if xPlayer.secondjob.name == 'casino' then
					jobLabel = xPlayer.secondjob.label
				end
				cd = os.time() + 60
				TriggerClientEvent("exilerpChat:sendNews", -1, xPlayer.source, xPlayer.job.label, {120, 255, 120}, args)
				--TriggerClientEvent('chat:addMessage1', -1, xPlayer.job.label, {255, 206, 10}, args, "fas fa-newspaper")
				exports['ocean_logs']:SendLog(source, "NEWS: [" .. jobLabel .. "]: " .. args, 'chat', '8359053')
				xPlayer.removeAccountMoney('bank', 200)
			else
				TriggerClientEvent('chat:addMessage', source, "SYSTEM", {255, 0, 0}, "Nie posiadasz permisji do użycia tej komendy!")
			end
		end
	end
end, false)

RegisterCommand('try', function(source, args, message, rawCommand)
	if(IsPlayerAceAllowed(source, "chatfilter:bypass")) then else
		CancelEvent()
		local finalmessage = message:lower()
		finalmessage = finalmessage:gsub(" ", "")
		finalmessage = finalmessage:gsub("%-", "")
		finalmessage = finalmessage:gsub("%.", "")
		finalmessage = finalmessage:gsub("$", "s")
		finalmessage = finalmessage:gsub("€", "e")
		finalmessage = finalmessage:gsub(",", "")
		finalmessage = finalmessage:gsub(";", "")
		finalmessage = finalmessage:gsub(":", "")
		finalmessage = finalmessage:gsub("*", "")
		finalmessage = finalmessage:gsub("_", "")
		finalmessage = finalmessage:gsub("|", "")
		finalmessage = finalmessage:gsub("/", "")
		finalmessage = finalmessage:gsub("<", "")
		finalmessage = finalmessage:gsub(">", "")
		finalmessage = finalmessage:gsub("ß", "ss")
		finalmessage = finalmessage:gsub("&", "")
		finalmessage = finalmessage:gsub("+", "")
		finalmessage = finalmessage:gsub("¦", "")
		finalmessage = finalmessage:gsub("§", "s")
		finalmessage = finalmessage:gsub("°", "")
		finalmessage = finalmessage:gsub("#", "")
		finalmessage = finalmessage:gsub("@", "a")
		finalmessage = finalmessage:gsub("\"", "")
		finalmessage = finalmessage:gsub("%(", "")
		finalmessage = finalmessage:gsub("%)", "")
		finalmessage = finalmessage:gsub("=", "")
		finalmessage = finalmessage:gsub("?", "")
		finalmessage = finalmessage:gsub("!", "")
		finalmessage = finalmessage:gsub("´", "")
		finalmessage = finalmessage:gsub("`", "")
		finalmessage = finalmessage:gsub("'", "")
		finalmessage = finalmessage:gsub("%^", "")
		finalmessage = finalmessage:gsub("~", "")
		finalmessage = finalmessage:gsub("%[", "")
		finalmessage = finalmessage:gsub("]", "")
		finalmessage = finalmessage:gsub("{", "")
		finalmessage = finalmessage:gsub("}", "")
		finalmessage = finalmessage:gsub("£", "e")
		finalmessage = finalmessage:gsub("¨", "")
		finalmessage = finalmessage:gsub("ç", "c")
		finalmessage = finalmessage:gsub("¬", "")
		finalmessage = finalmessage:gsub("\\", "")
		finalmessage = finalmessage:gsub("1", "i")
		finalmessage = finalmessage:gsub("3", "e")
		finalmessage = finalmessage:gsub("4", "a")
		finalmessage = finalmessage:gsub("5", "s")
		finalmessage = finalmessage:gsub("0", "o")

		local lastchar = ""
		local output = ""
		for char in finalmessage:gmatch(".") do
			if(char ~= lastchar) then
				output = output .. char
			end
			lastchar = char
		end

		local send = true
		for i in pairs(blacklist) do
			if(output:find(blacklist[i])) then
				if(mode == "delete") then

				elseif(mode == "kick") then
					DropPlayer(source, kickmessage)
				end
				send = false
				break
			end
		end
		if(send) then
			local xPlayer = ESX.GetPlayerFromId(source)
			local czas = os.date("%Y/%m/%d %X")
			local czy = math.random(1, 2)
			TriggerClientEvent("sendProximityMessageCzy", -1, source, source, table.concat(args, " "), czy)

			local text = ''

			if czy == 1 then
				text = 'Udane'
			elseif czy == 2 then
				text = 'Nieudane'
			end

			for i = 1,#args do
				text = text .. ' ' .. args[i]
			end

			color = {r = 256, g = 202, b = 247, alpha = 255}
			exports['ocean_logs']:SendLog(source, "DO: " .. text, 'chat', '3066993')
			TriggerClientEvent('esx_rpchat:triggerDisplay', -1, text, source, color)
		end
	end
end, false)

RegisterCommand('do', function(source, args, message, rawCommand)
	if(IsPlayerAceAllowed(source, "chatfilter:bypass")) then else
		CancelEvent()
		local finalmessage = message:lower()
		finalmessage = finalmessage:gsub(" ", "")
		finalmessage = finalmessage:gsub("%-", "")
		finalmessage = finalmessage:gsub("%.", "")
		finalmessage = finalmessage:gsub("$", "s")
		finalmessage = finalmessage:gsub("€", "e")
		finalmessage = finalmessage:gsub(",", "")
		finalmessage = finalmessage:gsub(";", "")
		finalmessage = finalmessage:gsub(":", "")
		finalmessage = finalmessage:gsub("*", "")
		finalmessage = finalmessage:gsub("_", "")
		finalmessage = finalmessage:gsub("|", "")
		finalmessage = finalmessage:gsub("/", "")
		finalmessage = finalmessage:gsub("<", "")
		finalmessage = finalmessage:gsub(">", "")
		finalmessage = finalmessage:gsub("ß", "ss")
		finalmessage = finalmessage:gsub("&", "")
		finalmessage = finalmessage:gsub("+", "")
		finalmessage = finalmessage:gsub("¦", "")
		finalmessage = finalmessage:gsub("§", "s")
		finalmessage = finalmessage:gsub("°", "")
		finalmessage = finalmessage:gsub("#", "")
		finalmessage = finalmessage:gsub("@", "a")
		finalmessage = finalmessage:gsub("\"", "")
		finalmessage = finalmessage:gsub("%(", "")
		finalmessage = finalmessage:gsub("%)", "")
		finalmessage = finalmessage:gsub("=", "")
		finalmessage = finalmessage:gsub("?", "")
		finalmessage = finalmessage:gsub("!", "")
		finalmessage = finalmessage:gsub("´", "")
		finalmessage = finalmessage:gsub("`", "")
		finalmessage = finalmessage:gsub("'", "")
		finalmessage = finalmessage:gsub("%^", "")
		finalmessage = finalmessage:gsub("~", "")
		finalmessage = finalmessage:gsub("%[", "")
		finalmessage = finalmessage:gsub("]", "")
		finalmessage = finalmessage:gsub("{", "")
		finalmessage = finalmessage:gsub("}", "")
		finalmessage = finalmessage:gsub("£", "e")
		finalmessage = finalmessage:gsub("¨", "")
		finalmessage = finalmessage:gsub("ç", "c")
		finalmessage = finalmessage:gsub("¬", "")
		finalmessage = finalmessage:gsub("\\", "")
		finalmessage = finalmessage:gsub("1", "i")
		finalmessage = finalmessage:gsub("3", "e")
		finalmessage = finalmessage:gsub("4", "a")
		finalmessage = finalmessage:gsub("5", "s")
		finalmessage = finalmessage:gsub("0", "o")

		local lastchar = ""
		local output = ""
		for char in finalmessage:gmatch(".") do
			if(char ~= lastchar) then
				output = output .. char
			end
			lastchar = char
		end

		local send = true
		for i in pairs(blacklist) do
			if(output:find(blacklist[i])) then
				if(mode == "delete") then

				elseif(mode == "kick") then
					DropPlayer(source, kickmessage)
				end
				send = false
				break
			end
		end
		if(send) then
			local xPlayer = ESX.GetPlayerFromId(source)
			local czas = os.date("%Y/%m/%d %X")
			TriggerClientEvent("sendProximityMessageDo", -1, source, source, table.concat(args, " "))

			local text = ''
			for i = 1,#args do
				text = text .. ' ' .. args[i]
			end

			color = {r = 256, g = 202, b = 247, alpha = 255}
			exports['ocean_logs']:SendLog(source, "DO: " .. text, 'chat', '3066993')
			TriggerClientEvent('esx_rpchat:triggerDisplay', -1, text, source, color)
		end
	end
end, false)

RegisterServerEvent('sendProximityMessageTweetServer')
AddEventHandler('sendProximityMessageTweetServer', function(message)
	if(IsPlayerAceAllowed(source, "chatfilter:bypass")) then else
		CancelEvent()
		local finalmessage = message:lower()
		finalmessage = finalmessage:gsub(" ", "")
		finalmessage = finalmessage:gsub("%-", "")
		finalmessage = finalmessage:gsub("%.", "")
		finalmessage = finalmessage:gsub("$", "s")
		finalmessage = finalmessage:gsub("€", "e")
		finalmessage = finalmessage:gsub(",", "")
		finalmessage = finalmessage:gsub(";", "")
		finalmessage = finalmessage:gsub(":", "")
		finalmessage = finalmessage:gsub("*", "")
		finalmessage = finalmessage:gsub("_", "")
		finalmessage = finalmessage:gsub("|", "")
		finalmessage = finalmessage:gsub("/", "")
		finalmessage = finalmessage:gsub("<", "")
		finalmessage = finalmessage:gsub(">", "")
		finalmessage = finalmessage:gsub("ß", "ss")
		finalmessage = finalmessage:gsub("&", "")
		finalmessage = finalmessage:gsub("+", "")
		finalmessage = finalmessage:gsub("¦", "")
		finalmessage = finalmessage:gsub("§", "s")
		finalmessage = finalmessage:gsub("°", "")
		finalmessage = finalmessage:gsub("#", "")
		finalmessage = finalmessage:gsub("@", "a")
		finalmessage = finalmessage:gsub("\"", "")
		finalmessage = finalmessage:gsub("%(", "")
		finalmessage = finalmessage:gsub("%)", "")
		finalmessage = finalmessage:gsub("=", "")
		finalmessage = finalmessage:gsub("?", "")
		finalmessage = finalmessage:gsub("!", "")
		finalmessage = finalmessage:gsub("´", "")
		finalmessage = finalmessage:gsub("`", "")
		finalmessage = finalmessage:gsub("'", "")
		finalmessage = finalmessage:gsub("%^", "")
		finalmessage = finalmessage:gsub("~", "")
		finalmessage = finalmessage:gsub("%[", "")
		finalmessage = finalmessage:gsub("]", "")
		finalmessage = finalmessage:gsub("{", "")
		finalmessage = finalmessage:gsub("}", "")
		finalmessage = finalmessage:gsub("£", "e")
		finalmessage = finalmessage:gsub("¨", "")
		finalmessage = finalmessage:gsub("ç", "c")
		finalmessage = finalmessage:gsub("¬", "")
		finalmessage = finalmessage:gsub("\\", "")
		finalmessage = finalmessage:gsub("1", "i")
		finalmessage = finalmessage:gsub("3", "e")
		finalmessage = finalmessage:gsub("4", "a")
		finalmessage = finalmessage:gsub("5", "s")
		finalmessage = finalmessage:gsub("0", "o")

		local lastchar = ""
		local output = ""
		for char in finalmessage:gmatch(".") do
			if(char ~= lastchar) then
				output = output .. char
			end
			lastchar = char
		end

		local send = true
		for i in pairs(blacklist) do
			if(output:find(blacklist[i])) then
				if(mode == "delete") then

				elseif(mode == "kick") then
					DropPlayer(source, kickmessage)
				end
				send = false
				break
			end
		end
		if(send) then
			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)
	
			if CheckPhone(_source) <= 0 then
				TriggerClientEvent('esx:showNotification', _source, 'Nie posiadasz telefonu.')
				return
			elseif os.time() < cd then
				TriggerClientEvent('esx:showNotification', _source, '~b~Poczekaj chwilę, aż wszyscy odczytają najnowszego newsa!')
				return
			elseif BlockTWT[xPlayer.identifier] == true then 
				TriggerClientEvent('esx:showNotification', _source, '~b~Jesteś zablokowany i nie możesz wysłać wiadomości')
				return	
			end

			TriggerClientEvent('sendProximityMessageTweet', -1, "^*"..xPlayer.character.firstname..' '..xPlayer.character.lastname, message, _source)
			exports['ocean_logs']:SendLog(_source, "TWT: " .. message, 'chat', '2123412')
		end
	end
end)

RegisterServerEvent('sendProximityMessageDarkWebServer')
AddEventHandler('sendProximityMessageDarkWebServer', function(message)
	if(IsPlayerAceAllowed(source, "chatfilter:bypass")) then else
		CancelEvent()
		local finalmessage = message:lower()
		finalmessage = finalmessage:gsub(" ", "")
		finalmessage = finalmessage:gsub("%-", "")
		finalmessage = finalmessage:gsub("%.", "")
		finalmessage = finalmessage:gsub("$", "s")
		finalmessage = finalmessage:gsub("€", "e")
		finalmessage = finalmessage:gsub(",", "")
		finalmessage = finalmessage:gsub(";", "")
		finalmessage = finalmessage:gsub(":", "")
		finalmessage = finalmessage:gsub("*", "")
		finalmessage = finalmessage:gsub("_", "")
		finalmessage = finalmessage:gsub("|", "")
		finalmessage = finalmessage:gsub("/", "")
		finalmessage = finalmessage:gsub("<", "")
		finalmessage = finalmessage:gsub(">", "")
		finalmessage = finalmessage:gsub("ß", "ss")
		finalmessage = finalmessage:gsub("&", "")
		finalmessage = finalmessage:gsub("+", "")
		finalmessage = finalmessage:gsub("¦", "")
		finalmessage = finalmessage:gsub("§", "s")
		finalmessage = finalmessage:gsub("°", "")
		finalmessage = finalmessage:gsub("#", "")
		finalmessage = finalmessage:gsub("@", "a")
		finalmessage = finalmessage:gsub("\"", "")
		finalmessage = finalmessage:gsub("%(", "")
		finalmessage = finalmessage:gsub("%)", "")
		finalmessage = finalmessage:gsub("=", "")
		finalmessage = finalmessage:gsub("?", "")
		finalmessage = finalmessage:gsub("!", "")
		finalmessage = finalmessage:gsub("´", "")
		finalmessage = finalmessage:gsub("`", "")
		finalmessage = finalmessage:gsub("'", "")
		finalmessage = finalmessage:gsub("%^", "")
		finalmessage = finalmessage:gsub("~", "")
		finalmessage = finalmessage:gsub("%[", "")
		finalmessage = finalmessage:gsub("]", "")
		finalmessage = finalmessage:gsub("{", "")
		finalmessage = finalmessage:gsub("}", "")
		finalmessage = finalmessage:gsub("£", "e")
		finalmessage = finalmessage:gsub("¨", "")
		finalmessage = finalmessage:gsub("ç", "c")
		finalmessage = finalmessage:gsub("¬", "")
		finalmessage = finalmessage:gsub("\\", "")
		finalmessage = finalmessage:gsub("1", "i")
		finalmessage = finalmessage:gsub("3", "e")
		finalmessage = finalmessage:gsub("4", "a")
		finalmessage = finalmessage:gsub("5", "s")
		finalmessage = finalmessage:gsub("0", "o")

		local lastchar = ""
		local output = ""
		for char in finalmessage:gmatch(".") do
			if(char ~= lastchar) then
				output = output .. char
			end
			lastchar = char
		end

		local send = true
		for i in pairs(blacklist) do
			if(output:find(blacklist[i])) then
				if(mode == "delete") then

				elseif(mode == "kick") then
					DropPlayer(source, kickmessage)
				end
				send = false
				break
			end
		end
		if(send) then
			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)
			
			if CheckPhone(_source) <= 0 then
				local playerName = GetPlayerName(_source)
				TriggerClientEvent('esx:showNotification', _source, '~r~Nie posiadasz telefonu.')
				return
			elseif BlockDW[xPlayer.identifier] == true then
				TriggerClientEvent('esx:showNotification', _source, '~b~Jesteś zablokowany i nie możesz wysłać wiadomości')
				return	
			elseif xPlayer.getAccount('bank').money <= 200 then
				TriggerClientEvent('esx:showNotification', _source, '~r~Nie posiadasz wystarczająco gotówki w banku, aby wysłać wiadomość na darkwebie')
				return	
			end

			if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
				TriggerClientEvent('esx:showNotification', _source, '~r~Nie masz dostępu do tej aplikacji!')
			else
				TriggerClientEvent("sendProximityMessageDarkWeb", -1, message, _source)
				
				exports['ocean_logs']:SendLog(_source, "DW: " .. message, 'chat')
				xPlayer.removeAccountMoney('bank', 200)
			end
		end
	end
end)
local Colors = {
	['best'] = {0, 0, 0},
	['dev'] = {0, 0, 128},
	['superadmin'] = {255, 0, 0},
	['admin'] = {0, 191, 255},
	['starszyadmin'] = {50, 168, 82},
	['starszymod'] = {50, 168, 82},
	['mod'] = {132, 112, 255},
	['support'] = {255, 165, 0},
	['trialsupport'] = {255, 255, 0},
	['vip'] = {255, 195, 66},
}

RegisterCommand('ooc', function(source, args, message, rawCommand)
	if(IsPlayerAceAllowed(source, "chatfilter:bypass")) then else
		CancelEvent()
		local finalmessage = message:lower()
		finalmessage = finalmessage:gsub(" ", "")
		finalmessage = finalmessage:gsub("%-", "")
		finalmessage = finalmessage:gsub("%.", "")
		finalmessage = finalmessage:gsub("$", "s")
		finalmessage = finalmessage:gsub("€", "e")
		finalmessage = finalmessage:gsub(",", "")
		finalmessage = finalmessage:gsub(";", "")
		finalmessage = finalmessage:gsub(":", "")
		finalmessage = finalmessage:gsub("*", "")
		finalmessage = finalmessage:gsub("_", "")
		finalmessage = finalmessage:gsub("|", "")
		finalmessage = finalmessage:gsub("/", "")
		finalmessage = finalmessage:gsub("<", "")
		finalmessage = finalmessage:gsub(">", "")
		finalmessage = finalmessage:gsub("ß", "ss")
		finalmessage = finalmessage:gsub("&", "")
		finalmessage = finalmessage:gsub("+", "")
		finalmessage = finalmessage:gsub("¦", "")
		finalmessage = finalmessage:gsub("§", "s")
		finalmessage = finalmessage:gsub("°", "")
		finalmessage = finalmessage:gsub("#", "")
		finalmessage = finalmessage:gsub("@", "a")
		finalmessage = finalmessage:gsub("\"", "")
		finalmessage = finalmessage:gsub("%(", "")
		finalmessage = finalmessage:gsub("%)", "")
		finalmessage = finalmessage:gsub("=", "")
		finalmessage = finalmessage:gsub("?", "")
		finalmessage = finalmessage:gsub("!", "")
		finalmessage = finalmessage:gsub("´", "")
		finalmessage = finalmessage:gsub("`", "")
		finalmessage = finalmessage:gsub("'", "")
		finalmessage = finalmessage:gsub("%^", "")
		finalmessage = finalmessage:gsub("~", "")
		finalmessage = finalmessage:gsub("%[", "")
		finalmessage = finalmessage:gsub("]", "")
		finalmessage = finalmessage:gsub("{", "")
		finalmessage = finalmessage:gsub("}", "")
		finalmessage = finalmessage:gsub("£", "e")
		finalmessage = finalmessage:gsub("¨", "")
		finalmessage = finalmessage:gsub("ç", "c")
		finalmessage = finalmessage:gsub("¬", "")
		finalmessage = finalmessage:gsub("\\", "")
		finalmessage = finalmessage:gsub("1", "i")
		finalmessage = finalmessage:gsub("3", "e")
		finalmessage = finalmessage:gsub("4", "a")
		finalmessage = finalmessage:gsub("5", "s")
		finalmessage = finalmessage:gsub("0", "o")

		local lastchar = ""
		local output = ""
		for char in finalmessage:gmatch(".") do
			if(char ~= lastchar) then
				output = output .. char
			end
			lastchar = char
		end

		local send = true
		for i in pairs(blacklist) do
			if(output:find(blacklist[i])) then
				if(mode == "delete") then

				elseif(mode == "kick") then
					DropPlayer(source, kickmessage)
				end
				send = false
				break
			end
		end
		if(send) then
			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)
			local userColor = Colors[xPlayer.group]
			if xPlayer.group ~= nil and xPlayer.group ~= 'user' then
				TriggerClientEvent("exilerpChat:addOOC", -1, _source, GetPlayerName(_source), userColor, table.concat(args, " "), "fas fa-shield-alt")
				exports['ocean_logs']:SendLog(_source, "OOC: " .. table.concat(args, " "), 'chat')
			end
		end
	end
end, false)

ESX.RegisterCommand('unblockdw', {'mod', 'starszymod', 'admin', 'starszyadmin', 'superadmin', 'best', 'dev'}, function(xPlayer, args, showError)
	if args.targetid ~= nil then
		local tPlayer = ESX.GetPlayerFromId(args.targetid)
		if tPlayer and BlockDW[tPlayer.identifier] and BlockDW[tPlayer.identifier] ~= nil then
			MySQL.query("SELECT * FROM chat_bans WHERE identifier = @identifier AND chat = @chat", {
				['@identifier'] = tPlayer.identifier,
				['@chat']="dw"
			}, function(rows) 
				if rows[1] and rows[1] ~= nil then
					BlockDW[tPlayer.identifier] = nil
					MySQL.update('DELETE FROM chat_bans WHERE identifier = @identifier AND chat = @chat', {
						['@identifier'] = tPlayer.identifier,
						['@chat'] = "dw"
					})
					xPlayer.showNotification("~b~Odblokowano darkweba ~r~"..tPlayer.source)
					tPlayer.showNotification("~b~Odzyskałeś dostęp do Darkweb")
					for i,v in ipairs(BlockTable) do
						if v == tPlayer.identifier then
							table.remove(BlockTable, i)
							break
						end	
					end	
					exports['ocean_logs']:SendLog(xPlayer.source, "Użyto komendy /unblockdw " .. args.targetid, "admin_commands")
				else
					xPlayer.showNotification("~b~Gracz ma już dostęp do darkweba")
					exports['ocean_logs']:SendLog(xPlayer.source, "Użyto komendy /unblockdw " .. args.targetid, "admin_commands")
				end	
			end)
		end
	end
end, true, {help = "Odblokuj graczowi dostęp do darkweba", validate = true, arguments = {
	{name = 'targetid', help = "ID gracza", type = 'number'}
}})

ESX.RegisterCommand('unblocktwt', {'mod', 'starszymod', 'admin', 'starszyadmin', 'superadmin', 'best', 'dev'}, function(xPlayer, args, showError)
	if args.targetid ~= nil then
		local tPlayer = ESX.GetPlayerFromId(args.targetid)
		if tPlayer and BlockTWT[tPlayer.identifier] and BlockTWT[tPlayer.identifier] ~= nil then
			MySQL.query("SELECT * FROM chat_bans WHERE identifier = @identifier AND chat = @chat", {
				['@identifier'] = tPlayer.identifier,
				['@chat']="twt"
			}, function(rows) 
				if rows[1] and rows[1] ~= nil then
					local userData = tPlayer.character.firstname .. ' ' .. tPlayer.character.lastname
					BlockTWT[tPlayer.identifier] = nil
					MySQL.update('DELETE FROM chat_bans WHERE identifier = @identifier AND chat = @chat', {
						['@identifier'] = tPlayer.identifier,
						['@chat'] = "twt"
					})
					xPlayer.showNotification("~b~Odblokowano twittera ~r~"..tPlayer.source)
					tPlayer.showNotification("~b~Odzyskałeś dostęp do Twitter")
					TriggerClientEvent('chatMessage', -1, "🔔 TWITTER ADMIN: ", {26, 26, 26}, userData .. " został odblokowany")
					for i,v in ipairs(BlockTable) do
						if v == tPlayer.identifier then
							table.remove(BlockTable, i)
							break
						end	
					end	
					exports['ocean_logs']:SendLog(xPlayer.source, "Użyto komendy /unblocktwt " .. args.targetid, "admin_commands")
				else
					xPlayer.showNotification("~b~Gracz ma już dostęp do twitter")
					exports['ocean_logs']:SendLog(xPlayer.source, "Użyto komendy /unblocktwt " .. args.targetid, "admin_commands")
				end	
			end)
		end
	end
end, true, {help = "Odblokuj graczowi dostęp do twittera", validate = true, arguments = {
	{name = 'targetid', help = "ID gracza", type = 'number'}
}})

ESX.RegisterCommand('blocktwt', {'mod', 'starszymod', 'admin', 'starszyadmin', 'superadmin', 'best', 'dev'}, function(xPlayer, args, showError)
	if args.targetid ~= nil and (args.czas ~= nil and args.czas > 0) then
		local tPlayer = ESX.GetPlayerFromId(args.targetid)
		if tPlayer then
			local userData = tPlayer.character.firstname .. ' ' .. tPlayer.character.lastname
			local unixDuration = os.time() + (tonumber(args.czas) * 3600)
			MySQL.update('INSERT INTO chat_bans (identifier, unix, chat) VALUES (@identifier, @unix, @chat)',
			{
				['@identifier'] = tPlayer.identifier,
				['@unix'] = unixDuration,
				['@chat'] = 'twt'
			}, function(rowsChanged)
				table.insert(BlockTable, {identifier = tPlayer.identifier, unix = unixDuration, chat = 'twt'})
				BlockTWT[tPlayer.identifier] = true
				TriggerClientEvent('chatMessage', -1, "🔔 TWITTER ADMIN: ", {0, 0, 128}, userData .. " został zablokowany na okres " .. args.czas .. " godzin")
				exports['ocean_logs']:SendLog(xPlayer.source, "Użyto komendy /blocktwt " .. args.targetid .. " " .. args.czas, "admin_commands")
			end)
		end
	end
end, true, {help = "Zablokuj graczowi dostęp do twittera", validate = true, arguments = {
	{name = 'targetid', help = "ID gracza", type = 'number'},
	{name = 'czas', help = "Czas blokady w godzinach", type = 'number'}
}})

ESX.RegisterCommand('blockdw', {'mod', 'starszymod', 'admin', 'starszyadmin', 'superadmin', 'best', 'dev'}, function(xPlayer, args, showError)
	if args.targetid ~= nil and (args.czas ~= nil and args.czas > 0) then
		local tPlayer = ESX.GetPlayerFromId(args.targetid)
		if tPlayer then
			local unixDuration = os.time() + (tonumber(args.czas) * 3600)
			MySQL.update('INSERT INTO chat_bans (identifier, unix, chat) VALUES (@identifier, @unix, @chat)',
			{
				['@identifier'] = tPlayer.identifier,
				['@unix'] = unixDuration,
				['@chat'] = 'dw'
			}, function(rowsChanged)
				table.insert(BlockTable, {identifier = tPlayer.identifier, unix = unixDuration, chat = 'dw'})
				BlockDW[tPlayer.identifier] = true
				tPlayer.showNotification("~b~Zostałeś zablokowany na " .. args.czas .. " godzin. Nie możesz korzystać z Darkweba")
				exports['ocean_logs']:SendLog(xPlayer.source, "Użyto komendy /blockdw " .. args.targetid .. " " .. args.czas, "admin_commands")
			end)
		end
	end
end, true, {help = "Zablokuj graczowi dostęp do darkweba", validate = true, arguments = {
	{name = 'targetid', help = "ID gracza", type = 'number'},
	{name = 'czas', help = "Czas blokady w godzinach", type = 'number'}
}})

ESX.RegisterServerCallback('ExileRP:ZapodajOpisyZPrzedWejscia', function(source, cb) -- fix 🌘
	cb(opisy)
end)

AddEventHandler('playerDropped', function()
	local _source = source
	if opisy[_source] then
		opisy[_source] = nil
	end
end)

RegisterCommand('opis', function(source, args, message, rawCommand)
	if(IsPlayerAceAllowed(source, "chatfilter:bypass")) then else
		CancelEvent()
		local finalmessage = message:lower()
		finalmessage = finalmessage:gsub(" ", "")
		finalmessage = finalmessage:gsub("", "")
		finalmessage = finalmessage:gsub("%-", "")
		finalmessage = finalmessage:gsub("%.", "")
		finalmessage = finalmessage:gsub("$", "s")
		finalmessage = finalmessage:gsub("€", "e")
		finalmessage = finalmessage:gsub(",", "")
		finalmessage = finalmessage:gsub(";", "")
		finalmessage = finalmessage:gsub(":", "")
		finalmessage = finalmessage:gsub("*", "")
		finalmessage = finalmessage:gsub("_", "")
		finalmessage = finalmessage:gsub("|", "")
		finalmessage = finalmessage:gsub("/", "")
		finalmessage = finalmessage:gsub("<", "")
		finalmessage = finalmessage:gsub(">", "")
		finalmessage = finalmessage:gsub("ß", "ss")
		finalmessage = finalmessage:gsub("&", "")
		finalmessage = finalmessage:gsub("+", "")
		finalmessage = finalmessage:gsub("¦", "")
		finalmessage = finalmessage:gsub("§", "s")
		finalmessage = finalmessage:gsub("°", "")
		finalmessage = finalmessage:gsub("#", "")
		finalmessage = finalmessage:gsub("@", "a")
		finalmessage = finalmessage:gsub("\"", "")
		finalmessage = finalmessage:gsub("%(", "")
		finalmessage = finalmessage:gsub("%)", "")
		finalmessage = finalmessage:gsub("=", "")
		finalmessage = finalmessage:gsub("?", "")
		finalmessage = finalmessage:gsub("!", "")
		finalmessage = finalmessage:gsub("´", "")
		finalmessage = finalmessage:gsub("`", "")
		finalmessage = finalmessage:gsub("'", "")
		finalmessage = finalmessage:gsub("%^", "")
		finalmessage = finalmessage:gsub("~", "")
		finalmessage = finalmessage:gsub("%[", "")
		finalmessage = finalmessage:gsub("]", "")
		finalmessage = finalmessage:gsub("{", "")
		finalmessage = finalmessage:gsub("}", "")
		finalmessage = finalmessage:gsub("£", "e")
		finalmessage = finalmessage:gsub("¨", "")
		finalmessage = finalmessage:gsub("ç", "c")
		finalmessage = finalmessage:gsub("¬", "")
		finalmessage = finalmessage:gsub("\\", "")
		finalmessage = finalmessage:gsub("1", "i")
		finalmessage = finalmessage:gsub("3", "e")
		finalmessage = finalmessage:gsub("4", "a")
		finalmessage = finalmessage:gsub("5", "s")
		finalmessage = finalmessage:gsub("0", "o")

		local lastchar = ""
		local output = ""
		for char in finalmessage:gmatch(".") do
			if(char ~= lastchar) then
				output = output .. char
			end
			lastchar = char
		end

		local send = true
		for i in pairs(blacklist) do
			if(output:find(blacklist[i])) then
				if(mode == "delete") then

				elseif(mode == "kick") then
					DropPlayer(source, kickmessage)
				end
				send = false
				break
			end
		end
		if(send) then
			if args[1] ~= nil then
				local text = table.concat(args, " ")
				if #text > 91 then
					TriggerClientEvent('esx:showNotification', _source, 'Maksymalna długość opisu to 91 znaków!')
				else
					  TriggerClientEvent('ExileRP:opis', -1, source, ''..text..'')
					exports['ocean_logs']:SendLog(source, "STWORZYŁ OPIS: " .. text, 'chat', '15844367')
					opisy[source] = text
				end
			else
				TriggerClientEvent('ExileRP:opis', -1, source, '')
				opisy[source] = nil
			end
		end
	end
end, false)

RegisterServerEvent('ExileRP:opisInnychGraczyServer')
AddEventHandler('ExileRP:opisInnychGraczyServer', function(id, opis)
    TriggerClientEvent('ExileRP:opis', -1, id, opis)
end)

RegisterServerEvent('esx_rpchat:shareDisplay')
AddEventHandler('esx_rpchat:shareDisplay', function(text, color)
	TriggerClientEvent('esx_rpchat:triggerDisplay', -1, text, source, color)
end)

bannedIdentifiers = {}
lastReports = {}
cooldownsReport = {}

function findLastReport(id)
	for k,v in pairs(lastReports) do
		if k == tostring(id) then
			return v
		end	
	end	
	return nil
end	

function findCooldown(id)
	for i,v in ipairs(cooldownsReport) do
		if v == id then
			return true
		end	
	end	
	return false
end	

function isReportBanned(id)
	local license  = false

	for k,v in pairs(GetPlayerIdentifiers(id)) do
		if string.sub(v, 1, string.len("license:")) == "license:" then
			license = v
		end
	end

	for i,v in ipairs(bannedIdentifiers) do
		if v == license then
			return true
		end	
	end	
	return false
end	

function removeReportBan(id)
	for i,v in ipairs(bannedIdentifiers) do
		if v == id then
			table.remove(bannedIdentifiers, i)
			return
		end	
	end	
end	

function removeCooldown(id) 
	for i,v in ipairs(cooldownsReport) do
		if v == id then
			table.remove(cooldownsReport, i)
		end	
	end	
end

RegisterNetEvent("exilerp:banReport")
AddEventHandler("exilerp:banReport", function(id) 
	local license  = false
	for k,v in pairs(GetPlayerIdentifiers(id)) do
		if string.sub(v, 1, string.len("license:")) == "license:" then
			license = v
		end
	end
	if license ~= false then
		local xPlayer = ESX.GetPlayerFromId(src)
		table.insert(bannedIdentifiers, license)
		xPlayer.showNotification('~r~Zostałeś zbanowany na wysyłanie reportów przez 30 minut.')
		CreateThread(function() 
			Wait(1800000)
			removeReportBan(license)
		end)
	end	
end)

local activeReports = {}
local reportsInfo = {}

RegisterCommand("arep", function(source,args,raw) 
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	if xPlayer and xPlayer.getGroup() ~= "user" then
		if args[1] then
			local rId = args[1]
			if rId then
				local report = activeReports[rId]
				if report then 
					local inforeport = reportsInfo[rId]
					if inforeport.id == src then
						TriggerClientEvent("esx:showNotification", src, "~r~Próbujesz przyjąć swojego reporta?")
						exports['ocean_logs']:SendLog(src, "Administrator **"..GetPlayerName(src).."** próbował przyjąć swojego reporta `#"..rId.."` 🥴", 'eckogrzywka')
					else
						local xPlr = ESX.GetPlayerFromId(inforeport.id)
						if xPlr and xPlr.source ~= 0 and xPlr.group == 'superadmin' or xPlr.group == 'admin' or xPlr.group == 'best' or xPlr.group == 'mod' or xPlr.group == 'support' or xPlr.group == 'superadmin' or xPlr.group == 'trialsupport' then
							TriggerClientEvent("esx:showNotification", src, "~r~Nie możesz przyjąć reporta administratora.")
							return
						end
						activeReports[rId] = false
						TriggerClientEvent("acceptedReport", -1, GetPlayerName(src), src, rId, inforeport.id, inforeport.content)
						exports['ocean_logs']:SendLog(src, "Administrator **"..GetPlayerName(src).."** przyjął reporta `#"..rId.."` o treści `"..inforeport.content.."` od gracza `["..inforeport.id.."] "..inforeport.name.."`", 'eckogrzywka')
						
					end
				else
					TriggerClientEvent("esx:showNotification", src, "~r~Report został już przyjęty lub nie istnieje")
				end
			else
				TriggerClientEvent("esx:showNotification", src, "~r~Nie prawidłowe ID reporta")
			end
		else
			TriggerClientEvent("esx:showNotification", src, "~r~Podaj ID reporta")
		end
	else
		TriggerClientEvent("esx:showNotification", src, "~r~Nie posiadasz permisji")
	end
end,false)

AddEventHandler('chatMessage', function(source, color, message, msg)
	if(IsPlayerAceAllowed(source, "chatfilter:bypass")) then else
		CancelEvent()
		local finalmessage = message:lower()
		finalmessage = finalmessage:gsub(" ", "")
		finalmessage = finalmessage:gsub("%-", "")
		finalmessage = finalmessage:gsub("%.", "")
		finalmessage = finalmessage:gsub("$", "s")
		finalmessage = finalmessage:gsub("€", "e")
		finalmessage = finalmessage:gsub(",", "")
		finalmessage = finalmessage:gsub(";", "")
		finalmessage = finalmessage:gsub(":", "")
		finalmessage = finalmessage:gsub("*", "")
		finalmessage = finalmessage:gsub("_", "")
		finalmessage = finalmessage:gsub("|", "")
		finalmessage = finalmessage:gsub("/", "")
		finalmessage = finalmessage:gsub("<", "")
		finalmessage = finalmessage:gsub(">", "")
		finalmessage = finalmessage:gsub("ß", "ss")
		finalmessage = finalmessage:gsub("&", "")
		finalmessage = finalmessage:gsub("+", "")
		finalmessage = finalmessage:gsub("¦", "")
		finalmessage = finalmessage:gsub("§", "s")
		finalmessage = finalmessage:gsub("°", "")
		finalmessage = finalmessage:gsub("#", "")
		finalmessage = finalmessage:gsub("@", "a")
		finalmessage = finalmessage:gsub("\"", "")
		finalmessage = finalmessage:gsub("%(", "")
		finalmessage = finalmessage:gsub("%)", "")
		finalmessage = finalmessage:gsub("=", "")
		finalmessage = finalmessage:gsub("?", "")
		finalmessage = finalmessage:gsub("!", "")
		finalmessage = finalmessage:gsub("´", "")
		finalmessage = finalmessage:gsub("`", "")
		finalmessage = finalmessage:gsub("'", "")
		finalmessage = finalmessage:gsub("%^", "")
		finalmessage = finalmessage:gsub("~", "")
		finalmessage = finalmessage:gsub("%[", "")
		finalmessage = finalmessage:gsub("]", "")
		finalmessage = finalmessage:gsub("{", "")
		finalmessage = finalmessage:gsub("}", "")
		finalmessage = finalmessage:gsub("£", "e")
		finalmessage = finalmessage:gsub("¨", "")
		finalmessage = finalmessage:gsub("ç", "c")
		finalmessage = finalmessage:gsub("¬", "")
		finalmessage = finalmessage:gsub("\\", "")
		finalmessage = finalmessage:gsub("1", "i")
		finalmessage = finalmessage:gsub("3", "e")
		finalmessage = finalmessage:gsub("4", "a")
		finalmessage = finalmessage:gsub("5", "s")
		finalmessage = finalmessage:gsub("0", "o")

		local lastchar = ""
		local output = ""
		for char in finalmessage:gmatch(".") do
			if(char ~= lastchar) then
				output = output .. char
			end
			lastchar = char
		end

		local send = true
		for i in pairs(blacklist) do
			if(output:find(blacklist[i])) then
				if(mode == "delete") then

				elseif(mode == "kick") then
					DropPlayer(source, kickmessage)
				end
				send = false
				break
			end
		end
		if(send) then
			local xPlayer = ESX.GetPlayerFromId(source)
	cm = stringsplit(message, " ")
	if cm[1] == 'test' then
		local tPID = tonumber(cm[2])
	end
	if cm[1] == "/reply" or cm[1] == "/r" then
		CancelEvent()
		if tablelength(cm) > 1 then
			local tPID = tonumber(cm[2])
			local names2 = GetPlayerName(tPID)
			local names3 = GetPlayerName(source)
			local textmsg = ""
			for i=1, #cm do
				if i ~= 1 and i ~=2 then
					textmsg = (textmsg .. " " .. tostring(cm[i]))
				end
			end

		    if xPlayer.group ~= nil and xPlayer.group ~= 'user'then
			    TriggerClientEvent('textmsg', tPID, source, textmsg, names2, names3)
			    TriggerClientEvent('textsent', source, tPID, names2)
				exports['ocean_logs']:SendLog(source, "REPLY DO "..names2..": " .. textmsg, 'chat', '15105570')
		    else
			    TriggerClientEvent('chatMessage', source, "🔔 SYSTEM: ", {255, 0, 0}, " Brak permisji!")
			end
		end
	end	
	
	if cm[1] == "/report" then
		CancelEvent()
		if tablelength(cm) > 1 then
			local cd = findCooldown(xPlayer.source)
			local lastR = findLastReport(xPlayer.source)
			if cd then
				TriggerClientEvent('chatMessage', source, "🔔 SYSTEM: ", {255, 0, 0}, " Wysyłałeś ostatnio reporta, odczekaj chwilę")
				return
			end	
			local admins = 0
			local Players = exports['esx_scoreboard']:MisiaczekPlayers()
			for k,v in pairs(Players) do
				if v.group == 'superadmin' or v.group == 'admin' or v.group == 'best' or v.group == 'mod' or v.group == 'support' or v.group == 'superadmin' or v.group == 'trialsupport' then
					admins = admins + 1
				end
			end

			local names1 = GetPlayerName(source)
			local textmsg = ""
			for i=1, #cm do
				if i ~= 1 then
					textmsg = (textmsg .. " " .. tostring(cm[i]))
				end
			end
			if lastR == textmsg then
				TriggerClientEvent('chatMessage', source, "🔔 SYSTEM: ", {255, 0, 0}, " Wysyłałeś ostatnio reporta o tej treści")
				return
			end	
			if isReportBanned(xPlayer.source) then
				TriggerClientEvent('chatMessage', source, "🔔 SYSTEM: ", {255, 0, 0}, " Ze względu na spam reportów, jesteś zbanowany. Spróbuj ponownie później.")
				return
			end	
			local reportId = source..math.random(0,9)
			activeReports[reportId] = true
			reportsInfo[reportId] = {
				name = names1,
				content = textmsg,
				id = source
			}
			TriggerClientEvent("sendReport", -1, reportId, source, names1, textmsg, admins)
			lastReports[tostring(xPlayer.source)] = textmsg
			table.insert(cooldownsReport, xPlayer.source)
			CreateThread(function() 
				Wait(10000)
				removeCooldown(xPlayer.source)
			end)
			exports['ocean_logs']:SendLog(source, "Gracz potrzebuje pomocy `#"..reportId.."`: " .. textmsg, 'report', '15158332')
		end
	end	
		end
	end
end)

RegisterServerEvent("exilerp:rateReport", function(rate, admin, content) 
	local src = source
	exports['ocean_logs']:SendLog(src, "Gracz ocenił administratora `"..admin.."` na `"..rate.."/5` gwiazdek. Treść reporta `"..content.."`", 'pomoc')
end)

RegisterCommand('w', function(source, args, message, cm, raw)
	if(IsPlayerAceAllowed(source, "chatfilter:bypass")) then else
		CancelEvent()
		local finalmessage = message:lower()
		finalmessage = finalmessage:gsub(" ", "")
		finalmessage = finalmessage:gsub("%-", "")
		finalmessage = finalmessage:gsub("%.", "")
		finalmessage = finalmessage:gsub("$", "s")
		finalmessage = finalmessage:gsub("€", "e")
		finalmessage = finalmessage:gsub(",", "")
		finalmessage = finalmessage:gsub(";", "")
		finalmessage = finalmessage:gsub(":", "")
		finalmessage = finalmessage:gsub("*", "")
		finalmessage = finalmessage:gsub("_", "")
		finalmessage = finalmessage:gsub("|", "")
		finalmessage = finalmessage:gsub("/", "")
		finalmessage = finalmessage:gsub("<", "")
		finalmessage = finalmessage:gsub(">", "")
		finalmessage = finalmessage:gsub("ß", "ss")
		finalmessage = finalmessage:gsub("&", "")
		finalmessage = finalmessage:gsub("+", "")
		finalmessage = finalmessage:gsub("¦", "")
		finalmessage = finalmessage:gsub("§", "s")
		finalmessage = finalmessage:gsub("°", "")
		finalmessage = finalmessage:gsub("#", "")
		finalmessage = finalmessage:gsub("@", "a")
		finalmessage = finalmessage:gsub("\"", "")
		finalmessage = finalmessage:gsub("%(", "")
		finalmessage = finalmessage:gsub("%)", "")
		finalmessage = finalmessage:gsub("=", "")
		finalmessage = finalmessage:gsub("?", "")
		finalmessage = finalmessage:gsub("!", "")
		finalmessage = finalmessage:gsub("´", "")
		finalmessage = finalmessage:gsub("`", "")
		finalmessage = finalmessage:gsub("'", "")
		finalmessage = finalmessage:gsub("%^", "")
		finalmessage = finalmessage:gsub("~", "")
		finalmessage = finalmessage:gsub("%[", "")
		finalmessage = finalmessage:gsub("]", "")
		finalmessage = finalmessage:gsub("{", "")
		finalmessage = finalmessage:gsub("}", "")
		finalmessage = finalmessage:gsub("£", "e")
		finalmessage = finalmessage:gsub("¨", "")
		finalmessage = finalmessage:gsub("ç", "c")
		finalmessage = finalmessage:gsub("¬", "")
		finalmessage = finalmessage:gsub("\\", "")
		finalmessage = finalmessage:gsub("1", "i")
		finalmessage = finalmessage:gsub("3", "e")
		finalmessage = finalmessage:gsub("4", "a")
		finalmessage = finalmessage:gsub("5", "s")
		finalmessage = finalmessage:gsub("0", "o")

		local lastchar = ""
		local output = ""
		for char in finalmessage:gmatch(".") do
			if(char ~= lastchar) then
				output = output .. char
			end
			lastchar = char
		end

		local send = true
		for i in pairs(blacklist) do
			if(output:find(blacklist[i])) then
				if(mode == "delete") then

				elseif(mode == "kick") then
					DropPlayer(source, kickmessage)
				end
				send = false
				break
			end
		end
		if(send) then
			cm = stringsplit(message, " ")
			local tPID = tonumber(args[1])
			local names2 = GetPlayerName(tPID)
			if names2 then
				local names3 = GetPlayerName(source)
				local msgVar = {}
				local textmsg = ""
				for i=1, #cm do
					if i ~= 1 and i ~= 2 then
						textmsg = (textmsg .. " " .. tostring(cm[i]))
					end
				end
				TriggerClientEvent('chatMessage', tPID, "Wiadomość od ^*^1[^*^3"..source.." ^*^1| ^*^3 "..names3.."^*^1]:", {255, 0, 0}, textmsg)
				TriggerClientEvent('chatMessage', source, "Wiadomość wyslana do  ^*^1[^*^3"..tPID.." ^*^1| ^*^3 "..names2.."^*^1]:", {255, 0, 0}, textmsg)
				exports['ocean_logs']:SendLog(source, "WIADOMOSC DO "..GetPlayerName(tPID)..": " .. textmsg, 'chat', '2123412')
			else
				TriggerClientEvent('chatMessage', source, "Wiadomość", {255, 0, 0}, "Nie wysłano, ponieważ gracz jest offline!")
			end
		end
	end
end)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

RegisterServerEvent("wyjebzaafk")
AddEventHandler("wyjebzaafk", function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.group == nil or xPlayer.group == 'user' then
		DropPlayer(source, "OceanRP: Byłeś zbyt długo nieaktywny")
	end
end)

RegisterServerEvent("pierdolciesieniggerydumpujacebotujestwszystko")
AddEventHandler("pierdolciesieniggerydumpujacebotujestwszystko", function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer then
		DropPlayer(source, "OceanRP: Wyrzucono za brak wymaganych propów")
		exports['ocean_logs']:SendLog(source, "Wyrzucono za brak wymaganych propów", 'antyprop', '15158332')
	end
end)

ESX.RegisterServerCallback("esx_cookiechat:playerHasPhone", function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	local inventory = xPlayer.getInventory()

	local has = false

	if xPlayer ~= nil then
		for k,v in ipairs(inventory) do
			if v.name == 'classic_phone' then
				has = true
			end
		end
	end
	cb(has)
end)

ESX.RegisterServerCallback("esx_marker:fetchUserRank", function(source, cb)
    local player = ESX.GetPlayerFromId(source)

    if player ~= nil then
        local playerGroup = player.getGroup()

        if playerGroup ~= nil then 
            cb(playerGroup)
        else
            cb("user")
        end
    else
        cb("user")
    end
end)

function CheckPhone(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    while xPlayer == nil do
        Citizen.Wait(100)
    end

	local items = xPlayer.getInventoryItem('classic_phone')

	if items == nil then
		return(0)
	else
		return(items.count)
	end
end

function SendLog(name, message, color)
	local embeds = {
		{
			["description"]=message,
			["type"]="rich",
			["color"] =5793266,
			["footer"]=  {
			["text"] = os.date() .. " | Stan Miasta",
			},
		}
	}
	if message == nil or message == '' then return FALSE end
	
	local webhook = 'https://discord.com/api/webhooks/1020794694965403669/kYHt9laDyGTwfIejMQ76V17F6g2YvShSRpts4Ub1aES25E2yntjyRer8a78YRPTnTVoh'	
	PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

function SendLogKokusCwel(name, message, color)
	local embeds = {
		{
			["description"]=message,
			["type"]="rich",
			["color"] =5793266,
			["footer"]=  {
			["text"] = os.date() .. " | Stan Miasta",
			},
		}
	}
	if message == nil or message == '' then return FALSE end
	
	local webhook = ''	
	PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

RegisterCommand('zielony', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	local characterName = xPlayer.character.firstname .. ' ' .. xPlayer.character.lastname
	local grade = xPlayer.getJob().grade_label
	if (xPlayer.job and (xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff')) then
		TriggerClientEvent("exilerpChat:sendNews", -1, xPlayer.source, "SASP", {120,255,120}, '^0San Andreas State Police informuje o wprowadzeniu na miasto poziomu zagrożenia ^2 [ZIELONEGO] ^7 dziękujemy za współpracę!')
		--TriggerClientEvent('chat:addMessage1', -1, "SASP", {120, 255, 120}, '^0San Andreas State Police informuje o wprowadzeniu na miasto poziomu zagrożenia ^2 [ZIELONEGO] ^7 dziękujemy za współpracę!', "fas fa-newspaper")
		cd = os.time() + 60
		SendLog('Stan Miasta', "Funkcjonariusz: **" ..characterName.. "**\nStopień: **" ..grade.. "**\nWprowadził na miasto poziom zagrożenia: **Zielony!**", 56108)
		SendLogKokusCwel('Stan Miasta', "Funkcjonariusz: **" ..characterName.. "**\nStopień: **" ..grade.. "**\nWprowadził na miasto poziom zagrożenia: **Zielony!**", 56108)
	end
end, false)

RegisterCommand('pomaranczowy', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	local characterName = xPlayer.character.firstname .. ' ' .. xPlayer.character.lastname
	local grade = xPlayer.getJob().grade_label
	local praca = xPlayer.getJob().name
	if (xPlayer.job and (xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff')) then
		if xPlayer.job.grade < 4 then
			xPlayer.showNotification("~r~Nie masz do tego dostępu.")
			return
		end
		TriggerClientEvent("exilerpChat:sendNews", -1, xPlayer.source, "SASP", {255,123,0}, '^0San Andreas State Police informuje o wprowadzeniu na miasto poziomu zagrożenia ^3 [POMARAŃCZOWEGO] ^7 prosimy o współpracę i zostanie w domach!')
		--TriggerClientEvent('chat:addMessage1', -1, "SASP", {255, 123, 0}, '^0San Andreas State Police informuje o wprowadzeniu na miasto poziomu zagrożenia ^3 [POMARAŃCZOWEGO] ^7 prosimy o współpracę i zostanie w domach!', "fas fa-newspaper")
		cd = os.time() + 60
		SendLog('Stan Miasta', "Funkcjonariusz: **" ..characterName.. "**\nStopień: **" ..grade.. "**\nWprowadził na miasto poziom zagrożenia: **Pomarańczowy!**", 56108)
		SendLogKokusCwel('Stan Miasta', "Funkcjonariusz: **" ..characterName.. "**\nStopień: **" ..grade.. "**\nWprowadził na miasto poziom zagrożenia: **Pomarańczowy!**", 56108)
	end
end, false)

RegisterCommand('czerwony', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	local characterName = xPlayer.character.firstname .. ' ' .. xPlayer.character.lastname
	local grade = xPlayer.getJob().grade_label
	local praca = xPlayer.getJob().name
	if (xPlayer.job and (xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff')) then
		if xPlayer.job.grade < 6 then
			xPlayer.showNotification("~r~Nie masz do tego dostępu.")
			return
		end
		TriggerClientEvent("exilerpChat:sendNews", -1, xPlayer.source, "SASP", {255,0,0}, "^0San Andreas State Police informuje o wprowadzeniu na miasto poziomu zagrożenia ^1 [CZERWONEGO] ^7 prosimy o współpracę i zostanie w domach!")
		--TriggerClientEvent('chat:addMessage1', -1, "SASP", {255, 0, 0}, "^0San Andreas State Police informuje o wprowadzeniu na miasto poziomu zagrożenia ^1 [CZERWONEGO] ^7 prosimy o współpracę i zostanie w domach!", "fas fa-newspaper")
		cd = os.time() + 60
		SendLog('Stan Miasta', "Funkcjonariusz: **" ..characterName.. "**\nStopień: **" ..grade.. "**\nWprowadził na miasto poziom zagrożenia: **Czerwony!**", 56108)
		SendLogKokusCwel('Stan Miasta', "Funkcjonariusz: **" ..characterName.. "**\nStopień: **" ..grade.. "**\nWprowadził na miasto poziom zagrożenia: **Czerwony!**", 56108)
	end
end, false)

RegisterCommand('czarny', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	local characterName = xPlayer.character.firstname .. ' ' .. xPlayer.character.lastname
	local grade = xPlayer.getJob().grade_label
	local praca = xPlayer.getJob().name
	if (xPlayer.job and (xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff')) then
		if xPlayer.job.grade < 7 then
			xPlayer.showNotification("~r~Nie masz do tego dostępu.")
			return
		end
		TriggerClientEvent("exilerpChat:sendNews", -1, xPlayer.source, "SASP", {20,20,20}, "^0San Andreas State Police informuje o wprowadzeniu na miasto poziomu zagrożenia [CZARNEGO] ^7każda podejrzana osoba zostanie zatrzymana i wylegitymowana, prosimy o współpracę i zostanie w domach!")
		--TriggerClientEvent('chat:addMessage1', -1, "SASP", {20, 20, 20}, "^0San Andreas State Police informuje o wprowadzeniu na miasto poziomu zagrożenia [CZARNEGO] ^7każda podejrzana osoba zostanie zatrzymana i wylegitymowana, prosimy o współpracę i zostanie w domach!", "fas fa-newspaper")
		cd = os.time() + 60
		SendLog('Stan Miasta', "Funkcjonariusz: **" ..characterName.. "**\nStopień: **" ..grade.. "**\nWprowadził na miasto poziom zagrożenia: **Czarny!**", 56108)
		SendLogKokusCwel('Stan Miasta', "Funkcjonariusz: **" ..characterName.. "**\nStopień: **" ..grade.. "**\nWprowadził na miasto poziom zagrożenia: **Czarny!**", 56108)
	end
end, false)

RegisterCommand('wyjatkowy', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	local characterName = xPlayer.character.firstname .. ' ' .. xPlayer.character.lastname
	local grade = xPlayer.getJob().grade_label
	local praca = xPlayer.getJob().name
	if (xPlayer.job and (xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff')) then
		if xPlayer.job.grade < 11 then
			xPlayer.showNotification("~r~Nie masz do tego dostępu.")
			return
		end
		if xPlayer.job.grade > 10 then
			TriggerClientEvent("exilerpChat:sendNews", -1, xPlayer.source, "SASP", {20,20,20}, "^0San Andreas State Police informuje o wprowadzeniu na miasto poziomu zagrożenia [WYJĄTKOWEGO] ^7każda podejrzana osoba zostanie zatrzymana, wylegitymowana, mogą paść strzały w kierunku osób które uciekają bądź stawiają opór, prosimy o współpracę i zostanie w domach!")
			--TriggerClientEvent('chat:addMessage1', -1, "SASP", {20, 20, 20}, "^0San Andreas State Police informuje o wprowadzeniu na miasto poziomu zagrożenia [WYJĄTKOWEGO] ^7każda podejrzana osoba zostanie zatrzymana, wylegitymowana, mogą paść strzały w kierunku osób które uciekają bądź stawiają opór, prosimy o współpracę i zostanie w domach!", "fas fa-newspaper")
			cd = os.time() + 60
			SendLog('Stan Miasta', "Funkcjonariusz: **" ..characterName.. "**\nStopień: **" ..grade.. "**\nWprowadził na miasto poziom zagrożenia: **Wyjątkowy!**", 56108)
			SendLogKokusCwel('Stan Miasta', "Funkcjonariusz: **" ..characterName.. "**\nStopień: **" ..grade.. "**\nWprowadził na miasto poziom zagrożenia: **Wyjątkowy!**", 56108)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, '~b~Stan wyjątkowy może wprowadzić tylko Commander+!')	
		end
	end
end, false)

RegisterCommand('klinikaotworz', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	local characterName = xPlayer.character.firstname .. ' ' .. xPlayer.character.lastname
	local grade = xPlayer.getJob().grade_label
	local praca = xPlayer.getJob().name
	if (xPlayer.job and (xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' or xPlayer.job.name == 'ambulance')) then
		if xPlayer.job.grade > 1 then
			TriggerClientEvent("exilerpChat:sendNews", -1, xPlayer.source, "SAMS", {120, 255, 120}, "^8 San Andreas Medical Service ^4 Informuje że ^2 KLINIKA SAINT FIACRE  ^4jest ponownie ^2otwarta!")
			--TriggerClientEvent('chat:addMessage1', -1, "SAMS", {20, 20, 20}, "^8 San Andreas Medical Service ^4 Informuje że ^2 KLINIKA SAINT FIACRE  ^4jest ponownie ^2otwarta!", "fas fa-newspaper")
			cd = os.time() + 60
			SendLog('Stan Miasta', "Medyk: **" ..characterName.. "**\nStopień: **" ..grade.. "**\nPoinformował o otwarciu: **Kliniki Saint Fiacre**", 56108)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, '~b~Nie możesz tego użyć!')	
		end
	end
end, false)

RegisterCommand('klinikazamknij', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	local characterName = xPlayer.character.firstname .. ' ' .. xPlayer.character.lastname
	local grade = xPlayer.getJob().grade_label
	local praca = xPlayer.getJob().name
	if (xPlayer.job and (xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' or xPlayer.job.name == 'ambulance')) then
		if xPlayer.job.grade > 1 then
			TriggerClientEvent("exilerpChat:sendNews", -1, xPlayer.source, "SAMS", {120, 255, 120}, "^8 San Andreas Medical Service ^4 Informuje że ^2 KLINIKA SAINT FIACRE ^4 jest aktualnie ^8 zamknięta, prosimy o współpracę, ze służbami!")
			--TriggerClientEvent('chat:addMessage1', -1, "SAMS", {20, 20, 20}, "^8 San Andreas Medical Service ^4 Informuje że ^2 KLINIKA SAINT FIACRE ^4 jest aktualnie ^8 zamknięta, prosimy o współpracę, ze służbami!", "fas fa-newspaper")
			cd = os.time() + 60
			SendLog('Stan Miasta', "Medyk: **" ..characterName.. "**\nStopień: **" ..grade.. "**\nPoinformował o zamknięciu: **Kliniki Saint Fiacre**", 56108)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, '~b~Nie możesz tego użyć!')	
		end
	end
end, false)

RegisterCommand('sandyotworz', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	local characterName = xPlayer.character.firstname .. ' ' .. xPlayer.character.lastname
	local grade = xPlayer.getJob().grade_label
	local praca = xPlayer.getJob().name
	if (xPlayer.job and (xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' or xPlayer.job.name == 'ambulance')) then
		if xPlayer.job.grade > 1 then
			TriggerClientEvent("exilerpChat:sendNews", -1, xPlayer.source, "SAMS", {120, 255, 120}, "^8 San Andreas Medical Service ^4 Informuje że szpital ^2 SANDY  ^8 ^4 jest ponownie ^2otwarty!")
			--TriggerClientEvent('chat:addMessage1', -1, "SAMS", {20, 20, 20}, "^8 San Andreas Medical Service ^4 Informuje że szpital ^2 SANDY  ^8 ^4 jest ponownie ^2otwarty!", "fas fa-newspaper")
			cd = os.time() + 60
			SendLog('Stan Miasta', "Medyk: **" ..characterName.. "**\nStopień: **" ..grade.. "**\nPoinformował o zamknięciu: **Szpitalu Sandy Shores**", 56108)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, '~b~Nie możesz tego użyć!')	
		end
	end
end, false)

RegisterCommand('sandyzamknij', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	local characterName = xPlayer.character.firstname .. ' ' .. xPlayer.character.lastname
	local grade = xPlayer.getJob().grade_label
	local praca = xPlayer.getJob().name
	if (xPlayer.job and (xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' or xPlayer.job.name == 'ambulance')) then
		if xPlayer.job.grade > 1 then
			TriggerClientEvent("exilerpChat:sendNews", -1, xPlayer.source, "SAMS", {120, 255, 120}, "^8 San Andreas Medical Service ^4 Informuje że szpital ^2 SANDY  ^8 ^4 jest ^8 zamknięty, prosimy o współpracę, ze służbami!")
			--TriggerClientEvent('chat:addMessage1', -1, "SAMS", {20, 20, 20}, "^8 San Andreas Medical Service ^4 Informuje że szpital ^2 SANDY  ^8 ^4 jest ^8 zamknięty, prosimy o współpracę, ze służbami!", "fas fa-newspaper")
			cd = os.time() + 60
			SendLog('Stan Miasta', "Medyk: **" ..characterName.. "**\nStopień: **" ..grade.. "**\nPoinformował o zamknięciu: **Szpitalu Sandy Shores**", 56108)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, '~b~Nie możesz tego użyć!')	
		end
	end
end, false)

RegisterCommand('malomedykow', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	local characterName = xPlayer.character.firstname .. ' ' .. xPlayer.character.lastname
	local grade = xPlayer.getJob().grade_label
	local praca = xPlayer.getJob().name
	if (xPlayer.job and xPlayer.job.name == 'ambulance') then
		if xPlayer.job.grade > 1 then
			TriggerClientEvent("exilerpChat:sendNews", -1, xPlayer.source, "SAMS", {120, 255, 120}, "^8San Andreas Medical Service ^4 Informuje o ^3 małej ^4 ilości medyków na ^8 służbie. ^4 Prosimy o przyjazd z rannymi na ^2Klinike Saint Fiacre")
			--TriggerClientEvent('chat:addMessage1', -1, "SAMS", {20, 20, 20}, "^8San Andreas Medical Service ^4 Informuje o ^3 małej ^4 ilości medyków na ^8 służbie. ^4 Prosimy o przyjazd z rannymi na ^2Klinike Saint Fiacre", "fas fa-newspaper")
			cd = os.time() + 60
			SendLog('Stan Miasta', "Medyk: **" ..characterName.. "**\nStopień: **" ..grade.. "**\nPoinformował o małej ilości medyków: **Prosimy o przyjazd z rannymi na Klinike Saint Fiacre**", 56108)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, '~b~Nie możesz tego użyć!')	
		end
	end
end, false)