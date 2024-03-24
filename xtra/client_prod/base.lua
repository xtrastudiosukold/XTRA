cfg = module("cfg/client")
purgecfg = module("cfg/cfg_purge")
tXTRA = {}
local a = {}
Tunnel.bindInterface("XTRA", tXTRA)
XTRAserver = Tunnel.getInterface("XTRA", "XTRA")
Proxy.addInterface("XTRA", tXTRA)
allowedWeapons = {}
weapons = module("xtra-vehicles", "cfg/weapons")
function tXTRA.isDevMode()
    if tXTRA.isDev() then
        return true
    else
        return false
    end
end
function tXTRA.teleport(b, c, d)
    local e = PlayerPedId()
    NetworkFadeOutEntity(e, true, false)
    DoScreenFadeOut(500)
    Citizen.Wait(500)
    SetEntityCoords(tXTRA.getPlayerPed(), b + 0.0001, c + 0.0001, d + 0.0001, 1, 0, 0, 1)
    NetworkFadeInEntity(e, 0)
    DoScreenFadeIn(500)
end
function tXTRA.teleport2(f, g)
    local e = PlayerPedId()
    NetworkFadeOutEntity(e, true, false)
    if tXTRA.getPlayerVehicle() == 0 or not g then
        SetEntityCoords(tXTRA.getPlayerPed(), f.x, f.y, f.z, 1, 0, 0, 1)
    else
        SetEntityCoords(tXTRA.getPlayerVehicle(), f.x, f.y, f.z, 1, 0, 0, 1)
    end
    Wait(500)
    NetworkFadeInEntity(e, 0)
end
function tXTRA.getPosition()
    return GetEntityCoords(tXTRA.getPlayerPed())
end
function tXTRA.getDistanceBetweenCoords(h, j, k, l, m, n)
    local o = GetDistanceBetweenCoords(h, j, k, l, m, n, true)
    return o
end
function tXTRA.isInside()
    local h, j, k = table.unpack(tXTRA.getPosition())
    return not (GetInteriorAtCoords(h, j, k) == 0)
end
local p = module("cfg/cfg_attachments")
function tXTRA.getAllWeaponAttachments(q, r)
    local s = PlayerPedId()
    local t = {}
    if r then
        for u, v in pairs(p.attachments) do
            if HasPedGotWeaponComponent(s, q, GetHashKey(v)) and not table.has(givenAttachmentsToRemove[q] or {}, v) then
                table.insert(t, v)
            end
        end
    else
        for u, v in pairs(p.attachments) do
            if HasPedGotWeaponComponent(s, q, GetHashKey(v)) then
                table.insert(t, v)
            end
        end
    end
    return t
end
function tXTRA.getSpeed()
    local w, x, y = table.unpack(GetEntityVelocity(PlayerPedId()))
    return math.sqrt(w * w + x * x + y * y)
end
function tXTRA.getCamDirection()
    local z = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId())
    local A = GetGameplayCamRelativePitch()
    local h = -math.sin(z * math.pi / 180.0)
    local j = math.cos(z * math.pi / 180.0)
    local k = math.sin(A * math.pi / 180.0)
    local B = math.sqrt(h * h + j * j + k * k)
    if B ~= 0 then
        h = h / B
        j = j / B
        k = k / B
    end
    return h, j, k
end
function tXTRA.addPlayer(C)
    a[C] = true
end
function tXTRA.removePlayer(C)
    a[C] = nil
end
function tXTRA.getNearestPlayers(D)
    local E = {}
    local F = GetPlayerPed(i)
    local G = PlayerId()
    local H, I, J = table.unpack(tXTRA.getPosition())
    for e, K in pairs(a) do
        local C = GetPlayerFromServerId(e)
        if K and C ~= G and NetworkIsPlayerConnected(C) then
            local L = GetPlayerPed(C)
            local h, j, k = table.unpack(GetEntityCoords(L, true))
            local o = GetDistanceBetweenCoords(h, j, k, H, I, J, true)
            if o <= D then
                E[GetPlayerServerId(C)] = o
            end
        end
    end
    return E
end
function tXTRA.getNearestPlayer(D)
    local M = nil
    local a = tXTRA.getNearestPlayers(D)
    local N = D + 10.0
    for e, K in pairs(a) do
        if K < N then
            N = K
            M = e
        end
    end
    return M
end
function tXTRA.getNearestPlayersFromPosition(O, D)
    local E = {}
    local F = GetPlayerPed(i)
    local G = PlayerId()
    local H, I, J = table.unpack(O)
    for e, K in pairs(a) do
        local C = GetPlayerFromServerId(e)
        if K and C ~= G and NetworkIsPlayerConnected(C) then
            local L = GetPlayerPed(C)
            local h, j, k = table.unpack(GetEntityCoords(L, true))
            local o = GetDistanceBetweenCoords(h, j, k, H, I, J, true)
            if o <= D then
                E[GetPlayerServerId(C)] = o
            end
        end
    end
    return E
end
function tXTRA.notify(P)
    if not globalHideUi then
        SetNotificationTextEntry("STRING")
        AddTextComponentString(P)
        DrawNotification(true, false)
    end
end
local function Q(R, S, T)
    return R < S and S or R > T and T or R
end
local function U(b)
    local c = math.floor(#b % 99 == 0 and #b / 99 or #b / 99 + 1)
    local i = {}
    for d = 0, c - 1 do
        i[d + 1] = string.sub(b, d * 99 + 1, Q(#string.sub(b, d * 99), 0, 99) + d * 99)
    end
    return i
end
local function e(f, g)
    local V = U(f)
    SetNotificationTextEntry("CELL_EMAIL_BCON")
    for W, M in ipairs(V) do
        AddTextComponentSubstringPlayerName(M)
    end
    if g then
        local X = GetSoundId()
        PlaySoundFrontend(X, "police_notification", "DLC_AS_VNT_Sounds", true)
        ReleaseSoundId(X)
    end
end
function tXTRA.notifyPicture(Y, Z, f, _, a0, a1, a2)
    if Y ~= nil and Z ~= nil then
        RequestStreamedTextureDict(Y, true)
        while not HasStreamedTextureDictLoaded(Y) do
         --   print("stuck loading", Y)
            Wait(0)
        end
    end
    e(f, a1 == "police")
    if a2 == nil then
        a2 = 0
    end
    local a3 = false
    EndTextCommandThefeedPostMessagetext(Y, Z, a3, a2, _, a0)
    local a4 = true
    local a5 = false
    EndTextCommandThefeedPostTicker(a5, a4)
    DrawNotification(false, true)
    if a1 == nil then
        PlaySoundFrontend(-1, "CHECKPOINT_NORMAL", "HUD_MINI_GAME_SOUNDSET", 1)
    end
end
function tXTRA.notifyPicture2(a6, type, a7, a8, a9)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(a9)
    SetNotificationMessage(a6, a6, true, type, a7, a8, a9)
    DrawNotification(false, true)
end
function tXTRA.notifyPicture6(ay,az,l,ac,aA,aB,aC)
    if ay~=nil and az~=nil then 
        RequestStreamedTextureDict(ay,true)
        while not HasStreamedTextureDictLoaded(ay)do 
            print("stuck loading",ay)
            Wait(0)
        end 
    end
    k(l,aB=="monzo")
    if aC==nil then 
        aC=0 
    end
    local aD=false
    EndTextCommandThefeedPostMessagetext(ay,az,aD,aC,ac,aA)
    local aE=true
    local aF=false
    EndTextCommandThefeedPostTicker(aF,aE)
    DrawNotification(false,true)
    if aB==nil then 
      TriggerEvent("xtra:PlaySound", "apple")
    end 
  end
function tXTRA.playScreenEffect(aa, ab)
    if ab < 0 then
        StartScreenEffect(aa, 0, true)
    else
        StartScreenEffect(aa, 0, true)
        Citizen.CreateThread(
            function()
                Citizen.Wait(math.floor((ab + 1) * 1000))
                StopScreenEffect(aa)
            end
        )
    end
end
function tXTRA.stopScreenEffect(aa)
    StopScreenEffect(aa)
end
local r = {}
local s = {}
function tXTRA.createArea(f, ac, u, v, ad, ae, af, ag)
    local ah = {position = ac, radius = u, height = v, enterArea = ad, leaveArea = ae, onTickArea = af, metaData = ag}
    if ah.height == nil then
        ah.height = 6
    end
    r[f] = ah
    s[f] = ah
end
function tXTRA.doesAreaExist(f)
    if r[f] then
        return true
    end
    return false
end
function DrawText3D(ai, Q, R, S, T, U, b)
    local c, i, d = GetScreenCoordFromWorldCoord(ai, Q, R)
    if c then
        SetTextScale(0.4, 0.4)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        BeginTextCommandDisplayText("STRING")
        SetTextCentre(1)
        AddTextComponentSubstringPlayerName(S)
        EndTextCommandDisplayText(i, d)
    end
end
function tXTRA.add3DTextForCoord(S, ai, Q, R, e)
    local function f(g)
        DrawText3D(g.coords.x, g.coords.y, g.coords.z, g.text)
    end
    local V = tXTRA.generateUUID("3dtext", 8, "alphanumeric")
    tXTRA.createArea(
        "3dtext_" .. V,
        vector3(ai, Q, R),
        e,
        6.0,
        function()
        end,
        function()
        end,
        f,
        {coords = vector3(ai, Q, R), text = S}
    )
end
local aj = {}
local ak = {
    ["alphabet"] = "abcdefghijklmnopqrstuvwxyz",
    ["numerical"] = "0123456789",
    ["alphanumeric"] = "abcdefghijklmnopqrstuvwxyz0123456789"
}
local function al(am, type)
    local an, ao, ap = 0, "", 0
    local aq = {ak[type]}
    repeat
        an = an + 1
        ap = math.random(aq[an]:len())
        if math.random(2) == 1 then
            ao = ao .. aq[an]:sub(ap, ap)
        else
            ao = aq[an]:sub(ap, ap) .. ao
        end
        an = an % #aq
    until ao:len() >= am
    return ao
end
function tXTRA.generateUUID(ar, am, type)
    if aj[ar] == nil then
        aj[ar] = {}
    end
    if type == nil then
        type = "alphanumeric"
    end
    local as = al(am, type)
    if aj[ar][as] then
        while aj[ar][as] ~= nil do
            as = al(am, type)
            Wait(0)
        end
    end
    aj[ar][as] = true
    return as
end
function tXTRA.setdecor(at, au)
    decor = at
    objettable = au
end
function XTRA.spawnVehicle(ac, K, av, au, ad, ae, af, ag)
    local aw = tXTRA.loadModel(ac)
    local ax = CreateVehicle(aw, K, av, au, ad, af, ag)
    SetModelAsNoLongerNeeded(aw)
    SetEntityAsMissionEntity(ax)
    DecorSetInt(ax, decor, 945)
    SetModelAsNoLongerNeeded(aw)
    if ae then
        TaskWarpPedIntoVehicle(PlayerPedId(), ax, -1)
    end
    setVehicleFuel(ax, 100)
    return ax
end
local ay = {}
Citizen.CreateThread(
    function()
        while true do
            local az = {}
            az.playerPed = tXTRA.getPlayerPed()
            az.playerCoords = tXTRA.getPlayerCoords()
            az.playerId = tXTRA.getPlayerId()
            az.vehicle = tXTRA.getPlayerVehicle()
            az.weapon = GetSelectedPedWeapon(az.playerPed)
            for aA = 1, #ay do
                local aB = ay[aA]
                aB(az)
            end
            Wait(0)
        end
    end
)
function tXTRA.createThreadOnTick(aB)
    ay[#ay + 1] = aB
end
local ai = 0
local Q = 0
local R = 0
local S = vector3(0, 0, 0)
local T = false
local U = PlayerPedId
function savePlayerInfo()
    ai = U()
    Q = GetVehiclePedIsIn(ai, false)
    R = PlayerId()
    S = GetEntityCoords(ai)
    local b = GetPedInVehicleSeat(Q, -1)
    T = b == ai
end
_G["PlayerPedId"] = function()
    return ai
end
function tXTRA.getPlayerPed()
    return ai
end
function tXTRA.getPlayerVehicle()
    return Q, T
end
function tXTRA.getPlayerId()
    return R
end
function tXTRA.getPlayerCoords()
    return S
end
createThreadOnTick(savePlayerInfo)
function tXTRA.getClosestVehicle(aC)
    local aD = tXTRA.getPlayerCoords()
    local aE = 100
    local aF = 100
    for u, bu in pairs(GetGamePool("CVehicle")) do
        local aG = GetEntityCoords(bu)
        local aH = #(aD - aG)
        if aH < aF then
            aF = aH
            aE = bu
        end
    end
    if aF <= aC then
        return aE
    else
        return nil
    end
end
local aI = {}
local aJ = Tools.newIDGenerator()
function tXTRA.playAnim(aK, aL, aM)
    if aL.task ~= nil then
        tXTRA.stopAnim(true)
        local F = PlayerPedId()
        if aL.task == "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER" then
            local h, j, k = table.unpack(tXTRA.getPosition())
            TaskStartScenarioAtPosition(F, aL.task, h, j, k - 1, GetEntityHeading(F), 0, 0, false)
        else
            TaskStartScenarioInPlace(F, aL.task, 0, not aL.play_exit)
        end
    else
        tXTRA.stopAnim(aK)
        local aN = 0
        if aK then
            aN = aN + 48
        end
        if aM then
            aN = aN + 1
        end
        Citizen.CreateThread(
            function()
                local aO = aJ:gen()
                aI[aO] = true
                for e, K in pairs(aL) do
                    local aP = K[1]
                    local aa = K[2]
                    local aQ = K[3] or 1
                    for i = 1, aQ do
                        if aI[aO] then
                            local aR = e == 1 and i == 1
                            local aS = e == #aL and i == aQ
                            RequestAnimDict(aP)
                            local i = 0
                            while not HasAnimDictLoaded(aP) and i < 1000 do
                                Citizen.Wait(10)
                                RequestAnimDict(aP)
                                i = i + 1
                            end
                            if HasAnimDictLoaded(aP) and aI[aO] then
                                local aT = 8.0001
                                local aU = -8.0001
                                if not aR then
                                    aT = 2.0001
                                end
                                if not aS then
                                    aU = 2.0001
                                end
                                TaskPlayAnim(PlayerPedId(), aP, aa, aT, aU, -1, aN, 0, 0, 0, 0)
                            end
                            Citizen.Wait(0)
                            while GetEntityAnimCurrentTime(PlayerPedId(), aP, aa) <= 0.95 and
                                IsEntityPlayingAnim(PlayerPedId(), aP, aa, 3) and
                                aI[aO] do
                                Citizen.Wait(0)
                            end
                        end
                    end
                end
                aJ:free(aO)
                aI[aO] = nil
            end
        )
    end
end
function tXTRA.stopAnim(aK)
    aI = {}
    if aK then
        ClearPedSecondaryTask(PlayerPedId())
    else
        ClearPedTasks(PlayerPedId())
    end
end
local aV = false
function tXTRA.setRagdoll(aW)
    aV = aW
end
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(10)
            if aV then
                SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
            end
        end
    end
)
function tXTRA.playSpatializedSound(aP, aa, h, j, k, aX)
    PlaySoundFromCoord(-1, aa, h + 0.0001, j + 0.0001, k + 0.0001, aP, 0, aX + 0.0001, 0)
end
function tXTRA.playSound(aP, aa)
    PlaySound(-1, aa, aP, 0, 0, 1)
end
function tXTRA.playFrontendSound(aP, aa)
    PlaySoundFrontend(-1, aP, aa, 0)
end
function tXTRA.loadAnimDict(aP)
    while not HasAnimDictLoaded(aP) do
        RequestAnimDict(aP)
        Wait(0)
    end
end
function tXTRA.drawNativeNotification(aY)
    SetTextComponentFormat("STRING")
    AddTextComponentString(aY)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
function tXTRA.announceMpBigMsg(aZ, a_, b0)
    local b1 = Scaleform("MP_BIG_MESSAGE_FREEMODE")
    b1.RunFunction("SHOW_SHARD_WASTED_MP_MESSAGE", {aZ, a_, 0, false, false})
    local b2 = false
    SetTimeout(
        b0,
        function()
            b2 = true
        end
    )
    while not b2 do
        b1.Render2D()
        Wait(0)
    end
end
local g = true
function tXTRA.canAnim()
    return g
end
function tXTRA.setCanAnim(V)
    g = V
end
function tXTRA.getModelGender()
    local b3 = PlayerPedId()
    if GetEntityModel(b3) == GetHashKey("mp_f_freemode_01") then
        return "female"
    else
        return "male"
    end
end
function tXTRA.getPedServerId(b4)
    local b5 = GetActivePlayers()
    for u, v in pairs(b5) do
        if b4 == GetPlayerPed(v) then
            local b6 = GetPlayerServerId(v)
            return b6
        end
    end
    return nil
end
function tXTRA.loadModel(b7)
    local b8
    if type(b7) ~= "string" then
        b8 = b7
    else
        b8 = GetHashKey(b7)
    end
    if IsModelInCdimage(b8) then
        if not HasModelLoaded(b8) then
            RequestModel(b8)
            while not HasModelLoaded(b8) do
                Wait(0)
            end
        end
        return b8
    else
        return nil
    end
end
function tXTRA.getObjectId(b9, ba)
    if ba == nil then
        ba = ""
    end
    local bb = 0
    local bc = NetworkDoesNetworkIdExist(b9)
    if not bc then
        print(string.format("no object by ID %s\n%s", b9, ba))
    else
        local bd = NetworkGetEntityFromNetworkId(b9)
        bb = bd
    end
    return bb
end
function tXTRA.KeyboardInput(be, bf, bg)
    AddTextEntry("FMMC_KEY_TIP1", be)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", bf, "", "", "", bg)
    blockinput = true
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local bh = GetOnscreenKeyboardResult()
        Citizen.Wait(1)
        blockinput = false
        return bh
    else
        Citizen.Wait(1)
        blockinput = false
        return nil
    end
end
function tXTRA.syncNetworkId(bi)
    SetNetworkIdExistsOnAllMachines(bi, true)
    SetNetworkIdCanMigrate(bi, false)
    NetworkSetNetworkIdDynamic(bi, true)
end
RegisterNetEvent("__mg_callback:client")
AddEventHandler(
    "__mg_callback:client",
    function(bj, ...)
        local bk = promise.new()
        TriggerEvent(
            string.format("c__mg_callback:%s", bj),
            function(...)
                bk:resolve({...})
            end,
            ...
        )
        local bb = Citizen.Await(bk)
        TriggerServerEvent(string.format("__mg_callback:server:%s:%s", bj, ...), table.unpack(bb))
    end
)
tXTRA.TriggerServerCallback = function(bj, ...)
    assert(type(bj) == "string", "Invalid Lua type at argument #1, expected string, got " .. type(bj))
    local bk = promise.new()
    local bl = GetGameTimer()
    RegisterNetEvent(string.format("__mg_callback:client:%s:%s", bj, bl))
    local bm =
        AddEventHandler(
        string.format("__mg_callback:client:%s:%s", bj, bl),
        function(...)
            bk:resolve({...})
        end
    )
    TriggerServerEvent("__mg_callback:server", bj, bl, ...)
    local bb = Citizen.Await(bk)
    RemoveEventHandler(bm)
    return table.unpack(bb)
end
tXTRA.RegisterClientCallback = function(bj, bn)
    assert(type(bj) == "string", "Invalid Lua type at argument #1, expected string, got " .. type(bj))
    assert(type(bn) == "function", "Invalid Lua type at argument #2, expected function, got " .. type(bn))
    AddEventHandler(
        string.format("c__mg_callback:%s", bj),
        function(bo, ...)
            bo(bn(...))
        end
    )
end
Citizen.CreateThread(
    function()
        while true do
            SetVehicleDensityMultiplierThisFrame(0.0)
            SetPedDensityMultiplierThisFrame(0.0)
            SetRandomVehicleDensityMultiplierThisFrame(0.0)
            SetParkedVehicleDensityMultiplierThisFrame(0.0)
            SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
            local bp = GetPlayerPed(-1)
            local bq = GetEntityCoords(bp)
            RemoveVehiclesFromGeneratorsInArea(
                bq["x"] - 500.0,
                bq["y"] - 500.0,
                bq["z"] - 500.0,
                bq["x"] + 500.0,
                bq["y"] + 500.0,
                bq["z"] + 500.0
            )
            SetGarbageTrucks(0)
            SetRandomBoats(0)
            Citizen.Wait(1)
        end
    end
)
function tXTRA.drawTxt(b1, b2, br, bs, bt, bv, bw, r, s, t)
    SetTextFont(b2)
    SetTextProportional(0)
    SetTextScale(bv, bv)
    SetTextColour(bw, r, s, t)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(br)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(b1)
    EndTextCommandDisplayText(bs, bt)
end
function drawNativeText(ah)
    if not globalHideUi then
        BeginTextCommandPrint("STRING")
        AddTextComponentSubstringPlayerName(ah)
        EndTextCommandPrint(100, 1)
    end
end
function clearNativeText()
    BeginTextCommandPrint("STRING")
    AddTextComponentSubstringPlayerName("")
    EndTextCommandPrint(1, true)
end
function tXTRA.announceClient(S)
    if S ~= nil then
        CreateThread(
            function()
                local T = GetGameTimer()
                local bx = RequestScaleformMovie("MIDSIZED_MESSAGE")
                while not HasScaleformMovieLoaded(bx) do
                    Wait(0)
                end
                PushScaleformMovieFunction(bx, "SHOW_SHARD_MIDSIZED_MESSAGE")
                PushScaleformMovieFunctionParameterString("~g~XTRA Announcement")
                PushScaleformMovieFunctionParameterString(S)
                PushScaleformMovieMethodParameterInt(5)
                PushScaleformMovieMethodParameterBool(true)
                PushScaleformMovieMethodParameterBool(false)
                EndScaleformMovieMethod()
                while T + 6 * 1000 > GetGameTimer() do
                    DrawScaleformMovieFullscreen(bx, 255, 255, 255, 255)
                    Wait(0)
                end
            end
        )
    end
end
AddEventHandler(
    "mumbleDisconnected",
    function(U)
        tXTRA.notify("~r~[XTRA] Lost connection to voice server, you may need to toggle voice chat.")
    end
)
RegisterNetEvent("XTRA:PlaySound")
AddEventHandler(
    "XTRA:PlaySound",
    function(by)
        SendNUIMessage({transactionType = by})
    end
)
AddEventHandler(
    "playerSpawned",
    function()
        SetPlayerTargetingMode(3)
        TriggerServerEvent("XTRACli:playerSpawned")
    end
)
TriggerServerEvent("XTRA:CheckID")
RegisterNetEvent("XTRA:CheckIdRegister")
AddEventHandler(
    "XTRA:CheckIdRegister",
    function()
        TriggerEvent("playerSpawned")
    end
)
function tXTRA.clientGetPlayerIsStaff(bz)
    local bA = tXTRA.getCurrentPlayerInfo("currentStaff")
    if bA then
        for ai, Q in pairs(bA) do
            if Q == bz then
                return true
            end
        end
        return false
    end
end
local bB = {}
function tXTRA.setBasePlayers(a)
    bB = a
end
function tXTRA.addBasePlayer(C, aO)
    bB[C] = aO
end
function tXTRA.removeBasePlayer(C)
end
local bC = false
local bD = nil
local bE = 0
globalOnPoliceDuty = false
globalHorseTrained = false
globalNHSOnDuty = false
globalOnPrisonDuty = false
inHome = false
customizationSaveDisabled = false
function tXTRA.setPolice(j)
    TriggerServerEvent("XTRA:refreshGaragePermissions")
    globalOnPoliceDuty = j
    if j then
        ExecuteCommand("blipson")
        TriggerServerEvent("XTRA:getCallsign", "police")
    end
end
function tXTRA.globalOnPoliceDuty()
    return globalOnPoliceDuty
end
function tXTRA.setglobalHorseTrained()
    globalHorseTrained = true
end
function tXTRA.globalHorseTrained()
    return globalHorseTrained
end
function tXTRA.setHMP(h)
    TriggerServerEvent("XTRA:refreshGaragePermissions")
    globalOnPrisonDuty = h
    if h then
        TriggerServerEvent("XTRA:getCallsign", "prison")
    end
end
function tXTRA.globalOnPrisonDuty()
    return globalOnPrisonDuty
end
function tXTRA.setNHS(av)
    TriggerServerEvent("XTRA:refreshGaragePermissions")
    globalNHSOnDuty = av
end
function tXTRA.globalNHSOnDuty()
    return globalNHSOnDuty
end
RegisterNetEvent("XTRA:SetDev")
AddEventHandler(
    "XTRA:SetDev",
    function()
        TriggerServerEvent("XTRA:VerifyDev")
        bC = true
    end
)
function tXTRA.isDev()
    return bC
end
function tXTRA.setUserID(ai)
    bD = ai
end
function tXTRA.getUserId(af)
    if af then
        return bB[af]
    else
        return bD
    end
end
function tXTRA.clientGetUserIdFromSource(bF)
    return bu[bF]
end
function tXTRA.DrawSprite3d(bG)
    local bH = #(GetGameplayCamCoords().xy - bG.pos.xy)
    local bI = 1 / GetGameplayCamFov() * 250
    local bJ = 0.3
    SetDrawOrigin(bG.pos.x, bG.pos.y, bG.pos.z, 0)
    if not HasStreamedTextureDictLoaded(bG.textureDict) then
        local bK = 1000
        RequestStreamedTextureDict(bG.textureDict, true)
        while not HasStreamedTextureDictLoaded(bG.textureDict) and bK > 0 do
            bK = bK - 1
            Citizen.Wait(100)
        end
    end
    DrawSprite(
        bG.textureDict,
        bG.textureName,
        (bG.x or 0) * bJ,
        (bG.y or 0) * bJ,
        bG.width * bJ,
        bG.height * bJ,
        bG.heading or 0,
        bG.r or 0,
        bG.g or 0,
        bG.b or 0,
        bG.a or 255
    )
    ClearDrawOrigin()
end
function tXTRA.getTempFromPerm(bL)
    for S, T in pairs(bB) do
        if T == bL then
            return S
        end
    end
end
function tXTRA.clientGetUserIdFromSource(bM)
    return bB[bM]
end
RegisterNetEvent("XTRA:SetStaffLevel")
AddEventHandler(
    "XTRA:SetStaffLevel",
    function(ai)
        TriggerServerEvent("XTRA:VerifyStaff", ai)
        bE = ai
    end
)
function tXTRA.getStaffLevel()
    return bE
end
function tXTRA.isStaffedOn()
    return staffMode
end
function tXTRA.isNoclipping()
    return noclipActive
end
function tXTRA.setInHome(bN)
    inHome = bN
end
function XTRA.isInHouse()
    return inHome
end
function tXTRA.disableCustomizationSave(bO)
    customizationSaveDisabled = bO
end
local _ = 0
function tXTRA.getPlayerBucket()
    return _
end
RegisterNetEvent(
    "XTRA:setBucket",
    function(bP)
        _ = bP
    end
)
function tXTRA.isPurge()
    return purgecfg.active
end
function tXTRA.inEvent()
    return false
end
function tXTRA.getRageUIMenuWidth()
    local av, c = GetActiveScreenResolution()
    if av == 1920 then
        return 1300
    elseif av == 1280 and c == 540 then
        return 1000
    elseif av == 2560 and c == 1080 then
        return 1050
    elseif av == 3440 and c == 1440 then
        return 1050
    end
    return 1300
end
function tXTRA.getRageUIMenuHeight()
    return 100
end
RegisterNetEvent("XTRA:requestAccountInfo")
AddEventHandler(
    "XTRA:requestAccountInfo",
    function(m)
        local bQ = m and "requestAccountInfo" or "requestAccountInformation"
        SendNUIMessage({act = bQ})
    end
)
RegisterNUICallback(
    "receivedAccountInfo",
    function(bR)
        TriggerServerEvent("XTRA:receivedAccountInfo", bR.gpu, bR.cpu, bR.userAgent, bR.devices)
    end
)
RegisterNUICallback(
    "receivedAccountInformation",
    function(bR)
        TriggerServerEvent("XTRA:receivedAccountInformation", bR.gpu, bR.cpu, bR.userAgent, bR.devices)
    end
)
function tXTRA.getHairAndTats()
    TriggerServerEvent("XTRA:getPlayerHairstyle")
    TriggerServerEvent("XTRA:getPlayerTattoos")
end
local bS = module("cfg/blips_markers")
AddEventHandler(
    "XTRA:onClientSpawn",
    function(bs, bt)
        if bt then
            for aY, b3 in pairs(bS.blips) do
                tXTRA.addBlip(b3[1], b3[2], b3[3], b3[4], b3[5], b3[6], b3[7] or 0.8)
            end
            for aY, b3 in pairs(bS.markers) do
                tXTRA.addMarker(b3[1], b3[2], b3[3], b3[4], b3[5], b3[6], b3[7], b3[8], b3[9], b3[10], b3[11])
            end
        end
    end
)
CreateThread(
    function()
        while true do
            ExtendWorldBoundaryForPlayer(-9000.0, -11000.0, 30.0)
            ExtendWorldBoundaryForPlayer(10000.0, 12000.0, 30.0)
            Wait(0)
        end
    end
)
globalHideUi = false
function tXTRA.hideUI()
    globalHideUi = true
    TriggerEvent("XTRA:showHUD", false)
    TriggerEvent("XTRA:hideChat", true)
end
function tXTRA.showUI()
    globalHideUi = false
    TriggerEvent("XTRA:showHUD", true)
    TriggerEvent("XTRA:hideChat", false)
end
RegisterCommand(
    "showui",
    function()
        globalHideUi = false
        TriggerEvent("XTRA:showHUD", true)
        TriggerEvent("XTRA:hideChat", false)
    end
)
RegisterCommand(
    "hideui",
    function()
        tXTRA.notify("~g~/showui to re-enable UI")
        globalHideUi = true
        TriggerEvent("XTRA:showHUD", false)
        TriggerEvent("XTRA:hideChat", true)
    end
)
RegisterCommand(
    "hideallui",
    function()
        tXTRA.notify("~g~/showui to re-enable UI")
        globalHideUi = true
        TriggerEvent("XTRA:showHUD", false)
        TriggerEvent("XTRA:hideChat", true)
        ExecuteCommand("hideids")
    end
)
RegisterCommand(
    "showallui",
    function()
        tXTRA.notify("~g~/showui to re-enable UI")
        globalHideUi = true
        TriggerEvent("XTRA:showHUD", false)
        TriggerEvent("XTRA:hideChat", true)
        ExecuteCommand("showids")
    end
)
RegisterCommand(
    "showchat",
    function()
        TriggerEvent("XTRA:hideChat", false)
    end
)
RegisterCommand(
    "hidechat",
    function()
        tXTRA.notify("~g~/showui to re-enable Chat")
        TriggerEvent("XTRA:hideChat", true)
    end
)
RegisterCommand(
    "getcoords",
    function()
        print(GetEntityCoords(tXTRA.getPlayerPed()))
        tXTRA.notify("~g~Coordinates copied to clipboard.")
        tXTRA.CopyToClipBoard(tostring(GetEntityCoords(tXTRA.getPlayerPed())))
    end
)
Citizen.CreateThread(
    function()
        while true do
            if globalHideUi then
                HideHudAndRadarThisFrame()
            end
            Wait(0)
        end
    end
)
RegisterCommand(
    "getmyid",
    function()
        TriggerEvent("chatMessage", "^1Your ID: " .. tostring(tXTRA.getUserId()), {128, 128, 128}, message, "ooc")
        tXTRA.clientPrompt(
            "Your ID:",
            tostring(tXTRA.getUserId()),
            function()
            end
        )
    end,
    false
)
RegisterCommand(
    "getmytempid",
    function()
        TriggerEvent(
            "chatMessage",
            "^1Your TempID: " .. tostring(GetPlayerServerId(PlayerId())),
            {128, 128, 128},
            message,
            "ooc"
        )
    end,
    false
)
local bT = {}
function tXTRA.setDiscordNames(bu)
    bT = bu
end
function tXTRA.addDiscordName(bn, Q)
    bT[bn] = Q
end
function tXTRA.getPlayerName(bU)
    local s = GetPlayerServerId(bU)
    local t = tXTRA.clientGetUserIdFromSource(s)
    if bT[t] == nil then
        return GetPlayerName(bU)
    end
    return bT[t]
end
exports("getUserId", tXTRA.getUserId)
exports("getPlayerName", tXTRA.getPlayerName)
function tXTRA.setUserID(ai)
    local bV = GetResourceKvpInt("xtra_user_id")
    bD = ai
    if bV then
        XTRAserver.checkid({bD, bV})
    end
    Wait(5000)
    SetResourceKvpInt("xtra_user_id", ai)
end
local bW = false
function tXTRA.isSpectatingEvent()
    return bW
end
function getMoneyStringFormatted(bX)
    local i, d, bY, bZ = tostring(bX):find("([-]?)(%d+)%.?%d*")
    if bZ == nil then
        return bX
    else
        bZ = bZ:reverse():gsub("(%d%d%d)", "%1,")
        return bY .. bZ:reverse():gsub("^,", "")
    end
end
function tXTRA.isHalloween()
    return false
end
function tXTRA.isChristmas()
    return false
end
