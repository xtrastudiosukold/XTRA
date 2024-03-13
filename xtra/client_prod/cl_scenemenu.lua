RMenu.Add(
    "xtrascenemenu",
    "main",
    RageUI.CreateMenu(
        "",
        "~b~XTRA Traffic Scene Menu",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "xtra_jobselectorui",
        "metpd"
    )
)
RMenu.Add(
    "xtrascenemenu",
    "objects",
    RageUI.CreateSubMenu(
        RMenu:Get("mgscenemenu", "main"),
        "",
        "~b~Spawn Objects",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "xtra_jobselectorui",
        "metpd"
    )
)
RMenu.Add(
    "xtrascenemenu",
    "speedZone",
    RageUI.CreateSubMenu(
        RMenu:Get("mgscenemenu", "main"),
        "",
        "~b~Set a speed zone",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "xtra_jobselectorui",
        "metpd"
    )
)
RMenu.Add(
    "xtrascenemenu",
    "spikes",
    RageUI.CreateSubMenu(
        RMenu:Get("mgscenemenu", "main"),
        "",
        "~b~Set a spike trap",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "xtra_jobselectorui",
        "metpd"
    )
)
local a = {}
local b = {}
local c = {object = 1, speedRad = 1, speed = 1, amount = 1, seperation = 1, degrees = 1, previewObjects = {}}
TriggerEvent("chat:addSuggestion", "/trafficmenu", "Open the traffic scene menu")
local d = {"0", "25", "50", "75", "100", "125", "150", "175", "200"}
local e = {"0", "5", "10", "15", "20", "25", "30", "35", "40", "45", "50"}
local f = {1, 2, 3, 4, 5}
local g = {3, 6, 9, 12, 15}
local h = {0, 45, 90, 135, 190, 235, 270, 315}
local i = {}
local j = {
    {"Police Slow", "prop_barrier_slow", true, 0.05},
    {"Police No Entry", "prop_barrier_noentry", true, 0.05},
    {"Incident Ahead", "prop_barrier_incident", true, 0.05},
    {"Police Checkpoint", "prop_barrier_checkpoint", true, 0.05},
    {"Police Collision", "prop_barrier_collision", true, 0.05},
    {"Diagonal Left", "prop_barrier_diagonalleft", true, 0.05},
    {"Diagonal Right", "prop_barrier_diagonalright", true, 0.05},
    {"Big Cone", "prop_roadcone01a", true},
    {"Gazebo", "prop_gazebo_02", true},
    {"Worklight", "prop_worklight_03b", true},
    {"Gate Barrier", "ba_prop_battle_barrier_02a", true},
    {"Fence Transparent", "prop_fncsec_03b", true, -0.45},
    {"Fence Hidden", "prop_fncsec_03d", true},
    {"Plastic Fence", "prop_barrier_work06a", true}
}
local k = {
    {bone = "wheel_lf", index = 0},
    {bone = "wheel_rf", index = 1},
    {bone = "wheel_lm", index = 2},
    {bone = "wheel_rm", index = 3},
    {bone = "wheel_lr", index = 4},
    {bone = "wheel_rr", index = 5}
}
local l = {}
for m, n in pairs(j) do
    l[m] = n[1]
end
local o
local p
local function q(r, s, t, u, v, w)
    local x = tXTRA.getPlayerPed()
    local y = GetEntityHeading(x)
    local z = GetEntityCoords(PlayerPedId()) + GetEntityForwardVector(PlayerPedId()) * (3.0 + g[c.seperation] * (w - 1))
    local A = tXTRA.loadModel(r)
    local B = CreateObject(A, z.x, z.y, z.z, v, false)
    if s then
        FreezeEntityPosition(B, true)
    end
    PlaceObjectOnGroundProperly(B)
    if t then
        local C = GetEntityCoords(B, true)
        SetEntityCoords(B, C.x, C.y, C.z + t, true, true, true, true)
    end
    SetEntityHeading(B, y + h[c.degrees])
    if u then
        SetEntityAlpha(B, u, false)
    end
    SetModelAsNoLongerNeeded(A)
    table.insert(a, B)
    return B
end
local function D()
    for E, r in pairs(c.previewObjects) do
        DeleteEntity(r)
    end
    c.previewObjects = {}
end
local function F()
    D()
    local G = j[c.object]
    local H = f[c.amount]
    for I = 1, H do
        local r = q(G[2], G[3], G[4], 155, false, I)
        table.insert(c.previewObjects, r)
    end
end
RageUI.CreateWhile(
    1.0,
    true,
    function()
        if RageUI.Visible(RMenu:Get("mgscenemenu", "main")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    D()
                    RageUI.ButtonWithStyle(
                        "Object Menu",
                        nil,
                        {RightLabel = "→→→"},
                        true,
                        function(J, K, L)
                        end,
                        RMenu:Get("mgscenemenu", "objects")
                    )
                    RageUI.ButtonWithStyle(
                        "Speed Zone",
                        nil,
                        {RightLabel = "→→→"},
                        true,
                        function(J, K, L)
                        end,
                        RMenu:Get("mgscenemenu", "speedZone")
                    )
                    if tXTRA.globalOnPoliceDuty() then
                        RageUI.ButtonWithStyle(
                            "Spike Strip Menu",
                            nil,
                            {RightLabel = "→→→"},
                            true,
                            function(J, K, L)
                            end,
                            RMenu:Get("mgscenemenu", "spikes")
                        )
                    end
                    RageUI.ButtonWithStyle(
                        "Close Menu",
                        nil,
                        {RightLabel = "→→→"},
                        true,
                        function(J, K, L)
                            if L then
                                RageUI.Visible(RMenu:Get("mgscenemenu", "main"), false)
                            end
                        end
                    )
                end
            )
        end
        if RageUI.Visible(RMenu:Get("mgscenemenu", "objects")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    RageUI.List(
                        "Spawn Object",
                        l,
                        c.object,
                        nil,
                        {},
                        true,
                        function(J, K, L, M)
                            if L then
                                D()
                                local G = j[c.object]
                                local H = f[c.amount]
                                for I = 1, H do
                                    q(G[2], G[3], G[4], nil, true, I)
                                end
                                F()
                            end
                            if K and c.object ~= M then
                                c.object = M
                                F()
                            end
                        end
                    )
                    RageUI.List(
                        "Number To Place",
                        f,
                        c.amount,
                        "",
                        {},
                        true,
                        function(J, K, L, M)
                            if K and c.amount ~= M then
                                c.amount = M
                                F()
                            end
                        end
                    )
                    RageUI.List(
                        "Seperation (m)",
                        g,
                        c.seperation,
                        "",
                        {},
                        true,
                        function(J, K, L, M)
                            if K and c.seperation ~= M then
                                c.seperation = M
                                F()
                            end
                        end
                    )
                    RageUI.List(
                        "Rotation (degrees)",
                        h,
                        c.degrees,
                        "",
                        {},
                        true,
                        function(J, K, L, M)
                            if K and c.degrees ~= M then
                                c.degrees = M
                                F()
                            end
                        end
                    )
                    RageUI.ButtonWithStyle(
                        "Delete Object",
                        nil,
                        {RightLabel = "→→→"},
                        true,
                        function(J, K, L)
                            if L then
                                deleteObject()
                            end
                        end
                    )
                    RageUI.ButtonWithStyle(
                        "Delete All Objects",
                        "Deletes all objects you have placed",
                        {RightLabel = "→→→"},
                        true,
                        function(J, K, L)
                            if L then
                                clearAllObjects()
                            end
                        end
                    )
                    local G = j[c.object]
                    for I, r in pairs(c.previewObjects) do
                        if DoesEntityExist(r) then
                            local N =
                                GetEntityCoords(PlayerPedId()) +
                                GetEntityForwardVector(PlayerPedId()) * (3.0 + g[c.seperation] * (I - 1))
                            if G[4] then
                                local O = G[4]
                                SetEntityCoordsNoOffset(r, N.x, N.y, N.z)
                                PlaceObjectOnGroundProperly(r)
                                local C = GetEntityCoords(r, true)
                                SetEntityCoordsNoOffset(r, C.x, C.y, C.z + O)
                            else
                                SetEntityCoordsNoOffset(r, N.x, N.y, N.z)
                                PlaceObjectOnGroundProperly(r)
                            end
                            SetEntityNoCollisionEntity(r, PlayerPedId(), true)
                            SetEntityNoCollisionEntity(PlayerPedId(), r, true)
                            SetEntityHeading(r, GetEntityHeading(PlayerPedId()) + h[c.degrees])
                        end
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("mgscenemenu", "speedZone")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    RageUI.List(
                        "Radius",
                        d,
                        c.speedRad,
                        nil,
                        {},
                        true,
                        function(J, K, L, M)
                            if K then
                                c.speedRad = M
                                o = tonumber(d[M])
                            end
                        end
                    )
                    RageUI.List(
                        "Speed",
                        e,
                        c.speed,
                        nil,
                        {},
                        true,
                        function(J, K, L, M)
                            if K then
                                c.speed = M
                                p = tonumber(e[M])
                            end
                        end
                    )
                    RageUI.ButtonWithStyle(
                        "Create Speedzone",
                        nil,
                        {},
                        true,
                        function(J, K, L)
                            if L then
                                if o == 0 then
                                    tXTRA.notify("Please set a radius")
                                elseif p == 0 then
                                    tXTRA.notify("Please set a speed")
                                else
                                    TriggerServerEvent("XTRA:createSpeedZone", tXTRA.getPlayerCoords(), p + 0.0, o + 0.0)
                                    tXTRA.notify("~b~Speed zone created")
                                end
                            end
                        end,
                        nil
                    )
                    RageUI.ButtonWithStyle(
                        "Delete Speedzone",
                        nil,
                        {},
                        true,
                        function(J, K, L)
                            if L then
                                local P = tXTRA.getPlayerCoords()
                                local Q = nil
                                local R = 250.0
                                for S, T in pairs(i) do
                                    local U = #(P - T.position)
                                    if U < R and U < T.radius then
                                        Q = S
                                        R = U
                                    end
                                end
                                if Q then
                                    TriggerServerEvent("XTRA:deleteSpeedZone", Q)
                                    tXTRA.notify("Speed zone removed")
                                end
                            end
                        end,
                        nil
                    )
                end
            )
        end
        if RageUI.Visible(RMenu:Get("mgscenemenu", "spikes")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    RageUI.ButtonWithStyle(
                        "Place Spike",
                        nil,
                        {},
                        true,
                        function(J, K, L)
                            if L then
                                placeSpike()
                            end
                        end
                    )
                    RageUI.ButtonWithStyle(
                        "Delete Spike",
                        nil,
                        {},
                        true,
                        function(J, K, L)
                            if L then
                                deleteSpike()
                            end
                        end
                    )
                end
            )
        end
    end
)
RegisterNetEvent(
    "XTRA:toggleTrafficMenu",
    function()
        RageUI.Visible(RMenu:Get("mgscenemenu", "main"), not RageUI.Visible(RMenu:Get("mgscenemenu", "main")))
        if globalOnPoliceDuty and tXTRA.hasPoliceCallsign() then
            RMenu:Get("mgscenemenu", "main"):SetSubtitle(
                "~b~MPD~w~: " ..
                    tXTRA.getPoliceCallsign() .. " - " .. tXTRA.getPoliceRank() .. " - " .. tXTRA.getPoliceName()
            )
        end
    end
)
function deleteObject()
    for m, n in pairs(j) do
        local V = n[2]
        local W = GetHashKey(V)
        local X, Y, Z = table.unpack(GetEntityCoords(tXTRA.getPlayerPed(), true))
        if DoesObjectOfTypeExistAtCoords(X, Y, Z, 0.9, W, true) then
            local _ = GetClosestObjectOfType(X, Y, Z, 0.9, W, false, false, false)
            if NetworkGetEntityIsNetworked(_) and not NetworkHasControlOfEntity(_) then
                local a0 = tXTRA.getNetId(_, "deleteObject()")
                if a0 ~= 0 then
                    TriggerServerEvent("XTRA:requestSceneObjectDelete", a0)
                end
            else
                DeleteObject(_)
            end
        end
    end
end
function clearAllObjects()
    Citizen.CreateThread(
        function()
            for m, a1 in pairs(a) do
                if DoesEntityExist(a1) then
                    if NetworkGetEntityIsNetworked(a1) then
                        local a2 = NetworkGetNetworkIdFromEntity(a1)
                        if a2 ~= 0 then
                            TriggerServerEvent("XTRA:requestSceneObjectDelete", a2)
                        end
                    else
                        DeleteEntity(a1)
                    end
                end
            end
            a = {}
        end
    )
end
function placeSpike()
    local a3 = tXTRA.getPlayerVehicle()
    if a3 == 0 then
        local a4 = "P_ld_stinger_s"
        local a5 = tXTRA.getPlayerPed()
        local P = GetEntityCoords(a5)
        local B = CreateObject(a4, P.x, P.y, P.z, true, true, true)
        SetEntityHeading(B, GetEntityHeading(a5))
        DecorSetInt(B, decor, 945)
        PlaceObjectOnGroundProperly(B)
        local a6 = NetworkGetNetworkIdFromEntity(B)
        TriggerServerEvent("XTRA:placeSpike", a6, P)
    end
end
function getClosetSpike(P)
    for m, n in pairs(b) do
        if #(n[1] - P) <= 3.50 then
            return n
        end
    end
    return nil
end
function deleteSpike()
    local P = GetEntityCoords(tXTRA.getPlayerPed())
    local a7 = getClosetSpike(P)
    if a7 then
        TriggerServerEvent("XTRA:removeSpike", a7[2])
    end
end
RegisterNetEvent(
    "XTRA:addSpike",
    function(P, a6)
        b[a6] = {P, a6}
    end
)
RegisterNetEvent(
    "XTRA:deleteSpike",
    function(a6)
        b[a6] = nil
    end
)
local a8 = 1
Citizen.CreateThread(
    function()
        while true do
            local a5 = tXTRA.getPlayerPed()
            local P = GetEntityCoords(a5)
            for m, n in pairs(b) do
                local a9 = n[1]
                if #(a9 - P) <= 5.00 then
                    a8 = m
                end
            end
            Citizen.Wait(150)
        end
    end
)
Citizen.CreateThread(
    function()
        while true do
            local a5 = tXTRA.getPlayerPed()
            if IsPedInAnyVehicle(a5, true) then
                local aa = GetVehiclePedIsIn(a5, false)
                if b[a8] then
                    for ab = 1, #k do
                        local ac = GetWorldPositionOfEntityBone(aa, GetEntityBoneIndexByName(aa, k[ab].bone))
                        local a7 = b[a8]
                        if #(ac - a7[1]) <= 3.6 then
                            if
                                not IsVehicleTyreBurst(aa, k[ab].index, true) or
                                    IsVehicleTyreBurst(aa, k[ab].index, false)
                             then
                                SetVehicleTyreBurst(aa, k[ab].index, false, 1000.0)
                                TriggerServerEvent("XTRA:removeSpike", a7[2])
                            end
                        end
                    end
                end
            end
            Citizen.Wait(150)
        end
    end
)
local ad = false
local ae = 1000.0
function convertSpeed(p)
    return p * 10 * 0.44704 - 0.5
end
Citizen.CreateThread(
    function()
        while true do
            local a3, af = tXTRA.getPlayerVehicle()
            if a3 ~= 0 and af then
                local ag = false
                local ah = 1000.0
                local z = tXTRA.getPlayerCoords()
                for E, T in pairs(i) do
                    if #(T.position - z) < T.radius then
                        ag = true
                        if T.speed < ah then
                            ah = T.speed
                        end
                    end
                end
                if ag then
                    if not ad or ae ~= ah then
                        SetVehicleMaxSpeed(a3, ah / 2.236936)
                        ad = true
                        ae = ah
                    end
                    drawNativeNotification("Hold up! There is a temporary ~b~speed restriction ~w~in this area.")
                else
                    if ad then
                        SetVehicleMaxSpeed(a3, -1.0)
                        ad = false
                        ae = 1000.0
                    end
                end
            end
            Wait(0)
        end
    end
)
RegisterNetEvent(
    "XTRA:createSpeedZone",
    function(S, ai, p, o)
        local aj = AddBlipForRadius(ai.x, ai.y, ai.z, o)
        SetBlipColour(aj, 26)
        SetBlipAlpha(aj, 120)
        local ak = AddSpeedZoneForCoord(ai.x, ai.y, ai.z, o, p, false)
        i[S] = {position = ai, speed = p, radius = o, blip = aj, zone = ak}
    end
)
RegisterNetEvent(
    "XTRA:deleteSpeedZone",
    function(S)
        local T = i[S]
        if T then
            RemoveBlip(T.blip)
            RemoveSpeedZone(T.zone)
            i[S] = nil
        end
    end
)
