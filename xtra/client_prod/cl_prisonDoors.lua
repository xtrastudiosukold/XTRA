local a = module("cfg/cfg_prison")
local b = GetInteriorAtCoordsWithType(1787.004, 2593.1984, 45.7978, "int_prison_main")
local c = false
local d = false
local e = true
local f = true
local g = 0
local h = {}
local i = {allEntranceDoors = {}, allPrisonCellDoors = {}, allSegregationDoors = {}, allOtherDoors = {}}
local j = i.allEntranceDoors
Citizen.CreateThread(
    function()
        for k, l in pairs(a.doors) do
            local m = 0
            local n = 0.207
            local o = 0.241
            local p = 0.099
            local q = 0.08
            for r = 1, #l, 1 do
                i[k][#i[k] + 1] = {name = l[r].name, x = n, y = o, doorHash = l[r].doorHash}
                m = m + 1
                n = n + p / 2 + 0.06
                if m == 6 then
                    n = 0.207
                    o = o + q + 0.01
                    m = 0
                end
            end
            i[k][#i[k] + 1] = {name = "All", x = 0.497, y = 0.819, doorHash = k}
        end
    end
)
AddEventHandler(
    "XTRA:onClientSpawn",
    function(s, t)
        if t then
            enter_prisonControlPanel = function()
                drawNativeNotification("Press ~INPUT_CONTEXT~ to open the control panel")
            end
            exit_prisonControlPanel = function()
                d = false
                setCursor(0)
                inGUIXTRA = false
            end
            ontick_prisonControlPanel = function()
                if IsControlJustPressed(0, 38) and not d then
                    if globalOnPrisonDuty then
                        d = true
                        setCursor(1)
                        inGUIXTRA = true
                    end
                elseif IsControlJustPressed(1, 177) or IsControlJustPressed(0, 38) and d then
                    d = false
                    inGUIXTRA = false
                    setCursor(0)
                elseif IsControlJustPressed(0, 168) then
                    if tXTRA.isDev() and globalOnPrisonDuty then
                        d = true
                        setCursor(1)
                        inGUIXTRA = true
                    end
                end
            end
            for r = 1, #a.controlPanels, 1 do
                tXTRA.createArea(
                    "prisonControlPanel_" .. r,
                    a.controlPanels[r].coords,
                    1.5,
                    5,
                    enter_prisonControlPanel,
                    exit_prisonControlPanel,
                    ontick_prisonControlPanel,
                    {}
                )
            end
        end
    end
)
function func_drawControlPanel()
    if d then
        DrawRect(0.493, 0.489, 0.71, 0.765, 0, 0, 0, 150)
        DrawRect(0.207, 0.241, 0.099, 0.08, 0, 0, 0, 150)
        DrawRect(0.239, 0.148, 0.185, 0.055, 0, 0, 0, 150)
        DrawRect(0.423, 0.148, 0.183, 0.055, 0, 0, 0, 150)
        DrawRect(0.597, 0.148, 0.165, 0.055, 0, 0, 0, 150)
        DrawRect(0.7605, 0.148, 0.162, 0.055, 0, 0, 0, 150)
        if not CursorInArea(GetArea(0.239, 0.148, 0.185, 0.055)) then
            DrawAdvancedText(0.341, 0.15, 0.005, 0.0028, 0.4, "Entrance Doors", 255, 255, 255, 255, 0, 0)
        else
            if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                j = i.allEntranceDoors
                PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
            end
            DrawAdvancedText(0.341, 0.15, 0.005, 0.0028, 0.4, "Entrance Doors", 138, 138, 138, 255, 0, 0)
        end
        if not CursorInArea(GetArea(0.423, 0.148, 0.183, 0.056)) then
            DrawAdvancedText(0.513, 0.15, 0.005, 0.0028, 0.4, "Prison Cell Doors", 255, 255, 255, 255, 0, 0)
        else
            if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                j = i.allPrisonCellDoors
                PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
            end
            DrawAdvancedText(0.513, 0.15, 0.005, 0.0028, 0.4, "Prison Cell Doors", 138, 138, 138, 255, 0, 0)
        end
        if not CursorInArea(GetArea(0.597, 0.148, 0.166, 0.055)) then
            DrawAdvancedText(0.691, 0.15, 0.005, 0.0028, 0.4, "Segregation Doors", 255, 255, 255, 255, 0, 0)
        else
            if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                j = i.allSegregationDoors
                PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
            end
            DrawAdvancedText(0.691, 0.15, 0.005, 0.0028, 0.4, "Segregation Doors", 138, 138, 138, 255, 0, 0)
        end
        if not CursorInArea(GetArea(0.761, 0.148, 0.162, 0.055)) then
            DrawAdvancedText(0.857, 0.15, 0.005, 0.0028, 0.4, "Other Doors", 255, 255, 255, 255, 0, 0)
        else
            if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                j = i.allOtherDoors
                PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
            end
            DrawAdvancedText(0.857, 0.15, 0.005, 0.0028, 0.4, "Other Doors", 138, 138, 138, 255, 0, 0)
        end
        for r = 1, #j, 1 do
            if j[r].name == "All" then
                if h[j[r].doorHash].currentState == 5 or h[j[r].doorHash].currentState == 0 then
                    DrawRect(0.497, 0.819, 0.185, 0.058, 0, 180, 0, 150)
                else
                    DrawRect(0.497, 0.819, 0.185, 0.058, 180, 0, 0, 150)
                end
                if not CursorInArea(GetArea(0.497, 0.819, 0.185, 0.058)) then
                    DrawAdvancedText(0.592, 0.82, 0.005, 0.0028, 0.4, "All", 255, 255, 255, 255, 0, 0)
                else
                    if f then
                        if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                            if h[j[r].doorHash].currentState == 5 or h[j[r].doorHash].currentState == 0 then
                                TriggerServerEvent("XTRA:prisonSetDoorState", j[r].doorHash, 1)
                            else
                                TriggerServerEvent("XTRA:prisonSetDoorState", j[r].doorHash, 5)
                            end
                            PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                            f = false
                            SetTimeout(
                                500,
                                function()
                                    f = true
                                end
                            )
                        end
                        DrawAdvancedText(0.592, 0.82, 0.005, 0.0028, 0.4, "All", 138, 138, 138, 255, 0, 0)
                    else
                        DrawAdvancedText(0.592, 0.82, 0.005, 0.0028, 0.4, "All", 255, 255, 255, 255, 0, 0)
                    end
                end
            else
                if h[j[r].doorHash].currentState == 5 or h[j[r].doorHash].currentState == 0 then
                    DrawRect(j[r].x, j[r].y, 0.099, 0.080, 0, 180, 0, 150)
                else
                    DrawRect(j[r].x, j[r].y, 0.099, 0.080, 180, 0, 0, 150)
                end
                if not CursorInArea(GetArea(j[r].x, j[r].y, 0.099, 0.080)) then
                    DrawAdvancedText(
                        j[r].x + 0.0967,
                        j[r].y + 0.0098,
                        0.001,
                        0.001,
                        0.25,
                        j[r].name,
                        255,
                        255,
                        255,
                        255,
                        0,
                        0
                    )
                else
                    if f then
                        if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                            if h[j[r].doorHash].currentState == 1 then
                                TriggerServerEvent("XTRA:prisonSetDoorState", j[r].doorHash, 5)
                            else
                                TriggerServerEvent("XTRA:prisonSetDoorState", j[r].doorHash, 1)
                            end
                            PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                            f = false
                            SetTimeout(
                                500,
                                function()
                                    f = true
                                end
                            )
                        end
                        DrawAdvancedText(
                            j[r].x + 0.0967,
                            j[r].y + 0.0098,
                            0.001,
                            0.001,
                            0.25,
                            j[r].name,
                            138,
                            138,
                            138,
                            255,
                            0,
                            0
                        )
                    else
                        DrawAdvancedText(
                            j[r].x + 0.0967,
                            j[r].y + 0.0098,
                            0.001,
                            0.001,
                            0.25,
                            j[r].name,
                            255,
                            255,
                            255,
                            255,
                            0,
                            0
                        )
                    end
                end
            end
        end
        if c then
            DrawRect(0.791, 0.819, 0.081, 0.06, 180, 0, 0, 150)
        else
            DrawRect(0.791, 0.819, 0.081, 0.06, 0, 180, 0, 150)
        end
        if not CursorInArea(GetArea(0.791, 0.819, 0.081, 0.06)) then
            DrawAdvancedText(0.886, 0.82, 0.005, 0.0028, 0.4, "LOCKDOWN", 255, 255, 255, 255, 0, 0)
        else
            if e then
                if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                    c = not c
                    TriggerServerEvent("XTRA:prisonToggleLockdown", c)
                end
                DrawAdvancedText(0.886, 0.82, 0.005, 0.0028, 0.4, "LOCKDOWN", 0, 138, 138, 138, 0, 0)
            else
                DrawAdvancedText(0.886, 0.82, 0.005, 0.0028, 0.4, "LOCKDOWN", 255, 255, 255, 255, 0, 0)
            end
        end
    end
end
RegisterNetEvent(
    "XTRA:prisonSyncLockdown",
    function(u)
        c = u
        if c then
            RefreshInterior(b)
            ActivateInteriorEntitySet(b, "prison_alarm")
            Citizen.CreateThread(
                function()
                    while not PrepareAlarm("PRISON_ALARMS") do
                        Citizen.Wait(100)
                    end
                    StartAlarm("PRISON_ALARMS", true)
                end
            )
        else
            RefreshInterior(b)
            DeactivateInteriorEntitySet(b, "prison_alarm")
            Citizen.CreateThread(
                function()
                    while not PrepareAlarm("PRISON_ALARMS") do
                        Citizen.Wait(100)
                    end
                    StopAllAlarms(true)
                end
            )
        end
        if c == false then
            e = false
            SetTimeout(
                300000,
                function()
                    e = true
                end
            )
        end
    end
)
tXTRA.createThreadOnTick(func_drawControlPanel)
RegisterNetEvent(
    "XTRA:prisonUpdateGuardNumber",
    function(v)
        g = v
    end
)
AddEventHandler(
    "XTRA:onClientSpawn",
    function(s, t)
        if t then
            while table.count(h) == 0 do
                Citizen.Wait(0)
            end
            enter_openPrisonDoor = function()
            end
            exit_openPrisonDoor = function()
            end
            ontick_openPrisonDoor = function(w)
                local x = ""
                local y = false
                if g > 4 then
                    if
                        tXTRA.isStaffedOn() or globalOnPrisonDuty and w.overrideLock or globalOnPoliceDuty and w.pdOpen or
                            (globalNHSOnDuty or globalLFBOnDuty) and w.nhsOpen
                     then
                        x = " (E to toggle lock) "
                    end
                else
                    if
                        tXTRA.isStaffedOn() or globalOnPrisonDuty or globalOnPoliceDuty and w.pdOpen or
                            (globalNHSOnDuty or globalLFBOnDuty) and w.nhsOpen
                     then
                        x = " (E to toggle lock) "
                        y = true
                    end
                end
                if h[w.doorHash].currentState == 5 or h[w.doorHash].currentState == 0 then
                    tXTRA.DrawText3D(w.coords, w.doorName .. x .. " 🔓", 0.45, 4)
                else
                    tXTRA.DrawText3D(w.coords, w.doorName .. x .. " 🔒", 0.45, 4)
                end
                if
                    IsControlJustPressed(0, 38) and
                        (tXTRA.isStaffedOn() or globalOnPrisonDuty and (y or w.overrideLock) or
                            globalOnPoliceDuty and w.pdOpen or
                            (globalNHSOnDuty or globalLFBOnDuty) and w.nhsOpen)
                 then
                    tXTRA.loadAnimDict("anim@heists@keycard@")
                    Citizen.CreateThread(
                        function()
                            TaskPlayAnim(PlayerPedId(), "anim@heists@keycard@", "enter", 8.0, 1.0, -1, 1, 0, 0, 0, 0)
                            Wait(1200)
                            TaskPlayAnim(PlayerPedId(), "anim@heists@keycard@", "exit", 8.0, 1.0, -1, 1, 0, 0, 0, 0)
                            Wait(1200)
                            ClearPedTasks(PlayerPedId())
                            RemoveAnimDict("anim@heists@keycard@")
                        end
                    )
                    if h[w.doorHash].currentState == 1 then
                        TriggerServerEvent("XTRA:prisonSetDoorState", w.doorHash, 5)
                    else
                        TriggerServerEvent("XTRA:prisonSetDoorState", w.doorHash, 1)
                    end
                end
            end
            for k, l in pairs(a.doors) do
                for r = 1, #l, 1 do
                    tXTRA.createArea(
                        "openPrisonDoor_" .. l[r].doorHash,
                        l[r].coords,
                        1.5,
                        5,
                        enter_openPrisonDoor,
                        exit_openPrisonDoor,
                        ontick_openPrisonDoor,
                        {
                            doorName = l[r].name,
                            doorHash = l[r].doorHash,
                            coords = l[r].coords,
                            overrideLock = l[r].overrideLocks or false,
                            nhsOpen = l[r].nhsOpen or false,
                            pdOpen = l[r].pdOpen or false
                        }
                    )
                end
            end
            local z = function()
            end
            tXTRA.createArea(
                "prisonSyncDoorsOnAreaEnter",
                a.prisonMainCoords,
                250,
                250,
                z,
                function()
                end,
                function()
                end,
                {}
            )
        end
    end
)
RegisterNetEvent(
    "XTRA:prisonSyncAllDoors",
    function(A)
        h = A
        for k, l in pairs(a.doors) do
            for r = 1, #l, 1 do
                AddDoorToSystem(
                    l[r].doorHash,
                    l[r].modelHash,
                    l[r].coords.x,
                    l[r].coords.y,
                    l[r].coords.z,
                    false,
                    false,
                    false
                )
                DoorSystemSetDoorState(l[r].doorHash, h[l[r].doorHash].currentState, false, false)
                if h[l[r].doorHash].currentState == 0 or h[l[r].doorHash].currentState == 5 then
                    DoorSystemSetHoldOpen(l[r].doorHash, true)
                else
                    DoorSystemSetHoldOpen(l[r].doorHash, false)
                end
            end
        end
    end
)
RegisterNetEvent(
    "XTRA:prisonSetAllDoorStates",
    function(B)
        if B ~= nil then
            for k, l in pairs(h) do
                l.currentState = B
                DoorSystemSetDoorState(k, B, false, false)
                if B == 0 or B == 5 then
                    DoorSystemSetHoldOpen(k, true)
                else
                    DoorSystemSetHoldOpen(k, false)
                end
            end
        else
            for k, l in pairs(h) do
                l.currentState = l.defaultState
                DoorSystemSetDoorState(k, l.defaultState, false, false)
                if l.defaultState == 0 or l.defaultState == 5 then
                    DoorSystemSetHoldOpen(k, true)
                else
                    DoorSystemSetHoldOpen(k, false)
                end
            end
        end
    end
)
RegisterNetEvent(
    "XTRA:prisonSyncDoor",
    function(C, B)
        DoorSystemSetDoorState(C, B, false, false)
        if B == 0 or B == 5 then
            DoorSystemSetHoldOpen(C, true)
        else
            DoorSystemSetHoldOpen(C, false)
        end
        if h[C] ~= nil then
            h[C].currentState = B
        end
    end
)
