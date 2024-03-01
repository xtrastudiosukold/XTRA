RegisterNetEvent("XTRA:announceRestart")
AddEventHandler(
    "XTRA:announceRestart",
    function(a, b)
        local c = math.floor(tonumber(a))
        if a ~= nil then
            CreateThread(
                function()
                    while c ~= -1 do
                        c = c - 1
                        Wait(1000)
                    end
                end
            )
            scaleform = nil
            CreateThread(
                function()
                    while c ~= -1 do
                        scaleform = RequestScaleformMovie("MIDSIZED_MESSAGE")
                        while not HasScaleformMovieLoaded(scaleform) do
                            Wait(0)
                        end
                        PushScaleformMovieFunction(scaleform, "SHOW_SHARD_MIDSIZED_MESSAGE")
                        if b then
                            PushScaleformMovieFunctionParameterString("~r~Scheduled Server Restart")
                        else
                            PushScaleformMovieFunctionParameterString("~r~Unscheduled Server Restart")
                        end
                        if c ~= 0 then
                            PushScaleformMovieFunctionParameterString("In ~r~" .. c .. "~s~ seconds!")
                        else
                            PushScaleformMovieFunctionParameterString("~r~Restarting")
                        end
                        EndScaleformMovieMethod()
                        Wait(1000)
                    end
                end
            )
            CreateThread(
                function()
                    Wait(200)
                    while true do
                        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
                        Wait(0)
                    end
                end
            )
        end
    end
)
RegisterNetEvent("XTRA:StaffDM")
AddEventHandler(
    "XTRA:StaffDM",
    function(d)
        local scaleform = RequestScaleformMovie("MIDSIZED_MESSAGE")
        while not HasScaleformMovieLoaded(scaleform) do
            Wait(0)
        end
        PushScaleformMovieFunction(scaleform, "SHOW_SHARD_MIDSIZED_MESSAGE")
        PushScaleformMovieFunctionParameterString("~r~Staff DM")
        PushScaleformMovieFunctionParameterString(d)
        EndScaleformMovieMethod()
        local e = GetGameTimer()
        while true do
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
            Wait(0)
            local f = GetGameTimer()
            if f - e >= 5000 then
                break
            end
        end
    end
)
RegisterNetEvent(
    "XTRA:smallAnnouncement",
    function(g, h, i, j)
        tXTRA.announceMpSmallMsg(g, h, i, j)
    end
)
function tXTRA.announceMpSmallMsg(g, h, i, j)
    local k = Scaleform("MIDSIZED_MESSAGE")
    k.RunFunction("SHOW_SHARD_MIDSIZED_MESSAGE", {g, h, i, false, false})
    PlaySoundFrontend(-1, "CHECKPOINT_NORMAL", "HUD_MINI_GAME_SOUNDSET", 1)
    local l = false
    SetTimeout(
        j,
        function()
            l = true
        end
    )
    while not l do
        k.Render2D()
        Wait(0)
    end
end
