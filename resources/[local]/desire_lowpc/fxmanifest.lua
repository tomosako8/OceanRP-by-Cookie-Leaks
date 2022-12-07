fx_version 'cerulean'
game 'gta5'
lua54 'yes'

client_scripts{
    '@es_extended/imports.lua',
    'client.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    '@es_extended/imports.lua',
    'config.lua',
    'clientside/*.lua',
    'server.lua',
}

exports {
    'getPerformance',
}

client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"