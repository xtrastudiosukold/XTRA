currentEvent = {
    players = {},
    isActive = false,
    data = {},
    eventId = 0,
    eventName = "",
    drawPlayersTimeBar = true,
    musicString = "",
    playMusic = false
}
local a = {}
local b = {start = {}, cleanup = {}}
local c = nil
local d = false
local e = 0
local f = false
isDoingSequence = false
RMenu.Add("xtraevents","main",
    RageUI.CreateMenu("", "Event Menu", tXTRA.getRageUIMenuWidth(), tXTRA.getRageUIMenuHeight(), "xtra_events", "xtra_events")
)
RMenu.Add(
    "xtraevents",
    "categoryInfo",
    RageUI.CreateSubMenu(
        RMenu:Get("xtraevents", "main"),
        "",
        "Category",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "xtra_events",
        "xtra_events"
    )
)
RMenu.Add(
    "xtraevents",
    "secondary",
    RageUI.CreateSubMenu(
        RMenu:Get("xtraevents", "main"),
        "",
        "Event Menu",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "xtra_events",
        "xtra_events"
    )
)
RMenu.Add(
    "xtraevents",
    "players",
    RageUI.CreateMenu("", "Players", tXTRA.getRageUIMenuWidth(), tXTRA.getRageUIMenuHeight(), "xtra_events", "xtra_events")
)
RMenu.Add(
    "xtraevents",
    "players2",
    RageUI.CreateMenu("", "Players", tXTRA.getRageUIMenuWidth(), tXTRA.getRageUIMenuHeight(), "xtra_events", "xtra_events")
)
RMenu.Add(
    "xtraevents",
    "client",
    RageUI.CreateMenu("", "XTRA Events", tXTRA.getRageUIMenuWidth(), tXTRA.getRageUIMenuHeight(), "xtra_events", "xtra_events")
)
local function g()
    return tXTRA.getStaffLevel() >= 6
end
RegisterCommand("eventmenu",function()
    if g() then
        if currentEvent.isManager == true then
            RageUI.CloseAll()
            RageUI.Visible(RMenu:Get("xtraevents", "players"), true)
        else
            if RageUI.Visible(RMenu:Get("xtraevents", "main")) then
                RageUI.CloseAll()
            else
                RageUI.CloseAll()
                RageUI.Visible(RMenu:Get("xtraevents", "main"), true)
            end
        end
    end
end,false)
local function h(i)
    RageUI.ButtonWithStyle(
        i.name,
        nil,
        {RightLabel = "→→→"},
        true,
        function(j, k, l)
            if l then
                RMenu:Get("xtraevents", "secondary").MetaData = i
            end
        end,
        RMenu:Get("xtraevents", "secondary")
    )
end
RageUI.CreateWhile(
    1.0,
    RMenu:Get("xtraevents", "main"),
    nil,
    function()
        RageUI.IsVisible(
            RMenu:Get("xtraevents", "main"),
            true,
            false,
            false,
            function()
                if GetGameTimer() - e > 1000 then
                    TriggerServerEvent("XTRA:requestIsAnyEventActive")
                    e = GetGameTimer()
                end
                if f then
                    RageUI.Separator("~g~There is an event currently running.")
                else
                    RageUI.Separator("~r~There are no events currently running.")
                end
                for m, n in pairs(a) do
                    if table.count(n) > 1 then
                        RageUI.ButtonWithStyle(
                            m,
                            nil,
                            {RightLabel = "→→→"},
                            true,
                            function(j, k, l)
                                if l then
                                    c = m
                                end
                            end,
                            RMenu:Get("xtraevents", "categoryInfo")
                        )
                    else
                        for o, i in pairs(n) do
                            h(i)
                        end
                    end
                end
            end
        )
        RageUI.IsVisible(
            RMenu:Get("xtraevents", "categoryInfo"),
            true,
            false,
            false,
            function(p)
                local q = sortAlphabetically(a[c])
                for r = 1, #q do
                    local i = q[r].value
                    h(i)
                end
            end
        )
        RageUI.IsVisible(
            RMenu:Get("xtraevents", "secondary"),
            true,
            false,
            false,
            function(p)
                if type(p.menuitems) == "function" then
                    p.menuitems()
                end
            end
        )
        RageUI.IsVisible(
            RMenu:Get("xtraevents", "players"),
            true,
            true,
            true,
            function(p)
                RageUI.Checkbox(
                    "Toggle Event Music",
                    "",
                    currentEvent.playMusic,
                    {Style = RageUI.CheckboxStyle.Car},
                    function(j, l, k, s)
                        currentEvent.playMusic = s
                        if l then
                            if currentEvent.playMusic then
                                TriggerMusicEvent(currentEvent.musicString)
                            else
                                TriggerMusicEvent("BST_STOP")
                            end
                        end
                    end
                )
                RageUI.Separator("~y~Admin Options")
                RageUI.ButtonWithStyle(
                    "Start Event",
                    "This, well it'll start the event.",
                    {RightLabel = "→→→"},
                    true,
                    function(j, k, l)
                        if l then
                            TriggerServerEvent("XTRA:startEventFully", currentEvent.eventId)
                            RageUI.CloseAll()
                        end
                    end
                )
                RageUI.ButtonWithStyle(
                    "Cancel Event",
                    nil,
                    {RightLabel = "→→→"},
                    true,
                    function(j, k, l)
                        if l then
                            TriggerServerEvent("XTRA:cancelEvent", currentEvent.eventId)
                            RageUI.CloseAll()
                        end
                    end
                )
                RageUI.Separator("~y~Players")
                for t, u in pairs(currentEvent.players) do
                    RageUI.ButtonWithStyle(
                        string.format("[%s] %s", u.source, u.name),
                        string.format("Name: %s Temp ID: %s Perm ID: %s", u.name, u.source, u.user_id),
                        {RightLabel = "→→→"},
                        true,
                        function(j, k, l)
                            if l then
                                RMenu:Get("xtraevents", "players2").MetaData = u
                            end
                        end,
                        RMenu:Get("xtraevents", "players2")
                    )
                end
            end
        )
        RageUI.IsVisible(
            RMenu:Get("xtraevents", "players2"),
            true,
            true,
            true,
            function(p)
                RageUI.ButtonWithStyle(
                    "Kick Player From Event",
                    nil,
                    {RightLabel = "→→→"},
                    true,
                    function(j, k, l)
                        if l then
                            TriggerServerEvent("XTRA:kickPlayerFromEvent", p.source, currentEvent.eventId)
                        end
                    end
                )
            end
        )
        RageUI.IsVisible(
            RMenu:Get("xtraevents", "client"),
            true,
            true,
            true,
            function(p)
                RageUI.ButtonWithStyle(
                    "Leave Event",
                    nil,
                    {RightLabel = "→→→"},
                    true,
                    function(j, k, l)
                        if l then
                            ExecuteCommand("leaveevent")
                        end
                    end
                )
                RageUI.Checkbox(
                    "Toggle Event Music",
                    "",
                    currentEvent.playMusic,
                    {Style = RageUI.CheckboxStyle.Car},
                    function(j, l, k, s)
                        currentEvent.playMusic = s
                        if l then
                            if currentEvent.playMusic then
                                TriggerMusicEvent(currentEvent.musicString)
                            else
                                TriggerMusicEvent("BST_STOP")
                            end
                        end
                    end
                )
                RageUI.Separator("~y~Players")
                for t, u in pairs(currentEvent.players) do
                    RageUI.ButtonWithStyle(
                        string.format("[%s] %s", u.source, u.name),
                        string.format("Name: %s Temp ID: %s Perm ID: %s", u.name, u.source, u.user_id),
                        {RightLabel = "→→→"},
                        true,
                        function()
                        end
                    )
                end
            end
        )
    end
)
function tXTRA.registerEventMenuItem(v, w, x)
    if not a[v] then
        a[v] = {}
    end
    a[v][w] = {name = w, menuitems = x}
end
function tXTRA.registerEventFullStartHandler(y, z)
    b.start[y] = z
end
function tXTRA.registerEventCleanupHandler(y, z)
    b.cleanup[y] = z
end
local function A(B)
    tXTRA.removeBlipsForPlayer(B)
    tXTRA.removePlayerFromLeaderboard(B.source)
end
RegisterNetEvent("XTRA:syncPlayers",function(C, D)
    for o, E in pairs(currentEvent.players) do
        local F = true
        for o, B in pairs(C) do
            if E.source == B.source then
                F = false
                break
            end
        end
        if F then
            A(E)
        end
    end
    currentEvent.players = C
    currentEvent.eventId = D
end)
RegisterNetEvent("XTRA:addEventPlayer",function(B)
    table.add(currentEvent.players, B)
end)
RegisterNetEvent("XTRA:removeEventPlayer",function(B)
    for G, H in pairs(currentEvent.players) do
        if H.source == B.source then
            A(B)
            table.remove(currentEvent.players, G)
        end
    end
end)
RegisterNetEvent("XTRA:startHostEventMenu",function()
        currentEvent.isManager = true
        RageUI.CloseAll()
        RageUI.Visible(RMenu:Get("xtraevents", "players"), true)
    end)
local I = 0
local J = 0
local function K()
    if isDoingSequence then
        local L = tXTRA.getPlayerPed()
        SetEntityVisible(L, false, false)
        SetFocusPosAndVel(vector3(-77.84175, -1104.633, 33.12158))
        I =CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA",-77.84175,-1104.633,33.12158,0.0,
            0.0,
            0.0,
            65.0,
            false,
            2
        )
        PointCamAtCoord(I, -45.73187, -1097.881, 26.41541)
        SetCamActive(I, true)
        RenderScriptCams(true, true, 0, true, false)
        J =
            CreateCameraWithParams(
            "DEFAULT_SCRIPTED_CAMERA",
            -45.2044,
            -1128.317,
            33.12158,
            0.0,
            0.0,
            0.0,
            65.0,
            false,
            2
        )
        PointCamAtCoord(J, -45.73187, -1097.881, 26.41541)
        SetCamActiveWithInterp(J, I, 10000, 5, 5)
        Wait(10000)
        if isDoingSequence then
            ClearFocus()
            SetCamCoord(I, vector3(177.9429, -901.3582, 46.75317))
            SetCamCoord(J, vector3(178.9451, -991.0022, 47.74731))
            SetFocusPosAndVel(vector3(177.9429, -901.3582, 46.75317))
            PointCamAtCoord(I, 195.1253, -933.7582, 30.67834)
            PointCamAtCoord(J, 195.1253, -933.7582, 30.67834)
            SetCamActiveWithInterp(J, I, 25000, 5, 5)
            Wait(25000)
        end
        if isDoingSequence then
            ClearFocus()
            SetCamCoord(I, vector3(-3135.257, 1042.998, 30.15601))
            SetCamCoord(J, vector3(-3123.837, 1133.525, 30.15601))
            SetFocusPosAndVel(vector3(-3147.073, 1088.374, 20.6864))
            PointCamAtCoord(I, -3147.073, 1088.374, 20.6864)
            PointCamAtCoord(J, -3147.073, 1088.374, 20.6864)
            SetCamActiveWithInterp(J, I, 15000, 5, 5)
            Wait(15000)
        end
        if isDoingSequence then
            ClearFocus()
            SetCamCoord(I, vector3(598.4967, 1122.923, 364.2878))
            SetCamCoord(J, vector3(819.7582, 1057.543, 364.2878))
            SetFocusPosAndVel(vector3(732.5406, 1195.807, 326.359))
            PointCamAtCoord(I, 732.5406, 1195.807, 326.359)
            PointCamAtCoord(J, 732.5406, 1195.807, 326.359)
            SetCamActiveWithInterp(J, I, 35000, 5, 5)
            Wait(35000)
        end
        if isDoingSequence then
            ClearFocus()
            SetCamCoord(I, vector3(1658.914, 2526.369, 69.68567))
            SetCamCoord(J, vector3(1751.934, 2507.947, 69.68567))
            SetFocusPosAndVel(vector3(1708.629, 2547.943, 45.55676))
            PointCamAtCoord(I, 1708.629, 2547.943, 45.55676)
            PointCamAtCoord(J, 1708.629, 2547.943, 45.55676)
            SetCamActiveWithInterp(J, I, 35000, 5, 5)
            Wait(35000)
        end
        if isDoingSequence then
            ClearFocus()
            SetCamCoord(I, vector3(1545.191, 6444.29, 35.64905))
            SetCamCoord(J, vector3(1608.475, 6413.301, 35.64905))
            SetFocusPosAndVel(vector3(1588.536, 6456.923, 29.27991))
            PointCamAtCoord(I, 1588.536, 6456.923, 29.27991)
            PointCamAtCoord(J, 1588.536, 6456.923, 29.27991)
            SetCamActiveWithInterp(J, I, 20000, 5, 5)
            Wait(20000)
        end
        if isDoingSequence then
            ClearFocus()
            SetCamCoord(I, vector3(-134.1758, -834.0527, 321.186))
            SetCamCoord(J, vector3(-37.60879, -882.6725, 321.186))
            SetFocusPosAndVel(vector3(-73.8989, -817.5824, 319.4843))
            PointCamAtCoord(I, -73.8989, -817.5824, 319.4843)
            PointCamAtCoord(J, -73.8989, -817.5824, 319.4843)
            SetCamActiveWithInterp(J, I, 25000, 5, 5)
            Wait(25000)
        end
        K()
    end
end
function tXTRA.stopEventSequence(M)
    RageUI.CloseAll()
    isDoingSequence = false
    DestroyCam(I, false)
    DestroyCam(J, false)
    if M == nil or M == true then
        RenderScriptCams(false, true, 0, true, false)
    else
        RenderScriptCams(false, false, 0, true, false)
    end
    ClearFocus()
    FreezeEntityPosition(tXTRA.getPlayerPed(), false)
    local L = tXTRA.getPlayerPed()
    SetEntityVisible(L, true, true)
end
RegisterNetEvent("XTRA:startEventSequence",function()
    isDoingSequence = true
    K()
end)
RegisterNetEvent("XTRA:startEventFully",function(p)
    globalDisableVehicleFailure = true
    currentEvent.data = p
    currentEvent.isActive = true
    tXTRA.setGreenzonesDisabled(true)
    RageUI.Visible(RMenu:Get("xtraevents", "client"), false)
end)
local N = "..."
Citizen.CreateThread(
    function()
        while true do
            if isDoingSequence then
                drawNativeText("~g~Waiting for event to start" .. N)
                drawNativeNotification(
                    "The command /leaveevent can be used at any time to return back to the main world."
                )
                if not RageUI.Visible(RMenu:Get("xtraevents", "client")) and not currentEvent.isManager then
                    RageUI.Visible(RMenu:Get("xtraevents", "client"), true)
                elseif not RageUI.Visible(RMenu:Get("xtraevents", "players")) and currentEvent.isManager then
                    RageUI.Visible(RMenu:Get("xtraevents", "players"), true)
                end
            end
            if currentEvent.isActive and currentEvent.drawPlayersTimeBar then
                local O = 0
                for o, B in pairs(currentEvent.players) do
                    if type(B.active) == "nil" or B.active == true then
                        O = O + 1
                    end
                end
                DrawGTATimerBar("~y~PLAYERS:", O, 1)
                tXTRA.setWeather("EXTRASUNNY")
            end
            Wait(0)
        end
    end
)
Citizen.CreateThread(
    function()
        while true do
            if isDoingSequence then
                if N == "..." then
                    N = "."
                else
                    N = N .. "."
                end
            end
            Wait(500)
        end
    end
)
RegisterNetEvent("XTRA:eventCleanup",function(D, P, Q, R)
        tXTRA.stopEventSequence()
        RageUI.Visible(RMenu:Get("xtraevents", "client"), false)
        if b.cleanup[P] then
            b.cleanup[P]()
        end
        globalDisableVehicleFailure = false
        tXTRA.endVehicleSelection()
        tXTRA.setEventSpectatorMode(false)
        tXTRA.clearEventBounds()
        tXTRA.enableEventPlayerBlips(false)
        tXTRA.enableEventPlayerTags(false, false)
        tXTRA.setGreenzonesDisabled(false)
        tXTRA.setPlayerCanOpenLeaderboard(false)
        tXTRA.clearLeaderboardData()
        if Q and R then
            tXTRA.podiumLeaderboard(Q, R)
        elseif tXTRA.isPodiumDrawing() then
            tXTRA.callCancelPodium()
        end
        currentEvent = {
            players = {},
            isActive = false,
            data = {},
            eventId = 0,
            drawPlayersTimeBar = true,
            isManager = false,
            musicString = "",
            playMusic = false
        }
        d = true
        Citizen.Wait(5000)
        d = false
    end)
function tXTRA.setPlayerInvisible(S)
    local T = PlayerPedId()
    FreezeEntityPosition(T, S)
    SetEntityInvincible(T, S)
    SetEntityVisible(T, not S, not S)
end
RegisterNetEvent("XTRA:announceEventJoinable",function(P, U)
        if tXTRA.getPlayerCombatTimer() == 0 and not tXTRA.getHideEventAnnouncementFlag() and not tXTRA.isInTutorial() then
            PlaySound(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", false, 0, true)
            tXTRA.announceMpBigMsg(
                "~b~" .. P .. " event has started!",
                "/joinevent to enter, Win £500,000! - " .. tostring(U) .. " slots available.",
                15000
            )
        end
    end)
function tXTRA.announceMpBigMsg(V, W, X, Y, Z)
    if Y then
        local _ = GetSoundId()
        PlaySoundFrontend(_, "Checkpoint_Teammate", "GTAO_Shepherd_Sounds", false)
        ReleaseSoundId(_)
    end
    local a0 = Scaleform("MP_BIG_MESSAGE_FREEMODE")
    a0.RunFunction("SHOW_SHARD_WASTED_MP_MESSAGE", {V, W, 0, false, false})
    if Z then
        CreateThread(
            function()
                local a1 = false
                SetTimeout(
                    X,
                    function()
                        a1 = true
                    end
                )
                while not a1 do
                    a0.Render2D()
                    Wait(0)
                end
            end
        )
    else
        local a1 = false
        SetTimeout(
            X,
            function()
                a1 = true
            end
        )
        while not a1 do
            a0.Render2D()
            Wait(0)
        end
    end
end
RegisterNetEvent("XTRA:announceMpBigMsg", tXTRA.announceMpBigMsg)
function tXTRA.setEventMusic(a2)
    currentEvent.playMusic = true
    currentEvent.musicString = a2
    TriggerMusicEvent(a2)
end
function tXTRA.getActiveEventPlayers()
    local a3 = {}
    for o, B in pairs(currentEvent.players) do
        if B.active then
            table.insert(a3, B)
        end
    end
    return a3
end
function tXTRA.getEventLocalPlayer()
    local a4 = GetPlayerServerId(PlayerId())
    for o, a5 in pairs(currentEvent.players) do
        if a5.source == a4 then
            return a5
        end
    end
end
function tXTRA.getEventPlayerFromSrc(a6)
    for o, a5 in pairs(currentEvent.players) do
        if a5.source == a6 then
            return a5
        end
    end
end
RegisterNetEvent("XTRA:updatePlayerActive",function(a7, a8)
    if currentEvent.players[a7] then
        currentEvent.players[a7].active = a8
    end
end)
function tXTRA.showCountdownTimer(a9)
    showingscaleform = true
    local aa = -1
    local ab = -1
    local a9 = a9
    local ac = a9 + 1
    local ad = 255
    local ae = 0
    Citizen.CreateThread(
        function()
            while showingscaleform do
                if ac ~= -1 then
                    ac = ac - 1
                end
                if ac > 0 then
                    PlaySoundFrontend(-1, "3_2_1", "HUD_MINI_GAME_SOUNDSET", 1)
                end
                if ac == 0 then
                    PlaySoundFrontend(-1, "GO", "HUD_MINI_GAME_SOUNDSET", 1)
                end
                Citizen.Wait(1000)
            end
        end
    )
    local af = Scaleform("COUNTDOWN")
    Citizen.CreateThread(
        function()
            while showingscaleform do
                if ac ~= -1 then
                    if ac == 0 then
                        af.RunFunction("SET_MESSAGE", {"CNTDWN_GO", 0, 255, 0, true, false})
                    elseif ac > 0 then
                        if ac >= a9 / 2 then
                            ae = math.floor(510 * (1 - aa / ab))
                        elseif ac < a9 / 2 then
                            ad = math.floor(510 * aa / ab)
                        end
                        af.RunFunction("SET_MESSAGE", {tostring(ac), ad, ae, 0, true, false})
                    end
                    af.Render2D()
                end
                Wait(0)
            end
        end
    )
    while ac ~= -1 do
        Citizen.Wait(1.0)
    end
    showingscaleform = false
end
function tXTRA.setEventBounds(ag)
    if ag and table.count(ag) ~= 0 then
        currentEvent.bounds = ag
    end
end
function tXTRA.clearEventBounds()
    currentEvent.bounds = nil
end
local function ah(ai)
    if currentEvent.bounds then
        for r, aj in ipairs(currentEvent.bounds) do
            if table.count(aj) == 2 then
                if not IsEntityInArea(ai, aj[1].x, aj[1].y, aj[1].z, aj[2].x, aj[2].y, aj[2].z, false, true, 0) then
                    return true
                end
            end
        end
    end
    return false
end
Citizen.CreateThread(
    function()
        while true do
            if currentEvent.bounds and tXTRA.getEventLocalPlayer() and tXTRA.getEventLocalPlayer().active and
                    not tXTRA.isSpectatingEvent()
             then
                if GetEntityHealth(PlayerPedId()) > 0 then
                    if ah(PlayerPedId()) then
                        local ak = GetGameTimer()
                        local al = 5
                        AnimpostfxPlay("MP_race_crash", 5000, false)
                        local _ = GetSoundId()
                        PlaySound(_, "OOB_Timer_Dynamic", "GTAO_FM_Events_Soundset", false, false, false)
                        ReleaseSoundId(_)
                        while ah(PlayerPedId()) and GetGameTimer() - ak < 5000 do
                            tXTRA.announceMpBigMsg(
                                "~r~Out Of Bounds~w~",
                                "Return to the minigame within " .. al .. " seconds or you will explode.",
                                1000
                            )
                            al = al - 1
                        end
                        AnimpostfxStopAll()
                        StopSound(_)
                        if ah(PlayerPedId()) then
                            local am = GetEntityCoords(PlayerPedId(), true)
                            AddExplosion(am.x, am.y, am.z, 1, 1.0, true, false, 1.0)
                            SetEntityHealth(PlayerPedId(), 0)
                            Wait(10000)
                        else
                            Wait(200)
                            PlaySound(-1, "OOB_Cancel", "GTAO_FM_Events_Soundset", false, 0, false)
                        end
                    end
                end
            end
            Citizen.Wait(1000)
        end
    end
)
local function an(ao)
    tXTRA.loadPtfx("proj_indep_firework")
    tXTRA.loadPtfx("proj_indep_firework_v2")
    UseParticleFxAsset("proj_indep_firework")
    UseParticleFxAsset("proj_indep_firework_v2")
    CreateThread(
        function()
            for r = 1, 5 do
                if r % 2 == 0 then
                    UseParticleFxAsset("proj_indep_firework_v2")
                    local ap =
                        StartParticleFxNonLoopedAtCoord(
                        "scr_firework_indep_repeat_burst_rwb",
                        ao.x,
                        ao.y,
                        ao.z,
                        0.0,
                        0.0,
                        0.0,
                        1.0,
                        false,
                        false,
                        false
                    )
                else
                    UseParticleFxAsset("proj_indep_firework")
                    local ap =
                        StartParticleFxNonLoopedAtCoord(
                        "scr_indep_firework_air_burst",
                        ao.x,
                        ao.y,
                        ao.z,
                        0.0,
                        0.0,
                        0.0,
                        1.0,
                        false,
                        false,
                        false
                    )
                end
                Wait(1000)
            end
        end
    )
    tXTRA.loadPtfx("scr_indep_fireworks")
    UseParticleFxAsset("scr_indep_fireworks")
    CreateThread(
        function()
            for r = 1, 5 do
                UseParticleFxAsset("scr_indep_fireworks")
                local ap =
                    StartParticleFxNonLoopedAtCoord(
                    "scr_indep_firework_starburst",
                    ao.x,
                    ao.y,
                    ao.z,
                    0.0,
                    0.0,
                    0.0,
                    1.0,
                    false,
                    false,
                    false
                )
                Wait(1000)
            end
        end
    )
end
local aq = {
    vector4(683.82855224609, 570.56701660156, 130.44616699219, 155.0),
    vector4(682.49670410156, 571.10766601562, 130.44616699219, 155.0),
    vector4(685.51647949219, 570.01318359375, 130.44616699219, 155.0),
    vector4(687.23077392578, 569.41979980469, 130.44616699219, 155.0),
    vector4(681.44177246094, 571.45056152344, 130.44616699219, 155.0),
    vector4(680.21539306641, 573.54724121094, 130.44616699219, 155.0),
    vector4(681.73187255859, 573.17803955078, 130.44616699219, 155.0),
    vector4(683.34063720703, 572.57141113281, 130.44616699219, 155.0),
    vector4(685.09448242188, 571.8857421875, 130.44616699219, 155.0),
    vector4(687.23077392578, 571.39782714844, 130.44616699219, 155.0),
    vector4(689.23516845703, 570.89672851562, 130.44616699219, 155.0),
    vector4(690.96264648438, 571.43737792969, 130.44616699219, 155.0),
    vector4(689.63079833984, 572.94067382812, 130.44616699219, 155.0),
    vector4(687.74505615234, 573.69232177734, 130.44616699219, 155.0),
    vector4(686.10986328125, 574.33843994141, 130.44616699219, 155.0),
    vector4(682.44396972656, 575.78900146484, 130.44616699219, 155.0),
    vector4(680.14947509766, 572.00439453125, 130.44616699219, 155.0),
    vector4(678.93627929688, 572.57141113281, 130.44616699219, 155.0),
    vector4(679.23956298828, 573.876953125, 130.44616699219, 155.0),
    vector4(686.22857666016, 571.75384521484, 130.44616699219, 155.0),
    vector4(688.29888916016, 571.06811523438, 130.44616699219, 155.0),
    vector4(688.57580566406, 568.95825195312, 130.44616699219, 155.0),
    vector4(690.54064941406, 570.19781494141, 130.44616699219, 155.0),
    vector4(689.61755371094, 571.80657958984, 130.44616699219, 155.0),
    vector4(688.41760253906, 572.34722900391, 130.44616699219, 155.0),
    vector4(687.38903808594, 572.71649169922, 130.44616699219, 155.0),
    vector4(686.20220947266, 573.05932617188, 130.44616699219, 155.0),
    vector4(684.96264648438, 573.37585449219, 130.44616699219, 155.0),
    vector4(683.96044921875, 573.86376953125, 130.44616699219, 155.0),
    vector4(682.86596679688, 574.23297119141, 130.44616699219, 155.0),
    vector4(681.876953125, 574.66815185547, 130.44616699219, 155.0),
    vector4(680.82196044922, 574.98461914062, 130.44616699219, 155.0),
    vector4(689.48571777344, 569.67034912109, 130.44616699219, 155.0),
    vector4(688.43078613281, 570.13189697266, 130.44616699219, 155.0),
    vector4(687.01977539062, 570.65936279297, 130.44616699219, 155.0),
    vector4(685.75384521484, 571.00219726562, 130.44616699219, 155.0),
    vector4(684.03955078125, 571.62200927734, 130.44616699219, 155.0),
    vector4(682.73406982422, 571.9384765625, 130.44616699219, 155.0),
    vector4(681.65277099609, 572.47912597656, 130.44616699219, 155.0),
    vector4(680.54504394531, 572.72967529297, 130.44616699219, 155.0),
    vector4(679.47692871094, 573.00659179688, 130.44616699219, 155.0),
    vector4(679.63519287109, 575.47253417969, 130.44616699219, 155.0),
    vector4(689.88134765625, 568.74725341797, 130.44616699219, 155.0),
    vector4(690.87036132812, 572.50549316406, 130.44616699219, 155.0),
    vector4(688.70770263672, 573.27032470703, 130.44616699219, 155.0),
    vector4(684.97583007812, 574.60217285156, 130.44616699219, 155.0),
    vector4(683.73626708984, 575.05053710938, 130.44616699219, 155.0),
    vector4(681.27032470703, 576.06591796875, 130.44616699219, 155.0),
    vector4(680.25494384766, 576.36926269531, 130.44616699219, 155.0),
    vector4(691.54284667969, 573.53405761719, 130.44616699219, 155.0),
    vector4(690.40881347656, 573.9560546875, 130.44616699219, 155.0),
    vector4(689.52526855469, 574.29888916016, 130.44616699219, 155.0),
    vector4(688.58898925781, 574.62860107422, 130.44616699219, 155.0),
    vector4(687.46813964844, 575.07690429688, 130.44616699219, 155.0),
    vector4(686.42639160156, 575.53845214844, 130.44616699219, 155.0),
    vector4(685.31866455078, 575.80218505859, 130.44616699219, 155.0),
    vector4(684.30328369141, 576.21099853516, 130.44616699219, 155.0),
    vector4(683.31427001953, 576.67254638672, 130.44616699219, 155.0),
    vector4(682.28570556641, 577.12091064453, 130.44616699219, 155.0),
    vector4(681.34942626953, 577.45056152344, 130.44616699219, 155.0),
    vector4(680.28131103516, 577.79339599609, 130.44616699219, 155.0),
    vector4(686.38684082031, 569.78900146484, 130.44616699219, 155.0),
    vector4(684.72528076172, 570.42199707031, 130.44616699219, 155.0),
    vector4(686.99340820312, 574.0615234375, 130.44616699219, 155.0)
}
local ar = {
    vector4(696.13189697266, 579.70550537109, 130.44616699219, 155.0),
    vector4(694.94506835938, 580.02197265625, 130.44616699219, 155.0),
    vector4(693.85052490234, 580.41760253906, 130.44616699219, 155.0),
    vector4(693.42858886719, 579.25714111328, 130.44616699219, 155.0),
    vector4(694.62860107422, 578.78240966797, 130.44616699219, 155.0),
    vector4(695.98681640625, 578.22857666016, 130.44616699219, 155.0),
    vector4(696.27691650391, 577.21319580078, 130.44616699219, 155.0),
    vector4(694.90551757812, 577.74066162109, 130.44616699219, 155.0),
    vector4(696.47473144531, 577.12091064453, 130.44616699219, 155.0),
    vector4(692.51867675781, 578.22857666016, 130.44616699219, 155.0),
    vector4(691.38464355469, 578.59777832031, 130.44616699219, 155.0),
    vector4(692.38684082031, 579.86376953125, 130.44616699219, 155.0),
    vector4(690.98901367188, 581.01098632812, 130.44616699219, 155.0),
    vector4(690.44836425781, 579.32305908203, 130.44616699219, 155.0),
    vector4(697.92529296875, 581.60437011719, 130.44616699219, 155.0),
    vector4(699.16485595703, 581.02416992188, 130.44616699219, 155.0),
    vector4(692.42639160156, 581.03735351562, 130.44616699219, 155.0),
    vector4(690.17144775391, 581.73626708984, 130.44616699219, 155.0),
    vector4(697.17364501953, 579.21759033203, 130.44616699219, 155.0),
    vector4(697.39782714844, 577.78021240234, 130.44616699219, 155.0),
    vector4(697.75384521484, 576.64617919922, 130.44616699219, 155.0),
    vector4(699.24395751953, 576.0263671875, 130.44616699219, 155.0),
    vector4(697.84613037109, 578.88793945312, 130.44616699219, 1155.0),
    vector4(698.92749023438, 578.58459472656, 130.44616699219, 155.0),
    vector4(697.79339599609, 577.71429443359, 130.44616699219, 155.0),
    vector4(699.16485595703, 577.16046142578, 130.44616699219, 155.0),
    vector4(693.66595458984, 577.89892578125, 130.44616699219, 155.0),
    vector4(691.00219726562, 580.23297119141, 130.44616699219, 155.0),
    vector4(689.85498046875, 580.76043701172, 130.44616699219, 155.0),
    vector4(689.47253417969, 579.66595458984, 130.44616699219, 155.0),
    vector4(700.0087890625, 579.38903808594, 130.44616699219, 155.0),
    vector4(698.78240966797, 579.78460693359, 130.44616699219, 155.0),
    vector4(697.912109375, 580.1142578125, 130.44616699219, 155.0),
    vector4(696.97583007812, 580.50988769531, 130.44616699219, 155.0),
    vector4(695.90771484375, 580.81317138672, 130.44616699219, 155.0),
    vector4(694.72088623047, 581.19561767578, 130.44616699219, 155.0),
    vector4(693.59997558594, 581.61755371094, 130.44616699219, 155.0),
    vector4(692.22857666016, 582.22418212891, 130.44616699219, 155.0),
    vector4(690.92309570312, 582.68572998047, 130.44616699219, 155.0),
    vector4(696.83074951172, 582.0, 130.44616699219, 155.0),
    vector4(695.76263427734, 582.38244628906, 130.44616699219, 155.0),
    vector4(694.70770263672, 582.54064941406, 130.44616699219, 155.0),
    vector4(693.30987548828, 583.01538085938, 130.44616699219, 155.0),
    vector4(692.18902587891, 583.58239746094, 130.44616699219, 155.0),
    vector4(690.96264648438, 583.9912109375, 130.44616699219, 155.0),
    vector4(691.41101074219, 581.78900146484, 130.44616699219, 155.0),
    vector4(699.876953125, 581.67034912109, 130.44616699219, 155.0),
    vector4(698.91430664062, 582.11865234375, 130.44616699219, 155.0),
    vector4(697.62200927734, 582.65936279297, 130.44616699219, 155.0),
    vector4(696.52746582031, 583.06811523438, 130.44616699219, 155.0),
    vector4(695.51208496094, 583.34503173828, 130.44616699219, 155.0),
    vector4(694.28570556641, 583.68792724609, 130.44616699219, 155.0),
    vector4(693.11206054688, 584.0966796875, 130.44616699219, 155.0),
    vector4(691.9384765625, 584.59777832031, 130.44616699219, 155.0),
    vector4(699.83734130859, 582.71209716797, 130.44616699219, 155.0),
    vector4(698.58459472656, 583.22637939453, 130.44616699219, 155.0),
    vector4(697.26593017578, 583.71429443359, 130.44616699219, 155.0),
    vector4(696.22418212891, 584.03076171875, 130.49670410156, 155.0),
    vector4(695.07690429688, 584.41320800781, 130.46301269531, 155.0),
    vector4(693.85052490234, 584.66375732422, 130.44616699219, 155.0),
    vector4(692.78240966797, 585.11206054688, 130.44616699219, 155.0),
    vector4(691.51647949219, 585.61315917969, 130.44616699219, 155.0),
    vector4(699.99560546875, 578.16265869141, 130.44616699219, 155.0),
    vector4(700.15386962891, 576.75164794922, 130.44616699219, 155.0)
}
local as = false
function tXTRA.isPodiumDrawing()
    return as
end
local at = false
function tXTRA.callCancelPodium()
    at = true
end
function tXTRA.podiumLeaderboard(Q, R)
    as = true
    tXTRA.setTime(0, 0, 0)
    RequestIpl("stadium")
    while not IsIplActive("stadium") do
        print("Loading stadium IPL")
        Wait(0)
    end
    tXTRA.hideUI()
    SendNUIMessage({transactionType = "celebration_music"})
    local au = {}
    local T = PlayerPedId()
    FreezeEntityPosition(T, true)
    ClearPedBloodDamage(T)
    for a7, B in pairs(Q) do
        if B.source == GetPlayerServerId(PlayerId()) then
            local av = aq[a7]
            if not av then
                av = vector4(686.37365722656, 576.83074951172, 130.44616699219, 158.74015808105)
            end
            SetEntityCoords(T, av.x, av.y, av.z - 1)
            SetEntityHeading(T, av.w)
            CreateThread(
                function()
                    local aw = "anim@arena@celeb@flat@solo@no_props@"
                    local ax = "flip_a_player_a"
                    tXTRA.loadAnimDict(aw)
                    while as do
                        SetFocusPosAndVel(682.94506835938, 572.95385742188, 131.08642578125, 0.0, 0.0, 0.0)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if not IsEntityPlayingAnim(PlayerPedId(), aw, ax, 3) then
                            TaskPlayAnim(PlayerPedId(), aw, ax, 8.0, 8.0, -1, 1, 1.0, false, false, false)
                        end
                        Wait(0)
                    end
                end
            )
        end
    end
    for a7, B in pairs(R) do
        if B.source == GetPlayerServerId(PlayerId()) then
            local av = ar[a7]
            if not av then
                av = vector4(700.52307128906, 575.68353271484, 130.44616699219, 158.74015808105)
            end
            SetEntityCoords(T, av.x, av.y, av.z - 1)
            SetEntityHeading(T, av.w)
            CreateThread(
                function()
                    local aw = "anim_casino_a@amb@casino@games@arcadecabinet@femaleleft"
                    local ax = "lose_big"
                    tXTRA.loadAnimDict(aw)
                    while as do
                        SetFocusPosAndVel(682.94506835938, 572.95385742188, 131.08642578125, 0.0, 0.0, 0.0)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if not IsEntityPlayingAnim(PlayerPedId(), aw, ax, 3) then
                            TaskPlayAnim(PlayerPedId(), aw, ax, 8.0, 8.0, -1, 1, 1.0, false, false, false)
                        end
                        Wait(0)
                    end
                end
            )
        end
    end
    local ay = vector3(683.83, 570.57, 130.46)
    local az = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", 681.29, 563.62, 141.05, 0.0, 0.0, 0.0, 65.0, 0, 2)
    PointCamAtCoord(az, ay.x, ay.y, ay.z + 10)
    SetCamActive(az, true)
    RenderScriptCams(true, true, 0, 1, 0)
    local aA = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", 681.29, 563.62, 131.05, 0.0, 0.0, 0.0, 65.0, 0, 2)
    PointCamAtCoord(aA, ay.x, ay.y, ay.z)
    SetCamActiveWithInterp(aA, az, 10000, 5, 5)
    an(ay + vector3(0, 0, 5))
    an(vector3(681.34, 572.84, 130.46) + vector3(0, 0, 5))
    an(vector3(686.76, 570.71, 130.46) + vector3(0, 0, 5))
    local aB = GetGameTimer()
    while not at and GetGameTimer() - aB < 10000 do
        ThefeedHideThisFrame()
        Wait(0)
    end
    if not at then
        local aC =
            CreateCameraWithParams(
            "DEFAULT_SCRIPTED_CAMERA",
            696.13189697266,
            579.70550537109,
            130.44616699219,
            0.0,
            0.0,
            0.0,
            65.0,
            0,
            2
        )
        PointCamAtCoord(aC, vector3(695.947265625, 584.84832763672, 130.74951171875))
        SetCamActiveWithInterp(aC, aA, 11000, 5, 5)
    end
    local aB = GetGameTimer()
    while not at and GetGameTimer() - aB < 4000 do
        ThefeedHideThisFrame()
        Wait(0)
    end
    if not at then
        DoScreenFadeOut(2000)
    end
    local aB = GetGameTimer()
    while not at and GetGameTimer() - aB < 3000 do
        Wait(0)
    end
    for o, aD in pairs(au) do
        tXTRA.removeArea("3dtext_" .. aD)
    end
    ClearPedTasks(T)
    FreezeEntityPosition(T, false)
    RenderScriptCams(0, 0, 1, 1, 1)
    DestroyCam(az, 0)
    DestroyCam(aA, 0)
    DestroyAllCams(true)
    DoScreenFadeIn(1000)
    tXTRA.setTime(12, 0, 0)
    ClearTimecycleModifier()
    as = false
    tXTRA.showUI()
    at = false
    ClearFocus()
end
RegisterNetEvent(
    "XTRA:celebrationScreen",
    function(aE, aF)
        CreateThread(
            function()
                tXTRA.activateSlowMo()
            end
        )
        local aG = {}
        aG[1] = Scaleform("MP_CELEBRATION")
        aG[2] = Scaleform("MP_CELEBRATION_BG")
        aG[3] = Scaleform("MP_CELEBRATION_FG")
        for o, a0 in ipairs(aG) do
            a0.RunFunction("CLEANUP", {"WINNER"})
            a0.RunFunction("CREATE_STAT_WALL", {"WINNER", "HUD_COLOUR_BLACK", "70.0"})
            if aF then
                a0.RunFunction("ADD_POSITION_TO_WALL", {"WINNER", aF, "1ST", false, false})
            end
            a0.RunFunction("ADD_WINNER_TO_WALL", {"WINNER", "CELEB_WINNER", aE, "", 0, false, "", false})
            a0.RunFunction("ADD_BACKGROUND_TO_WALL", {"WINNER", 75, 0})
            a0.RunFunction("SHOW_STAT_WALL", {"WINNER"})
        end
        local aH = true
        SetTimeout(
            10000,
            function()
                aH = false
            end
        )
        tXTRA.hideUI()
        while aH do
            DrawScaleformMovieFullscreenMasked(aG[2].Handle, aG[3].Handle, 255, 255, 255, 255)
            aG[1].Render2D()
            Citizen.Wait(0)
        end
        if not tXTRA.isPodiumDrawing() then
            tXTRA.showUI()
        end
    end
)
local aI = false
function tXTRA.activateSlowMo()
    aI = true
    SetSpecialAbility(PlayerId(), 2)
    SpecialAbilityActivate(PlayerId())
    Wait(1000)
    aI = false
    SpecialAbilityDeplete(PlayerId())
    Citizen.InvokeNative(0xc204033758e4127f, PlayerId())
end
function tXTRA.isInSlowMo()
    return aI
end
local function aJ(aK)
    local a7 = aK % 6
    if a7 == 0 then
        return 3
    elseif a7 == 1 then
        return 5
    elseif a7 == 2 then
        return 17
    elseif a7 == 3 then
        return 11
    elseif a7 == 4 then
        return 14
    elseif a7 == 5 then
        return 8
    elseif a7 == 6 then
        return 1
    end
end
local aL
local aM
local aN = false
function tXTRA.enableEventPlayerBlips(aO, aP, aQ)
    aL = aP
    aM = aQ or function()
            return true
        end
    aN = aO
    if not aO then
        for o, B in ipairs(currentEvent.players) do
            tXTRA.removeBlipsForPlayer(B)
        end
    end
    DisplayPlayerNameTagsOnBlips(aO)
end
local aR = {}
function tXTRA.forceCleanupPlayerBlips()
    for o, aS in pairs(aR) do
        for o, aT in pairs(aS) do
            if DoesBlipExist(aT) then
                RemoveBlip(aT)
            end
        end
    end
end
function tXTRA.removeBlipsForPlayer(B)
    if B.blip then
        RemoveBlip(B.blip)
    end
    local aU = aR[B.source]
    if aU then
        for o, aT in pairs(aU) do
            RemoveBlip(aT)
        end
    end
    local aV = GetPlayerFromServerId(B.source)
    if aV == -1 then
        return
    end
    local T = GetPlayerPed(aV)
    if T == 0 then
        return
    end
    local aW = GetBlipFromEntity(T)
    if DoesBlipExist(aW) then
        RemoveBlip(aW)
    end
end
CreateThread(function()
        while true do
            if aN then
                local a3 = GetActivePlayers()
                for r, a5 in ipairs(currentEvent.players) do
                    local aX = GetPlayerFromServerId(a5.source)
                    if aX ~= -1 and aX ~= PlayerId() and table.has(a3, aX) then
                        local T = GetPlayerPed(aX)
                        local aW = GetBlipFromEntity(T)
                        if IsEntityVisible(T) and a5.active and aM(a5.source) then
                            if not a5.blip or aW ~= a5.blip then
                                if a5.blip then
                                    RemoveBlip(a5.blip)
                                end
                                if DoesBlipExist(aW) then
                                    RemoveBlip(aW)
                                end
                                local aY = AddBlipForEntity(T)
                                if not aR[a5.source] then
                                    aR[a5.source] = {}
                                end
                                table.insert(aR[a5.source], aY)
                                SetBlipSprite(aY, 1)
                                SetBlipCategory(aY, 7)
                                if aL then
                                    SetBlipColour(aY, aL(a5.source))
                                else
                                    SetBlipColour(aY, aJ(a5.source))
                                end
                                ShowHeadingIndicatorOnBlip(aY, true)
                                BeginTextCommandSetBlipName("STRING")
                                AddTextComponentSubstringPlayerName(tXTRA.getPlayerName(aX))
                                EndTextCommandSetBlipName(aY)
                                a5.blip = aY
                            else
                                local aZ = IsEntityDead(T) and 274 or 1
                                if GetBlipSprite(a5.blip) ~= aZ then
                                    SetBlipSprite(a5.blip, aZ)
                                    if aL then
                                        SetBlipColour(a5.blip, aL(a5.source))
                                    else
                                        SetBlipColour(a5.blip, aJ(a5.source))
                                    end
                                    BeginTextCommandSetBlipName("STRING")
                                    AddTextComponentSubstringPlayerName(tXTRA.getPlayerName(aX))
                                    EndTextCommandSetBlipName(a5.blip)
                                end
                            end
                        else
                            if a5.blip then
                                RemoveBlip(a5.blip)
                                a5.blip = nil
                            end
                            if DoesBlipExist(aW) then
                                RemoveBlip(aW)
                            end
                        end
                    end
                end
            end
            Wait(100)
        end
    end
)
local function a_(aK)
    local a7 = aK % 6
    if a7 == 0 then
        return 9
    elseif a7 == 1 then
        return 12
    elseif a7 == 2 then
        return 15
    elseif a7 == 3 then
        return 18
    elseif a7 == 4 then
        return 21
    elseif a7 == 5 then
        return 24
    elseif a7 == 6 then
        return 6
    end
end
local b0
local b1 = nil
local b2 = false
local b3 = false
function tXTRA.enableEventPlayerTags(aO, b4, b5, b6)
    b0 = b5
    b1 = b6
    b3 = b4
    b2 = aO
    if not aO then
        for r, a5 in ipairs(currentEvent.players) do
            if a5.tag then
                RemoveMpGamerTag(a5.tag)
                a5.tag = nil
            end
        end
    end
end
function tXTRA.isEventPlayerTagEnabled()
    return b2
end
CreateThread(function()
        while true do
            if b2 then
                local T = PlayerPedId()
                for r, a5 in ipairs(currentEvent.players) do
                    local aX = GetPlayerFromServerId(a5.source)
                    if aX ~= -1 and aX ~= PlayerId() then
                        local b7 = GetPlayerPed(aX)
                        local b8 = HasEntityClearLosToEntity(T, b7, 17) or tXTRA.isSpectatingEvent()
                        if b8 and IsEntityVisible(b7) and a5.active then
                            if not a5.tag or not IsMpGamerTagActive(a5.tag) then
                                local b9 = nil
                                if b1 then
                                    b9 = CreateFakeMpGamerTag(b7, b1(a5), false, false, "", 0)
                                else
                                    b9 = CreateFakeMpGamerTag(b7, tXTRA.getPlayerName(aX), false, false, "", 0)
                                end
                                if b0 then
                                    SetMpGamerTagColour(b9, 0, b0(a5.source))
                                else
                                    SetMpGamerTagColour(b9, 0, a_(a5.source))
                                end
                                SetMpGamerTagColour(b9, 29, 6)
                                if b3 then
                                    SetMpGamerTagHealthBarColour(b9, 18)
                                    SetMpGamerTagAlpha(b9, 2, 255)
                                    SetMpGamerTagVisibility(b9, 2, true)
                                end
                                a5.tag = b9
                            end
                        else
                            if a5.tag then
                                RemoveMpGamerTag(a5.tag)
                                a5.tag = nil
                            end
                        end
                    end
                end
            end
            Wait(100)
        end
    end
)
function tXTRA.setEventIntroMessage(ba, bb, bc, bd)
    EnableAllControlActions(0)
    local _ = GetSoundId()
    PlaySoundFrontend(_, "Frontend_Beast_Freeze_Screen", "FM_Events_Sasquatch_Sounds", false)
    ReleaseSoundId(_)
    if not HasStreamedTextureDictLoaded("xtraui") then
        RequestStreamedTextureDict("xtraui", false)
        while not HasStreamedTextureDictLoaded("xtraui") do
            Wait(0)
        end
    end
    tXTRA.hideUI()
    local be = 0.0
    local bf = 0.55
    local bg = true
    if bc == 0 then
    else
        SetTimeout(
            bc or 5000,
            function()
                bg = false
            end
        )
        while bg do
            Wait(0)
            if be < bf then
                be = be + 0.01
            end
            DrawAdvancedTextNoOutline(
                0.283,
                0.807 - bf + be,
                0.005,
                0.0028,
                1.25,
                ba,
                171,
                34,
                35,
                255,
                tXTRA.getFontId("Akrobat-ExtraBold"),
                0
            )
            DrawAdvancedTextNoOutline(0.488, 0.883 - bf + be, 0.005, 0.0028, 1.03, bb, 255, 255, 255, 255, 1, 0)
            DrawSprite("xtraui", "slanted_rect", 0.5, be, 1.0, 1.0, 0.0, 255, 255, 255, 180)
        end
    end
    tXTRA.showUI()
end
function tXTRA.inEvent()
    return currentEvent.isActive or isDoingSequence or d
end
RegisterNetEvent(
    "XTRA:setIsAnyEventActive",
    function(a8)
        f = a8
    end
)