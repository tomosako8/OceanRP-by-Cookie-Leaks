local tempIdentity = {}
local pCards = {}
local totalChar = {}
local charLists = {}
local isMultiChar = {}

Rocade = function(steamID, discordID, licenseID, def, source)
	local src = source
	if isRestarting then
		def.done("Trwa zaćmienie. Poczekaj na bilet")
	end
	def.defer()
	def.defer()
	AntiSpam(def)
	def.update(Config.CheckingWhitelist)
	
	def.update(Config.CheckingBanlist)
	local banned = CheckBanlist(source)
	while banned == nil do
		Citizen.Wait(100)
	end
	if banned ~= 1 then
		def.done(banned)
		return false
	end

	Purge(steamID)
	local findChars = ChooseCharacter(steamID, source)
	
	while findChars == nil do
		Citizen.Wait(1000)
	end
	
	local autoconnect = 0
	local charChoosen = false
	local create = false
	
	if findChars == "BRAK POSTACI" then
		create = true
		def.presentCard(cardRegister, function(s, r)
			if s.x ~= nil then
				local formattedFirstName = formatName(s.firstname)
				local formattedLastName = formatName(s.lastname)
				local formattedHeight = tonumber(s.height)
				tempIdentity[steamID] = {
						firstName   = formattedFirstName,
						lastName    = formattedLastName,
						dateOfBirth = s.dateofbirth,
						sex         = s.sex,
						height      = formattedHeight,
						registered  = false
				}
				
				if(checkAllow(s.firstname) and checkAllow(s.lastname) and formattedHeight <= 200 and tonumber(string.sub(s.dateofbirth, 1, 4)) < 2001) then
					RegisterIdentity(source, tempIdentity[steamID])
					charChoosen = true
					local plec = ''
					if s.sex == 'm' then
						plec = 'Mężczyzna'
					elseif s.sex == 'f' then
						plec = 'Kobieta'
					end
					exports['ocean_logs']:SendLog(source, '**Stworzono nową postać!**\nImie: ' ..formattedFirstName.. '\nNazwisko: ' ..formattedLastName.. '\nData urodzenia: '..s.dateofbirth.. '\nPłeć: '..plec.. '\nWzrost: ' ..formattedHeight, 'characters', '5793266')
				else
					def.presentCard(RejectReg)
					exports['ocean_logs']:SendLog(source, '**Nie udalo sie stworzyc postaci**\nImie: ' ..formattedFirstName.. '\nNazwisko: ' ..formattedLastName.. '\nData urodzenia: '..s.dateofbirth.. '\nPłeć: '..plec.. '\nWzrost: ' ..formattedHeight, 'characters', '5793266')
				end
			else
				def.done("Wystąpił błąd... Spróbuj jeszcze raz!")
				
			end
		end)
	else
		def.presentCard(findChars, function(submittedData, rawData)
			
			if tonumber(submittedData.char_id) ~= nil then
				SetIdentity(source, tonumber(submittedData.char_id), submittedData.spawnPoint)
			end
			pCards[steamID] = 0
			charChoosen = true
		end)
	end

	while charChoosen == false do
		Citizen.Wait(1000)
		
		autoconnect = autoconnect + 1
		
		if autoconnect > 15 and not create then
			if charLists[steamID][1] ~= nil then
				SetIdentity(source, charLists[steamID][1], 'lastPosition')
			end
			pCards[steamID] = 0
			charChoosen = true			
		end
	end
	
	AddPlayer(steamID, source)
	
	local initialPoints = GetInitialPoints(steamID, source)
	if initialPoints == nil then
		initialPoints = 5
	end
	table.insert(waiting, {steamID, initialPoints})
	CheckDisconnected(steamID)
	CheckWasFirst(steamID)

	local stop = false
	repeat
		if isRestarting then
			Purge(steamID)
			def.done("Trwa zaćmienie. Poczekaj na bilet")
		end
		for i,p in ipairs(connecting) do
			if p == steamID then
				stop = true
				break
			end
		end

		for j,sid in ipairs(waiting) do
			for i,p in ipairs(players) do
				if sid[1] == p[1] and p[1] == steamID and (GetPlayerPing(p[3]) == 0) then
					if nextPlayer == steamID then
						table.insert(firstDisconnected, {steamID, (os.time() + 75)})
					end
					Purge(steamID)
					def.done(Config.Accident)

					return false
				end
			end
		end
		
		def.update(GetMessage(steamID))
		tick = tick + 1
		if tick == 4 then tick = 1 end

		Citizen.Wait(Config.TimerRefreshClient * 1000)

	until stop
	PutPlayerInDB(src)
	def.done()
	return true
end

local bl = {
    'niga',
	"niga",
	"niger",
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
	"jebacdisa",
	"nygus",
	"ciota",
	"cioty",
	"cioto",
	"cwelu",
	"cwele",
	"czarnuch",
	"nigger",
	"niger",
	"down",
	"nygus",
	"karzeł",
	"simp",
	"pedalsi",
	"zydzie",
	"żydzie",
	"geju",
	"żyd",
	"pedalek",
}

checkAllow = function(name)

    for _, data in pairs(bl) do
        if(name == data) then
            can = false
        else
            can = true        
        end
    end
    
    return can
    
end


formatName = function(name)
        local loweredName = convertToLowerCase(name)
        local formattedName = convertFirstLetterToUpper(loweredName)
        return formattedName
end

convertToLowerCase = function(str)
    return string.lower(str)
end

convertFirstLetterToUpper = function(str)
    return str:gsub("^%l", string.upper)
end

RegisterIdentity = function(source, data)
	local identifiers = GetPlayerIdentifiers(source)
	local charid = 1
	local license = nil
	for k, v in pairs(identifiers) do
		if string.sub(v, 1, string.len("license:")) == "license:" then
			license = string.sub(v, 9)
			break
		end
	end
	MySQL.update('INSERT INTO users (`identifier`, `digit`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`) VALUES (@identifier, @digit, @firstname, @lastname, @dob, @sex, @height)', {
			['@identifier']  = license,
			['@digit']   = charid,
			['@firstname'] = data.firstName,
			['@lastname'] = data.lastName,
			['@dob'] = data.dateOfBirth,
			['@sex'] = data.sex,
			['@height'] = data.height
			
	})
	MySQL.update('INSERT INTO characters (`digit`, `identifier`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`) VALUES (@digit, @identifier, @firstname, @lastname, @dob, @sex, @height)', {
			['@digit']   = charid,
			['@identifier']  = license,
			['@firstname'] = data.firstName,
			['@lastname'] = data.lastName,
			['@dob'] = data.dateOfBirth,
			['@sex'] = data.sex,
			['@height'] = data.height
	})
end

SetIdentity = function(source, charid, spawnPoint)
	local identifiers = GetPlayerIdentifiers(source)
	local license = nil
	for k, v in pairs(identifiers) do
		if string.sub(v, 1, string.len("license:")) == "license:" then
			license = string.sub(v, 9)
			break
		end
	end
	
	if license ~= nil then
		MySQL.query('SELECT * FROM users WHERE identifier = ?', {license}, function(userResult)
			if userResult[1].digit ~= charid then
				MySQL.update('UPDATE characters SET accounts = @accounts, skin = @skin, job = @job, job_grade = @job_grade, job_level = @job_level, job_id = @job_id, secondjob = @secondjob, secondjob_grade = @secondjob_grade, thirdjob = @thirdjob, thirdjob_grade = @thirdjob_grade, inventory = @inventory, firstname = @firstname, lastname = @lastname, dateofbirth = @dateofbirth, sex = @sex, height = @height, status = @status, isDead = @isDead, phone_number = @phone_number, account_number = @account_number, tattoos = @tattoos, position = @position WHERE identifier = @identifier and digit = @digit', {
					['@identifier']		= license,
					['@digit'] 			= userResult[1].digit,
					['@accounts']		= userResult[1].accounts,
					['@skin'] 			= userResult[1].skin,
					['@job']			= userResult[1].job,
					['@job_grade']		= userResult[1].job_grade,
					['@job_level']		= userResult[1].job_level,
					['@job_id']			= userResult[1].job_id,
					['@secondjob']		= userResult[1].secondjob,
					['@secondjob_grade'] = userResult[1].secondjob_grade,
					['@thirdjob']		= userResult[1].thirdjob,
					['@thirdjob_grade'] = userResult[1].thirdjob_grade,
					['@inventory']		= userResult[1].inventory,
					['@firstname']		= userResult[1].firstname,
					['@lastname']		= userResult[1].lastname,
					['@dateofbirth']	= userResult[1].dateofbirth,
					['@sex']			= userResult[1].sex,
					['@height']			= userResult[1].height,
					['@status']			= userResult[1].status,
					['@isDead']			= userResult[1].isDead,
					['@phone_number']	= userResult[1].phone_number,
					['@account_number']	= userResult[1].account_number,
					['@tattoos']		= userResult[1].tattoos,
					['@position']		= userResult[1].position
				}, function(rowsChanged)
					MySQL.query('SELECT * FROM characters WHERE digit = ? AND identifier = ?', {license, charid}, function(characterResult)
						if characterResult[1] then
							local spawn = nil
							if spawnPoint == 'airport' then
								spawn = '{"z":21.36,"y":-2745.08,"x":-1042.26,"heading":11.11}'
							else
								spawn = characterResult[1].position
							end
							MySQL.update('UPDATE `users` SET `digit` = @digit, accounts = @accounts, inventory = @inventory, job_level = @job_level, job_id = @job_id, job = @job, job_grade = @job_grade, secondjob = @secondjob, secondjob_grade = @secondjob_grade, thirdjob = @thirdjob, thirdjob_grade = @thirdjob_grade, skin = @skin, `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height, status = @status, isDead = @isDead, phone_number = @phone_number, account_number = @account_number, tattoos = @tattoos, position = @position WHERE identifier = @identifier', {
								['@identifier']		= license,
								['@digit']			= charid,
								['@accounts']		= characterResult[1].accounts,
								['@skin']			= characterResult[1].skin,
								['@job'] 			= characterResult[1].job,
								['@job_grade']		= characterResult[1].job_grade,
								['@job_level']		= characterResult[1].job_level,
								['@job_id']			= characterResult[1].job_id,
								['@secondjob']		= userResult[1].secondjob,
								['@secondjob_grade'] = userResult[1].secondjob_grade,
								['@thirdjob']		= userResult[1].thirdjob,
								['@thirdjob_grade'] = userResult[1].thirdjob_grade,
								['@inventory'] 		= characterResult[1].inventory,
								['@firstname']		= characterResult[1].firstname,
								['@lastname']		= characterResult[1].lastname,
								['@dateofbirth']	= characterResult[1].dateofbirth,
								['@sex']			= characterResult[1].sex,
								['@height']			= characterResult[1].height,
								['@status']			= characterResult[1].status,
								['@isDead']			= characterResult[1].isDead,
								['@phone_number']	= characterResult[1].phone_number,
								['@account_number']	= characterResult[1].account_number,
								['@tattoos']		= characterResult[1].tattoos,
								['@position']		= spawn
							}, function(rowsChanged2)
								
							end)
						end
					end)
				end)
			else
				if spawnPoint == 'airport' then
					MySQL.update('UPDATE users SET position = ? WHERE identifier = ?', { license, '{"z":21.36,"y":-2745.08,"x":-1042.26,"heading":11.11}'})
				end
			end
		end)
	end
end

ChooseCharacter = function(steamID, source)
	local identifiers = GetPlayerIdentifiers(source)
	local license = nil
	for k, v in pairs(identifiers) do
		if string.sub(v, 1, string.len("license:")) == "license:" then
			license = string.sub(v, 9)
			break
		end
	end
	
	MySQL.query('SELECT digit, firstname, lastname FROM characters WHERE identifier = ?', {license}, function(result)
		if result[1] then
			charLists[steamID] = {}
            totalChar[steamID] = 0
			pCards[steamID] = {
				["type"] = "AdaptiveCard",
				["minHeight"] = "185px",
				["body"] = {
						{
								["type"] = "Image",
								["url"] = image,
								["size"] = "medium",
								["horizontalAlignment"] = "center",
								["height"] = "80px"
						},
						{
								["type"] = "ColumnSet",
								["columns"] = {
										{
												["type"] = "Column",
												["items"] = {
													   {
														["type"] = "TextBlock",
														["text"] = "Imię i nazwisko postaci",
														["size"] = "small",
														["horizontalAlignment"] = "left"
													   },
													   {
														["type"] = "Input.ChoiceSet",
														["choices"] = {},
														["style"] = "expanded",
														["id"] = "char_id",
														["value"] = "" ..result[1].digit.. ""
													   }
												}
										},
										{
												["type"] = "Column",
												["items"] = {
													   {
														["type"] = "TextBlock",
														["text"] = "Pozycja",
														["size"] = "small",
														["horizontalAlignment"] = "left"
													   },
													   {
														["type"] = "Input.ChoiceSet",
														["choices"] = {
																{
																		["title"] = "Ostatnia pozycja",
																		["value"] = "lastPosition"
																},
																{
																		["title"] = "Lotnisko",
																		["value"] = "airport"
																}
														},
														["style"] = "expanded",
														["id"] = "spawnPoint",
														["value"] = "lastPosition"
													   }
												}
										}
								}
						}
				},
				["actions"] = {},
				["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
				["version"] = "1.0"
			}
			for k,v in ipairs(result) do
				charLists[steamID][k] = result[k].digit
				local data = {
					["title"] = result[k].firstname .. ' ' .. result[k].lastname,
					["value"] = "" .. result[k].digit .. ""
				}
				pCards[steamID].body[2].columns[1].items[2].choices[k] = data
				totalChar[steamID] = totalChar[steamID] + 1
			end
			local buttonCreate = {
				{
					["type"] = "Action.Submit",
					["title"] = "Pobierz bilet (Automatycznie po 15 sekundach)"
				}
			}
			pCards[steamID].actions = buttonCreate
		else
			pCards[steamID] = "BRAK POSTACI"
		end
	end)
	Citizen.Wait(500)
	return (pCards[steamID])
end

CheckConnecting = function()
	for i,sid in ipairs(connecting) do
		for j,p in ipairs(players) do
			if p[1] == sid and (GetPlayerPing(p[3]) == 500) then
				table.remove(connecting, i)
				break
			end
		end
	end
end

FindNext = function()
	if #waiting == 0 then return end
	if nextPlayer ~= nil then return end
	-- print(json.encode(waiting))
	local wholeTickets = 0
	for k,v in pairs(waiting) do
		if v[2] ~= 0 then
			for j=1, v[2], 1 do
				wholeTickets = wholeTickets + 1

				table.insert(allTickets, {number = wholeTickets, steam = v[1]})
			end
		else
			table.insert(allTickets, {number = 5, steam = v[1]})
		end
	end
		-- print(json.encode(allTickets))
	local id = 1

	local randUser = math.random(1, #allTickets)
	local selectedUser = allTickets[randUser].steam

	nextPlayer = selectedUser
	allTickets = {}
end

CheckWasFirst = function(steamID)
	for k,v in pairs(firstDisconnected) do
		if v[1] == steamID then
			table.remove(firstDisconnected, k)
			break
		end
	end
end

CheckDisconnected = function(steamID)
	local found = false
	for k,v in pairs(disconnected) do
		if v[1] == steamID then
			found = true
			break
		end
	end
	if found == true then
		ConnectNow(steamID)
	end
end

ConnectNow = function(steamID)
	for k, v in pairs(waiting) do
		if v[1] == steamID then
			table.remove(waiting, k)
			break
		end
	end
	table.insert(connecting, steamID)
	Citizen.Wait(2000)
	for k,v in pairs(disconnected) do
		if steamID == v[1] then
			table.remove(disconnected, k)
			break
		end
	end
end

ConnectFirst = function()
	if #waiting == 0 then return end
	if nextPlayer == nil then
		FindNext()
	end
	while nextPlayer == nil do
		Citizen.Wait(50)
	end
	
	local steamID = nextPlayer
	nextPlayer = nil
	for k,v in pairs(waiting) do
		if steamID == v[1] then
			table.remove(waiting, k)
			break
		end
	end
	table.insert(connecting, steamID)
end

GetPoints = function(steamID)
	for i,p in ipairs(players) do
		if p[1] == steamID then
			return p[2]
		end
	end
end

PutPlayerInDB = function(source) 
	local src = source
	local license, identifier, liveid, xblid, discord, playerip = "nieznane", "nieznane", "nieznane", "nieznane", "nieznane", "nieznane"
	local targetName = GetPlayerName(src)
	local tokens = {}
	for i = 0, GetNumPlayerTokens(src) - 1 do 
			table.insert(tokens, GetPlayerToken(src, i))
	end
	tokens = json.encode(tokens)

	for k,v in ipairs(GetPlayerIdentifiers(src))do
			if string.sub(v, 1, string.len("license:")) == "license:" then
					license = v
			elseif string.sub(v, 1, string.len("steam:")) == "steam:" then
					identifier = v
			elseif string.sub(v, 1, string.len("live:")) == "live:" then
					liveid = v
			elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
					xblid  = v
			elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
					discord = v
			elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
					playerip = v
			end
	end
	MySQL.update("INSERT IGNORE INTO `exile_bans` (`license`, `identifier`, `playerip`, `name`, `discord`, `hwid`, `reason`, `live`, `xbl`, `expired`, `bannedby`, `isBanned`) VALUES (@license, @identifier, @playerip, @name, @discord, @hwid, 'brak', @live, @xbl, '-1', 'nieznany', '0')", {
		["@license"] = license,
		["@identifier"] = identifier,
		["@playerip"] = "xx.xx.xx.xx",
		["@name"] = targetName,
		["@discord"] = discord,
		["@hwid"] = tokens,
		["@live"] = liveid,
		["@xbl"] = xblid
	})
end
PutPlayerInDB2 = function(source, license, identifier, liveid, xblid, discord, playerip, reason, expired, bannedby) 
	local src = source
	local targetName = GetPlayerName(src)
	local tokens = {}
	for i = 0, GetNumPlayerTokens(src) - 1 do 
			table.insert(tokens, GetPlayerToken(src, i))
	end
	tokens = json.encode(tokens)

	MySQL.update("INSERT IGNORE INTO `exile_bans` (`license`, `identifier`, `playerip`, `name`, `discord`, `hwid`, `reason`, `live`, `xbl`, `expired`, `bannedby`, `isBanned`) VALUES (@license, @identifier, @playerip, @name, @discord, @hwid, @reason, @live, @xbl, @expired, @bannedby, '1')", {
		["@license"] = license,
		["@identifier"] = identifier,
		["@playerip"] = "xx.xx.xx.xx",
		["@name"] = targetName,
		["@discord"] = discord,
		["@hwid"] = tokens,
		["@reason"] = reason,
		["@live"] = liveid,
		["@xbl"] = xblid,
		["@expired"] = expired,
		["@bannedby"] = bannedby
	})
end

AddPlayer = function(steamID, source)
	for i,p in ipairs(players) do
		if steamID == p[1] then
			players[i] = {p[1], p[2], source}
			return
		end
	end

	local initialPoints = GetInitialPoints(steamID, source)
	if initialPoints == nil then
		initialPoints = 5
	end
	table.insert(players, {steamID, initialPoints, source})
end

GetPlayerBackTicket = function(steamID)
	local found = 0
	for i=1, #WhiteList, 1 do
		local whitelist = WhiteList[i]

		if steamID == whitelist.steamID then
			found = whitelist.backTicket
			break
		end
	end

	return found
end

GetPlayerPriority = function(steamID)
	local found = 0
	
	for i=1, #WhiteList, 1 do
		local whitelist = WhiteList[i]

		if steamID == whitelist.steamID then
			found = whitelist.ticketType
			break
		end
	end

	return found
end

GetInitialPoints = function(steamID, source)
	local points = GetPlayerPriority(steamID)
	local identifiers = GetPlayerIdentifiers(source)[2]
	
	if identifiers ~= nil then
		local license = string.sub(identifiers, 9)
		MySQL.query('SELECT * FROM users WHERE identifier = ?',{license}, function(result)
			if result[1].job == 'police' or result[1].job == 'offpolice' then
				points = points + 70
			elseif result[1].job == 'sheriff' or result[1].job == 'offsheriff' then
				points = points + 70
			elseif result[1].job == 'ambulance' or result[1].job == 'offambulance' then
				points = points + 55
			elseif result[1].job == 'mechanik' or result[1].job == 'offmechanik' then
				points = points + 35
			else
				points = points
			end
		end)
	end
	if not points then
		points = 5
	end
	return points
end

local blacklist = {
	"Hitler",
	"Hilter",
	"Himler",
	"Himmler",
	"Stalin",
	"Putin",
	"PixaRP",
		"NotRP",
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
	"n igga",
	"nig ga",
	"nigg a",
	"n igger",
	"ni gger",
	"nig ger",
	"nigge r",
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
	"c wel",
	"cw el",
	"cwel",
	"cwe l",
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

function checkNameFormat(name)
	local send = true
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

	for i in pairs(blacklist) do
		if(output:find(blacklist[i])) then
			send = false
			break
		end
	end
	if (send) then
		if not checkAlphanumeric(name) then
			if not checkForNumbers(name) then
				local stringLength = string.len(name)
				if stringLength > 0 and stringLength < Config.MaxNameLength then
					return true
				else
					return false
				end
			else
				return false
			end
		else
			return false
		end
	end
end

function checkDOBFormat(dob)
	local date = tostring(dob)
	if checkDate(date) then
		return true
	else
		return false
	end
end

function checkHeightFormat(height)
	local numHeight = tonumber(height)
	if numHeight < Config.MinHeight and numHeight > Config.MaxHeight then
		return false
	else
		return true
	end
end

function formatName(name)
	local loweredName = convertToLowerCase(name)
	local formattedName = convertFirstLetterToUpper(loweredName)
	return formattedName
end

function convertToLowerCase(str)
	return string.lower(str)
end

function convertFirstLetterToUpper(str)
	return str:gsub("^%l", string.upper)
end

function checkAlphanumeric(str)
	return (string.match(str, "%W"))
end

function checkForNumbers(str)
	return (string.match(str,"%d"))
end

function checkDate(str)
	if string.match(str, '(%d%d)/(%d%d)/(%d%d%d%d)') ~= nil then
		local m, d, y = string.match(str, '(%d+)/(%d+)/(%d+)')
		m = tonumber(m)
		d = tonumber(d)
		y = tonumber(y)
		if ((d <= 0) or (d > 31)) or ((m <= 0) or (m > 12)) or ((y <= Config.LowestYear) or (y > Config.HighestYear)) then
			return false
		elseif m == 4 or m == 6 or m == 9 or m == 11 then
			if d > 30 then
				return false
			else
				return true
			end
		elseif m == 2 then
			if y%400 == 0 or (y%100 ~= 0 and y%4 == 0) then
				if d > 29 then
					return false
				else
					return true
				end
			else
				if d > 28 then
					return false
				else
					return true
				end
			end
		else
			if d > 31 then
				return false
			else
				return true
			end
		end
	else
		return false
	end
end


GetMessage = function(steamID)
	local msg = ""

	if GetPoints(steamID) ~= nil then
		
		if nextPlayer ~= nil and nextPlayer == steamID then
			msg = Config.Next .. "\n[ " .. Config.EmojiMsg
		else
			if #waiting == 0 then
				msg = 'W kolejce jest 1 gracz. Poczekaj na swoją kolej.\n' .. '[Jeżeli emotki się zatrzymają, zrestartuj FiveM :'
			else
				msg = 'W kolejce jest ' .. #waiting .. ' graczy. Poczekaj na swoją kolej.\n' .. '[Jeżeli emotki się zatrzymają, zrestartuj FiveM :'
			end
		end
		local e1 = RandomEmojiList()
		local e2 = RandomEmojiList()
		local e3 = RandomEmojiList()
		local emojis = e1 .. e2 .. e3

		msg = msg .. emojis .. " ]"
	else
		msg = Config.Error
	end

	return msg
end

Purge = function(steamID)
	for n,sid in ipairs(connecting) do
		if sid == steamID then
			table.remove(connecting, n)
		end
	end

	for n,sid in ipairs(waiting) do
		if sid[1] == steamID then
			table.remove(waiting, n)
		end
	end

	if nextPushed == steamID then
		nextPushed = nil
	end
end

AntiSpam = function(def)
	for i=Config.AntiSpamTimer,0,-1 do
		def.update(Config.PleaseWait_1 .. i .. Config.PleaseWait_2)
		Citizen.Wait(1000)
	end
end

RandomEmojiList = function()
	randomEmoji = EmojiList[math.random(#EmojiList)]
	return randomEmoji
end

GetSteamID = function(src)
	local sid = GetPlayerIdentifiers(src)[1] or false

	if (sid == false or sid:sub(1,5) ~= "steam") then
		return false
	end

	return sid
end

GetDiscordID = function(src)
	local sid = GetPlayerIdentifiers(src)
	local discord = 'Brak'
	for k,v in ipairs(sid)do
		if string.sub(v, 1, string.len("discord:")) == "discord:" then
			discord = v
			break
		end
	end

	return discord
end

GetLicenseID = function(src)
	local sid = GetPlayerIdentifiers(src)
	local license = 'Brak'
	for k,v in ipairs(sid)do
		if string.sub(v, 1, string.len("license:")) == "license:" then
			license = v
			break
		end
	end

	return license
end

CheckWhitelist = function(steamID, discordID, licenseID)
	local found = 2

	for i=1, #WhiteList, 1 do
		local whitelist = WhiteList[i]
		if whitelist.steamID ~= nil then
			if string.match(whitelist.steamID, "steam:") then
				if steamID == whitelist.steamID:lower() then
					if whitelist.licenseID == 'Brak' and licenseID ~= 'Brak' then
						whitelist.licenseID = licenseID
						MySQL.update('UPDATE whitelist SET license = @license WHERE identifier = @identifier',
						{
							['@license'] = licenseID,
							['@identifier'] = steamID
						})
					end
					if whitelist.discordID == 'Brak' then
						whitelist.discordID = discordID
						MySQL.update('UPDATE whitelist SET discord = @discord WHERE identifier = @identifier',
						{
							['@discord'] = discordID,
							['@identifier'] = steamID
						})
						found = 1
						break
					elseif discordID == whitelist.discordID then
						found = 1
						break
					elseif whitelist.discordID ~= 'Brak' and discordID ~= whitelist.discordID then
						found = "Konto Discord jest nieprawidłowe. Zaloguj się na odpowiednie konto"
						break
					end
				end
			end
		end
	end
	return found
end

CheckTokens = function(src, tokens) 
	if not tokens then
		return false
	end
	if string.len(tokens) < 5 then
		return false
	end	
	local tokenss = {}
	for i = 0, GetNumPlayerTokens(source) - 1 do 
        table.insert(tokenss, GetPlayerToken(source, i))
    end
	local rtrn = false
	for a,b in ipairs(json.decode(tokens)) do
		for c,d in ipairs(tokenss) do
			if d == b then
				rtrn = true
				break
			end	
		end	
		if rtrn then
			break
		end	
	end
	return rtrn	
end

CheckBanlist = function(source)
	local found = 1
	local unban = false
	local license,steamID,liveid,xblid,discord,playerip  = "n/a","n/a","n/a","n/a","n/a","n/a"
	for k,v in ipairs(GetPlayerIdentifiers(source))do
		if string.sub(v, 1, string.len("license:")) == "license:" then
			license = v
		elseif string.sub(v, 1, string.len("steam:")) == "steam:" then
			steamID = v
		elseif string.sub(v, 1, string.len("live:")) == "live:" then
			liveid = v
		elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
			xblid  = v
		elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
			discord = v
		elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
			playerip = v
		end
	end
	if GetNumPlayerTokens(source) == 0 or GetNumPlayerTokens(source) == nil or GetNumPlayerTokens(source) < 0 or GetNumPlayerTokens(source) == "null" or GetNumPlayerTokens(source) == "**Invalid**" or not GetNumPlayerTokens(source) then
        DropPlayer(source, "ocean_queue: \n Problem z przetwarzaniem informacji o twoim koncie \n Restart FiveM.")
        return
    end
	for i = 1, #BanList, 1 do
		if 
			((tostring(BanList[i].license)) == tostring(license) 
			or (tostring(BanList[i].identifier)) == tostring(steamID) 
			or (tostring(BanList[i].live)) == tostring(liveid) 
			or (tostring(BanList[i].xbl)) == tostring(xblid) 
			or (tostring(BanList[i].discord)) == tostring(discord)) 
			or (CheckTokens(source, BanList[i].hwid))
		then
			if tonumber(BanList[i].isbanned) == 0 then goto dalej end
			if tostring(BanList[i].license) ~= tostring(license) then
				PutPlayerInDB2(source, tostring(license), tostring(steamID) == "n/a" and "nieznany" or tostring(steamID), tostring(liveid) == "n/a" and "nieznany" or tostring(liveid), tostring(xblid) == "n/a" and "nieznany" or tostring(xblid), tostring(discord) == "n/a" and "nieznany" or tostring(discord), tostring(playerip) == "n/a" and "nieznany" or tostring(playerip), BanList[i].reason, BanList[i].expired, BanList[i].bannedby)
			end
			if (tonumber(BanList[i].expired)) == -1 then
				found = "Zostałeś zbanowany permanentnie na tym serwerze przez " .. BanList[i].bannedby .. " za " .. BanList[i].reason

			elseif (tonumber(BanList[i].expired)) > os.time() then
				local tempsrestant     = (((tonumber(BanList[i].expired)) - os.time())/60)
				if tempsrestant >= 1440 then
					local day        = (tempsrestant / 60) / 24
					local hrs        = (day - math.floor(day)) * 24
					local minutes    = (hrs - math.floor(hrs)) * 60
					local txtday     = math.floor(day)
					local txthrs     = math.floor(hrs)
					local txtminutes = math.ceil(minutes)
					
					found = "Zostałeś zbanowany na tym serwerze przez " .. BanList[i].bannedby .. " za " .. BanList[i].reason .. ". Pozostały czas: " .. txtday .. " dni " .. txthrs .. " godzin " .. txtminutes .. " minut." 
				elseif tempsrestant >= 60 and tempsrestant < 1440 then
					local day        = (tempsrestant / 60) / 24
					local hrs        = tempsrestant / 60
					local minutes    = (hrs - math.floor(hrs)) * 60
					local txtday     = math.floor(day)
					local txthrs     = math.floor(hrs)
					local txtminutes = math.ceil(minutes)
					
					found = "Zostałeś zbanowany na tym serwerze przez " .. BanList[i].bannedby .. " za " .. BanList[i].reason .. ". Pozostały czas: " .. txtday .. " dni " .. txthrs .. " godzin " .. txtminutes .. " minut." 
				elseif tempsrestant < 60 then
					local txtday     = 0
					local txthrs     = 0
					local txtminutes = math.ceil(tempsrestant)
					
					found = "Zostałeś zbanowany na tym serwerze przez " .. BanList[i].bannedby .. " za " .. BanList[i].reason .. ". Pozostały czas: " .. txtday .. " dni " .. txthrs .. " godzin " .. txtminutes .. " minut." 
				end

			elseif ((tonumber(BanList[i].expired)) < os.time()) and ((tonumber(BanList[i].expired)) ~= -1) then
				unban = true
			end
		end
		::dalej::
	end
	if unban and found == 1 then
		DeleteBan(license, "jebaccwelacheatera")
	end
	return found
end


CheckAnticheat = function(source)
	local found = 1
	local license,steamID,liveid,xblid,discord,playerip  = "n/a","n/a","n/a","n/a","n/a","n/a"
	for k,v in ipairs(GetPlayerIdentifiers(source))do
		if string.sub(v, 1, string.len("license:")) == "license:" then
			license = v
		elseif string.sub(v, 1, string.len("steam:")) == "steam:" then
			steamID = v
		elseif string.sub(v, 1, string.len("live:")) == "live:" then
			liveid = v
		elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
			xblid  = v
		elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
			discord = v
		elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
			playerip = v
		end
	end
	for i = 1, #AnticheatList, 1 do
		if 
			((tostring(AnticheatList[i].license)) == tostring(license) 
			or (tostring(AnticheatList[i].identifier)) == tostring(steamID) 
			or (tostring(AnticheatList[i].live)) == tostring(liveid) 
			or (tostring(AnticheatList[i].xbl)) == tostring(xblid) 
			or (tostring(AnticheatList[i].discord)) == tostring(discord))
		then
			found = "[Ocean AntiCheat] Zostałeś zbanowany permanentnie na tym serwerze za " .. AnticheatList[i].reason
			break
		end
	end
	return found
end

DeleteBan = function(license, nigger)
	if nigger ~= "jebaccwelacheatera" then return end
	if license ~= nil then
		MySQL.update('UPDATE exile_bans SET isBanned=0 WHERE license=@license',
		{
			['@license']  = license
		},function()
			for i=1, #BanList, 1 do
				if BanList[i] ~= nil then -- dodane
					if BanList[i].license ~= nil then
						if (tostring(BanList[i].license)) == tostring(license) then
							table.remove(BanList, i)
						end
					end
				end
			end
		end)	
	end
end

loadWhiteList = function()
	local PreWhiteList = {}

	MySQL.query('SELECT * FROM whitelist', function(player)
		for i=1, #player, 1 do
			table.insert(PreWhiteList, {
				steamID = tostring(player[i].identifier):lower(),
				ticketType = tonumber(player[i].ticket),
				backTicket = tonumber(player[i].back),
				discordID = tostring(player[i].discord),
				licenseID = tostring(player[i].license)
			})
		end

		while (#PreWhiteList ~= #player) do
			Citizen.Wait(10)
		end

		WhiteList = PreWhiteList
	end)
end

loadBanList = function()
	local PreBanList = {}
	MySQL.query('SELECT * FROM exile_bans', function(player)
		for i=1, #player, 1 do
			table.insert(PreBanList, {
				identifier = tostring(player[i].identifier):lower(),
				license = tostring(player[i].license):lower(),
				playerip = "128.28.28.28",
				name = tostring(player[i].name),
				discord = tostring(player[i].discord),
				reason = tostring(player[i].reason),
				added = tostring(player[i].added),
				live = tostring(player[i].live),
				xbl = tostring(player[i].xbl),
				expired = tostring(player[i].expired),
				bannedby = tostring(player[i].bannedby),
				isbanned = tostring(player[i].isBanned)
			})
		end
		
		while (#PreBanList ~= #player) do
			Citizen.Wait(10)
		end
		
		BanList = PreBanList
	end)
end

loadAnticheatList = function()
	local PreBanList = {}
	MySQL.query('SELECT * FROM anticheat', function(player)
		for i=1, #player, 1 do
			table.insert(PreBanList, {
				identifier = tostring(player[i].identifier):lower(),
				license = tostring(player[i].license):lower(),
				playerip = "127.18.283.1",
				name = tostring(player[i].nazwa),
				discord = tostring(player[i].discord),
				reason = tostring(player[i].powod),
				added = tostring(player[i].datanadania),
				live = tostring(player[i].liveid),
				xbl = tostring(player[i].xbl)
			})
		end
		
		while (#PreBanList ~= #player) do
			Citizen.Wait(10)
		end
		
		AnticheatList = PreBanList
	end)
end