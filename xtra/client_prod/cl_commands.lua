Citizen.CreateThread(
    function()
        AddTextEntry("FE_THDR_GTAO", "XTRA British RP - discord.gg/xtra5m")
        AddTextEntry("PM_PANE_CFX", "XTRA")
    end
)
RegisterCommand(
    "discord",
    function()
        TriggerEvent("chatMessage", "^1[XTRA]^1  ", {128, 128, 128}, "^0Discord: discord.gg/xtra5m", "ooc")
        tXTRA.notify("~g~discord Copied to Clipboard.")
        tXTRA.CopyToClipboard("https://discord.gg/xtra5m")
    end
)
RegisterCommand(
    "getid",
    function(a, b)
        if b and b[1] then
            if tXTRA.clientGetUserIdFromSource(tonumber(b[1])) ~= nil then
                if tXTRA.clientGetUserIdFromSource(tonumber(b[1])) ~= tXTRA.getUserId() then
                    TriggerEvent(
                        "chatMessage",
                        "^1[XTRA]^1  ",
                        {128, 128, 128},
                        "This Users Perm ID is: " .. tXTRA.clientGetUserIdFromSource(tonumber(b[1])),
                        "alert"
                    )
                else
                    TriggerEvent(
                        "chatMessage",
                        "^1[XTRA]^1  ",
                        {128, 128, 128},
                        "This Users Perm ID is: " .. tXTRA.getUserId(),
                        "alert"
                    )
                end
            else
                TriggerEvent("chatMessage", "^1[XTRA]^1  ", {128, 128, 128}, "Invalid Temp ID", "alert")
            end
        else
            TriggerEvent(
                "chatMessage",
                "^1[XTRA]^1  ",
                {128, 128, 128},
                "Please specify a user eg: /getid [tempid]",
                "alert"
            )
        end
    end
)

