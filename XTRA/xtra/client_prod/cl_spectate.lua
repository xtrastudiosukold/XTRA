local a = false
local b = nil
local c = 0
local d = 90
local e = -3.5
local f = nil
local g = vector3(5218.9399414062, -5393.2563476562, 67.318588256836)
local h = 0
local i = 0
local j = false
local k = 0
local l = 0
local m = 0
local function n(o, e, c, d)
    local p = math.rad(c)
    local q = math.rad(d)
    return vector3(o.x + e * math.sin(q) * math.cos(p), o.y - e * math.sin(q) * math.sin(p), o.z - e * math.cos(q))
end
local function r()
    return tXTRA.getStaffLevel() >= 6 or tXTRA.isDev()
end
RegisterNetEvent(
    "XTRA:spectatePlayer",
    function(s, t)
        if r() then
            m = 0
        end
        local u = PlayerPedId()
        FreezeEntityPosition(u, true)
        SetEntityCollision(u, false, false)
        SetEntityVisible(u, false, 0)
        local v = math.random(7500, 8900)
        local w = math.random(7500, 8900)
        local x = math.random(1, 2) == 2
        if x then
            v = -v
            w = -w
        end
        SetEntityCoordsNoOffset(u, v + 0.0, w + 0.0, 1000.0, false, false, false)
        f = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", t.x, t.y, t.z, 0.0, 0.0, 0.0, GetGameplayCamFov(), false, 2)
        SetCamActive(f, true)
        RenderScriptCams(true, false, 0, true, true)
        b = s
        while true do
            if not b then
                return
            end
            SetFocusPosAndVel(t.x, t.y, t.z, 0.0, 0.0, 0.0)
            LockMinimapPosition(t.x, t.y)
            SetPlayerBlipPositionThisFrame(t.x, t.y)
            if GetPlayerFromServerId(s) ~= -1 then
                break
            end
            Citizen.Wait(0)
        end
        a = true
        SetEntityInvincible(u, true)
    end
)
RegisterCommand(
    "spectate",
    function(s, t)
        if r() then
            local u = tonumber(t[1])
            if u then
                TriggerServerEvent("XTRA:spectatePlayer", u)
            end
        end
    end
)
local function y()
    SendNUIMessage({clearEnhancedDisplay = true})
end
RegisterNetEvent(
    "XTRA:stopSpectatePlayer",
    function()
        if r() then
            y()
        end
        a = false
        ClearFocus()
        b = nil
        UnlockMinimapPosition()
        SetCamActive(f, false)
        RenderScriptCams(false, false, 0, false, false)
        DestroyCam(f, false)
        local u = PlayerPedId()
        SetEntityInvincible(u, false)
        SetEntityVisible(u, true, 0)
        SetEntityCollision(u, true, true)
        FreezeEntityPosition(u, false)
        if #(tXTRA.getPlayerCoords() - g) > 2142.0 then
            if tXTRA.isInCayoPerico() then
                DisableCayoPerico(true)
            end
        end
    end
)
local function z(A, B, C, D, E, F, G, H, I, J)
    tXTRA.DrawText(A - C / 2, B - D / 2 + 0.005, F, E, 0, 1, {G, H, I, J})
end
local function K(L)
    local M, A, B = GetScreenCoordFromWorldCoord(L.x, L.y, L.z)
    return M, vector2(A, B)
end
local function N(O, P, Q)
    return O ..
        string.format(
            '<polyline points="%d %d, %d %d" class="enhanced-bone" />',
            math.floor(h * P.x),
            math.floor(i * P.y),
            math.floor(h * Q.x),
            math.floor(i * Q.y)
        )
end
local function R(O, t)
    return O ..
        string.format(
            '<polyline points="%d %d, %d %d" class="enhanced-player" />',
            k,
            l,
            math.floor(h * t.x),
            math.floor(i * t.y)
        )
end
local function S(T)
    local U = GetEntityCoords(T, true)
    local V, W = K(U)
    if not V then
        return
    end
    local X = GetPedBoneIndex(T, 0x9995)
    local Y = GetPedBoneIndex(T, 0xB1C5)
    local Z = GetPedBoneIndex(T, 0x9D4D)
    local _ = GetPedBoneIndex(T, 0x58B7)
    local a0 = GetPedBoneIndex(T, 0xBB0)
    local a1 = GetPedBoneIndex(T, 0x49D9)
    local a2 = GetPedBoneIndex(T, 0xDEAD)
    local a3 = GetPedBoneIndex(T, 0x2E28)
    local a4 = GetPedBoneIndex(T, 0xB3FE)
    local a5 = GetPedBoneIndex(T, 0x3FCF)
    local a6 = GetPedBoneIndex(T, 0x3779)
    local a7 = GetPedBoneIndex(T, 0xCC4D)
    local a8 = GetWorldPositionOfEntityBone(T, X)
    local a9 = GetWorldPositionOfEntityBone(T, Y)
    local aa = GetWorldPositionOfEntityBone(T, Z)
    local ab = GetWorldPositionOfEntityBone(T, _)
    local ac = GetWorldPositionOfEntityBone(T, a0)
    local ad = GetWorldPositionOfEntityBone(T, a1)
    local ae = GetWorldPositionOfEntityBone(T, a2)
    local af = GetWorldPositionOfEntityBone(T, a3)
    local ag = GetWorldPositionOfEntityBone(T, a4)
    local ah = GetWorldPositionOfEntityBone(T, a5)
    local ai = GetWorldPositionOfEntityBone(T, a6)
    local aj = GetWorldPositionOfEntityBone(T, a7)
    local ak, al = K(a8)
    local am, an = K(a9)
    local ao, ap = K(aa)
    local aq, ar = K(ab)
    local as, at = K(ac)
    local au, av = K(ad)
    local aw, ax = K(ae)
    local ay, az = K(af)
    local aA, aB = K(ag)
    local aC, aD = K(ah)
    local aE, aF = K(ai)
    local aG, aH = K(aj)
    local O = ""
    if ak and am then
        O = N(O, al, an)
    end
    if am and aq then
        O = N(O, an, ar)
    end
    if aq and au then
        O = N(O, ar, av)
    end
    if ak and ao then
        O = N(O, al, ap)
    end
    if ao and as then
        O = N(O, ap, at)
    end
    if as and aw then
        O = N(O, at, ax)
    end
    if ak and ay then
        O = N(O, al, az)
    end
    if ay and aA then
        O = N(O, az, aB)
    end
    if aA and aE then
        O = N(O, aB, aF)
    end
    if ay and aC then
        O = N(O, az, aD)
    end
    if aC and aG then
        O = N(O, aD, aH)
    end
    if j and m == 1 then
        O = R(O, W)
    end
    SendNUIMessage({addEnhancedDisplay = true, content = O})
end
local function aI(aJ)
    y()
    h, i = GetActiveScreenResolution()
    local aK, aL = K(GetEntityCoords(aJ, true))
    j = aK
    k = math.floor(aL.x * h)
    l = math.floor(aL.y * i)
    if IsControlJustPressed(0, 121) then
        TriggerServerEvent("XTRA:checkEnhancedPerms")
        if m == 0 then
            m = 1
        elseif m == 1 then
            m = 2
        elseif m == 2 then
            m = 0
        end
    end
    if m > 0 then
        local aM = PlayerPedId()
        for aN, aO in pairs(GetActivePlayers()) do
            local u = GetPlayerPed(aO)
            if u ~= 0 and u ~= aM then
                S(u)
            end
        end
    end
    SendNUIMessage({finishEnhancedDisplay = true})
end
Citizen.CreateThread(
    function()
        while true do
            Wait(0)
            if a then
                local aP = GetPlayerFromServerId(b)
                if aP ~= -1 then
                    local u = tXTRA.getPlayerPed()
                    local aJ = GetPlayerPed(aP)
                    if aJ ~= 0 then
                        local aQ = GetEntityCoords(aJ)
                        local aR = GetEntityHealth(aJ)
                        local aS = GetEntityMaxHealth(aJ)
                        local aT = GetSelectedPedWeapon(aJ)
                        local aU = GetPedArmour(aJ)
                        local aV = GetAmmoInPedWeapon(aJ, aT)
                        z(0.76, 1.44, 1.0, 1.0, 0.4, "Health: " .. aR .. "/" .. aS, 255, 255, 255, 200)
                        z(0.76, 1.415, 1.0, 1.0, 0.4, "Armor: " .. aU, 255, 255, 255, 200)
                        z(
                            0.76,
                            1.39,
                            1.0,
                            1.0,
                            0.4,
                            "Vehicle Health: " .. GetEntityHealth(GetVehiclePedIsIn(aJ, false)),
                            255,
                            255,
                            255,
                            200
                        )
                        local aW = tostring(WeaponNames[aT])
                        z(0.76, 1.365, 1.0, 1.0, 0.4, "Weapon: " .. (aW or "N/A"), 255, 255, 255, 200)
                        z(0.76, 1.340, 1.0, 1.0, 0.4, "Ammo: " .. (aV or "N/A"), 255, 255, 255, 200)
                        local aX = GetActivePlayers()
                        for aY, aZ in pairs(aX) do
                            local a_ = GetPlayerPed(aZ)
                            SetEntityNoCollisionEntity(u, a_, true)
                        end
                        DisableControlAction(2, 15, true)
                        DisableControlAction(2, 17, true)
                        if IsControlPressed(2, 241) then
                            e = e + 0.5
                        end
                        DisableControlAction(2, 14, true)
                        DisableControlAction(2, 16, true)
                        if IsControlPressed(2, 242) then
                            e = e - 0.5
                        end
                        if e > -1 then
                            e = -1
                        end
                        local b0 = GetDisabledControlNormal(0, 1)
                        local b1 = GetDisabledControlNormal(0, 2)
                        c = c + b0 * 10
                        if c >= 360 then
                            c = 0
                        end
                        d = d + b1 * 10
                        if d >= 360 then
                            d = 0
                        end
                        local b2 = n(aQ, e, c, d)
                        SetCamCoord(f, b2.x, b2.y, b2.z)
                        PointCamAtEntity(f, aJ, 0.0, 0.0, 0.0, false)
                        SetFocusPosAndVel(aQ.x, aQ.y, aQ.z, 0.0, 0.0, 0.0)
                        LockMinimapPosition(aQ.x, aQ.y)
                        SetPlayerBlipPositionThisFrame(aQ.x, aQ.y)
                        if #(GetFinalRenderedCamCoord() - g) < 2142.0 then
                            if not tXTRA.isInCayoPerico() then
                                EnableCayoPerico(true)
                            end
                        else
                            if tXTRA.isInCayoPerico() then
                                DisableCayoPerico(true)
                            end
                        end
                        if r() then
                            aI(aJ)
                        end
                    end
                else
                    tXTRA.notify("~r~Couldn't spectate, person not in your zone")
                end
            end
        end
    end
)
local b3 = {}
AddStateBagChangeHandler(
    "conceal",
    nil,
    function(b4, aN, b5)
        local b6 = tonumber(stringsplit(b4, ":")[2])
        if b5 then
            b3[b6] = true
        else
            local aO = GetPlayerFromServerId(b6)
            if aO ~= -1 and aO ~= PlayerId() then
                NetworkConcealPlayer(aO, false, false)
            end
            b3[b6] = nil
        end
    end
)
RegisterNetEvent(
    "onPlayerDropped",
    function(b6)
        b3[b6] = nil
    end
)
local function b7()
    for b6 in pairs(b3) do
        local aO = GetPlayerFromServerId(b6)
        if aO ~= -1 and aO ~= PlayerId() then
            NetworkConcealPlayer(aO, true, true)
        end
    end
end
tXTRA.createThreadOnTick(b7)
function tXTRA.isInSpectate()
    return a
end
