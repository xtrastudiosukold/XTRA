local a = module("cfg/cfg_lscustoms")
local b = false
local d = nil
local e = 0
DecorRegister("dashcam", 2)
DecorRegister("vehicleblip", 2)
local f = {
    [1] = {
        locked = false,
        camera = {position = vector3(-330.945, -135.471, 39.01), heading = 102.213},
        driveOut = {position = vector3(-350.376, -136.76, 38.294), heading = 70.226},
        driveIn = {position = vector3(-350.655, -136.55, 38.295), heading = 249.532},
        outside = {position = vector3(-362.7962, -132.4005, 38.25239), heading = 71.187133},
        inside = {position = vector3(-337.3863, -136.9247, 38.5737), heading = 269.455}
    },
    [2] = {
        locked = false,
        camera = {position = vector3(737.09, -1085.721, 22.169), heading = 114.86},
        driveOut = {position = vector3(725.46, -1088.822, 21.455), heading = 89.395},
        driveIn = {position = vector3(726.157, -1088.768, 22.169), heading = 270.288},
        outside = {position = vector3(716.54, -1088.757, 21.651), heading = 89.248},
        inside = {position = vector3(733.69, -1088.74, 21.733), heading = 270.528}
    },
    [3] = {
        locked = false,
        camera = {position = vector3(-1154.902, -2011.438, 13.18), heading = 95.49},
        driveOut = {position = vector3(-1150.379, -1995.845, 12.465), heading = 313.594},
        driveIn = {position = vector3(-1150.26, -1995.642, 12.466), heading = 136.859},
        outside = {position = vector3(-1140.352, -1985.89, 12.45), heading = 314.406},
        inside = {position = vector3(-1155.077, -2006.61, 12.465), heading = 162.58},
        interior = {key = 164353, room = 2044753180}
    },
    [4] = {
        locked = false,
        camera = {position = vector3(1177.98, 2636.059, 37.754), heading = 37.082},
        driveOut = {position = vector3(1175.003, 2642.175, 37.045), heading = 0.759},
        driveIn = {position = vector3(1174.701, 2643.764, 37.048), heading = 178.119},
        outside = {position = vector3(1175.565, 2652.819, 37.941), heading = 351.579},
        inside = {position = vector3(1174.823, 2637.807, 37.045), heading = 181.19}
    },
    [5] = {
        locked = false,
        camera = {position = vector3(105.825, 6627.562, 31.787), heading = 266.692},
        driveOut = {position = vector3(112.326, 6625.148, 31.073), heading = 224.641},
        driveIn = {position = vector3(112.738, 6624.644, 31.072), heading = 44.262},
        outside = {position = vector3(118.493, 6618.897, 31.13), heading = 224.701},
        inside = {position = vector3(108.842, 6628.447, 31.072), heading = 45.504}
    },
    [6] = {
        locked = false,
        camera = {position = vector3(-215.518, -1329.135, 30.89), heading = 329.092},
        driveOut = {position = vector3(-205.935, -1316.642, 30.176), heading = 356.495},
        driveIn = {position = vector3(-205.626, -1314.99, 30.247), heading = 179.395},
        outside = {position = vector3(-205.594, -1304.085, 30.614), heading = 359.792},
        inside = {position = vector3(-212.368, -1325.486, 30.176), heading = 141.107}
    },
    [7] = {
        locked = false,
        camera = {position = vector3(-86.057243347168, -1819.9788818359, 26.958625793457)},
        driveOut = {position = vector3(-82.01148223877, -1812.5144042969, 26.812662124634), heading = 240.107},
        driveIn = {position = vector3(-72.518035888672, -1820.6060791016, 26.941911697388), heading = 51.495},
        outside = {position = vector3(-72.518035888672, -1820.6060791016, 26.941911697388)},
        inside = {position = vector3(-82.01148223877, -1812.5144042969, 26.812662124634)}
    },
    [8] = {
        locked = false,
        camera = {position = vector3(-1070.8831787109, -846.38702392578, 4.8841347694397), heading = 63.092},
        driveOut = {position = vector3(-1075.5308837891, -847.00433349609, 4.8841781616211), heading = 240.107},
        driveIn = {position = vector3(-1071.5559082031, -852.48406982422, 4.8729567527771), heading = 42.495},
        outside = {position = vector3(-1071.5559082031, -852.48406982422, 4.8729567527771), heading = 215.495},
        inside = {position = vector3(-1077.9399414063, -846.11657714844, 4.8841381072998), heading = 224.107}
    },
    [9] = {
        locked = false,
        camera = {position = vector3(545.97668457031, -187.05009460449, 55.878513336182), heading = 120.092},
        driveOut = {position = vector3(545.31378173828, -189.39358520508, 54.493225097656), heading = 85.107},
        driveIn = {position = vector3(534.91668701172, -189.12139892578, 53.944599151611), heading = 270.495},
        outside = {position = vector3(534.91668701172, -189.12139892578, 53.944599151611), heading = 80.495},
        inside = {position = vector3(545.31378173828, -189.39358520508, 54.493225097656), heading = 265.107}
    },
    [10] = {
        locked = false,
        camera = {position = vector3(135.45944213867, 266.33685302734, 112.62689971924)},
        driveOut = {position = vector3(129.97991943359, 263.06198120117, 109.86600494385), heading = 340.0},
        driveIn = {position = vector3(133.83386230469, 273.98858642578, 110.05864715576), heading = 160.0},
        outside = {position = vector3(133.83386230469, 273.98858642578, 110.05864715576)},
        inside = {position = vector3(129.97991943359, 263.06198120117, 109.86600494385)}
    }
}
local g = SetMenu()
local h = {}
local i = nil
local j = nil
local function k(l)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(l)
    DrawNotification(false, false)
end
local function m(n)
    return n + 0.00001
end
local function o()
    return PlayerPedId()
end
function h.repair()
    SetVehicleFixed(h.vehicle)
end
local function q(r, s)
    if s and s > 0 then
        local t = 10 ^ s
        return math.floor(r * t + 0.5) / t
    end
    return math.floor(r + 0.5)
end
local function u()
    Citizen.CreateThread(
        function()
            DoScreenFadeOut(0)
            while IsScreenFadingOut() do
                Citizen.Wait(0)
            end
        end
    )
end
local function v()
    Citizen.CreateThread(
        function()
            ShutdownLoadingScreen()
            DoScreenFadeIn(500)
            while IsScreenFadingIn() do
                Citizen.Wait(0)
            end
        end
    )
end
local function w()
    local x = GetPlayerPed(-1)
    local y = GetVehiclePedIsIn(x, false)
    if y ~= nil then
        for z = 0, 48, 1 do
            Citizen.Trace("Number of mods for " .. z .. " Are :" .. GetNumVehicleMods(y, z) .. "\n")
        end
    end
end
local A = g.new("Los Santos Customs", "~w~CATEGORIES", 0.16, 0.13, 0.24, 0.36, 0, {255, 255, 255, 255})
A.config.pcontrol = false
local function B(C, D, E, name, F, G)
    local y = h.vehicle
    SetVehicleModKit(y, 0)
    if GetNumVehicleMods(y, C) ~= nil and GetNumVehicleMods(y, C) > 0 or C == 18 or C == 22 then
        local H = D:addSubMenu(E, name, F, true)
        if LSC_Config.prices.mods[C].startprice then
            local I = LSC_Config.prices.mods[C].startprice
            for z = -1, GetNumVehicleMods(y, C) - 1 do
                local J = "Stock"
                if z >= 0 then
                    local K = GetModTextLabel(y, C, z)
                    local L = GetLabelText(K)
                    J = L ~= "NULL" and L or "N/A"
                end
                local btn = H:addPurchase(J, I)
                btn.modtype = C
                btn.mod = z
                I = I + LSC_Config.prices.mods[C].increaseby
            end
        else
            for n, M in pairs(LSC_Config.prices.mods[C]) do
                btn = H:addPurchase(M.name, M.price)
                btn.modtype = C
                btn.mod = M.mod
            end
        end
    end
end
local function N()
    local O = d.camera.position
    j = CreateCam("DEFAULT_SCRIPTED_CAMERA", true, 2)
    SetCamCoord(j, O + 1.0)
    O = d.inside.position
    PointCamAtCoord(j, O)
    SetCamActive(j, true)
    RenderScriptCams(1, 0, j, 0, 0)
end
local function P()
    TriggerServerEvent("lockGarage", true, e)
    SetPlayerControl(PlayerId(), false, 256)
    u()
    local Q = d
    local R = o()
    local y = GetVehiclePedIsUsing(R)
    A.buttons = {}
    DisplayRadar(false)
    if DoesEntityExist(y) then
        if e == 4 or e == 5 then
            A:setTitle("XTRA Customs")
            A.title_sprite = "shopui_title_supermod"
        elseif e == 6 then
            A:setTitle("XTRA Customs")
            A.title_sprite = "shopui_title_supermod"
        else
            A:setTitle("XTRA Customs")
            A.title_sprite = "shopui_title_supermod"
        end
        A.config.controls = LSC_Config.menu.controls
        SetIbuttons(
            {
                {GetControlInstructionalButton(1, A.config.controls.menu_back, 0), "Back"},
                {GetControlInstructionalButton(1, A.config.controls.menu_select, 0), "Select"},
                {GetControlInstructionalButton(1, A.config.controls.menu_up, 0), "Up"},
                {GetControlInstructionalButton(1, A.config.controls.menu_down, 0), "Down"},
                {GetControlInstructionalButton(1, A.config.controls.menu_left, 0), "Left"},
                {GetControlInstructionalButton(1, A.config.controls.menu_right, 0), "Right"}
            },
            0
        )
        A:setMaxButtons(LSC_Config.menu.maxbuttons)
        A.config.size.width = m(LSC_Config.menu.width) or 3.85
        A.config.size.height = m(LSC_Config.menu.height) or 0.35
        if type(LSC_Config.menu.position) == "table" then
            A.config.position = {x = LSC_Config.menu.position.x, y = LSC_Config.menu.position.y}
        elseif type(LSC_Config.menu.position) == "string" then
            if LSC_Config.menu.position == "left" then
                A.config.position = {x = 0.16, y = 0.13}
            elseif LSC_Config.menu.position == "right" then
                A.config.position = {x = 1 - 0.16, y = 0.13}
            end
        end
        if type(LSC_Config.menu.theme) == "table" then
            A:setColors(
                LSC_Config.menu.theme.text_color,
                LSC_Config.menu.theme.stext_color,
                LSC_Config.menu.theme.bg_color,
                LSC_Config.menu.theme.sbg_color
            )
        elseif type(LSC_Config.menu.theme) == "string" then
            if LSC_Config.menu.theme == "light" then
                A:setColors(
                    {r = 255, g = 255, b = 255, a = 255},
                    {r = 0, g = 0, b = 0, a = 255},
                    {r = 0, g = 0, b = 0, a = 255},
                    {r = 255, g = 255, b = 255, a = 255}
                )
            elseif LSC_Config.menu.theme == "darkred" then
                A:setColors(
                    {r = 255, g = 255, b = 255, a = 255},
                    {r = 0, g = 0, b = 0, a = 255},
                    {r = 0, g = 0, b = 0, a = 255},
                    {r = 255, g = 255, b = 255, a = 255}
                )
            elseif LSC_Config.menu.theme == "bluish" then
                A:setColors(
                    {r = 255, g = 255, b = 255, a = 255},
                    {r = 255, g = 255, b = 255, a = 255},
                    {r = 0, g = 0, b = 0, a = 255},
                    {r = 0, g = 100, b = 255, a = 255}
                )
            elseif LSC_Config.menu.theme == "greenish" then
                A:setColors(
                    {r = 255, g = 255, b = 255, a = 255},
                    {r = 0, g = 0, b = 0, a = 255},
                    {r = 0, g = 0, b = 0, a = 255},
                    {r = 0, g = 200, b = 0, a = 255}
                )
            end
        end
        A:addSubMenu("CATEGORIES", "categories", nil, false)
        A.categories.buttons = {}
        local S = 1000
        local T = 0
        T = (S - GetVehicleBodyHealth(y)) / 100
        A:addPurchase("Repair vehicle", q(250 + 150 * T, 0), "Full body repair and engine service.")
        SetVehicleModKit(y, 0)
        h.vehicle = y
        h.color = table.pack(GetVehicleColours(y))
        h.extracolor = table.pack(GetVehicleExtraColours(y))
        h.neon = IsVehicleNeonLightEnabled(y, 0)
        h.neoncolor = table.pack(GetVehicleNeonLightsColour(y))
        h.xenoncolor = GetVehicleHeadlightsColour(y)
        h.smokecolor = table.pack(GetVehicleTyreSmokeColor(y))
        h.plateindex = GetVehicleNumberPlateTextIndex(y)
        h.mods = {}
        h.remoteDashcams = DecorGetBool(y, "dashcam")
        h.remoteVehicleBlips = DecorGetBool(y, "vehicleblip")
        h.securityBiometricLock = DecorGetBool(y, "biometricLock")
        h.engineSounds = DecorGetInt(y, "lsAudioId")
        for z = 0, 48 do
            h.mods[z] = {mod = nil}
        end
        for z, U in pairs(h.mods) do
            if z == 22 or z == 18 then
                if IsToggleModOn(y, z) then
                    U.mod = 1
                else
                    U.mod = 0
                end
            elseif z == 23 or z == 24 then
                U.mod = GetVehicleMod(y, z)
                U.variation = GetVehicleModVariation(y, z)
            else
                U.mod = GetVehicleMod(y, z)
            end
        end
        if GetVehicleWindowTint(y) == -1 or GetVehicleWindowTint(y) == 0 then
            h.windowtint = false
        else
            h.windowtint = GetVehicleWindowTint(y)
        end
        if h.xenoncolor > 12 or h.xenoncolor < -1 then
            h.xenoncolor = -1
        end
        h.wheeltype = GetVehicleWheelType(y)
        h.bulletProofTyres = GetVehicleTyresCanBurst(y)
        local V, W, X, Y, Z = false, false, false, false
        for z = 0, 48 do
            if GetNumVehicleMods(y, z) ~= nil and GetNumVehicleMods(y, z) ~= false and GetNumVehicleMods(y, z) > 0 then
                if z == 1 then
                    X = true
                    Y = true
                elseif z == 2 then
                    X = true
                    Z = true
                elseif z >= 42 and z <= 46 or z == 5 then
                    V = true
                elseif z >= 27 and z <= 37 then
                    W = true
                end
            end
        end
        B(0, A.categories, "SPOILER", "Spoiler", "Increase downforce.", true)
        B(3, A.categories, "SKIRTS", "Skirts", "Enhance your vehicle's look with custom side skirts.", true)
        B(4, A.categories, "EXHAUST", "Exhausts", "Customized sports exhausts.", true)
        B(6, A.categories, "GRILLE", "Grille", "Improved engine cooling.", true)
        B(7, A.categories, "HOOD", "Hood", "Enhance car engine cooling.", true)
        B(8, A.categories, "FENDERS", "Fenders", "Enhance body paneling with custom fenders.", true)
        B(10, A.categories, "ROOF", "Roof", "Lower your center of gravity with lightweight roof panels.", true)
        B(12, A.categories, "BRAKES", "Brakes", "Increase stopping power and eliminate brake fade.", true)
        B(
            13,
            A.categories,
            "TRANSMISSION",
            "Transmission",
            "Improved acceleration with close ratio transmission.",
            true
        )
        B(14, A.categories, "HORN", "Horn", "Custom air horns.", true)
        B(15, A.categories, "SUSPENSION", "Suspension", "Upgrade to a sports oriented suspension setup.", true)
        B(
            16,
            A.categories,
            "ARMOR",
            "Armor",
            "Protect your car's occupants with military spec composite body panels.",
            true
        )
        B(18, A.categories, "TURBO", "Turbo", "Reduced lag turbocharger.", false)
        if V then
            A.categories:addSubMenu("CHASSIS", "Chassis", nil, true)
            B(42, A.categories.Chassis, "ARCH COVER", "Arch cover", "", true)
            B(43, A.categories.Chassis, "AERIALS", "Aerials", "", true)
            B(44, A.categories.Chassis, "ROOF SCOOPS", "Roof Scoops", "", true)
            B(45, A.categories.Chassis, "Tank", "Tank", "", true)
            B(46, A.categories.Chassis, "DOORS", "Doors", "", true)
            B(5, A.categories.Chassis, "ROLL CAGE", "Roll cage", "Stiffen your chassis with a rollcage.", true)
        end
        A.categories:addSubMenu("ENGINE", "Engine", nil, true)
        B(39, A.categories.Engine, "ENGINE BLOCK", "Engine Block", "Custom engine block casings.", true)
        B(40, A.categories.Engine, "CAM COVER", "Cam Cover", "Optional cam covers.", true)
        B(41, A.categories.Engine, "STRUT BRACE", "Strut Brace", "A selection of support struts.", true)
        B(11, A.categories.Engine, "ENGINE TUNES", "Engine Tunes", "Increases horsepower.", true)
        if W then
            A.categories:addSubMenu("INTERIOR", "Interior", "Products for maximum style and comfort.", true)
            B(27, A.categories.Interior, "TRIM DESIGN", "Trim Design", "", true)
            B(28, A.categories.Interior, "ORNAMENTS", "Ornaments", "Add decorative items to your dash.", true)
            B(29, A.categories.Interior, "DASHBOARD", "Dashboard", "Custom control panel designs.", true)
            B(30, A.categories.Interior, "DIAL DESIGN", "Dials", "Customize the look of your dials.", true)
            B(31, A.categories.Interior, "DOORS", "Doors", "Install door upgrades.", true)
            B(32, A.categories.Interior, "SEATS", "Seats", "Options where style meets comfort.", true)
            B(
                33,
                A.categories.Interior,
                "STEERING WHEELS",
                "Steering Wheels",
                "Customize the link between you and your vehicle.",
                true
            )
            B(34, A.categories.Interior, "Shifter leavers", "Shifter leavers", "", true)
            B(35, A.categories.Interior, "Plaques", "Plaques", "", true)
            B(36, A.categories.Interior, "Speakers", "Speakers", "", true)
            B(37, A.categories.Interior, "Trunk", "Trunk", "", true)
        end
        A.categories:addSubMenu("PLATES", "Plates", "Decorative identification.", true)
        A.categories.Plates:addSubMenu("LICENSE", "License", "", true)
        for n, C in pairs(LSC_Config.prices.plates) do
            local btn = A.categories.Plates.License:addPurchase(C.name, C.price)
            btn.plateindex = C.plateindex
        end
        B(25, A.categories.Plates, "Plate holder", "Plate holder", "", true)
        B(26, A.categories.Plates, "Vanity plates", "Vanity plates", "", true)
        B(38, A.categories, "HYDRAULICS", "Hydraulics", "", true)
        B(48, A.categories, "Liveries", "Liveries", "A selection of decals for your vehicle.", true)
        if X then
            A.categories:addSubMenu("BUMPERS", "Bumpers", "Custom front and rear bumpers.", true)
            if Y then
                B(1, A.categories.Bumpers, "FRONT BUMPERS", "Front bumpers", "Custom front bumpers.", true)
            end
            if Z then
                B(2, A.categories.Bumpers, "REAR BUMPERS", "Rear bumpers", "Custom rear bumpers.", true)
            end
        end
        local H = A.categories:addSubMenu("LIGHTS", "Lights", "Improved night time visibility.", true)
        B(22, A.categories.Lights, "HEADLIGHTS", "Headlights", nil, false)
        if not IsThisModelABike(GetEntityModel(y)) then
            neon = H:addSubMenu("NEON KITS", "Neon kits", nil, true)
            neon:addSubMenu("NEON LAYOUT", "Neon layout", nil, true)
            local btn = neon["Neon layout"]:addPurchase("None")
            for n, C in pairs(LSC_Config.prices.neonlayout) do
                btn = neon["Neon layout"]:addPurchase(C.name, C.price)
            end
            neon = neon:addSubMenu("NEON COLOR", "Neon color", nil, true)
            for n, C in pairs(LSC_Config.prices.neoncolor) do
                local btn = neon:addPurchase(C.name, C.price)
                btn.neon = C.neon
            end
            H = H:addSubMenu("XENON COLOR", "Xenon color", nil, true)
            local btn = H:addPurchase("Stock")
            btn.xenon = -1
            for n, C in pairs(LSC_Config.prices.xenoncolor) do
                btn = H:addPurchase(C.name, C.price)
                btn.xenon = C.xenon
            end
        end
        respray = A.categories:addSubMenu("RESPRAY", "Respray", "Transforms vehicle appearance.", true)
        pcol = respray:addSubMenu("PRIMARY COLORS", "Primary color", nil, true)
        pcol:addSubMenu("CHROME", "Chrome", nil, true)
        for n, c in pairs(LSC_Config.prices.chrome.colors) do
            local btn = pcol.Chrome:addPurchase(c.name, LSC_Config.prices.chrome.price)
            btn.colorindex = c.colorindex
            if btn.colorindex == h.color[1] then
                btn.purchased = true
            end
        end
        pcol:addSubMenu("CLASSIC", "Classic", nil, true)
        for n, c in pairs(LSC_Config.prices.classic.colors) do
            local btn = pcol.Classic:addPurchase(c.name, LSC_Config.prices.classic.price)
            btn.colorindex = c.colorindex
            if btn.colorindex == h.color[1] then
                btn.purchased = true
            end
        end
        pcol:addSubMenu("MATTE", "Matte", nil, true)
        for n, c in pairs(LSC_Config.prices.matte.colors) do
            local btn = pcol.Matte:addPurchase(c.name, LSC_Config.prices.matte.price)
            btn.colorindex = c.colorindex
            if btn.colorindex == h.color[1] then
                btn.purchased = true
            end
        end
        pcol:addSubMenu("METALLIC", "Metallic", nil, true)
        for n, c in pairs(LSC_Config.prices.metallic.colors) do
            local btn = pcol.Metallic:addPurchase(c.name, LSC_Config.prices.metallic.price)
            btn.colorindex = c.colorindex
            if btn.colorindex == h.color[1] and h.extracolor[1] == h.color[2] then
                btn.purchased = true
            end
        end
        pcol:addSubMenu("METALS", "Metals", nil, true)
        for n, c in pairs(LSC_Config.prices.metal.colors) do
            local btn = pcol.Metals:addPurchase(c.name, LSC_Config.prices.metal.price)
            btn.colorindex = c.colorindex
            if btn.colorindex == h.color[1] then
                btn.purchased = true
            end
        end
        scol = respray:addSubMenu("SECONDARY COLORS", "Secondary color", nil, true)
        scol:addSubMenu("CHROME", "Chrome", nil, true)
        for n, c in pairs(LSC_Config.prices.chrome2.colors) do
            local btn = scol.Chrome:addPurchase(c.name, LSC_Config.prices.chrome2.price)
            btn.colorindex = c.colorindex
            if btn.colorindex == h.color[2] then
                btn.purchased = true
            end
        end
        scol:addSubMenu("CLASSIC", "Classic", nil, true)
        for n, c in pairs(LSC_Config.prices.classic2.colors) do
            local btn = scol.Classic:addPurchase(c.name, LSC_Config.prices.classic2.price)
            btn.colorindex = c.colorindex
            if btn.colorindex == h.color[2] then
                btn.purchased = true
            end
        end
        scol:addSubMenu("MATTE", "Matte", nil, true)
        for n, c in pairs(LSC_Config.prices.chrome2.colors) do
            local btn = scol.Matte:addPurchase(c.name, LSC_Config.prices.matte2.price)
            btn.colorindex = c.colorindex
            if btn.colorindex == h.color[1] then
                btn.purchased = true
            end
        end
        scol:addSubMenu("METALLIC", "Metallic", nil, true)
        for n, c in pairs(LSC_Config.prices.metallic2.colors) do
            local btn = scol.Metallic:addPurchase(c.name, LSC_Config.prices.metallic2.price)
            btn.colorindex = c.colorindex
            if btn.colorindex == h.color[2] and h.extracolor[1] == btn.colorindex then
                btn.purchased = true
            end
        end
        scol:addSubMenu("METALS", "Metals", nil, true)
        for n, c in pairs(LSC_Config.prices.metal2.colors) do
            local btn = scol.Metals:addPurchase(c.name, LSC_Config.prices.metal2.price)
            btn.colorindex = c.colorindex
            if btn.colorindex == h.color[2] then
                btn.purchased = true
            end
        end
        A.categories:addSubMenu("WHEELS", "Wheels", "Custom rims, tires and colors.", true)
        wtype = A.categories.Wheels:addSubMenu("WHEEL TYPE", "Wheel type", "Custom rims in all styles and sizes.", true)
        if IsThisModelABike(GetEntityModel(y)) then
            fwheels = wtype:addSubMenu("FRONT WHEEL", "Front wheel", nil, true)
            for n, _ in pairs(LSC_Config.prices.frontwheel) do
                btn = fwheels:addPurchase(_.name, _.price)
                btn.wtype = _.wtype
                btn.modtype = 23
                btn.mod = _.mod
            end
            bwheels = wtype:addSubMenu("BACK WHEEL", "Back wheel", nil, true)
            for n, _ in pairs(LSC_Config.prices.backwheel) do
                btn = bwheels:addPurchase(_.name, _.price)
                btn.wtype = _.wtype
                btn.modtype = 24
                btn.mod = _.mod
            end
        else
            sportw = wtype:addSubMenu("SPORT WHEELS", "Sport", nil, true)
            for n, _ in pairs(LSC_Config.prices.sportwheels) do
                local btn = sportw:addPurchase(_.name, _.price)
                btn.wtype = _.wtype
                btn.modtype = 23
                btn.mod = _.mod
            end
            musclew = wtype:addSubMenu("MUSCLE WHEELS", "Muscle", nil, true)
            for n, _ in pairs(LSC_Config.prices.musclewheels) do
                local btn = musclew:addPurchase(_.name, _.price)
                btn.wtype = _.wtype
                btn.modtype = 23
                btn.mod = _.mod
            end
            lowriderw = wtype:addSubMenu("LOWRIDER WHEELS", "Lowrider", nil, true)
            for n, _ in pairs(LSC_Config.prices.lowriderwheels) do
                local btn = lowriderw:addPurchase(_.name, _.price)
                btn.wtype = _.wtype
                btn.modtype = 23
                btn.mod = _.mod
            end
            suvw = wtype:addSubMenu("SUV WHEELS", "Suv", nil, true)
            for n, _ in pairs(LSC_Config.prices.suvwheels) do
                local btn = suvw:addPurchase(_.name, _.price)
                btn.wtype = _.wtype
                btn.modtype = 23
                btn.mod = _.mod
            end
            offroadw = wtype:addSubMenu("OFFROAD WHEELS", "Offroad", nil, true)
            for n, _ in pairs(LSC_Config.prices.offroadwheels) do
                local btn = offroadw:addPurchase(_.name, _.price)
                btn.wtype = _.wtype
                btn.modtype = 23
                btn.mod = _.mod
            end
            tunerw = wtype:addSubMenu("TUNER WHEELS", "Tuner", nil, true)
            for n, _ in pairs(LSC_Config.prices.tunerwheels) do
                local btn = tunerw:addPurchase(_.name, _.price)
                btn.wtype = _.wtype
                btn.modtype = 23
                btn.mod = _.mod
            end
            hughendw = wtype:addSubMenu("HIGHEND WHEELS", "Highend", nil, true)
            for n, _ in pairs(LSC_Config.prices.highendwheels) do
                local btn = hughendw:addPurchase(_.name, _.price)
                btn.wtype = _.wtype
                btn.modtype = 23
                btn.mod = _.mod
            end
        end
        H = A.categories.Wheels:addSubMenu("WHEEL COLOR", "Wheel color", "Custom wheel colors.", true)
        for n, c in pairs(LSC_Config.prices.wheelcolor.colors) do
            local btn = H:addPurchase(c.name, LSC_Config.prices.wheelcolor.price)
            btn.colorindex = c.colorindex
        end
        H =
            A.categories.Wheels:addSubMenu(
            "WHEEL ACCESSORIES",
            "Wheel accessories",
            "Bulletproof tires and custom burnout smoke.",
            true
        )
        for n, C in pairs(LSC_Config.prices.wheelaccessories) do
            local btn = H:addPurchase(C.name, C.price)
            btn.smokecolor = C.smokecolor
        end
        H = A.categories:addSubMenu("WINDOWS", "Windows", "A selection of tinted windows.", true)
        btn = H:addPurchase("None")
        btn.tint = false
        for n, a0 in pairs(LSC_Config.prices.windowtint) do
            btn = H:addPurchase(a0.name, a0.price)
            btn.tint = a0.tint
        end
        H = A.categories:addSubMenu("REMOTE DASHCAMS", "Remote Dashcams", "A remote dashcam for your vehicle.", true)
        for n, C in pairs(LSC_Config.prices.remoteDashcams) do
            local btn = H:addPurchase(C.name, C.price)
            btn.mod = C.mod
        end
        H =
            A.categories:addSubMenu(
            "VEHICLE BLIPS",
            "Vehicle Blips",
            "A way to always keep track of your vehicle.",
            true
        )
        for n, C in pairs(LSC_Config.prices.remoteVehicleBlips) do
            local btn = H:addPurchase(C.name, C.price)
            btn.mod = C.mod
        end
        H =
            A.categories:addSubMenu(
            "BIOMETRIC LOCK",
            "Biometric Lock",
            "A way to completely secure your vehicle.",
            true
        )
        for n, C in pairs(LSC_Config.prices.securityBiometricLock) do
            local btn = H:addPurchase(C.name, C.price)
            btn.mod = C.mod
        end
        H =
            A.categories:addSubMenu(
            "CUSTOM EXHAUSTS",
            "Custom Exhausts",
            "Get a custom exhaust to get a custom vehicle sound.",
            true
        )
        for n, C in pairs(LSC_Config.prices.engineSounds) do
            local btn = H:addPurchase(C.name, C.price)
            btn.mod = C.mod
        end
        Citizen.CreateThread(
            function()
                FadeOutLocalPlayer(1)
                SetEntityCoordsNoOffset(y, Q.driveIn.position)
                SetEntityHeading(y, Q.driveIn.heading)
                SetVehicleOnGroundProperly(y)
                SetVehicleLights(y, 2)
                SetVehicleInteriorlight(y, true)
                SetVehicleDoorsLocked(y, 4)
                SetPlayerInvincible(GetPlayerIndex(), true)
                SetEntityInvincible(y, true)
                SetVehRadioStation(y, 255)
                local a1 = Q.interior
                if a1 then
                    ForceRoomForEntity(PlayerPedId(), a1.key, a1.room)
                    ForceRoomForEntity(y, a1.key, a1.room)
                    ForceRoomForGameViewport(a1.key, a1.room)
                end
                i = GetRenderingCam()
                N()
                Citizen.Wait(50)
                TaskVehicleDriveToCoord(R, y, Q.inside.position, m(3), m(1), GetEntityModel(y), 16777216, m(0.1), true)
                v()
                Citizen.Wait(3000)
                local c = 0
                while not IsVehicleStopped(y) do
                    Citizen.Wait(0)
                    c = c + 1
                    if c > 5000 then
                        ClearPedTasks(R)
                        break
                    end
                end
                Citizen.Wait(100)
                SetCamCoord(j, GetGameplayCamCoords())
                SetCamRot(j, GetGameplayCamRot(2), 2)
                RenderScriptCams(1, 1, 0, 0, 0)
                RenderScriptCams(0, 1, 1000, 0, 0)
                SetCamActive(i, true)
                EnableGameplayCam(true)
                SetCamActive(j, false)
                if IsVehicleDamaged(y) then
                    A:Open("main")
                else
                    A:Open("categories")
                end
                FreezeEntityPosition(y, true)
                SetEntityCollision(y, false, false)
                SetPlayerControl(PlayerId(), true)
            end
        )
    end
end
local function a2(Q)
    Citizen.CreateThread(
        function()
            local R = o()
            local y = GetVehiclePedIsIn(R)
            Q = d
            TaskVehicleDriveToCoord(R, y, Q.outside.position, m(5), m(0.1), GetEntityModel(y), 16777216, m(0.1), true)
            local a1 = Q.interior
            if a1 then
                ForceRoomForEntity(PlayerPedId(), a1.key, a1.room)
                ForceRoomForEntity(y, a1.key, a1.room)
                ForceRoomForGameViewport(a1.key, a1.room)
            end
            Q = d.driveOut
            local a3, a4, a5 = tXTRA.getNearestOwnedVehicle(1)
            h.model = a5
            h.spawncode = a4
            if y ~= 0 then
                TriggerServerEvent("LSC:finished", h)
            end
            u()
            Citizen.Wait(500)
            SetEntityCollision(y, true, true)
            FreezeEntityPosition(R, false)
            FreezeEntityPosition(y, false)
            SetEntityCoords(y, Q.position)
            SetEntityHeading(y, Q.heading)
            SetVehicleOnGroundProperly(y)
            SetVehicleDoorsLocked(y, 0)
            SetPlayerInvincible(GetPlayerIndex(), false)
            SetEntityInvincible(y, false)
            SetVehicleLights(y, 0)
            NetworkLeaveTransition()
            v()
            NetworkFadeInEntity(y, 1)
            Citizen.Wait(3000)
            NetworkRegisterEntityAsNetworked(y)
            SetEntityVisible(R, true, 0)
            ClearPedTasks(R)
            b = false
            TriggerServerEvent("lockGarage", false, e)
            e = 0
            DisplayRadar(true)
            SetPlayerControl(PlayerId(), true)
        end
    )
end
local function a6(l, a7, a8, a9, aa, ab, ac, ad, ae, a)
    SetTextFont(a7)
    SetTextProportional(0)
    SetTextScale(ab, ab)
    SetTextColour(ac, ad, ae, a)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(a8)
    SetTextEntry("STRING")
    AddTextComponentString(l)
    DrawText(a9, aa)
end
local function af(ag)
    local ah = 0
    for ai in pairs(ag) do
        ah = ah + 1
    end
    return ah
end
local function aj(U, ak)
    for al, M in pairs(U) do
        if M == ak then
            return true
        end
    end
    return false
end
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            if b == false then
                local R = o()
                if IsPedSittingInAnyVehicle(R) then
                    local y = GetVehiclePedIsUsing(R)
                    if
                        DoesEntityExist(y) and GetPedInVehicleSeat(y, -1) == R and
                            (IsThisModelACar(GetEntityModel(y)) or IsThisModelAHeli(GetEntityModel(y)) or
                                IsThisModelABike(GetEntityModel(y)))
                     then
                        for z, Q in ipairs(f) do
                            outside = Q.driveIn
                            if LSC_Config.oldenter then
                                if #(vec3(outside.position) - GetEntityCoords(R)) <= m(5) then
                                    if
                                        not aj(
                                            LSC_Config.ModelBlacklist,
                                            GetDisplayNameFromVehicleModel(GetEntityModel(y)):lower()
                                        )
                                     then
                                        if Q.locked then
                                            if not LSC_Config.lock then
                                                if IsControlJustPressed(1, 201) then
                                                    b = true
                                                    d = Q
                                                    e = z
                                                    P()
                                                else
                                                    tXTRA.DrawText(
                                                        0.5,
                                                        0.8,
                                                        "Press ~b~ENTER~w~ to enter ~b~Los Santos Customs~w~",
                                                        1.0,
                                                        4,
                                                        0
                                                    )
                                                end
                                            else
                                                tXTRA.DrawText(0.5, 0.8, "~r~Locked, please wait~w~", 1.0, 4, 0)
                                            end
                                        else
                                            if IsControlJustPressed(1, 201) then
                                                b = true
                                                d = Q
                                                e = z
                                                P()
                                            else
                                                tXTRA.DrawText(
                                                    0.5,
                                                    0.8,
                                                    "Press ~b~ENTER~w~ to enter ~b~Los Santos Customs~w~",
                                                    1.0,
                                                    4,
                                                    0
                                                )
                                            end
                                        end
                                    else
                                        tXTRA.DrawText(0.5, 0.8, "~r~This vehicle can't be upgraded~w~", 1.0, 4, 0)
                                    end
                                end
                            else
                                if
                                    math.abs(GetEntityHeading(y) - outside.heading) <= 90 and IsVehicleStopped(y) and
                                        GetDistanceBetweenCoords(outside.position, GetEntityCoords(R)) <= m(5)
                                 then
                                    if
                                        not aj(
                                            LSC_Config.ModelBlacklist,
                                            GetDisplayNameFromVehicleModel(GetEntityModel(y)):lower()
                                        )
                                     then
                                        if Q.locked then
                                            if not LSC_Config.lock then
                                                b = true
                                                d = Q
                                                e = z
                                                P()
                                            else
                                                tXTRA.DrawText(0.5, 0.8, "~r~Locked, please wait~w~", 1.0, 4, 0)
                                            end
                                        else
                                            b = true
                                            d = Q
                                            e = z
                                            P()
                                        end
                                    else
                                        tXTRA.DrawText(0.5, 0.8, "~r~This vehicle can't be upgraded~w~", 1.0, 4, 0)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
)
function A:OnMenuClose(H)
    a2(d.outside.position)
end
function A:onSelectedIndexChanged(name, am)
    name = name:lower()
    local H = A.currentmenu
    local I = am.price or 0
    local y = h.vehicle
    p = H.parent or self.name
    if H == "main" then
        H = self
    end
    CheckPurchases(H)
    H = H.name:lower()
    p = p:lower()
    if H == "chrome" or H == "classic" or H == "matte" or H == "metals" then
        if p == "primary color" then
            SetVehicleColours(y, am.colorindex, h.color[2])
        else
            SetVehicleColours(y, h.color[1], am.colorindex)
        end
    elseif H == "metallic" then
        if p == "primary color" then
            SetVehicleColours(y, am.colorindex, h.color[2])
            SetVehicleExtraColours(y, h.color[2], h.extracolor[2])
        else
            SetVehicleColours(y, h.color[1], am.colorindex)
            SetVehicleExtraColours(y, am.colorindex, h.extracolor[2])
        end
    elseif H == "wheel color" then
        SetVehicleExtraColours(y, h.extracolor[1], am.colorindex)
    elseif am.modtype and am.mod then
        if am.modtype ~= 18 and am.modtype ~= 22 then
            if am.wtype then
                SetVehicleWheelType(y, am.wtype)
            end
            SetVehicleMod(y, am.modtype, am.mod)
        elseif am.modtype == 22 then
            ToggleVehicleMod(y, am.modtype, am.mod)
        elseif am.modtype == 18 then
        end
    elseif H == "license" then
        SetVehicleNumberPlateTextIndex(y, am.plateindex)
    elseif H == "neon color" then
        if h.neon then
            SetVehicleNeonLightsColour(y, am.neon[1], am.neon[2], am.neon[3])
        else
            A:showNotification("You don't have neon lights installed.")
        end
    elseif H == "xenon color" then
        if h.mods[22].mod == 1 then
            SetVehicleHeadlightsColour(y, am.xenon)
        else
            A:showNotification("You don't have xenon headlights installed.")
        end
    elseif H == "windows" then
        SetVehicleWindowTint(y, am.tint)
    else
    end
    if H == "horn" then
        OverrideVehHorn(y, false, 0)
        if IsHornActive(y) or IsControlPressed(1, 86) then
            StartVehicleHorn(y, 10000, "HELDDOWN", 1)
        end
    end
end
function A:onButtonSelected(name, am)
    local H = A.currentmenu
    if H == "main" then
        H = A
    end
    local mname = H.name:lower()
    if mname == "neon color" then
        if not h.neon then
            A:showNotification("You don't have neon lights installed.")
            return
        end
    elseif mname == "xenon color" then
        if h.mods[22].mod ~= 1 then
            A:showNotification("You don't have xenon headlights installed.")
            return
        end
    end
    TriggerServerEvent("LSC:buttonSelected", name, am)
end
RegisterNetEvent("LSC:buttonSelected")
AddEventHandler(
    "LSC:buttonSelected",
    function(name, am, an)
        name = name:lower()
        local H = A.currentmenu
        local I = am.price or 0
        local y = h.vehicle
        if H == "main" then
            H = A
        end
        mname = H.name:lower()
        if am.name:lower() == mname then
            return
        end
        if mname == "chrome" or mname == "classic" or mname == "matte" or mname == "metals" then
            if H.parent == "Primary color" then
                if am.name == "Stock" or am.purchased or CanPurchase(I, an) then
                    h.color[1] = am.colorindex
                end
            else
                if am.name == "Stock" or am.purchased or CanPurchase(I, an) then
                    h.color[2] = am.colorindex
                end
            end
        elseif mname == "metallic" then
            if H.parent == "Primary color" then
                if am.name == "Stock" or am.purchased or CanPurchase(I, an) then
                    h.color[1] = am.colorindex
                    h.extracolor[1] = h.color[2]
                end
            else
                if am.name == "Stock" or am.purchased or CanPurchase(I, an) then
                    h.extracolor[1] = am.colorindex
                    h.color[2] = am.colorindex
                end
            end
        end
        if
            mname == "liveries" or mname == "hydraulics" or mname == "horn" or mname == "tank" or mname == "ornaments" or
                mname == "arch cover" or
                mname == "aerials" or
                mname == "roof scoops" or
                mname == "doors" or
                mname == "roll cage" or
                mname == "engine block" or
                mname == "cam cover" or
                mname == "strut brace" or
                mname == "trim design" or
                mname == "ormnametns" or
                mname == "dashboard" or
                mname == "dials" or
                mname == "seats" or
                mname == "steering wheels" or
                mname == "plate holder" or
                mname == "vanity plates" or
                mname == "shifter leavers" or
                mname == "plaques" or
                mname == "speakers" or
                mname == "trunk" or
                mname == "armor" or
                mname == "suspension" or
                mname == "transmission" or
                mname == "brakes" or
                mname == "engine tunes" or
                mname == "roof" or
                mname == "hood" or
                mname == "grille" or
                mname == "roll cage" or
                mname == "exhausts" or
                mname == "skirts" or
                mname == "rear bumpers" or
                mname == "front bumpers" or
                mname == "spoiler"
         then
            if am.name == "Stock" or am.purchased or CanPurchase(I, an) then
                h.mods[am.modtype].mod = am.mod
                SetVehicleMod(y, am.modtype, am.mod)
            end
        elseif mname == "fenders" then
            if am.name == "Stock" or am.purchased or CanPurchase(I, an) then
                if am.name == "Stock" then
                    h.mods[8].mod = am.mod
                    h.mods[9].mod = am.mod
                    SetVehicleMod(y, 9, am.mod)
                    SetVehicleMod(y, 8, am.mod)
                else
                    h.mods[am.modtype].mod = am.mod
                    SetVehicleMod(y, am.modtype, am.mod)
                end
            end
        elseif mname == "turbo" or mname == "headlights" then
            if am.name == "None" or am.name == "Stock Lights" or am.purchased or CanPurchase(I, an) then
                h.mods[am.modtype].mod = am.mod
                ToggleVehicleMod(y, am.modtype, am.mod)
                if mname == "headlights" then
                    h.xenoncolor = -1
                end
            end
        elseif mname == "neon layout" then
            if am.name == "None" then
                SetVehicleNeonLightEnabled(y, 0, false)
                SetVehicleNeonLightEnabled(y, 1, false)
                SetVehicleNeonLightEnabled(y, 2, false)
                SetVehicleNeonLightEnabled(y, 3, false)
                h.neon = false
                h.neoncolor[1] = 255
                h.neoncolor[2] = 255
                h.neoncolor[3] = 255
                SetVehicleNeonLightsColour(y, 255, 255, 255)
            elseif am.purchased or CanPurchase(I, an) then
                if not h.neoncolor[1] then
                    h.neoncolor[1] = 255
                    h.neoncolor[2] = 255
                    h.neoncolor[3] = 255
                end
                SetVehicleNeonLightsColour(y, h.neoncolor[1], h.neoncolor[2], h.neoncolor[3])
                SetVehicleNeonLightEnabled(y, 0, true)
                SetVehicleNeonLightEnabled(y, 1, true)
                SetVehicleNeonLightEnabled(y, 2, true)
                SetVehicleNeonLightEnabled(y, 3, true)
                h.neon = true
            end
        elseif mname == "neon color" then
            if am.purchased or CanPurchase(I, an) then
                h.neoncolor[1] = am.neon[1]
                h.neoncolor[2] = am.neon[2]
                h.neoncolor[3] = am.neon[3]
                SetVehicleNeonLightsColour(y, am.neon[1], am.neon[2], am.neon[3])
            end
        elseif mname == "xenon color" then
            if am.purchased or CanPurchase(I, an) then
                h.xenoncolor = am.xenon
                SetVehicleHeadlightsColour(y, am.xenon)
            end
        elseif mname == "windows" then
            if am.name == "None" or am.purchased or CanPurchase(I, an) then
                h.windowtint = am.tint
                SetVehicleWindowTint(y, am.tint)
            end
        elseif mname == "remote dashcams" then
            if am.name == "None" or am.purchased or CanPurchase(I, an) then
                h.remoteDashcams = am.mod
            end
        elseif mname == "vehicle blips" then
            if am.name == "None" or am.purchased or CanPurchase(I, an) then
                h.remoteVehicleBlips = am.mod
            end
        elseif mname == "biometric lock" then
            if am.name == "None" or am.purchased or CanPurchase(I, an) then
                h.securityBiometricLock = am.mod
            end
        elseif mname == "custom exhausts" then
            if am.name == "Default" or am.purchased or CanPurchase(I, an) then
                h.engineSounds = am.mod
            end
        elseif
            mname == "sport" or mname == "muscle" or mname == "lowrider" or mname == "back wheel" or
                mname == "front wheel" or
                mname == "highend" or
                mname == "suv" or
                mname == "offroad" or
                mname == "tuner"
         then
            if am.purchased or CanPurchase(I, an) then
                h.wheeltype = am.wtype
                h.mods[am.modtype].mod = am.mod
                SetVehicleWheelType(y, am.wtype)
                SetVehicleMod(y, am.modtype, am.mod)
            end
        elseif mname == "wheel color" then
            if am.purchased or CanPurchase(I, an) then
                h.extracolor[2] = am.colorindex
                SetVehicleExtraColours(y, h.extracolor[1], am.colorindex)
            end
        elseif mname == "wheel accessories" then
            if am.name == "Stock Tires" then
                SetVehicleModKit(y, 0)
                SetVehicleMod(y, 23, h.mods[23].mod, false)
                h.mods[23].variation = false
                if IsThisModelABike(GetEntityModel(y)) then
                    SetVehicleModKit(y, 0)
                    SetVehicleMod(y, 24, h.mods[24].mod, false)
                    h.mods[24].variation = false
                end
            elseif am.name == "Custom Tires" and (am.purchased or CanPurchase(I, an)) then
                SetVehicleModKit(y, 0)
                SetVehicleMod(y, 23, h.mods[23].mod, true)
                h.mods[23].variation = true
                if IsThisModelABike(GetEntityModel(y)) then
                    SetVehicleModKit(y, 0)
                    SetVehicleMod(y, 24, h.mods[24].mod, true)
                    h.mods[24].variation = true
                end
            elseif am.name == "Bulletproof Tires" and (am.purchased or CanPurchase(I, an)) then
                if GetVehicleTyresCanBurst(h.vehicle) then
                    h.bulletProofTyres = true
                    SetVehicleTyresCanBurst(y, false)
                else
                    h.bulletProofTyres = false
                    SetVehicleTyresCanBurst(y, true)
                end
            elseif am.smokecolor ~= nil and (am.purchased or CanPurchase(I, an)) then
                SetVehicleModKit(y, 0)
                h.mods[20].mod = true
                ToggleVehicleMod(y, 20, true)
                h.smokecolor = am.smokecolor
                SetVehicleTyreSmokeColor(y, am.smokecolor[1], am.smokecolor[2], am.smokecolor[3])
            end
        elseif mname == "license" then
            if am.purchased or CanPurchase(I, an) then
                h.plateindex = am.plateindex
                SetVehicleNumberPlateTextIndex(y, am.plateindex)
            end
        elseif mname == "main" then
            if name == "repair vehicle" then
                if CanPurchase(I, an) then
                    h.repair()
                    A:ChangeMenu("categories")
                end
            end
        end
        CheckPurchases(H)
    end
)
RegisterNetEvent("LSC:applyModifications")
AddEventHandler(
    "LSC:applyModifications",
    function(ao, ap)
        if ao and ap then
            SetVehicleModKit(ao, 0)
            SetVehicleColours(ao, ap.color[1], ap.color[2])
            SetVehicleExtraColours(ao, ap.extraColor[1], ap.extraColor[2])
            SetVehicleNeonLightEnabled(ao, 0, ap.neon)
            SetVehicleNeonLightEnabled(ao, 1, ap.neon)
            SetVehicleNeonLightEnabled(ao, 2, ap.neon)
            SetVehicleNeonLightEnabled(ao, 3, ap.neon)
            SetVehicleNeonLightsColour(ao, ap.neonColor[1], ap.neonColor[2], ap.neonColor[3])
            SetVehicleHeadlightsColour(ao, ap.xenonColor)
            SetVehicleTyreSmokeColor(ao, ap.smokeColor[1], ap.smokeColor[2], ap.smokeColor[3])
            SetVehicleWheelType(ao, ap.wheelType)
            SetVehicleTyresCanBurst(ao, ap.bulletProofTyres)
            SetVehicleWindowTint(ao, ap.windowTint)
            SetVehicleNumberPlateTextIndex(ao, ap.plateIndex)
            setVehicleIdBiometricLock(ao, ap.biometric)
            DecorSetBool(ao, "dashcam", ap.dashcam)
            DecorSetBool(ao, "vehicleblip", ap.remoteblips)
            DecorSetInt(ao, "lsAudioId", ap.customexhausts)
            for al, M in pairs(ap.mods) do
                al = tonumber(al)
                if al == 18 or al == 22 then
                    ToggleVehicleMod(ao, al, M.mod)
                elseif al == 23 or al == 24 then
                    SetVehicleMod(ao, al, M.mod, M.variation)
                else
                    SetVehicleMod(ao, al, M.mod)
                end
            end
        end
    end
)
local function aq(ar, as, at, au)
    SetIbuttons(
        {
            {GetControlInstructionalButton(1, A.config.controls.menu_back, 0), "Back"},
            {GetControlInstructionalButton(1, A.config.controls.menu_select, 0), "Select"},
            {GetControlInstructionalButton(1, A.config.controls.menu_up, 0), "Up"},
            {GetControlInstructionalButton(1, A.config.controls.menu_down, 0), "Down"},
            {GetControlInstructionalButton(1, A.config.controls.menu_left, 0), "Left"},
            {GetControlInstructionalButton(1, A.config.controls.menu_right, 0), "Right"},
            {GetControlInstructionalButton(1, 0, 0), "Free camera"}
        },
        0
    )
    SetCamActive(j, true)
    local y = h.vehicle
    local ae = GetEntityBoneIndexByName(y, ar)
    local av, aw, ax = table.unpack(GetWorldPositionOfEntityBone(y, ae))
    local ay, az, aA = table.unpack(GetOffsetFromEntityGivenWorldCoords(y, av, aw, ax))
    local a9, aa, aB = table.unpack(GetOffsetFromEntityInWorldCoords(y, ay + m(as), az + m(at), aA + m(au)))
    SetCamCoord(j, a9, aa, aB)
    PointCamAtCoord(j, GetOffsetFromEntityInWorldCoords(y, 0, az, aA))
    RenderScriptCams(1, 1, 1000, 0, 0)
end
local function aC(Q, a9, aa, aB)
    SetIbuttons(
        {
            {GetControlInstructionalButton(1, A.config.controls.menu_back, 0), "Back"},
            {GetControlInstructionalButton(1, A.config.controls.menu_select, 0), "Select"},
            {GetControlInstructionalButton(1, A.config.controls.menu_up, 0), "Up"},
            {GetControlInstructionalButton(1, A.config.controls.menu_down, 0), "Down"},
            {GetControlInstructionalButton(1, A.config.controls.menu_left, 0), "Left"},
            {GetControlInstructionalButton(1, A.config.controls.menu_right, 0), "Right"},
            {GetControlInstructionalButton(1, 0, 0), "Free camera"}
        },
        0
    )
    SetCamActive(j, true)
    local y = h.vehicle
    local aD, aE, aF = table.unpack(GetEntityCoords(y))
    local aG = GetModelDimensions(GetEntityModel(y))
    local aH, aI, aJ = aG.y * -2, aG.x * -2, aG.z * -2
    local as, at, au
    if Q == "front" then
        as, at, au = table.unpack(GetOffsetFromEntityInWorldCoords(y, m(a9), aH / 2 + m(aa), m(aB)))
    elseif Q == "front-top" then
        as, at, au = table.unpack(GetOffsetFromEntityInWorldCoords(y, m(a9), aH / 2 + m(aa), aJ + m(aB)))
    elseif Q == "back" then
        as, at, au = table.unpack(GetOffsetFromEntityInWorldCoords(y, m(a9), -(aH / 2) + m(aa), m(aB)))
    elseif Q == "back-top" then
        as, at, au = table.unpack(GetOffsetFromEntityInWorldCoords(y, m(a9), -(aH / 2) + m(aa), aJ / 2 + m(aB)))
    elseif Q == "left" then
        as, at, au = table.unpack(GetOffsetFromEntityInWorldCoords(y, -(aI / 2) + m(a9), m(aa), m(aB)))
    elseif Q == "right" then
        as, at, au = table.unpack(GetOffsetFromEntityInWorldCoords(y, aI / 2 + m(a9), m(aa), m(aB)))
    elseif Q == "middle" then
        as, at, au = table.unpack(GetOffsetFromEntityInWorldCoords(y, m(a9), m(aa), aJ / 2 + m(aB)))
    end
    SetCamCoord(j, as, at, au)
    PointCamAtCoord(j, GetOffsetFromEntityInWorldCoords(y, 0, 0, m(0)))
    RenderScriptCams(1, 1, 1000, 0, 0)
end
function A:OnMenuChange(aK, aL)
    UnfakeVeh()
    if aK == "main" then
        aK = self
    end
    if aK.name == "categories" and aL.name == "main" then
        A:Close()
    end
    c = aL.name:lower()
    if c == "front bumpers" then
        aC("front", -0.6, 1.5, 0.4)
    elseif c == "rear bumpers" then
        aC("back", -0.5, -1.5, 0.2)
    elseif c == "Engine Tunes" then
    elseif c == "exhausts" then
    elseif c == "hood" then
        aC("front-top", -0.5, 1.3, 1.0)
    elseif c == "headlights" then
        aC("front", -0.6, 1.3, 0.6)
    elseif c == "license" or c == "plate holder" then
        aC("back", 0, -1, 0.2)
    elseif c == "vanity plates" then
        aC("front", -0.3, 0.8, 0.3)
    elseif c == "roof" then
    elseif c == "fenders" then
        aC("left", -1.8, -1.3, 0.7)
    elseif c == "grille" then
    elseif c == "skirts" then
        aC("left", -1.8, -1.3, 0.7)
    elseif c == "spoiler" then
        aC("back", 0.5, -1.6, 1.3)
    elseif c == "back wheel" then
        aq("wheel_lr", -1.4, 0, 0.3)
    elseif
        c == "front wheel" or c == "wheel accessories" or c == "wheel color" or c == "sport" or c == "muscle" or
            c == "lowrider" or
            c == "highend" or
            c == "suv" or
            c == "offroad" or
            c == "tuner"
     then
        aq("wheel_lf", -1.4, 0, 0.3)
    elseif c == "neon color" then
        aq("neon_l", -2.0, 2.0, 0.4)
    elseif
        c == "shifter leavers" or c == "trim design" or c == "ornaments" or c == "dashboard" or c == "dials" or
            c == "seats" or
            c == "steering wheels"
     then
        SetFollowVehicleCamViewMode(4)
    elseif c == "doors" and aK.name:lower() == "interior" then
        SetVehicleDoorOpen(h.vehicle, 0, 0, 0)
        SetVehicleDoorOpen(h.vehicle, 1, 0, 0)
    elseif c == "trunk" then
        SetVehicleDoorOpen(h.vehicle, 5, 0, 0)
    elseif c == "speakers" or c == "engine block" or c == "air filter" or c == "strut brace" or c == "cam cover" then
        SetVehicleDoorOpen(h.vehicle, 5, 0, 0)
        SetVehicleDoorOpen(h.vehicle, 4, 0, 0)
    elseif IsCamActive(j) then
        SetCamCoord(j, GetGameplayCamCoords())
        SetCamRot(j, GetGameplayCamRot(2), 2)
        RenderScriptCams(1, 1, 0, 0, 0)
        RenderScriptCams(0, 1, 1000, 0, 0)
        SetCamActive(i, true)
        EnableGameplayCam(true)
        SetCamActive(j, false)
        SetIbuttons(
            {
                {GetControlInstructionalButton(1, A.config.controls.menu_back, 0), "Back"},
                {GetControlInstructionalButton(1, A.config.controls.menu_select, 0), "Select"},
                {GetControlInstructionalButton(1, A.config.controls.menu_up, 0), "Up"},
                {GetControlInstructionalButton(1, A.config.controls.menu_down, 0), "Down"},
                {GetControlInstructionalButton(1, A.config.controls.menu_left, 0), "Left"},
                {GetControlInstructionalButton(1, A.config.controls.menu_right, 0), "Right"}
            },
            0
        )
    else
        SetVehicleDoorShut(h.vehicle, 0, 0)
        SetVehicleDoorShut(h.vehicle, 1, 0)
        SetVehicleDoorShut(h.vehicle, 4, 0)
        SetVehicleDoorShut(h.vehicle, 5, 0)
        SetFollowVehicleCamViewMode(0)
    end
end
function CheckPurchases(H)
    name = H.name:lower()
    if name == "chrome" or name == "classic" or name == "matte" or name == "metals" or name == "metallic" then
        if H.parent == "Primary color" then
            for z, ae in pairs(H.buttons) do
                if h.color[1] ~= nil then
                    if ae.colorindex == h.color[1] then
                        ae.purchased = true
                        ae.sprite = "garage"
                    else
                        ae.purchased = false
                        ae.sprite = nil
                    end
                end
            end
        else
            for z, ae in pairs(H.buttons) do
                if h.color[2] ~= nil then
                    if ae.colorindex == h.color[2] then
                        ae.purchased = true
                        ae.sprite = "garage"
                    else
                        ae.purchased = false
                        ae.sprite = nil
                    end
                end
            end
        end
    elseif
        name == "armor" or name == "suspension" or name == "transmission" or name == "brakes" or name == "engine tunes" or
            name == "roof" or
            name == "fenders" or
            name == "hood" or
            name == "grille" or
            name == "roll cage" or
            name == "exhausts" or
            name == "skirts" or
            name == "rear bumpers" or
            name == "front bumpers" or
            name == "spoiler"
     then
        for z, ae in pairs(H.buttons) do
            if ae.mod == -1 then
                if h.mods[ae.modtype].mod == -1 then
                    if ae.purchased ~= nil then
                        ae.purchased = true
                    end
                    ae.sprite = "garage"
                else
                    if ae.purchased ~= nil then
                        ae.purchased = false
                    end
                    ae.sprite = nil
                end
            elseif ae.mod == 0 or ae.mod == false then
                if h.mods[ae.modtype].mod == false or h.mods[ae.modtype].mod == 0 then
                    if ae.purchased ~= nil then
                        ae.purchased = true
                    end
                    ae.sprite = "garage"
                else
                    if ae.purchased ~= nil then
                        ae.purchased = false
                    end
                    ae.sprite = nil
                end
            else
                if h.mods[ae.modtype].mod == ae.mod then
                    if ae.purchased ~= nil then
                        ae.purchased = true
                    end
                    ae.sprite = "garage"
                else
                    if ae.purchased ~= nil then
                        ae.purchased = false
                    end
                    ae.sprite = nil
                end
            end
        end
    elseif name == "neon layout" then
        for z, ae in pairs(H.buttons) do
            if ae.name == "None" then
                if
                    IsVehicleNeonLightEnabled(h.vehicle, 0) == false and
                        IsVehicleNeonLightEnabled(h.vehicle, 1) == false and
                        IsVehicleNeonLightEnabled(h.vehicle, 2) == false and
                        IsVehicleNeonLightEnabled(h.vehicle, 3) == false
                 then
                    ae.sprite = "garage"
                else
                    ae.sprite = nil
                end
            elseif ae.name == "Front,Back and Sides" then
                if
                    IsVehicleNeonLightEnabled(h.vehicle, 0) and IsVehicleNeonLightEnabled(h.vehicle, 1) and
                        IsVehicleNeonLightEnabled(h.vehicle, 2) and
                        IsVehicleNeonLightEnabled(h.vehicle, 3)
                 then
                    ae.sprite = "garage"
                else
                    ae.sprite = nil
                end
            end
        end
    elseif name == "neon color" then
        for z, ae in pairs(H.buttons) do
            if ae.neon[1] == h.neoncolor[1] and ae.neon[2] == h.neoncolor[2] and ae.neon[3] == h.neoncolor[3] then
                ae.sprite = "garage"
            else
                ae.sprite = nil
            end
        end
    elseif name == "xenon color" then
        for z, ae in pairs(H.buttons) do
            if h.xenoncolor ~= nil then
                if ae.xenon == h.xenoncolor then
                    ae.purchased = true
                    ae.sprite = "garage"
                else
                    ae.purchased = false
                    ae.sprite = nil
                end
            end
        end
    elseif name == "windows" then
        for z, ae in pairs(H.buttons) do
            if h.windowtint ~= nil then
                if h.windowtint == ae.tint then
                    purchased = true
                    ae.sprite = "garage"
                else
                    purchased = false
                    ae.sprite = nil
                end
            end
        end
    elseif name == "remote dashcams" then
        for z, ae in pairs(H.buttons) do
            if h.remoteDashcams ~= nil then
                if h.remoteDashcams == ae.mod then
                    purchased = true
                    ae.sprite = "garage"
                else
                    purchased = false
                    ae.sprite = nil
                end
            end
        end
    elseif name == "vehicle blips" then
        for z, ae in pairs(H.buttons) do
            if h.remoteVehicleBlips ~= nil then
                if h.remoteVehicleBlips == ae.mod then
                    purchased = true
                    ae.sprite = "garage"
                else
                    purchased = false
                    ae.sprite = nil
                end
            end
        end
    elseif name == "biometric lock" then
        for z, ae in pairs(H.buttons) do
            if h.securityBiometricLock ~= nil then
                if h.securityBiometricLock == ae.mod then
                    purchased = true
                    ae.sprite = "garage"
                else
                    purchased = false
                    ae.sprite = nil
                end
            end
        end
    elseif name == "custom exhausts" then
        for z, ae in pairs(H.buttons) do
            if h.engineSounds ~= nil then
                if h.engineSounds == ae.mod then
                    purchased = true
                    ae.sprite = "garage"
                else
                    purchased = false
                    ae.sprite = nil
                end
            end
        end
    elseif
        name == "sport" or name == "muscle" or name == "lowrider" or name == "back wheel" or name == "front wheel" or
            name == "highend" or
            name == "suv" or
            name == "offroad" or
            name == "tuner"
     then
        for z, ae in pairs(H.buttons) do
            if h.mods[ae.modtype].mod == ae.mod and h.wheeltype == ae.wtype then
                ae.sprite = "garage"
            else
                ae.sprite = nil
            end
        end
    elseif name == "wheel color" then
        for z, ae in pairs(H.buttons) do
            if h.extracolor[2] ~= nil then
                if ae.colorindex == h.extracolor[2] then
                    ae.purchased = true
                    ae.sprite = "garage"
                else
                    ae.purchased = false
                    ae.sprite = nil
                end
            end
        end
    elseif name == "wheel accessories" then
        for z, ae in pairs(H.buttons) do
            if ae.name == "Stock Tires" then
                if GetVehicleModVariation(h.vehicle, 23) == false then
                    ae.sprite = "garage"
                else
                    ae.sprite = nil
                end
            elseif ae.name == "Custom Tires" then
                if GetVehicleModVariation(h.vehicle, 23) then
                    ae.sprite = "garage"
                else
                    ae.sprite = nil
                end
            elseif ae.name == "Bulletproof Tires" then
                if GetVehicleTyresCanBurst(h.vehicle) == false then
                    ae.sprite = "garage"
                else
                    ae.sprite = nil
                end
            elseif ae.smokecolor ~= nil then
                local aM = table.pack(GetVehicleTyreSmokeColor(h.vehicle))
                if aM[1] == ae.smokecolor[1] and aM[2] == ae.smokecolor[2] and aM[3] == ae.smokecolor[3] then
                    ae.sprite = "garage"
                else
                    ae.sprite = nil
                end
            end
        end
    elseif name == "license" then
        for z, ae in pairs(H.buttons) do
            if h.plateindex == ae.plateindex then
                ae.sprite = "garage"
            else
                ae.sprite = nil
            end
        end
    elseif
        name == "tank" or name == "ornaments" or name == "arch cover" or name == "aerials" or name == "roof scoops" or
            name == "doors" or
            name == "roll cage" or
            name == "engine block" or
            name == "cam cover" or
            name == "strut brace" or
            name == "trim design" or
            name == "dashboard" or
            name == "dials" or
            name == "seats" or
            name == "steering wheels" or
            name == "plate holder" or
            name == "vanity plates" or
            name == "shifter leavers" or
            name == "plaques" or
            name == "speakers" or
            name == "trunk" or
            name == "headlights" or
            name == "turbo" or
            name == "hydraulics" or
            name == "liveries" or
            name == "horn"
     then
        for z, ae in pairs(H.buttons) do
            if h.mods[ae.modtype].mod == ae.mod then
                ae.sprite = "garage"
            else
                ae.sprite = nil
            end
        end
    end
end
function CanPurchase(I, an)
    if an then
        if A.currentmenu == "main" then
            A:showNotification("Your vehicle has been repaired.")
        else
            A:showNotification("Item purchased.")
        end
        return true
    else
        A:showNotification("You cannot afford this purchase.")
        return false
    end
end
function UnfakeVeh()
    local y = h.vehicle
    SetVehicleModKit(y, 0)
    SetVehicleWheelType(y, h.wheeltype)
    for z, H in pairs(h.mods) do
        if z == 22 or z == 18 then
            ToggleVehicleMod(y, z, H.mod)
        elseif z == 23 or z == 24 then
            SetVehicleMod(y, z, H.mod, H.variation)
        else
            SetVehicleMod(y, z, H.mod)
        end
    end
    SetVehicleColours(y, h.color[1], h.color[2])
    SetVehicleExtraColours(y, h.extracolor[1], h.extracolor[2])
    SetVehicleNeonLightsColour(y, h.neoncolor[1], h.neoncolor[2], h.neoncolor[3])
    SetVehicleHeadlightsColour(y, h.xenoncolor)
    SetVehicleNumberPlateTextIndex(y, h.plateindex)
    SetVehicleWindowTint(y, h.windowtint)
end
AddEventHandler(
    "XTRA:onClientSpawn",
    function(aN, aO)
        if aO then
            TriggerServerEvent("getGarageInfo")
            FreezeEntityPosition(GetPlayerPed(-1), false)
            local H = function(n)
            end
            local aP = function(n)
            end
            local p = function(n)
            end
            for aQ, aR in pairs(f) do
                tXTRA.addBlip(aR.inside.position.x, aR.inside.position.y, aR.inside.position.z, 72, nil, "LS Customs")
            end
        end
    end
)
RegisterNetEvent("lockGarage")
AddEventHandler(
    "lockGarage",
    function(aS)
        for z, aT in ipairs(aS) do
            f[z].locked = aT.locked
        end
    end
)
local aU = nil
function SetIbuttons(aV, aW)
    Citizen.CreateThread(
        function()
            if not HasScaleformMovieLoaded(aU) then
                aU = RequestScaleformMovie("INSTRUCTIONAL_BUTTONS")
                while not HasScaleformMovieLoaded(aU) do
                    Citizen.Wait(0)
                end
            else
                aU = RequestScaleformMovie("INSTRUCTIONAL_BUTTONS")
                while not HasScaleformMovieLoaded(aU) do
                    Citizen.Wait(0)
                end
            end
            local aX = aU
            local _, aR = GetScreenResolution()
            PushScaleformMovieFunction(aX, "CLEAR_ALL")
            PopScaleformMovieFunction()
            PushScaleformMovieFunction(aX, "SET_DISPLAY_CONFIG")
            PushScaleformMovieFunctionParameterInt(_)
            PushScaleformMovieFunctionParameterInt(aR)
            PushScaleformMovieFunctionParameterFloat(0.03)
            PushScaleformMovieFunctionParameterFloat(0.98)
            PushScaleformMovieFunctionParameterFloat(0.01)
            PushScaleformMovieFunctionParameterFloat(0.95)
            PushScaleformMovieFunctionParameterBool(true)
            PushScaleformMovieFunctionParameterBool(false)
            PushScaleformMovieFunctionParameterBool(false)
            PushScaleformMovieFunctionParameterInt(_)
            PushScaleformMovieFunctionParameterInt(aR)
            PopScaleformMovieFunction()
            PushScaleformMovieFunction(aX, "SET_MAX_WIDTH")
            PushScaleformMovieFunctionParameterInt(1)
            PopScaleformMovieFunction()
            for z, btn in pairs(aV) do
                PushScaleformMovieFunction(aX, "SET_DATA_SLOT")
                PushScaleformMovieFunctionParameterInt(z - 1)
                PushScaleformMovieFunctionParameterString(btn[1])
                PushScaleformMovieFunctionParameterString(btn[2])
                PopScaleformMovieFunction()
            end
            if aW ~= 1 then
                PushScaleformMovieFunction(aX, "SET_PADDING")
                PushScaleformMovieFunctionParameterInt(10)
                PopScaleformMovieFunction()
            end
            PushScaleformMovieFunction(aX, "DRAW_INSTRUCTIONAL_BUTTONS")
            PushScaleformMovieFunctionParameterInt(aW)
            PopScaleformMovieFunction()
        end
    )
end
function DrawIbuttons()
    if HasScaleformMovieLoaded(aU) then
        DrawScaleformMovie(aU, 0.5, 0.5, 1.0, 1.0, 255, 255, 255, 255)
    end
end
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            if b then
                SetLocalPlayerVisibleLocally(1)
            end
            if A:isVisible() then
                DrawIbuttons()
                if IsDisabledControlJustPressed(1, 0) or IsControlJustPressed(1, 0) then
                    if j and IsCamActive(j) then
                        SetCamCoord(j, GetGameplayCamCoords())
                        SetCamRot(j, GetGameplayCamRot(2), 2)
                        RenderScriptCams(1, 1, 0, 0, 0)
                        RenderScriptCams(0, 1, 1000, 0, 0)
                        SetCamActive(i, true)
                        EnableGameplayCam(true)
                        SetCamActive(j, false)
                        SetIbuttons(
                            {
                                {GetControlInstructionalButton(1, A.config.controls.menu_back, 0), "Back"},
                                {GetControlInstructionalButton(1, A.config.controls.menu_select, 0), "Select"},
                                {GetControlInstructionalButton(1, A.config.controls.menu_up, 0), "Up"},
                                {GetControlInstructionalButton(1, A.config.controls.menu_down, 0), "Down"},
                                {GetControlInstructionalButton(1, A.config.controls.menu_left, 0), "Left"},
                                {GetControlInstructionalButton(1, A.config.controls.menu_right, 0), "Right"}
                            },
                            0
                        )
                    end
                end
            end
        end
    end
)
function tXTRA.isInsideLsCustoms()
    return b
end
