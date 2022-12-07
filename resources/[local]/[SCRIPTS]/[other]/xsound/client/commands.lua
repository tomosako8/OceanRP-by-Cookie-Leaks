-- i recommend to NOT change the command name. it will make easier for people to use this command
-- when ever is this library.. so please keep this command name on "streamermode" command
RegisterCommand("streamermode", function(source, args, rawCommand)
    disableMusic = not disableMusic
    TriggerEvent("xsound:streamerMode", disableMusic)
    if disableMusic then
        TriggerEvent("chatMessage", '🔔 SYSTEM: ', { 255, 0, 0 }, "Streamermode ON!")

        for k, v in pairs(soundInfo) do
            Destroy(v.id)
        end

    else
        TriggerEvent("chatMessage", '🔔 SYSTEM: ', { 255, 0, 0 }, "Streamermode OFF!")
    end
end, false)
