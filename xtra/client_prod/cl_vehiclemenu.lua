local h = {
    "Front Left",
    "Front Right",
    "Back Left",
    "Back Right",
    "Hood",
    "Trunk",
    "Second Trunk",
    "Windows",
    "Close All"
}
local i = {
    "Safe",
    "Safe and Legal",
    "Relaxed",
    "Normal",
    "Rushed",
    "Offroad",
    "Avoid Motorways",
    "Avoid Offroad",
    "Robbster Driving"
}
local j = {43, 427, 60, 786603, 1074528293, 262716, 537133628, 524860, 1076}
local k = {
    vehicle = nil,
    adSpeed = 1,
    autoDrive = false,
    limiterSpeed = 1,
    limiter = false,
    predictedMax = nil,
    door = 1,
    limitingVehicle = nil,
    currentLimit = nil,
    cruise = false,
    adMode = 1
}
local l = false
local m = false
local n = false
local o = false
local p = false
local q = 0
local r = true
local s = false
local t = 1
Citizen.CreateThread(
    function()
        while true do
            if m and tXTRA.getPlayerVehicle() ~= k.limitingVehicle then
                m = false
                SetVehicleMaxSpeed(tXTRA.getPlayerVehicle(), k.predictedMax)
                predictedMax = nil
                tXTRA.notify("~r~Vehicle Changed, stopping limiter")
            end
            Wait(500)
        end
    end
)
function convert(speed)
    return speed * 10 * 0.44704 - 0.5
end



function autoDrive()
    local u = true
    Citizen.CreateThread(
        function()
            while k.autoDrive and u do
                speed = k.adSpeed
                mode = j[k.adMode]
                local v = GetVehiclePedIsIn(tXTRA.getPlayerPed(), false)
                if v ~= 0 then
                    if IsWaypointActive() then
                        if not l or speed ~= q or mode ~= nil then
                            ClearPedTasks(tXTRA.getPlayerPed())
                            waypoint = GetBlipInfoIdCoord(GetFirstBlipInfoId(8))
                            l = true
                            local q = speed
                            local w = mode
                            TaskVehicleDriveToCoord(tXTRA.getPlayerPed(),v,
                                waypoint.x,
                                waypoint.y,
                                waypoint.z,
                                convert(speed),
                                1,
                                GetHashKey(GetEntityModel(v)),
                                w,
                                5,
                                true
                            )
                        end
                    else
                        tXTRA.notify("~r~You do not have a waypoint set")
                        k.autoDrive = false
                    end
                else
                    tXTRA.notify("~r~You are not in a vehicle!")
                    k.autoDrive = false
                end
                local x = GetIsVehicleEngineRunning(v)
                local inWater = IsEntityInWater(v) and not IsPedInAnyBoat(tXTRA.getPlayerPed())
                u = x and not inWater
                if not x then
                    tXTRA.notify("~r~AutoDrive automatically disabled because the engine is inactive")
                    k.autoDrive = false
                elseif inWater then
                    tXTRA.notify("~r~AutoDrive automatically disabled because you are in water")
                    k.autoDrive = false
                end
                Wait(100)
            end
            if not k.autoDrive then
                ClearPedTasks(tXTRA.getPlayerPed())
                l = false
                o = false
            end
        end
    )
end
local owner = false
function cruise()
    accelerating = false
    Citizen.CreateThread(
        function()
            cruiseVehicle = GetVehiclePedIsUsing(tXTRA.getPlayerPed())
            local y = GetEntitySpeed(cruiseVehicle)
            local u = true
            while k.cruise and IsPedInAnyVehicle(tXTRA.getPlayerPed(), false) and u do
                while not accelerating and k.cruise and u do
                    if
                        IsControlPressed(1, 71) or IsControlPressed(1, 72) or IsControlPressed(1, 76) or
                            GetVehicleCurrentGear(cruiseVehicle) == 0
                     then
                        accelerating = true
                        y = acceleratingToNewSpeed(cruiseVehicle)
                    else
                        SetVehicleForwardSpeed(cruiseVehicle, y)
                        SetVehicleOnGroundProperly(cruiseVehicle)
                    end
                    engineStatus = GetIsVehicleEngineRunning(cruiseVehicle)
                    collision = HasEntityCollidedWithAnything(cruiseVehicle)
                    inWater = IsEntityInWater(cruiseVehicle) and not IsPedInAnyBoat(tXTRA.getPlayerPed())
                    u = engineStatus and not collision and not inWater
                    Wait(10)
                end
                Wait(600)
            end
            if collision then
                tXTRA.notify("~r~Cruise control automatically disabled because a collision was detected")
            elseif not engineStatus then
                tXTRA.notify("~r~Cruise control automatically disabled because the engine was turned off")
            elseif inWater then
                tXTRA.notify("~r~Cruise control automatically disabled because you are in water")
            end
            n = false
            k.cruise = false
        end
    )
end
SetVehicleForwardSpeed(GetVehiclePedIsUsing(GetPlayerPed(-1)), 10)
function acceleratingToNewSpeed(cruiseVehicle)
    while IsControlPressed(1, 71) or IsControlPressed(1, 72) or IsControlPressed(1, 76) or
        GetVehicleCurrentGear(cruiseVehicle) == 0 and IsPedInAnyVehicle(tXTRA.getPlayerPed(), false) do
        Wait(100)
    end
    if not IsPedInAnyVehicle(tXTRA.getPlayerPed(), false) then
        accelerating = false
        k.cruise = false
    end
    accelerating = false
    local cruiseVehicle = GetVehiclePedIsUsing(tXTRA.getPlayerPed())
    return GetEntitySpeed(cruiseVehicle)
end
function limiter()
    Citizen.CreateThread(
        function()
            while k.limiter do
                local z = tXTRA.getPlayerVehicle()
                local speed = k.limiterSpeed
                if z ~= 0 then
                    k.limitingVehicle = z
                    m = true
                    k.predictedMax = GetVehicleEstimatedMaxSpeed(z)
                    if convert(speed) > k.predictedMax then
                        SetVehicleMaxSpeed(z, k.predictedMax)
                        k.currentLimit = k.predictedMax
                    else
                        SetVehicleMaxSpeed(z, convert(speed))
                        k.currentLimit = convert(speed)
                    end
                else
                    tXTRA.notify("~r~You are not in a vehicle!")
                    k.limiter = false
                end
                Wait(100)
            end
            SetVehicleMaxSpeed(k.limitingVehicle, k.predictedMax)
            p = false
            m = false
        end
    )
end
function waypointNearest(A)
    local B = tXTRA.getPlayerPed()
    local C = GetEntityCoords(B)
    if A == "garage" then
        for D = 1, #b.garageInstances do
            local E = b.garageInstances[D]
            if E[1] == "Standard Garage" or E[1] == "VIP Cars" then
                if #(E[2] - C) <= 1000000 then
                    SetNewWaypoint(E[2].x, E[2].y)
                    return
                end
            end
        end
    elseif A == "atm" then
        array = d
    elseif A == "mechanic" then
        array = c
    elseif A == "lsc" then
        array = e
    elseif A == "heli" then
        for D = 1, #b.garageInstances do
            local E = b.garageInstances[D]
            if E[1] == "Helicopter Merchant" or E[1] == "VIP Helicopter Merchant" then
                if #(E[2] - C) <= 1000000 then
                    SetNewWaypoint(E[2].x, E[2].y)
                    return
                end
            end
        end
    elseif A == "clothes" then
        array = f
    end
    local F = GetEntityCoords(tXTRA.getPlayerPed())
    local G = 1000000
    for D = 1, #array, 1 do
        local H = #(F - array[D])
        if H < G then
            t = D
        end
    end
    SetNewWaypoint(array[t].x, array[t].y)
    Citizen.Wait(100)
end
RMenu.Add("vehicle_menu", "main", RageUI.CreateMenu("Vehicle", "", tXTRA.getRageUIMenuWidth(), tXTRA.getRageUIMenuHeight()))
RMenu:Get("vehicle_menu", "main"):SetSubtitle("~b~VEHICLE OPTIONS")
RMenu.Add(
    "vehicle_menu",
    "boot_keys",
    RageUI.CreateSubMenu(
        RMenu:Get("vehicle_menu", "main"),
        "",
        "~b~Vehicle Boot Access",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight()
    )
)
RMenu.Add(
    "vehicle_menu",
    "boot_confirm",
    RageUI.CreateSubMenu(
        RMenu:Get("vehicle_menu", "main"),
        "",
        "~b~Vehicle Boot Access Confirmation",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight()
    )
)
RageUI.CreateWhile(
    1.0,
    true,
    function()
        RageUI.IsVisible(
            RMenu:Get("vehicle_menu", "main"),
            true,
            false,
            true,
            function()
                RageUI.Button(
                    "Toggle Door Lock",
                    "Select to toggle between doors locked and unlocked",
                    {RightBadge = RageUI.BadgeStyle.Lock},
                    true,
                    function(I, J, K)
                        if K then
                            local L = tXTRA.getPlayerVehicle()
                            if L ~= 0 then
                                if GetVehicleDoorLockStatus(L) ~= 2 then
                                    SetVehicleDoorsLocked(L, 2)
                                    tXTRA.notify("~w~Doors are now ~r~Locked")
                                else
                                    SetVehicleDoorsLocked(L, 0)
                                    tXTRA.notify("~w~Doors are now ~g~Unlocked")
                                end
                            end
                        end
                    end
                )
                RageUI.List(
                    "Toggle Door",
                    h,
                    k.door,
                    "Select the door you want to toggle open/closed.",
                    {},
                    true,
                    function(I, J, K, M)
                        if K then
                            local L = tXTRA.getPlayerVehicle()
                            if L ~= 0 then
                                local N = M - 1
                                if M == 9 then
                                    SetVehicleDoorsShut(L, false)
                                    tXTRA.notify("~r~Closed ~w~all doors.")
                                elseif M == 8 then
                                    if r then
                                        r = false
                                        RollDownWindow(L, 0)
                                        RollDownWindow(L, 1)
                                        tXTRA.notify("Rolled windows ~r~Down")
                                    else
                                        r = true
                                        RollUpWindow(L, 0)
                                        RollUpWindow(L, 1)
                                        tXTRA.notify("Rolled windows ~g~Up")
                                    end
                                elseif IsVehicleDoorDamaged(L, N) then
                                    tXTRA.notify("~r~Cannot shut this door when the door is damaged")
                                elseif GetVehicleDoorAngleRatio(L, N) == 0 then
                                    SetVehicleDoorOpen(L, N, false, false)
                                    tXTRA.notify(string.format("The ~b~%s ~w~door is now ~g~Open", h[M]))
                                else
                                    SetVehicleDoorShut(L, N, false)
                                    tXTRA.notify(string.format("The ~b~%s ~w~door is now ~r~Closed", h[M]))
                                end
                            end
                        end
                        k.door = M
                    end,
                    function()
                    end,
                    nil
                )
                RageUI.Checkbox(
                    "Activate Speed Limiter",
                    "Select to turn on Speed Limiter",
                    k.limiter,
                    {Style = RageUI.CheckboxStyle.Tick},
                    function(I, K, J, O)
                        if K then
                            if k.limiter then
                                RageUI.Text({message = string.format("~w~Speed Limiter is currently ~g~~h~Active")})
                                k.autoDrive = false
                                k.cruise = false
                                if not p then
                                    local speed = GetEntitySpeed(tXTRA.getPlayerVehicle())
                                    if convert(speed) < 10.0 then
                                        p = true
                                        limiter()
                                    else
                                        p = false
                                        tXTRA.notify("~r~Alert~w~: Please slow down to enable the speed limiter.")
                                    end
                                end
                            else
                                RageUI.Text({message = string.format("~w~Speed Limiter is currently ~r~~h~Inactive")})
                            end
                        end
                        k.limiter = O
                    end
                )
                RageUI.SliderProgress(
                    "Speed Limiter",
                    k.limiterSpeed,
                    25,
                    "Select the speed you wish to limit your vehicle to.",
                    {
                        ProgressBackgroundColor = {R = 0, G = 0, B = 0, A = 255},
                        ProgressColor = {R = 0, G = 117, B = 194, A = 255}
                    },
                    true,
                    function(I, K, J, M)
                        if K then
                            if M ~= k.limiterSpeed then
                                k.limiterSpeed = M
                                RageUI.Text(
                                    {
                                        message = string.format(
                                            "Setting Limiter Speed to: ~r~%s ~w~mph",
                                            k.limiterSpeed * 10
                                        )
                                    }
                                )
                            end
                        end
                    end
                )
                RageUI.Button(
                    "Toggle Engine",
                    "Select to toggle current vehicle engine on/off",
                    {RightBadge = RageUI.BadgeStyle.Key},
                    true,
                    function(I, J, K)
                        if K then
                            local L = tXTRA.getPlayerVehicle()
                            if GetIsVehicleEngineRunning(L) then
                                if L ~= 0 then
                                    SetVehicleEngineOn(L, false, true, true)
                                    tXTRA.notify("You've turned the ignition into the ~r~off ~w~position.")
                                end
                            else
                                if L then
                                    SetVehicleEngineOn(L, true, false, true)
                                    tXTRA.notify("You've turned the ignition to the ~g~on ~w~position.")
                                end
                            end
                        end
                    end
                )
                local isthere, spawncode, distance = tXTRA.getNearestOwnedVehicle(1)
                RageUI.Button(
                    "Manage Boot Keys",
                    "Add Users To The Vehicle Boot",
                    {RightBadge = RageUI.BadgeStyle.Key},
                    false,
                    function(I, J, K)
                        if K then
                            TriggerServerEvent("XTRA:VehicleBoot:Check", spawncode)
                        end
                    end,
                    RMenu:Get("vehicle_menu", "boot_keys")
                )
            end,
            function()
            end
        )
        RageUI.IsVisible(
            RMenu:Get("vehicle_menu", "boot_keys"),
            true,
            false,
            true,
            function()
                local _, spawncode = tXTRA.getNearestOwnedVehicle(1)
                local hasboot = true
                local boottable = {
                    {user_id = 1, name = "Envy"},
                    {user_id = 3, name = "Sheep"},
                    {user_id = 4, name = "Bandit"}
                }
                if next(boottable) then
                    for _, v in pairs(boottable) do
                        RageUI.Button(
                            v.name.."("..v.user_id..")",
                            nil,
                            {RightBadge = RageUI.BadgeStyle.Tick},
                            true,
                            function(I, J, K)
                                if K then
                                    TriggerServerEvent("XTRA:VehicleBoot:Remove", spawncode, v.user_id)
                                end
                            end
                        )
                    end
                end
                RageUI.Button(
                    "Add user to boot access",
                    hasboot and "~g~Select to add a user to the boot access list" or "~r~You Have To Purchase Boot Access To Use This Feature",
                    hasboot and {RightBadge = RageUI.BadgeStyle.Key} or {RightBadge = RageUI.BadgeStyle.Lock},
                    hasboot,
                    function(I, J, K)
                        if K then
                            TriggerServerEvent("XTRA:VehicleBoot:Add", spawncode)
                        end
                    end
                )
                if not hasboot then
                    RageUI.Button(
                        "Purchase Boot Access",
                        "~g~Select to purchase boot access for this vehicle",
                        {RightLabel = "~g~£2,500,000"},
                        true,
                        function(I, J, K)
                            if K then
                                -- Add logic for purchasing boot access here
                            end
                        end,
                        RMenu:Get("vehicle_menu", "boot_confirm")
                    )
                end
            end,
            function()
            end
        )        
        RageUI.IsVisible(
            RMenu:Get("vehicle_menu", "boot_confirm"),
            true,
            false,
            true,
            function()
                local isthere, spawncode, distance = tXTRA.getNearestOwnedVehicle(1)
                RageUI.Button(
                    "Confirm Purchase",
                    "~g~Select to purchase boot access for this vehicle",
                    {RightLabel = "~g~£2,500,000"},
                    true,
                    function(I, J, K)
                        if K then
                            TriggerServerEvent("XTRA:VehicleBoot:Purchase", spawncode)
                            if hasboot then
                                RageUI.GoBack()
                            end
                        end
                    end
                )
            end,
            function()
            end
        )
    end
)
RegisterNetEvent("XTRA:VehicleBoot:Return")
AddEventHandler(
    "XTRA:VehicleBoot:Return",
    function(hasboot, table)
        print(hasboot, table)
        boottable = table
        hasboot = hasboot
    end
)
local function T()
    if IsControlJustPressed(1, 244) then
        if IsPedInAnyVehicle(tXTRA.getPlayerPed(), false) or RageUI.Visible(RMenu:Get("vehicle_menu", "main")) then
            RageUI.CloseAll()
            RageUI.Visible(RMenu:Get("vehicle_menu", "main"), not RageUI.Visible(RMenu:Get("vehicle_menu", "main")))
        else
            tXTRA.notify("~r~You are not in a vehicle!")
        end
    end
end
tXTRA.createThreadOnTick(T)