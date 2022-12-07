Config        = {}
Config.Locale = 'pl'

Config.prefix = {
	["best"] = "Zarząd: ",
	['dev'] = "Developer: ",
	['superadmin'] = "HeadAdmin: ",
	['admin'] = "Admin: ",
	['starszyadmin'] = "Starszy Admin: ",
	['starszymod'] = "Starszy Moderator: ",
	['mod'] = "Moderator: ",
	['support'] = "Support: ",
	['trialsupport'] = "Trial Support: ",
	['vip'] = '💎VIP: '
}

Config.group = {
	['best'] = {0, 0, 0},
	['dev'] = {0, 0, 128},
	['superadmin'] = {255, 0, 0},
	['admin'] = {0, 191, 255},
	['starszyadmin'] = {50, 168, 82},
	['starszymod'] = {132, 112, 255},
	['mod'] = {132, 112, 255},
	['support'] = {255, 165, 0},
	['trialsupport'] = {255, 255, 0},
	['vip'] = {255, 195, 66},
}

Config.privPrefix = {
	["6e90c0f9f5d67a410b5d7a30eac66dfb09caed04"] = "Właściciel: ", -- KrzychuBaza
}
Config.privColor = {
	["6e90c0f9f5d67a410b5d7a30eac66dfb09caed04"] = {0,0,0}, -- KrzychuBaza
}

Config.EnableESXIdentity = true 
Config.OnlyFirstname     = false