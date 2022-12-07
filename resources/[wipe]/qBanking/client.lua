ESX = nil
local PlayerData = {}
local trans = {}
local societyTrans = {}
local societyIdent, societyDays
local didAction = false
local isBankOpened = false
local canAccessSociety = false
local society = ''
local societyInfo
local closestATM, atmPos

local playerName, playerBankMoney, playerIBAN, trsIdentifier, allDaysValues, walletMoney

CreateThread(function()
	while ESX == nil do
		TriggerEvent('exilerp:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(250)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)

-- CreateThread(function()
-- 	if Config.ShowBankBlips then
-- 		Citizen.Wait(2000)
-- 		for k,v in ipairs(Config.BankLocations)do
-- 			local blip = AddBlipForCoord(v.x, v.y, v.z)
-- 			SetBlipSprite (blip, v.blip)
-- 			SetBlipDisplay(blip, 4)
-- 			SetBlipScale  (blip, v.blipScale)
-- 			SetBlipColour (blip, v.blipColor)
-- 			SetBlipAsShortRange(blip, true)
-- 			BeginTextCommandSetBlipName("STRING")
-- 			AddTextComponentString(v.blipText)
-- 			EndTextCommandSetBlipName(blip)
-- 		end
-- 	end
-- end)

function NearATM()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    
    for i = 1, #Config.ATM do
        local atm = GetClosestObjectOfType(pos.x, pos.y, pos.z, Config.ATMDistance + 2, Config.ATM[i].model, false, false, false)
        if DoesEntityExist(atm) then
        	if atm ~= closestATM then
        		closestATM = atm
	        	atmPos = GetEntityCoords(atm)
	        end
	        local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, atmPos.x, atmPos.y, atmPos.z, true)
	        
	        if dist <= Config.ATMDistance then
	            return true
	        elseif dist <= Config.ATMDistance + 5 then
	        	return "update"
	        end
	    end
    end
end

function NearBank()
    local pos = GetEntityCoords(PlayerPedId())

    for k, v in pairs(Config.BankLocations) do
        local dist = GetDistanceBetweenCoords(v.x, v.y, v.z, pos.x, pos.y, pos.z, true)

        if dist <= v.BankDistance then
            return true
        elseif dist <= v.BankDistance + 5 then
        	return "update"
        end
    end
end

RegisterNetEvent("open_banking")
AddEventHandler("open_banking", function()
	print('1')
	if NearBank() and not isBankOpened and NearBank() ~= "update" then
		print('2')
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'loading_data',
		})
		Citizen.Wait(500)
		openBank()
	end
end)

CreateThread(function()
	local inRange = false
	local shown = false

	local dict = 'anim@amb@prop_human_atm@interior@male@enter'
	local anim = 'enter'
	local ped = PlayerPedId()

    while true do
    	inRange = false
        Citizen.Wait(0)
		local sleep = true
        if NearATM() and not isBankOpened and NearATM() ~= "update" then
			sleep = false
        	if not Config.okokTextUI then
            	ESX.ShowHelpNotification("Press ~INPUT_PICKUP~ to access the ~b~ATM")
            else
            	inRange = true
            end

            if IsControlJustReleased(0, 38) then
            	ESX.TriggerServerCallback("qBanking:GetPIN", function(pin)
					print(pin)
            		if pin then
            			if not isBankOpened then
	            			isBankOpened = true
						    RequestAnimDict(dict)

						    while not HasAnimDictLoaded(dict) do
						        Citizen.Wait(7)
						    end

						    TaskPlayAnim(ped, dict, anim, 8.0, 8.0, -1, 0, 0, 0, 0, 0)
						    Citizen.Wait(Config.AnimTime)
						    ClearPedTasks(ped)

						    TriggerEvent("qBanking:OpenATM", pin)
						end
					else
						TriggerEvent("esx:showNotification", "Udaj się do banku głównego, aby ustawić kod PIN")
					end
				end)
            end
        elseif NearATM() == "update" then
        	Citizen.Wait(500)
        end

        if inRange and not shown then
        	shown = true
        	exports['qHelpNotify']:Open('[E] Aby skorzystać z bankomatu', 'darkblue', 'left') 
        elseif not inRange and shown then
        	shown = false
        	exports['qHelpNotify']:Close()
        end
		
		if sleep then
			Wait(500)
		end
    end
end)

RegisterNetEvent("qBanking:OpenATM")
AddEventHandler("qBanking:OpenATM", function(pin)
	SetNuiFocus(true, true)
	SendNUIMessage({
		action = 'atm',
		pin = pin,
	})
end)

function openBank()
	local hasJob = false
	local playeJob = ESX.GetPlayerData().job
	local playerJobName = ''
	local playerJobGrade = ''
	local jobLabel = ''
	isBankOpened = true

	canAccessSociety = false

	if playeJob ~= nil then
		hasJob = true
		playerJobName = playeJob.name
		playerJobGrade = playeJob.grade_name
		jobLabel = playeJob.label
		society = 'society_'..playerJobName
	end

	ESX.TriggerServerCallback("qBanking:GetPlayerInfo", function(data)
		ESX.TriggerServerCallback("qBanking:GetOverviewTransactions", function(cb, identifier, allDays)
			for k,v in pairs(Config.Societies) do
				if playerJobName == v then
					if json.encode(Config.SocietyAccessRanks) ~= '[]' then
						for k2,v2 in pairs(Config.SocietyAccessRanks) do
							if playerJobGrade == v2 then
								canAccessSociety = true
							end
						end
					else
						canAccessSociety = true
					end
				end
			end

			if canAccessSociety then
				ESX.TriggerServerCallback("qBanking:SocietyInfo", function(cb)
					if cb ~= nil then
						societyInfo = cb
					else
						local societyIban = Config.IBANPrefix..jobLabel
						TriggerServerEvent("qBanking:CreateSocietyAccount", society, jobLabel, 0, societyIban)
						Citizen.Wait(200)
						ESX.TriggerServerCallback("qBanking:SocietyInfo", function(cb)
							societyInfo = cb
						end, society)
					end
				end, society)
			end

			isBankOpened = true
			trans = cb
			playerName, playerBankMoney, playerIBAN, trsIdentifier, allDaysValues, walletMoney = data.playerName, data.playerBankMoney, data.playerIBAN, identifier, allDays, data.walletMoney
			ESX.TriggerServerCallback("qBanking:GetSocietyTransactions", function(societyTranscb, societyID, societyAllDays)
				societyIdent = societyID
				societyDays = societyAllDays
				societyTrans = societyTranscb
				if data.playerIBAN ~= nil then
					SetNuiFocus(true, true)
					SendNUIMessage({
						action = 'bankmenu',
						playerName = data.playerName,
						playerSex = data.sex,
						playerBankMoney = data.playerBankMoney,
						walletMoney = walletMoney,
						playerIBAN = data.playerIBAN,
						db = trans,
						identifier = trsIdentifier,
						graphDays = allDaysValues,
						isInSociety = canAccessSociety,
						firstname = data.firstname,
						lastname = data.lastname
					})
				else
					GenerateIBAN()
					Citizen.Wait(1000)
					ESX.TriggerServerCallback("qBanking:GetPlayerInfo", function(data)
						SetNuiFocus(true, true)
						SendNUIMessage({
							action = 'bankmenu',
							playerName = data.playerName,
							playerSex = data.sex,
							playerBankMoney = data.playerBankMoney,
							walletMoney = walletMoney,
							playerIBAN = data.playerIBAN,
							db = trans,
							identifier = trsIdentifier,
							graphDays = allDaysValues,
							isInSociety = canAccessSociety,
							firstname = data.firstname,
							lastname = data.lastname
						})
					end)
				end
			end, society)
		end)
	end)
end

RegisterNUICallback("action", function(data, cb)
	if data.action == "close" then
		isBankOpened = false
		SetNuiFocus(false, false)
	elseif data.action == "deposit" then
		if tonumber(data.value) ~= nil then
			if tonumber(data.value) > 0 then
				if data.window == 'bankmenu' then
					TriggerServerEvent('qBanking:DepositMoney', tonumber(data.value))
				elseif data.window == 'societies' then
					TriggerServerEvent('qBanking:DepositMoneyToSociety', tonumber(data.value), societyInfo.society, societyInfo.society_name)
				end
			else
				ESX.ShowNotification("Niepoprawna kwota")
			end
		else
			ESX.ShowNotification("Niepoprawne dane")
		end
	elseif data.action == "withdraw" then
		if tonumber(data.value) ~= nil then
			if tonumber(data.value) > 0 then
				if data.window == 'bankmenu' then
					TriggerServerEvent('qBanking:WithdrawMoney', tonumber(data.value))
				elseif data.window == 'societies' then
					TriggerServerEvent('qBanking:WithdrawMoneyToSociety', tonumber(data.value), societyInfo.society, societyInfo.society_name, societyInfo.value)
				end
			else
				ESX.ShowNotification("Niepoprawna kwota")
			end
		else
			ESX.ShowNotification("Niepoprawne dane")
		end
	elseif data.action == "transfer" then
		if tonumber(data.value) ~= nil then
			if tonumber(data.value) > 0 then
				ESX.TriggerServerCallback("qBanking:IsIBanUsed", function(isUsed, isPlayer)
					if isUsed ~= nil then
						if data.window == 'bankmenu' then
							if isPlayer then
								TriggerServerEvent('qBanking:TransferMoney', tonumber(data.value), data.iban:upper(), isUsed.identifier, isUsed.accounts, isUsed.name)
							elseif not isPlayer then
								TriggerServerEvent('qBanking:TransferMoneyToSociety', tonumber(data.value), isUsed.iban:upper(), isUsed.society_name, isUsed.society)
							end
						elseif data.window == 'societies' then
							local toMyself = false
							if data.iban:upper() == playerIBAN then
								toMyself = true
							end

							if isPlayer then
								TriggerServerEvent('qBanking:TransferMoneyToPlayerFromSociety', tonumber(data.value), data.iban:upper(), isUsed.identifier, isUsed.accounts, isUsed.name, societyInfo.society, societyInfo.society_name, societyInfo.value, toMyself)
							elseif not isPlayer then
								TriggerServerEvent('qBanking:TransferMoneyToSocietyFromSociety', tonumber(data.value), isUsed.iban:upper(), isUsed.society_name, isUsed.society, societyInfo.society, societyInfo.society_name, societyInfo.value)
							end
						end
					elseif isUsed == nil then
						ESX.ShowNotification("Ten IBAN nie istnieje!")
					end
				end, data.iban:upper())
			else
				ESX.ShowNotification("Niepoprawna kwota")
			end
		else
			ESX.ShowNotification("Niepoprawne dane")
		end
	elseif data.action == "overview_page" then
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'overview_page',
			playerBankMoney = playerBankMoney,
			walletMoney = walletMoney,
			playerIBAN = playerIBAN,
			db = trans,
			identifier = trsIdentifier,
			graphDays = allDaysValues,
			isInSociety = canAccessSociety,
			firstname = data.firstname,
			lastname = data.lastname
		})
	elseif data.action == "transactions_page" then
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'transactions_page',
			db = trans,
			identifier = trsIdentifier,
			graph_values = allDaysValues,
			isInSociety = canAccessSociety,
			firstname = data.firstname,
			lastname = data.lastname
		})
	elseif data.action == "society_transactions" then
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'society_transactions',
			db = societyTrans,
			identifier = societyIdent,
			graph_values = societyDays,
			isInSociety = canAccessSociety,
			societyInfo = societyInfo,
			firstname = data.firstname,
			lastname = data.lastname
		})
	elseif data.action == "society_page" then
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'society_page',
			playerBankMoney = playerBankMoney,
			walletMoney = walletMoney,
			playerIBAN = playerIBAN,
			db = societyTrans,
			identifier = societyIdent,
			graphDays = societyDays,
			isInSociety = canAccessSociety,
			societyInfo = societyInfo,
			firstname = data.firstname,
			lastname = data.lastname
		})
	elseif data.action == "settings_page" then
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'settings_page',
			isInSociety = canAccessSociety,
			ibanCost = Config.IBANChangeCost,
			ibanPrefix = Config.IBANPrefix,
			ibanCharNum = Config.CustomIBANMaxChars,
			pinCost = Config.PINChangeCost,
			pinCharNum = 4,
			firstname = data.firstname,
			lastname = data.lastname
		})
	elseif data.action == "atm" then
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'loading_data',
			firstname = data.firstname,
			lastname = data.lastname
		})
		Citizen.Wait(500)
		openBank()
	elseif data.action == "change_iban" then
		if Config.CustomIBANAllowLetters then
			local iban = Config.IBANPrefix..data.iban:upper()
			
			ESX.TriggerServerCallback("qBanking:IsIBanUsed", function(isUsed, isPlayer)

				if isUsed == nil then
					TriggerServerEvent('qBanking:UpdateIbanDB', iban, Config.IBANChangeCost)
				elseif isUsed ~= nil then
					ESX.ShowNotification("Ten IBAN jest już w użytku")
				end
			end, iban)
		elseif not Config.CustomIBANAllowLetters then
			if tonumber(data.iban) ~= nil then
				local iban = Config.IBANPrefix..data.iban:upper()
				
				ESX.TriggerServerCallback("qBanking:IsIBanUsed", function(isUsed, isPlayer)

					if isUsed == nil then
						TriggerServerEvent('qBanking:UpdateIbanDB', iban, Config.IBANChangeCost)
					elseif isUsed ~= nil then
						ESX.ShowNotification("Ten IBAN jest już w użytku")
					end
				end, iban)
			else
				ESX.ShowNotification("Możesz użyć tylko cyfr w swoim IBAN")
			end
		end
	elseif data.action == "change_pin" then
		if tonumber(data.pin) ~= nil then
			if string.len(data.pin) == 4 then
				ESX.TriggerServerCallback("qBanking:GetPIN", function(pin)
            		if pin then
            			TriggerServerEvent('qBanking:UpdatePINDB', data.pin, Config.PINChangeCost)
            		else
            			TriggerServerEvent('qBanking:UpdatePINDB', data.pin, 0)
					end
				end)
			else
				ESX.ShowNotification("Twój PIN musi mieć 4 cyfry")
			end
		else
			ESX.ShowNotification("Możesz używać tylko cyfr")
		end
	end
end)

RegisterNetEvent("qBanking:updateTransactions")
AddEventHandler("qBanking:updateTransactions", function(money, wallet)
	Citizen.Wait(100)
	if isBankOpened then
		ESX.TriggerServerCallback("qBanking:GetOverviewTransactions", function(cb, id, allDays)
			trans = cb
			allDaysValues = allDays
			SetNuiFocus(true, true)
			SendNUIMessage({
				action = 'overview_page',
				playerBankMoney = playerBankMoney,
				walletMoney = walletMoney,
				playerIBAN = playerIBAN,
				db = trans,
				identifier = trsIdentifier,
				graphDays = allDaysValues,
				isInSociety = canAccessSociety,
			})
			TriggerEvent('qBanking:updateMoney', money, wallet)
		end)
	end
end)

RegisterNetEvent("qBanking:updateMoney")
AddEventHandler("qBanking:updateMoney", function(money, wallet)
	if isBankOpened then
		playerBankMoney = money
		walletMoney = wallet
		SendNUIMessage({
			action = 'updatevalue',
			playerBankMoney = money,
			walletMoney = wallet,
		})
	end
end)

RegisterNetEvent("qBanking:updateIban")
AddEventHandler("qBanking:updateIban", function(iban)
	playerIBAN = iban
	SendNUIMessage({
		action = 'updateiban',
		iban = playerIBAN,
	})
end)

RegisterNetEvent("qBanking:updateIbanPinChange")
AddEventHandler("qBanking:updateIbanPinChange", function()
	Citizen.Wait(100)
	ESX.TriggerServerCallback("qBanking:GetOverviewTransactions", function(cbs, ids, allDays)
		trans = cbs
	end)
end)

RegisterNetEvent("qBanking:updateTransactionsSociety")
AddEventHandler("qBanking:updateTransactionsSociety", function(wallet)
	Citizen.Wait(100)
	ESX.TriggerServerCallback("qBanking:SocietyInfo", function(cb)
		ESX.TriggerServerCallback("qBanking:GetSocietyTransactions", function(societyTranscb, societyID, societyAllDays)
			ESX.TriggerServerCallback("qBanking:GetOverviewTransactions", function(cbs, ids, allDays)
				trans = cbs
				walletMoney = wallet
				societyDays = societyAllDays
				societyIdent = societyID
				societyTrans = societyTranscb
				societyInfo = cb
				if cb ~= nil then
					SetNuiFocus(true, true)
					SendNUIMessage({
						action = 'society_page',
						walletMoney = wallet,
						db = societyTrans,
						graphDays = societyDays,
						isInSociety = canAccessSociety,
						societyInfo = societyInfo,
					})
				else

				end
			end)
		end, society)
	end, society)
end)

function GenerateIBAN()
	math.randomseed(GetGameTimer())
	local stringFormat = "%0"..Config.IBANNumbers.."d"
	local number = math.random(0, 10^Config.IBANNumbers-1)
	number = string.format(stringFormat, number)
	local iban = Config.IBANPrefix..number:upper()
	local isIBanUsed = true
	local hasChecked = false

	while true do
		Citizen.Wait(10)
		if isIBanUsed and not hasChecked then
			isIBanUsed = false
			ESX.TriggerServerCallback("qBanking:IsIBanUsed", function(isUsed)
				if isUsed ~= nil then
					isIBanUsed = true
					number = math.random(0, 10^Config.IBANNumbers-1)
					number = string.format("%03d", number)
					iban = Config.IBANPrefix..number:upper()
				elseif isUsed == nil then
					hasChecked = true
					isIBanUsed = false
				end
				canLoop = true
			end, iban)
		elseif not isIBanUsed and hasChecked then
			break
		end
	end
	TriggerServerEvent('qBanking:SetIBAN', iban)
end