local a = false
local b = true
RegisterCommand(
    "togglekillfeed",
    function()
        if not a then
            b = not b
            if b then
                tXTRA.notify("~g~Killfeed is now enabled")
                SendNUIMessage({type = "killFeedEnable"})
            else
                tXTRA.notify("~r~Killfeed is now disabled")
                SendNUIMessage({type = "killFeedDisable"})
            end
        end
    end
)
RegisterNetEvent(
    "XTRA:showHUD",
    function(c)
        a = not c
        if b then
            if c then
                SendNUIMessage({type = "killFeedEnable"})
            else
                SendNUIMessage({type = "killFeedDisable"})
            end
        end
    end
)
RegisterNetEvent(
    "XTRA:newKillFeed",
    function(d, e, f, g, h, i, j)
        if GetIsLoadingScreenActive() then
            return
        end
        local k = "other"
        local l = tXTRA.getPlayerName(tXTRA.getPlayerId())
        if e == l or d == l then
            k = "self"
        end
        local m = GetResourceKvpString("xtra_oldkillfeed") or "false"
        if m == "false" then
            oldKillfeed = false
        else
            oldKillfeed = true
        end
        if oldKillfeed and (tXTRA.isPlatClub() or tXTRA.isPlusClub()) then
            if g then
                tXTRA.notify("~o~" .. e .. " ~w~died.")
            else
                tXTRA.notify("~o~" .. d .. " ~w~killed ~o~" .. e .. "~w~.")
            end
        else
            SendNUIMessage(
                {
                    type = "addKill",
                    victim = e,
                    killer = d,
                    weapon = f,
                    suicide = g,
                    victimGroup = i,
                    killerGroup = j,
                    range = h,
                    uuid = tXTRA.generateUUID("kill", 10, "alphabet"),
                    category = k
                }
            )
        end
    end
)
function tXTRA.takeClientVideoAndUploadKills(a)
    exports["els"]:requestVideoUpload(
        a,
        "files[]",
        {headers = {}, isVideo = true, isManual = true, encoding = "mp4"},
        function(n)
            XTRAserver.killProcessed()
        end
    )
end
