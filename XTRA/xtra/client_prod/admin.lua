noclipActive = false
local a = nil
local b = 1
local c = 0
local d = false
local e = false
local f = {
    controls = {
        openKey = 288,
        goUp = 85,
        goDown = 38,
        turnLeft = 34,
        turnRight = 35,
        goForward = 32,
        goBackward = 33,
        reduceSpeed = 19,
        increaseSpeed = 21
    },
    speeds = {
        {label = "Very Slow", speed = 0.1},
        {label = "Slow", speed = 0.5},
        {label = "Normal", speed = 2},
        {label = "Fast", speed = 4},
        {label = "Very Fast", speed = 6},
        {label = "Extremely Fast", speed = 10},
        {label = "Extremely Fast v2.0", speed = 20},
        {label = "Max Speed", speed = 25}
    },
    offsets = {y = 0.5, z = 0.2, h = 3},
    bgR = 0,
    bgG = 0,
    bgB = 0,
    bgA = 80
}
local function g(h)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringKeyboardDisplay(h)
    EndTextCommandScaleformString()
end
local function i(j)
    ScaleformMovieMethodAddParamPlayerNameString(j)
end
local function k(l)
    local l = RequestScaleformMovie(l)
    while not HasScaleformMovieLoaded(l) do
        Citizen.Wait(1)
    end
    BeginScaleformMovieMethod(l, "CLEAR_ALL")
    EndScaleformMovieMethod()
    BeginScaleformMovieMethod(l, "SET_CLEAR_SPACE")
    ScaleformMovieMethodAddParamInt(200)
    EndScaleformMovieMethod()
    BeginScaleformMovieMethod(l, "SET_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(1)
    i(GetControlInstructionalButton(1, f.controls.goBackward, true))
    i(GetControlInstructionalButton(1, f.controls.goForward, true))
    g("Go Forwards/Backwards")
    EndScaleformMovieMethod()
    BeginScaleformMovieMethod(l, "SET_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(0)
    i(GetControlInstructionalButton(2, f.controls.reduceSpeed, true))
    i(GetControlInstructionalButton(2, f.controls.increaseSpeed, true))
    g("Increase/Decrease Speed (" .. f.speeds[b].label .. ")")
    EndScaleformMovieMethod()
    BeginScaleformMovieMethod(l, "DRAW_INSTRUCTIONAL_BUTTONS")
    EndScaleformMovieMethod()
    BeginScaleformMovieMethod(l, "SET_BACKGROUND_COLOUR")
    ScaleformMovieMethodAddParamInt(f.bgR)
    ScaleformMovieMethodAddParamInt(f.bgG)
    ScaleformMovieMethodAddParamInt(f.bgB)
    ScaleformMovieMethodAddParamInt(f.bgA)
    EndScaleformMovieMethod()
    return l
end
function tXTRA.toggleNoclip()
    TriggerServerEvent("XTRA:VerifyStaff", tXTRA.getStaffLevel())
    noclipActive = not noclipActive
    if IsPedInAnyVehicle(tXTRA.getPlayerPed(), false) then
        c = GetVehiclePedIsIn(tXTRA.getPlayerPed(), false)
    else
        c = tXTRA.getPlayerPed()
    end
    SetEntityCollision(c, not noclipActive, not noclipActive)
    FreezeEntityPosition(c, noclipActive)
    SetEntityInvincible(c, noclipActive)
    SetVehicleRadioEnabled(c, not noclipActive)
    if noclipActive then
        SetEntityVisible(tXTRA.getPlayerPed(), false, false)
        tXTRA.setRedzoneTimerDisabled(true)
        -- Disable shooting when noclip is active
        Citizen.CreateThread(function()
            while noclipActive do
                Citizen.Wait(0)
                DisableControlAction(0, 24, true) -- Disable attack
                DisableControlAction(0, 47, true) -- Disable weapon
                DisableControlAction(0, 58, true) -- Disable weapon 2
                DisableControlAction(0, 263, true) -- Disable melee
                DisableControlAction(0, 264, true) -- Disable melee 2
                DisableControlAction(0, 257, true) -- Disable shoot in car
            end
        end)
    else
        SetEntityVisible(tXTRA.getPlayerPed(), true, false)
        tXTRA.setRedzoneTimerDisabled(false)
    end
end

RegisterKeyMapping("noclip", "Staff Noclip", "keyboard", "F4")
RegisterCommand(
    "noclip",
    function()
        if tXTRA.getStaffLevel() >= 4 then
            TriggerServerEvent("XTRA:noClip")
        end
    end
)
Citizen.CreateThread(
    function()
        local m = k("instructional_buttons")
        local n = f.speeds[b].speed
        while true do
            if noclipActive then
                DrawScaleformMovieFullscreen(m)
                local o = 0.0
                local p = 0.0
                local q, r, s = table.unpack(tXTRA.getPosition())
                local t, u, v = tXTRA.getCamDirection()
                if IsDisabledControlJustPressed(1, f.controls.reduceSpeed) then
                    if b ~= 1 then
                        b = b - 1
                        n = f.speeds[b].speed
                    end
                    k("instructional_buttons")
                end
                if IsDisabledControlJustPressed(1, f.controls.increaseSpeed) then
                    if b ~= 8 then
                        b = b + 1
                        n = f.speeds[b].speed
                    end
                    k("instructional_buttons")
                end
                if IsControlPressed(0, f.controls.goForward) then
                    q = q + n * t
                    r = r + n * u
                    s = s + n * v
                end
                if IsControlPressed(0, f.controls.goBackward) then
                    q = q - n * t
                    r = r - n * u
                    s = s - n * v
                end
                if IsControlPressed(0, f.controls.goUp) then
                    p = f.offsets.z
                end
                if IsControlPressed(0, f.controls.goDown) then
                    p = -f.offsets.z
                end
                local w = GetEntityHeading(c)
                SetEntityVelocity(c, 0.0, 0.0, 0.0)
                SetEntityRotation(c, t, u, v, 0, false)
                SetEntityHeading(c, w)
                SetEntityCoordsNoOffset(c, q, r, s, noclipActive, noclipActive, noclipActive)
            end
            Wait(0)
        end
    end
)
RegisterCommand(
    "staffmode",
    function()
        if tXTRA.getStaffLevel() > 0 then
            tXTRA.staffMode(not staffMode)
        end
    end
)
RegisterCommand("secretmode",function()
    local source = source
    local user_id = tXTRA.getUserId(source)
        if user_id == 1  then
            tXTRA.secretMode(not secretMode)
        end
    end
)
secretMode = false
local xA = false
local aA = {}
function tXTRA.secretMode(yA)
    if tXTRA.getStaffLevel() > 0 then
        if secretMode ~= yA then
            secretMode = yA
            if secretMode then
                tXTRA.notify("~y~Secret Powerz Activated.")
                if GetEntityHealth(PlayerPedId()) <= 102 then
                    tXTRA.RevivePlayer()
                end
                tXTRA.setRedzoneTimerDisabled(true)
            else
                tXTRA.setRedzoneTimerDisabled(false)
                SetEntityInvincible(PlayerPedId(), false)
                SetPlayerInvincible(PlayerId(), false)
                SetPedCanRagdoll(PlayerPedId(), true)
                ClearPedBloodDamage(PlayerPedId())
                ResetPedVisibleDamage(PlayerPedId())
                ClearPedLastWeaponDamage(PlayerPedId())
                SetEntityProofs(PlayerPedId(), false, false, false, false, false, false, false, false)
                SetEntityCanBeDamaged(PlayerPedId(), true)
                tXTRA.setHealth(200)
                tXTRA.notify("~y~Secret Powerz Deactivated.")
            end
        end
    end
end
staffMode = false
local x = false
local a = {}
function tXTRA.staffMode(y)
    TriggerServerEvent("XTRA:VerifyStaff", tXTRA.getStaffLevel())
    if tXTRA.getStaffLevel() > 0 then
        if staffMode ~= y then
            staffMode = y
            if staffMode then
                tXTRA.notify("~g~Staff Powerz Activated.")
                if GetEntityHealth(PlayerPedId()) <= 102 then
                    tXTRA.RevivePlayer()
                end
                tXTRA.setRedzoneTimerDisabled(true)
                a = tXTRA.getCustomization()
                if tXTRA.getModelGender() == "male" then
                    tXTRA.loadCustomisationPreset("StaffMale")
                    if tXTRA.isHalloween() then
                        tXTRA.loadCustomisationPreset("StaffHalloweenMale")
                    end
                    if tXTRA.isChristmas() then
                        tXTRA.loadCustomisationPreset("StaffChristmasMale")
                    end
                else
                    tXTRA.loadCustomisationPreset("StaffFemale")
                    if tXTRA.isHalloween() then
                        tXTRA.loadCustomisationPreset("StaffHalloweenFemale")
                    end
                    if tXTRA.isChristmas() then
                        tXTRA.loadCustomisationPreset("StaffChristmasFemale")
                    end
                end
                local z = GetPedDrawableVariation(PlayerPedId(), 11)
                SetPedComponentVariation(PlayerPedId(), 11, z, tXTRA.getStaffLevel(), 0)
                if tXTRA.isPurge() then
                    RemoveAllPedWeapons(PlayerPedId(), true)
                end
            else
                tXTRA.setRedzoneTimerDisabled(false)
                SetEntityInvincible(PlayerPedId(), false)
                SetPlayerInvincible(PlayerId(), false)
                SetPedCanRagdoll(PlayerPedId(), true)
                ClearPedBloodDamage(PlayerPedId())
                ResetPedVisibleDamage(PlayerPedId())
                ClearPedLastWeaponDamage(PlayerPedId())
                SetEntityProofs(PlayerPedId(), false, false, false, false, false, false, false, false)
                SetEntityCanBeDamaged(PlayerPedId(), true)
                if not tXTRA.isPurge() then
                    tXTRA.setHealth(200)
                end
                tXTRA.setCustomization(a)
                tXTRA.notify("~g~Staff Powerz Deactivated.")
            end
        end
    end
end
function loadModel(q)
    local r
    if type(q) ~= "string" then
        r = q
    else
        r = GetHashKey(q)
    end
    if IsModelInCdimage(r) then
        if not HasModelLoaded(r) then
            RequestModel(r)
            while not HasModelLoaded(r) do
                Wait(0)
            end
        end
        return r
    else
        return nil
    end
end
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            if staffMode then
                local z = PlayerPedId()
                SetEntityInvincible(z, true)
                SetPlayerInvincible(PlayerId(), true)
                SetPedCanRagdoll(z, false)
                ClearPedBloodDamage(z)
                ResetPedVisibleDamage(z)
                ClearPedLastWeaponDamage(z)
                SetEntityProofs(z, true, true, true, true, true, true, true, true)
                SetEntityCanBeDamaged(z, false)
                if not tXTRA.isPurge() then
                    SetEntityHealth(z, 200)
                end
                if not x then
                    drawNativeText("~r~Reminder: You are /staffon'd.", 255, 0, 0, 255, true)
                end
            end
        end
    end
)
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            if secretMode then
                local zA = PlayerPedId()
                SetEntityInvincible(zA, true)
                SetPlayerInvincible(PlayerId(), true)
                SetPedCanRagdoll(zA, false)
                ClearPedBloodDamage(zA)
                ResetPedVisibleDamage(zA)
                ClearPedLastWeaponDamage(zA)
                SetEntityProofs(zA, true, true, true, true, true, true, true, true)
                SetEntityCanBeDamaged(zA, false)
                SetEntityHealth(zA, 200)
                if not xA then
                    drawNativeText("~r~Reminder: Dont get caught, you are secretly staff'd on.", 255, 0, 0, 255, true)
                end
            end
        end
    end
)
RegisterNetEvent("XTRA:sendTicketInfo")
AddEventHandler("XTRA:sendTicketInfo", function(A, B, C)
    if A ~= nil and B ~= nil then
        x = true
    else
        x = false
    end
    while x do
        Wait(0)
        if A ~= nil and B ~= nil then
            drawNativeText("~y~You've taken the ticket of " .. B .. "(" .. A .. ")\n~o~Reason: " .. C,255,0,0,255,true)
        end
    end
end)
RegisterCommand(
    "fix",
    function()
        if tXTRA.isStaffedOn() or tXTRA.getStaffLevel() >= 6 then
            TriggerServerEvent("wk:fixVehicle")
        end
    end
)
RegisterNetEvent("wk:fixVehicle")
AddEventHandler(
    "wk:fixVehicle",
    function()
        local p = PlayerPedId()
        if IsPedInAnyVehicle(p) then
            local D = GetVehiclePedIsIn(p)
            SetVehicleEngineHealth(D, 9999)
            SetVehiclePetrolTankHealth(D, 9999)
            SetVehicleFixed(D)
            tXTRA.notify("~g~Fixed Vehicle")
        end
    end
)
function tXTRA.staffBlips(E)
    if tXTRA.getStaffLevel() >= 6 then
        d = E
        if d then
            tXTRA.notify("~g~Blips enabled")
        else
            tXTRA.notify("~r~Blips disabled")
            for F, G in ipairs(GetActivePlayers()) do
                local H = GetPlayerPed(G)
                if GetPlayerPed(G) ~= tXTRA.getPlayerPed() then
                    H = GetPlayerPed(G)
                    blip = GetBlipFromEntity(H)
                    RemoveBlip(blip)
                end
            end
        end
    end
end
Citizen.CreateThread(
    function()
        while true do
            if d then
                for F, G in ipairs(GetActivePlayers()) do
                    local I = GetPlayerPed(G)
                    if I ~= PlayerPedId() then
                        local blip = GetBlipFromEntity(I)
                        local J = GetPlayerServerId(G)
                        local K = tXTRA.clientGetUserIdFromSource(J)
                        if not DoesBlipExist(blip) and not tXTRA.isUserHidden(K) then
                            blip = AddBlipForEntity(I)
                            SetBlipSprite(blip, 1)
                            ShowHeadingIndicatorOnBlip(blip, true)
                            local L = GetVehiclePedIsIn(I, false)
                            SetBlipSprite(blip, 1)
                            ShowHeadingIndicatorOnBlip(blip, true)
                            SetBlipRotation(blip, math.ceil(GetEntityHeading(L)))
                            SetBlipNameToPlayerName(blip, G)
                            SetBlipScale(blip, 0.85)
                            SetBlipAlpha(blip, 255)
                        end
                    end
                end
            end
            Wait(1000)
        end
    end
)
function tXTRA.hasStaffBlips()
    return d
end
globalIgnoreDeathSound = false
RegisterNetEvent(
    "XTRA:deathSound",
    function(M)
        local N = GetEntityCoords(tXTRA.getPlayerPed())
        local O = #(N - M)
        if not globalIgnoreDeathSound and O <= 15 then
            SendNUIMessage({transactionType = tXTRA.getDeathSound()})
        end
    end
)
