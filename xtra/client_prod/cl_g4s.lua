local a = false
local b = 0
local c = 0
local d = vector3(-710.4659, 269.6835, 83.13184)
local e = false
local f = false
local g = 0
local h = false
local i = 0
local j = false
local k = 0
local l = 0
local m = {}
local n = "g4svan"
local o = "g4svan"
local p = {}
local q = {}
local r = false
local s = {}
local t = false
local u = false
local v = 0
local w = 0
local x = ""
local y = {
    hackingEngaged = false,
    netId = 0,
    entity = 0,
    src = 0,
    successful = false,
    hackingCooldown = false,
    awaitingResponse = false
}
local z = {x = -709.134, y = 277.1604, z = 83.89014, heading = 288.89}
local A = {active = false, handle = 0}
local function B()
    local C = tXTRA.getPlayerPed()
    local D = 500 * math.ceil(GetDistanceBetweenCoords(tXTRA.getPlayerCoords(), GetEntityCoords(b), true) / 10)
    if j then
        RenderScriptCams(0, 1, D, 1, 0)
        ClearTimecycleModifier()
        if DoesCamExist(cameraHandle) then
            DestroyCam(cameraHandle)
        end
        j = false
    else
        cameraHandle = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        AttachCamToEntity(cameraHandle, b, 2.5, 5.0, 2.0, true)
        local E = GetEntityHeading(b)
        PointCamAtEntity(cameraHandle, b, 1, 1, 1, true)
        RenderScriptCams(1, 1, D, 1, 1)
        Wait(D)
        SetTimecycleModifier("scanline_cam_cheap")
        SetTimecycleModifierStrength(3.0)
        j = true
    end
end
RMenu.Add(
    "g4s",
    "shiftHandler",
    RageUI.CreateMenu(
        "",
        "Security Company",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "xtra_g4sjob",
        "xtra_g4sjob"
    )
)
RMenu:Get("g4s", "shiftHandler"):SetSubtitle("Security Company")
RMenu:Get("g4s", "shiftHandler").Closable = true
RMenu.Add(
    "g4s",
    "main",
    RageUI.CreateMenu(
        "",
        "Security Company",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "xtra_g4sjob",
        "xtra_g4sjob"
    )
)
RMenu:Get("g4s", "main"):SetSubtitle("Security Company")
RMenu:Get("g4s", "main").Closable = true
TriggerEvent("chat:addSuggestion", "/g4s", "Toggles your G4S menu.")
tXTRA.addMarker(d.x, d.y, d.z, 1.2, 1.2, 1.2, 0, 255, 125, 125, 50, 0, true, true)
local F = tXTRA.addBlip(d.x, d.y, d.z, 457, 18, "G4S Depot", 1.0, false)
local G = function()
    RageUI.Visible(RMenu:Get("g4s", "shiftHandler"), true)
end
local H = function()
    RageUI.Visible(RMenu:Get("g4s", "shiftHandler"), false)
end
local I = function()
end
tXTRA.createArea("g4sDepot_", d, 1.5, 6, G, H, I)
Citizen.CreateThread(
    function()
        while true do
            local C = tXTRA.getPlayerPed()
            local J = tXTRA.getPlayerCoords()
            if a then
                if not u then
                    displayJob()
                end
                if m.jobActive then
                    if not m.collected then
                        if t then
                            DrawMarker(
                                29,
                                m.collectionCoords.x,
                                m.collectionCoords.y,
                                m.collectionCoords.z,
                                0.0,
                                0.0,
                                0.0,
                                0.0,
                                180.0,
                                0.0,
                                1.5,
                                1.5,
                                1.5,
                                0,
                                221,
                                255,
                                36,
                                90,
                                true,
                                false,
                                2,
                                nil,
                                nil,
                                false
                            )
                        else
                            DrawMarker(
                                29,
                                m.collectionCoords.x,
                                m.collectionCoords.y,
                                m.collectionCoords.z,
                                0.0,
                                0.0,
                                0.0,
                                0.0,
                                180.0,
                                0.0,
                                1.5,
                                1.5,
                                1.5,
                                0,
                                255,
                                36,
                                36,
                                90,
                                true,
                                false,
                                2,
                                nil,
                                nil,
                                false
                            )
                        end
                        if m.collecting then
                            if not A.active then
                            end
                        else
                            RageUI.Text({message = "Drive to ~b~" .. m.collectionName})
                            if not r then
                                securityCheck(C)
                            end
                        end
                    elseif not m.deposited then
                        if m.depositing then
                            if not A.active then
                            end
                        else
                            RageUI.Text({message = "Drive to ~b~" .. m.depositName})
                            if not r then
                                securityCheck(C)
                            end
                        end
                        DrawMarker(
                            29,
                            m.depositCoords.x,
                            m.depositCoords.y,
                            m.depositCoords.z,
                            0.0,
                            0.0,
                            0.0,
                            0.0,
                            180.0,
                            0.0,
                            1.5,
                            1.5,
                            1.5,
                            255,
                            36,
                            36,
                            50,
                            true,
                            true,
                            2,
                            nil,
                            nil,
                            false
                        )
                    end
                end
                if j then
                    RageUI.Visible(RMenu:Get("g4s", "shiftHandler"), true)
                end
            else
            end
            Wait(0)
        end
    end
)
Citizen.CreateThread(
    function()
        while true do
            if not y.hackingEngaged and not a and not y.awaitingResponse then
                if table.count(s) > 0 and tXTRA.getPlayerVehicle() == 0 then
                    for K, L in pairs(s) do
                        local M = L[3]
                        local N = L[2]
                        local O = L[1]
                        if table.has(p, O) or not DoesEntityExist(N) then
                            s[K] = nil
                        else
                            if IsVehicleStopped(N) then
                                local P = #(tXTRA.getPlayerCoords() - GetEntityCoords(N))
                                local Q = GetOffsetFromEntityInWorldCoords(b, 0.0, -6.0, 0.0)
                                if P <= 11.0 then
                                    DrawMarker(
                                        29,
                                        Q.x,
                                        Q.y,
                                        Q.z + 0.5,
                                        0.0,
                                        0.0,
                                        0.0,
                                        0.0,
                                        180.0,
                                        0.0,
                                        1.5,
                                        1.5,
                                        1.5,
                                        255,
                                        36,
                                        36,
                                        50,
                                        true,
                                        false,
                                        2,
                                        nil,
                                        nil,
                                        false
                                    )
                                    RageUI.Text({message = "G4S~w~: Press ENTER to hack."})
                                    if IsControlJustPressed(1, 18) then
                                        y.netId = M
                                        y.entity = N
                                        y.src = O
                                        TriggerServerEvent("XTRA:requestHackingChanceServer", M, O)
                                        y.awaitingResponse = true
                                        break
                                    end
                                elseif P <= 35.0 then
                                    DrawMarker(
                                        29,
                                        Q.x,
                                        Q.y,
                                        Q.z + 0.5,
                                        0.0,
                                        0.0,
                                        0.0,
                                        0.0,
                                        180.0,
                                        0.0,
                                        1.5,
                                        1.5,
                                        1.5,
                                        255,
                                        36,
                                        36,
                                        50,
                                        true,
                                        false,
                                        2,
                                        nil,
                                        nil,
                                        false
                                    )
                                end
                            end
                        end
                    end
                end
            end
            Wait(0)
        end
    end
)
function toggleCashbox()
    if A.active then
        DeleteObject(A.handle)
        A.active = false
    else
        local o = tXTRA.loadModel("cashbox")
        local C = tXTRA.getPlayerPed()
        A.handle = CreateObject(o, 0, 0, 0, true, true, true)
        while not DoesEntityExist(A.handle) do
            Wait(0)
        end
        A.active = true
        AttachEntityToEntity(
            A.handle,
            C,
            GetPedBoneIndex(C, 57005),
            0.50,
            0,
            0.03,
            -95.0,
            0,
            90.0,
            true,
            true,
            false,
            true,
            1,
            true
        )
        SetModelAsNoLongerNeeded(o)
    end
end
local R = nil
local S
local T = 2
local U = "HONGKONG"
local V = 8
RegisterNetEvent(
    "XTRA:hackingChanceReturn",
    function(b, W, X, Y)
        if Y then
            y.hackingEngaged = true
            y.awaitingResponse = false
            U = X
            T = 2
            PlaySoundFrontend(-1, "5s_To_Event_Start_Countdown", "GTAO_FM_Events_Soundset", true)
            beginHacking()
            FreezeEntityPosition(tXTRA.getPlayerPed(), true)
            tXTRA.setWeapon(tXTRA.getPlayerPed(), "weapon_unarmed", true)
            local o = tXTRA.loadModel("prop_cs_tablet")
            v = CreateObject(o, 0, 0, 0, true, true, true)
            AttachEntityToEntity(
                v,
                tXTRA.getPlayerPed(),
                GetPedBoneIndex(tXTRA.getPlayerPed(), 57005),
                0.17,
                0.10,
                -0.13,
                24.0,
                180.0,
                180.0,
                true,
                true,
                false,
                true,
                1,
                true
            )
            SetModelAsNoLongerNeeded(o)
        else
            y.awaitingResponse = false
        end
    end
)
function beginHacking()
    Citizen.CreateThread(
        function()
            function Initialize(R)
                local R = RequestScaleformMovieInteractive(R)
                while not HasScaleformMovieLoaded(R) do
                    Citizen.Wait(0)
                end
                BeginScaleformMovieMethod(R, "SET_LABELS")
                ScaleformMovieMethodAddParamTextureNameString("Local Disk (C:)")
                ScaleformMovieMethodAddParamTextureNameString("G4S Network")
                ScaleformMovieMethodAddParamTextureNameString("External Device (E:)")
                ScaleformMovieMethodAddParamTextureNameString("HackConnect.exe")
                ScaleformMovieMethodAddParamTextureNameString("G4SHack.exe")
                EndScaleformMovieMethod()
                BeginScaleformMovieMethod(R, "SET_BACKGROUND")
                ScaleformMovieMethodAddParamInt(math.random(1, 6))
                EndScaleformMovieMethod()
                BeginScaleformMovieMethod(R, "ADD_PROGRAM")
                ScaleformMovieMethodAddParamFloat(1.0)
                ScaleformMovieMethodAddParamFloat(4.0)
                ScaleformMovieMethodAddParamTextureNameString("G4S Control Panel")
                EndScaleformMovieMethod()
                BeginScaleformMovieMethod(R, "ADD_PROGRAM")
                ScaleformMovieMethodAddParamFloat(6.0)
                ScaleformMovieMethodAddParamFloat(6.0)
                ScaleformMovieMethodAddParamTextureNameString("Power Off")
                EndScaleformMovieMethod()
                BeginScaleformMovieMethod(R, "SET_COLUMN_SPEED")
                ScaleformMovieMethodAddParamInt(0)
                ScaleformMovieMethodAddParamInt(255)
                EndScaleformMovieMethod()
                BeginScaleformMovieMethod(R, "SET_COLUMN_SPEED")
                ScaleformMovieMethodAddParamInt(1)
                ScaleformMovieMethodAddParamInt(255)
                EndScaleformMovieMethod()
                BeginScaleformMovieMethod(R, "SET_COLUMN_SPEED")
                ScaleformMovieMethodAddParamInt(2)
                ScaleformMovieMethodAddParamInt(255)
                EndScaleformMovieMethod()
                BeginScaleformMovieMethod(R, "SET_COLUMN_SPEED")
                ScaleformMovieMethodAddParamInt(3)
                ScaleformMovieMethodAddParamInt(255)
                EndScaleformMovieMethod()
                BeginScaleformMovieMethod(R, "SET_COLUMN_SPEED")
                ScaleformMovieMethodAddParamInt(4)
                ScaleformMovieMethodAddParamInt(255)
                EndScaleformMovieMethod()
                BeginScaleformMovieMethod(R, "SET_COLUMN_SPEED")
                ScaleformMovieMethodAddParamInt(5)
                ScaleformMovieMethodAddParamInt(255)
                EndScaleformMovieMethod()
                BeginScaleformMovieMethod(R, "SET_COLUMN_SPEED")
                ScaleformMovieMethodAddParamInt(6)
                ScaleformMovieMethodAddParamInt(255)
                EndScaleformMovieMethod()
                BeginScaleformMovieMethod(R, "SET_COLUMN_SPEED")
                ScaleformMovieMethodAddParamInt(7)
                ScaleformMovieMethodAddParamInt(255)
                EndScaleformMovieMethod()
                return R
            end
            R = Initialize("HACKING_PC")
            while true do
                DrawScaleformMovieFullscreen(R, 255, 255, 255, 255, 0)
                BeginScaleformMovieMethod(R, "SET_CURSOR")
                ScaleformMovieMethodAddParamFloat(GetControlNormal(0, 239))
                ScaleformMovieMethodAddParamFloat(GetControlNormal(0, 240))
                EndScaleformMovieMethod()
                if IsDisabledControlJustPressed(0, 24) then
                    BeginScaleformMovieMethod(R, "SET_INPUT_EVENT_SELECT")
                    S = EndScaleformMovieMethod()
                    PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
                elseif IsDisabledControlJustPressed(0, 25) then
                    BeginScaleformMovieMethod(R, "SET_INPUT_EVENT_BACK")
                    EndScaleformMovieMethod()
                    PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
                end
                if s[y.netId] == nil or not y.hackingEngaged then
                    SetScaleformMovieAsNoLongerNeeded(R)
                    T = 0
                    Wait(2000)
                    break
                end
                Citizen.Wait(0)
            end
        end
    )
end
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            if HasScaleformMovieLoaded(R) then
                DisableControlAction(0, 24, true)
                DisableControlAction(0, 25, true)
                if IsScaleformMovieMethodReturnValueReady(S) then
                    ProgramID = GetScaleformMovieMethodReturnValueInt(S)
                    if ProgramID == 82 then
                        PlaySoundFrontend(-1, "HACKING_CLICK_BAD", "", false)
                    elseif ProgramID == 83 then
                        BeginScaleformMovieMethod(R, "RUN_PROGRAM")
                        ScaleformMovieMethodAddParamFloat(83.0)
                        EndScaleformMovieMethod()
                        BeginScaleformMovieMethod(R, "SET_ROULETTE_WORD")
                        ScaleformMovieMethodAddParamTextureNameString(U)
                        EndScaleformMovieMethod()
                    elseif ProgramID == 87 then
                        T = 0
                        BeginScaleformMovieMethod(R, "SET_ROULETTE_WORD")
                        ScaleformMovieMethodAddParamTextureNameString(U)
                        EndScaleformMovieMethod()
                        Wait(100)
                        BeginScaleformMovieMethod(R, "OPEN_ERROR_POPUP")
                        ScaleformMovieMethodAddParamBool(true)
                        ScaleformMovieMethodAddParamTextureNameString("MET POLICE AWARE, DEVICE SHUTTING DOWN")
                        EndScaleformMovieMethod()
                        Wait(100)
                        SetScaleformMovieAsNoLongerNeeded(R)
                        EndScaleformMovieMethod()
                        imageNotification(
                            "notification_images",
                            "g4slogo",
                            "Our security team have activated the panic for this vehicle.",
                            "G4S Security",
                            "Police Notified"
                        )
                        imageNotification(
                            "notification_images",
                            "g4slogo",
                            "You have failed to hack this vehicle.",
                            "G4S Security",
                            "Police Notified"
                        )
                        TriggerServerEvent("XTRA:updateHackingOutcome", y.netId, y.src, U, false)
                        DeleteObject(v)
                        break
                    elseif ProgramID == 92 then
                        PlaySoundFrontend(-1, "HACKING_CLICK_GOOD", "", false)
                    elseif ProgramID == 86 then
                        PlaySoundFrontend(-1, "HACKING_SUCCESS", "", true)
                        BeginScaleformMovieMethod(R, "SET_ROULETTE_OUTCOME")
                        ScaleformMovieMethodAddParamBool(true)
                        ScaleformMovieMethodAddParamTextureNameString("G4S HACK SUCCESSFUL!")
                        EndScaleformMovieMethod()
                        Wait(3800)
                        BeginScaleformMovieMethod(R, "CLOSE_APP")
                        EndScaleformMovieMethod()
                        BeginScaleformMovieMethod(R, "OPEN_LOADING_PROGRESS")
                        ScaleformMovieMethodAddParamBool(true)
                        EndScaleformMovieMethod()
                        BeginScaleformMovieMethod(R, "SET_LOADING_PROGRESS")
                        ScaleformMovieMethodAddParamInt(35)
                        EndScaleformMovieMethod()
                        BeginScaleformMovieMethod(R, "SET_LOADING_TIME")
                        ScaleformMovieMethodAddParamInt(35)
                        EndScaleformMovieMethod()
                        BeginScaleformMovieMethod(R, "SET_LOADING_MESSAGE")
                        ScaleformMovieMethodAddParamTextureNameString("Writing data to hack..")
                        ScaleformMovieMethodAddParamFloat(4.0)
                        EndScaleformMovieMethod()
                        Wait(1500)
                        BeginScaleformMovieMethod(R, "SET_LOADING_MESSAGE")
                        ScaleformMovieMethodAddParamTextureNameString("Executing G4SInjection, accessing money..")
                        ScaleformMovieMethodAddParamFloat(2.0)
                        EndScaleformMovieMethod()
                        BeginScaleformMovieMethod(R, "SET_LOADING_TIME")
                        ScaleformMovieMethodAddParamInt(15)
                        EndScaleformMovieMethod()
                        BeginScaleformMovieMethod(R, "SET_LOADING_PROGRESS")
                        ScaleformMovieMethodAddParamInt(75)
                        EndScaleformMovieMethod()
                        Wait(1500)
                        BeginScaleformMovieMethod(R, "OPEN_LOADING_PROGRESS")
                        ScaleformMovieMethodAddParamBool(false)
                        EndScaleformMovieMethod()
                        BeginScaleformMovieMethod(R, "OPEN_ERROR_POPUP")
                        ScaleformMovieMethodAddParamBool(true)
                        ScaleformMovieMethodAddParamTextureNameString("MET POLICE AWARE - DEVICE SHUTTING DOWN")
                        EndScaleformMovieMethod()
                        Wait(3500)
                        SetScaleformMovieAsNoLongerNeeded(R)
                        EndScaleformMovieMethod()
                        imageNotification(
                            "notification_images",
                            "g4slogo",
                            "We have notified the Metropolitan Police service. You are on CCTV.",
                            "G4S Security",
                            "Police Notified"
                        )
                        TriggerServerEvent("XTRA:updateHackingOutcome", y.netId, y.src, U, true)
                        DeleteObject(v)
                        break
                    elseif ProgramID == 6 then
                        Wait(500)
                        SetScaleformMovieAsNoLongerNeeded(R)
                        DisableControlAction(0, 24, false)
                        DisableControlAction(0, 25, false)
                    end
                    if T == 0 then
                        PlaySoundFrontend(-1, "HACKING_FAILURE", "", true)
                        BeginScaleformMovieMethod(R, "SET_ROULETTE_OUTCOME")
                        ScaleformMovieMethodAddParamBool(false)
                        ScaleformMovieMethodAddParamTextureNameString("G4SINJECT - HACK FAILED!")
                        EndScaleformMovieMethod()
                        Wait(3500)
                        BeginScaleformMovieMethod(R, "CLOSE_APP")
                        EndScaleformMovieMethod()
                        BeginScaleformMovieMethod(R, "OPEN_ERROR_POPUP")
                        ScaleformMovieMethodAddParamBool(true)
                        ScaleformMovieMethodAddParamTextureNameString(
                            "POLICE AWARE OF HACK ATTEMPT, DEVICE SHUTTING DOWN"
                        )
                        EndScaleformMovieMethod()
                        Wait(2500)
                        SetScaleformMovieAsNoLongerNeeded(R)
                        EndScaleformMovieMethod()
                        DisableControlAction(0, 24, false)
                        DisableControlAction(0, 25, false)
                        displayNotification("Hacking Unsuccessful")
                        imageNotification(
                            "notification_images",
                            "g4slogo",
                            "Please note: The police have been notified.",
                            "G4S Security",
                            "Police Notified"
                        )
                        TriggerServerEvent("XTRA:updateHackingOutcome", y.netId, y.src, U, false)
                        DeleteObject(v)
                        break
                    end
                end
            end
        end
    end
)
RageUI.CreateWhile(
    1.0,
    true,
    function()
        if RageUI.Visible(RMenu:Get("g4s", "main")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    if not j then
                        if tXTRA.getPlayerVehicle() == 0 and w < 4 then
                            RageUI.ButtonWithStyle(
                                "New Vehicle",
                                "Get a new vehicle",
                                {RightLabel = "→→→"},
                                true,
                                function(Z, _, a0)
                                    if a0 then
                                        newG4sVehicle()
                                    end
                                end
                            )
                        end
                        RageUI.ButtonWithStyle(
                            "End Shift",
                            "End your shift",
                            {RightLabel = "→→→"},
                            true,
                            function(Z, _, a0)
                                if a0 then
                                    TriggerServerEvent("XTRA:toggleShiftG4S", false)
                                    a = false
                                end
                            end
                        )
                        RageUI.ButtonWithStyle(
                            "Forgot Pin",
                            "Get a pin reminder",
                            {RightLabel = "→→→"},
                            true,
                            function(Z, _, a0)
                                if a0 then
                                    imageNotification(
                                        "CHAR_MP_MEX_DOCKS",
                                        "CHAR_MP_MEX_DOCKS",
                                        "Hey mate, I've got you. Your pin is " .. g .. ".",
                                        "Arthur",
                                        "07925065325"
                                    )
                                end
                            end
                        )
                        if not h then
                            RageUI.ButtonWithStyle(
                                "Activate Panic",
                                "Activate your panic alarm",
                                {RightLabel = "→→→"},
                                true,
                                function(Z, _, a0)
                                    if a0 then
                                        TriggerServerEvent("XTRA:activatePanicServer", c)
                                        imageNotification(
                                            "notification_images",
                                            "g4slogo",
                                            "You have activated your panic alarm.",
                                            "G4S Security",
                                            "Panic Activated"
                                        )
                                        h = true
                                    end
                                end
                            )
                        end
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("g4s", "shiftHandler")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    if not a then
                        RageUI.ButtonWithStyle(
                            "Start Shift",
                            "Start your shift working for G4S.",
                            {RightLabel = "G4S"},
                            true,
                            function(Z, _, a0)
                                if a0 then
                                    RageUI.Visible(RMenu:Get("g4s", "shiftHandler"), false)
                                    TriggerServerEvent("XTRA:toggleShiftG4S", true)
                                end
                            end
                        )
                    else
                        RageUI.ButtonWithStyle(
                            "End Shift",
                            "End your shift working for G4S",
                            {RightLabel = "G4S"},
                            true,
                            function(Z, _, a0)
                                if a0 then
                                    RageUI.Visible(RMenu:Get("g4s", "shiftHandler"), false)
                                    TriggerServerEvent("XTRA:toggleShiftG4S", false)
                                    a = false
                                end
                            end
                        )
                    end
                end
            )
        end
    end
)
function newG4sVehicle()
    local C = tXTRA.getPlayerPed()
    if DoesEntityExist(b) and not IsVehicleDriveable(b, true) then
        DeleteEntity(b)
        local a1 = GetOffsetFromEntityInWorldCoords(C, 0.0, 5.0, 0.0)
        b = XTRA.spawnVehicle(n, a1.x, a1.y, a1.z, GetEntityHeading(C), true, true)
        c = VehToNet(b)
        TriggerServerEvent("XTRA:updateCurrentVehicle", c)
        w = w + 1
    end
end
function securityCheck(C)
    local a2 = tXTRA.getPlayerVehicle()
    if a2 ~= 0 and a2 ~= nil and b ~= nil and b ~= 0 then
        if a2 ~= b then
            r = true
            imageNotification(
                "notification_images",
                "g4slogo",
                "Please ensure you are in your G4S vehicle.",
                "G4S Security",
                "Human Resources"
            )
            SetTimeout(
                15000,
                function()
                    a2 = GetVehiclePedIsIn(tXTRA.getPlayerPed(), false)
                    if a2 ~= 0 then
                        if a2 ~= b then
                            TriggerServerEvent("XTRA:toggleShiftG4S", false)
                            tXTRA.removeBlip(k)
                            tXTRA.removeBlip(l)
                            ClearGpsPlayerWaypoint()
                        end
                    end
                    r = false
                end
            )
        end
    end
end
RegisterNetEvent(
    "XTRA:resetPanicStatus",
    function()
        h = false
    end
)
RegisterNetEvent(
    "XTRA:updateJobInformation",
    function(a3)
        if l ~= 0 then
            tXTRA.removeBlip(l)
        end
        if a3.jobActive then
            if not a3.collected then
                if k ~= 0 then
                    tXTRA.removeBlip(k)
                end
                k =
                    tXTRA.addBlip(
                    a3.collectionCoords.x,
                    a3.collectionCoords.y,
                    a3.collectionCoords.z,
                    500,
                    18,
                    "G4S Collection",
                    1.0,
                    false
                )
                SetBlipRoute(k, true)
                SetBlipRouteColour(k, 18)
            elseif not a3.deposited then
                tXTRA.removeBlip(k)
                l =
                    tXTRA.addBlip(
                    a3.depositCoords.x,
                    a3.depositCoords.y,
                    a3.depositCoords.z,
                    500,
                    47,
                    "G4S Deposit",
                    1.0,
                    false
                )
                SetBlipRoute(l, true)
                SetBlipRouteColour(l, 47)
            end
            m = a3
            PlaySoundFrontend(-1, "Out_Of_Bounds_Timer", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 1)
        else
            displayNotification(
                "New job received:~w~\nCollection: " .. a3.collectionName .. "\nDestination: " .. a3.depositName
            )
            Wait(3000)
            TriggerServerEvent("XTRA:acceptJob")
        end
    end
)
function createInstuctionButtons()
    local R = RequestScaleformMovie("instructional_buttons")
    while not HasScaleformMovieLoaded(R) do
        Citizen.Wait(10)
    end
    BeginScaleformMovieMethod(R, "CLEAR_ALL")
    EndScaleformMovieMethod()
    BeginScaleformMovieMethod(R, "SET_CLEAR_SPACE")
    ScaleformMovieMethodAddParamInt(200)
    EndScaleformMovieMethod()
    BeginScaleformMovieMethod(R, "SET_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(0)
    ScaleformMovieMethodAddParamPlayerNameString(GetControlInstructionalButton(1, 191, true))
    InstructionButtonMessage("Accept Job")
    EndScaleformMovieMethod()
    BeginScaleformMovieMethod(R, "DRAW_INSTRUCTIONAL_BUTTONS")
    EndScaleformMovieMethod()
    BeginScaleformMovieMethod(R, "SET_BACKGROUND_COLOUR")
    ScaleformMovieMethodAddParamInt(0)
    ScaleformMovieMethodAddParamInt(0)
    ScaleformMovieMethodAddParamInt(0)
    ScaleformMovieMethodAddParamInt(80)
    EndScaleformMovieMethod()
    return R
end
RegisterNetEvent(
    "XTRA:startShiftG4S",
    function(a4)
        local C = tXTRA.getPlayerPed()
        local J = tXTRA.getPlayerCoords()
        a = true
        tXTRA.disableCustomizationSave(a)
        b = XTRA.spawnVehicle(n, z.x, z.y, z.z, z.heading, true, true)
        c = VehToNet(b)
        TaskWarpPedIntoVehicle(C, b, -1)
        g = a4
        local a5 = {"Marcus", "Arthur", "Rob", "Thomas", "Despawned"}
        local a6 = math.random(1, 5)
        local a7 = a5[a6]
        imageNotification(
            "CHAR_MP_MEX_DOCKS",
            "CHAR_MP_MEX_DOCKS",
            "Hey, I'm " .. a7 .. " , another agent for G4S. I'll be here giving you some tips along the way.",
            a7,
            "07925065325"
        )
        TriggerServerEvent("XTRA:updateCurrentVehicle", c)
        local a8 = false
        local a9 = false
        local aa = GetEntityModel(C)
        if aa == "mp_m_freemode_01" then
            a8 = true
        elseif aa == "mp_f_freemode_01" then
            a9 = true
        else
            a8 = true
            tXTRA.setCustomization({modelhash = "mp_m_freemode_01"})
        end
        x = json.encode(tXTRA.getCustomization())
        if a8 then
            tXTRA.loadCustomisationPreset("G4SMale")
        else
            tXTRA.loadCustomisationPreset("G4SFemale")
        end
        Wait(2000)
        TaskVehicleDriveToCoord(
            tXTRA.getPlayerPed(),
            b,
            -672.356,
            282.3297,
            81.43005,
            convert(250.0),
            1,
            GetHashKey(GetEntityModel(b)),
            60,
            5,
            true
        )
        Wait(5000)
        TaskVehicleTempAction(tXTRA.getPlayerPed(), b, 27, 10.0)
        Wait(2000)
        imageNotification("CHAR_MP_MEX_DOCKS", "CHAR_MP_MEX_DOCKS", "Use /g4s to access the G4S menu.", a7, "G4S")
    end
)
RegisterNetEvent(
    "XTRA:endShiftG4S",
    function()
        if DoesEntityExist(b) then
            DeleteEntity(b)
        end
        m.jobActive = false
        a = false
        tXTRA.disableCustomizationSave(a)
        if j then
            B()
        end
        local C = tXTRA.getPlayerPed()
        tXTRA.setCustomization(json.decode(x))
        if A.active then
            toggleCashbox()
        end
        if k ~= 0 then
            tXTRA.removeBlip(k)
        end
        if l ~= 0 then
            tXTRA.removeBlip(l)
        end
        ClearGpsPlayerWaypoint()
    end
)
RegisterNetEvent(
    "XTRA:requestMoneyInVehicle",
    function()
        local ab = math.random(1, 4)
        if ab == 1 then
            imageNotification(
                "notification_images",
                "g4slogo",
                "Use /g4s to access your G4S Menu.",
                "G4S Security",
                "Alert"
            )
        end
        t = true
        local ac = tXTRA.getPlayerPed()
        if IsPedInAnyVehicle(ac, true) then
            while IsPedInAnyVehicle(ac, true) do
                Wait(400)
            end
        end
        SetVehicleDoorOpen(b, 3, false, false)
        SetVehicleDoorOpen(b, 4, false, false)
        local ad = false
        local ae = GetOffsetFromEntityInWorldCoords(b, 0.0, -5.0, 0.0)
        while not f do
            DrawMarker(
                29,
                ae.x,
                ae.y,
                ae.z + 0.5,
                0.0,
                0.0,
                0.0,
                0.0,
                180.0,
                0.0,
                1.5,
                1.5,
                1.5,
                255,
                36,
                36,
                50,
                true,
                false,
                2,
                nil,
                nil,
                false
            )
            local P = #(tXTRA.getPlayerCoords() - ae)
            if P <= 1.0 then
                ad = true
                local af = requestSafeCode()
                ad = false
                if af then
                    f = true
                end
                while ad do
                    Wait(100)
                end
            end
            Wait(0)
        end
        SetVehicleDoorShut(b, 3, false)
        SetVehicleDoorShut(b, 4, false)
        m.collecting = false
        if A.active then
            toggleCashbox()
        end
        TriggerServerEvent("XTRA:updateMoneyInVehicle")
        t = false
    end
)
RegisterNetEvent(
    "XTRA:requestMoneyOutVehicle",
    function()
        local ac = tXTRA.getPlayerPed()
        while IsPedInAnyVehicle(ac, true) do
            Wait(400)
        end
        SetVehicleDoorOpen(b, 3, false, false)
        SetVehicleDoorOpen(b, 4, false, false)
        m.depositing = true
        local ad = false
        local ae = GetOffsetFromEntityInWorldCoords(b, 0.0, -5.0, 0.0)
        while f do
            DrawMarker(
                29,
                ae.x,
                ae.y,
                ae.z + 0.5,
                0.0,
                0.0,
                0.0,
                0.0,
                180.0,
                0.0,
                1.5,
                1.5,
                1.5,
                255,
                36,
                36,
                50,
                true,
                false,
                2,
                nil,
                nil,
                false
            )
            local P = #(tXTRA.getPlayerCoords() - ae)
            if P <= 1.0 then
                ad = true
                local af = requestSafeCode()
                ad = false
                if af then
                    f = false
                end
                while ad do
                    Wait(100)
                end
            end
            Wait(0)
        end
        SetVehicleDoorShut(b, 3, false)
        SetVehicleDoorShut(b, 4, false)
        if A.active then
            toggleCashbox()
        end
        w = 1
        TriggerServerEvent("XTRA:updateMoneyOutVehicle")
    end
)
function enterPinScaleform()
    u = true
    SetScaleformMovieAsNoLongerNeeded()
    local R = RequestScaleformMovie("ATM")
    while not HasScaleformMovieLoaded(R) do
        Citizen.Wait(0)
    end
    BeginScaleformMovieMethod(R, "enterPINanim")
    EndScaleformMovieMethod()
    local ag = true
    SetTimeout(
        3000,
        function()
            ag = false
        end
    )
    while ag do
        DrawScaleformMovie(R, 0.5, 0.5, 0.8, 0.8, 255, 255, 255, 0, 0)
        Citizen.Wait(0)
    end
    SetScaleformMovieAsNoLongerNeeded(R)
    EndScaleformMovieMethod()
    u = false
end
function requestSafeCode()
    FreezeEntityPosition(tXTRA.getPlayerPed(), true)
    imageNotification(
        "notification_images",
        "g4slogo",
        "You are required to enter your pin key to access the safe.",
        "G4S Security",
        "Pin Requested"
    )
    AddTextEntry("FMMC_KEY_TIP1", "Enter the safe code:")
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", "", "", "", "", 10)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        RageUI.Text({message = "Your pin is ~b~" .. g})
        Wait(500)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local ah = GetOnscreenKeyboardResult()
        enterPinScaleform()
        if tostring(ah) == tostring(g) then
            imageNotification(
                "notification_images",
                "g4slogo",
                "The safe pin has been entered correctly.",
                "G4S Security",
                "Authorised"
            )
            FreezeEntityPosition(tXTRA.getPlayerPed(), false)
            return true
        else
            PlaySoundFrontend(-1, "Hack_Failed", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
            Wait(2000)
            FreezeEntityPosition(tXTRA.getPlayerPed(), false)
            return false
        end
    end
    FreezeEntityPosition(tXTRA.getPlayerPed(), false)
end
function displayJob()
    SetTextFont(4)
    SetTextScale(0.7, 0.7)
    SetTextColour(0, 121, 235, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName("G4S")
    EndTextCommandDisplayText(0.011, 0.43)
    DrawRect(0.0, 0.51, 0.35, 0.17, 0, 0, 0, 150)
    displayJobDetails()
end
function displayJobDetails()
    SetTextFont(4)
    SetTextScale(0.5, 0.5)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    BeginTextCommandDisplayText("STRING")
    if m.jobActive then
        AddTextComponentSubstringPlayerName("Current Job: " .. m.collectionName .. " - " .. g)
    else
        AddTextComponentSubstringPlayerName("Pending")
    end
    EndTextCommandDisplayText(0.011, 0.47)
    displayDestination()
end
function displayDestination()
    if m.jobActive then
        SetTextFont(4)
        SetTextScale(0.5, 0.5)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringPlayerName("Destination: " .. m.depositName)
        EndTextCommandDisplayText(0.011, 0.51)
        displayStatistics()
    end
end
function displayStatistics()
    SetTextFont(6)
    SetTextScale(0.5, 0.5)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName("Job Number: " .. m.totalJobs)
    EndTextCommandDisplayText(0.011, 0.55)
    DrawRect(0.175, 0.51, 0.005, 0.17, 0, 121, 235, 255)
end
function displayNotification(ai)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(ai)
    EndTextCommandThefeedPostTicker(false, false)
end
function imageNotification(aj, ak, al, am, an)
    if aj == "notification_images" and not HasStreamedTextureDictLoaded("notification_images") then
        RequestStreamedTextureDict("notification_images", true)
        while not HasStreamedTextureDictLoaded("notification_images") do
            Wait(0)
        end
    end
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(al)
    local am = am
    local an = an
    local ao = 0
    local ap = false
    EndTextCommandThefeedPostMessagetext(aj, ak, ap, ao, am, an)
    local aq = true
    local ar = false
    EndTextCommandThefeedPostTicker(ar, aq)
    PlaySoundFrontend(-1, "CHECKPOINT_NORMAL", "HUD_MINI_GAME_SOUNDSET", 1)
end
function helpNotification(ai)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(ai)
    EndTextCommandDisplayHelp(0, 0, 1, -1)
end
RegisterNetEvent(
    "XTRA:openG4SMenu",
    function()
        RageUI.Visible(RMenu:Get("g4s", "main"), true)
    end
)
RegisterNetEvent(
    "XTRA:imageNotification",
    function(aj, ak, al, am, an)
        imageNotification(aj, ak, al, am, an)
    end
)
function InstructionButton(as)
    ScaleformMovieMethodAddParamPlayerNameString(as)
end
function InstructionButtonMessage(ai)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringKeyboardDisplay(ai)
    EndTextCommandScaleformString()
end
RegisterNetEvent(
    "XTRA:bottomMessage",
    function(ai, at)
        bottomMessage(ai, at)
    end
)
function bottomMessage(ai, at)
    local au = 0
    while au < at do
        RageUI.Text({message = ai})
        Wait(0)
    end
end
local function av()
    local aw = GetGameTimer()
    while not RequestScriptAudioBank("DLC_SECURITY\\SIREN_ONE", false) do
        if GetGameTimer() - aw > 1500 then
            print("Failed to load DLC_SECURITY audio bank")
            ReleaseNamedScriptAudioBank("DLC_SECURITY\\SIREN_ONE")
            return
        end
        Citizen.Wait(0)
    end
end
RegisterNetEvent(
    "XTRA:activatePanicAll",
    function(ax, ay)
        if ax ~= 0 and NetworkDoesNetworkIdExist(ax) then
            local az = GetSoundId()
            local aA = NetToVeh(ax)
            if DoesEntityExist(aA) then
                av()
                PlaySoundFromEntity(az, "siren_one", aA, "dlc_security_soundset", 0, 0)
                RequestNamedPtfxAsset("core")
                while not HasNamedPtfxAssetLoaded("core") do
                    RequestNamedPtfxAsset("core")
                    Wait(0)
                end
                if y.netId == ax then
                    y.hackingEngaged = false
                    y.netId = 0
                    y.entity = 0
                    T = 0
                    FreezeEntityPosition(tXTRA.getPlayerPed(), false)
                    imageNotification(
                        "notification_images",
                        "g4slogo",
                        "The alarm has been manually activated.",
                        "G4S Security",
                        "Alarm Activated"
                    )
                end
                UseParticleFxAsset("core")
                local aB =
                    StartParticleFxLoopedOnEntity(
                    "exp_grd_grenade_smoke",
                    NetToVeh(ax),
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    1.0,
                    true,
                    true,
                    true
                )
                RemoveNamedPtfxAsset("core")
                Citizen.CreateThread(
                    function()
                        Wait(100000)
                        StopSound(az)
                        ReleaseSoundId(az)
                        StopParticleFxLooped(aB, true)
                    end
                )
                ReleaseNamedScriptAudioBank("DLC_SECURITY\\SIREN_ONE")
            end
        end
    end
)
RegisterNetEvent(
    "XTRA:activeVansUpdate",
    function(ax, O, aC)
        if not a then
            local b = tXTRA.getObjectId(ax, "XTRA:activeVansUpdate 1")
            if b ~= 0 and b ~= nil and DoesEntityExist(b) then
                if aC then
                    s[ax] = nil
                else
                    if not table.has(s, ax) then
                        local b = tXTRA.getObjectId(ax, "XTRA:activeVansUpdate")
                        s[ax] = {O, b, ax}
                    end
                end
            end
        end
    end
)
RegisterNetEvent(
    "XTRA:terminateHacking",
    function()
        PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", true)
        y.hackingEngaged = false
        y.netId = 0
        y.entity = 0
        T = 0
        FreezeEntityPosition(tXTRA.getPlayerPed(), false)
    end
)
