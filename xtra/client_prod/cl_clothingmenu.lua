RMenu.Add(
    "XTRAclothing",
    "mainMenu",
    RageUI.CreateMenu("", "Clothing Store", tXTRA.getRageUIMenuWidth(), tXTRA.getRageUIMenuHeight(), "xtra_clothesui", "xtra_clothesui")
)
RMenu.Add("XTRAclothing", "changePed", RageUI.CreateSubMenu(RMenu:Get("XTRAclothing", "mainMenu"), "", "Change Gender"))
RMenu.Add(
    "XTRAclothing",
    "changeClothing",
    RageUI.CreateSubMenu(RMenu:Get("XTRAclothing", "mainMenu"), "", "Change your Clothes")
)
RMenu.Add("XTRAclothing", "clearProps", RageUI.CreateSubMenu(RMenu:Get("XTRAclothing", "mainMenu"), "", "Clear Props"))
local a = {
    {name = "Hats / Helmets", index = 0, listIndex = 1, type = "prop", currentListIndex = 1, textureN = 0},
    {name = "Glasses", index = 1, listIndex = 1, type = "prop", currentListIndex = 1, textureN = 0},
    {name = "Ear Accessories", index = 2, listIndex = 1, type = "prop", currentListIndex = 1, textureN = 0},
    {name = "Face", index = 0, listIndex = 1, type = "drawable", currentListIndex = 1, textureN = 0},
    {name = "Mask", index = 1, listIndex = 1, type = "drawable", currentListIndex = 1, textureN = 0},
    {name = "Hair", index = 2, listIndex = 1, type = "drawable", currentListIndex = 1, textureN = 0},
    {name = "Shirts / Jackets", index = 11, listIndex = 1, type = "drawable", currentListIndex = 1, textureN = 0},
    {name = "Arms / Torso", index = 3, listIndex = 1, type = "drawable", currentListIndex = 1, textureN = 0},
    {name = "Watches", index = 6, listIndex = 1, type = "prop", currentListIndex = 1, textureN = 0},
    {name = "Bracelets", index = 7, listIndex = 1, type = "prop", currentListIndex = 1, textureN = 0},
    {name = "Undershirt", index = 8, listIndex = 1, type = "drawable", currentListIndex = 1, textureN = 0},
    {name = "Legs", index = 4, listIndex = 1, type = "drawable", currentListIndex = 1, textureN = 0},
    {name = "Shoes", index = 6, listIndex = 1, type = "drawable", currentListIndex = 1, textureN = 0},
    {name = "Bags", index = 5, listIndex = 1, type = "drawable", currentListIndex = 1, textureN = 0},
    {name = "Vests", index = 9, listIndex = 1, type = "drawable", currentListIndex = 1, textureN = 0},
    {name = "Accessories", index = 7, listIndex = 1, type = "drawable", currentListIndex = 1, textureN = 0},
    {name = "Badges", index = 10, listIndex = 1, type = "drawable", currentListIndex = 1, textureN = 0}
}
local b
local c = 1
local d
local e = 0
local f = {}
local g = {}
local h = false
local i = 1
local j = 0
local k = {}
local l = false
local m = false
local n = false
local o = {}
local p = tXTRA.getPlayerPed()
local q = false
local r = {
    vector3(72.2545394897461, -1399.10229492188, 29.3761386871338),
    vector3(449.81854248047, -993.30865478516, 30.689584732056),
    vector3(-703.77685546875, -152.258544921875, 37.4151458740234),
    vector3(-167.863754272461, -298.969482421875, 39.7332878112793),
    vector3(428.694885253906, -800.1064453125, 29.4911422729492),
    vector3(-829.413269042969, -1073.71032714844, 11.3281078338623),
    vector3(-1193.42956542969, -772.262329101563, 17.3244285583496),
    vector3(-1447.7978515625, -242.461242675781, 49.8207931518555),
    vector3(11.6323690414429, 6514.224609375, 31.8778476715088),
    vector3(1696.29187011719, 4829.3125, 42.0631141662598),
    vector3(123.64656829834, -219.440338134766, 54.5578384399414),
    vector3(618.093444824219, 2759.62939453125, 42.0881042480469),
    vector3(1190.55017089844, 2713.44189453125, 38.2226257324219),
    vector3(-3172.49682617188, 1048.13330078125, 20.8632030487061),
    vector3(-1108.44177246094, 2708.92358398438, 19.1078643798828),
    vector3(127.57326507568, -1038.4321289063, 29.555480957031),
    vector3(3538.3896484375, 2568.4819335938, 6.9896564483643),
    vector3(1213.8666992188, -1474.5180664063, 35.073650360107),
    vector3(-437.70687866211, 6010.33203125, 31.716279983521),
    vector3(1439.3804931641, 6331.80078125, 23.954704284668),
    vector3(-1098.4307861328, -831.42083740234, 14.282784461975),
    vector3(243.71351623535, -1370.1625976563, 39.534339904785),
    vector3(1103.0277099609, 197.00813293457, -49.440055847168),
    vector3(298.98516845703, -598.02362060547, 43.284023284912),
    vector3(1839.0124511719, 3689.259765625, 34.270027160645),
    vector3(-253.41467285156, 6309.4458007813, 32.427234649658),
    vector3(902.40808105469, -2115.2661132813, 30.771173477173),
    vector3(-565.46356201172, 287.12573242188, 91.797775268555),
    vector3(1780.2961425781, 2547.8825683594, 45.797790527344),
    vector3(4489.6123046875, -4452.7778320312, 4.366425037384),
    vector3(-443.05731201172, -311.21786499023, 34.910472869873),
    vector3(277.69772338867, -1335.5568847656, 24.537786483765)
}
local s = 1
local t = false
local u = false
local v = {
    ["Hats / Helmets"] = {offset = vector3(0.0, 0.5, 0.8), point = vector3(0.0, 0.0, 0.7), fov = 60.0},
    ["Glasses"] = {offset = vector3(0.0, 0.5, 0.68), point = vector3(0.0, 0.0, 0.68), fov = 49.0},
    ["Ear Accessories"] = {offset = vector3(0.0, 0.5, 0.68), point = vector3(0.0, 0.0, 0.68), fov = 49.0},
    ["Face"] = {offset = vector3(0.0, 0.5, 0.68), point = vector3(0.0, 0.0, 0.68), fov = 49.0},
    ["Mask"] = {offset = vector3(0.0, 0.5, 0.8), point = vector3(0.0, 0.0, 0.7), fov = 60.0},
    ["Hair"] = {offset = vector3(0.0, 0.5, 0.8), point = vector3(0.0, 0.0, 0.7), fov = 60.0},
    ["Shirts / Jackets"] = {offset = vector3(0.0, 1.0, 0.3), point = vector3(0.0, 0.0, 0.3), fov = 70.0},
    ["Arms / Torso"] = {offset = vector3(0.0, 1.0, 0.3), point = vector3(0.0, 0.0, 0.3), fov = 70.0},
    ["Watches"] = {offset = vector3(0.0, 0.8, 0.0), point = vector3(0.0, 0.0, 0.0), fov = 60.0},
    ["Bracelets"] = {offset = vector3(0.0, 0.8, 0.0), point = vector3(0.0, 0.0, 0.0), fov = 60.0},
    ["Undershirt"] = {offset = vector3(0.0, 1.0, 0.3), point = vector3(0.0, 0.0, 0.3), fov = 70.0},
    ["Legs"] = {offset = vector3(0.0, 1.0, -0.4), point = vector3(0.0, 0.0, -0.4), fov = 70.0},
    ["Shoes"] = {offset = vector3(0.0, 0.6, -0.5), point = vector3(0.0, 0.0, -0.9), fov = 60.0},
    ["Bags"] = {offset = vector3(0.0, 1.0, 0.3), point = vector3(0.0, 0.0, 0.3), fov = 70.0},
    ["Vests"] = {offset = vector3(0.0, 1.0, 0.3), point = vector3(0.0, 0.0, 0.3), fov = 70.0},
    ["Accessories"] = {offset = vector3(0.0, 1.2, 0.3), point = vector3(0.0, 0.0, 0.2), fov = 80.0},
    ["Badges"] = {offset = vector3(0.0, 1.2, 0.3), point = vector3(0.0, 0.0, 0.2), fov = 80.0}
}
local w = nil
local x = nil
local y = nil
local z = nil
local function A()
    if k.name ~= z then
        if v[k.name] then
            local B = v[k.name]
            local C = GetEntityCoords(PlayerPedId(), true) + x * B.offset.y + vector3(0.0, 0.0, B.offset.z)
            SetCamParams(w, C.x, C.y, C.z, 0.0, 0.0, 0.0)
            SetCamFov(w, B.fov)
            PointCamAtEntity(w, PlayerPedId(), B.point.x, B.point.y, B.point.z)
        else
        end
        z = k.name
    end
    if not IsPauseMenuActive() then
        DisableAllControlActions(0)
        EnableControlAction(0, 0, true)
        EnableControlAction(0, 1, true)
        EnableControlAction(0, 2, true)
        EnableControlAction(0, 3, true)
        EnableControlAction(0, 4, true)
        EnableControlAction(0, 5, true)
        EnableControlAction(0, 6, true)
        EnableControlAction(0, 30, true)
        EnableControlAction(0, 31, true)
        EnableControlAction(0, 32, true)
        EnableControlAction(0, 33, true)
        EnableControlAction(0, 34, true)
        EnableControlAction(0, 35, true)
        EnableControlAction(0, 249, true)
        EnableControlAction(0, 289, true)
    end
    DisableControlAction(0, 32, true)
    if IsDisabledControlJustPressed(0, 32) then
        TaskAchieveHeading(PlayerPedId(), y + 180.0, -1)
    end
    DisableControlAction(0, 34, true)
    if IsDisabledControlJustPressed(0, 34) then
        TaskAchieveHeading(PlayerPedId(), y - 90.0, -1)
    end
    DisableControlAction(0, 33, true)
    if IsDisabledControlJustPressed(0, 33) then
        TaskAchieveHeading(PlayerPedId(), y, -1)
    end
    DisableControlAction(0, 35, true)
    if IsDisabledControlJustPressed(0, 35) then
        TaskAchieveHeading(PlayerPedId(), y + 90.0, -1)
    end
end
local function D()
    local E = PlayerPedId()
    ClearPedTasksImmediately(E)
    x = GetEntityForwardVector(E)
    y = GetEntityHeading(E)
    TaskAchieveHeading(E, y, -1)
    w = CreateCam("DEFAULT_SCRIPTED_CAMERA", false)
    SetCamActive(w, true)
    RenderScriptCams(true, false, 0, false, false)
    A()
end
local function F()
    if not w then
        return
    end
    ClearPedTasksImmediately(PlayerPedId())
    RenderScriptCams(false, false, 0, false, false)
    SetCamActive(w, false)
    DestroyCam(w, true)
    w = nil
    x = nil
    y = nil
    z = nil
end
Citizen.CreateThread(
    function()
        while true do
            local G = GetEntityCoords(tXTRA.getPlayerPed())
            for H = 1, #r do
                if #(G - r[H]) <= 2.5 and not t then
                    s = H
                    t = true
                    for H = 1, #a, 1 do
                        a[H].currentListIndex = current_clothing(a[H].type, a[H].index, false)
                        a[H].textureN = current_clothing(a[H].type, a[H].index, true)
                    end
                    h = true
                    RageUI.Visible(RMenu:Get("XTRAclothing", "mainMenu"), true)
                elseif s == H then
                    if #(G - r[H]) > 2.5 and t then
                        t = false
                        m = false
                        RageUI.ActuallyCloseAll()
                    end
                    if not RageUI.Visible(RMenu:Get("XTRAclothing", "changeClothing")) then
                        F()
                    end
                end
            end
            Wait(150)
        end
    end
)
local I, J, K = 0, 0, 0
RageUI.CreateWhile(
    1.0,
    true,
    function()
        if not n then
            if RageUI.Visible(RMenu:Get("XTRAclothing", "mainMenu")) then
                RageUI.DrawContent(
                    {header = true, glare = false, instructionalButton = false},
                    function()
                        RageUI.Button(
                            "Clothes",
                            nil,
                            {RightLabel = "→→→"},
                            true,
                            function(L, M, N)
                                if N then
                                    D()
                                end
                            end,
                            RMenu:Get("XTRAclothing", "changeClothing")
                        )
                        if not inOrganHeist then
                            RageUI.Button(
                                "Change Gender",
                                nil,
                                {RightLabel = "→→→"},
                                true,
                                function(L, M, N)
                                end,
                                RMenu:Get("XTRAclothing", "changePed")
                            )
                        end
                        RageUI.Button(
                            "~y~Wardrobe",
                            nil,
                            {RightLabel = "→→→"},
                            true,
                            function(L, M, N)
                                if N then
                                    if tXTRA.isPlusClub() or tXTRA.isPlatClub() then
                                        TriggerEvent("XTRA:openOutfitMenu")
                                    else
                                        tXTRA.notify(
                                            "~y~You need to be a subscriber of XTRA Plus or XTRA Platinum to use this feature."
                                        )
                                        tXTRA.notify("~y~Available @ store.xtrastudios.com")
                                    end
                                end
                            end
                        )
                        if PlayerIsInGang then
                            RageUI.Button(
                                "Apply Gang Outfit",
                                "Applys the outfit set by the Gang Leader.",
                                {RightLabel = "→→→"},
                                true,
                                function(L, M, N)
                                    if N then
                                        TriggerServerEvent("XTRA:applyGangFit", gangID)
                                    end
                                end
                            )
                        end
                        RageUI.Button(
                            "Apply Outfit Code",
                            "Applys an outfit code given by a player with ~y~XTRA Plus~w~ or ~y~XTRA Platinum~w~.",
                            {RightLabel = "→→→"},
                            true,
                            function(L, M, N)
                                if N then
                                    tXTRA.clientPrompt(
                                        "Outfit Code:",
                                        "",
                                        function(O)
                                            local P = string.gsub(O, "%s+", "")
                                            if #P == 5 then
                                                TriggerServerEvent("XTRA:applyOutfitCode", string.upper(P))
                                            else
                                                notify("Outfit code is not in a valid format.")
                                            end
                                        end
                                    )
                                end
                            end
                        )
                        RageUI.Button(
                            "Remove Props",
                            nil,
                            {RightLabel = "→→→"},
                            true,
                            function(L, M, N)
                            end,
                            RMenu:Get("XTRAclothing", "clearProps")
                        )
                    end
                )
            end
            if RageUI.Visible(RMenu:Get("XTRAclothing", "changePed")) then
                RageUI.DrawContent(
                    {header = true, glare = false, instructionalButton = false},
                    function()
                        RageUI.Button(
                            "MP Male",
                            "WARNING: Resets all your Body Options",
                            {},
                            true,
                            function(L, M, N)
                                if N then
                                    if GetEntityHealth(PlayerPedId()) > 102 then
                                        tXTRA.loadCustomisationPreset("DefaultMale")
                                    else
                                        tXTRA.notify("Cannot change gender, you're dead.")
                                    end
                                end
                            end,
                            function()
                            end
                        )
                        RageUI.Button(
                            "MP Female",
                            "WARNING: Resets all your Body Options",
                            {},
                            true,
                            function(L, M, N)
                                if N then
                                    if GetEntityHealth(PlayerPedId()) > 102 then
                                        tXTRA.loadCustomisationPreset("DefaultFemale")
                                    else
                                        tXTRA.notify("Cannot change gender, you're dead.")
                                    end
                                end
                            end,
                            function()
                            end
                        )
                    end
                )
            end
            if RageUI.Visible(RMenu:Get("XTRAclothing", "changeClothing")) then
                RageUI.DrawContent(
                    {header = true, glare = false, instructionalButton = false},
                    function()
                        m = true
                        if h then
                            for H = 1, #a, 1 do
                                local Q = a[H]
                                k = Q
                                k.textureN = current_clothing(Q.type, Q.index, true)
                                if k.textureN == -1 then
                                    k.textureN = 0
                                end
                                RageUI.List(
                                    Q.name,
                                    get_drawables(Q.type, Q.index),
                                    a[H].currentListIndex,
                                    "Current Texture Index: " .. k.textureN .. "/" .. j - 1,
                                    {},
                                    true,
                                    function(L, M, N, O)
                                        if M then
                                            a[H].currentListIndex = current_clothing(Q.type, Q.index, false)
                                            if
                                                IsControlJustPressed(0, 172) or IsControlJustPressed(0, 241) or
                                                    IsControlJustPressed(0, 173) or
                                                    IsControlJustPressed(0, 242)
                                             then
                                                if Q.index ~= k.index then
                                                    k = Q
                                                end
                                            end
                                            if Q.name == k.name then
                                                local p = tXTRA.getPlayerPed()
                                                if l then
                                                    if
                                                        o ~= nil and o["id"] <= #get_drawables(Q.type, Q.index) and
                                                            o["id"] >= 0
                                                     then
                                                        O = o["id"]
                                                        k.textureN = 0
                                                        l = false
                                                    else
                                                        l = false
                                                    end
                                                else
                                                    if k.textureN >= get_textures(k.type, k.index, O) then
                                                        k.textureN = 0
                                                    end
                                                    if I ~= k.index or J ~= O or K ~= k.textureN then
                                                        I = k.index
                                                        J = O
                                                        K = k.textureN
                                                        set_clothing(k.type, k.index, O, k.textureN)
                                                    end
                                                end
                                                a[H].currentListIndex = O
                                            end
                                            A()
                                        end
                                        if N then
                                            k.textureN = k.textureN + 1
                                            if k.textureN >= get_textures(k.type, k.index, O) then
                                                k.textureN = 0
                                            end
                                            if k.index == 2 then
                                                I = k.index
                                                J = O
                                                K = k.textureN
                                                SetPedHairColor(PlayerPedId(), k.textureN, k.textureN)
                                                TriggerServerEvent(
                                                    "XTRA:saveClothingHairData",
                                                    GetPedDrawableVariation(tXTRA.getPlayerPed(), 2),
                                                    GetPedHairColor(tXTRA.getPlayerPed())
                                                )
                                            elseif I ~= k.index or J ~= O or K ~= k.textureN then
                                                I = k.index
                                                J = O
                                                K = k.textureN
                                                set_clothing(k.type, k.index, O, k.textureN)
                                            end
                                        end
                                    end,
                                    function()
                                    end,
                                    nil
                                )
                            end
                        end
                    end
                )
            end
            if RageUI.Visible(RMenu:Get("XTRAclothing", "clearProps")) then
                RageUI.DrawContent(
                    {header = true, glare = false, instructionalButton = false},
                    function()
                        RageUI.Button(
                            "Remove Hat",
                            nil,
                            {},
                            true,
                            function(L, M, N)
                                if N then
                                    ClearPedProp(tXTRA.getPlayerPed(), 0)
                                end
                            end,
                            function()
                            end,
                            nil
                        )
                        RageUI.Button(
                            "Remove Glasses",
                            nil,
                            {},
                            true,
                            function(L, M, N)
                                if N then
                                    ClearPedProp(tXTRA.getPlayerPed(), 1)
                                end
                            end,
                            function()
                            end,
                            nil
                        )
                        RageUI.Button(
                            "Remove Ear Accessory",
                            nil,
                            {},
                            true,
                            function(L, M, N)
                                if N then
                                    ClearPedProp(tXTRA.getPlayerPed(), 2)
                                end
                            end,
                            function()
                            end,
                            nil
                        )
                        RageUI.Button(
                            "Remove Watch",
                            nil,
                            {},
                            true,
                            function(L, M, N)
                                if N then
                                    ClearPedProp(tXTRA.getPlayerPed(), 6)
                                end
                            end,
                            function()
                            end,
                            nil
                        )
                        RageUI.Button(
                            "Remove Bracelet",
                            nil,
                            {},
                            true,
                            function(L, M, N)
                                if N then
                                    ClearPedProp(tXTRA.getPlayerPed(), 7)
                                end
                            end,
                            function()
                            end,
                            nil
                        )
                    end
                )
            end
        end
    end
)
function current_clothing(P, i, R)
    if P == "prop" then
        if R then
            if GetPedPropTextureIndex(tXTRA.getPlayerPed(), i) ~= nil then
                return GetPedPropTextureIndex(tXTRA.getPlayerPed(), i)
            else
                return 0
            end
        else
            if GetPedPropIndex(tXTRA.getPlayerPed(), i) ~= nil then
                if GetPedPropIndex(tXTRA.getPlayerPed(), i) == -1 then
                    return GetPedPropIndex(tXTRA.getPlayerPed(), i) + 2
                else
                    return GetPedPropIndex(tXTRA.getPlayerPed(), i) + 1
                end
            else
                return 0
            end
        end
    elseif P == "drawable" then
        if i == 2 and R then
            return GetPedHairColor(PlayerPedId())
        elseif R then
            if GetPedTextureVariation(tXTRA.getPlayerPed(), i) ~= nil then
                return GetPedTextureVariation(tXTRA.getPlayerPed(), i)
            else
                return 0
            end
        else
            if GetPedDrawableVariation(tXTRA.getPlayerPed(), i) ~= nil then
                return GetPedDrawableVariation(tXTRA.getPlayerPed(), i) + 1
            else
                return 0
            end
        end
    end
end
function set_clothing(S, T, i, U)
    local p = tXTRA.getPlayerPed()
    if S == "drawable" then
        if T == 2 then
            U = 0
        end
        SetPedComponentVariation(p, T, i - 1, U, 0)
        if T == 2 then
            TriggerServerEvent(
                "XTRA:saveClothingHairData",
                GetPedDrawableVariation(tXTRA.getPlayerPed(), 2),
                GetPedHairColor(tXTRA.getPlayerPed())
            )
        end
    elseif S == "prop" then
        if i - 1 == 0 then
            if GetPedPropIndex(p, T) == 0 then
                ClearPedProp(p, i - 1)
            end
        else
            SetPedPropIndex(p, T, i - 1, U, 0)
        end
    end
end
function get_drawables(S, P)
    local p = tXTRA.getPlayerPed()
    local V = GetNumberOfPedDrawableVariations(p, P)
    local W = GetNumberOfPedPropDrawableVariations(p, P)
    if S == "drawable" then
        local d = {"0/" .. V}
        for H = 1, GetNumberOfPedDrawableVariations(p, P), 1 do
            d[#d + 1] = H .. "/" .. V
        end
        return d
    else
        local d = {"0/" .. W}
        for H = 1, GetNumberOfPedPropDrawableVariations(p, P), 1 do
            d[#d + 1] = H .. "/" .. W
        end
        return d
    end
end
function get_facial_features(P)
    numberOfOverlays = {}
    for H = 1, GetPedHeadOverlayNum(P), 1 do
        table.insert(numberOfOverlays, H)
    end
    return numberOfOverlays
end
function get_textures(S, P, i)
    if S == "drawable" then
        if P == 2 then
            j = GetNumHairColors()
            return j
        end
        j = GetNumberOfPedTextureVariations(tXTRA.getPlayerPed(), P, i - 1)
        return j
    else
        j = GetNumberOfPedPropTextureVariations(tXTRA.getPlayerPed(), P, i - 1)
        return j
    end
end
local function X()
    AddTextEntry("FMMC_MPM_NA", "Enter clothing ID you want to wear")
    DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "Enter clothing ID you want to wear", "", "", "", "", 30)
    while UpdateOnscreenKeyboard() == 0 do
        Wait(0)
    end
    if GetOnscreenKeyboardResult() then
        local Y = GetOnscreenKeyboardResult()
        if Y then
            n = false
            local Z = tonumber(Y)
            local p = tXTRA.getPlayerPed()
            if Z ~= nil then
                o["id"] = Z + 1
            else
                o["id"] = k.index
            end
            l = true
            return Y
        end
    end
    n = false
end
Citizen.CreateThread(
    function()
        while true do
            if k.index ~= nil and RageUI.Visible(RMenu:Get("XTRAclothing", "changeClothing")) then
                if IsDisabledControlJustPressed(0, 179) and not n then
                    n = true
                    X()
                end
            end
            Citizen.Wait(0)
        end
    end
)
local function _()
    local a0 = {
        {["label"] = "Enter Clothing ID ", ["button"] = "~INPUT_CELLPHONE_EXTRA_OPTION~"},
        {["label"] = "Change Texture ", ["button"] = "~INPUT_CELLPHONE_SELECT~"},
        {["label"] = "Next Index ", ["button"] = "~INPUT_CELLPHONE_RIGHT~"},
        {["label"] = "Previous Index ", ["button"] = "~INPUT_CELLPHONE_LEFT~"},
        {["label"] = "Face Right", ["button"] = "~INPUT_MOVE_RIGHT_ONLY~"},
        {["label"] = "Face Left", ["button"] = "~INPUT_MOVE_LEFT_ONLY~"},
        {["label"] = "Face Forward", ["button"] = "~INPUT_MOVE_DOWN_ONLY~"},
        {["label"] = "Face Backward", ["button"] = "~INPUT_MOVE_UP_ONLY~"}
    }
    Citizen.CreateThread(
        function()
            Wait(0)
            local a1 = RequestScaleformMovie("instructional_buttons")
            while not HasScaleformMovieLoaded(a1) do
                Wait(0)
            end
            PushScaleformMovieFunction(a1, "CLEAR_ALL")
            PushScaleformMovieFunction(a1, "TOGGLE_MOUSE_BUTTONS")
            PushScaleformMovieFunctionParameterBool(0)
            PopScaleformMovieFunctionVoid()
            for a2, a3 in ipairs(a0) do
                PushScaleformMovieFunction(a1, "SET_DATA_SLOT")
                PushScaleformMovieFunctionParameterInt(a2 - 1)
                PushScaleformMovieMethodParameterButtonName(a3["button"])
                PushScaleformMovieFunctionParameterString(a3["label"])
                PopScaleformMovieFunctionVoid()
            end
            PushScaleformMovieFunction(a1, "DRAW_INSTRUCTIONAL_BUTTONS")
            PushScaleformMovieFunctionParameterInt(-1)
            PopScaleformMovieFunctionVoid()
            while m do
                Wait(0)
                DrawScaleformMovieFullscreen(a1, 255, 255, 255, 255)
            end
            u = false
        end
    )
end
Citizen.CreateThread(
    function()
        while true do
            if m and not u then
                _()
                u = true
            end
            Wait(0)
        end
    end
)
AddEventHandler(
    "XTRA:onClientSpawn",
    function(D, E)
        if E then
            for a4, a5 in pairs(r) do
                tXTRA.addBlip(a5.x, a5.y, a5.z, 73, 3, "Clothing Store", 0.7)
                tXTRA.addMarker(
                    a5.x,
                    a5.y,
                    a5.z,
                    0.6,
                    0.6,
                    0.6,
                    10,
                    255,
                    81,
                    170,
                    50,
                    9,
                    false,
                    false,
                    true,
                    "dp_clothing",
                    "top",
                    90.0,
                    90.0,
                    0.0
                )
            end
        end
    end
)
