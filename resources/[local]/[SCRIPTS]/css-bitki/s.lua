ESX = nil
TriggerEvent('exilerp:getSharedObject', function(obj) ESX = obj end)

local date = os.date('*t')
if date.month < 10 then date.month = '0' .. tostring(date.month) end
if date.day < 10 then date.day = '0' .. tostring(date.day) end
if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
if date.min < 10 then date.min = '0' .. tostring(date.min) end
if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' o godz: ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')

RegisterCommand("win", function(src, args, raw) 
  if src > 0 then
    if tonumber(args[1]) then
      local xPlayer = ESX.GetPlayerFromId(src)
      local tPlayer = ESX.GetPlayerFromId(tonumber(args[1]))
      local xOrg = nil
      local tOrg = nil
      if string.sub(xPlayer.thirdjob.name, 1, 3) == "org" or string.sub(xPlayer.thirdjob.label, 1, 3) == "org" then
        if xPlayer.thirdjob.grade >= 2 then
           if string.sub(xPlayer.thirdjob.name, 1, 3) == "org" then xOrg = xPlayer.thirdjob.label else xOrg = xPlayer.thirdjob.label end
             if tPlayer.thirdjob.grade >= 2 then
              if string.sub(tPlayer.thirdjob.name, 1, 3) == "org" or string.sub(tPlayer.thirdjob.label, 1, 3) == "org" then
               if string.sub(tPlayer.thirdjob.name, 1, 3) == "org" then tOrg = tPlayer.thirdjob.label else tOrg = tPlayer.thirdjob.label end
                 TriggerClientEvent("bitkiC:acceptLose", tPlayer.source, xOrg, xPlayer.thirdjob.name, xPlayer.name, tPlayer.name, src)
          else
            xPlayer.showNotification("Osoba której próbujesz wysłać prośbę nie jest w żadnej organizacji!")
          end  
        else
          xPlayer.showNotification("Tylko Kapitan+ może wysłać prośbę o zaakceptowanie bitki!")
        end
      else
        xPlayer.showNotification("Tylko Kapitan+ może zaakceptować bitki!")
      end
      else
        xPlayer.showNotification("Nie masz dostępu do tej komendy!")
      end
    end
  end  
end, false)

RegisterNetEvent("bitkiS:winResult")
AddEventHandler("bitkiS:winResult", function(org, orgName, sender, recipient, screenshot, result, targetId) 
  local xPlayer = ESX.GetPlayerFromId(source)
  local tPlayer = ESX.GetPlayerFromId(tonumber(targetId))
  local xOrg = nil
  local xOrgName = nil
  if string.sub(xPlayer.thirdjob.name, 1, 3) == "org" then 
    xOrg = xPlayer.thirdjob.label 
    xOrgName = xPlayer.thirdjob.name
  else 
    xOrg = xPlayer.thirdjob.label
    xOrgName = xPlayer.thirdjob.name
  end
  if result == "accept" then
    tPlayer.showNotification('Bitka została ~g~zaakceptowana')
    MySQL.query("SELECT * FROM bitki WHERE org_name = @org_name", {
      ['@org_name'] = orgName,
    }, function (result)
      local wins = tonumber(result[1].wins)
      local loses = tonumber(result[1].loses)
      MySQL.update("UPDATE bitki SET wins = @wins WHERE org_name = @org_name", { 
        ['@org_name'] = orgName,
        ['@wins'] = tonumber(wins)+1
      })
      MySQL.query("SELECT * FROM bitki WHERE org_name = @org_name", {
        ['@org_name'] = xOrgName,
        }, function (resulttwo)
          local winstwo = tonumber(resulttwo[1].wins)
          local losestwo = tonumber(resulttwo[1].loses)
          MySQL.update.await("UPDATE bitki SET loses = @loses WHERE org_name = @org_name", { 
            ['@org_name'] = xOrgName,
            ['@loses'] = tonumber(losestwo)+1
          })
          local winratio = wins/loses
          local winratiotwo = winstwo/losestwo
          sendToDiscord(
          0x03dbfc, "Organizacja: "..org.." (W:"..(tonumber(wins)+1).." L:"..loses..", Razem: "..((tonumber(wins)+1)+loses).." WR: "..winratio..")\n\n**Wygrała bitke z:** \n\nOrganizacja:"..xOrg.." (W:"..winstwo.." L:"..(tonumber(losestwo)+1)..", Razem: "..((tonumber(winstwo)+1)+losestwo).." WR: "..winratiotwo..") \n\n**Wysyłający:** "..sender.."\n**Przyjmujący:** "..recipient, screenshot, screenshot, "Bitki")
          tPlayer.showNotification("Statystki:\n"..org.." (W:"..(tonumber(wins)+1).." L:"..loses..", Razem: "..((tonumber(wins)+1)+loses).. ") WR: "..winratio)
        end)
    end)
  elseif result == "deny" then
    tPlayer.showNotification('Bitka została ~r~odrzucona')
  elseif result == "timeout" then
    tPlayer.showNotification('Czas na akceptacje bitki minął')
  end  
end)

sendToDiscord = function (color, message, img, footer)
  local embed = {
        {
            ["color"] = "15844367",
            ["title"] = "OceanRP - Bitki",
            ["description"] = message,
            ["image"] = {
              ["url"] = img,
            },
            ["footer"] = {
              ["text"] = "Wysłano: "..date.."",
              ["icon_url"] = 'https://cdn.discordapp.com/attachments/927252742903332874/1043899584415531099/OceanRP.png',
            }
        }
    }

  PerformHttpRequest('https://discord.com/api/webhooks/1039598533847814254/h2i9SWbyksrFzWzFwyE4ajI6Pn5xKe3fqHa3xkdla7cRWtcY-S775qI5OonOGesKgOcY', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
  PerformHttpRequest('https://discord.com/api/webhooks/1039598533847814254/h2i9SWbyksrFzWzFwyE4ajI6Pn5xKe3fqHa3xkdla7cRWtcY-S775qI5OonOGesKgOcY', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end