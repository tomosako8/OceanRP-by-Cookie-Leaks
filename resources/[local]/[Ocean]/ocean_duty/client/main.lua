ESX                           = nil
local PlayerData              = {}

CreateThread(function ()
  while ESX == nil do
    TriggerEvent('exilerp:getSharedObject', function(obj) 
		ESX = obj 
	end)
    
	Citizen.Wait(250)
 	PlayerData = ESX.GetPlayerData()
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

RegisterCommand('duty', function()
  if PlayerData.job.name == 'offpolice' or PlayerData.job.name == 'police' or PlayerData.job.name == 'offsheriff' or PlayerData.job.name == 'sheriff' or PlayerData.job.name == 'offcardealer' or PlayerData.job.name == 'cardealer' or PlayerData.job.name == 'offdoj' or PlayerData.job.name == 'doj' or PlayerData.job.name == 'offfire' or PlayerData.job.name == 'fire' or PlayerData.job.name == 'offk9' or PlayerData.job.name == 'k9' or PlayerData.job.name == 'offambulance' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'mechanik' or PlayerData.job.name == 'offmechanik' or PlayerData.job.name == 'gheneraugarage' or PlayerData.job.name == 'offgheneraugarage' then
    if PlayerData.job.name == 'offambulance' then
      TriggerServerEvent('exile:setJob', 'ambulance', true)
      ESX.ShowNotification('~b~Wchodzisz na służbę')
      Citizen.Wait(1000)
    elseif PlayerData.job.name == 'ambulance' then
      TriggerServerEvent('exile:setJob', 'ambulance', false)
      ESX.ShowNotification('~b~Schodzisz z służby')
      Citizen.Wait(1000)
    elseif PlayerData.job.name == 'offpolice' then
      TriggerServerEvent('exile:setJob', 'police', true)
      ESX.ShowNotification('~b~Wchodzisz na służbę')
      Citizen.Wait(1000)
    elseif PlayerData.job.name == 'police' then
      TriggerServerEvent('exile:setJob', 'police', false)
      ESX.ShowNotification('~b~Schodzisz z służby')
      Citizen.Wait(1000)
    elseif PlayerData.job.name == 'offfire' then
      TriggerServerEvent('exile:setJob', 'fire', true)
      ESX.ShowNotification('~b~Wchodzisz na służbę')
      Citizen.Wait(1000)
    elseif PlayerData.job.name == 'fire' then
      TriggerServerEvent('exile:setJob', 'fire', false)
      ESX.ShowNotification('~b~Schodzisz z służby')
      Citizen.Wait(1000)
    elseif PlayerData.job.name == 'offmechanik' then
      TriggerServerEvent('exile:setJob', 'mechanik', true)
      ESX.ShowNotification('~b~Wchodzisz na służbę')
      Citizen.Wait(1000)
    elseif PlayerData.job.name == 'mechanik' then
      TriggerServerEvent('exile:setJob', 'mechanik', false)
      ESX.ShowNotification('~b~Schodzisz z służby')
      Citizen.Wait(1000)
    elseif PlayerData.job.name == 'offmechanik' then
      TriggerServerEvent('exile:setJob', 'mechanik', true)
      ESX.ShowNotification('~b~Wchodzisz na służbę')
      Citizen.Wait(1000)
    elseif PlayerData.job.name == 'mechanik' then
      TriggerServerEvent('exile:setJob', 'mechanik', false)
      ESX.ShowNotification('~b~Schodzisz z służby')
      Citizen.Wait(1000)
    elseif PlayerData.job.name == 'offk9' then
      TriggerServerEvent('exile:setJob', 'k9', true)
      ESX.ShowNotification('~b~Wchodzisz na służbę')
      Citizen.Wait(1000)
    elseif PlayerData.job.name == 'k9' then
      TriggerServerEvent('exile:setJob', 'k9', false)
      ESX.ShowNotification('~b~Schodzisz z służby')
      Citizen.Wait(1000)
    elseif PlayerData.job.name == 'offdoj' then
      TriggerServerEvent('exile:setJob', 'doj', true)
      ESX.ShowNotification('~b~Wchodzisz na służbę')
      Citizen.Wait(1000)
    elseif PlayerData.job.name == 'doj' then
      TriggerServerEvent('exile:setJob', 'doj', false)
      ESX.ShowNotification('~b~Schodzisz z służby')
      Citizen.Wait(1000)
    elseif PlayerData.job.name == 'gheneraugarage' then
      TriggerServerEvent('exile:setJob', 'gheneraugarage', false)
      ESX.ShowNotification('~b~Schodzisz z służby')
      Citizen.Wait(1000)
    elseif PlayerData.job.name == 'offgheneraugarage' then
      TriggerServerEvent('exile:setJob', 'gheneraugarage', true)
      ESX.ShowNotification('~b~Wchodzisz na służbę')
      Citizen.Wait(1000)
    elseif PlayerData.job.name == 'cardealer' then
      TriggerServerEvent('exile:setJob', 'cardealer', false)
      ESX.ShowNotification('~b~Schodzisz z służby')
      Citizen.Wait(1000)
    elseif PlayerData.job.name == 'offcardealer' then
      TriggerServerEvent('exile:setJob', 'cardealer', true)
      ESX.ShowNotification('~b~Wchodzisz na służbę')
      Citizen.Wait(1000)
    elseif PlayerData.job.name == 'sheriff' then
      TriggerServerEvent('exile:setJob', 'sheriff', false)
      ESX.ShowNotification('~b~Schodzisz z służby')
      Citizen.Wait(1000)
    elseif PlayerData.job.name == 'offsheriff' then
      TriggerServerEvent('exile:setJob', 'sheriff', true)
      ESX.ShowNotification('~b~Wchodzisz na służbę')
      Citizen.Wait(1000)
    end
	else
		ESX.ShowNotification('~r~Nie jesteś zatrudniony!')
		Citizen.Wait(1000)
	end
end)