RMenu.Add(
    "AAMenu",
    "main",
    RageUI.CreateMenu("", "~y~AA ~w~Menu", tXTRA.getRageUIMenuWidth(), tXTRA.getRageUIMenuHeight(), "xtra_aaui", "xtra_aaui")
)
RageUI.CreateWhile(
    1.0,
    true,
    function()
        if RageUI.Visible(RMenu:Get("AAMenu", "main")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    RageUI.Button(
                        "Fix Vehicle",
                        nil,
                        {RightLabel = "→→→"},
                        true,
                        function(a, b, c)
                            if c then
                                Fix()
                            end
                        end
                    )
                    RageUI.Button(
                        "Clean Vehicle",
                        nil,
                        {RightLabel = "→→→"},
                        true,
                        function(a, b, c)
                            if c then
                                Clean()
                            end
                        end
                    )
                    RageUI.Button(
                        "Tow/Untow Vehicle",
                        nil,
                        {RightLabel = "→→→"},
                        true,
                        function(a, b, c)
                            if c then
                                TriggerEvent("tow")
                            end
                        end
                    )
                end
            )
        end
    end
)
RegisterCommand(
    "aamenu",
    function()
        TriggerServerEvent("XTRA:openAAMenu")
    end
)
tXTRA.addBlip(495.36367797852, -1329.1535644531, 29.339862823486, 446, 5, "AA Mechanic")
function tXTRA.openAAMenu()
    RageUI.Visible(RMenu:Get("AAMenu", "main"), not RageUI.Visible(RMenu:Get("AAMenu", "main")))
end
function Fix(d)
    local e = GetPlayerPed(-1)
    if IsPedInAnyVehicle(e) then
        local Fix = GetVehiclePedIsIn(e)
        SetVehicleEngineHealth(Fix, 9999)
        SetVehiclePetrolTankHealth(Fix, 9999)
        SetVehicleFixed(Fix)
        Notify("~y~[AA] ~w~Vehicle has been fixed.")
    else
        Notify("~r~You are not in a vehicle!")
    end
end
function Clean()
    local f = GetPlayerPed(-1)
    if IsPedInAnyVehicle(f, false) then
        local g = GetVehiclePedIsIn(f, false)
        SetVehicleDirtLevel(g, 0)
        Notify("~y~[AA] ~w~Vehicle has been cleaned.")
    else
        Notify("~r~You are not in a vehicle!")
    end
end
function Notify(h)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(h)
    DrawNotification(false, false)
end
local i = {["flatbed"] = {x = 0.0, y = -0.85, z = 0.85}}
local j = false
local k = false
local l = false
local m = false
local n = true
local o = nil
function isTargetVehicleATrailer(p)
    if GetVehicleClassFromName(p) == 11 then
        return true
    else
        return false
    end
end
local q = 0.0
local r = 0.0
local s = 0.0
function isVehicleATowTruck(g)
    local t = false
    for u, v in pairs(i) do
        if IsVehicleModel(g, u) then
            q = v.x
            r = v.y
            s = v.z
            t = true
            break
        end
    end
    return t
end
RegisterNetEvent("tow")
AddEventHandler(
    "tow",
    function()
        local w = PlayerPedId()
        local g = GetVehiclePedIsIn(w, true)
        local x = isVehicleATowTruck(g)
        if x then
            local y = GetEntityCoords(w, 1)
            local z = GetOffsetFromEntityInWorldCoords(w, 0.0, 5.0, 0.0)
            local A = getVehicleInDirection(y, z)
            Citizen.CreateThread(
                function()
                    while true do
                        Citizen.Wait(0)
                        x = isVehicleATowTruck(g)
                        local B = GetEntityRoll(GetVehiclePedIsIn(PlayerPedId(), true))
                        if IsEntityUpsidedown(GetVehiclePedIsIn(PlayerPedId(), true)) and x or B > 70.0 or B < -70.0 then
                            DetachEntity(o, false, false)
                            o = nil
                        end
                    end
                end
            )
            if o == nil then
                if A ~= 0 then
                    local C = GetEntityCoords(A, true)
                    local D = GetEntityCoords(g, true)
                    local E = GetDistanceBetweenCoords(C, D, false)
                    if E > 15.0 then
                        Notify("~y~[AA] ~w~Move your tow truck closer to the vehicle.")
                    else
                        local F = GetEntityModel(A)
                        if
                            not (not j and IsThisModelABoat(F) or not l and IsThisModelAHeli(F) or
                                not k and IsThisModelAPlane(F) or
                                not m and IsThisModelATrain(F) or
                                not n and isTargetVehicleATrailer(F))
                         then
                            if not IsPedInAnyVehicle(w, true) then
                                if g ~= A and IsVehicleStopped(g) then
                                    AttachEntityToEntity(
                                        A,
                                        g,
                                        GetEntityBoneIndexByName(g, "bodyshell"),
                                        0.0 + q,
                                        -1.5 + r,
                                        0.0 + s,
                                        0,
                                        0,
                                        0,
                                        1,
                                        1,
                                        0,
                                        1,
                                        0,
                                        1
                                    )
                                    o = A
                                    Notify("~y~[AA] ~w~Vehicle has been loaded onto the Tow Truck.")
                                else
                                    Notify("~y~[AA] ~w~There is currently no vehicle on the Tow Truck.")
                                end
                            else
                                Notify("~y~[AA] ~w~You need to be outside of your vehicle to load or unload vehicles.")
                            end
                        else
                            Notify("~y~[AA] ~w~Your tow truck is not equipped to tow this vehicle.")
                        end
                    end
                else
                    Notify("~y~[AA] ~w~No towable vehicle detected.")
                end
            elseif IsVehicleStopped(g) then
                DetachEntity(o, false, false)
                local G = GetOffsetFromEntityInWorldCoords(g, 0.0, -12.0, 0.0)
                SetEntityCoords(o, G["x"], G["y"], G["z"], 1, 0, 0, 1)
                SetVehicleOnGroundProperly(o)
                o = nil
                Notify("~y~[AA] ~w~Vehicle has been unloaded from the Tow Truck.")
            end
        else
            Notify("~y~[AA] ~w~Your vehicle is not registered as an official tow truck.")
        end
    end
)
function getVehicleInDirection(H, I)
    local J = CastRayPointToPoint(H.x, H.y, H.z, I.x, I.y, I.z, 10, PlayerPedId(), 0)
    local K, L, M, N, g = GetRaycastResult(J)
    return g
end
