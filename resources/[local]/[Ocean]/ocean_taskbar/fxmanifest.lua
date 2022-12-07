fx_version 'cerulean'

game 'gta5'
lua54 'yes'


ui_page 'index.html'

files {
  "index.html",
  "scripts.js",
  "css/style.css"
}
client_script {
  "client.lua",
}

export "taskBar"
export "closeGuiFail"
export "customTaskbar"
export "isBusy"
export "cancellableTaskBar"
export "cancelTaskBar"

exports {
  "getAlign"
}

client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"