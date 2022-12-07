fx_version "bodacious"
games {"gta5"}
lua54 'yes'
description 'esx_policejob for ocean'
version '1.0'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
	'server/main.lua',
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
	'client/main.lua',
}

files {
    'stream/shield_props.ytyp',
}

exports {
	'IsCuffed',
	'HandcuffMenu',
	'checkzakutedxD',
}

dependencies {
	'es_extended',
}

data_file 'DLC_ITYP_REQUEST' 'stream/shield_props.ytyp'

client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"