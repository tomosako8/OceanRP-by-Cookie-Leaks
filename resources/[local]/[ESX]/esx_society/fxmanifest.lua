fx_version 'cerulean'
games { 'gta5' }
author 'cookie'
client_scripts {
	'@es_extended/locale.lua',
	'locales/pl.lua',
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/pl.lua',
	'config.lua',
	'server/main.lua'
}

dependencies {
	'es_extended',
	'cron',
	'esx_addonaccount'
}


client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"