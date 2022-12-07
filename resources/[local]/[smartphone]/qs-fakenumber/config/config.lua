Config = {}

Config.Command = 'kartysim'
Config.simitems = "sim_card"

Config.NumberPrefix = "0" -- Prefix of the number
Config.NumberDigits =  6 -- Amount of digits after the prefix

function SendTextMessage(msg, type) --You can add your notification system here for simple messages.
    if type == 'inform' then 

      exports["qHelpNotify"]:Open(msg, 'darkblue', 'left')
      Citizen.Wait(3000)
      exports['qHelpNotify']:Close()
      --MORE EXAMPLES OF NOTIFICATIONS.
      --exports['qs-core']:Notify(msg, "primary")
      --exports['mythic_notify']:DoHudText('inform', msg)
    end
    if type == 'error' then 

      exports["qHelpNotify"]:Open(msg, 'darkred', 'left')
      Citizen.Wait(3000)
      exports['qHelpNotify']:Close()
      --MORE EXAMPLES OF NOTIFICATIONS.
      --exports['qs-core']:Notify(msg, "error")
      --exports['mythic_notify']:DoHudText('error', msg)
    end
    if type == 'success' then 

      exports["qHelpNotify"]:Open(msg, 'darkgreen', 'left')
      Citizen.Wait(3000)
      exports['qHelpNotify']:Close()
      --MORE EXAMPLES OF NOTIFICATIONS.
      --exports['qs-core']:Notify(msg, "success")
      --exports['mythic_notify']:DoHudText('success', msg)
    end
end