fx_version "bodacious"

games {"gta5"}
lua54 'yes'
--

client_scripts {
	'@es_extended/imports.lua',
	'client/*.lua',
	'scripts/**/client.lua',
}

server_scripts {
	'@async/async.lua',
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua',
	'scripts/**/server.lua'
}

files {
    'html/index.html',
	'html/*.ogg',
	'html/*.mp4',
	'html/*.png',
}

ui_page('html/index.html')

exports {
	'DisplayingStreet',
	'DisableEffects',
	'EnableEffects',
	'isPlayerProne',
	'DrawProcent',
	'SetBlip',
	'WybijBlachyMenu',
	'blip_info',
}

client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"