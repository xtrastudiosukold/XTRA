function DrawMissionText2(a, b)
    ClearPrints()
    BeginTextCommandPrint("STRING")
    AddTextComponentSubstringPlayerName(a)
    EndTextCommandPrint(b, 1)
end
local function c()
    if GetEntityHealth(tXTRA.getPlayerPed()) <= 102 then
        tXTRA.notify("~r~You try to move but you remember you're dead")
        return true
    elseif IsEntityDead(tXTRA.getPlayerPed()) then
        tXTRA.notify("~r~You try to move but you remember you're dead")
        return true
    else
        return false
    end
end
local function d()
    local e = tXTRA.getPlayerPed()
    if
        not IsPedInAnyVehicle(e, false) and not IsPedSwimming(e) and not IsPedShooting(e) and not IsPedClimbing(e) and
            not IsPedCuffed(e) and
            not IsPedDiving(e) and
            not IsPedFalling(e) and
            not IsPedJumping(e) and
            not IsPedJumpingOutOfVehicle(e) and
            IsPedOnFoot(e) and
            not IsPedRunning(e) and
            not IsPedUsingAnyScenario(e) and
            not IsPedInParachuteFreeFall(e) and
            not isPlayerNearPrison()
     then
        return true
    else
        return false
    end
end
RegisterCommand(
    "bag",
    function(f, g)
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            GiveWeaponToPed(h, 0x88C78EB7, 1, false, true)
        end
    end,
    false
)
RegisterCommand(
    "bag2",
    function(f, g)
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            GiveWeaponToPed(h, 0x01B79F17, 1, false, true)
        end
    end,
    false
)
globalSurrenderring = false
local i = true
function surrender()
    local h = GetPlayerPed(-1)
    if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and (d() or isPlayerNearPrison()) then
        tXTRA.loadAnimDict("random@arrests")
        tXTRA.loadAnimDict("random@arrests@busted")
        if IsEntityPlayingAnim(h, "random@arrests@busted", "idle_a", 3) then
            globalSurrenderring = false
            TaskPlayAnim(h, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0)
            surrendered = false
            Wait(3000)
            TaskPlayAnim(h, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0)
        else
            globalSurrenderring = true
            TaskPlayAnim(h, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0)
            Wait(4000)
            TaskPlayAnim(h, "random@arrests", "kneeling_arrest_idle", 8.0, 1.0, -1, 2, 0, 0, 0, 0)
            Wait(500)
            TaskPlayAnim(h, "random@arrests@busted", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0)
            surrendered = true
            Wait(1000)
            TaskPlayAnim(h, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0)
            Wait(0)
            while IsEntityPlayingAnim(h, "random@arrests@busted", "idle_a", 3) do
                Citizen.Wait(0)
            end
            globalSurrenderring = false
            surrendered = false
        end
        RemoveAnimDict("random@arrests")
        RemoveAnimDict("random@arrests@busted")
    end
end
local function j()
    local k = tXTRA.getPlayerPed()
    if
        surrendered or IsEntityPlayingAnim(k, "missminuteman_1ig_2", "handsup_enter", 3) or
            IsEntityPlayingAnim(k, "random@arrests", "idle_2_hands_up", 3) or
            IsEntityPlayingAnim(k, "random@arrests@busted", "idle_a", 3)
     then
        return true
    end
    return false
end
local function l(m, n, o, p, q, r)
    local s = o * r / 100
    local m = m - o * r / 100 / 2 - o / 2
    DrawRect(m + s, n, s, p, q[1], q[2], q[3], q[4])
end
function tXTRA.isPlayerSurrendered()
    local t = GetGameTimer()
    while GetGameTimer() - t <= 5000 and j() do
        l(0.475, 0.8, 0.0690 * 2, 0.0085 * 1.5, {255, 47, 27, 255}, (GetGameTimer() - t) / 5000 * 100)
        Wait(0)
    end
    if GetGameTimer() - t > 5000 then
        return true
    end
    return false
end
function tXTRA.isPlayerSurrenderedNoProgressBar()
    return j()
end
local u
RegisterNetEvent(
    "XTRA:startRobbingPlayer",
    function()
        u = GetGameTimer()
    end
)
RegisterNetEvent(
    "XTRA:endRobbingPlayer",
    function()
        u = nil
    end
)
Citizen.CreateThread(
    function()
        while true do
            Wait(0)
            if surrendered then
                DisableControlAction(1, 140, true)
                DisableControlAction(1, 141, true)
                DisableControlAction(1, 142, true)
                DisableControlAction(0, 21, true)
            end
            DisableControlAction(2, 36, true)
            if u then
                l(0.475, 0.8, 0.0690 * 2, 0.0085 * 1.5, {255, 47, 27, 255}, (GetGameTimer() - u) / 5000 * 100)
            end
        end
    end
)
RegisterCommand(
    "k",
    function(f, g)
        if i then
            surrender()
        end
    end,
    false
)
RegisterCommand(
    "surrender",
    function(f, g)
        if i then
            surrender()
        end
    end,
    false
)
local v = false
local w = "prop_parking_wand_01"
local x = nil
local y = false
local z = "hei_heist_sh_bong_01"
local A = nil
local B = false
local C = "prop_amb_phone"
local D = nil
RegisterCommand(
    "picture",
    function(f, g)
        local h = tXTRA.getPlayerPed()
        local E = GetHashKey(C)
        RequestModel(E)
        local F = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
        local G = CreateObject(E, F.x, F.y, F.z, 1, 1, 1)
        local H = "amb@world_human_mobile_film_shocking@male@enter"
        local I = "amb@world_human_mobile_film_shocking@male@base"
        local J = "amb@world_human_mobile_film_shocking@male@exit"
        local K = "core"
        local L = "ent_anim_paparazzi_flash"
        if DoesEntityExist(h) and not IsEntityDead(h) then
            loadAnimDict(H)
            loadAnimDict(I)
            loadAnimDict(J)
            RequestNamedPtfxAsset(K)
            if B then
                TaskPlayAnim(h, J, "exit", 8.0, 1.0, -1, 50, 0, 0, 0, 0)
                Wait(1840)
                DetachEntity(G, false, false)
                DeleteEntity(G)
                Wait(750)
                ClearPedSecondaryTask(tXTRA.getPlayerPed())
                B = false
            else
                Wait(500)
                SetNetworkIdExistsOnAllMachines(G, true)
                NetworkUseHighPrecisionBlending(G, true)
                SetNetworkIdCanMigrate(G, false)
                TaskPlayAnim(h, H, "enter", 8.0, 1.0, -1, 50, 0, 0, 0, 0)
                Wait(1260)
                AttachEntityToEntity(
                    G,
                    GetPlayerPed(PlayerId()),
                    GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422),
                    -0.005,
                    0.0,
                    0.0,
                    360.0,
                    360.0,
                    0.0,
                    1,
                    1,
                    0,
                    1,
                    0,
                    1
                )
                tXTRA.notify("Press ~r~[E]~w~ to take a picture!")
                B = true
            end
        end
        SetModelAsNoLongerNeeded(E)
        while B do
            Wait(0)
            if IsControlJustPressed(0, 38) then
                tXTRA.notify("Click Click")
                Wait(500)
                UseParticleFxAsset(K)
                StartParticleFxNonLoopedOnEntity(L, G, 0.0, 0.1, 0.0, 0.0, 0.0, 0.0, 2.0, 0.0, 0.0, 0.0)
            end
        end
        RemoveNamedPtfxAsset(K)
    end,
    false
)
RegisterCommand(
    "bong",
    function(f, g)
        local M = "anim@safehouse@bong"
        local N = "bong_stage1"
        local h = tXTRA.getPlayerPed()
        local O = GetHashKey(z)
        RequestModel(O)
        local F = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
        local P = CreateObject(O, F.x, F.y, F.z, 1, 1, 1)
        SetModelAsNoLongerNeeded(O)
        if DoesEntityExist(h) and not IsEntityDead(h) then
            loadAnimDict(M)
            if y then
                Wait(100)
                ClearPedSecondaryTask(tXTRA.getPlayerPed())
                DetachEntity(P, false, false)
                DeleteEntity(P)
                y = false
            else
                Wait(500)
                SetNetworkIdExistsOnAllMachines(P, true)
                NetworkUseHighPrecisionBlending(P, true)
                SetNetworkIdCanMigrate(P, false)
                AttachEntityToEntity(
                    P,
                    GetPlayerPed(PlayerId()),
                    GetPedBoneIndex(GetPlayerPed(PlayerId()), 18905),
                    0.10,
                    -0.25,
                    0.0,
                    95.0,
                    190.0,
                    180.0,
                    1,
                    1,
                    0,
                    1,
                    0,
                    1
                )
                Wait(120)
                tXTRA.notify("Press ~r~[E]~w~ to take a toke!")
                y = true
            end
        end
        while y do
            Wait(0)
            local Q = GetEntityCoords(h, true)
            local R = GetEntityHeading(h)
            if IsControlJustPressed(0, 38) then
                TaskPlayAnimAdvanced(h, M, N, Q.x, Q.y, Q.z, 0.0, 0.0, R, 8.0, 1.0, 4000, 49, 0.25, 0, 0)
                Wait(100)
                tXTRA.notify("You take a huge rip!")
                Wait(7250)
            end
        end
    end,
    false
)
RegisterCommand(
    "ma",
    function(f, g)
        local M = "amb@world_human_car_park_attendant@male@base"
        local N = "base"
        local I = "amb@world_human_drinking@beer@male@exit"
        local S = "exit"
        local T = GetHashKey(w)
        RequestModel(T)
        local h = tXTRA.getPlayerPed()
        local F = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
        local U = CreateObject(T, F.x, F.y, F.z, 1, 1, 1)
        if DoesEntityExist(h) and not IsEntityDead(h) then
            loadAnimDict(M)
            loadAnimDict(I)
            if v then
                Wait(100)
                ClearPedSecondaryTask(tXTRA.getPlayerPed())
                DetachEntity(U, false, false)
                DeleteEntity(U)
                v = false
            else
                Wait(500)
                SetNetworkIdExistsOnAllMachines(U, true)
                NetworkUseHighPrecisionBlending(U, true)
                SetNetworkIdCanMigrate(U, false)
                AttachEntityToEntity(
                    U,
                    GetPlayerPed(PlayerId()),
                    GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422),
                    -0.005,
                    0.0,
                    0.0,
                    360.0,
                    360.0,
                    0.0,
                    1,
                    1,
                    0,
                    1,
                    0,
                    1
                )
                Wait(120)
                tXTRA.notify("Press ~r~[E]~w~ to wave the wand.")
                v = true
            end
        end
        SetModelAsNoLongerNeeded(T)
        while v do
            Wait(0)
            local V = {
                "Nothing to see here, lets move along.",
                "Keep it moving!",
                "Ugh, why did I pick traffic control..",
                "Lets go already!",
                "Will yinz hurry up!!"
            }
            local W = math.random(1, 5)
            if IsControlJustPressed(0, 38) then
                TaskPlayAnim(h, M, N, 8.0, 1.0, 5000, 49, 0, 0, 0, 0)
                Wait(100)
                tXTRA.notify(V[W])
            end
        end
    end,
    false
)
RegisterCommand(
    "dance1",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@black_madonna_entourage@"
        local X = "li_dance_facedj_11_v1_male^1"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance2",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@black_madonna_entourage@"
        local X = "hi_dance_facedj_09_v2_male^5"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance3",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@black_madonna_entourage@"
        local X = "li_dance_facedj_15_v2_male^2"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance4",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_single_props@"
        local X = "mi_dance_prop_15_v1_male^1"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance5",
    function(f, g)
        local H = "anim@amb@nightclub@djs@dixon@"
        local X = "dixn_dance_a_dixon"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance6",
    function(f, g)
        local H = "anim@amb@nightclub@djs@solomun@"
        local X = "sol_trans_out_to_rt_a_sol"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance7",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_09_v1_female^1"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance8",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_09_v1_female^2"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance9",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_09_v1_female^3"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance10",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_09_v1_female^4"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance11",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_09_v1_female^5"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance12",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_09_v1_female^6"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance13",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_09_v1_male^1"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance14",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_09_v1_male^2"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance15",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_09_v1_male^3"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance16",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_09_v1_male^4"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance17",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_09_v1_male^5"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance18",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_09_v1_male^6"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance19",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_09_v2_female^1"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance20",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_09_v2_female^2"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance21",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_09_v2_female^3"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance22",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_09_v2_female^4"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance23",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_09_v2_female^5"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance24",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_09_v2_female^6"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance25",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_09_v2_male^1"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance26",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_09_v2_male^2"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance27",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_09_v2_male^3"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance28",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_09_v2_male^4"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance29",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_09_v2_male^5"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance30",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_09_v2_male^6"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance31",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_11_v1_female^1"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance32",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_11_v1_female^2"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance33",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_11_v1_female^3"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance34",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_11_v1_female^4"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance35",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_11_v1_female^5"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance36",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_11_v1_female^6"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance37",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_11_v1_male^1"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance38",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_11_v1_male^2"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance39",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_11_v1_male^3"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance40",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_11_v1_male^4"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance41",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_11_v1_male^5"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance42",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_11_v1_male^6"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance43",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_11_v2_female^1"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance44",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_11_v2_female^2"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance45",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_11_v2_female^3"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance46",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_11_v2_female^4"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance47",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_11_v2_female^5"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance48",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_11_v2_female^6"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance49",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_11_v2_male^1"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance50",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_11_v2_male^2"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance51",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_11_v2_male^3"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance52",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_11_v2_male^4"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance53",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_11_v2_male^5"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance54",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "hi_dance_facedj_11_v2_male^6"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance55",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "mi_dance_facedj_09_v1_female^1"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance56",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "mi_dance_facedj_09_v1_female^2"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance57",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "mi_dance_facedj_09_v1_female^3"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance58",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "mi_dance_facedj_09_v1_female^4"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance59",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "mi_dance_facedj_09_v1_female^5"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance60",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "mi_dance_facedj_09_v1_female^6"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance61",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "mi_dance_facedj_09_v1_male^1"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance62",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "mi_dance_facedj_09_v1_male^2"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance63",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "mi_dance_facedj_09_v1_male^3"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance64",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "mi_dance_facedj_09_v1_male^4"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance65",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "mi_dance_facedj_09_v1_male^5"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance66",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "mi_dance_facedj_09_v1_male^6"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance67",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "mi_dance_facedj_09_v2_female^1"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance68",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "mi_dance_facedj_09_v2_female^2"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance69",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "mi_dance_facedj_09_v2_female^3"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance70",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "mi_dance_facedj_09_v2_female^4"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance71",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "mi_dance_facedj_09_v2_female^5"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance72",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@"
        local X = "mi_dance_facedj_09_v2_female^6"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance73",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity"
        local X = "hi_dance_facedj_09_v1_female^1"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance74",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity"
        local X = "hi_dance_facedj_09_v1_female^2"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance75",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity"
        local X = "hi_dance_facedj_09_v1_female^3"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance74",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity"
        local X = "hi_dance_facedj_09_v1_female^4"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance75",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity"
        local X = "hi_dance_facedj_09_v1_female^5"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance76",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity"
        local X = "hi_dance_facedj_09_v1_female^6"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance77",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity"
        local X = "trans_dance_crowd_li_to_hi_09_v1_male^1"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance78",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity"
        local X = "trans_dance_crowd_li_to_hi_09_v1_male^2"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance79",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity"
        local X = "trans_dance_crowd_li_to_hi_09_v1_male^3"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance80",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity"
        local X = "trans_dance_crowd_li_to_hi_09_v1_male^4"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance81",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity"
        local X = "trans_dance_crowd_li_to_hi_09_v1_male^5"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance82",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity"
        local X = "trans_dance_crowd_li_to_hi_09_v1_male^6"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance83",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity"
        local X = "trans_dance_crowd_mi_to_hi_09_v1_male^1"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance84",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity"
        local X = "trans_dance_crowd_mi_to_hi_09_v1_male^2"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance85",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity"
        local X = "trans_dance_crowd_mi_to_hi_09_v1_male^3"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance86",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity"
        local X = "trans_dance_crowd_mi_to_hi_09_v1_male^4"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance87",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity"
        local X = "trans_dance_crowd_mi_to_hi_09_v1_male^5"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance88",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity"
        local X = "trans_dance_crowd_mi_to_hi_09_v1_male^6"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance89",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_single_props@"
        local X = "hi_dance_prop_09_v1_female^1"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance90",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_single_props@"
        local X = "hi_dance_prop_09_v1_female^2"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance91",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_single_props@"
        local X = "hi_dance_prop_09_v1_female^3"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance92",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_single_props@"
        local X = "hi_dance_prop_09_v1_female^4"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance93",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_single_props@"
        local X = "hi_dance_prop_09_v1_female^5"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance94",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_single_props@"
        local X = "hi_dance_prop_09_v1_female^6"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance95",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_single_props@"
        local X = "hi_dance_prop_09_v1_male^1"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance96",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_single_props@"
        local X = "hi_dance_prop_09_v1_male^2"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance97",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_single_props@"
        local X = "hi_dance_prop_09_v1_male^3"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance98",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_single_props@"
        local X = "hi_dance_prop_09_v1_male^4"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance99",
    function(f, g)
        local H = "anim@amb@nightclub@dancers@crowddance_single_props@"
        local X = "hi_dance_prop_09_v1_male^5"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
RegisterCommand(
    "dance100",
    function(f, g)
        local H = ""
        local X = ""
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
    end,
    false
)
Citizen.CreateThread(
    function()
        local Y = false
        while true do
            if
                IsDisabledControlPressed(1, 19) and IsDisabledControlPressed(1, 63) and d() and
                    not sittingAtBlackjackTable
             then
                if not Y and globalNHSOnDuty then
                    Y = true
                    local Z = "combat@drag_ped@"
                    local _ = "injured_drag_plyr"
                    local a0 = "injured_drag_ped"
                    local a1 = 0.48
                    local a2 = 4103
                    local p = 0.0
                    local a3 = 0.0
                    local a4 = 30000
                    controlFlagMe = 33
                    controlFlagTarget = 33
                    animFlagTarget = 1
                    detachFlag = 1
                    boneIndex = 11816
                    local a5 = GetClosestPlayer(3)
                    if a5 then
                        local a6 = GetPlayerServerId(a5)
                        if a6 ~= -1 then
                            TriggerServerEvent(
                                "XTRA:animationSync",
                                a5,
                                Z,
                                _,
                                a0,
                                a1,
                                a2,
                                p,
                                a6,
                                a4,
                                a3,
                                controlFlagMe,
                                controlFlagTarget,
                                animFlagTarget,
                                detachFlag,
                                boneIndex
                            )
                        end
                    end
                else
                    Y = false
                    DetachEntity(tXTRA.getPlayerPed(), false, false)
                    ClearPedSecondaryTask(tXTRA.getPlayerPed())
                    local a5 = GetClosestPlayer(3)
                    local a7 = GetPlayerServerId(a5)
                    if a7 ~= 0 then
                        TriggerServerEvent("XTRA:animationSyncStop", a7)
                    end
                end
                Wait(250)
            end
            Wait(0)
        end
    end
)
RegisterNetEvent(
    "XTRA:animationSyncClStop",
    function()
        ClearPedSecondaryTask(tXTRA.getPlayerPed())
        DetachEntity(tXTRA.getPlayerPed(), false, false)
    end
)
RegisterNetEvent(
    "XTRA:animationSyncTarget",
    function(a7, a8, a9, a1, a2, p, a4, a3, aa, animFlagTarget, detachFlag, boneIndex)
        local e = tXTRA.getPlayerPed()
        local ab = GetPlayerPed(GetPlayerFromServerId(a7))
        RequestAnimDict(a8)
        while not HasAnimDictLoaded(a8) do
            Citizen.Wait(10)
        end
        if a3 == nil then
            a3 = 180.0
        end
        AttachEntityToEntity(
            tXTRA.getPlayerPed(),
            ab,
            boneIndex or 0,
            a2,
            a1,
            p,
            0.5,
            0.5,
            a3,
            false,
            false,
            false,
            false,
            2,
            false
        )
        Wait(500)
        if detachFlag == nil then
            detachFlag = 0
        end
        if detachFlag == 0 then
            DetachEntity(tXTRA.getPlayerPed(), true, false)
        end
        if aa == nil then
            aa = 0
        end
        TaskPlayAnim(e, a8, a9, 8.0, -8.0, a4, aa, 0, false, false, false)
        RemoveAnimDict(a8)
        Citizen.Wait(a4)
        DetachEntity(tXTRA.getPlayerPed(), true, false)
    end
)
RegisterNetEvent(
    "XTRA:animationSyncMe",
    function(a8, ac, a4, aa, ad)
        local e = tXTRA.getPlayerPed()
        RequestAnimDict(a8)
        while not HasAnimDictLoaded(a8) do
            Citizen.Wait(10)
        end
        Wait(500)
        if aa == nil then
            aa = 0
        end
        TaskPlayAnim(e, a8, ac, 8.0, -8.0, a4, aa, 0, false, false, false)
        RemoveAnimDict(a8)
    end
)
RegisterCommand(
    "rope",
    function(f, g)
        local H = "random@burial"
        local X = "untie_ped"
        local h = tXTRA.getPlayerPed()
        if DoesEntityExist(h) and tXTRA.canAnim() and not IsEntityDead(h) and d() then
            tXTRA.loadAnimDict(H)
            if IsEntityPlayingAnim(h, H, X, 3) then
                TaskPlayAnim(h, H, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(h)
            else
                TaskPlayAnim(h, H, X, 3.0, 1.0, 2000, 1, 0, 0, 0, 0)
                Wait(2000)
                TaskPlayAnim(h, H, X, 3.0, 1.0, 2000, 1, 0, 0, 0, 0)
                Wait(2000)
                TaskPlayAnim(h, H, X, 3.0, 1.0, 2000, 1, 0, 0, 0, 0)
                Wait(2000)
                TaskPlayAnim(h, H, X, 3.0, 1.0, 2000, 1, 0, 0, 0, 0)
                Wait(2000)
                TaskPlayAnim(h, H, X, 3.0, 1.0, 2000, 1, 0, 0, 0, 0)
                Wait(2000)
                TaskPlayAnim(h, H, X, 3.0, 1.0, 2000, 1, 0, 0, 0, 0)
                Wait(2000)
                TaskPlayAnim(h, H, X, 3.0, 1.0, 2000, 1, 0, 0, 0, 0)
                Wait(2000)
                TaskPlayAnim(h, H, X, 3.0, 1.0, 2000, 1, 0, 0, 0, 0)
                Wait(2000)
                TaskPlayAnim(h, H, X, 3.0, 1.0, 2000, 1, 0, 0, 0, 0)
                Wait(2000)
                TaskPlayAnim(h, H, X, 3.0, 1.0, 2000, 1, 0, 0, 0, 0)
                Wait(2000)
                TaskPlayAnim(h, H, X, 3.0, 1.0, 2000, 1, 0, 0, 0, 0)
                Wait(2000)
                TaskPlayAnim(h, H, X, 3.0, 1.0, 2000, 1, 0, 0, 0, 0)
                Wait(2000)
                TaskPlayAnim(h, H, X, 3.0, 1.0, 2000, 1, 0, 0, 0, 0)
                Wait(2000)
                TaskPlayAnim(h, H, X, 3.0, 1.0, 2000, 1, 0, 0, 0, 0)
                Wait(2000)
                TaskPlayAnim(h, H, X, 3.0, 1.0, 2000, 1, 0, 0, 0, 0)
                Wait(2000)
                TaskPlayAnim(h, H, X, 3.0, 1.0, 2000, 1, 0, 0, 0, 0)
                Wait(2000)
                TaskPlayAnim(h, H, X, 3.0, 1.0, 2000, 1, 0, 0, 0, 0)
                Wait(2000)
                TaskPlayAnim(h, H, X, 3.0, 1.0, 2000, 1, 0, 0, 0, 0)
                Wait(2000)
                TaskPlayAnim(h, H, X, 3.0, 1.0, 2000, 1, 0, 0, 0, 0)
            end
            RemoveAnimDict(H)
        end
        Wait(5000)
    end,
    false
)
RegisterNetEvent(
    "XTRA:drinkGin",
    function()
        local H = "mp_safehousebeer@"
        local h = tXTRA.getPlayerPed()
        local ae = "p_whiskey_bottle_s"
        tXTRA.loadAnimDict(H)
        local m, n, af = table.unpack(GetEntityCoords(h))
        TaskPlayAnim(h, H, "drink_2", 800.0, 8.0, -1, 49, 0, 0, 0, 0)
        Wait(1000)
        prop = CreateObject(GetHashKey(ae), m, n, af + 0.2, true, true, true)
        AttachEntityToEntity(
            prop,
            h,
            GetPedBoneIndex(h, 28422),
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            180.0,
            true,
            true,
            false,
            true,
            1,
            true
        )
        Wait(5000)
        TaskPlayAnim(h, H, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
        Wait(100)
        RequestAnimSet("move_m@drunk@verydrunk")
        while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
            Citizen.Wait(0)
        end
        DoScreenFadeOut(1000)
        Citizen.Wait(1000)
        ClearPedTasksImmediately(tXTRA.getPlayerPed())
        SetTimecycleModifier("spectator5")
        SetPedMotionBlur(tXTRA.getPlayerPed(), true)
        SetPedMovementClipset(tXTRA.getPlayerPed(), "move_m@drunk@verydrunk", true)
        RemoveAnimSet("move_m@drunk@verydrunk")
        SetPedIsDrunk(tXTRA.getPlayerPed(), true)
        DoScreenFadeIn(1000)
        ClearPedSecondaryTask(tXTRA.getPlayerPed())
        DeleteObject(prop)
        Wait(60000)
        DoScreenFadeOut(1000)
        Citizen.Wait(1000)
        DoScreenFadeIn(1000)
        ClearTimecycleModifier()
        ResetScenarioTypesEnabled()
        ResetPedMovementClipset(tXTRA.getPlayerPed(), 0)
        SetPedIsDrunk(tXTRA.getPlayerPed(), false)
        SetPedMotionBlur(tXTRA.getPlayerPed(), false)
        RemoveAnimDict(H)
    end
)
RegisterNetEvent(
    "XTRA:drinkCan",
    function(ag)
        local H = "mp_safehousebeer@"
        local h = tXTRA.getPlayerPed()
        local ae = ag
        tXTRA.loadAnimDict(H)
        local m, n, af = table.unpack(GetEntityCoords(h))
        TaskPlayAnim(h, H, "drink_2", 800.0, 8.0, -1, 49, 0, 0, 0, 0)
        Wait(1000)
        prop = CreateObject(GetHashKey(ae), m, n, af + 0.2, true, true, true)
        AttachEntityToEntity(
            prop,
            h,
            GetPedBoneIndex(h, 28422),
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            180.0,
            true,
            true,
            false,
            true,
            1,
            true
        )
        Wait(5000)
        TaskPlayAnim(h, H, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
        Wait(100)
        RequestAnimSet("move_m@drunk@verydrunk")
        while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
            Citizen.Wait(0)
        end
        DoScreenFadeOut(1000)
        Citizen.Wait(1000)
        ClearPedTasksImmediately(tXTRA.getPlayerPed())
        SetTimecycleModifier("spectator5")
        SetPedMotionBlur(tXTRA.getPlayerPed(), true)
        SetPedMovementClipset(tXTRA.getPlayerPed(), "move_m@drunk@verydrunk", true)
        RemoveAnimSet("move_m@drunk@verydrunk")
        SetPedIsDrunk(tXTRA.getPlayerPed(), true)
        DoScreenFadeIn(1000)
        ClearPedSecondaryTask(tXTRA.getPlayerPed())
        DeleteObject(prop)
        Wait(60000)
        DoScreenFadeOut(1000)
        Citizen.Wait(1000)
        DoScreenFadeIn(1000)
        ClearTimecycleModifier()
        ResetScenarioTypesEnabled()
        ResetPedMovementClipset(tXTRA.getPlayerPed(), 0)
        SetPedIsDrunk(tXTRA.getPlayerPed(), false)
        SetPedMotionBlur(tXTRA.getPlayerPed(), false)
        RemoveAnimDict(H)
    end
)
function tXTRA.isPlayerKneeling()
    return IsEntityPlayingAnim(PlayerPedId(), "random@arrests@busted", "idle_a", 3)
end
local ah = false
RegisterNetEvent(
    "XTRA:startShavingPlayer",
    function(ai)
        local aj = GetPlayerFromServerId(ai)
        if aj == -1 then
            return
        end
        local ak = GetPlayerPed(aj)
        if ak == 0 then
            return
        end
        tXTRA.loadAnimDict("misshair_shop@hair_dressers")
        tXTRA.setCanAnim(false)
        local e = PlayerPedId()
        local al = GetOffsetFromEntityInWorldCoords(ak, -0.3, -0.2, 0.0)
        local am = GetEntityHeading(ak)
        SetEntityCoords(e, al.x, al.y, al.z - 1.0, true, false, false)
        SetEntityHeading(e, am)
        SetEntityNoCollisionEntity(e, ak, false)
        SetEntityNoCollisionEntity(ak, e, false)
        tXTRA.loadModel("prop_clippers_01")
        local an = CreateObject("prop_clippers_01", al.x, al.y, al.z + 2.0, true, true, false)
        AttachEntityToEntity(
            an,
            e,
            GetPedBoneIndex(e, 6286),
            0.08,
            0.0,
            -0.025,
            0.0,
            180.0,
            -90.0,
            false,
            false,
            false,
            false,
            0,
            true
        )
        TaskPlayAnim(e, "misshair_shop@hair_dressers", "keeper_hair_cut_a", 8.0, 8.0, -1, 1, 1.0, false, false, false)
        local ao = math.floor(GetAnimDuration("misshair_shop@hair_dressers", "keeper_hair_cut_a") * 1000)
        Citizen.Wait(ao)
        TaskPlayAnim(e, "misshair_shop@hair_dressers", "keeper_hair_cut_b", 8.0, 8.0, -1, 1, 1.0, false, false, false)
        local ap = math.floor(GetAnimDuration("misshair_shop@hair_dressers", "keeper_hair_cut_b") * 1000)
        Citizen.Wait(ap)
        ClearPedTasks(e)
        SetEntityNoCollisionEntity(e, ak, true)
        SetEntityNoCollisionEntity(ak, e, true)
        DeleteEntity(an)
        tXTRA.setCanAnim(true)
        RemoveAnimDict("misshair_shop@hair_dressers")
        SetModelAsNoLongerNeeded("prop_clippers_01")
    end
)
RegisterNetEvent(
    "XTRA:startBeingShaved",
    function(aq)
        local ar = GetPlayerFromServerId(aq)
        if ar == -1 then
            return
        end
        local as = GetPlayerPed(ar)
        if as == 0 then
            return
        end
        tXTRA.setCanAnim(false)
        i = false
        local e = PlayerPedId()
        FreezeEntityPosition(e, true)
        local at = GetGameTimer()
        while GetGameTimer() - at < 15500 do
            if not IsEntityPlayingAnim(e, "random@arrests@busted", "idle_a", 3) then
                TaskPlayAnim(e, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, false, false, false)
            end
            Citizen.Wait(0)
        end
        SetPedComponentVariation(e, 2, 0, 0, 0)
        FreezeEntityPosition(e, false)
        i = true
        tXTRA.setCanAnim(true)
        ah = true
        Citizen.Wait(1800000)
        ah = false
    end
)
RegisterNetEvent(
    "XTRA:playDelayedShave",
    function(au)
        local av = GetPlayerFromServerId(au)
        if av == -1 then
            return
        end
        local ab = GetPlayerPed(av)
        if ab == 0 then
            return
        end
        local aw = tXTRA.getPlayerCoords()
        local ax = GetEntityCoords(ab, true)
        if #(aw - ax) < 15.0 then
            SendNUIMessage({transactionType = "shave"})
        end
    end
)
RegisterNetEvent(
    "XTRA:setAsShaved",
    function(ay)
        ah = true
        Citizen.Wait(ay)
        ah = false
    end
)
local function az(aA)
    if ah and GetPedDrawableVariation(aA.playerPed, 2) ~= 0 then
        SetPedComponentVariation(aA.playerPed, 2, 0, 0, 0)
    end
end
tXTRA.createThreadOnTick(az)