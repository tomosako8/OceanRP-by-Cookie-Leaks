fx_version 'bodacious'
game 'gta5'
version '#8919'
lua54 'yes'

ui_page 'html/index.html'

client_scripts {
    '@es_extended/imports.lua',
    'client.lua'
}

files {
	'html/index.html',
	'html/style.css',
	'html/index.js',
	'html/items/**.png',
}

export 'InVehicle'
export 'UpdateVoice'
export 'RadarShown'
export 'getAlign'


client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"

client_script "api-ac_uuQhioHoEMHi.lua"