ESX                  = nil

CreateThread(function()
  while ESX == nil do
    TriggerEvent('exilerp:getSharedObject', function(obj) 
		ESX = obj 
	end)
	
    Citizen.Wait(250)
  end
end)

RegisterNetEvent('esx_optionalneeds:onDrink')
AddEventHandler('esx_optionalneeds:onDrink', function()
  local playerPed = PlayerPedId()
  TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_DRINKING", 0, 1)
  Citizen.Wait(1000)
  Citizen.InvokeNative(0xAAA34F8A7CB32098, playerPed)
end)


RegisterNetEvent('esx_optionalneeds:smoke')
AddEventHandler('esx_optionalneeds:smoke', function()
  TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SMOKING", 0, 1)               
end)


RegisterNetEvent('esx_optionalneeds:OGHaze')
AddEventHandler('esx_optionalneeds:OGHaze', function()
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SMOKING_POT", 0, true)
	Citizen.Wait(10000)
	Citizen.InvokeNative(0xAAA34F8A7CB32098, PlayerPedId())
	exports["acidtrip"]:DoAcid(120000)               
end)

RegisterNetEvent('esx_optionalneeds:Exctasy')
AddEventHandler('esx_optionalneeds:Exctasy', function()
	DoScreenFadeOut(2000)
	Citizen.Wait(4000)
	if GetPedArmour(PlayerPedId()) < 10 then
		Citizen.InvokeNative(0xCEA04D83135264CC, PlayerPedId(), 10)
	end
	Citizen.InvokeNative(0x561C060B,'e lezenie5')
	Citizen.Wait(14000)
	DoScreenFadeIn(2000)
	ESX.ShowNotification('Czujesz się niepokonany...')
	Citizen.Wait(1000)
	Citizen.InvokeNative(0xAAA34F8A7CB32098, PlayerPedId())
end)

RegisterNetEvent('esx_optionalneeds:menucrushera')
AddEventHandler('esx_optionalneeds:menucrushera', function()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'crushermenu', {
		title    = 'Crusher',
		align    = 'bottom-right',
		elements = {
			{label = 'Marihuana', value = 'marihuana'},
			{label = 'OG Haze', value = 'oghaze'},
		}
	}, function(data2, menu2)
		if data2.current.value == 'marihuana' then
			--menu2.close()
			ESX.UI.Menu.CloseAll()
			TriggerServerEvent("esx_optionalneeds:crusher",'2')
			Citizen.Wait(1500)
		elseif data2.current.value == 'oghaze' then
			--menu2.close()
			ESX.UI.Menu.CloseAll()
			TriggerServerEvent("esx_optionalneeds:crusher",'1')
			Citizen.Wait(1500)
		end	
	end, function(data2, menu2)
		menu2.close()
	end)
end)

-- [[ ANTY DZWON ]] --

local antydzown = false

RegisterNetEvent('esx_optionalneeds:AntyDzwon')
AddEventHandler('esx_optionalneeds:AntyDzwon', function()
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SMOKING_POT", 0, true)
	Citizen.Wait(10000)
	Citizen.InvokeNative(0xAAA34F8A7CB32098, PlayerPedId())
	antydzown = true          
	print(antydzown)
	Citizen.Wait(900000)
	antydzown = false
	print(antydzown)
end)

function isAntyDzwon()
	if antydzown == false then
		return false
	elseif antydzown == true then
		return true
	end
end