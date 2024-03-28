local a = module("cfg/cfg_fuel")
AddEventHandler(
    "XTRA:onClientSpawn",
    function(b, c)
        if c then
            for d, e in pairs(a.stations) do
                tXTRA.addBlip(e.x, e.y, e.z, 361, 4, "Petrol Station", 0.6)
            end
        end
    end
)
local f = false
local g = false
local h = 0.0
local i = 0.0
local j = 1000000
local k = false
function setVehicleFuel(l, m)
    if type(m) == "number" and m >= 0 and m <= 100 then
        SetVehicleFuelLevel(l, m + 0.0)
        DecorSetFloat(l, a.decor, GetVehicleFuelLevel(l))
    end
end
local function n(o, p)
    local q = 10 ^ (p or 0)
    return math.floor(o * q + 0.5) / q
end
function tXTRA.getVehicleFuel(l)
    return DecorGetFloat(l, a.decor)
end
local function r(l)
    if not DecorExistOn(l, a.decor) then
        setVehicleFuel(l, math.random(200, 800) / 10)
    elseif not k then
        setVehicleFuel(l, tXTRA.getVehicleFuel(l))
        k = true
    end
    if GetIsVehicleEngineRunning(l) then
        local s = a.fuelUsage[n(GetVehicleCurrentRpm(l), 1)] or 1.0
        setVehicleFuel(l, GetVehicleFuelLevel(l) - s * (a.classes[GetVehicleClass(l)] or 1.0) / 10)
    end
    SendNUIMessage({showFuel = true, fuel = tXTRA.getVehicleFuel(l)})
end
Citizen.CreateThread(
    function()
        DecorRegister(a.decor, 1)
        while true do
            Citizen.Wait(1000)
            local t = PlayerPedId()
            if IsPedInAnyVehicle(t) then
                local l = GetVehiclePedIsIn(t)
                if GetPedInVehicleSeat(l, -1) == t then
                    r(l)
                end
            else
                if k then
                    k = false
                end
            end
        end
    end
)
local function u()
    local v = GetEntityCoords(PlayerPedId())
    local w = {}
    for d, x in ipairs(GetGamePool("CObject")) do
        local y = GetEntityModel(x)
        if a.pumpModels[y] then
            table.insert(w, x)
        end
    end
    local z = 0
    local A = 1000
    for B, C in pairs(w) do
        local D = #(v - GetEntityCoords(C))
        if D < A then
            A = D
            z = C
        end
    end
    return z, A
end
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(250)
            local z, A = u()
            if A < 2.5 then
                f = z
            elseif A < 10.0 then
                f = false
                Citizen.Wait(500)
            elseif A < 50.0 then
                f = false
                Citizen.Wait(2500)
            else
                f = false
                Citizen.Wait(5000)
            end
        end
    end
)
local function b(c, E, F, G)
    local H, I, J = GetScreenCoordFromWorldCoord(c, E, F)
    local K, L, M = table.unpack(GetFinalRenderedCamCoord())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    BeginTextCommandDisplayText("STRING")
    SetTextCentre(1)
    AddTextComponentSubstringPlayerName(G)
    EndTextCommandDisplayText(I, J)
end
AddEventHandler(
    "fuel:startFuelUpTick",
    function(z, t, l)
        h = GetVehicleFuelLevel(l)
        while g do
            Citizen.Wait(500)
            local N = DecorGetFloat(l, a.decor)
            local O = math.random(10, 20) / 10.0
            local P = O * 10
            if not z then
                if GetAmmoInPedWeapon(t, 883325847) - O * 100 >= 0 then
                    h = N + O
                    SetPedAmmo(t, 883325847, math.floor(GetAmmoInPedWeapon(t, 883325847) - O * 100))
                else
                    g = false
                end
            else
                h = N + O
            end
            if h > 100.0 then
                h = 100.0
                g = false
            end
            i = i + P
            if j >= i then
                setVehicleFuel(l, h)
            else
                g = false
            end
        end
        if z then
            TriggerServerEvent("XTRA:takeAmount", math.floor(i))
        end
        local F = GetEntityModel(l)
        local G = tXTRA.getVehicleIdFromHash(F)
        if G then
            local H = GetFuel(l)
            TriggerServerEvent("XTRA:updateFuel", G, math.floor(H * 1000) / 1000)
        end
        i = 0.0
    end
)
AddEventHandler(
    "fuel:refuelFromPump",
    function(z, t, l)
        TaskTurnPedToFaceEntity(t, l, 1000)
        Citizen.Wait(1000)
        SetCurrentPedWeapon(t, -1569615261, true)
        tXTRA.loadAnimDict("timetable@gardener@filling_can")
        TaskPlayAnim(t, "timetable@gardener@filling_can", "gar_ig_5_filling_can", 2.0, 8.0, -1, 50, 0, 0, 0, 0)
        TriggerEvent("fuel:startFuelUpTick", z, t, l)
        while g do
            Citizen.Wait(1)
            for B, C in pairs(a.disabledKeys) do
                DisableControlAction(0, C)
            end
            local Q = GetEntityCoords(l)
            if z then
                local R = GetEntityCoords(z)
                local S = ""
                S = "\n" .. a.translations.TotalCost .. ": ~g~£" .. n(i, 1)
                b(R.x, R.y, R.z + 1.2, a.translations.CancelFuelingPump .. S)
                b(Q.x, Q.y, Q.z + 0.5, n(h, 1) .. "%")
            else
                b(
                    Q.x,
                    Q.y,
                    Q.z + 0.5,
                    a.translations.CancelFuelingJerryCan ..
                        "\nGas can: ~g~" ..
                            n(GetAmmoInPedWeapon(t, 883325847) / 4500 * 100, 1) .. "% | Vehicle: " .. n(h, 1) .. "%"
                )
            end
            if not IsEntityPlayingAnim(t, "timetable@gardener@filling_can", "gar_ig_5_filling_can", 3) then
                TaskPlayAnim(t, "timetable@gardener@filling_can", "gar_ig_5_filling_can", 2.0, 8.0, -1, 50, 0, 0, 0, 0)
            end
            if
                IsControlJustReleased(0, 38) or DoesEntityExist(GetPedInVehicleSeat(l, -1)) or
                    f and GetEntityHealth(z) <= 0
             then
                g = false
            end
        end
        ClearPedTasks(t)
        RemoveAnimDict("timetable@gardener@filling_can")
    end
)
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(1)
            local t = PlayerPedId()
            if not g and (f and GetEntityHealth(f) > 0 or GetSelectedPedWeapon(t) == 883325847 and not f) then
                if IsPedInAnyVehicle(t) and GetPedInVehicleSeat(GetVehiclePedIsIn(t), -1) == t then
                    local T = GetEntityCoords(f)
                    b(T.x, T.y, T.z + 1.2, a.translations.ExitVehicle)
                else
                    local l = GetPlayersLastVehicle()
                    local Q = GetEntityCoords(l)
                    if DoesEntityExist(l) and #(GetEntityCoords(t) - Q) < 2.5 then
                        if not DoesEntityExist(GetPedInVehicleSeat(l, -1)) then
                            local R = GetEntityCoords(f)
                            local U = true
                            if GetSelectedPedWeapon(t) == 883325847 then
                                R = Q
                                if GetAmmoInPedWeapon(t, 883325847) < 100 then
                                    U = false
                                end
                            end
                            if GetVehicleFuelLevel(l) < 95 and U then
                                if j > 0 then
                                    b(R.x, R.y, R.z + 1.2, a.translations.EToRefuel)
                                    if IsControlJustReleased(0, 38) then
                                        g = true
                                        TriggerEvent("fuel:refuelFromPump", f, t, l)
                                        tXTRA.loadAnimDict("timetable@gardener@filling_can")
                                    end
                                else
                                    b(R.x, R.y, R.z + 1.2, a.translations.NotEnoughCash)
                                end
                            elseif not U then
                                b(R.x, R.y, R.z + 1.2, a.translations.JerryCanEmpty)
                            else
                                b(R.x, R.y, R.z + 1.2, a.translations.FullTank)
                            end
                        end
                    elseif f then
                        local R = GetEntityCoords(f)
                        if j >= a.jerryCanCost then
                            if not HasPedGotWeapon(t, 883325847) then
                                b(R.x, R.y, R.z + 1.2, a.translations.PurchaseJerryCan)
                                if IsControlJustReleased(0, 38) then
                                    XTRA.allowWeapon("883325847")
                                    GiveWeaponToPed(t, 883325847, 4500, false, true)
                                    TriggerServerEvent("XTRA:takeAmount", a.jerryCanCost)
                                    j = 50000
                                end
                            else
                                local V = n(a.fuelCost * (1 - GetAmmoInPedWeapon(t, 883325847) / 4500))
                                if V > 0 then
                                    b(R.x, R.y, R.z + 1.2, a.translations.RefillJerryCan .. V)
                                    if IsControlJustReleased(0, 38) then
                                        TriggerServerEvent("XTRA:takeAmount", math.floor(V))
                                        SetPedAmmo(t, 883325847, 4500)
                                    end
                                else
                                    b(R.x, R.y, R.z + 1.2, a.translations.JerryCanFull)
                                end
                            end
                        else
                            b(R.x, R.y, R.z + 1.2, a.translations.NotEnoughCash)
                        end
                    else
                        Citizen.Wait(250)
                    end
                end
            else
                Citizen.Wait(250)
            end
        end
    end
)
Citizen.CreateThread(
    function()
        RequestStreamedTextureDict("regplates")
        while not HasStreamedTextureDictLoaded("regplates") do
            Citizen.Wait(1)
        end
        AddReplaceTexture("vehshare", "plate01", "regplates", "plate01")
        AddReplaceTexture("vehshare", "plate01_n", "regplates", "plate01_n")
        AddReplaceTexture("vehshare", "plate02", "regplates", "plate02")
        AddReplaceTexture("vehshare", "plate02_n", "regplates", "plate02_n")
        AddReplaceTexture("vehshare", "plate03", "regplates", "plate03")
        AddReplaceTexture("vehshare", "plate03_n", "regplates", "plate03_n")
        AddReplaceTexture("vehshare", "plate04", "regplates", "plate04")
        AddReplaceTexture("vehshare", "plate04_n", "regplates", "plate04_n")
        AddReplaceTexture("vehshare", "plate05", "regplates", "plate05")
        AddReplaceTexture("vehshare", "plate05_n", "regplates", "plate05_n")
    end
)
