local a = {}
local b = false
local c
AddEventHandler(
    "getMapDirectives",
    function(d)
        d(
            "spawnpoint",
            function(e, f)
                return function(g)
                    local h, i, j, k
                    local l, m =
                        pcall(
                        function()
                            if g.x then
                                h = g.x
                                i = g.y
                                j = g.z
                            else
                                h = g[1]
                                i = g[2]
                                j = g[3]
                            end
                            h = h + 0.0001
                            i = i + 0.0001
                            j = j + 0.0001
                            k = g.heading and g.heading + 0.01 or 0
                            addSpawnPoint({x = h, y = i, z = j, heading = k, model = f})
                            if not tonumber(f) then
                                f = GetHashKey(f, _r)
                            end
                            e.add("xyz", {h, i, j})
                            e.add("model", f)
                        end
                    )
                    if not l then
                        Citizen.Trace(m .. "\n")
                    end
                end
            end,
            function(e, n)
                for o, p in ipairs(a) do
                    if p.x == e.xyz[1] and p.y == e.xyz[2] and p.z == e.xyz[3] and p.model == e.model then
                        table.remove(a, o)
                        return
                    end
                end
            end
        )
    end
)
function loadSpawns(q)
    local r = json.decode(q)
    if not r.spawns then
        error("no 'spawns' in JSON data")
    end
    for o, s in ipairs(r.spawns) do
        addSpawnPoint(s)
    end
end
local t = 1
function addSpawnPoint(s)
    if not tonumber(s.x) or not tonumber(s.y) or not tonumber(s.z) then
        error("invalid spawn position")
    end
    if not tonumber(s.heading) then
        error("invalid spawn heading")
    end
    local f = s.model
    if not tonumber(s.model) then
        f = GetHashKey(s.model)
    end
    if not IsModelInCdimage(f) then
        error("invalid spawn model")
    end
    s.model = f
    s.idx = t
    t = t + 1
    table.insert(a, s)
    return s.idx
end
function removeSpawnPoint(s)
    for o = 1, #a do
        if a[o].idx == s then
            table.remove(a, o)
            return
        end
    end
end
function setAutoSpawn(u)
    b = u
end
function setAutoSpawnCallback(v)
    c = v
    b = true
end
local function w(x, y)
    local z = x
    SetPlayerControl(z, not y, false)
    local A = GetPlayerPed(z)
    if not y then
        if not IsEntityVisible(A) then
            SetEntityVisible(A, true)
        end
        if not IsPedInAnyVehicle(A) then
            SetEntityCollision(A, true)
        end
        FreezeEntityPosition(A, false)
        SetPlayerInvincible(z, false)
    else
        if IsEntityVisible(A) then
            SetEntityVisible(A, false)
        end
        SetEntityCollision(A, false)
        FreezeEntityPosition(A, true)
        SetPlayerInvincible(z, true)
        if not IsPedFatallyInjured(A) then
            ClearPedTasksImmediately(A)
        end
    end
end
function loadScene(h, i, j)
    NewLoadSceneStart(h, i, j, 0.0, 0.0, 0.0, 20.0, 0)
    while IsNewLoadSceneActive() do
        networkTimer = GetNetworkTimer()
        NetworkUpdateLoadScene()
    end
end
local B = false
function spawnPlayer(C, v)
    if B then
        return
    end
    B = true
    Citizen.CreateThread(
        function()
            if not C then
                C = GetRandomIntInRange(1, #a + 1)
            end
            local s
            if type(C) == "table" then
                s = C
            else
                s = a[C]
            end
            if not s.skipFade then
                DoScreenFadeOut(500)
                while not IsScreenFadedOut() do
                    Citizen.Wait(4)
                end
            end
            if not s then
                Citizen.Trace("tried to spawn at an invalid spawn index\n")
                B = false
                return
            end
            w(PlayerId(), true)
            if s.model then
                RequestModel(s.model)
                while not HasModelLoaded(s.model) do
                    RequestModel(s.model)
                    Wait(4)
                end
                SetPlayerModel(PlayerId(), s.model)
                SetModelAsNoLongerNeeded(s.model)
            end
            RequestCollisionAtCoord(s.x, s.y, s.z)
            local A = PlayerPedId()
            SetEntityCoordsNoOffset(A, s.x, s.y, s.z, false, false, false, true)
            NetworkResurrectLocalPlayer(s.x, s.y, s.z, s.heading, true, true, false)
            ClearPedTasksImmediately(A)
            RemoveAllPedWeapons(A)
            local D = GetGameTimer()
            while not HasCollisionLoadedAroundEntity(A) and GetGameTimer() - D < 5000 do
                Citizen.Wait(4)
            end
            ShutdownLoadingScreen()
            if IsScreenFadedOut() then
                DoScreenFadeIn(500)
                while not IsScreenFadedIn() do
                    Citizen.Wait(4)
                end
            end
            w(PlayerId(), false)
            TriggerEvent("playerSpawned", s)
            if v then
                v(s)
            end
            B = false
        end
    )
end
local E
local F
Citizen.CreateThread(
    function()
        repeat
            Citizen.Wait(4)
        until NetworkIsSessionActive()
        Citizen.Wait(100)
        spawnPlayer(1)
        return collectgarbage()
    end
)
function forceRespawn()
    B = false
    E = true
end
