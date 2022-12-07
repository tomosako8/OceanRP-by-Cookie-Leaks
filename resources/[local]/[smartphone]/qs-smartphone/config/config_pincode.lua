--██████╗░██╗███╗░░██╗░█████╗░░█████╗░██████╗░███████╗
--██╔══██╗██║████╗░██║██╔══██╗██╔══██╗██╔══██╗██╔════╝
--██████╔╝██║██╔██╗██║██║░░╚═╝██║░░██║██║░░██║█████╗░░
--██╔═══╝░██║██║╚████║██║░░██╗██║░░██║██║░░██║██╔══╝░░
--██║░░░░░██║██║░╚███║╚█████╔╝╚█████╔╝██████╔╝███████╗
--╚═╝░░░░░╚═╝╚═╝░░╚══╝░╚════╝░░╚════╝░╚═════╝░╚══════╝

-- If you use a qbtarget or qtarget u can use this event
-- [[ TriggerEvent('qs-smartphone:pinCode:OpenNpc') ]]
Config.ResetPassword = {
    spawnNPC = true, -- Spawn a NPC?
    coords = vec(144.41, -222.87, 54.45),
    money = 500,
    text = "[E] - Serwis Telefonów",
    ped = {
        coords = vec3(144.41, -222.87, 54.45),
        h = 256.20,
        model = `hc_hacker`
    },
    blip = {
        coords = vec3(144.41, -222.87, 54.45),
        name = 'Serwis Telefonów',
        sprite = 89,
        color = 1,
        scale = 0.2
    },
}