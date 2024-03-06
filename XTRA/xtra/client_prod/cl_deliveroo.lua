local a = module("cfg/cfg_identity")
local b = {
    onJob = false,
    spawnVehicleVector = vector3(-1172.4587402344, -876.53637695312, 14.131204605103),
    startVector = vector3(-1174.4127197266, -872.98626708984, 15.136045455933),
    tempMarker = 0,
    tempBlip = 0,
    tempVehicle = 0,
    tempObject = 0,
    cashEarned = 0,
    stopNumber = 0,
    customerName = "",
    previousCustomisation = nil
}
local c = 17
local d = {"bmx", "cruiser", "fixter", "scorcher", "tribike", "tribike2", "tribike3"}
RegisterNetEvent(
    "XTRA:beginDeliverooJob",
    function()
        local e = d[math.random(1, #d)]
        b.tempVehicle =
            XTRA.spawnVehicle(
            e,
            b.spawnVehicleVector.x,
            b.spawnVehicleVector.y,
            b.spawnVehicleVector.z,
            343,
            true,
            true,
            true
        )
        b.onJob = true
        tXTRA.disableCustomizationSave(b.onJob)
        b.previousCustomisation = tXTRA.getCustomization()
        local f = PlayerPedId()
        SetPedComponentVariation(f, 5, 126, 0, 0)
        SetPedComponentVariation(f, 6, 0, 0, 0)
        SetPedComponentVariation(f, 11, 449, 0, 0)
        tXTRA.notify("~g~Deliveroo Job started, exit the restaurant and head to the first drop off.")
        while b.onJob do
            DrawGTATimerBar("DELIVERIES:", b.stopNumber .. "/" .. c, 2)
            DrawGTATimerBar("~g~EARNED:", "£" .. getMoneyStringFormatted(b.cashEarned), 1)
            drawNativeText("Deliver to ~y~" .. b.customerName .. "~w~.")
            Wait(0)
        end
    end
)
RegisterNetEvent(
    "XTRA:deliverooJobEnd",
    function(g)
        if g then
            tXTRA.notify("~g~Shift complete.")
            DeleteVehicle(GetVehiclePedIsIn(tXTRA.getPlayerPed(), false))
            DeleteVehicle(b.tempVehicle)
        else
            RemoveBlip(b.tempBlip)
            tXTRA.removeMarker(b.tempMarker)
        end
        tXTRA.setCustomization(b.previousCustomisation)
        b.onJob = false
        tXTRA.disableCustomizationSave(b.onJob)
        b.tempMarker = 0
        b.tempBlip = 0
        b.tempVehicle = 0
        b.tempObject = 0
        b.cashEarned = 0
        b.stopNumber = 0
        b.customerName = ""
        b.previousCustomisation = nil
    end
)
RegisterNetEvent(
    "XTRA:deliverooJobReachedNextStop",
    function(h)
        local i = b.tempVehicle
        b.stopNumber = b.stopNumber + 1
        if h then
            b.cashEarned = b.cashEarned + h
        end
        Citizen.CreateThread(
            function()
                while i do
                    SetVehicleEngineOn(i, false, true, false)
                    Wait(0)
                end
            end
        )
        if b.tempMarker then
            tXTRA.removeMarker(b.tempMarker)
        end
        RemoveBlip(b.tempBlip)
        SetTimeout(
            2500,
            function()
                i = nil
            end
        )
    end
)
RegisterNetEvent(
    "XTRA:deliverooJobSetNextBlip",
    function(j)
        b.tempBlip = AddBlipForCoord(j.x, j.y, j.z)
        SetBlipSprite(b.tempBlip, 1)
        SetBlipRoute(b.tempBlip, true)
        b.tempMarker = tXTRA.addMarker(j.x, j.y, j.z - 1, 2.0, 2.0, 1.0, 200, 20, 0, 50, 50)
        local k = a.random_first_names
        b.customerName = k[math.random(1, #k)] .. " " .. k[math.random(1, #k)]
    end
)
AddEventHandler(
    "XTRA:onClientSpawn",
    function(l, m)
        if m then
            local n = function(o)
                drawNativeNotification("Press ~INPUT_PICKUP~ to start your deliveroo shift")
            end
            local p = function(o)
            end
            local q = function(o)
                if IsControlJustReleased(1, 38) and not b.onJob then
                    TriggerServerEvent("XTRA:attemptBeginDeliverooJob")
                end
            end
            tXTRA.addBlip(b.startVector.x, b.startVector.y, b.startVector.z, 106, 1, "Deliveroo Job")
            tXTRA.addMarker(
                b.startVector.x,
                b.startVector.y,
                b.startVector.z - 1,
                1.0,
                1.0,
                1.0,
                255,
                0,
                0,
                70,
                50,
                38,
                false,
                false,
                true
            )
            tXTRA.createArea("deliveroo", b.startVector, 1.5, 6, n, p, q, {})
        end
    end
)
