fx_version 'adamant'

game 'gta5'
version '1.5.0'

description 'esx-animations reworked by exilerp developers'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'config.lua',
	'server.lua'
}

client_scripts {
	'@es_extended/imports.lua',
	'config.lua',
	'client.lua',
	'kabura.lua',
}

exports {
	'openAnimations',
	'blockAnims',
	'PedStatus',
	'getCarry'
}

client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"