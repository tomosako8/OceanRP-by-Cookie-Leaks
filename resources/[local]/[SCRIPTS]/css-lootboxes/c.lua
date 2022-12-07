ESX = nil
PlayerData = {}

CreateThread(function()
	while ESX == nil do
		TriggerEvent('exilerp:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(100)
    end   
    PlayerData = ESX.GetPlayerData()
end)

local cfg = {
    {
        name = "1000$",
        img = "./img/5k.png",
        iType = "money",
        item = "",
        amount = 1000,
        chance = 70,
        type = "common"
    },
    {
        name = "10000$",
        img = "./img/10k.png",
        iType = "money",
        item = "",
        amount = 10000,
        chance = 20,
        type = "common"
    },
    {
        name = "25000$",
        img = "./img/25k.png",
        iType = "money",
        item = "",
        amount = 25000,
        chance = 10,
        type = "rare"
    },
    {
        name = "50000$",
        img = "./img/50k.png",
        iType = "money",
        item = "",
        amount = 50000,
        chance = 5,
        type = "legendary"
    },
    {
        name = "100000$",
        img = "./img/100k.png",
        iType = "money",
        item = "",
        amount = 100000,
        chance = 2,
        type = "legendary"
    },
}

RegisterNetEvent("exilerp:openCase", function() 
    SetNuiFocus(true, true)
    TriggerEvent("InteractSound_CL:PlayOnOne", "caseopen", 0.75)
    SendNUIMessage({
        type = "LOAD_CFG",
        cfg = json.encode(cfg)
    })
end)

RegisterNUICallback("win", function(data,cb) 
    TriggerServerEvent("exilerp:lootWin", json.encode(data))
    SetNuiFocus(false, false)
    cb({})
end)