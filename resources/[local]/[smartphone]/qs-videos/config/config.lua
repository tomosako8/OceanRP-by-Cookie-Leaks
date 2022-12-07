Config = {}

function SendTextMessage(msg, type)
  if type == 'inform' then 
      exports["qHelpNotify"]:Open(msg, 'darkblue', 'left')
      Citizen.Wait(3000)
      exports['qHelpNotify']:Close()
  end
  if type == 'error' then 
      exports["qHelpNotify"]:Open(msg, 'darkblue', 'left')
      Citizen.Wait(3000)
      exports['qHelpNotify']:Close()
  end
  if type == 'success' then 
      exports["qHelpNotify"]:Open(msg, 'darkblue', 'left')
      Citizen.Wait(3000)
      exports['qHelpNotify']:Close()
  end
end