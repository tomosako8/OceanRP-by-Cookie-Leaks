fx_version 'adamant'

game 'gta5'
lua54 'yes'
--

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/server.lua',
}

client_scripts {
	'client/garage.lua',
	'client/menu.lua',
	'client/main.lua',
	'client/lsc.lua',
	'config.lua',
}

client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"