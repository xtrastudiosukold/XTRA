local a = {}
local b = {}
local c = ""
local d = {"Silver", "Gold", "Plat"}
local e = 1
RMenu.Add(
    "XTRA",
    "crate",
    RageUI.CreateMenu(
        "",
        "Open Crates",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "xtra_crate",
        "xtra_crate"
    )
)
RMenu.Add(
    "XTRA",
    "redeem",
    RageUI.CreateSubMenu(
        RMenu:Get("XTRA", "crate"),
        "",
        "Redeem Keys",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight()
    )
)
RageUI.CreateWhile(
    1.0,
    true,
    function()
        if RageUI.Visible(RMenu:Get("XTRA", "crate")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    if a and a.plat and a.plat > 0 then
                        RageUI.Separator("Plat Keys: " .. a.plat)
                    end
                    if a and a.gold and a.gold > 0 then
                        RageUI.Separator("Gold Keys: " .. a.gold)
                    end
                    if a and a.silver and a.silver > 0 then
                        RageUI.Separator("Silver Keys: " .. a.silver)
                    end
                    if a and a.plat and a.plat == 0 and a.gold and a.gold == 0 and a.silver and a.silver == 0 then
                        RageUI.Separator("You have no keys to redeem!")
                    end
                    if a and a.silver > 0 or a and a.gold > 0 or a and a.plat > 0 then
                        RageUI.List(
                            "Redeem Key",
                            d,
                            e,
                            nil,
                            {},
                            true,
                            function(f, g, h, i)
                                e = i
                                if h then
                                    TriggerServerEvent("XTRA:Crate:Redeem", d[i])
                                end
                            end
                        )
                    end
                end,
                function()
                end
            )
        end
    end
)
RegisterNetEvent("XTRA:Crate:SendData")
AddEventHandler(
    "XTRA:Crate:SendData",
    function(j, k)
        a = j
        b = k
        RageUI.Visible(RMenu:Get("XTRA", "crate"), true)
    end
)
RegisterCommand(
    "keys",
    function()
        TriggerServerEvent("XTRA:Crate:OpenMenu")
    end
)
RegisterNetEvent("XTRA:Crate:StartRedeem")
AddEventHandler(
    "XTRA:Crate:StartRedeem",
    function(l)
        c = l
        RageUI.ActuallyCloseAll()
        RageUI.Visible(RMenu:Get("XTRA", "crate"), false)
        tXTRA.StartScaleForm(c)
    end
)
function tXTRA.StartScaleForm(m)
    local n = RequestScaleformMovie("MP_BIG_MESSAGE_FREEMODE")
    while not HasScaleformMovieLoaded(n) do
        Citizen.Wait(0)
    end
    local o = 1
    local p = 5
    local q = GetGameTimer()
    local r = true
    local s = false
    local t = 0
    while true do
        Citizen.Wait(1)
        if r then
            local u = GetGameTimer()
            local v = (u - q) / 1000
            if v >= p then
                r = false
                s = true
                t = GetGameTimer()
            end
            local w = b[o]
            BeginScaleformMovieMethod(n, "SHOW_SHARD_WASTED_MP_MESSAGE")
            PushScaleformMovieFunctionParameterString("~b~Opening Crate")
            PushScaleformMovieMethodParameterString(w.name)
            PushScaleformMovieMethodParameterString(" ")
            PushScaleformMovieMethodParameterInt(10)
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterInt(0)
            PushScaleformMovieMethodParameterInt(0)
            PushScaleformMovieMethodParameterInt(0)
            PushScaleformMovieMethodParameterInt(0)
            PushScaleformMovieMethodParameterInt(0)
            EndScaleformMovieMethod()
            o = o + 1
            if o > #b then
                o = 1
            end
        end
        if s then
            local u = GetGameTimer()
            local v = (u - t) / 1000
            if v < 5 then
                local x = b[o]
                BeginScaleformMovieMethod(n, "SHOW_SHARD_WASTED_MP_MESSAGE")
                PushScaleformMovieFunctionParameterString("~g~Opened Crate")
                PushScaleformMovieMethodParameterString("You got: " .. m)
                PushScaleformMovieMethodParameterInt(5)
                PushScaleformMovieMethodParameterInt(1)
                PushScaleformMovieMethodParameterInt(1)
                PushScaleformMovieMethodParameterInt(0)
                PushScaleformMovieMethodParameterInt(0)
                PushScaleformMovieMethodParameterInt(0)
                PushScaleformMovieMethodParameterInt(0)
                PushScaleformMovieMethodParameterInt(0)
                EndScaleformMovieMethod()
            else
                s = false
                Citizen.Wait(2000)
                SetScaleformMovieAsNoLongerNeeded(n)
                TriggerServerEvent("XTRA:OpenStore")
                return
            end
        end
        DrawScaleformMovieFullscreen(n, 255, 255, 255, 255)
    end
end
