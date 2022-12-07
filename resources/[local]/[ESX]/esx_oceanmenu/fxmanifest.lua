fx_version "bodacious"

lua54 'yes'
games {"gta5"}
--
client_script 'client.lua'

server_scripts {
    'server.lua',
    '@oxmysql/lib/MySQL.lua'
}

ui_page('client/html/UI.html') --THIS IS IMPORTENT

--[[The following is for the files which are need for you UI (like, pictures, the HTML file, css and so on) ]]--
files({
    'client/html/UI.html',
    'client/html/style.css'
})

server_exports {
    'CheckInsuranceEMS',
    'CheckInsuranceLSC',
    'KursyChange'
}


client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"