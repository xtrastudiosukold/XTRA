local a = false
local b = nil
local c = nil
local d = false
local e = 0
local f = false
local g = false
local h = false
local i = false
local j = 0
local k = false
local l = 0
RegisterNetEvent("XTRA:showHUD")
AddEventHandler(
    "XTRA:showHUD",
    function(m)
        i = not m
    end
)
function Crosshair(n)
    if i then
        SendNUIMessage({radialCrosshair = false})
    else
        if not d and n then
            d = true
            SendNUIMessage({radialCrosshair = n})
        elseif d and not n then
            d = false
            SendNUIMessage({radialCrosshair = n})
        end
    end
end
RegisterNUICallback(
    "radialDisablenuifocus",
    function(o)
        a = o.nuifocus
        SetNuiFocusKeepInput(false)
        SetNuiFocus(o.nuifocus, o.nuifocus)
        k = false
    end
)
local function p()
    local q = PlayerPedId()
    for r, s in pairs(GetActivePlayers()) do
        local t = GetPlayerPed(s)
        if GetEntityAttachedTo(t) == q then
            return t
        end
    end
    return 0
end
local function u()
    local v, r, r, r, w = GetShapeTestResult(e)
    if v ~= 1 then
        if v == 2 then
            if #(GetEntityCoords(PlayerPedId(), true) - GetEntityCoords(w, true)) <= 3.5 and w ~= PlayerPedId() then
                b = w
                c = GetEntityType(w)
            else
                b = nil
                c = nil
            end
            j = p()
        end
        local x = GetGameplayCamRot(2)
        local y = GetGameplayCamCoord()
        local z = tXTRA.rotationToDirection(x)
        local A = vector3(y.x + z.x * 15.0, y.y + z.y * 15.0, y.z + z.z * 15.0)
        e = StartShapeTestLosProbe(y.x, y.y, y.z, A.x, A.y, A.z, -1, -1, 1)
    end
end
function playerIsAlive()
    return GetEntityHealth(PlayerPedId()) > 102
end


RegisterCommand(
    "lootbag",
    function()
        l = GetFrameCount()
    end,
    true
)
RegisterKeyMapping("lootbag", "Open Lootbag", "KEYBOARD", "E")
local function B()
    local C = GetFrameCount()
    return l == C or l == C - 1
end
local D = false
local function E(F)
    local t = PlayerPedId()
    ClearPedTasks(t)
    ForcePedAiAndAnimationUpdate(t, false, false)
    SetEntityCoordsNoOffset(t, F.x, F.y, F.z + 0.1, true, false, false)
end
local function G(H)
    if D then
        notify("~r~You are already opening a lootbag.")
        return
    end
    if noclipActive and tXTRA.getStaffLevel() == 0 then
        return
    end
    inventoryType = nil
    D = true
    local I = GetGameTimer()
    local t = PlayerPedId()
    local F = GetEntityCoords(t, true)
    local J = GetEntityRotation(t, 2)
    if tXTRA.globalOnPoliceDuty() then
        tXTRA.loadAnimDict("anim@gangops@facility@servers@bodysearch@")
        TaskPlayAnimAdvanced(t,"anim@gangops@facility@servers@bodysearch@","player_search",F.x,F.y,F.z,J.x,J.y,J.z,8.0,-8.0,-1,524288,512,0,false,false)
        RemoveAnimDict("anim@gangops@facility@servers@bodysearch@")
        ForcePedAiAndAnimationUpdate(t, false, false)
        Citizen.Wait(200)
        while D do
            if not IsEntityPlayingAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@", "player_search", 3) or IsControlJustPressed(0, 137) then
                D = false
                notify("~r~Opening lootbag cancelled.")
                E(F)
                return
            elseif GetGameTimer() - I >= 500 then
                break
            end
            Citizen.Wait(0)
        end
    else
        tXTRA.loadAnimDict("amb@medic@standing@tendtodead@base")
        TaskPlayAnimAdvanced(t,"amb@medic@standing@tendtodead@base","base",F.x,F.y,F.z,J.x,J.y,J.z,8.0,-8.0,-1,1,0,false,false)
        RemoveAnimDict("amb@medic@standing@tendtodead@base")
        ForcePedAiAndAnimationUpdate(t, false, false)
    end
    E(F)
    D = false
    H()
end
Citizen.CreateThread(
    function()
        while true do
            u()
            local t = PlayerPedId()
            local K = GetVehiclePedIsIn(t, false)
            if a and K ~= 0 and not k then
                a = false
                SendNUIMessage({closeRadialMenu = true})
            end
            if c then
                if playerIsAlive() and K == 0 and GetRenderingCam() == -1 then
                    if c == 1 and b ~= t and IsPedAPlayer(b) then
                        Crosshair(true)
                        if B() then
                            if a == false then
                                a = true
                                SetNuiFocus(true, true)
                                SendNUIMessage({openRadialMenu = true, type = "ped", police = f or h, entityId = b})
                            end
                        end
                    elseif c == 2 and b ~= K then
                        Crosshair(true)
                        if B() then
                            if a == false then
                                a = true
                                SetNuiFocus(true, true)
                                SendNUIMessage({openRadialMenu = true, type = "vehicle", police = f or h, entityId = b})
                            end
                        end
                    elseif c == 3 then
                        local L = GetEntityModel(b)
                        if not g then
                            if GetHashKey("xs_prop_arena_bag_01") == L then
                                Crosshair(true)
                                if B() then
                                    local M =
                                        GetClosestObjectOfType(
                                        GetEntityCoords(PlayerPedId()),
                                        10.5,
                                        GetHashKey("xs_prop_arena_bag_01"),
                                        false,
                                        false,
                                        false
                                    )
                                    local N = ObjToNet(M)
                                    TriggerEvent("XTRA:startCombatTimer", false)
                                    G(
                                        function()
                                            TriggerServerEvent("XTRA:LootBag", N)
                                        end
                                    )
                                    Wait(1000)
                                end
                            elseif GetHashKey("prop_poly_bag_money") == L then
                                Crosshair(true)
                                if B() then
                                    local O =
                                        GetClosestObjectOfType(
                                        GetEntityCoords(PlayerPedId()),
                                        10.5,
                                        GetHashKey("prop_poly_bag_money"),
                                        false,
                                        false,
                                        false
                                    )
                                    local P = ObjToNet(O)
                                    TriggerEvent("XTRA:startCombatTimer", false)
                                    TriggerServerEvent("XTRA:Moneydrop", P)
                                    Wait(1000)
                                end
                            elseif GetHashKey("prop_box_ammo03a") == L then
                                Crosshair(true)
                                if B() then
                                end
                            elseif GetHashKey("xs_prop_arena_crate_01a") == L then
                                TriggerEvent("XTRA:startCombatTimer", false)
                                Crosshair(true)
                                if B() then
                                    local Q = DecorGetInt(b, "lootid")
                                    G(
                                        function()
                                            TriggerServerEvent("XTRA:openCrate", Q)
                                            inventoryType = "Crate"
                                        end
                                    )
                                    Wait(1000)
                                end
                            end
                        end
                    else
                        Crosshair(false)
                    end
                else
                    Crosshair(false)
                end
            else
                Crosshair(false)
            end
            if not d and j ~= 0 and IsControlPressed(0, 19) and IsControlJustPressed(0, 38) then
                SetNuiFocus(true, true)
                SendNUIMessage({openRadialMenu = true, type = "ped", police = f or h, entityId = j})
            end
            Citizen.Wait(0)
        end
    end
)
function GetEntInFrontOfPlayer(R, S)
    local T = nil
    local U = GetEntityCoords(S, 1)
    local V = GetOffsetFromEntityInWorldCoords(S, 0.0, R, 0.0)
    local W = StartExpensiveSynchronousShapeTestLosProbe(U.x, U.y, U.z, V.x, V.y, V.z, -1, S, 0)
    local X, Y, Z, _, T = GetShapeTestResult(W)
    return T
end
function GetCoordsFromCam(a0)
    local a1 = GetGameplayCamRot(2)
    local a2 = GetGameplayCamCoord()
    local a3 = a1.z * 0.0174532924
    local a4 = a1.x * 0.0174532924
    local a5 = math.abs(math.cos(a4))
    newCoordX = a2.x + -math.sin(a3) * (a5 + a0)
    newCoordY = a2.y + math.cos(a3) * (a5 + a0)
    newCoordZ = a2.z + math.sin(a4) * 8.0
    return newCoordX, newCoordY, newCoordZ
end
function Target(R, S)
    local b = nil
    local a6 = GetGameplayCamCoord()
    local a7, a8, a9 = GetCoordsFromCam(R)
    local W = StartExpensiveSynchronousShapeTestLosProbe(a6.x, a6.y, a6.z, a7, a8, a9, -1, S, 0)
    local X, Y, Z, _, b = GetShapeTestResult(W)
    return b, a7, a8, a9
end
local function aa(ab)
    TriggerEvent("XTRA:lockNearestVehicle")
end
local ac
local function ad(ab)
    ac = ab
    SetVehicleDoorOpen(ab, 5, true, false)
    TriggerEvent("XTRA:clOpenTrunk")
    trunkStatus = true
    SendNUIMessage({closeRadialMenu = true})
    local ae = GetSoundId()
    PlaySoundFrontend(ae, "boot_pop", "dlc_vw_body_disposal_sounds", true)
    ReleaseSoundId(ae)
end
RegisterNetEvent("XTRA:clCloseTrunk")
AddEventHandler(
    "XTRA:clCloseTrunk",
    function()
        if ac then
            SetVehicleDoorShut(ac, 5, true)
        end
    end
)
local function af(ab)
    local t = PlayerPedId()
    if GetEntityHealth(t) > 102 and not IsEntityDead(t) then
        TaskStartScenarioInPlace(t, "world_human_maid_clean", 0, 1)
        Wait(10000)
        SetVehicleDirtLevel(ab, 0.0)
        SetVehicleUndriveable(ab, false)
        ClearPedSecondaryTask(t)
        ClearPedTasks(t)
    end
end
local function ag(ab)
    TriggerEvent("XTRA:verifyLockpick", ab)
end
local function ah(ai)
    local aj = GetPedInVehicleSeat(ai, -1)
    if aj ~= 0 then
        return tXTRA.notify("~r~Can not repair vehicle with a person in the driver seat.")
    end
    if NetworkGetEntityIsNetworked(ai) then
        local ak = NetworkGetNetworkIdFromEntity(ai)
        if ak ~= 0 then
            TriggerServerEvent("XTRA:attemptRepairVehicle", ai, ak)
        end
    end
end
local al = false
local function am(ab)
    if not al then
        SetVehicleDoorOpen(ab, 4, false, false)
        al = true
    else
        SetVehicleDoorShut(ab, 4, false)
        al = false
    end
end
local function an(ab)
    if f then
        TriggerEvent("XTRA:searchClient", ab)
    end
end
local function ao(ab)
    if f then
        local ap = tonumber(DecorGetInt(ab, "xtra_owner"))
        if ap > 0 then
            exports.xtra:impound(ap, GetEntityModel(ab), VehToNet(ab), ab)
        else
            TriggerEvent("XTRA:Notify", "~r~Vehicle is not owned by anyone")
            if GetPedInVehicleSeat(ab, -1) == 0 and GetPedInVehicleSeat(ab, 0) == 0 and NetworkGetEntityIsNetworked(ab) then
                TriggerServerEvent("XTRA:impoundDeleteVehicle", NetworkGetNetworkIdFromEntity(ab))
            end
        end
    end
end
local function aq(ab)
    local ar = GetPlayerByEntityID(ab)
    local as = GetPlayerServerId(ar)
    if as > 0 then
        if GetSelectedPedWeapon(PlayerPedId()) ~= GetHashKey("WEAPON_UNARMED") then
            TriggerServerEvent("XTRA:robPlayer", as)
        else
            TriggerEvent("XTRA:Notify", "~r~You need a weapon in your hands.")
        end
    end
end
local function at(ab)
    local aj = GetPedInVehicleSeat(ab, -1)
    if aj ~= 0 then
        local s = GetPlayerByEntityID(aj)
        local as = GetPlayerServerId(s)
        if as > 0 then
            TriggerServerEvent("XTRA:askId", as)
        end
    end
end
local au = 0
local function av(ab)
    local ar = GetPlayerByEntityID(ab)
    local as = GetPlayerServerId(ar)
    if as > 0 then
        if GetGameTimer() - au > 15000 then
            au = GetGameTimer()
            TriggerServerEvent("XTRA:askId", as)
        end
    end
end
local function aw(ab)
    local ar = GetPlayerByEntityID(ab)
    local as = GetPlayerServerId(ar)
    if as > 0 then
        TriggerServerEvent("XTRA:giveCashToPlayer", as)
    end
end
local function ax(ab)
    if not tXTRA.canAnim() then
        return
    end
    if GetEntityHealth(ab) <= 102 then
        TriggerEvent("XTRA:Notify", "~r~You can not search a player who is dead.")
        return
    end
    local ar = GetPlayerByEntityID(ab)
    if not f and not h then
        local ay = GetPlayerPed(ar)
        if ay ~= nil then
            if
                IsEntityPlayingAnim(ay, "missminuteman_1ig_2", "handsup_enter", 3) or
                    IsEntityPlayingAnim(ay, "random@arrests", "idle_2_hands_up", 3) or
                    IsEntityPlayingAnim(ay, "random@arrests@busted", "idle_a", 3)
             then
                local as = GetPlayerServerId(ar)
                if as > 0 then
                    TriggerServerEvent("XTRA:searchPlayer", as)
                end
            else
                TriggerEvent("XTRA:Notify", "~r~Player must have their hands up or be on their knees!")
            end
        end
    else
        local as = GetPlayerServerId(ar)
        if as > 0 then
            TriggerServerEvent("XTRA:searchPlayer", as)
        end
    end
end
local function az(ab)
    local ar = GetPlayerByEntityID(ab)
    local as = GetPlayerServerId(ar)
    if as > 0 then
        if g then
            TriggerServerEvent("XTRA:nhsRevive", as)
        else
            TriggerServerEvent("XTRA:attemptCPR", as)
        end
    end
end
local function aA(ab)
    if f or h then
        local ar = GetPlayerByEntityID(ab)
        local as = GetPlayerServerId(ar)
        if as > 0 then
            ExecuteCommand("cuff")
        end
    end
end
local function aB(ab)
    if f or h then
        local ar = GetPlayerByEntityID(ab)
        local as = GetPlayerServerId(ar)
        if as > 0 then
            TriggerServerEvent("XTRA:dragPlayer", as)
        end
    end
end
local function aC(ab)
    if f or h then
        local ar = GetPlayerByEntityID(ab)
        local as = GetPlayerServerId(ar)
        if as > 0 then
            TriggerServerEvent("XTRA:putInVehicle", as)
        end
    end
end
local function aD(ab)
    local ar = GetPlayerByEntityID(ab)
    local as = GetPlayerServerId(ar)
    if as > 0 then
        TriggerServerEvent("XTRA:gunshotTest", as)
    end
end
local function aE(ab)
    if f or h then
        local ar = GetPlayerByEntityID(ab)
        local as = GetPlayerServerId(ar)
        if as > 0 then
            TriggerServerEvent("XTRA:seizeWeapons", as)
            TriggerServerEvent("XTRA:jailPlayer", as)
        end
    end
end
local function aF(ab)
    if f or h then
        local ar = GetPlayerByEntityID(ab)
        local as = GetPlayerServerId(ar)
        if as > 0 then
            TriggerServerEvent("XTRA:requestTransport", as)
        end
    end
end
local function aG(ab)
    if f or h then
        local ar = GetPlayerByEntityID(ab)
        local as = GetPlayerServerId(ar)
        if as > 0 then
            TriggerServerEvent("XTRA:seizeWeapons", as)
        end
    end
end
local function aH(ab)
    if f or h then
        local ar = GetPlayerByEntityID(ab)
        local as = GetPlayerServerId(ar)
        if as > 0 then
            TriggerServerEvent("XTRA:seizeIllegals", as)
        end
    end
end
RegisterNUICallback(
    "radialClick",
    function(o)
        local aI = o.itemid
        local ab = o.entity
        if IsPedInAnyVehicle(PlayerPedId(), true) and not k then
            return
        end
        if aI == "lock" then
            aa(ab)
        elseif aI == "openBoot" then
            ad(ab)
        elseif aI == "cleanCar" then
            af(ab)
        elseif aI == "lockpick" then
            ag(ab)
        elseif aI == "repair" then
            ah(ab)
        elseif aI == "openHood" then
            am(ab)
        elseif aI == "searchvehicle" then
            an(ab)
        elseif aI == "impoundVehicle" then
            ao(ab)
        elseif aI == "askDriverId" then
            at(ab)
        elseif aI == "askId" then
            av(ab)
        elseif aI == "giveCash" then
            aw(ab)
        elseif aI == "search" then
            ax(ab)
        elseif aI == "robPerson" then
            aq(ab)
        elseif aI == "revive" then
            az(ab)
        elseif aI == "handcuff" then
            aA(ab)
        elseif aI == "drag" then
            aB(ab)
        elseif aI == "putincar" then
            aC(ab)
        elseif aI == "gunshottest" then
            aD(ab)
        elseif aI == "jail" then
            aE(ab)
        elseif aI == "requesttransport" then
            aF(ab)
        elseif aI == "seizeweapons" then
            aG(ab)
        elseif aI == "seizeillegals" then
            aH(ab)
        elseif aI == "leaveRadio" then
            TriggerEvent("XTRA:clientLeaveRadioChannel")
        elseif aI == "toggleMute" then
            ExecuteCommand("toggleradiomute")
        elseif aI == "radioConfig" then
            TriggerEvent("XTRA:openRadioConfig")
        elseif string.match(aI, "radioChannel") then
            local aJ = string.sub(aI, 13, #aI)
            TriggerEvent("XTRA:clientLeaveRadioChannel")
            Wait(2000)
            TriggerEvent("XTRA:clientJoinRadioChannel", tonumber(aJ))
        end
    end
)
RegisterNetEvent("XTRA:globalOnPoliceDuty")
AddEventHandler(
    "XTRA:globalOnPoliceDuty",
    function(aK)
        f = aK
    end
)
RegisterNetEvent("XTRA:globalOnNHSDuty")
AddEventHandler(
    "XTRA:globalOnNHSDuty",
    function(aK)
        g = aK
    end
)
RegisterNetEvent(
    "XTRA:globalOnPrisonDuty",
    function(aL)
        h = aL
    end
)
function GetPlayerByEntityID(aM)
    for r, Q in ipairs(GetActivePlayers()) do
        if aM == GetPlayerPed(Q) then
            return Q
        end
    end
    return nil
end
function tXTRA.getSelectedEntity()
    return b, c
end
AddEventHandler(
    "XTRA:showRadioWheel",
    function(aN)
        if k then
            return
        end
        a = true
        k = true
        SetNuiFocusKeepInput(true)
        SetNuiFocus(true, true)
        SendNUIMessage({openRadialMenu = true, type = "radios", wheelData = aN})
        while k do
            for aM = 0, 6 do
                DisableControlAction(0, aM, true)
            end
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 69, true)
            DisableControlAction(0, 79, true)
            DisableControlAction(0, 92, true)
            DisableControlAction(0, 114, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)
            DisableControlAction(0, 257, true)
            DisableControlAction(0, 263, true)
            DisableControlAction(0, 264, true)
            Citizen.Wait(0)
        end
    end
)
RegisterCommand(
    "lootclosestbag",
    function()
        if not playerIsAlive() or tXTRA.getPlayerVehicle() ~= 0 or GetRenderingCam() ~= -1 then
            return
        end
        local t = tXTRA.getPlayerPed()
        local aO = tXTRA.getPlayerCoords()
        local aP = 0
        local aQ = 3.0
        for r, aR in pairs(GetGamePool("CObject")) do
            local aS = GetEntityModel(aR)
            if
                aS == GetHashKey("xs_prop_arena_bag_01") or aS == GetHashKey("prop_box_ammo03a") or
                    aS == GetHashKey("xs_prop_arena_crate_01a")
             then
                local a0 = #(GetEntityCoords(aR, true) - aO)
                if a0 < aQ and HasEntityClearLosToEntity(t, aR, 17) then
                    aP = aR
                    aQ = a0
                end
            end
        end
        if aP ~= 0 then
            local aS = GetEntityModel(aP)
            local aT = DecorGetInt(aP, "lootid")
            if not g then
                if aS == GetHashKey("xs_prop_arena_bag_01") then
                    local M =
                        GetClosestObjectOfType(
                        GetEntityCoords(PlayerPedId()),
                        10.5,
                        GetHashKey("xs_prop_arena_bag_01"),
                        false,
                        false,
                        false
                    )
                    local N = ObjToNet(M)
                    TriggerEvent("XTRA:startCombatTimer", false)
                    G(
                        function()
                            TriggerServerEvent("XTRA:LootBag", N)
                        end
                    )
                elseif aS == GetHashKey("prop_box_ammo03a") then
                    TriggerEvent("XTRA:startCombatTimer", false)
                    G(
                        function()
                            TriggerServerEvent("XTRA:openCrate", aT)
                        end
                    )
                elseif aS == GetHashKey("xs_prop_arena_crate_01a") then
                    G(
                        function()
                            TriggerServerEvent("XTRA:openCrate", aT)
                            inventoryType = "Crate"
                        end
                    )
                end
            end
        end
    end,
    false
)

RegisterNetEvent("XTRA:playZipperSound",function(j)
    local k = GetEntityCoords(GetPlayerPed(-1))
    local l = #(k - j)
    if l <= 15 then
        local m = GetSoundId()
        PlaySoundFrontend(m, "Object_Collect_Player", "GTAO_FM_Events_Soundset", true)
        ReleaseSoundId(m)
    end
end)


RegisterKeyMapping("lootclosestbag", "Loot Closest Bag", "KEYBOARD", "CAPITAL")