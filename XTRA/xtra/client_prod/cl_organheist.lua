local a = module("cfg/cfg_organheist")
inOrganHeist = false
local b = vector3(240.31098937988, -1379.8699951172, 33.741794586182)
local c = vector3(231.51065063477, -1360.6903076172, 28.651802062988)
local d = 600
local e = false
local f = false
local g = false
local h = ""
local i = {}
local j = {}
local k = nil
local l, m = AddRelationshipGroup("ORGANHEIST_POLICE")
local l, n = AddRelationshipGroup("ORGANHEIST_CRIMINAL")
local o = {
    ["civs"] = {
        objectHash = GetHashKey("prop_gate_military_01"),
        objectPos = vector3(251.2504, -1361.306, 23.54731),
        objectHeading = 322.19732666016,
        objectHandler = 0
    },
    ["cops"] = {
        objectHash = GetHashKey("prop_gate_military_01"),
        objectPos = vector3(251.1472, -1361.884, 38.54385),
        objectHeading = 318.79,
        objectHandler = 0
    }
}
AddEventHandler(
    "XTRA:onClientSpawn",
    function(p, q)
        if q then
            tXTRA.addMarker(b.x, b.y, b.z, 0.7, 0.7, 0.5, 0, 125, 255, 125, 150, 20, false, false, true)
            tXTRA.addBlip(b.x, b.y, b, 378, 3, "Organ Heist Police")
            tXTRA.addMarker(c.x, c.y, c.z, 0.7, 0.7, 0.5, 255, 0, 0, 125, 150, 20, false, false, true)
            tXTRA.addBlip(c.x, c.y, c.z, 378, 1, "Organ Heist Criminals")
        end
    end
)
Citizen.CreateThread(
    function()
        while true do
            local r = GetPlayerPed(-1)
            local s = GetEntityCoords(r)
            if #(s - c) < 1.0 then
                f = true
            else
                f = false
            end
            if #(s - b) < 1.0 then
                e = true
            else
                e = false
            end
            Wait(250)
        end
    end
)
local function t()
    PinInteriorInMemory(265473)
    ForceRoomForEntity(PlayerPedId(), 265473, 1714842308)
    ForceRoomForGameViewport(265473, 1714842308)
end
Citizen.CreateThread(
    function()
        while true do
            if f then
                drawNativeNotification("~r~Press ~INPUT_PICKUP~ to play the Organ Heist!")
                if IsControlJustPressed(0, 38) then
                    if not globalOnPoliceDuty then
                        if not g then
                            TriggerServerEvent("XTRA:joinOrganHeist")
                            Wait(100)
                        else
                            tXTRA.notify("~r~Already joined the Organ Heist!")
                        end
                    else
                        tXTRA.notify("~r~You are police, please use the other entrance!")
                    end
                end
            elseif e then
                drawNativeNotification("~b~Press ~INPUT_PICKUP~ to play the Organ Heist!")
                if IsControlJustPressed(0, 38) then
                    if globalOnPoliceDuty then
                        if not g then
                            TriggerServerEvent("XTRA:joinOrganHeist")
                            Wait(100)
                        else
                            tXTRA.notify("~r~Already joined the Organ Heist!")
                        end
                    else
                        tXTRA.notify("~r~You are a civillian, please use the other entrance!")
                    end
                end
            end
            if inOrganHeist and inWaitingStage then
                DrawGTATimerBar("STARTS IN:", decimalsToMinutes(d), 1)
                DisablePlayerFiring(PlayerId(), true)
            end
            if inGamePhase or inWaitingStage then
                DrawGTATimerBar("~b~Police:", table.count(i), 3)
                DrawGTATimerBar("~r~Criminals:", table.count(j), 2)
                drawNativeText("~b~Kill the enemy team and survive.")
                RemoveWeaponFromPed(tXTRA.getPlayerPed(), "WEAPON_MOLOTOV")
                RemoveWeaponFromPed(tXTRA.getPlayerPed(), "WEAPON_FLASHBANG")
                RemoveWeaponFromPed(tXTRA.getPlayerPed(), "WEAPON_SMOKEGRENADEFR")
                RemoveWeaponFromPed(tXTRA.getPlayerPed(), "WEAPON_SMOKEGRENADEFRPD")
                RemoveWeaponFromPed(tXTRA.getPlayerPed(), "WEAPON_BZGAS")
                RemoveWeaponFromPed(tXTRA.getPlayerPed(), "WEAPON_STUNGUN")
                local r = PlayerPedId()
                local u = GetInteriorFromEntity(r)
                if u == 0 then
                    local v = k.safePositions[1]
                    DoScreenFadeOut(1000)
                    NetworkFadeOutEntity(PlayerPedId(), true, false)
                    Wait(1000)
                    SetEntityCoords(PlayerPedId(), v.x, v.y, v.z)
                    t()
                    NetworkFadeInEntity(PlayerPedId(), 0)
                    DoScreenFadeIn(1000)
                end
            end
            Wait(0)
        end
    end
)
RegisterNetEvent(
    "XTRA:teleportToOrganHeist",
    function(w, x, y, z)
        local r = PlayerPedId()
        d = x
        canPlayAnim = false
        h = y
        k = a.locations[z]
        g = true
        tXTRA.setCanAnim(false)
        Citizen.CreateThread(
            function()
                while true do
                    d = d - 1
                    Wait(1000)
                end
            end
        )
        inOrganHeist = true
        inWaitingStage = true
        SetRelationshipBetweenGroups(5, m, n)
        SetRelationshipBetweenGroups(5, n, m)
        if y == "civ" then
            SetPedRelationshipGroupHash(PlayerPedId(), n)
            tXTRA.createAtm("Organ Heist", k.atmLocation)
        elseif y == "police" then
            SetPedRelationshipGroupHash(PlayerPedId(), m)
        end
        for l, A in pairs(k.gunStores[h]) do
            tXTRA.createGunStore(A[1], A[2], A[3])
        end
        tXTRA.setFriendlyFire(false)
        DoScreenFadeOut(1000)
        NetworkFadeOutEntity(r, true, false)
        Wait(1000)
        SetEntityCoords(r, w.x, w.y, w.z)
        t()
        NetworkFadeInEntity(r, 0)
        DoScreenFadeIn(1000)
        initializeOrganHeistScaleform()
        PrepareMusicEvent("AH3B_HALF_RAPPEL")
        TriggerMusicEvent("AH3B_HALF_RAPPEL")
    end
)
RegisterNetEvent(
    "XTRA:addOrganHeistPlayer",
    function(B, y)
        if y == "civ" then
            j[B] = true
        elseif y == "police" then
            i[B] = true
        end
    end
)
RegisterNetEvent("XTRA:organHeistKillConfirmed",function(C,Amount)
    PlaySoundFrontend(-1, "Weapon_Upgrade", "DLC_GR_Weapon_Upgrade_Soundset", true)
    tXTRA.playScreenEffect("MP_Celeb_Win", 0.25)
    tXTRA.notify("~g~Killed " .. C .. " received £"..getMoneyStringFormatted(Amount).." and 25% Armour")
end)
local function D()
    local E = 1000.0
    local F = 0.0
    local u = GetEntityCoords(PlayerPedId())
    for l, G in pairs(k.pastGates) do
        local H = #(u - G)
        if H < E then
            E = H
        end
        if H > F then
            F = H
        end
    end
    return E, F
end
Citizen.CreateThread(
    function()
        while true do
            if inWaitingStage then
                local E = D()
                if E < 3.0 then
                    DoScreenFadeOut(1000)
                    NetworkFadeOutEntity(PlayerPedId(), true, false)
                    Wait(1000)
                    local x = k.safePositions[1]
                    SetEntityCoords(PlayerPedId(), x.x, x.y, x.z)
                    t()
                    NetworkFadeInEntity(PlayerPedId(), 0)
                    DoScreenFadeIn(1000)
                    tXTRA.notify("~r~You got too far from the organ heist and have been teleported back.")
                end
            end
            if inGamePhase then
                local l, F = D()
                if F > 350.0 then
                    DoScreenFadeOut(1000)
                    NetworkFadeOutEntity(PlayerPedId(), true, false)
                    Wait(1000)
                    local x = k.safePositions[1]
                    SetEntityCoords(PlayerPedId(), x.x, x.y, x.z)
                    t()
                    NetworkFadeInEntity(PlayerPedId(), 0)
                    DoScreenFadeIn(1000)
                    tXTRA.notify("~r~You got too far from the organ heist and have been teleported back.")
                end
            end
            Wait(0)
        end
    end
)
function createOrganHeistBarriers()
    for I, J in pairs(o) do
        if not HasModelLoaded(J.objectHash) then
            RequestModel(J.objectHash)
            while not HasModelLoaded(J.objectHash) do
                Wait(0)
            end
        end
        local K = CreateObject(J.objectHash, J.objectPos.x, J.objectPos.y, J.objectPos.z, false, false, true)
        o[I].objectHandler = K
        SetEntityHeading(K, o[I].objectHeading)
        SetEntityInvincible(K, true)
        FreezeEntityPosition(K, true)
        SetModelAsNoLongerNeeded(J.objectHash)
    end
end
RegisterNetEvent(
    "XTRA:startOrganHeist",
    function()
        inWaitingStage = false
        inGamePhase = true
        PlaySoundFrontend(-1, "5s_To_Event_Start_Countdown", "GTAO_FM_Events_Soundset", 1)
        Wait(5000)
        DisablePlayerFiring(PlayerId(), false)
    end
)
RegisterNetEvent(
    "XTRA:removeFromOrganHeist",
    function(L)
        if i[L] then
            i[L] = nil
        end
        if j[L] then
            j[L] = nil
        end
    end
)
function moveUpGateObjects()
    Citizen.CreateThread(
        function()
            for I, J in pairs(o) do
                DeleteObject(J.objectHandler)
            end
        end
    )
end
function initializeOrganHeistScaleform()
    local M = true
    SetTimeout(
        5000,
        function()
            M = false
        end
    )
    Citizen.CreateThread(
        function()
            function Initialize(scaleform)
                local scaleform = RequestScaleformMovie(scaleform)
                while not HasScaleformMovieLoaded(scaleform) do
                    Citizen.Wait(0)
                end
                BeginScaleformMovieMethod(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
                ScaleformMovieMethodAddParamTextureNameString("~g~ORGAN HEIST!")
                ScaleformMovieMethodAddParamTextureNameString("Survive the Organ Heist and win £250,000")
                EndScaleformMovieMethod()
                return scaleform
            end
            scaleform = Initialize("mp_big_message_freemode")
            PlaySound(-1, "Hit", "RESPAWN_SOUNDSET", 0, 0, 1)
            while M do
                local N = 0.5
                local O = 0.35
                local P = 1.0
                local D = P
                DrawScaleformMovie(scaleform, N, O, P, D)
                Wait(0)
            end
        end
    )
end
function decimalsToMinutes(E)
    local F = tonumber(E)
    if F % 60 <= 9 then
        addonString = "0"
    else
        addonString = ""
    end
    return math.floor(F / 60) .. ":" .. addonString .. F % 60
end
AddEventHandler(
    "onResourceStop",
    function(G)
        if G == GetCurrentResourceName() then
            for I, J in pairs(o) do
                DeleteObject(o[I].objectHandler)
            end
        end
    end
)
RegisterNetEvent(
    "XTRA:endOrganHeist",
    function()
        ClearRelationshipBetweenGroups(5, n, m)
        ClearRelationshipBetweenGroups(5, m, n)
        SetPedRelationshipGroupHash(PlayerPedId(), "PLAYER")
        i = {}
        j = {}
        g = false
        inOrganHeist = false
        inWaitingStage = false
        inGamePhase = false
        d = 600
        tXTRA.deleteAtm("Organ Heist")
        for l, A in pairs(k.gunStores[h]) do
            tXTRA.deleteGunStore(A[1])
        end
        h = ""
        k = nil
        tXTRA.setCanAnim(true)
        tXTRA.setFriendlyFire(true)
        PrepareMusicEvent("BST_STOP")
        TriggerMusicEvent("BST_STOP")
        ExecuteCommand("storeallweapons")
        Wait(10000)
        if GetEntityHealth(PlayerPedId()) <= 102 then
            tXTRA.RevivePlayer()
            local r = PlayerPedId()
            DoScreenFadeOut(1000)
            NetworkFadeOutEntity(r, true, false)
            Wait(1000)
            SetEntityCoords(r, 240.31098937988, -1379.8699951172, 33.741794586182)
            NetworkFadeInEntity(r, 0)
            DoScreenFadeIn(1000)
        end
    end
)
RegisterNetEvent(
    "XTRA:endOrganHeistWinner",
    function(y)
        Wait(10000)
        winOrganHeist(y)
        local r = PlayerPedId()
        tXTRA.setFriendlyFire(true)
        DoScreenFadeOut(1000)
        NetworkFadeOutEntity(r, true, false)
        Wait(1000)
        SetEntityCoords(r, 240.31098937988, -1379.8699951172, 33.741794586182)
        NetworkFadeInEntity(r, 0)
        DoScreenFadeIn(1000)
    end
)
local function H(Q, R, S, T)
    ClearTimecycleModifier()
    local U = {
        handle = Scaleform("MP_CELEBRATION"),
        handle2 = Scaleform("MP_CELEBRATION_BG"),
        handle3 = Scaleform("MP_CELEBRATION_FG")
    }
    for V, W in pairs(U) do
        W.RunFunction("CLEANUP", {"WINNER"})
        W.RunFunction("CREATE_STAT_WALL", {"WINNER", "HUD_COLOUR_BLACK", "70.0"})
        W.RunFunction(
            "SET_PAUSE_DURATION",
            {function()
                    ScaleformMovieMethodAddParamFloat(2.5)
                end}
        )
        if T ~= 0 then
            W.RunFunction("ADD_CASH_TO_WALL", {"WINNER", T, true})
        end
        W.RunFunction("ADD_WINNER_TO_WALL", {"WINNER", "CELEB_WINNER", Q, "", 0, false, "", false})
        W.RunFunction("ADD_BACKGROUND_TO_WALL", {"WINNER", 75, 0})
        W.RunFunction("SHOW_STAT_WALL", {"WINNER"})
    end
    return U.handle, U.handle2, U.handle3
end
function winOrganHeist(y)
    Citizen.CreateThread(
        function()
            local X = false
            local Y, Z, _ = H(y, 2, 100, 250000)
            if not X then
                X = true
            end
            SetTimeout(
                10000,
                function()
                    X = false
                end
            )
            while X do
                Wait(0)
                HideHudAndRadarThisFrame()
                DrawScaleformMovieFullscreenMasked(Z.Handle, _.Handle, 255, 255, 255, 255)
                Y.Render2D()
            end
        end
    )
end
function tXTRA.setDeathInOrganHeist()
    inOrganHeist = false
    inWaitingStage = false
    inGamePhase = false
end
RegisterCommand(
    "tporgan",
    function()
        if isInGreenzone then
            TriggerServerEvent("XTRA:TPToOrganHeist")
        else
            notify("~r~You must be in a Green Zone to use this command.")
        end
    end
)
