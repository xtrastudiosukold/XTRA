local a = {
    onJob = false,
    spawnVehicleVector = vector3(455.00802612304, -582.24096679688, 28.49980354309),
    startVector = vector3(429.52169799804, -587.45068359375, 29.499813079834),
    tempMarker = 0,
    tempBlip = 0,
    tempVehicle = 0,
    tempObject = 0,
    cashEarned = 0,
    stopNumber = 0
}
local b = {
    {pedModel = "a_f_m_beach_01"},
    {pedModel = "a_f_m_bevhills_01"},
    {pedModel = "a_f_m_bevhills_02"},
    {pedModel = "a_f_m_bodybuild_01"},
    {pedModel = "a_f_m_business_02"},
    {pedModel = "a_f_m_downtown_01"},
    {pedModel = "a_f_m_eastsa_01"},
    {pedModel = "a_f_m_eastsa_02"},
    {pedModel = "a_f_m_fatbla_01"},
    {pedModel = "a_f_m_fatcult_01"},
    {pedModel = "a_f_m_fatwhite_01"},
    {pedModel = "a_f_m_ktown_01"},
    {pedModel = "a_f_m_ktown_02"},
    {pedModel = "a_f_m_prolhost_01"},
    {pedModel = "a_f_m_ktown_01"},
    {pedModel = "a_f_m_prolhost_01"},
    {pedModel = "a_f_m_salton_01"},
    {pedModel = "a_f_m_skidrow_01"}
}
local c = 10
RegisterNetEvent(
    "XTRA:beginBusJob",
    function()
        a.tempVehicle =
            XTRA.spawnVehicle(
            "bus",
            a.spawnVehicleVector.x,
            a.spawnVehicleVector.y,
            a.spawnVehicleVector.z,
            343,
            true,
            true,
            true
        )
        a.onJob = true
        tXTRA.notify("~g~Bus Job started, exit the bus station and head to the first bus stop.")
        while a.onJob do
            DrawGTATimerBar("PASSENGERS:", a.stopNumber .. "/" .. c, 2)
            DrawGTATimerBar("~g~EARNED:", "£" .. getMoneyStringFormatted(a.cashEarned), 1)
            Wait(0)
        end
    end
)
RegisterNetEvent(
    "XTRA:endBusJob",
    function()
        tXTRA.notify("~g~Shift complete.")
        DeletePed(busJobPed)
        DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1), false))
        DeleteVehicle(a.tempVehicle)
        a.onJob = false
        a.tempMarker = 0
        a.tempBlip = 0
        a.tempVehicle = 0
        a.tempObject = 0
        a.cashEarned = 0
        a.stopNumber = 0
    end
)
RegisterNetEvent(
    "XTRA:nextStopReachedBusJob",
    function(d)
        local e = a.tempVehicle
        a.stopNumber = a.stopNumber + 1
        if d then
            a.cashEarned = a.cashEarned + d
        end
        Citizen.CreateThread(
            function()
                while e do
                    SetVehicleEngineOn(e, false, true, false)
                    Wait(0)
                end
            end
        )
        if a.tempMarker then
            tXTRA.removeMarker(a.tempMarker)
        end
        SetVehicleDoorOpen(e, 0)
        SetVehicleDoorOpen(e, 1)
        SetVehicleDoorOpen(e, 2)
        SetVehicleDoorOpen(e, 3)
        SetVehicleDoorOpen(e, 4)
        SetVehicleDoorOpen(e, 5)
        RemoveBlip(a.tempBlip)
        local f = tXTRA.loadModel(b[a.stopNumber].pedModel)
        local g = tXTRA.getPosition()
        local h = 10.0
        local i, j = GetSafeCoordForPed(g.x + math.random(-h, h), g.y + math.random(-h, h), g.z, false, 16)
        if not i then
            local k = 0
            repeat
                local l, safeZ = GetGroundZFor_3dCoord(g)
                if not l then
                    k = k + 0.1
                end
            until l
            j = vector3(g.x + math.random(-h, h), g.y + math.random(-h, h), safeZ)
        end
        DeletePed(busJobPed)
        busJobPed = CreatePed(26, f, j.x, j.y, j.z, GetEntityHeading(e), false, true)
        while not DoesEntityExist(busJobPed) do
            Wait(0)
        end
        SetEntityCanBeDamaged(busJobPed, 0)
        SetPedAsEnemy(busJobPed, 0)
        SetBlockingOfNonTemporaryEvents(busJobPed, 1)
        SetPedCanRagdollFromPlayerImpact(busJobPed, 0)
        TaskGoToEntity(busJobPed, e, 10.0, 2.0, 5.0, false, false)
        Wait(4000)
        for m = 1, GetVehicleMaxNumberOfPassengers(e) do
            if IsVehicleSeatFree(e, m) then
                TaskEnterVehicle(busJobPed, e, 10.0, m, 5.0, 0, 0)
            end
        end
        Wait(3000)
        SetTimeout(
            2500,
            function()
                SetVehicleDoorShut(e, 0)
                SetVehicleDoorShut(e, 1)
                SetVehicleDoorShut(e, 2)
                SetVehicleDoorShut(e, 3)
                SetVehicleDoorShut(e, 4)
                SetVehicleDoorShut(e, 5)
                e = nil
                busJobPed = nil
            end
        )
    end
)
RegisterNetEvent(
    "XTRA:setNextBusJobBlip",
    function(n)
        a.tempBlip = AddBlipForCoord(n.x, n.y, n.z)
        SetBlipSprite(a.tempBlip, 1)
        SetBlipRoute(a.tempBlip, true)
        a.tempMarker = tXTRA.addMarker(n.x, n.y, n.z, 1.2, 1.2, 1.2, 255, 0, 0, 125, 50, 0, true, true)
    end
)
RegisterNetEvent("XTRA:onClientSpawn")
AddEventHandler(
    "XTRA:onClientSpawn",
    function(o, p)
        if p then
            local q = function(r)
                drawNativeNotification("Press ~INPUT_PICKUP~ to start your bus shift")
            end
            local m = function(r)
            end
            local s = function(r)
                if IsControlJustReleased(1, 38) and not a.onJob then
                    TriggerServerEvent("XTRA:attemptBeginBusJob")
                end
            end
            tXTRA.addBlip(a.startVector.x, a.startVector.y, a.startVector.z, 106, 1, "Bus Driver Job")
            tXTRA.addMarker(
                a.startVector.x,
                a.startVector.y,
                a.startVector.z - 1,
                1.0,
                1.0,
                1.0,
                255,
                0,
                0,
                70,
                50,
                39,
                false,
                false,
                true
            )
            tXTRA.createArea("bus", a.startVector, 1.5, 6, q, m, s, {})
        end
    end
)
function alert(t)
    SetTextComponentFormat("STRING")
    AddTextComponentString(t)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
function DrawGTAText(u, v, w, x, y, z)
    SetTextFont(0)
    SetTextScale(x, x)
    SetTextColour(254, 254, 254, 255)
    if y then
        SetTextWrap(v - z, v)
        SetTextRightJustify(true)
    end
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(u)
    EndTextCommandDisplayText(v, w)
end
function DrawGTATimerBar(A, u, B)
    local z = 0.17
    local C = -0.01
    local D = 0.038
    local E = 0.008
    local F = 0.005
    local G = 0.32
    local H = -0.04
    local I = 0.014
    local J = GetSafeZoneSize()
    local K = I + J - z + z / 2
    local L = H + J - D + D / 2 - (B - 1) * (D + F)
    DrawSprite("timerbars", "all_black_bg", K, L, z, 0.038, 0, 0, 0, 0, 128)
    DrawGTAText(A, J - z + 0.06, L - E, G)
    DrawGTAText(string.upper(u), J - C, L - 0.0175, 0.5, true, z / 2)
end
