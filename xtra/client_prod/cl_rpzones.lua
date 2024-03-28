local a = {5, 10, 20, 30, 40, 50, 75, 100, 150, 200, 250}
local b = {10, 20, 30, 40, 50, 75, 100, 150, 200}
local c = {
    weapons = {
        melee = false,
        throwable = false,
        pistol = false,
        shotgun = false,
        xtra = false,
        smg = false,
        rifle = false,
        sniper = false,
        heavy = false
    },
    vehicles = {
        speed = a[#a],
        disableTrolling = true,
        delete = false,
        car = false,
        helicopter = false,
        plane = false,
        boat = false,
        bicycle = false
    },
    disableDamage = false,
    blipGloballyVisible = true,
    radius = b[1]
}
local d = {}
local e = false
local function f()
    local g = table.copy(c)
    g.position = tXTRA.getPlayerCoords()
    g.radius = g.radius + 0.0
    g.vehicles.speed = g.vehicles.speed + 0.0
    TriggerServerEvent("XTRA:createRPZone", g)
end
function table.find(table, h)
    for i, j in pairs(table) do
        if j == h then
            return i
        end
    end
    return false
end
local function k()
    local l = nil
    local m = 100.0
    local i = tXTRA.getPlayerCoords()
    for n, g in pairs(d) do
        local o = #(g.position - i)
        if o < m then
            l = g.uuid
            m = o
        end
    end
    if l then
        TriggerServerEvent("XTRA:removeRPZone", l)
    end
end
local p = false
RMenu.Add(
    "rpzones",
    "mainmenu",
    RageUI.CreateMenu(
        "",
        "Main Menu",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "xtra_adminui",
        "xtra_adminui"
    )
)
RMenu.Add(
    "rpzones",
    "weapons",
    RageUI.CreateSubMenu(
        RMenu:Get("rpzones", "mainmenu"),
        "",
        "Weapons",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "xtra_adminui",
        "xtra_adminui"
    )
)
RMenu.Add(
    "rpzones",
    "vehicles",
    RageUI.CreateSubMenu(
        RMenu:Get("rpzones", "mainmenu"),
        "",
        "Vehicles",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "xtra_adminui",
        "xtra_adminui"
    )
)
RageUI.CreateWhile(
    1.0,
    true,
    function()
        if RageUI.Visible(RMenu:Get("rpzones", "mainmenu")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    RageUI.ButtonWithStyle(
                        "Weapons",
                        "",
                        {RightLabel = "→→→"},
                        true,
                        function()
                        end,
                        RMenu:Get("rpzones", "weapons")
                    )
                    RageUI.ButtonWithStyle(
                        "Vehicles",
                        "",
                        {RightLabel = "→→→"},
                        true,
                        function()
                        end,
                        RMenu:Get("rpzones", "vehicles")
                    )
                    RageUI.Checkbox(
                        "Disable Damage",
                        nil,
                        c.disableDamage,
                        {},
                        function(n, n, n, q)
                            c.disableDamage = q
                        end
                    )
                    RageUI.Checkbox(
                        "Display Zone Globally",
                        nil,
                        c.blipGloballyVisible,
                        {},
                        function(n, n, n, q)
                            c.blipGloballyVisible = q
                        end
                    )
                    RageUI.List(
                        "Radius (m)",
                        b,
                        table.find(b, c.radius),
                        nil,
                        {},
                        true,
                        function(n, n, r, s)
                            c.radius = b[s]
                        end,
                        function()
                        end
                    )
                    RageUI.ButtonWithStyle(
                        "~g~Create Zone",
                        "",
                        {RightLabel = "→→→"},
                        true,
                        function(n, n, r)
                            if r then
                                f()
                            end
                        end
                    )
                    RageUI.ButtonWithStyle(
                        "~r~Delete Closest Zone",
                        "",
                        {RightLabel = "→→→"},
                        true,
                        function(n, n, r)
                            if r then
                                k()
                            end
                        end
                    )
                end
            )
        end
        if RageUI.Visible(RMenu:Get("rpzones", "weapons")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    RageUI.Checkbox(
                        "Enable Melee",
                        nil,
                        c.weapons.melee,
                        {},
                        function(n, n, n, q)
                            c.weapons.melee = q
                        end
                    )
                    RageUI.Checkbox(
                        "Enable Throwable",
                        nil,
                        c.weapons.throwable,
                        {},
                        function(n, n, n, q)
                            c.weapons.throwable = q
                        end
                    )
                    RageUI.Checkbox(
                        "Enable Pistol",
                        nil,
                        c.weapons.pistol,
                        {},
                        function(n, n, n, q)
                            c.weapons.pistol = q
                        end
                    )
                    RageUI.Checkbox(
                        "Enable Shotgun",
                        nil,
                        c.weapons.shotgun,
                        {},
                        function(n, n, n, q)
                            c.weapons.shotgun = q
                        end
                    )
                    RageUI.Checkbox(
                        "Enable LXTRA",
                        nil,
                        c.weapons.xtra,
                        {},
                        function(n, n, n, q)
                            c.weapons.xtra = q
                        end
                    )
                    RageUI.Checkbox(
                        "Enable SMG",
                        nil,
                        c.weapons.smg,
                        {},
                        function(n, n, n, q)
                            c.weapons.smg = q
                        end
                    )
                    RageUI.Checkbox(
                        "Enable Rifle",
                        nil,
                        c.weapons.rifle,
                        {},
                        function(n, n, n, q)
                            c.weapons.rifle = q
                        end
                    )
                    RageUI.Checkbox(
                        "Enable Sniper",
                        nil,
                        c.weapons.sniper,
                        {},
                        function(n, n, n, q)
                            c.weapons.sniper = q
                        end
                    )
                    RageUI.Checkbox(
                        "Enable Heavy",
                        nil,
                        c.weapons.heavy,
                        {},
                        function(n, n, n, q)
                            c.weapons.heavy = q
                        end
                    )
                end
            )
        end
        if RageUI.Visible(RMenu:Get("rpzones", "vehicles")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    RageUI.List(
                        "Speed (mph)",
                        a,
                        table.find(a, c.vehicles.speed),
                        nil,
                        {},
                        true,
                        function(n, n, r, s)
                            c.vehicles.speed = a[s]
                        end,
                        function()
                        end
                    )
                    RageUI.Checkbox(
                        "Disable Trolling",
                        nil,
                        c.vehicles.disableTrolling,
                        {},
                        function(n, n, n, q)
                            c.vehicles.disableTrolling = q
                        end
                    )
                    RageUI.Checkbox(
                        "Use Deletion",
                        nil,
                        c.vehicles.delete,
                        {},
                        function(n, n, n, q)
                            c.vehicles.delete = q
                        end
                    )
                    local t = c.vehicles.delete and "Delete" or "Disable"
                    RageUI.Checkbox(
                        string.format("%s Car", t),
                        nil,
                        c.vehicles.car,
                        {},
                        function(n, n, n, q)
                            c.vehicles.car = q
                        end
                    )
                    RageUI.Checkbox(
                        string.format("%s Helicopter", t),
                        nil,
                        c.vehicles.helicopter,
                        {},
                        function(n, n, n, q)
                            c.vehicles.helicopter = q
                        end
                    )
                    RageUI.Checkbox(
                        string.format("%s Plane", t),
                        nil,
                        c.vehicles.plane,
                        {},
                        function(n, n, n, q)
                            c.vehicles.plane = q
                        end
                    )
                    RageUI.Checkbox(
                        string.format("%s Boat", t),
                        nil,
                        c.vehicles.boat,
                        {},
                        function(n, n, n, q)
                            c.vehicles.boat = q
                        end
                    )
                    RageUI.Checkbox(
                        string.format("%s Bicycle", t),
                        nil,
                        c.vehicles.bicycle,
                        {},
                        function(n, n, n, q)
                            c.vehicles.bicycle = q
                        end
                    )
                end
            )
        end
    end
)
RegisterNetEvent(
    "XTRA:createRPZone",
    function(g)
        g.blip = AddBlipForRadius(g.position.x, g.position.y, g.position.z, g.radius)
        SetBlipColour(g.blip, 27)
        SetBlipAlpha(g.blip, 180)
        SetBlipDisplay(g.blip, g.blipGloballyVisible and 8 or 5)
        if g.vehicles.speed then
            g.speedHandle =
                AddRoadNodeSpeedZone(
                g.position.x,
                g.position.y,
                g.position.z,
                g.radius,
                g.vehicles.speed * 0.44704,
                false
            )
        end
        table.add(d, g)
    end
)
RegisterNetEvent(
    "XTRA:removeRPZone",
    function(u)
        for v, g in pairs(d) do
            if g.uuid == u then
                RemoveBlip(g.blip)
                if g.vehicles.speed then
                    RemoveRoadNodeSpeedZone(g.speedHandle)
                end
                table.remove(d, v)
                break
            end
        end
    end
)
local function w(g, x)
    local j = tXTRA.getPlayerPed()
    local y = GetWeapontypeGroup(x)
    if not g.weapons.melee and y == GetHashKey("GROUP_MELEE") then
        tXTRA.setWeapon(j, "WEAPON_UNARMED")
    elseif not g.weapons.throwable and y == GetHashKey("GROUP_THROWN") then
        tXTRA.setWeapon(j, "WEAPON_UNARMED")
    elseif not g.weapons.pistol and y == GetHashKey("GROUP_PISTOL") then
        tXTRA.setWeapon(j, "WEAPON_UNARMED")
    elseif not g.weapons.shotgun and y == GetHashKey("GROUP_SHOTGUN") then
        tXTRA.setWeapon(j, "WEAPON_UNARMED")
    elseif not g.weapons.xtra and y == GetHashKey("GROUP_XTRA") then
        tXTRA.setWeapon(j, "WEAPON_UNARMED")
    elseif not g.weapons.smg and y == GetHashKey("GROUP_SMG") then
        tXTRA.setWeapon(j, "WEAPON_UNARMED")
    elseif not g.weapons.rifle and y == GetHashKey("GROUP_RIFLE") then
        tXTRA.setWeapon(j, "WEAPON_UNARMED")
    elseif not g.weapons.sniper and y == GetHashKey("GROUP_SNIPER") then
        tXTRA.setWeapon(j, "WEAPON_UNARMED")
    elseif not g.weapons.heavy and y == GetHashKey("GROUP_HEAVY") then
        tXTRA.setWeapon(j, "WEAPON_UNARMED")
    end
end
local function z(A)
    DeleteEntity(A)
end
local function B(A)
    DisableControlAction(0, 32, true)
    DisableControlAction(0, 33, true)
    DisableControlAction(0, 34, true)
    DisableControlAction(0, 35, true)
    DisableControlAction(0, 71, true)
    DisableControlAction(0, 72, true)
    SetVehicleEngineOn(A, false, true, false)
end
local function C(g, A)
    if g.vehicles.disableTrolling then
        DisableControlAction(0, 86, true)
        DisableControlAction(0, 101, true)
        DisableControlAction(0, 102, true)
        DisableControlAction(0, 103, true)
        DisableControlAction(0, 350, true)
        DisableControlAction(0, 351, true)
        DisableControlAction(0, 352, true)
        DisableControlAction(0, 353, true)
        if IsVehicleParachuteActive(A) then
            SetVehicleForwardSpeed(A, 0.0)
        end
        SetCargobobHookCanAttach(A, false)
        SetVehicleRocketBoostPercentage(A, 0.0)
    end
    local D = g.vehicles.delete and z or B
    local E = GetEntityModel(A)
    if g.vehicles.helicopter and IsThisModelAHeli(E) then
        D(A)
    elseif g.vehicles.plane and IsThisModelAPlane(E) then
        D(A)
    elseif g.vehicles.boat and IsThisModelABoat(E) then
        D(A)
    elseif g.vehicles.bicycle and IsThisModelABicycle(E) then
        D(A)
    elseif g.vehicles.car and (IsThisModelACar(E) or IsThisModelABike(E)) then
        D(A)
    end
end
local function F(G)
    local j = PlayerPedId()
    local H = PlayerId()
    SetEntityInvincible(j, G)
    SetPlayerInvincible(H, G)
    SetEntityProofs(j, G, G, G, G, G, G, G, G)
    SetEntityCanBeDamaged(j, not G)
    SetPedCanRagdoll(j, not G)
    SetPedCanRagdollFromPlayerImpact(j, not G)
    ClearPedBloodDamage(j)
    ResetPedVisibleDamage(j)
    ClearPedLastWeaponDamage(j)
    p = G
end
local function I(g)
    local n, x = GetCurrentPedWeapon(tXTRA.getPlayerPed())
    if x ~= 0 then
        w(g, x)
    end
    local A, J = tXTRA.getPlayerVehicle()
    if A ~= 0 and J then
        C(g, A)
    end
    if g.disableDamage then
        F(true)
    end
end
local function K()
    local L = false
    local M = tXTRA.getPlayerCoords()
    for n, g in ipairs(d) do
        if #(M - g.position) < g.radius then
            L = true
            I(g)
            if not e then
                TriggerEvent(
                    "XTRA:showNotification",
                    {
                        text = "You have entered an RP zone",
                        height = "200px",
                        width = "auto",
                        colour = "#FFF",
                        background = "#32CD32",
                        pos = "bottom-right",
                        icon = "success"
                    },
                    5000
                )
            end
            e = true
        end
    end
    if e and not L then
        TriggerEvent(
            "XTRA:showNotification",
            {
                text = "You have left the RP zone",
                height = "60px",
                width = "auto",
                colour = "#FFF",
                background = "#ff0000",
                pos = "bottom-right",
                icon = "bad"
            },
            5000
        )
        F(false)
        e = false
    end
end
tXTRA.createThreadOnTick(K)
function tXTRA.GetRPZoneInfo()
    local M = tXTRA.getPlayerCoords()
    for n, g in ipairs(d) do
        if #(M - g.position) < g.radius then
            return g
        end
    end
    return nil
end
function tXTRA.getInRPZone()
    return p
end
