local a = module("xtra-vehicles", "cfg/cfg_vehiclemaxspeeds")
isInGreenzone = false
local b = true
local c = false
local d = false
local e = false
local f = false
local g = 0
local h = false
local i = false
local j = false
local k = vector3(0.0, 0.0, 0.0)
local l = 0.0
local m = {
    {
        colour = 2,
        id = 1,
        pos = vector3(333.91488647461, -597.16156005859, 29.292747497559),
        dist = 40,
        nonRP = false,
        setBit = false,
        maxHeight = 105.0
    },
    {
        colour = 2,
        id = 1,
        pos = vector3(148.066, -1050.763, 29.34099),
        dist = 40,
        nonRP = false,
        setBit = false,
        maxHeight = 87.0
    },
    {
        colour = 2,
        id = 1,
        pos = vector3(-2343.8430175781,288.25698852539,169.46702575684),
        dist = 100,
        nonRP = false,
        setBit = false,
        maxHeight = 87.0
    },
   -- {
       -- colour = 2,
       -- id = 1,
      --  pos = vector3(-110.09871673584, 6464.6030273438, 31.62672996521),
       -- dist = 20,
      --  nonRP = false,
       -- setBit = false,
       -- maxHeight = 50.0
 --   },
    {
        colour = 2,
        id = 1,
        pos = vector3(-1079.5734863281, -843.14739990234, 4.8841333389282),
        dist = 45,
        nonRP = false,
        setBit = false,
        maxHeight = 59.0
    },
    {
        colour = 2,
        id = 1,
        pos = vector3(3492.4128417969, 2578.2199707031, 12.994660377502),
        dist = 100,
        nonRP = true,
        setBit = false,
        maxHeight = 77.0
    },
    {
        colour = 2,
        id = 1,
        pos = vector3(-540.54748535156, -216.42681884766, 37.64966583252),
        dist = 50,
        nonRP = false,
        setBit = false,
        maxHeight = 102.0
    },
    {
        colour = 2,
        id = 1,
        pos = vector3(246.30143737793, -782.50170898438, 30.573167800903),
        dist = 40,
        nonRP = false,
        setBit = false,
        maxHeight = 100.0
    },
    {
        colour = 2,
        id = 1,
        pos = vector3(196.24597167969, 7397.2084960938, 14.497759819031),
        dist = 40,
        nonRP = true,
        setBit = false,
        maxHeight = 150.0
    },
    {
        colour = 2,
        id = 1,
        pos = vector3(1133.0970458984, 250.78565979004, -51.035778045654),
        dist = 100,
        nonRP = false,
        setBit = false,
        interior = true,
        maxHeight = 0.0
    },
    {
        colour = 2,
        id = 1,
        pos = vector3(13.929432868958, 6711.216796875, -105.85443878174),
        dist = 100,
        nonRP = false,
        setBit = false,
        interior = true,
        maxHeight = 0.0
    },
    {
        colour = 2,
        id = 1,
        pos = vector3(-335.19680786133, -699.10406494141, 33.036075592041),
        dist = 30,
        nonRP = false,
        setBit = false,
        maxHeight = 86.0
    },
    {
        colour = 2,
        id = 1,
        pos = vector3(-1671.5692138672, -912.63940429688, 8.2297477722168),
        dist = 50,
        nonRP = false,
        setBit = false,
        maxHeight = 60.0
    },
    {
        colour = 2,
        id = 1,
        pos = vector3(337.64172363281, -1393.6368408203, 32.509204864502),
        dist = 50,
        nonRP = false,
        setBit = false,
        maxHeight = 100.0
    },
    {
        colour = 2,
        id = 1,
        pos = vector3(-2188.3845214844,5180.2080078125,15.915056228638),
        dist = 80,
        nonRP = false,
        setBit = false,
        maxHeight = 100.0
    },
    {
        colour = 2,
        id = 1,
        pos = vector3(-1437.4920654297, -2961.6879882812, 14.313854217529),
        dist = 700,
        nonRP = true,
        setBit = false,
        maxHeight = 210.0,
        isPurge = true
    },
    {
        colour = 2,
        id = 1,
        pos = vector3(-732.95123291016, 5812.35546875, 17.42693901062),
        dist = 40,
        nonRP = false,
        setBit = false,
        maxHeight = 210.0
    },
    {
        colour = 2,
        id = 1,
        pos = vector3(1791.5841064453,4598.9921875,38.500267028809),
        dist = 20,
        nonRP = false,
        setBit = false,
        maxHeight = 210.0
    }
}
local n = {
    {vector3(333.91488647461, -597.16156005859, 29.292747497559), 40.0, 2, 180},
    {vector3(148.066, -1050.763, 29.34099), 40.0, 2, 180},
  --  {vector3(-110.09871673584, 6464.6030273438, 31.62672996521), 20.0, 2, 180},
    {vector3(-1079.5734863281, -843.14739990234, 4.8841333389282), 45.0, 2, 180},
    {vector3(3492.4128417969, 2578.2199707031, 12.994660377502), 100.0, 2, 180},
    {vector3(-540.54748535156, -216.42681884766, 37.64966583252), 50.0, 2, 180},
    {vector3(246.30143737793, -782.50170898438, 30.573167800903), 40.0, 2, 180},
    {vector3(-335.19680786133, -699.10406494141, 33.036075592041), 30.0, 2, 180},
    {vector3(-1671.5692138672, -912.63940429688, 8.2297477722168), 50.0, 2, 180},
    {vector3(1468.5318603516, 6328.529296875, 18.894895553589), 100.0, 1, 180},
    {vector3(4982.5634765625, -5175.1079101562, 2.4887988567352), 120.0, 1, 180},
    {vector3(5115.7465820312, -4623.2915039062, 2.642692565918), 85.0, 1, 180},
    {vector3(337.64172363281, -1393.6368408203, 32.509204864502), 50.0, 2, 180},
    {vector3(-1437.4920654297, -2961.6879882812, 14.31385421759), 700.0, 2, 255, true},
    {vector3(-732.95123291016, 5812.35546875, 17.42693901062), 40.0, 2, 180},
    {vector3(-2541.2580566406, 5144.1538085938, 33.08895111084), 200.0, 1, 180},
    {vector3(1791.5841064453,4598.9921875,38.500267028809), 20.0, 2, 180},
    {vector3(-2343.8430175781,288.25698852539,169.46702575684), 100.0, 2, 180}, -- -2188.3845214844,5180.2080078125,15.915056228638
    {vector3(-2188.3845214844,5180.2080078125,15.915056228638), 115.0, 2, 180}
}
local o = Citizen.CreateThread
local p = Citizen.Wait
local SetEntityInvincible = SetEntityInvincible
local SetPlayerInvincible = SetPlayerInvincible
local ClearPedBloodDamage = ClearPedBloodDamage
local ResetPedVisibleDamage = ResetPedVisibleDamage
local ClearPedLastWeaponDamage = ClearPedLastWeaponDamage
local SetEntityProofs = SetEntityProofs
local SetEntityCanBeDamaged = SetEntityCanBeDamaged
local NetworkSetFriendlyFireOption = NetworkSetFriendlyFireOption
local GetEntityCoords = GetEntityCoords
local SetEntityNoCollisionEntity = SetEntityNoCollisionEntity
local SetPedCanRagdoll = SetPedCanRagdoll
local SetPedCanRagdollFromPlayerImpact = SetPedCanRagdollFromPlayerImpact
local SetEntityMaxSpeed = SetEntityMaxSpeed
local GetEntityModel = GetEntityModel
local SetEntityCollision = SetEntityCollision
local DisableControlAction = DisableControlAction
local GetVehiclePedIsIn = GetVehiclePedIsIn
function tXTRA.areGreenzonesDisabled()
    return j
end
function tXTRA.setGreenzonesDisabled(q)
    j = q
end
o(
    function()
        for r, s in pairs(n) do
            if not s[5] and not tXTRA.isPurge() or s[5] and tXTRA.isPurge() then
                Wait(500)
                local t = AddBlipForRadius(s[1].x, s[1].y, s[1].z, s[2])
                SetBlipColour(t, s[3])
                SetBlipAlpha(t, s[4])
            end
        end
    end
)
o(
    function()
        local u = tXTRA.isPurge()
        while true do
            local v = tXTRA.getPlayerPed()
            local w = tXTRA.getPlayerCoords()
            for x, y in pairs(m) do
                if not y.isPurge and not u or y.isPurge and u then
                    local z = #(w.xy - y.pos.xy)
                    while z < y.dist and w.z < y.maxHeight do
                        w = tXTRA.getPlayerCoords()
                        z = #(w.xy - y.pos.xy)
                        if y.nonRP then
                            d = true
                        else
                            if not y.setBit then
                                c = true
                                e = true
                                f = false
                                g = 5
                                k = y.pos
                                l = y.dist
                                y.setBit = true
                            end
                            if y.interior then
                                setDrawGreenInterior = true
                            end
                        end
                        p(100)
                    end
                    if y.setBit then
                        e = false
                        f = true
                        g = 5
                        k = vector3(0.0, 0.0, 0.0)
                        l = 0.0
                        y.setBit = false
                    end
                    d = false
                    c = false
                    e = false
                    setDrawGreenInterior = false
                    SetEntityInvincible(v, false)
                    SetPlayerInvincible(tXTRA.getPlayerId(), false)
                    ClearPedBloodDamage(v)
                    ResetPedVisibleDamage(v)
                    ClearPedLastWeaponDamage(v)
                    SetEntityProofs(v, false, false, false, false, false, false, false, false)
                    SetEntityCanBeDamaged(v, true)
                    SetLocalPlayerAsGhost(false)
                    SetNetworkVehicleAsGhost(tXTRA.getPlayerVehicle(), false)
                end
            end
            p(250)
        end
    end
)
AddEventHandler(
    "XTRA:onClientSpawn",
    function(A, B)
        if B then
            local C = function(D)
                inCityZone = true
            end
            local E = function(D)
                inCityZone = false
            end
            local F = function(D)
            end
            tXTRA.createArea(
                "cityzone",
                vector3(-225.30703735352, -916.74755859375, 31.216938018799),
                750.0,
                100,
                C,
                E,
                F,
                {}
            )
        end
    end
)
local function G()
    local H = tXTRA.getPlayerCoords()
    local I = nil
    for J = 1, 25 do
        local K, L = GetNthClosestVehicleNode(H.x, H.y, H.z, J)
        if K and #(k - L) > l then
            I = L
            break
        end
    end
    if I then
        local M, N = tXTRA.getPlayerVehicle()
        if M ~= 0 then
            if N and GetScriptTaskStatus(PlayerPedId(), "SCRIPT_TASK_VEHICLE_DRIVE_TO_COORD") == 7 then
                TaskVehicleDriveToCoord(PlayerPedId(), M, I.x, I.y, I.z, 30.0, 1.0, GetEntityModel(M), 16777216, 1.0, 1)
            end
        else
            if GetScriptTaskStatus(PlayerPedId(), "SCRIPT_TASK_FOLLOW_NAVMESH_TO_COORD_ADVANCED") == 7 then
                TaskFollowNavMeshToCoordAdvanced(PlayerPedId(), I.x, I.y, I.z, 8.0, -1, 2.5, 0, 0, 0.0, 100.0, 4000.0)
            end
        end
    end
end
o(
    function()
        while true do
            local v = PlayerPedId()
            local O = GetVehiclePedIsIn(v, false)
            --SetVehicleAutoRepairDisabled(O, true)
            if not tXTRA.areGreenzonesDisabled() then
                isInGreenzone = c or d
                local P = GetActivePlayers()
                local Q = tXTRA.getPlayerId()
                if c or d then
                    SetEntityMaxSpeed(O, a.maxSpeeds["50"])
                    SetLocalPlayerAsGhost(true)
                    SetNetworkVehicleAsGhost(O, true)
                    SetEntityAlpha(tXTRA.getPlayerVehicle(), 255)
                    SetEntityAlpha(v, 255)
                    for R, S in pairs(P) do
                        local T = GetPlayerPed(S)
                        local U = GetVehiclePedIsIn(T, true)
                        SetEntityAlpha(T, 255)
                        SetEntityAlpha(U, 255)
                    end
                    SetEntityInvincible(v, true)
                    SetPlayerInvincible(Q, true)
                    ClearPedBloodDamage(v)
                    if usingDelgun then
                        tXTRA.setWeapon(v, "WEAPON_STAFFGUN", true)
                    else
                        tXTRA.setWeapon(v, "WEAPON_UNARMED", true)
                    end
                    ResetPedVisibleDamage(v)
                    ClearPedLastWeaponDamage(v)
                    SetEntityProofs(v, true, true, true, true, true, true, true, true)
                    SetEntityCanBeDamaged(v, false)
                    SetPedCanRagdoll(v, false)
                    SetPedCanRagdollFromPlayerImpact(v, false)
                else
                    SetPedCanRagdoll(v, true)
                    SetPedCanRagdollFromPlayerImpact(v, true)
                    if O ~= 0 then
                        SetEntityCollision(O, true, true)
                        local V = GetEntityModel(O)
                        if not inCityZone or not b then
                            if a.vehicleMaxSpeeds[V] ~= nil then
                                SetEntityMaxSpeed(O, a.maxSpeeds[a.vehicleMaxSpeeds[V]])
                            else
                                SetEntityMaxSpeed(O, a.maxSpeeds["250"])
                            end
                        else
                            SetEntityMaxSpeed(O, a.maxSpeeds["150"])
                        end
                    end
                end
                if e and h == false then
                    TriggerEvent(
                        "XTRA:showNotification",
                        {
                            text = "You have entered the greenzone",
                            height = "200px",
                            width = "auto",
                            colour = "#FFF",
                            background = "#32CD32",
                            pos = "bottom-right",
                            icon = "success"
                        },
                        5000
                    )
                    h = true
                    i = false
                end
                if f and i == false then
                    TriggerEvent(
                        "XTRA:showNotification",
                        {
                            text = "You have left the greenzone",
                            height = "60px",
                            width = "auto",
                            colour = "#FFF",
                            background = "#ff0000",
                            pos = "bottom-right",
                            icon = "bad"
                        },
                        5000
                    )
                    i = true
                    h = false
                end
                if c then
                    DisableControlAction(2, 37, true)
                    DisablePlayerFiring(Q, true)
                    DisableControlAction(0, 106, true)
                    DisableControlAction(0, 45, true)
                    DisableControlAction(0, 24, true)
                    DisableControlAction(0, 263, true)
                    DisableControlAction(0, 140, true)
                    local W, X = tXTRA.getPlayerCombatTimer()
                    if W > 0 and X then
                        G()
                    end
                end
                if d then
                    drawNativeText("You have entered a non-RP greenzone, you may talk out of character here")
                    DisableControlAction(2, 37, true)
                    DisablePlayerFiring(Q, true)
                    DisableControlAction(0, 45, true)
                    DisableControlAction(0, 24, true)
                    DisableControlAction(0, 263, true)
                    DisableControlAction(0, 140, true)
                end
                if setDrawGreenInterior then
                    DisableControlAction(0, 106, true)
                    DisableControlAction(0, 45, true)
                    DisableControlAction(0, 24, true)
                    DisableControlAction(0, 263, true)
                    DisableControlAction(0, 140, true)
                    DisableControlAction(0, 22, true)
                end
            end
            p(0)
        end
    end
)
RegisterCommand(
    "togglecitycap",
    function()
        if tXTRA.getUserId() == 1 or tXTRA.getUserId() == 2 then
            b = not b
            tXTRA.notify("City Cap: " .. (b and "~g~Enabled" or "~r~Disabled"))
        end
    end
)
