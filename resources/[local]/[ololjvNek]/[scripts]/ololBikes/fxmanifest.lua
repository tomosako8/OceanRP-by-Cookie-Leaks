fx_version "bodacious"

games {"gta5"}
lua54 'yes'

shared_script 'config.lua'

server_scripts {
	'@es_extended/locale.lua',
	'@oxmysql/lib/MySQL.lua',
	'server.lua'
}

client_scripts {
	'@es_extended/imports.lua',
	'@es_extended/locale.lua',
	'client.lua'
}

client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"