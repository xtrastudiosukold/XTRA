globalInRedzone = false
local a = false
local b = 0
local c = false
local d = {
    ["Rebel"] = {type = "radius", pos = vector3(1468.5318603516, 6328.529296875, 18.894895553589), radius = 100.0},
    ["Heroin"] = {type = "radius", pos = vector3(3545.048828125, 3724.0776367188, 36.64262008667), radius = 170.0},
    ["LargeArms"] = {type = "radius", pos = vector3(-1118.4926757813, 4926.1889648438, 218.35691833496), radius = 170.0},
    ["LargeArmsCayo"] = {type = "radius", pos = vector3(5115.7465820312, -4623.2915039062, 2.642692565918), radius = 85.0},
    ["RebelCayo"] = {type = "radius", pos = vector3(4982.5634765625, -5175.1079101562, 2.4887988567352), radius = 120.0},
    ["LSDNorth"] = {type = "radius", pos = vector3(1317.0300292969, 4309.8359375, 38.005485534668), radius = 90.0},
    ["LSDSouth"] = {type = "radius", pos = vector3(2539.0964355469, -376.51586914063, 92.986785888672), radius = 120.0}
}
function tXTRA.setRedzoneTimerDisabled(e)
    a = e
end
function tXTRA.isPlayerInRedZone()
    return globalInRedzone
end
local f = 0
function tXTRA.setPlayerCombatTimer(g, h)
    if tXTRA.isPurge() then
        return
    end
    b = g
    if h then
        c = true
    end
    if GetGameTimer() - f > 2500 or tXTRA.isStaffedOn() then
        TriggerServerEvent("XTRA:setCombatTimer", g)
        f = GetGameTimer()
    end
end
function tXTRA.getPlayerCombatTimer()
    return b, c
end
local function i(j, k, l)
    if k.type == "radius" then
        if l then
            return #(j.xy - k.pos.xy) <= k.radius
        else
            return #(j - k.pos) <= k.radius
        end
    elseif k.type == "area" then
        local m = k.width / 2.0
        local n = k.height / 2.0
        if #(j - k.pos) <= m + n then
            local o = vector3(m, n, 0.0)
            local p = k.pos + o
            local q = k.pos - o
            return j.x < p.x and j.y < p.y and j.x > q.x and j.y > q.y
        end
    end
    return false
end
Citizen.CreateThread(
    function()
        while true do
            if not a then
                local r = GetEntityCoords(tXTRA.getPlayerPed())
                globalInRedzone = false
                for s, k in pairs(d) do
                    if i(r, k, false) then
                        globalInRedzone = true
                        local r = GetEntityCoords(tXTRA.getPlayerPed())
                        if not noclipActive or tXTRA.getStaffLevel() == 0 then
                            tXTRA.setPlayerCombatTimer(30, false)
                        end
                        local t
                        local u = false
                        while not u do
                            r = GetEntityCoords(tXTRA.getPlayerPed())
                            while i(r, k, true) do
                                r = GetEntityCoords(tXTRA.getPlayerPed())
                                t = r
                                if
                                    IsPedShooting(tXTRA.getPlayerPed()) and
                                        GetSelectedPedWeapon(tXTRA.getPlayerPed()) ~= GetHashKey("WEAPON_UNARMED")
                                 then
                                    tXTRA.setPlayerCombatTimer(60, true)
                                end
                                if b == 0 then
                                    DrawAdvancedText(
                                        0.931,
                                        0.914,
                                        0.005,
                                        0.0028,
                                        0.49,
                                        "Combat Timer ended, you may leave.",
                                        255,
                                        51,
                                        51,
                                        255,
                                        7,
                                        0
                                    )
                                end
                                Wait(0)
                            end
                            if b == 0 then
                                u = true
                            else
                                local v = k.pos - GetEntityCoords(tXTRA.getPlayerPed())
                                t = t + v * 0.01
                                if GetVehiclePedIsIn(tXTRA.getPlayerPed(), false) == 0 then
                                    TaskGoStraightToCoord(
                                        tXTRA.getPlayerPed(),
                                        t.x,
                                        t.y,
                                        t.z,
                                        8.0,
                                        1000,
                                        GetEntityHeading(tXTRA.getPlayerPed()),
                                        0.0
                                    )
                                    local w = GetSoundId()
                                    PlaySoundFrontend(w, "End_Zone_Flash", "DLC_BTL_RB_Remix_Sounds", true)
                                    ReleaseSoundId(w)
                                    tXTRA.announceMpBigMsg("~r~WARNING", "Get back in the redzone!", 2000)
                                else
                                    SetEntityCoords(tXTRA.getPlayerPed(), t.x, t.y, t.z)
                                end
                                SetTimeout(
                                    1000,
                                    function()
                                        ClearPedTasks(tXTRA.getPlayerPed())
                                    end
                                )
                            end
                            Wait(0)
                        end
                    end
                end
            end
            Wait(500)
        end
    end
)
Citizen.CreateThread(
    function()
        while true do
            if b > 0 then
                if a then
                    tXTRA.setPlayerCombatTimer(0, false)
                else
                    b = b - 1
                    if b == 0 then
                        c = false
                    end
                end
            end
            Wait(1000)
        end
    end
)
local x = {["WEAPON_UNARMED"] = true, ["WEAPON_PETROLCAN"] = true, ["WEAPON_SNOWBALL"] = true}
function tXTRA.isEmergencyService()
    return globalOnPoliceDuty or globalOnPrisonDuty or globalNHSOnDuty or globalLFBOnDuty
end
AddEventHandler(
    "XTRA:startCombatTimer",
    function(h)
        if not tXTRA.isEmergencyService() then
            tXTRA.setPlayerCombatTimer(60, h)
        end
    end
)
local function y()
    if not tXTRA.isEmergencyService() and not tXTRA.isInComa() then
        local z = PlayerPedId()
        if HasEntityBeenDamagedByWeapon(z, 0, 2) then
            Citizen.CreateThread(
                function()
                    ClearEntityLastDamageEntity(z)
                    ClearEntityLastWeaponDamage(z)
                end
            )
            tXTRA.setPlayerCombatTimer(60, true)
        end
        local A = GetSelectedPedWeapon(z)
        if IsPedShooting(z) and not x[A] then
            tXTRA.setPlayerCombatTimer(60, true)
        elseif GetPlayerTargetEntity(tXTRA.getPlayerId()) and IsControlPressed(0, 24) then
            tXTRA.setPlayerCombatTimer(60, true)
        end
    end
    if b > 0 then
        DrawAdvancedText(
            0.985,
            0.965,
            0.005,
            0.0028,
            0.467,
            "COMBAT TIMER: " .. b .. " seconds",
            246,
            74,
            70,
            255,
            7,
            0
        )
    end
end
tXTRA.createThreadOnTick(y)
local function B()
    local z = PlayerPedId()
    SetCanPedEquipWeapon(z, "WEAPON_MOLOTOV", false)
    if GetSelectedPedWeapon(z) == GetHashKey("WEAPON_MOLOTOV") then
        tXTRA.setWeapon(z, "WEAPON_UNARMED", true)
    end
end
local function C()
    SetCanPedEquipWeapon(PlayerPedId(), "WEAPON_MOLOTOV", true)
end
tXTRA.createArea(
    "rig_disable_molotovs",
    vector3(-1703.7, 8886.5, 28.7),
    125.0,
    250.0,
    B,
    C,
    function()
    end
)
