ESX             = nil

TriggerEvent('exilerp:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('gcphone:getItemAmount', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	if xPlayer ~= nil then
		local items = xPlayer.getInventoryItem(item)
		
		if items == nil then
			cb(0)
		else
			cb(items.count)
		end
	end
end)

RegisterServerEvent('esx_shops:buyItem')
AddEventHandler('esx_shops:buyItem', function(itemName, amount, price, itemlimit, moneytype, zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	amount = ESX.Round(amount)

	if amount < 0 then
		return
	end
	
	if type(price) == 'string' then
		price = tonumber(price)
	end

	if price ~= nil and amount ~= nil then
		price = price * amount
		local jebacciemoney = xPlayer.getAccount(moneytype).money
		local missingMoney = (jebacciemoney - price) * -1

		if xPlayer.getAccount(moneytype).money >= price then
			local item = xPlayer.getInventoryItem(itemName)
			
			if item ~= nil then
				if itemName == 'sim_card' then			
					ESX.CreateDynamicItem({
						type = 'sim',
						owner = xPlayer.identifier,
						ownerdigit = xPlayer.digit,
						blocked = 0,
						admin1 = '',
						admindigit1 = '',			
						admin2 = '',
						admindigit2 = '',
					}, function(data, number)
						xPlayer.showNotification("Kupiłeś nowy starter #" .. number)
						xPlayer.addInventoryItem(data, 1)
						xPlayer.removeAccountMoney(moneytype, price)	
					end)
				else
					local count = 0

					for k,v in pairs(Config.Zones[zone].Items) do
						if v.item == itemName then
							count = 1
						end
					end

					if count ~= 1 then
						TriggerEvent('exilerp:banPlr', "nigger", _source, "Event-detected (exile_shops)")
						exports['ocean_logs']:SendLog(_source, "Event-Detect shops?", 'anticheat')
						--TriggerEvent('banCheater', _source, "Cheaty | Powód: Event-Detect") 
					else
						if itemlimit ~= nil then
							if itemlimit < amount or (item.count + amount) > itemlimit then
								xPlayer.showNotification('~r~Nie masz~s~ tyle ~y~wolnego miejsca ~s~ w ekwipunku!')
							else
								xPlayer.removeAccountMoney(moneytype, price)
								xPlayer.addInventoryItem(itemName, amount)
							end	
						end						
					end
				end
			end
		else
			xPlayer.showNotification('~r~Nie masz tyle '..(moneytype == 'money' and 'gotówki' or 'pieniędzy na karcie')..', brakuje ci ~g~$'.. missingMoney..'~r~!')
		end
	end
end)

--[[RegisterServerEvent('esx_shops:coffee')
AddEventHandler('esx_shops:coffee', function(kroljestjeden, krolsentino)
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_kawiarnia', function(account)
        account.addAccountMoney(kroljestjeden * (krolsentino or 1))
    end)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_kawiarnia', function(inventory)
        inventory.removeItem('kawa', krolsentino)
    end)
end)

ESX.RegisterServerCallback('esx_shops:getcoffee', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_kawiarnia', function(inventory)
			local shit = inventory.getItem('kawa')
			cb(json.encode(shit.count))
	end)
end) ]]


local SellTrigger = 'esx_shops:sellItem'..math.random(111111,999999)
local recived_token_shops = {}
RegisterServerEvent(SellTrigger)
AddEventHandler(SellTrigger, function(resourceName,itemName)
	if itemName == "phone" or itemName == "bizuteria" or itemName == "handcuff" or itemName == "krotkofalowka" or itemName == "fixkit2" or itemName == "gopro"  or itemName == "bon1" then
		if resourceName == GetCurrentResourceName() then
			local xPlayer = ESX.GetPlayerFromId(source)
			local xItem = xPlayer.getInventoryItem(itemName)
			if xItem.count <= xItem.limit then
				for k,v in pairs(Config.LombardItems) do
					if xItem.count > 0 then
						if itemName == v.item then
							local cena = xItem.count * v.price
							xPlayer.removeInventoryItem(itemName, xItem.count)
							xPlayer.addMoney(cena)
						end
					else
						TriggerClientEvent('esx:showNotification', source, 'Nie posiadasz tego przedmiotu w ekwipunku')
					end
				end
			else
				TriggerEvent('exilerp:banPlr', "nigger", source, "Tried to sell more items than intended (ocean_shops)")
				exports['ocean_logs']:SendLog(source, "SHOPS: Próba sprzedania ilości itemu ponad limit", 'anticheat', '15844367')
			
			end
		else
			TriggerEvent('exilerp:banPlr', "nigger", source, "Tried to bypass (ocean_shops)")
			exports['ocean_logs']:SendLog(source, "SHOPS: Niewłaściwa nazwa skryptu, próba obejścia", 'anticheat', '15844367')
		end
	else
		TriggerEvent('exilerp:banPlr', "nigger", source, "Tried to give item (ocean_shops)")
		exports['ocean_logs']:SendLog(source, "SHOPS: Próba sprzedania innego itemu niz w skrypcie", 'anticheat', '15844367')
	end
end)

RegisterServerEvent('esx_shops:request')
AddEventHandler('esx_shops:request', function()
	if not recived_token_shops[source] then
		TriggerClientEvent("esx_shops:getrequest", source, SellTrigger)
		recived_token_shops[source] = true
	else
		TriggerEvent('exilerp:banPlr', "nigger", source, "Tried to get token (ocean_shops)")
		exports['ocean_logs']:SendLog(source, "Shops: Próba otrzymania ponownie tokenu!", 'anticheat', '15844367')
	end
end)

AddEventHandler('playerDropped', function()
    recived_token_shops[source] = nil
end)