fx_version "bodacious"

games {"gta5"}
lua54 'yes'
--
client_scripts {
	'@es_extended/locale.lua',
	'locates/en.lua',
	'locates/pl.lua',
    'client/client.lua',
    'config.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'@oxmysql/lib/MySQL.lua',
	'locates/en.lua',
	'locates/pl.lua',
	'server/server.lua',
	'config.lua'
}

dependencies {
	'cron'
}

client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"