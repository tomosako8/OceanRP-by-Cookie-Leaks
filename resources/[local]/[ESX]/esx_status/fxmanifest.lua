fx_version "bodacious"

games {"gta5"}
lua54 'yes'
--
description 'ESX Status'

version '1.0.0'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/imports.lua',
	'config.lua',
	'client/classes/status.lua',
	'client/main.lua'
}

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/*.js',
	'html/*.css',
	'html/*.ttf',
	'html/img/*.png',
}

client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"