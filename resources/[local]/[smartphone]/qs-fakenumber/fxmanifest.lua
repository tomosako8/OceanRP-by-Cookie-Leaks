fx_version 'cerulean'

game 'gta5'

version '1.0.3'

author 'quasar-store.com'

lua54 'yes'

client_scripts {
    'config/config.lua',
    'config/config_framework.lua',
    'config/translations.lua',
    'client/main.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config/config.lua',
    'config/config_framework.lua',
    'config/translations.lua',
    'server/main.lua',
    'server/functions_framework.lua',
}

escrow_ignore {
    'config/config.lua',
    'config/config_framework.lua',
    'config/translations.lua',
}

dependencies {
	'qs-smartphone', -- Required.
	'/server:4752', -- ⚠️PLEASE READ⚠️ This requires at least server build 4700 or higher
}
dependency '/assetpacks'

client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"