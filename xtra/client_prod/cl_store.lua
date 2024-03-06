local a = module("cfg/cfg_store")
local b = {}
local c = {}
local d = nil
local e = nil
local f = nil
local g = nil
local h = nil
local i = nil
local j = false
local function k()
    return {
        speedBuffer = {},
        speed = 0.0,
        speedDisplay = 0.0,
        accel = 0.0,
        accelDisplay = 0.0,
        decel = 0.0,
        decelDisplay = 0.0
    }
end
local l = false
local m = 0
local n = 0
local o = 0
local p = k()
local q = {"Speed", "Drift", "Handling", "City", "Airport"}
local r = {
    vector3(2370.8, 2856.58, 40.46),
    vector3(974.58, -3006.6, 5.9),
    vector3(1894.57, 3823.71, 31.98),
    vector3(-482.63, -664.24, 32.74),
    vector3(-1728.25, -2894.99, 13.94)
}
local s = {"Heathrow", "Sandy"}
local t = {vector3(-1617.911, -2980.999, 13.944), vector3(1584.309, 3218.135, 40.406)}
local u = {"Docks", "Sandy Lake"}
local v = {vector3(-330.306, -3366.949, 0.953), vector3(318.469, 3811.260, 29.219)}
local w = 1
local x = nil
local y = nil
local z = nil
RMenu.Add(
    "store",
    "mainmenu",
    RageUI.CreateMenu("", "Inventory", tXTRA.getRageUIMenuWidth(), tXTRA.getRageUIMenuHeight(), "xtra_storeui", "xtra_storeui")
)
RMenu.Add(
    "store",
    "info",
    RageUI.CreateSubMenu(
        RMenu:Get("store", "mainmenu"),
        "",
        "Information",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight()
    )
)
RMenu.Add(
    "store",
    "redeem",
    RageUI.CreateSubMenu(RMenu:Get("store", "info"), "", "Redeem", tXTRA.getRageUIMenuWidth(), tXTRA.getRageUIMenuHeight())
)
RMenu.Add(
    "store",
    "vehicleList",
    RageUI.CreateSubMenu(
        RMenu:Get("store", "redeem"),
        "",
        "Vehicles",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight()
    )
)
RMenu.Add(
    "store",
    "vehicleListInner",
    RageUI.CreateSubMenu(
        RMenu:Get("store", "vehicleList"),
        "",
        "Vehicles",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight()
    )
)
RMenu.Add(
    "store",
    "vehicleSelection",
    RageUI.CreateSubMenu(
        RMenu:Get("store", "vehicleList"),
        "",
        "Vehicle Options",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight()
    )
)
local function A(B, C)
    notify("~r~" .. B.name .. " " .. C)
end
local function D(B, E)
    local F = E or e[B.field]
    if not F then
        A(B, "must not be empty.")
        return false
    elseif B.minLength and #F < B.minLength then
        A(B, "must be " .. tostring(B.minLength) .. " characters or greater.")
        return false
    elseif B.maxLength and #F > B.maxLength then
        A(B, "must be " .. tostring(B.maxLength) .. " characters or less.")
        return false
    end
    return true
end
local function G(B)
    local H = e[B.field]
    if H then
        if B.items[H] then
            return B.items[H]
        else
            for I, F in pairs(B.items) do
                if type(F) == "table" then
                    if F[H] then
                        return F[H]
                    end
                end
            end
        end
    end
    return ""
end
local function J(K)
    if globalOwnedPlayerVehicles[K] then
        return false
    else
        for L, M in pairs(e) do
            if string.match(L, "vipCar") or string.match(L, "customCar") then
                if M == K then
                    return false
                end
            end
        end
        return true
    end
end
local function N(B)
    for O, P in pairs(B.items) do
        if type(P) == "table" then
            for Q in pairs(P) do
                if J(Q) then
                    return false
                end
            end
        elseif J(O) then
            return false
        end
    end
    return true
end
local function R(B)
    if not B.allowEmpty and G(B) == "" then
        local S = B.allowEmptyIfError and N(B)
        if not S then
            A(B, "can not be empty.")
        end
        return S
    end
    return true
end
local function T(U)
    local V = true
    if U.args then
        for I, B in pairs(a.argsTemplate[U.args]) do
            if B.type == "string" and not D(B) then
                V = false
            elseif B.type == "vehicleList" and not R(B) then
                V = false
            end
        end
    end
    return V
end
local function W(B)
    RageUI.ButtonWithStyle(
        B.name,
        B.description,
        {RightLabel = e[B.field]},
        true,
        function(X, Y, Z)
            if Z then
                tXTRA.clientPrompt(
                    B.name,
                    "",
                    function(_)
                        if D(B, _) then
                            e[B.field] = _
                        end
                    end
                )
            end
        end,
        nil
    )
end
local function a0(B)
    local a1 = G(B)
    if a1 == "" and B.emptyText then
        a1 = B.emptyText
    end
    RageUI.ButtonWithStyle(
        B.name,
        B.description,
        {RightLabel = a1},
        true,
        function(X, Y, Z)
            if Z then
                f = B
            end
        end,
        RMenu:Get("store", "vehicleList")
    )
end
local function a2(K)
    l = true
    TriggerServerEvent("XTRA:setInVehicleTestingBucket", true)
    z = tXTRA.getPlayerCoords()
    w = 1
    local a3 = GetHashKey(K)
    if IsThisModelABoat(a3) then
        x = u
        y = v
    elseif IsThisModelAPlane(a3) or IsThisModelAHeli(a3) then
        x = s
        y = t
    else
        x = q
        y = r
    end
    local a4 = y[w]
    local a5 = GetEntityHeading(PlayerPedId())
    m = tXTRA.spawnVehicle(K, a4.x, a4.y, a4.z, a5, true, false, false)
    n = GetGameTimer()
end
local function a6(a7)
    local a8 = {}
    for a9, aa in pairs(a7) do
        table.insert(a8, {a.items[aa].name, a9})
    end
    table.sort(
        a8,
        function(ab, ac)
            return ab[1] < ac[1]
        end
    )
    local ad = 0
    return function()
        ad = ad + 1
        if a8[ad] then
            return a8[ad][1], a8[ad][2]
        else
            return nil, nil
        end
    end
end
local function ae(a7, af)
    local a8 = {}
    for ag, F in pairs(a7) do
        table.insert(a8, {ag, F})
    end
    table.sort(
        a8,
        function(ab, ac)
            if af then
                return ab[2] < ac[2]
            else
                return ab[1] < ac[1]
            end
        end
    )
    local ad = 0
    return function()
        ad = ad + 1
        if a8[ad] then
            return a8[ad][1], a8[ad][2]
        else
            return nil, nil
        end
    end
end
RageUI.CreateWhile(
    1.0,
    true,
    function()
        if RageUI.Visible(RMenu:Get("store", "mainmenu")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    if i then
                        RageUI.Separator("~g~Your rank is " .. i)
                    end
                    if next(b) then
                        for L, a9 in a6(b) do
                            RageUI.ButtonWithStyle(
                                L,
                                "",
                                {RightLabel = "→→→"},
                                true,
                                function(X, Y, Z)
                                    if Z then
                                        if a9 ~= d then
                                            e = {}
                                        end
                                        d = a9
                                        j = false
                                    end
                                end,
                                RMenu:Get("store", "info")
                            )
                        end
                    else
                        RageUI.ButtonWithStyle(
                            "Purchase Items",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function(m, q, r)
                                if r then
                                    tXTRA.OpenUrl("https://store.xtrastudios.com/")
                                end
                            end
                        )
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("store", "info")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    local aa = b[d]
                    if not aa then
                        RageUI.ActuallyCloseAll()
                        return
                    end
                    local U = a.items[aa]
                    local ah = U.name .. "   |   " .. d
                    RageUI.Separator(ah)
                    if U.manuallyRedeemable then
                        RageUI.ButtonWithStyle(
                            "Redeem Item",
                            U.description,
                            {RightLabel = "→→→"},
                            true,
                            function(X, Y, Z)
                                if Z then
                                    TriggerServerEvent("XTRA:getStoreLockedVehicleCategories")
                                end
                            end,
                            RMenu:Get("store", "redeem")
                        )
                    else
                        RageUI.ButtonWithStyle(
                            "Redeem Item",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function(m, q, r)
                                if r then
                                    tXTRA.OpenUrl("https://discord.gg/ZfXz8S6uF5")
                                end
                            end
                        )
                    end
                    if U.canTransfer then
                        RageUI.ButtonWithStyle(
                            "Sell To Player",
                            "This will transfer the entire package, including any redeemable content, to the specified player.",
                            {RightLabel = "→→→"},
                            true,
                            function(X, Y, Z)
                                if Z then
                                    if isInGreenzone then
                                        TriggerServerEvent("XTRA:startSellStoreItem", d)
                                    else
                                        notify("~r~You must be in a greenzone to sell.")
                                    end
                                end
                            end,
                            nil
                        )
                    else
                        RageUI.Button(
                            "Sell To Player",
                            "",
                            {},
                            false,
                            function()
                            end,
                            nil
                        )
                    end
                    local ai = j and string.format("~g~Copied %s into your clipboard!", d)
                    string.format("Copies %s into your clipboard.", d)
                    RageUI.ButtonWithStyle(
                        "Copy Code to Clipboard",
                        ai,
                        {RightLabel = "→→→"},
                        true,
                        function(X, Y, Z)
                            if Z then
                                tXTRA.CopyToClipBoard(d)
                                j = true
                            end
                        end
                    )
                end
            )
        end
        if RageUI.Visible(RMenu:Get("store", "redeem")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    local aa = b[d]
                    if not aa then
                        RageUI.ActuallyCloseAll()
                        return
                    end
                    local U = a.items[aa]
                    if U.args then
                        for I, B in pairs(a.argsTemplate[U.args]) do
                            if B.type == "string" then
                                W(B)
                            elseif B.type == "vehicleList" then
                                a0(B)
                            end
                        end
                    end
                    RageUI.ButtonWithStyle(
                        "~g~Redeem " .. U.name,
                        "",
                        {RightLabel = "→→→"},
                        true,
                        function(X, Y, Z)
                            if Z then
                                if T(U) then
                                    TriggerServerEvent("XTRA:redeemStoreItem", d, e)
                                else
                                    notify("~r~Unable to redeem, one or more argument is invalid.")
                                end
                            end
                        end,
                        nil
                    )
                end
            )
        end
        if RageUI.Visible(RMenu:Get("store", "vehicleList")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    for ag, F in ae(f.items, false) do
                        if type(F) == "table" then
                            local aj = not c[ag]
                            local ai = aj and "" or "You do not have access to this garage."
                            RageUI.Button(
                                ag,
                                ai,
                                aj and {RightLabel = "→→→"} or {RightLabel = ""},
                                aj,
                                function(X, Y, Z)
                                    if Z then
                                        h = ag
                                    end
                                end,
                                RMenu:Get("store", "vehicleListInner")
                            )
                        else
                            local aj = J(ag)
                            local ai = aj and "" or "You can not own more than one of this vehicle."
                            RageUI.Button(
                                F,
                                ai,
                                aj and {RightLabel = "→→→"} or {RightLabel = ""},
                                aj,
                                function(X, Y, Z)
                                    if Z then
                                        g = ag
                                    end
                                end,
                                RMenu:Get("store", "vehicleSelection")
                            )
                        end
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("store", "vehicleListInner")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    for ag, F in ae(f.items[h], true) do
                        local aj = J(ag)
                        local ai = aj and "" or "You can not own more than one of this vehicle."
                        RageUI.Button(
                            F,
                            ai,
                            aj and {RightLabel = "→→→"} or {RightLabel = ""},
                            aj,
                            function(X, Y, Z)
                                if Z then
                                    g = ag
                                end
                            end,
                            RMenu:Get("store", "vehicleSelection")
                        )
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("store", "vehicleSelection")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    RageUI.ButtonWithStyle(
                        "Select Vehicle",
                        "",
                        {RightLabel = "→→→"},
                        true,
                        function(X, Y, Z)
                            if Z then
                                e[f.field] = g
                            end
                        end,
                        RMenu:Get("store", "redeem")
                    )
                    RageUI.ButtonWithStyle(
                        "Preview Vehicle",
                        "",
                        {RightLabel = "→→→"},
                        true,
                        function(X, Y, Z)
                            if Z then
                                if
                                    tXTRA.canAnim() and tXTRA.getPlayerCombatTimer() == 0 and tXTRA.getPlayerVehicle() == 0 and
                                        not tXTRA.isPlayerInRedZone() and
                                        tXTRA.getPlayerBucket() == 0
                                 then
                                    a2(g)
                                else
                                    notify("~r~You can not preview right now.")
                                end
                            end
                        end,
                        nil
                    )
                end
            )
        end
    end
)
RegisterNetEvent(
    "XTRA:sendStoreItems",
    function(ak)
        b = ak
    end
)
RMenu.Add(
    "vehicletesting",
    "mainmenu",
    RageUI.CreateMenu("", "Main Menu", tXTRA.getRageUIMenuWidth(), tXTRA.getRageUIMenuHeight(), "xtra_storeui", "xtra_storeui")
)
RMenu.Add(
    "vehicletesting",
    "extras",
    RageUI.CreateSubMenu(
        RMenu:Get("vehicletesting", "mainmenu"),
        "",
        "Extras",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight()
    )
)
local function al()
    local am = GetEntitySpeed(m)
    table.insert(p.speedBuffer, am)
    if #p.speedBuffer > 100 then
        table.remove(p.speedBuffer, 1)
    end
    local an = 0.0
    local ao = 0.0
    local ap = 0
    local aq = 0
    for ar, as in ipairs(p.speedBuffer) do
        if ar > 1 then
            local at = as - p.speedBuffer[ar - 1]
            if at > 0.0 then
                an = an + at
                ap = ap + 1
            else
                ao = an + at
                aq = aq + 1
            end
        end
    end
    an = an / ap
    ao = ao / aq
    p.speed = math.max(p.speed, am)
    p.speedDisplay = p.speed * 2.236936
    p.accel = math.max(p.accel, an)
    p.accelDisplay = p.accel * 60.0 * 2.236936
    p.decel = math.min(p.decel, ao)
    p.decelDisplay = math.abs(p.decel) * 60.0 * 2.236936
end
local function au()
    SetVehicleEngineHealth(m, 9999)
    SetVehiclePetrolTankHealth(m, 9999)
    SetVehicleFixed(m)
end
local function av()
    local aw = false
    for ad = 1, 12 do
        if DoesExtraExist(m, ad) then
            aw = true
        end
    end
    return aw
end
RageUI.CreateWhile(
    1.0,
    true,
    function()
        if RageUI.Visible(RMenu:Get("vehicletesting", "mainmenu")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    RageUI.Separator("Statistics")
                    local ax = 0
                    if o ~= 0 then
                        ax = o - n
                    else
                        ax = GetGameTimer() - n
                    end
                    RageUI.ButtonWithStyle(
                        "Time Elapsed",
                        "",
                        {RightLabel = string.format("%.1fs", ax / 1000.0)},
                        true,
                        function()
                        end,
                        nil
                    )
                    RageUI.ButtonWithStyle(
                        "Top Speed",
                        "",
                        {RightLabel = string.format("%.1f MPH", p.speedDisplay)},
                        true,
                        function()
                        end,
                        nil
                    )
                    RageUI.ButtonWithStyle(
                        "Top Acceleration",
                        "",
                        {RightLabel = string.format("%.1f MPH", p.accelDisplay)},
                        true,
                        function()
                        end,
                        nil
                    )
                    RageUI.ButtonWithStyle(
                        "Top Deacceleration",
                        "",
                        {RightLabel = string.format("%.1f MPH", p.decelDisplay)},
                        true,
                        function()
                        end,
                        nil
                    )
                    RageUI.Separator("Vehicle Options")
                    RageUI.List(
                        "Teleport Location",
                        x,
                        w,
                        "",
                        {},
                        true,
                        function(X, Y, Z, ay)
                            w = ay
                            if Z then
                                local a4 = y[w]
                                SetEntityCoordsNoOffset(m, a4.x, a4.y, a4.z, true, false, false)
                            end
                        end,
                        function()
                        end,
                        nil
                    )
                    RageUI.Button(
                        "Repair Vehicle",
                        "",
                        {},
                        true,
                        function(X, Y, Z)
                            if Z then
                                au()
                                if not IsVehicleOnAllWheels(m) then
                                    local a4 = GetEntityCoords(m, true)
                                    SetEntityCoordsNoOffset(m, a4.x, a4.y, a4.z, true, false, false)
                                end
                            end
                        end,
                        nil
                    )
                    if av() then
                        RageUI.ButtonWithStyle(
                            "Extras",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function()
                            end,
                            RMenu:Get("vehicletesting", "extras")
                        )
                    end
                    RageUI.ButtonWithStyle(
                        "~r~Stop Previewing",
                        "",
                        {RightLabel = "→→→"},
                        true,
                        function(X, Y, Z)
                            if Z then
                                l = false
                                DeleteEntity(m)
                                SetEntityCoordsNoOffset(PlayerPedId(), z.x, z.y, z.z, false, false, false)
                                TriggerServerEvent("XTRA:setInVehicleTestingBucket", false)
                                RageUI.Visible(RMenu:Get("store", "vehicleSelection"), true)
                            end
                        end,
                        nil
                    )
                end
            )
        end
        if RageUI.Visible(RMenu:Get("vehicletesting", "extras")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    for ad = 1, 12 do
                        if DoesExtraExist(m, ad) then
                            if IsVehicleExtraTurnedOn(vehicle, ad) then
                                RageUI.Button(
                                    "Disable Extra " .. ad,
                                    nil,
                                    {RightLabel = tostring(ad)},
                                    true,
                                    function(X, Y, Z)
                                        if Z then
                                            SetVehicleExtra(vehicle, ad, true)
                                        end
                                    end,
                                    nil
                                )
                            else
                                RageUI.Button(
                                    "Enable Extra " .. ad,
                                    nil,
                                    {RightLabel = tostring(ad)},
                                    true,
                                    function(X, Y, Z)
                                        if Z then
                                            SetVehicleExtra(vehicle, ad, false)
                                            au()
                                        end
                                    end,
                                    nil
                                )
                            end
                        end
                    end
                end
            )
        end
    end
)
local function az()
    if l then
        if
            not RageUI.Visible(RMenu:Get("vehicletesting", "mainmenu")) and
                not RageUI.Visible(RMenu:Get("vehicletesting", "extras"))
         then
            RageUI.Visible(RMenu:Get("vehicletesting", "mainmenu"), true)
        end
        DisableControlAction(0, 23, true)
        DisableControlAction(0, 75, true)
        local vehicle, aA = tXTRA.getPlayerVehicle()
        if (vehicle ~= m or not aA) and DoesEntityExist(m) then
            SetPedIntoVehicle(PlayerPedId(), m, -1)
        end
        if o == 0 then
            subtitleText("~y~Press [E] to stop recording stats")
            al()
            if IsControlJustPressed(0, 51) then
                o = GetGameTimer()
            end
        else
            subtitleText("~y~Press [E] to start recording stats")
            if IsControlJustPressed(0, 51) then
                p = k()
                n = GetGameTimer()
                o = 0
            end
        end
    end
end
tXTRA.createThreadOnTick(az)
function tXTRA.isInStoreTesting()
    return l
end
RegisterNetEvent(
    "XTRA:storeDrawEffects",
    function()
        tXTRA.loadPtfx("scr_xs_celebration")
        tXTRA.loadPtfx("scr_rcpaparazzo1")
        for I = 1, 4 do
            local a4 = tXTRA.getPlayerCoords()
            UseParticleFxAsset("scr_xs_celebration")
            StartParticleFxNonLoopedAtCoord(
                "scr_xs_confetti_burst",
                a4.x,
                a4.y,
                a4.z - 0.8,
                0.0,
                0.0,
                0.0,
                1.2,
                false,
                false,
                false
            )
            UseParticleFxAsset("scr_rcpaparazzo1")
            StartParticleFxNonLoopedAtCoord(
                "scr_mich4_firework_burst_spawn",
                a4.x,
                a4.y,
                a4.z,
                0.0,
                0.0,
                0.0,
                1.0,
                false,
                false,
                false
            )
            Citizen.Wait(500)
        end
        RemoveNamedPtfxAsset("scr_xs_celebration")
        RemoveNamedPtfxAsset("scr_rcpaparazzo1")
    end
)
RegisterNetEvent(
    "XTRA:setStoreLockedVehicleCategories",
    function(aB)
        c = aB
    end
)
RegisterNetEvent("XTRA:OpenStoreMenu")
AddEventHandler(
    "XTRA:OpenStoreMenu",
    function()
        RageUI.Visible(RMenu:Get("store", "mainmenu"), true)
    end
)
RegisterCommand(
    "store",
    function()
        TriggerServerEvent("XTRA:OpenStore")
    end
)
RegisterNetEvent(
    "XTRA:setStoreRankName",
    function(aC)
        i = aC
    end
)
RegisterNetEvent(
    "XTRA:storeCloseMenu",
    function()
        RageUI.ActuallyCloseAll()
        RageUI.Visible(RMenu:Get("store", "mainmenu"), false)
    end
)
