fx_version "bodacious"

games {"gta5"}
lua54 'yes'
ui_page('html/index.html')

shared_script 'config.lua'

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
  'html/index.html',
  'html/style.css',
  'html/script.js'
} 


client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"