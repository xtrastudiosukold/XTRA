local a = false
local b = module("cfg/events/cfg_battleroyale")
local c = {location = 1, amount = 1}
local d = {}
local e
local function f()
    return {
        gas = {radius = 0.0, coords = nil, isActive = false, blip = 0, timeUntilNext = {minutes = 2, seconds = 0}},
        data = {plane = 0, lootBoxes = {}, armourPlates = {}, timer = 15, leaderboard = {}},
        player = {canExitPlane = false, isInWinnerScreen = false, hasJumped = false},
        players = {}
    }
end
local g = f()
Citizen.CreateThread(
    function()
        for h = 1, #b.locations do
            d[h] = b.locations[h].name
        end
    end
)
tXTRA.registerEventMenuItem("Battle Royal","XTRA Battlegrounds",function()
    RageUI.Separator("Minimum Players: 5")
    RageUI.Separator("Maximum Players: 50")
    RageUI.List("Location",d,c.location,nil,{},true,function(i, j, k, l)
            if j then
                c.location = l
            end
        end,function()
    end)
    if not currentEvent.isActive then
        RageUI.ButtonWithStyle("Start Event",nil,{RightLabel = "→→→"},true,function(i, j, k)
            if k then
                e = c.location
                TriggerServerEvent("XTRA:startEvent","Battle Royal","XTRA Battlegrounds",5,50,{locationIndex = c.location, name = d[c.location]})
            end
        end)
    end
end)
local function m()
    if a then
        DrawRect(0.496, 0.945, 1.008, 0.12, 0, 0, 0, 150)
        DrawRect(0.493, 0.059, 1.025, 0.12, 0, 0, 0, 150)
        if CursorInArea(GetArea(0.493, 0.944, 0.14, 0.074)) then
            DrawRect(0.493, 0.944, 0.14, 0.074, 0, 203, 93, 134)
        else
            DrawRect(0.493, 0.944, 0.14, 0.074, 0, 180, 93, 134)
        end
        if g.data.timer > 0 then
            DrawAdvancedText(0.587, 0.934, 0.005, 0.0028, 0.971, tostring(g.data.timer), 255, 255, 255, 255, 4, 0)
        else
            DrawAdvancedText(0.587, 0.934, 0.005, 0.0028, 0.971, "JUMP", 255, 255, 255, 255, 4, 0)
        end
        DrawAdvancedText(0.591, 0.042, 0.005, 0.0028, 0.993, "XTRA BATTLEGROUNDS", 255, 255, 255, 255, 6, 0)
    end
end
tXTRA.createThreadOnTick(m)
local function n()
    if g.player.isInWinnerScreen then
        DrawRect(0.486, 0.064, 1.081, 0.202, 0, 0, 0, 150)
        DrawAdvancedText(0.262,0.067,0.005,0.0028,0.96599999999999,"WINNER WINNER CHICKEN DINNER!",255,255,255,255,6,0)
        DrawRect(0.478, 0.933, 1.054, 0.194, 0, 0, 0, 150)
        DrawAdvancedText(0.582,0.905,0.005,0.0028,0.96599999999999,"#1 " .. tXTRA.getPlayerName(PlayerId()),255,255,255,255,6,0)
        if CursorInArea(GetArea(0.092, 0.925, 0.154, 0.096)) then
            DrawRect(0.092, 0.925, 0.154, 0.096, 100, 0, 0, 174)
        else
            DrawRect(0.092, 0.925, 0.154, 0.096, 78, 0, 0, 174)
        end
        DrawAdvancedText(0.185, 0.91, 0.005, 0.0028, 0.971, "LEAVE", 255, 255, 255, 255, 6, 0)
    end
end
tXTRA.createThreadOnTick(n)
function func_handleClicks()
    if a then
        setCursor(1)
        DisableAllControlActions(0)
        EnableControlAction(0, 329, true)
        EnableControlAction(1, 329, true)
        EnableControlAction(2, 239, true)
        EnableControlAction(2, 240, true)
        if CursorInArea(GetArea(0.493, 0.944, 0.14, 0.074)) then
            if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                if g.player.canExitPlane then
                    tXTRA.setPlayerCanOpenLeaderboard(true)
                    PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                    ClearPedTasks(PlayerPedId())
                    TaskLeaveVehicle(PlayerPedId(), g.data.plane, 64)
                    SetEntityVisible(PlayerPedId(), true, true)
                    g.player.hasJumped = true
                    SetTimeout(5000,function()
                        DeleteEntity(g.data.plane)
                        if currentEvent.isActive then
                            for o, p in pairs(GetActivePlayers()) do
                                if p ~= PlayerId() then
                                    NetworkConcealPlayer(p, false, 0)
                                    SetEntityVisible(GetPlayerPed(p), true, true)
                                end
                            end
                        end
                        local q = PlayerPedId()
                        local r = false
                        while HasPedGotWeapon(q, "GADGET_PARACHUTE", false) do
                            local s = GetEntityHeightAboveGround(q)
                            if s > 10.0 and s < 250.0 and IsPedInParachuteFreeFall(q) then
                                drawNativeNotification("Press ~INPUT_PARACHUTE_DEPLOY~ to deploy your parachute.")
                                if s < 100.0 and not r then
                                    SetControlNormal(0, 144, 1.0)
                                    r = true
                                end
                            end
                            Citizen.Wait(0)
                        end
                    end)
                    setCursor(0)
                    a = false
                    inGUIXTRA = false
                    tXTRA.showUI()
                end
            end
        end
    end
    if g.player.isInWinnerScreen then
        if CursorInArea(GetArea(0.092, 0.925, 0.154, 0.096)) then
            if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                setCursor(0)
                g.player.isInWinnerScreen = false
                inGUIXTRA = false
                a = false
                g = f()
                tXTRA.showUI()
            end
        end
    end
end
tXTRA.createThreadOnTick(func_handleClicks)
RegisterNetEvent("XTRA:syncLootboxesTable",function(t, u)
    g.data.lootBoxes = table.copy(b.lootBoxes[u])
    g.data.armourPlates = table.copy(b.armourPlates[u])
    tXTRA.loadModel("prop_box_ammo03a")
    for v, w in pairs(g.data.lootBoxes) do
        if #(w.coords - g.gas.coords) < g.gas.radius / 2 then
            g.data.lootBoxes[v].areaId = "xtrabr_lootbox_" .. v
            tXTRA.setNamedBlip("xtrabr_lootbox_" .. v, w.coords.x, w.coords.y, w.coords.z, 478, 1, "Lootbox", 0.5)
            local x = function(y)
                if g.data.lootBoxes[y.box] then
                    if g.data.lootBoxes[y.box].entity == nil then
                        g.data.lootBoxes[y.box].entity = CreateObject("prop_box_ammo03a", w.coords, false, false, false, false, false)
                        DecorSetInt(g.data.lootBoxes[y.box].entity, "lootid", t[y.box])
                        SetEntityHeading(g.data.lootBoxes[y.box].entity, 10.0)
                        PlaceObjectOnGroundProperly(g.data.lootBoxes[y.box].entity)
                        FreezeEntityPosition(g.data.lootBoxes[y.box].entity, true)
                    end
                else
                    print(string.format("[XTRA] lootbox with ID: %s is nil", y.box))
                end
            end
            local z = function(y)
                if g.data.lootBoxes[y.box] then
                    if g.data.lootBoxes[y.box].entity then
                        if DoesEntityExist(g.data.lootBoxes[y.box].entity) then
                            DeleteEntity(g.data.lootBoxes[y.box].entity)
                            g.data.lootBoxes[v].entity = nil
                        end
                    end
                end
            end
            local A = function()
            end
            tXTRA.createArea("xtrabr_lootbox_" .. v, w.coords, 200.0, 6, x, z, A, {box = v})
        end
    end
    SetModelAsNoLongerNeeded("prop_box_ammo03a")
    tXTRA.loadModel("prop_armour_pickup")
    for v, w in pairs(g.data.armourPlates) do
        if #(w.coords - g.gas.coords) < g.gas.radius / 2 then
            tXTRA.setNamedBlip("xtrabr_armour_" .. v, w.coords.x, w.coords.y, w.coords.z, 175, 1, "Lootbox", 0.5)
            local B = function(C)
                if g.data.armourPlates[C.plateId] then
                    if g.data.armourPlates[C.plateId].entity == nil then
                        g.data.armourPlates[C.plateId].entity = CreateObject("prop_armour_pickup", w.coords, false, false, false, false, false)
                        SetEntityHeading(g.data.armourPlates[C.plateId].entity, 10.0)
                        PlaceObjectOnGroundProperly(g.data.armourPlates[C.plateId].entity)
                        FreezeEntityPosition(g.data.armourPlates[C.plateId].entity, true)
                    end
                else
                    print(
                        string.format("[XTRA Events] body armour with ID of %s is nil in table (onEnter)", C.plateId)
                    )
                end
            end
            local D = function(C)
                if g.data.armourPlates[C.plateId] then
                    if g.data.armourPlates[C.plateId].entity then
                        if DoesEntityExist(g.data.armourPlates[C.plateId].entity) then
                            DeleteEntity(g.data.armourPlates[C.plateId].entity)
                            g.data.armourPlates[C.plateId].entity = nil
                        end
                    end
                else
                    print(string.format("[XTRA Events] body armour with ID of %s is nil in table (onLeave)", C.plateId))
                end
            end
            local E = function(C)
                if g.data.armourPlates[C.plateId] then
                    if C.distance <= 1.5 then
                        local F = g.data.armourPlates[C.plateId].coords
                        tXTRA.DrawText3D(vector3(F.x, F.y, F.z - 0.5), "Press [E] to pickup armour.", 0.2)
                        if IsControlJustPressed(0, 51) then
                            TriggerServerEvent("XTRA:removeArmourPlate", C.plateId)
                            SetPedComponentVariation(PlayerPedId(), 9, 15, 3, 0)
                        end
                    end
                end
            end
            tXTRA.createArea("xtrabr_armour_" .. v, w.coords, 200.0, 6, B, D, E, {plateId = v})
            g.data.armourPlates[v].areaId = "xtrabr_armour_" .. v
        end
    end
    SetModelAsNoLongerNeeded("prop_armour_pickup")
end)
RegisterNetEvent("XTRA:removeLootBox",function(G)
    tXTRA.removeArea("xtrabr_lootbox_" .. G)
    tXTRA.removeNamedBlip("xtrabr_lootbox_" .. G)
    if g.data.lootBoxes[G].entity then
        if DoesEntityExist(g.data.lootBoxes[G].entity) then
            DeleteEntity(g.data.lootBoxes[G].entity)
            g.data.lootBoxes[G].entity = nil
        end
    end
    g.data.lootBoxes[G] = nil
end)
RegisterNetEvent("XTRA:removeArmourPlateCl",function(H)
    tXTRA.removeArea("xtrabr_armour_" .. H)
    tXTRA.removeNamedBlip("xtrabr_armour_" .. H)
    if g.data.armourPlates[H] then
        if g.data.armourPlates[H].entity then
            if DoesEntityExist(g.data.armourPlates[H].entity) then
                DeleteEntity(g.data.armourPlates[H].entity)
                g.data.armourPlates[H].entity = nil
            end
        end
        g.data.armourPlates[H] = nil
    end
end)
RegisterNetEvent("XTRA:startBattlegrounds",function(I)
    e = I
    tXTRA.startGas(b.locations[e].gas.initalRadius, b.locations[e].gas.centre)
    DoScreenFadeOut(1500)
    Wait(1500)
    currentEvent.eventName = "Battle Royale"
    globalHideUi = true
    TriggerEvent("XTRA:showHUD", false)
    TriggerEvent("chat:clear")
    tXTRA.stopEventSequence(true)
    tXTRA.giveWeapons({["GADGET_PARACHUTE"] = {2}})
    SetEntityCoords(PlayerPedId(), b.locations[e].planeStart)
    tXTRA.loadModel("titan")
    for o, p in pairs(GetActivePlayers()) do
        if p ~= PlayerId() then
            NetworkConcealPlayer(p, true, 0)
            SetEntityVisible(GetPlayerPed(p), false, false)
        end
    end
    local J = tXTRA.spawnVehicle("titan", b.locations[e].planeStart, b.locations[e].planeHeading, false, false, true)
    SetModelAsNoLongerNeeded("titan")
    SetEntityCollision(J, false, true)
    SetVehicleEngineOn(J, true, true, false)
    SetPlaneTurbulenceMultiplier(J, 0.0)
    tXTRA.loadModel("s_m_m_pilot_02")
    local K = CreatePedInsideVehicle(J, 1, "s_m_m_pilot_02", -1, false, true)
    SetModelAsNoLongerNeeded("s_m_m_pilot_02")
    Wait(500)
    SetPedIntoVehicle(PlayerPedId(), J, -2)
    SetPedKeepTask(K, true)
    ActivatePhysics(J)
    SetVehicleEngineHealth(J, 1000.0)
    SetVehicleBodyHealth(J, 1000.0)
    SetVehicleDeformationFixed(J)
    SetVehicleForwardSpeed(J, 60.0)
    SetHeliBladesFullSpeed(J)
    SetVehicleEngineOn(J, true, true, false)
    ControlLandingGear(J, 3)
    OpenBombBayDoors(J)
    SetEntityProofs(J, true, true, true, true, true, true, true, true)
    SetEntityInvincible(J, true)
    TaskVehicleDriveToCoord(K,J,b.locations[e].planeEnd + vector3(0.0, 0.0, 500.0),60.0,0,"titan",262144,15.0,-1.0,0.0,0.0)
    SetEntityVisible(PlayerPedId(), false, false)
    setCursor(1)
    g.data.plane = J
    a = not a
    inGUIXTRA = not inGUIXTRA
    Wait(1500)
    DoScreenFadeIn(1500)
    Citizen.CreateThread(function()
        while not g.player.canExitPlane and currentEvent.isActive do
            g.data.timer = g.data.timer - 1
            Wait(1000)
        end
    end)
    SetTimeout(15000,function()
        if currentEvent.isActive then
            g.player.canExitPlane = true
            SetTimeout(45000,function()
                local L = tXTRA.getPlayerVehicle()
                if currentEvent.isActive and g.data.plane == L then
                    local F = GetEntityCoords(g.data.plane, true)
                    AddExplosion(F.x, F.y, F.z, 0, 1.0, true, false, 1.0)
                    SetEntityHealth(PlayerPedId(), 0)
                end
            end)
        end
    end)
end)
RegisterNetEvent("XTRA:winBattleRoyale",function()
    globalHideUi = true
    TriggerEvent("XTRA:showHUD", false)
    TriggerEvent("chat:clear")
    g.player.isInWinnerScreen = true
    inGUIXTRA = true
    setCursor(1)
    TriggerEvent("playSound:questcomplete")
end)

tXTRA.registerEventCleanupHandler("XTRA Battlegrounds",function()
    currentEvent.isActive = false
    tXTRA.setPlayerCanOpenLeaderboard(false)
    for v, w in pairs(g.data.lootBoxes) do
        tXTRA.removeArea(w.areaId)
        tXTRA.removeNamedBlip(w.areaId)
        if DoesEntityExist(w.entity) then
            DeleteEntity(w.entity)
        end
    end
    for v, w in pairs(g.data.armourPlates) do
        tXTRA.removeArea(w.areaId)
        tXTRA.removeNamedBlip(w.areaId)
        if DoesEntityExist(w.entity) then
            DeleteEntity(w.entity)
        end
    end
    RemoveBlip(g.gas.blip)
    if not g.player.isInWinnerScreen then
        inGUIXTRA = false
        a = false
        setCursor(0)
        g = f()
    end
end)
function tXTRA.startGas(M, F)
    g.gas.coords = F
    g.gas.radius = M
    g.gas.blip = AddBlipForRadius(F.x, F.y, F.z, M / 2.0)
    SetBlipColour(g.gas.blip, 1)
    SetBlipAlpha(g.gas.blip, 155)
    g.gas.isActive = not g.gas.isActive
end
function tXTRA.changeGasRadius(M)
    SendNUIMessage({transactionType = "br-gas"})
    g.gas.timeUntilNext = {minutes = 2, seconds = 0}
    tXTRA.announceMpBigMsg("~r~GAS MOVING", "The gas is closing in!", 5000)
    Wait(4000)
    Citizen.CreateThread(function()
        while g.gas.isActive and g.gas.radius > tonumber(M) and currentEvent.isActive do
            g.gas.radius = g.gas.radius - g.gas.radius * 0.008 * GetFrameTime()
            RemoveBlip(g.gas.blip)
            g.gas.blip = AddBlipForRadius(g.gas.coords.x, g.gas.coords.y, g.gas.coords.z, g.gas.radius / 2.0)
            SetBlipColour(g.gas.blip, 1)
            SetBlipAlpha(g.gas.blip, 155)
            Wait(0)
        end
    end)
end
tXTRA.createThreadOnTick(function()
    if g.gas.isActive then
        local M = g.gas.radius
        if M >= 1800.0 then
            M = M - 17.5
        elseif M >= 1400.0 then
            M = M - 15.0
        elseif M >= 1000 then
            M = M - 12.5
        elseif M >= 600 then
            M = M - 10.0
        elseif M >= 250 then
            M = M - 5.0
        end
        DrawMarker(1,g.gas.coords.x,g.gas.coords.y,0.0,0.0,0.0,0.0,1.0,1.0,1.0,M,M,6000.0,255,0,0,155,false,false,2,false,nil,nil,false)
    end
end)
local N = {[1] = "1st", [2] = "2nd", [3] = "3rd"}
local O = {[1] = 4, [2] = 3, [3] = 2}
local P = {[1] = "~HUD_COLOUR_GOLD~", [2] = "~HUD_COLOUR_SILVER~", [3] = "~HUD_COLOUR_BRONZE~"}
tXTRA.createThreadOnTick(function()
    if currentEvent.isActive and currentEvent.eventName == "Battle Royale" then
        for h = 1, 3 do
            if g.data.leaderboard[h] then
                DrawGTATimerBar(P[h] .. N[h] .. " " .. g.data.leaderboard[h].name,P[h] .. g.data.leaderboard[h].kills,O[h] + 1)
            end
        end
        DrawGTATimerBar("~y~GAS:~w~",string.format("~y~%02d:%02d", g.gas.timeUntilNext.minutes, g.gas.timeUntilNext.seconds),2)
    end
end)
Citizen.CreateThread(function()
    while true do
        if g.gas.isActive then
            if g.gas.timeUntilNext.seconds > 0 then
                g.gas.timeUntilNext.seconds = g.gas.timeUntilNext.seconds - 1
            else
                if g.gas.timeUntilNext.seconds == 0 and g.gas.timeUntilNext.minutes == 0 then
                    tXTRA.changeGasRadius(g.gas.radius - 400)
                else
                    g.gas.timeUntilNext.seconds = 59
                    g.gas.timeUntilNext.minutes = g.gas.timeUntilNext.minutes - 1
                end
            end
        end
        Wait(1000)
    end
end)
local function Q()
    local R = sortedKeys(g.players,function(S, T)
        return g.players[S].kills > g.players[T].kills
    end)
    for h = 1, 3 do
        if g.players[R[h]] then
            g.players[R[h]].leaderboardPos = h
            g.data.leaderboard[h] = g.players[R[h]]
        end
    end
end
RegisterNetEvent("XTRA:addBRKill",function(p, U)
    if g.players[p] then
        g.players[p].kills = g.players[p].kills + 1
    else
        g.players[p] = {source = p, name = U, kills = 1}
    end
    tXTRA.updateScoreboard(p, 5, g.players[p].kills)
    Q()
end)
RegisterNetEvent("XTRA:removePlayerFromBR",function(V)
    if g.players[V] then
        local p = table.copy(g.players[V])
        g.players[V] = nil
        if p.leaderboardPos then
            g.data.leaderboard[p.leaderboardPos] = nil
            Q()
        end
    end
    tXTRA.removePlayerFromLeaderboard(V)
end)
Citizen.CreateThread(function()
    while true do
        if g.gas.isActive and g.player.hasJumped and not IsPedInParachuteFreeFall(PlayerPedId()) and GetPedParachuteState(PlayerPedId()) <= 2 and currentEvent.isActive and not tXTRA.isSpectatingEvent() then
            if #(tXTRA.getPlayerCoords().xy - g.gas.coords.xy) > g.gas.radius / 2.0 then
                drawNativeText("~r~You are in the gas. Get to the safe zone before you suffocate.")
                local K = PlayerPedId()
                local W = GetEntityHealth(K)
                SetEntityHealth(K, W - 1)
            end
        end
        Wait(500)
    end
end)
