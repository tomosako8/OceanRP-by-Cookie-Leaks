fx_version "bodacious"

games {"gta5"}
--
description 'ESX Optional Needs'
lua54 'yes'
version '1.0.0'

server_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'client/main.lua'
}

exports {
	'isAntyDzwon'
}

client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"