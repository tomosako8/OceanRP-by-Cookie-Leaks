RegisterNetEvent('exile_kamza')
AddEventHandler('exile_kamza', function(typ)
	if typ == 'small' then
        Citizen.InvokeNative(0xCEA04D83135264CC, playerPed, 25)
		ESX.PlayAnim('clothingshirt', 'try_shirt_neutral_c', 8.0, -1, 0)
		Wait(1000)
		SetPedComponentVariation(playerPed, 9, 11, 0, 2)
	elseif typ == 'big' then
        Citizen.InvokeNative(0xCEA04D83135264CC, playerPed, 50)
		ESX.PlayAnim('clothingshirt', 'try_shirt_neutral_c', 8.0, -1, 0)
		Wait(1000)
		SetPedComponentVariation(playerPed, 9, 11, 1, 2)
    elseif typ == 'skarpetka' then
		ESX.PlayAnim('clothingshirt', 'try_shirt_neutral_c', 8.0, -1, 0)
		Wait(1000)
		SetPedComponentVariation(playerPed, 1, 32, 0, 0)
	elseif typ == 'kamzasaspsmall' then
        Citizen.InvokeNative(0xCEA04D83135264CC, playerPed, 75)
		ESX.PlayAnim('clothingshirt', 'try_shirt_neutral_c', 8.0, -1, 0)
		Wait(1000)
		TriggerEvent('skinchanger:getSkin', function(skin)
			if skin.sex == 0 and ESX.GetPlayerData().job.name == 'police' then
				SetPedComponentVariation(playerPed, 9, 57, 0, 2)
			elseif skin.sex == 0 and ESX.GetPlayerData().job.name == 'sheriff' then
				SetPedComponentVariation(playerPed, 9, 57, 2, 2)
			elseif skin.sex == 1 and ESX.GetPlayerData().job.name == 'police' then
				SetPedComponentVariation(playerPed, 9, 57, 0, 2)
			elseif skin.sex == 1 and ESX.GetPlayerData().job.name == 'sheriff' then
				SetPedComponentVariation(playerPed, 9, 57, 1, 2)
			elseif skin.sex == 0 then
				SetPedComponentVariation(playerPed, 9, 69, 0, 2)
			elseif skin.sex == 1 then
				SetPedComponentVariation(playerPed, 9, 57, 0, 2)
			end
		end)
	elseif typ == 'kamzasaspbigswat' then
        Citizen.InvokeNative(0xCEA04D83135264CC, playerPed, 100)
		ESX.PlayAnim('clothingshirt', 'try_shirt_neutral_c', 8.0, -1, 0)
		Wait(1000)
		TriggerEvent('skinchanger:getSkin', function(skin)
			if skin.sex == 0 then
				SetPedComponentVariation(playerPed, 9, 86, 4, 2)
			else
				SetPedComponentVariation(playerPed, 9, 78, 7, 2)
			end
		end)
	elseif typ == 'kamzasaspbigsert' then
        Citizen.InvokeNative(0xCEA04D83135264CC, playerPed, 100)
		ESX.PlayAnim('clothingshirt', 'try_shirt_neutral_c', 8.0, -1, 0)
		Wait(1000)
		TriggerEvent('skinchanger:getSkin', function(skin)
			if skin.sex == 0 then
				SetPedComponentVariation(playerPed, 9, 86, 0, 2)
			else
				SetPedComponentVariation(playerPed, 9, 78, 6, 2)
			end
		end)
	elseif typ == 'kasksaspswat' then
		ESX.PlayAnim('missheistdockssetup1hardhat@', 'put_on_hat', 8.0, -1, 0)
		if not exports["esx_ambulancejob"]:isDead() then
			TriggerEvent('skinchanger:getSkin', function(skin)
				if skin.sex == 0 then
					SetPedPropIndex(playerPed, 0, 39, 1, 2)
				else
					SetPedPropIndex(playerPed, 0, 39, 1, 2)
				end
			end)
		end
	elseif typ == 'kasksaspsert' then
		ESX.PlayAnim('missheistdockssetup1hardhat@', 'put_on_hat', 8.0, -1, 0)
		Wait(1000)
		if not exports["esx_ambulancejob"]:isDead() then
			TriggerEvent('skinchanger:getSkin', function(skin)
				if skin.sex == 0 then
					SetPedPropIndex(playerPed, 0, 39, 1, 2)
				else
					SetPedPropIndex(playerPed, 0, 39, 1, 2)
				end
			end)
		end
	end
end)

AddEventHandler('esx:onPlayerDeath', function()
	CheckKask()
end)

CheckKask = function()
	if exports["esx_ambulancejob"]:isDead() then
		TriggerEvent('skinchanger:getSkin', function(skin)
			if skin.sex == 0 then
				SetPedPropIndex(playerPed, 0, -1, 0, 2)
			else
				SetPedPropIndex(playerPed, 0, -1, 0, 2)
			end
		end)
		ESX.ShowNotification('~b~Utracono ~r~[kask / czapkę]~b~ w wyniku obezwładnienia')
	end
end

RegisterNetEvent('falszywyy_barylki:mieszaczmenu')
AddEventHandler('falszywyy_barylki:mieszaczmenu', function()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mieszaczmenu', {
		title    = 'Mieszacz Narkotyków',
		align    = 'bottom-right',
		elements = {
			{label = 'Baryłka Marihuany (100g)', value = 'barylkaziola'},
			{label = 'Baryłka Metaamfetaminy (100g)', value = 'barylkametaamfetaminy'},
			{label = 'Baryłka Kokainy (100g)', value = 'barylkakokainy'},
			{label = 'Baryłka Opium (100g)', value = 'barylkaopium'},
		}
	}, function(data2, menu2)
		if data2.current.value == 'barylkaziola' then
			ESX.UI.Menu.CloseAll()
			FreezeEntityPosition(playerPed, true)
			TriggerServerEvent('falszywyy_barylki:komunikat', 'Wyjmuje z kieszeni substancje i zaczyna mieszać')
			ESX.PlayAnim('anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 8.0, 30000, 1)
			exports["ocean_taskbar"]:taskBar(15000, "Mieszanie substancji", false, function(cb) 
				if cb then
					TriggerServerEvent('falszywyy_barylki:komunikat', 'Zaczyna owijać i pakować substancje w baryłke')
					Citizen.Wait(100)
					exports["ocean_taskbar"]:taskBar(15000, "Owijanie i pakowanie substancji", false, function(cb) 
						if cb then
							Citizen.Wait(100)
							TriggerServerEvent("falszywyy_barylki:mieszacz",'weed')
							FreezeEntityPosition(playerPed, false)
							Citizen.Wait(1500)
						end
						
					end)
				end
				
			end)



		elseif data2.current.value == 'barylkametaamfetaminy' then
			ESX.UI.Menu.CloseAll()
			FreezeEntityPosition(playerPed, true)
			TriggerServerEvent('falszywyy_barylki:komunikat', 'Wyjmuje z kieszeni substancje i zaczyna mieszać')
			ESX.PlayAnim('anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 8.0, 30000, 1)
			exports["ocean_taskbar"]:taskBar(15000, "Mieszanie narkotyku", false, function(cb) 
				if cb then
					TriggerServerEvent('falszywyy_barylki:komunikat', 'Zaczyna owijać i pakować substancje w baryłke')
					Citizen.Wait(100)
					exports["ocean_taskbar"]:taskBar(15000, "Owijanie i pakowanie substancji", false, function(cb) 
						if cb then
							Citizen.Wait(100)
							TriggerServerEvent("falszywyy_barylki:mieszacz",'meth')
							FreezeEntityPosition(playerPed, false)
							Citizen.Wait(1500)
						end
						
					end)
				end
				
			end)



		elseif data2.current.value == 'barylkakokainy' then
			ESX.UI.Menu.CloseAll()
			FreezeEntityPosition(playerPed, true)
			TriggerServerEvent('falszywyy_barylki:komunikat', 'Wyjmuje z kieszeni substancje i zaczyna mieszać')
			ESX.PlayAnim('anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 8.0, 30000, 1)
			exports["ocean_taskbar"]:taskBar(15000, "Mieszanie narkotyku", false, function(cb) 
				if cb then
					TriggerServerEvent('falszywyy_barylki:komunikat', 'Zaczyna owijać i pakować substancje w baryłke')
					Citizen.Wait(100)
					exports["ocean_taskbar"]:taskBar(15000, "Owijanie i pakowanie substancji", false, function(cb) 
						if cb then
							Citizen.Wait(100)
							TriggerServerEvent("falszywyy_barylki:mieszacz",'coke')
							FreezeEntityPosition(playerPed, false)
							Citizen.Wait(1500)
						end
						
					end)
				end
				
			end)


		elseif data2.current.value == 'barylkaopium' then
			ESX.UI.Menu.CloseAll()
			FreezeEntityPosition(playerPed, true)
			TriggerServerEvent('falszywyy_barylki:komunikat', 'Wyjmuje z kieszeni substancje i zaczyna mieszać')
			ESX.PlayAnim('anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 8.0, 30000, 1)
			exports["ocean_taskbar"]:taskBar(15000, "Mieszanie narkotyku", false, function(cb) 
				if cb then
					TriggerServerEvent('falszywyy_barylki:komunikat', 'Zaczyna owijać i pakować substancje w baryłke')
					Citizen.Wait(100)
					exports["ocean_taskbar"]:taskBar(15000, "Owijanie i pakowanie substancji", false, function(cb) 
						if cb then
							Citizen.Wait(100)
							TriggerServerEvent("falszywyy_barylki:mieszacz",'opium')
							FreezeEntityPosition(playerPed, false)
							Citizen.Wait(1500)
						end
						
					end)
				end
				
			end)


		end	
	end, function(data2, menu2)
		menu2.close()
	end)
end)