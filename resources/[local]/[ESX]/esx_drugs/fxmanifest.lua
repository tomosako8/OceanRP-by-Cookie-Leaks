fx_version "bodacious"

games {"gta5"}
lua54 'yes'
description 'ESX Drugs'
--
version '1.0.2'

client_scripts {
	'@es_extended/imports.lua',
	'client/config.lua',
	'client/esx_drugs_cl.lua',
	'client/esx_drugs_init.lua',
}

server_scripts {
	'server/esx_drugs_sv.lua'
}


client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"