Config = {}

--  _____                           _ 
-- / ____|                         | |
--| |  __  ___ _ __   ___ _ __ __ _| |
--| | |_ |/ _ \ '_ \ / _ \ '__/ _` | |
--| |__| |  __/ | | |  __/ | | (_| | |
-- \_____|\___|_| |_|\___|_|  \__,_|_|
                                   
--- @param Select between
--- @param 'old' (Esx 1.1).
--- @param 'new' (Esx 1.2, v1 final, legacy or extendedmode).
Config.esxVersion = 'new' 

--- @param This is to enable or disable video upload loading when opening a smartphone, if you use TikTok, you should set this to true.
Config.Videos = true

Config.MiniMap = true

--- @param Block all the movement while you are using the smartphone
Config.DisableMovement = false 

--- @param Do you need the item to be able to use your smartphone
Config.RequiredPhone = true 

Config.okokTextUI = {
    enable = false, -- If you use false, by default there will be DrawText3D
    colour = 'darkgreen', -- Change the color of your TextUI here
    position = 'left', -- Change the position of the TextUI here
 }

--- @param Be careful editing this because every phone need to have a frame, prop and wallpaper sets to work properly.
--- @param Name of the items with the frame.
Config.Phones = {                          
    ['classic_phone'] = 'classic_frame.png', --- @param Never remove or delete this from the first position.
    ['black_phone'] = 'black_frame.png',
    ['blue_phone'] = 'blue_frame.png',
    ['gold_phone'] = 'gold_frame.png',
    ['red_phone'] = 'red_frame.png',
    ['green_phone'] = 'green_frame.png',
    ['greenlight_phone'] = 'greenlight_frame.png',
    ['pink_phone'] = 'pink_frame.png',
    ['white_phone'] = 'white_frame.png',
    ['phone'] = 'classic_frame.png',
}

--- @param Name of the item with the prop
Config.PhonesProps = {
    ['classic_phone'] = `d3voto_iphone14_gray`, --- @param Never remove or delete this from the first position.
    ['black_phone'] = `d3voto_iphone14_black`,
    ['blue_phone'] = `d3voto_iphone14_blue`,
    ['gold_phone'] = `d3voto_iphone14_gold`,
    ['red_phone'] = `d3voto_iphone14_red`,
    ['green_phone'] = `d3voto_iphone14_green`,
    ['greenlight_phone'] = `d3voto_iphone14_green2`,
    ['pink_phone'] = `d3voto_iphone14_rose`,
    ['white_phone'] = `d3voto_iphone14_white`,
    ['phone'] = `d3voto_iphone14_gray`,
}

--- @param Name of the item with the default wallpaper.
Config.PhonesCustomWallpaper = { 
    ['classic_frame.png'] = 'b5', --- @param Never remove or delete this from the first position.
    ['black_frame.png'] = 'b4',
    ['blue_frame.png'] = 'b4',
    ['gold_frame.png'] = 'b1',
    ['red_frame.png'] = 'b3',
    ['green_frame.png'] = 'b1',
    ['greenlight_frame.png'] = 'b1',
    ['pink_frame.png'] = 'b2',
    ['white_frame.png'] = 'b1',
}


--  _   _         _    _   __  _              _    _                                   _                   
-- | \ | |  ___  | |_ (_) / _|(_)  ___  __ _ | |_ (_)  ___   _ __     ___  _   _  ___ | |_  ___  _ __ ___  
-- |  \| | / _ \ | __|| || |_ | | / __|/ _` || __|| | / _ \ | '_ \   / __|| | | |/ __|| __|/ _ \| '_ ` _ \ 
-- | |\  || (_) || |_ | ||  _|| || (__| (_| || |_ | || (_) || | | |  \__ \| |_| |\__ \| |_|  __/| | | | | |
-- |_| \_| \___/  \__||_||_|  |_| \___|\__,_| \__||_| \___/ |_| |_|  |___/ \__, ||___/ \__|\___||_| |_| |_|
--                                                                         |___/                           

--- @param  These are for non-smartphone notifications.

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

-- 
-- ▒█▀▀█ ▒█░▒█ ▒█▀▀▀█ ▀▀█▀▀ ▒█▀▀▀█ ▒█▀▄▀█ 　 ▒█▀▀▄ ▀█▀ ▒█▀▀▀█ ▒█▀▀█ ░█▀▀█ ▀▀█▀▀ ▒█▀▀█ ▒█░▒█ 
-- ▒█░░░ ▒█░▒█ ░▀▀▀▄▄ ░▒█░░ ▒█░░▒█ ▒█▒█▒█ 　 ▒█░▒█ ▒█░ ░▀▀▀▄▄ ▒█▄▄█ ▒█▄▄█ ░▒█░░ ▒█░░░ ▒█▀▀█ 
-- ▒█▄▄█ ░▀▄▄▀ ▒█▄▄▄█ ░▒█░░ ▒█▄▄▄█ ▒█░░▒█ 　 ▒█▄▄▀ ▄█▄ ▒█▄▄▄█ ▒█░░░ ▒█░▒█ ░▒█░░ ▒█▄▄█ ▒█░▒█

Config.CustomDispatch = true --- @param Use a custom dispatch script? (Jobs message only) 

--- @param 'client' excute on client side
--- @param 'server' excute on server side go to (config_server.lua 'qs-smartphone:sever:CustomServerDispatch')

Config.CustomDispatchSide = 'client' 

RegisterNetEvent('qs-smartphone:client:CustomClientDispatch', function(data, sender)

    --- @param data.phone   return the job 
    --- @param data.message return the message 
    --- @param data.type    return the type of message
    --- @param sender       return the sender of message

 
        local dispatch = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = {data.phone}, -- Data of job
            coords = dispatch.coords,
            title = '10-15 - Phone Dispatch',
            message = data.message, -- Data of messages
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            blip = {
                sprite = 431, 
                scale = 1.2, 
                colour = 3,
                flashes = false, 
                text = data.message,
                time = (5*60*1000),
                sound = 1,
            }
        }) 

end)

function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

 --- @param Leave it as default if you dont know what you are doing
Config.ScreenshotBasic = 'screenshot-basic' 
Config.RepeatTimeout = 2000 -- Don't touch here
Config.CallRepeats = 999999 -- Don't touch here
Config.WhatsappMaxMessages = 50 --- @param Recommended 50, More than 50 poor performance 
Config.DeleteStoriesAndNotifies = true -- Do you want the notifications and stories to be deleted after a certain time?
Config.MaxApp = 40 -- Dont touch.

--__      __          _                                       _                      
--\ \    / /         (_)                                     | |                     
-- \ \  / /    ___    _    ___    ___     ___   _   _   ___  | |_    ___   _ __ ___  
--  \ \/ /    / _ \  | |  / __|  / _ \   / __| | | | | / __| | __|  / _ \ | '_ ` _ \ 
--   \  /    | (_) | | | | (__  |  __/   \__ \ | |_| | \__ \ | |_  |  __/ | | | | | |
--    \/      \___/  |_|  \___|  \___|   |___/  \__, | |___/  \__|  \___| |_| |_| |_|
--                                               __/ |                               
--                                              |___/   
            
--- @param It is very important that you choose the name of your script and what voice script you use on your server.
--- @param If your voice system does not appear here, you can configure in config_calls_client and config_calls_server

--- @param Options by default
--- @param 'pma'     Most Recommended script `https://github.com/AvarianKnight/pma-voice`
--- @param 'mumble'  Deprecated script       `https://github.com/FrazzIe/mumble-voip-fivem`
--- @param 'toko'   `https://tokovoip.vip/`
--- @param 'salty'  `https://github.com/v10networkscom/saltychat-fivem` `https://gaming.v10networks.com/SaltyChat`

Config.Voice = 'pma'

--- @param That is only to verify that your script is started, it is necessary that you put the name of the folder of your script
Config.VoiceScriptName = 'pma-voice' 

--____              _                           
--|  _ \            | |        /\                
--| |_) | __ _ _ __ | | __    /  \   _ __  _ __  
--|  _ < / _` | '_ \| |/ /   / /\ \ | '_ \| '_ \ 
--| |_) | (_| | | | |   <   / ____ \| |_) | |_) |
--|____/ \__,_|_| |_|_|\_\ /_/    \_\ .__/| .__/ 
--                                  | |   | |    
--                                  |_|   |_|    

--- @param YOU CAN ONLY CHOOSE ONE

--- @param If you set true to this the bank app will use an IBAN, false to use the ID of the player.
--- @param If you use are not using Iban and the player its disconnect you will not be able to send him money.
Config.IbanBank = true         

--- @param With the option above set in true and okokBankingIban in true you will be able to use the okokBanking Alias.
Config.okokBankingIban = false  


--_____                                                   
--/ ____|                                /\                
--| |  __  __ _ _ __ __ _  __ _  ___     /  \   _ __  _ __  
--| | |_ |/ _` | '__/ _` |/ _` |/ _ \   / /\ \ | '_ \| '_ \ 
--| |__| | (_| | | | (_| | (_| |  __/  / ____ \| |_) | |_) |
--\_____|\__,_|_|  \__,_|\__, |\___| /_/    \_\ .__/| .__/ 
--                        __/ |               | |   | |    
--                       |___/                |_|   |_|    

Config.AvailableValet = true    --- @param Enable or disable the Valet button from here
Config.ValetPrice = 1000        --- @param Price to bring your vehicle to you

function VehicleKeys(vehicle)   --- @param This is for when the Valet/Garage App takes the car to you, you need to trigger your key system
    -- TriggerEvent('vehiclekeys:client:SetOwner', QBCore.Functions.GetPlate(vehicle)) -- qb-vehiclekeys default export.
 end

--__          __  _     _____  _                      
--\ \        / / | |   |  __ \| |                     
-- \ \  /\  / /__| |_  | |__) | |__   ___  _ __   ___ 
--  \ \/  \/ / _ \ __| |  ___/| '_ \ / _ \| '_ \ / _ \
--   \  /\  /  __/ |_  | |    | | | | (_) | | | |  __/
--    \/  \/ \___|\__| |_|    |_| |_|\___/|_| |_|\___|
                                                    
                                                
Config.WetPhone = true                    --- @param  Being in the water, the phone will break and will give you the same item but with the prefix "wet_".
Config.RepairWetPhone = 'phone_module'    --- @param  With said item, we can repair the wet phone.
Config.RepairWetPhoneNpc = true           --- @param  Be able to repair your phone with the NPC Telephone Technician.
Config.RepairWetPhoneNpcPrice = 100       --- @param  Price to repair a wet phone in the Technician.
Config.RepairWetPhoneNpcAccount = 'bank'  --- @param  Choose here the account to pay the technician for repairing the wet phone.

--       _       _                                    
--      | |     | |             /\                    
--      | | ___ | |__  ___     /  \   _ __  _ __  ___ 
--  _   | |/ _ \| '_ \/ __|   / /\ \ | '_ \| '_ \/ __|
-- | |__| | (_) | |_) \__ \  / ____ \| |_) | |_) \__ \
---  \____/ \___/|_.__/|___/ /_/    \_\ .__/| .__/|___/
--                                   | |   | |        
--                                   |_|   |_|        

--- @param These works will have permission to publish in the News app.
Config.WeazelJob = { 
    'journalist',
    'police',
    'sheriff',
}

--- @param Jobs available to receive Police App alerts.
Config.PoliceAppJobs = {
    [1] = 'police',
    [2] = 'sheriff',
} 

--- @param Default contacts

--- @param job  'Name of job who will receive the message'
--- @param name 'Visible label'
--- @param img  'Image of contact'
--- If you use a custom dispatch you can configure it in line 130 of config_client
Config.Jobs = {
    { job = 'police', name = 'SASP' , img = './img/apps/police.png'},
    { job = 'sheriff', name = 'SASD' , img = './img/apps/police.png'},
    { job = 'ambulance', name = 'SAMS', img = './img/apps/ambulance.png'},
    { job = 'mechanik', name = 'SACM', img = './img/apps/mechanic.png'},
}

--- @param IMPORTANT these are commands to receive or not receive messages NO MESSAGE IS SENT WITH THESE.
--- @param to put it another way it is to enter and exit of duty.
Config.jobCommands = { -- Just enter a number here, this is the number that will appear when you call.
    ["police"] = "911",
    ["sheriff"] = "912",
    ["ambulance"] = "913",
    ["mechanik"] = "914",
}

--  ____        _                                    
-- / __ \      (_)                 /\                
--| |  | |_ __  _  ___  _ __      /  \   _ __  _ __  
--| |  | | '_ \| |/ _ \| '_ \    / /\ \ | '_ \| '_ \ 
--| |__| | | | | | (_) | | | |  / ____ \| |_) | |_) |
-- \____/|_| |_|_|\___/|_| |_| /_/    \_\ .__/| .__/ 
--                                     | |   | |    
--                                     |_|   |_|    

Config.WeaponsItems = false               --- @param This will work for Onion Browser, weapons are items?
Config.BlackMarketAccount = 'bank' --- @param Account with which you want to pay in Onion Browser.


--- @param Onion Browser items.
Config.Darkweb = { 
    List = {    
        --- @param It is important that you follow the order of the numbers [1], [2], [3]...
        --- @param item     'Item name'
        --- @param label    'label that will show in the app'
        --- @param isItem   false 'Is a weapons' true 'is a item'
        --- @param price    'Price of the product'


        -- [9] = { item = 'laptop', label = 'Hacker Laptop', isItem = true, price = 700}, -- If you use `Config.WeaponsItems = false` then you can choose if it's an item with `isItem = true`.
    },
}

--____              _   _        _____           _                 
--|  _ \            | | | |      / ____|         | |                
--| |_) | ___   ___ | |_| |__   | (___  _   _ ___| |_ ___ _ __ ___  
--|  _ < / _ \ / _ \| __| '_ \   \___ \| | | / __| __/ _ \ '_ ` _ \ 
--| |_) | (_) | (_) | |_| | | |  ____) | |_| \__ \ ||  __/ | | | | |
--|____/ \___/ \___/ \__|_| |_| |_____/ \__, |___/\__\___|_| |_| |_|
--                                       __/ |                      
--                                      |___/      
                 
--- @param Do you want to enable the phone booths?
Config.EnableBooth = false 
Config.QtargetBooth = false -- COMING SOON 

--- @param Configure here the props that will be phone booths.
Config.Booth = { 
    [1158960338] = true, --- @param hash of booths
    [1511539537] = true,
    [1281992692] = true,
    [-429560270] = true,
    [-1559354806] = true,
    [-78626473] = true,
    [295857659] = true,
    [-2103798695] = true,
    [-870868698] = true,
    [-1126237515] = true,
    [506770882] = true,
    -- You can add more!
}

-- ██╗███╗░░░███╗██████╗░░█████╗░██████╗░████████╗░█████╗░███╗░░██╗████████╗  ████████╗░█████╗░
-- ██║████╗░████║██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗████╗░██║╚══██╔══╝  ╚══██╔══╝██╔══██╗
-- ██║██╔████╔██║██████╔╝██║░░██║██████╔╝░░░██║░░░███████║██╔██╗██║░░░██║░░░  ░░░██║░░░██║░░██║
-- ██║██║╚██╔╝██║██╔═══╝░██║░░██║██╔══██╗░░░██║░░░██╔══██║██║╚████║░░░██║░░░  ░░░██║░░░██║░░██║
-- ██║██║░╚═╝░██║██║░░░░░╚█████╔╝██║░░██║░░░██║░░░██║░░██║██║░╚███║░░░██║░░░  ░░░██║░░░╚█████╔╝
-- ╚═╝╚═╝░░░░░╚═╝╚═╝░░░░░░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚══╝░░░╚═╝░░░  ░░░╚═╝░░░░╚════╝░
-- 
-- ██████╗░███████╗░█████╗░██████╗░
-- ██╔══██╗██╔════╝██╔══██╗██╔══██╗
-- ██████╔╝█████╗░░███████║██║░░██║
-- ██╔══██╗██╔══╝░░██╔══██║██║░░██║
-- ██║░░██║███████╗██║░░██║██████╔╝
-- ╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝╚═════╝░

--[[

    BEFORE YOU CONTINUE READ THIS

    If you are going to make any changes in these apps.
    How to translate them, change the order, delete them.

    It is very important that you USE the /deletallapps command in your server console and then restart the server.

    IF YOU DO NOT DO this the apps will continue as before

]]

-- ██████╗░███████╗███████╗░█████╗░██╗░░░██╗██╗░░░░░████████╗   ░█████╗░██████╗░██████╗░░██████╗
-- ██╔══██╗██╔════╝██╔════╝██╔══██╗██║░░░██║██║░░░░░╚══██╔══╝   ██╔══██╗██╔══██╗██╔══██╗██╔════╝
-- ██║░░██║█████╗░░█████╗░░███████║██║░░░██║██║░░░░░░░░██║░░░   ███████║██████╔╝██████╔╝╚█████╗░
-- ██║░░██║██╔══╝░░██╔══╝░░██╔══██║██║░░░██║██║░░░░░░░░██║░░░   ██╔══██║██╔═══╝░██╔═══╝░░╚═══██╗
-- ██████╔╝███████╗██║░░░░░██║░░██║╚██████╔╝███████╗░░░██║░░░   ██║░░██║██║░░░░░██║░░░░░██████╔╝
-- ╚═════╝░╚══════╝╚═╝░░░░░╚═╝░░╚═╝░╚═════╝░╚══════╝░░░╚═╝░░░   ╚═╝░░╚═╝╚═╝░░░░░╚═╝░░░░░╚═════╝░
 
Config.PhoneApplications = {
    --- @param Pre-installed applications (If you modify them, remember to empty the "apps" column of your sql "users").

    --[[   
        -- Example app DONT UNCOMMENT
        [1] = {                             -- Slot id, 'It is important that you follow the order of the numbers [1], [2], [3]....'
            custom = false,                 -- Is a custom app?
            app = "phone",                  -- name of app (dont touch if it is not custom).
            color = "img/apps/phone.png",   -- App visual image.
            tooltipText = "Phone",          -- Name on smartphone (Traslate if you want).
            tooltipPos = "top",             -- Ignore.
            job = false,                    -- Ignore.
            blockedjobs = {},               -- Ignore.
            slot = 1,                       -- Slot where the app will appear.
            Alerts = 0,                     -- Alerts that will appear in the app as soon as you use the phone.
            bottom = true                   -- Ignore.
        }, 
    ]]
    [1] = { --- @param -- Slot id, 'It is important that you follow the order of the numbers [1], [2], [3]....'
        custom = false, -- 
        app = "phone", -- App label.
        color = "img/apps/phone.png", -- App visual image.
        tooltipText = "Phone", -- Ignore.
        tooltipPos = "top", -- Ignore.
        job = false, -- Ignore.
        blockedjobs = {}, -- Ignore.
        slot = 1, -- Slot where the app will appear.
        Alerts = 0, -- Alerts that will appear in the app as soon as you use the phone.
        bottom = true -- Ignore.
    },
    [2] = {
        custom = false,
        app = "photos",
        color = "img/apps/gallery.png",
        tooltipText = "Gallery",
        job = false,
        slot = 2,
        blockedjobs = {},
        Alerts = 0,
        bottom = true
    },
    [3] = {
        custom = false,
        app = "messages",
        color = "img/apps/messages.png",
        tooltipText = "Messages",
        job = false,
        blockedjobs = {},
        slot = 3,
        Alerts = 0,
        bottom = true
    },
    [4] = {
        custom = false,
        app = "safari",
        color = "img/apps/safari.png",
        tooltipText = "Safari",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 4,
        Alerts = 0,
        bottom = true
    },
    [5] = {
        custom = false,
        app = "mail",
        color = "img/apps/mail.png",
        tooltipText = "Mail",
        job = false,
        slot = 5,
        blockedjobs = {},
        Alerts = 0
    },
    [6] = {
        custom = false,
        app = "calendar",
        color = "img/apps/calendar.png",
        tooltipText = "Calendar",
        job = false,
        blockedjobs = {},
        slot = 6,
        Alerts = 0
    },
    [7] = {
        custom = false,
        app = "camera",
        color = "img/apps/camera.png",
        tooltipText = "Camera",
        job = false,
        slot = 7,
        blockedjobs = {},
        Alerts = 0
    },
    [8] = {
        custom = false,
        app = "store",
        color = "img/apps/appstore.png",
        tooltipText = "App Store",
        job = false,
        blockedjobs = {},
        slot = 8,
        Alerts = 0
    },
    [9] = {
        custom = false,
        app = "clock",
        color = "img/apps/clock.png",
        tooltipText = "Clock",
        job = false,
        blockedjobs = {},
        slot = 9,
        Alerts = 0
    },
    [10] = {
        custom = false,
        app = "ping",
        color = "img/apps/ping.png",
        tooltipText = "Ping",
        job = false,
        blockedjobs = {},
        slot = 10,
        Alerts = 0
    },
    [11] = {
        custom = false,
        app = "tips",
        color = "img/apps/tips.png",
        tooltipText = "Tips",
        job = false,
        slot = 11,
        blockedjobs = {},
        Alerts = 1
    },
    [12] = {
        custom = false,
        app = "calculator",
        color = "img/apps/calculator.png",
        tooltipText = "Calculator",
        job = false,
        blockedjobs = {},
        slot = 12,
        Alerts = 0
    },
    [13] = {
        custom = false,
        app = "bank",
        color = "img/apps/bank.png",
        tooltipText = "Wallet",
        job = false,
        blockedjobs = {},
        slot = 13,
        Alerts = 0
    },
    [14] = {
        custom = false,
        app = "weather",
        color = "img/apps/weather.png",
        tooltipText = "Weather",
        job = false,
        slot = 14,
        blockedjobs = {},
        Alerts = 0
    },
    [15] = {
        custom = false,
        app = "notes",
        color = "img/apps/notes.png",
        tooltipText = "Notes",
        job = false,
        slot = 15,
        blockedjobs = {},
        Alerts = 0
    },
    [16] = {
        custom = false,
        app = "settings",
        color = "img/apps/settings.png",
        tooltipText = "Settings",
        job = false,
        blockedjobs = {},
        slot = 16,
        Alerts = 0
    },
    [17] = {
        custom = false,
        app = "business",
        color = "img/apps/business.png",
        tooltipText = "Business",
        job = false,
        slot = 17,
        blockedjobs = {},
        Alerts = 0
    },

    -- Temple for custom app!
    -- Check in docuementation for more info.
    --[[ [19] = {
        custom = true,
        app = "example",     
        color = "img/apps/example.png",
        tooltipText = "Example",
        job = false,
        slot = 19,
        blockedjobs = {},
        Alerts = 0
    }, ]]
}

Config.StoreAppToday = {
    {
        header = 'TIKTOK',
        head = 'Odkrywaj, oglądaj i doświadczaj!',
        image = 'https://i.imgur.com/nHoGMo4.jpeg',
        footer = 'TikTok to globalna społeczność krótkich filmów.',
        textcolor = 'white'
    },
    {
        header = 'NEW VERSION!',
        head = 'Ciesz się iQS 2.0 i jego pięknym designem',
        image = 'https://i.imgur.com/uPLQMVZ.png',
        footer = 'Twój smartfon ma teraz iQS 2.0!',
        textcolor = 'white'
    },
}

Config.StoreApps = {
    -- Apps from the App Store.
    ["instagram"] = {
        custom = false, -- Is custom app?
        app = "instagram", -- App label.
        color = "img/apps/instagram.png", -- App visual image.
        tooltipText = "Instagram", -- Visual app name.
        tooltipPos = "top", -- Ignore.
        job = false, -- If you want this app to work only with jobs, put them inside ' '.
        blockedjobs = {}, -- If you want this app to crash with jobs, put them inside {}.
        slot = 18, -- Slot where the app will be installed.
        Alerts = 0, -- Ignore.
        creator = "Instagram, Inc.​",
        password = false,
        isGame = false,
        description = "Darmowa - oferuje zakupy w aplikacji.",
        score = "4.25", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = "22.5M Ratings",
        age = "16+",
        extraDescription = {
            {
                header = "INSTAGRAM",
                head = "Ciesz się ze swoimi znajomymi!",
                image = "https://i.imgur.com/nhyfbJs.png",
                footer = "Zbliża Cię do rzeczy i ludzi, których kochasz.",
                textcolor = 'white'
            }
        }
    },
    ["garage"] = {
        custom = false,
        app = "garage",
        color = "img/apps/garages.png",
        tooltipText = "My Garage",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 19,
        creator = "Raffaele Di Marzo.​",
        Alerts = 0,
        password = false,
        isGame = false,
        description = "Zarządzaj danymi swoich pojazdów.",
        score = "3.75", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = "48 Ratings",
        age = "18+",
        extraDescription = {
            {
                header = "MY GARAGE",
                head = "Zarządzaj swoimi pojazdami.",
                image = "https://i.imgur.com/Pv9W8iP.png",
                footer = "Mój Garaż to aplikacja przeznaczona dla wszystkich właścicieli samochodów, motocykli lub innych pojazdów.",
                textcolor = 'white'
            }
        }
    },
    ["whatsapp"] = {
        custom = false,
        app = "whatsapp",
        color = "img/apps/whatsapp.png",
        tooltipText = "WhatsApp",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 20,
        creator = "WhatsApp Inc.",
        Alerts = 0,
        password = false,
        isGame = false,
        description = "Prosty. Wiarygodny. Prywatny.",
        score = "4", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = "9.6M Ratings",
        age = "16+",
        extraDescription = {
            {
                header = "WHATSAPP",
                head = "#3 w sieciach społecznościowych",
                image = "https://www.cronista.com/files/image/336/336154/60cb8a40b2548.jpg",
                footer = "WhatsApp z Facebooka to BEZPŁATNA aplikacja do przesyłania wiadomości i połączeń wideo.",
                textcolor = 'white'
            }
        }
    },
    ["twitter"] = {
        custom = false,
        app = "twitter",
        color = "img/apps/twitter.png",
        tooltipText = "Twitter",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 21,
        creator = "Twitter, Inc.",
        Alerts = 0,
        password = false,
        isGame = false,
        description = "Darmowa aplikacja",
        score = "3.75", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = "19.3M Ratings",
        age = "17+",
        extraDescription = {
            {
                header = "TWITTER",
                head = "Jesteś gotowy postować?",
                image = "https://d500.epimg.net/cincodias/imagenes/2022/01/07/gadgets/1641568079_017034_1641569592_noticia_normal.jpg",
                footer = "Zacznij odkrywać Twitter'a już teraz!",
                textcolor = 'white'
            }
        }
    },
    ["advert"] = {
        custom = false,
        app = "advert",
        color = "img/apps/yellow_pages.png",
        tooltipText = "Yellow Pages",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 22,
        creator = "YELLOWPAGES.COM LLC.​",
        Alerts = 0,
        password = false,
        isGame = false,
        description = "Znajdź lokalne firmy w pobliżu.",
        score = "4", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = "36.1K Ratings",
        age = "4+",
        extraDescription = {
            {
                header = "YELLOW PAGES",
                head = "Reklamuj swoje artykuły tutaj.",
                image = "https://thumbs.dreamstime.com/b/portsmouth-hampshire-uk-mobile-phone-cell-being-held-hand-yellow-pages-app-open-screen-209900632.jpg",
                footer = "Ponad 30 000 osób publikuje tutaj swoje artykuły!",
                textcolor = 'white'
            }
        }
    },
    ["tinder"] = {
        custom = false,
        app = "tinder",
        color = "img/apps/tinder.png",
        tooltipText = "Tinder",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 23,
        creator = "Tinder Inc.​",
        Alerts = 0,
        password = false,
        isGame = false,
        description = "Rozmawiaj i poznawaj nowych ludzi!",
        score = "4.25", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = "10.5M Ratings",
        age = "16+",
        extraDescription = {
            {
                header = "TINDER",
                head = "Z 30 miliardami dopasowań do tej pory!",
                image = "https://d500.epimg.net/cincodias/imagenes/2020/01/23/lifestyle/1579788462_071828_1579788504_noticia_normal.jpg",
                footer = "Tinder to najpopularniejsza aplikacja na świecie do poznawania nowych ludzi.",
                textcolor = 'white'
            }
        }
    },
    ["youtube"] = {
        custom = false,
        app = "youtube",
        color = "img/apps/youtube.png",
        tooltipText = "YouTube",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 24,
        creator = "Google LLC.​",
        Alerts = 0,
        password = false,
        isGame = false,
        description = "Filmy, muzyka i transmisje na żywo",
        score = "3.25", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = "24.3M Ratings",
        age = "17+",
        extraDescription = {
            {
                header = "YOUTUBE",
                head = "Twoje ulubione filmy i twórcy.",
                image = "https://f.hellowork.com/blogdumoderateur/2021/05/youtube-mobile-pc.jpg",
                footer = "Odkryj dużą liczbę filmów i twórców treści!",
                textcolor = 'white'
            }
        }
    },
    ["uber"] = {
        custom = false,
        app = "uber",
        color = "img/apps/uber.png",
        tooltipText = "Uber Eats",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 25,
        creator = "Uber Technologies, Inc.​",
        Alerts = 0,
        password = false,
        isGame = false,
        description = "Każde zamówienie na wynos pod Twoje drzwi!",
        score = "3.75", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = "4.9M Ratings",
        age = "12+",
        extraDescription = {
            {
                header = "UBER EATS",
                head = "Znajdź dostawę jedzenia w ramach swojego budżetu.",
                image = "https://s03.s3c.es/imag/_v0/770x420/e/5/f/uber-eats.jpg",
                footer = "Rozpocznij pracę już teraz, jednym kliknięciem!",
                textcolor = 'white'
            }
        }
    },
    ["darkweb"] = {
        custom = false,
        app = "darkweb",
        color = "img/apps/darkweb.png",
        tooltipText = "Onion Browser",
        tooltipPos = "top",
        job = false,
        blockedjobs = {"police", "offpolice", "sheriff", "offsheriff"},
        slot = 26,
        creator = "Mike Tigas.​",
        Alerts = 0,
        password = false,
        isGame = false,
        description = "Bezpieczna, anonimowa sieć z Torem.",
        score = "3.25", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = "1.2K Ratings",
        age = "18+",
        extraDescription = {
            {
                header = "ONION OR TOR",
                head = "Bezpieczna, anonimowa strona internetowa/sklep z Torem",
                image = "https://www.adslzone.net/app/uploads-adslzone.net/2018/09/tor-browser-android.jpg?x=480&y=375&quality=40",
                footer = "Najlepszą obecnie ofertą związaną z Torem na iOS jest przeglądarka Onion Browser",
                textcolor = 'white'
            }
        }
    },
    ["state"] = {
        custom = false,
        app = "state",
        color = "img/apps/workspace.png",
        tooltipText = "State",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 28,
        creator = "San Andreas Inc.​",
        Alerts = 0,
        password = false,
        isGame = false,
        description = "Skontaktuj się z pracownikami San Andreas.",
        score = "4.25", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = " 12M Ratings",
        age = "4+",
        extraDescription = {
            {
                header = "STATE",
                head = "Policja, karetki pogotowia i wiele więcej tutaj",
                image = "https://cdn.oldskull.net/wp-content/uploads/2014/12/los-santos-ciudad-de-gta.jpg",
                footer = "Skontaktuj się z nimi bezpośrednio.",
                textcolor = 'white'
            }
        }
    },
    ["meos"] = {
        custom = false,
        app = "meos",
        color = "img/apps/police.png",
        tooltipText = "Police",
        tooltipPos = "top",
        job = {"police", "sheriff"},
        blockedjobs = {},
        slot = 29,
        creator = "SA Department.​",
        Alerts = 0,
        password = false,
        isGame = false,
        description = "Ekskluzywny MDT dla policjantów.",
        score = "5", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = " 12 Ratings",
        age = "18+",
        extraDescription = {
            {
                header = "MDT",
                head = "Baza danych dla policji!",
                image = "https://i.imgur.com/xIn2bWQ.png",
                footer = "Ludzie są bezpieczni dzięki Twojej pracy.",
                textcolor = 'white'
            }
        }
    },
    ["jump"] = {
        custom = false,
        app = "jump",
        color = "img/apps/jump.png",
        tooltipText = "Doodle Jump",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 30,
        creator = "Hydra Dev.​",
        Alerts = 0,
        password = false,
        isGame = true,
        description = "Szalenie wciągająca!",
        score = "4.75", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = " 660 Ratings",
        age = "4+",
        extraDescription = {
            {
                header = "DOODLE JUMP",
                head = "UWAGA: Szalenie wciągająca!",
                image = "https://thumbs.gfycat.com/ContentEnragedIridescentshark-size_restricted.gif",
                footer = "Bardzo fajna gra w skoki!",
                textcolor = 'white'
            }
        }
    },
    ["spotify"] = {
        custom = false,
        app = "spotify",
        color = "img/apps/spotify.png",
        tooltipText = "Spotify",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 31,
        creator = "Spotify AB.​",
        Alerts = 0,
        password = false,
        isGame = false,
        description = "Odtwórz swoją muzykę!",
        score = "4.75", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = "25M Ratings",
        age = "12+",
        extraDescription = {
            {
                header = "SPOTIFY",
                head = 'Odtwórz swoją muzykę"',
                image = "https://indiehoy.com/wp-content/uploads/2021/04/spotify-logo.jpg",
                footer = "Posłuchaj kilku utworów w radiu spotify.",
                textcolor = 'white'
            }
        }
    },
    ["flappy"] = {
        custom = false,
        app = "flappy",
        color = "img/apps/flappy.png",
        tooltipText = "Flappy Bird",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 32,
        creator = "Essendon Studios.​",
        Alerts = 0,
        password = false,
        isGame = true,
        description = "Skacz ze swoim ptakiem dookoła świata!",
        score = "4.75", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = "2M Ratings",
        age = "12+",
        extraDescription = {
            {
                header = "FLAPPY BIRD",
                head = "Skacz ze swoim ptakiem dookoła świata!",
                image = "https://deblogsyjuegos.files.wordpress.com/2015/10/flappygif.gif",
                footer = "Baw się dobrze z nowym Flappy Bird!",
                textcolor = 'white'
            }
        }
    },
    ["kong"] = {
        custom = false,
        app = "kong",
        color = "img/apps/kong.png",
        tooltipText = "Donkey Kong",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 33,
        creator = "Nintendo Inc.​",
        Alerts = 0,
        password = false,
        isGame = true,
        description = "Uratuj księżniczkę!",
        score = "2.25", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = "3M Ratings",
        age = "4+",
        extraDescription = {
            {
                header = "DONKEY KONG",
                head = "Uratuj księżniczkę!",
                image = "https://i.gifer.com/1INx.gif",
                footer = "Graj jako Mario, aby uratować księżniczkę Peach ze szponów Donkey Konga!",
                textcolor = 'white'
            }
        }
    },
    ["pacman"] = {
        custom = false,
        app = "pacman",
        color = "img/apps/pacman.png",
        tooltipText = "PAC-MAN",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 34,
        creator = "BANDAI NAMCO Inc.​",
        Alerts = 0,
        password = false,
        isGame = true,
        description = "PAC-MAN wprowadza tryb fabularny!",
        score = "4", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = "1M Ratings",
        age = "18+",
        extraDescription = {
            {
                header = "PAC-MAN",
                head = "PAC-MAN wprowadza tryb fabularny!",
                image = "https://cl.buscafs.com/www.sandiegored.com/public/uploads/images/112453.gif",
                footer = "Wybierz się w ekscytującą podróż, poznaj różne układy labiryntów z przeszkodami",
                textcolor = 'white'
            }
        }
    },
    ["group-chats"] = {
        custom = false,
        app = "group-chats",
        color = "img/apps/discord.png",
        tooltipText = "Discord",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 35,
        creator = "Discord Inc.​",
        Alerts = 0,
        password = false,
        isGame = false,
        description = "Czatuj, rozmawiaj i dołączaj!",
        score = "4.5", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = "100M Ratings",
        age = "16+",
        extraDescription = {
            {
                header = "Discord",
                head = "Czatuj, rozmawiaj i dołączaj!",
                image = "https://cdn1.epicgames.com/salesEvent/salesEvent/egs-discord-discord-s1-2560x1440-51474ee7abe3_2560x1440-e14a2b58e93768f0abc47dbf62a4ee86",
                footer = "Najlepsza strona do czatowania i tworzenia kanałów!",
                textcolor = 'white'
            }
        }
    },
    ["uberDriver"] = {
        custom = false,
        app = "uberDriver",
        color = "img/apps/uberDriver.png",
        tooltipText = "Uber",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 36,
        creator = "Uber Technologies, Inc.",
        Alerts = 0,
        password = false,
        isGame = false,
        description = "Zamawiaj wycieczki, kiedy tylko chcesz",
        score = "4", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = "12M Ratings",
        age = "16+",
        extraDescription = {
            {
                header = "Uber",
                head = "Zamawiaj wycieczki, kiedy tylko chcesz",
                image = "https://www.autofacil.es/wp-content/uploads/2021/05/coche_uber.jpg",
                footer = "W Uber zobowiązujemy się do zapewnienia Ci bezpieczeństwa.",
                textcolor = 'white'
            }
        }
    },
    ["weazel"] = {
        custom = false,
        app = "weazel",
        color = "img/apps/weazel.png",
        tooltipText = "News",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 37,
        creator = "iOS Basics",
        Alerts = 0,
        password = false,
        isGame = false,
        description = "Odkryj wszystkie świeże wiadomości",
        score = "4.75", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = "18M Ratings",
        age = "9+",
        extraDescription = {
            {
                header = "News",
                head = "Dziennikarze całego San Andreas!",
                image = "https://cdn.neow.in/news/images/uploaded/2020/02/1580744740_og__divs9jfd19aq.jpg",
                footer = "Odkryj wszystkie świeże wiadomości.",
                textcolor = 'white'
            }
        }
    },
    ["tiktok"] = {
        custom = false,
        app = "tiktok",
        color = "img/apps/tiktok.png",
        tooltipText = "Tiktok",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 38,
        creator = "TikTok Pte. Ltd.",
        Alerts = 0,
        password = false,
        isGame = false,
        description = "TikTok to globalna społeczność krótkich filmów.",
        score = "5", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = "900M Ratings",
        age = "9+",
        extraDescription = {
            {
                header = "TikTok",
                head = "TikTok to globalna społeczność krótkich filmów.",
                image = "https://images.squarespace-cdn.com/content/v1/5bdb42a389c17245c5eb0aea/1606778098553-58GZBC84IKL7Z38WV0KC/TikTok-Case-Study-Header.gif?format=2500w",
                footer = "Dzięki tej aplikacji możesz odkrywać, tworzyć i edytować niesamowite filmy",
                textcolor = 'white'
            }
        }
    },
    ["tower"] = {
        custom = false,
        app = "tower",
        color = "img/apps/tower.png",
        tooltipText = "City Building",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 39,
        creator = "Cool Happy",
        Alerts = 0,
        password = false,
        isGame = true,
        description = "Szczęśliwa gra o budowie domu z wieżą",
        score = "3.75", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = "20K Ratings",
        age = "9+",
        extraDescription = {
            {
                header = "City Building",
                head = "Szczęśliwy zabawny dom",
                image = "https://is1-ssl.mzstatic.com/image/thumb/Purple122/v4/dd/09/0d/dd090df4-bf4c-788f-62e0-ca006227886d/source/512x512bb.jpg",
                footer = "Szczęśliwa gra o budowie domu z wieżą",
                textcolor = 'white'
            }
        }
    },
    ["labyrinth"] = {
        custom = false,
        app = "labyrinth",
        color = "img/apps/labyrinth.png",
        tooltipText = "Maze Puzzle Game",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 40,
        creator = "iOS Basics",
        Alerts = 0,
        password = false,
        isGame = true,
        description = "Klasyczna gra w labirynt, w której kontrolujesz piłkę",
        score = "4", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = "100K Ratings",
        age = "9+",
        extraDescription = {
            {
                header = "Maze Puzzle Game",
                head = "Klasyczna gra w labirynt, w której kontrolujesz piłkę",
                image = "https://i.ytimg.com/vi/JRXC2A9Hgl0/maxresdefault.jpg",
                footer = "Zagraj w najlepszą grę labiryntową na telefonie komórkowym",
                textcolor = 'white'
            }
        }
    },
    ["radio"] = {
        custom = false,
        app = "radio",
        color = "img/apps/radio.png",
        tooltipText = "Radio",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 42,
        creator = "LS Radio Inc.​",
        Alerts = 0,
        password = false,
        isGame = false,
        description = "Praca radiowa dla wszystkich użytkowników.",
        score = "3.25", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = " 332 Ratings",
        age = "16+",
        extraDescription = {
            {
                header = "RADIO",
                head = "Radio do łączenia się z wieloma częstotliwościami!",
                image = "https://i.imgur.com/ENBVOUI.png",
                footer = "Komunikuj się szybko i bezpiecznie.",
                textcolor = 'black'
            }
        }
    },

    -- Temple for custom app!
    -- Check in docuementation for more info.
    --[[ ['example'] = {
        custom = true,
        app = "example",
        color = "./img/apps/example.png",
        background = "#FFFFFF",
        tooltipText = "Example",
        tooltipPos = 'top',
        job = false,
        blockedjobs = {},
        slot = 44,
        creator = "Lucceti's Pizza, Inc.",
        Alerts = 0,
        password = false,
        isGame = false,
        description = 'Request Pizza Deliveries',
        score = '4', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = '12M Ratings',
        age = '3+',
        extraDescription = {
            {
                header = 'Uber',
                head = 'Request Pizza Deliveries',
                image = 'https://www.autofacil.es/wp-content/uploads/2021/05/coche_uber.jpg',
                footer = 'In Uber we commit ourselves to your security.',
                textcolor = 'white'
            }
        }
    }, ]]
    --[[ ['rentel'] = { -- Rental DLC.
        custom = false,
        app = "rentel",
        color = "img/apps/rentel.png",
        tooltipText = "Nextbike",
        tooltipPos = 'top',
        job = false,
        blockedjobs = {},
        slot = 45,
        creator = "nextbike.​",
        Alerts = 0,
        password = false,
        isGame = false,
        description = 'Start cycling!',
        score = '3.50', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = '333 Ratings',
        age = '4+',
        extraDescription = {
            {
                header = 'NEXTBIKE',
                head = 'The best bike rental app!',
                image = 'https://i.imgur.com/WPzp1PV.png',
                footer = 'Find bike rental areas or even make friends!',
                textcolor = 'white'
            }
        }
    }, ]]
    --[[ ['racing'] = { -- Racing DLC.
        custom = false,
        app = "racing",
        color = "img/apps/racing.png",
        tooltipText = "Racing",
        tooltipPos = 'top',
        job = false,
        blockedjobs = {'police'},
        slot = 46,
        creator = "Los Santos Customs.​",
        Alerts = 0,
        password = false,
        isGame = false,
        description = 'Los Santos Illegal Racing App.',
        score = '4.25', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = '5M Ratings',
        age = '16+',
        extraDescription = {
            {
                header = 'RACING',
                head = 'Illegal racing in Los Santos!',
                image = 'https://i.imgur.com/OJ4Zxtn.png',
                footer = 'Application created by LS Customs, to provide comfort to drivers.',
                textcolor = 'white'
            }
        }
    }, ]] 
}