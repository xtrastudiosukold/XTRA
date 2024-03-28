RegisterNetEvent(
    "XTRA:mutePlayers",
    function(a)
        for b, c in pairs(a) do
            exports["xtra"]:mutePlayer(c, true)
        end
    end
)
RegisterNetEvent(
    "XTRA:mutePlayer",
    function(c)
        exports["xtra"]:mutePlayer(c, true)
    end
)
RegisterNetEvent(
    "XTRA:unmutePlayer",
    function(c)
        exports["xtra"]:mutePlayer(c, false)
    end
)
RegisterNetEvent(
    "XTRA:ToggleMutePlayer",
    function(c)
        exports["xtra"]:mutePlayer(c, true)
        Citizen.Wait(60000)
        exports["xtra"]:mutePlayer(c, false)
    end
)
function unmute(c)
    MumbleSetActive(false)
end
