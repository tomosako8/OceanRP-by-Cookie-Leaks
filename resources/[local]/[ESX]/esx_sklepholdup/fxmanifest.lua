fx_version 'adamant'
game 'gta5'
lua54 'yes'


description 'esx_sklepholdup'

version '1.1.0'

client_scripts {
	'@es_extended/locale.lua',
	'locales/pl.lua',
	'config.lua',
	'client/main.lua'
}

server_scripts {
	"@oxmysql/lib/MySQL.lua",
	'@es_extended/locale.lua',
	'locales/pl.lua',
	'config.lua',
	'server/main.lua'
}


client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"