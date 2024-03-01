globalBlips = {}
function tXTRA.addBlip(a, b, c, d, e, f, g, h)
    local i = AddBlipForCoord(a + 0.001, b + 0.001, c + 0.001)
    SetBlipSprite(i, d)
    SetBlipAsShortRange(i, true)
    SetBlipColour(i, e)
    if d == 403 or d == 431 or d == 365 or d == 85 or d == 140 or d == 60 or d == 44 or d == 110 or d == 315 then
        SetBlipScale(i, 1.1)
    elseif d == 50 then
        SetBlipScale(i, 0.7)
    else
        SetBlipScale(i, 0.8)
    end
    SetBlipScale(i, g or 0.8)
    if h then
        SetBlipDisplay(i, 5)
    end
    if f ~= nil then
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(f)
        EndTextCommandSetBlipName(i)
    end
    table.insert(globalBlips, i)
    return i
end
function tXTRA.removeBlip(j)
    RemoveBlip(j)
end
function tXTRA.removeBlipAtCoords(x,y,z) -- used to remove green house blips for everyone when purchased
    for k,v in pairs(globalBlips) do
        if GetBlipCoords(v) == vector3(x+0.001,y+0.001,z+0.001) then
            RemoveBlip(v)
        end
    end
end
local k = {}
function tXTRA.setNamedBlip(l, a, b, c, d, e, f, g)
    tXTRA.removeNamedBlip(l)
    k[l] = tXTRA.addBlip(a, b, c, d, e, f, g)
    return k[l]
end
function tXTRA.removeNamedBlip(l)
    if k[l] ~= nil then
        tXTRA.removeBlip(k[l])
        k[l] = nil
    end
end
function tXTRA.setGPS(a, b)
    SetNewWaypoint(a + 0.0001, b + 0.0001)
end
function tXTRA.setBlipRoute(j)
    SetBlipRoute(j, true)
end
local m = {}
local n = Tools.newIDGenerator()
local o = {}
local p = {}
local q = {}
function tXTRA.addMarker(a, b, c, r, s, t, u, v, w, x, y, z, A, B, C, D, E, F, G, H)
    local I = {
        position = vector3(a, b, c),
        sx = r,
        sy = s,
        sz = t,
        r = u,
        g = v,
        b = w,
        a = x,
        visible_distance = y,
        mtype = z,
        faceCamera = A,
        bopUpAndDown = B,
        rotate = C,
        textureDict = D,
        textureName = E,
        xRot = F,
        yRot = G,
        zRot = H
    }
    if I.sx == nil then
        I.sx = 2.0
    end
    if I.sy == nil then
        I.sy = 2.0
    end
    if I.sz == nil then
        I.sz = 0.7
    end
    if I.r == nil then
        I.r = 0
    end
    if I.g == nil then
        I.g = 155
    end
    if I.b == nil then
        I.b = 255
    end
    if I.a == nil then
        I.a = 200
    end
    I.sx = I.sx + 0.001
    I.sy = I.sy + 0.001
    I.sz = I.sz + 0.001
    if I.visible_distance == nil then
        I.visible_distance = 150
    end
    local j = n:gen()
    m[j] = I
    q[j] = I
    return j
end
function tXTRA.removeMarker(j)
    if m[j] ~= nil then
        m[j] = nil
        n:free(j)
    end
    if q[j] then
        q[j] = nil
    end
end
function tXTRA.setNamedMarker(l, a, b, c, r, s, t, u, v, w, x, y, z, A, B, C, D, E, F, G, H)
    tXTRA.removeNamedMarker(l)
    o[l] = tXTRA.addMarker(a, b, c, r, s, t, u, v, w, x, y, z, A, B, C, D, E, F, G, H)
    return o[l]
end
function tXTRA.removeNamedMarker(l)
    if o[l] ~= nil then
        tXTRA.removeMarker(o[l])
        o[l] = nil
    end
end
local J = {}
Citizen.CreateThread(
    function()
        while true do
            for K, L in pairs(p) do
                if J[K] then
                    if J[K] <= L.visible_distance then
                        if L.mtype == nil then
                            L.mtype = 1
                        end
                        DrawMarker(
                            L.mtype,
                            L.position.x,
                            L.position.y,
                            L.position.z,
                            0.0,
                            0.0,
                            0.0,
                            L.xRot,
                            L.yRot,
                            L.zRot,
                            L.sx,
                            L.sy,
                            L.sz,
                            L.r,
                            L.g,
                            L.b,
                            L.a,
                            L.bopUpAndDown,
                            L.faceCamera,
                            2,
                            L.rotate,
                            L.textureDict,
                            L.textureName
                        )
                    end
                end
            end
            Wait(0)
        end
    end
)
Citizen.CreateThread(
    function()
        while true do
            local M = tXTRA.getPlayerCoords()
            J = {}
            for K, L in pairs(q) do
                J[K] = #(L.position - M)
                if J[K] <= L.visible_distance then
                    p[K] = L
                else
                    p[K] = nil
                end
            end
            Citizen.Wait(250)
        end
    end
)
Citizen.CreateThread(
    function()
        while true do
            q = tXTRA.getNearbyMarkers()
            Citizen.Wait(10000)
        end
    end
)
function tXTRA.getNearbyMarkers()
    local N = {}
    local O = tXTRA.getPlayerCoords()
    local P = 0
    for K, L in pairs(m) do
        if #(L.position - O) <= 250.0 then
            N[K] = L
        end
        P = P + 1
        if P % 25 == 0 then
            Wait(0)
        end
    end
    return N
end
local Q = {}
local R = {}
function tXTRA.getNearbyAreas()
    local S = {}
    local M = tXTRA.getPlayerCoords()
    local P = 0
    for K, L in pairs(Q) do
        if #(L.position - M) <= 250.0 or L.radius > 250 then
            S[K] = L
        end
        P = P + 1
        if P % 25 == 0 then
            Wait(0)
        end
    end
    return S
end
function tXTRA.setArea(l, a, b, c, T, U)
    local V = {position = vector3(a + 0.001, b + 0.001, c + 0.001), radius = T, height = U}
    if V.height == nil then
        V.height = 6
    end
    Q[l] = V
end
function tXTRA.createArea(l, W, T, U, X, Y, Z, _)
    local V = {position = W, radius = T, height = U, enterArea = X, leaveArea = Y, onTickArea = Z, metaData = _}
    if V.height == nil then
        V.height = 6
    end
    Q[l] = V
    R[l] = V
end
function tXTRA.removeArea(l)
    if Q[l] then
        Q[l] = nil
    end
end
function tXTRA.doesAreaExist(l)
    if Q[l] then
        return true
    end
    return false
end
Citizen.CreateThread(function()
    while true do
        local M = tXTRA.getPlayerCoords()
        for a0, a1 in pairs(R) do
            local a2 = #(a1.position - M)
            local a3 = a2 <= a1.radius and math.abs(M.z - a1.position.z) <= a1.height
            a1.distance = a2
            if a1.player_in and not a3 then
                if a1.leaveArea then
                    if a1.metaData == nil then
                        a1.metaData = {}
                    end
                    a1.leaveArea(a1.metaData)
                else
                    FRserver.leaveArea({a0})
                end
            elseif not a1.player_in and a3 then
                if a1.enterArea then
                    if a1.metaData == nil then
                        a1.metaData = {}
                    end
                    a1.enterArea(a1.metaData)
                else
                    FRserver.enterArea({a0})
                end
            end
            a1.player_in = a3
        end
        Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        for a0, a1 in pairs(R) do
            if a1.player_in and a1.onTickArea then
                if a1.metaData == nil then
                    a1.metaData = {}
                end
                a1.metaData.distance = a1.distance
                a1.onTickArea(a1.metaData)
            end
        end
        Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        R = tXTRA.getNearbyAreas()
        Citizen.Wait(5000)
    end
end)

local a4
local a5 = 617
RegisterCommand("nextblip",function()
    a5 = a5 + 1
    if a4 then
        tXTRA.removeBlip(a4)
    end
    a4 = tXTRA.addBlip(1103.9739990234, 211.95138549805, -49.440101623535, a5, 0, "Chips Cashier", 0.8, true)
end)
