local a
local b
local c = {
    vector3(448.29037475586, -988.74841308594, 30.689607620239),
    vector3(-1083.501953125, -828.93444824219, 5.4578394889832)
}
local function d(e, f, g)
    local h, i, j = GetScreenCoordFromWorldCoord(e.x, e.y, e.z)
    SetTextScale(g, g)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    BeginTextCommandDisplayText("STRING")
    SetTextCentre(1)
    AddTextComponentSubstringPlayerName(f)
    EndTextCommandDisplayText(i, j)
end
RegisterNetEvent(
    "XTRA:policeSyncAllDoors",
    function(k, l)
        b = k
        a = l
    end
)
AddEventHandler(
    "XTRA:onClientSpawn",
    function(m, n)
        if n then
            while a == nil or b == nil do
                Citizen.Wait(1000)
            end
            enter_openPoliceDoor = function()
            end
            exit_openPoliceDoor = function()
            end
            ontick_openPoliceDoor = function(o)
                local p = ""
                if globalOnPoliceDuty then
                    p = " (E to toggle lock)"
                end
                if a[o.doorHash] == 5 or a[o.doorHash] == 0 then
                    d(o.position, "🔓" .. p, 0.45)
                else
                    d(o.position, "🔒" .. p, 0.45)
                end
                if IsControlJustPressed(0, 38) and globalOnPoliceDuty then
                    tXTRA.loadAnimDict("anim@heists@keycard@")
                    Citizen.CreateThread(
                        function()
                            TaskPlayAnim(PlayerPedId(), "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 48, 0, 0, 0, 0)
                            Wait(1200)
                            ClearPedTasks(PlayerPedId())
                            RemoveAnimDict("anim@heists@keycard@")
                        end
                    )
                    if a[o.doorHash] == 4 then
                        TriggerServerEvent("XTRA:policeSetDoorState", o.doorHash, 5)
                    else
                        TriggerServerEvent("XTRA:policeSetDoorState", o.doorHash, 4)
                    end
                end
            end
            for q = 1, #b, 1 do
                tXTRA.createArea(
                    "openPoliceDoor_" .. b[q].doorHash,
                    b[q].position,
                    1.5,
                    5,
                    enter_openPoliceDoor,
                    exit_openPoliceDoor,
                    ontick_openPoliceDoor,
                    {doorHash = b[q].doorHash, position = b[q].position}
                )
            end
            for q = 1, #b do
                AddDoorToSystem(
                    b[q].doorHash,
                    b[q].modelHash,
                    b[q].position.x,
                    b[q].position.y,
                    b[q].position.z,
                    false,
                    false,
                    false
                )
                DoorSystemSetDoorState(b[q].doorHash, a[b[q].doorHash], false, false)
            end
            local r = function()
                TriggerServerEvent("XTRA:enterPoliceSyncDoors")
            end
            for q = 1, #c do
                tXTRA.createArea(
                    "policeSyncDoorsOnAreaEnter",
                    c[q],
                    250,
                    250,
                    r,
                    function()
                    end,
                    function()
                    end,
                    {}
                )
            end
        end
    end
)
RegisterNetEvent(
    "XTRA:policeSyncDoor",
    function(s, t)
        DoorSystemSetDoorState(s, t, false, false)
        if t == 0 or t == 5 then
            DoorSystemSetHoldOpen(s, true)
        else
            DoorSystemSetHoldOpen(s, false)
        end
        if a and a[s] ~= nil then
            a[s] = t
        end
    end
)
RegisterNetEvent(
    "XTRA:gotAllDoorStates",
    function(u)
        a = u
        for v, w in pairs(a) do
            DoorSystemSetDoorState(v, w, false, false)
            if w == 0 or w == 5 then
                DoorSystemSetHoldOpen(v, true)
            else
                DoorSystemSetHoldOpen(v, false)
            end
        end
    end
)
