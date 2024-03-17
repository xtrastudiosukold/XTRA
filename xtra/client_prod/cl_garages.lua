DecorRegister("xtra_owner", 3)
DecorRegister("xtra_vmodel", 3)
DecorRegister("lootid", 3)
DecorRegister("lsAudioId", 3)
local b = module("xtra-vehicles", "cfg/cfg_garages")
local c = b.garages
local f = ""
local lastvc = nil
local g = nil
local j = nil
VehiclesFetchedTable = {}
local k = {}
local m = {}
local n = nil
local o = false
local p = {spawncode = nil, name = nil, plate = nil}
local q = nil
local r = {}
local s = nil
local v = {}
local x = nil
local y = {}
local z = ""
local A = {}
local B = {}
local C = ""
local D = nil
local E = false
local F = 0
local G = {}
local H = {}
local I = {}
globalVehicleModelHashMapping = {}
globalVehicleOwnership = {}
globalOwnedPlayerVehicles = {}
globalLastSpawnedVehicleTime = 0
local J = {}
local K = {}
local L = {}
local lastvehicle = false
RMenu.Add("XTRAGarages", "main", RageUI.CreateMenu("", "~w~Garages", tXTRA.getRageUIMenuWidth(), tXTRA.getRageUIMenuHeight(), "banners", "garage"))
RMenu.Add("XTRAGarages", "viewboot_weapons", RageUI.CreateSubMenu(RMenu:Get("XTRAGarages", "main")))
RMenu.Add("XTRAGarages", "viewboot_other", RageUI.CreateSubMenu(RMenu:Get("XTRAGarages", "main")))
RMenu.Add("XTRAGarages", "viewboot_ammo", RageUI.CreateSubMenu(RMenu:Get("XTRAGarages", "main")))
RMenu.Add("XTRAGarages", "owned_vehicles", RageUI.CreateSubMenu(RMenu:Get("XTRAGarages", "main")))
RMenu.Add("XTRAGarages", "rented_vehicles", RageUI.CreateSubMenu(RMenu:Get("XTRAGarages", "main")))
RMenu.Add("XTRAGarages", "viewboot", RageUI.CreateSubMenu(RMenu:Get("XTRAGarages", "main")))
RMenu.Add("XTRAGarages", "rented_vehicles_manage", RageUI.CreateSubMenu(RMenu:Get("XTRAGarages", "rented_vehicles")))
RMenu.Add("XTRAGarages", "rented_vehicles_information", RageUI.CreateSubMenu(RMenu:Get("XTRAGarages", "rented_vehicles_manage")))
RMenu.Add("XTRAGarages", "owned_vehicles_submenu", RageUI.CreateSubMenu(RMenu:Get("XTRAGarages", "owned_vehicles")))
RMenu.Add("XTRAGarages", "owned_vehicles_submenu_manage", RageUI.CreateSubMenu(RMenu:Get("XTRAGarages", "owned_vehicles_submenu")))
RMenu.Add("XTRAGarages", "scrap_vehicle_confirmation", RageUI.CreateSubMenu(RMenu:Get("XTRAGarages", "owned_vehicles_submenu_manage")))
RMenu.Add("XTRAGarages", "rented_vehicles_out_manage", RageUI.CreateSubMenu(RMenu:Get("XTRAGarages", "rented_vehicles")))
RMenu.Add("XTRAGarages", "rented_vehicles_out_information", RageUI.CreateSubMenu(RMenu:Get("XTRAGarages", "rented_vehicles_out_manage")))
RMenu.Add("XTRAGarages", "customfolders", RageUI.CreateSubMenu(RMenu:Get("XTRAGarages", "owned_vehicles")))
RMenu.Add("XTRAGarages", "customfoldersvehicles", RageUI.CreateSubMenu(RMenu:Get("XTRAGarages", "customfolders")))
RMenu.Add("XTRAGarages", "settings", RageUI.CreateSubMenu(RMenu:Get("XTRAGarages", "main")))
RMenu:Get("XTRAGarages", "owned_vehicles"):SetSubtitle("~w~Garage Mangement Menu")
function DeleteCar(q)
    if q then
        if DoesEntityExist(q) then
            j = nil
            s = nil
            DeleteEntity(q)
            q = nil
        end
    end
end
local function M(N)
    for F, O in pairs(y) do
        if O == N then
            return true
        end
    end
    return false
end
local function P(N)
    RageUI.ActuallyCloseAll()
    if M(N) then
        RageUI.Visible(RMenu:Get("XTRAGarages", "main"), true)
    end
end
local function Q(N)
    RageUI.ActuallyCloseAll()
    RageUI.Visible(RMenu:Get("XTRAGarages", "main"), false)
end
CreateThread(
    function()
        local R = {}
        local S = {}
        for N, T in pairs(b.garages) do
            for U, V in pairs(T) do
                if U == "_config" then
                    local W, X, Y, Z, _, a0 = V.blipid, V.blipcolor, V.markerid, V.markercolours, V.permissions, V.type
                    for a1, a2 in pairs(b.garageInstances) do
                        local a3, a4, a5 = table.unpack(a2)
                        if N == a3 then
                            if a5 then
                                table.insert(R, {position = a4, blipId = W, blipColor = X, name = a3})
                            end
                            table.insert(S, {position = a4, colour = Z, markerId = Y})
                        end
                    end
                end
            end
        end
        local a6 = function(a7)
            PlaySound(-1, "Hit", "RESPAWN_SOUNDSET", 0, 0, 1)
            h = c[a7.garageType]["_config"].type
            P(a7.garageType)
            f = a7.garageType
            selectedGarageVector = a7.position
        end
        local a8 = function(a7)
            PlaySound(-1, "Hit", "RESPAWN_SOUNDSET", 0, 0, 1)
            Q(a7.garageType)
        end
        local a9 = function(a7)
        end
        for aa, ab in pairs(b.garageInstances) do
            tXTRA.createArea(
                "garage_" .. aa,
                ab[2],
                1.5,
                6,
                a6,
                a8,
                a9,
                {garageType = ab[1], garageId = aa, position = ab[2]}
            )
        end
        for W, ac in pairs(R) do
            tXTRA.addBlip(ac.position.x, ac.position.y, ac.position.z, ac.blipId, ac.blipColor, ac.name, 0.7, false)
        end
        for Y, ad in pairs(S) do
            tXTRA.addMarker(
                ad.position.x,
                ad.position.y,
                ad.position.z,
                0.7,
                0.7,
                0.5,
                ad.colour[1],
                ad.colour[2],
                ad.colour[3],
                125,
                50,
                ad.markerId,
                true
            )
        end
    end
)
local ae = 0
local af = 0.0
local function ag(ah)
    DeleteVehicle(GetVehiclePedIsIn(tXTRA.getPlayerPed(), false))
    CreateThread(
        function()
            local ai = GetHashKey(ah)
            RequestModel(ai)
            local aj = 0
            while not HasModelLoaded(ai) and aj < 200 do
                drawNativeText("~r~Downloading vehicle model")
                Wait(0)
                aj = aj + 1
            end
            if HasModelLoaded(ai) then
                local ak =
                    CreateVehicle(
                    ai,
                    selectedGarageVector.x,
                    selectedGarageVector.y,
                    selectedGarageVector.z + 2.0,
                    af,
                    false,
                    false
                )
                DecorSetInt(ak, decor, 945)
                SetEntityAsMissionEntity(ak)
                FreezeEntityPosition(ak, true)
                SetEntityInvincible(ak, true)
                SetVehicleDoorsLocked(ak, 4)
                SetModelAsNoLongerNeeded(ai)
                if ae ~= 0 then
                    DestroyCam(ae, 0)
                    ae = 0
                end
                SetEntityAlpha(tXTRA.getPlayerPed(), 0)
                FreezeEntityPosition(tXTRA.getPlayerPed(), true)
                SetEntityCollision(tXTRA.getPlayerPed(), false, false)
                SetEntityCollision(ak, false, false)
                local al = GetEntityCoords(tXTRA.getPlayerPed())
                local am = GetEntityRotation(tXTRA.getPlayerPed())
                local an = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
                local ao = vector3(al.x, al.y, al.z + 2.0) - GetEntityForwardVector(tXTRA.getPlayerPed()) * 4.0
                SetCamActive(an, true)
                RenderScriptCams(true, true, 500, 1, 0)
                SetCamCoord(an, ao)
                SetCamRot(an, -20.0, am.y, am.z)
                ae = an
                Citizen.CreateThread(
                    function()
                        while DoesEntityExist(ak) do
                            Citizen.Wait(25)
                            af = (af + 1) % 360
                            SetEntityHeading(ak, af)
                        end
                    end
                )
                t = false
                E = true
                F = ak
            else
                tXTRA.notify("Failed to load vehicle.")
                return -1
            end
        end
    )
end
local function ap(aq)
    local ar = AddBlipForEntity(aq)
    SetBlipSprite(ar, 56)
    SetBlipDisplay(ar, 4)
    SetBlipScale(ar, 1.0)
    SetBlipColour(ar, 2)
    SetBlipAsShortRange(ar, true)
end
local as = {}
RegisterNetEvent(
    "XTRA:spawnPersonalVehicle",
    function(ah, at, au, av, aw, ax)
        Q()
        as[ah] = ax
        if GetVehiclePedIsIn(tXTRA.getPlayerPed(), false) == d then
            DeleteEntity(d)
        end
        drawNativeText("~g~Loading vehicle, please wait.")
        local ay = globalVehicleOwnership[ah]
        if ay == nil or not DoesEntityExist(ay[2]) then
            local ai = tXTRA.loadModel(ah)
            if ai == nil then
                tXTRA.notify("~r~Vehicle does not exist, if you believe this is an error contact a Car Dev on discord.")
                return
            end
            globalVehicleModelHashMapping[ai] = ah
            globalLastSpawnedVehicleTime = GetGameTimer()
            local aq
            if au then
                local al = tXTRA.getPosition()
                local az, aA, aB = GetNthClosestVehicleNode(al.x, al.y, al.z, nil, 8, 8, 8, 8)
                local aA, aC, aA = GetNthClosestVehicleNode(al.x, al.y, al.z, 15)
                local aD, aA, aE = GetClosestVehicleNodeWithHeading(al.x, al.y, al.z, nil, 8, 8, 8, 8)
                local aA, aF, aA = GetPointOnRoadSide(al.x, al.y, al.z, 0.0)
                if tostring(aF) ~= "vector3(0, 0, 0)" and tostring(aC) ~= "vector3(0, 0, 0)" then
                    aq = XTRA.spawnVehicle(ai, aC.x, aC.y, aC.z + 0.5, aB or 0.0, false, true, true)
                    tXTRA.loadModel("s_m_y_xmech_01")
                    SendNUIMessage({transactionType = "MPCT_AKAA_0" .. math.random(1, 5)})
                    local aG = CreatePedInsideVehicle(aq, "PED_TYPE_CIVMALE", "s_m_y_xmech_01", -1, false, false)
                    TaskVehicleDriveToCoord(aG, aq, aF.x, aF.y, aF.z, 15.0, 1.0, ai, 786603, 5.0)
                    ap(aq)
                    SetTimeout(
                        5000,
                        function()
                            while GetEntitySpeed(aq) > 5.0 do
                                Wait(500)
                            end
                            TaskLeaveVehicle(aG, aq, 64)
                            TaskWanderStandard(aG, 10.0, 10)
                            Wait(10000)
                            DeletePed(aG)
                        end
                    )
                    print("[XTRA] Spawned vehicle with spawncode: " .. tostring(ah))
                    DecorSetInt(aq, "xtra_owner", tXTRA.getUserId())
                    DecorSetInt(aq, "xtra_vmodel", ah)
                    SetVehicleNumberPlateText(aq, aw)
                    globalVehicleOwnership[ah] = {ah, aq}
                    setVehicleFuel(aq, as[ah])
                    while tXTRA.getPlayerVehicle() ~= aq do
                        Wait(100)
                    end
                    TriggerServerEvent("LSC:applyModifications", ah, aq)
                    TriggerServerEvent("XTRA:spawnVehicleCallback", at, VehToNet(aq))
                    table.insert(B, aq)
                end
            else
                local aH = tXTRA.getPosition()
                aq = XTRA.spawnVehicle(ai, aH.x, aH.y, aH.z + 1.0, GetEntityHeading(PlayerPedId()), true, true, true)
                ap(aq)
                print("[XTRA] Spawned vehicle with spawncode: " .. tostring(ah))
                DecorSetInt(aq, "xtra_owner", tXTRA.getUserId())
                DecorSetInt(aq, "xtra_vmodel", ah)
                SetVehicleNumberPlateText(aq, aw)
                globalVehicleOwnership[ah] = {ah, aq}
                setVehicleFuel(aq, as[ah])
                TriggerServerEvent("LSC:applyModifications", ah, aq)
                TriggerServerEvent("XTRA:PayVehicleTax")
                TriggerServerEvent("XTRA:spawnVehicleCallback", at, VehToNet(aq))
                table.insert(B, aq)
                CreateThread(
                    function()
                        local aI = true
                        SetTimeout(
                            5000,
                            function()
                                aI = false
                            end
                        )
                        while aI do
                            if DoesEntityExist(aq) then
                                Citizen.InvokeNative(0x5FFE9B4144F9712F, true)
                                SetNetworkVehicleAsGhost(aq, true)
                                SetEntityAlpha(aq, 220)
                            end
                            Wait(0)
                        end
                        Citizen.InvokeNative(0x5FFE9B4144F9712F, false)
                        SetNetworkVehicleAsGhost(aq, false)
                        SetEntityAlpha(aq, 255)
                        ResetEntityAlpha(aq)
                    end
                )
            end
            SetModelAsNoLongerNeeded(ai)
            while DoesEntityExist(aq) do
                local aJ = GetFuel(aq)
                if as[ah] ~= aJ then
                    TriggerServerEvent("XTRA:updateFuel", ah, math.floor(aJ * 1000) / 1000)
                    as[ah] = aJ
                    SetEntityInvincible(aq, false)
                    SetEntityCanBeDamaged(aq, true)
                end
                Wait(60000)
            end
        else
            tXTRA.notify("~r~This vehicle is already out.")
        end
    end
)
function GetFuel(ay)
    return DecorGetFloat(ay, "_FUEL_LEVEL")
end
function func_previewGarageVehicle()
    if E then
        if IsControlJustPressed(0, 177) then
            DeleteVehicle(F)
            F = 0
            l = 0
            E = false
            DestroyCam(ae, 0)
            RenderScriptCams(0, 0, 1, 1, 1)
            ae = 0
            SetFocusEntity(GetPlayerPed(PlayerId()))
            SetEntityAlpha(tXTRA.getPlayerPed(), 255)
            FreezeEntityPosition(tXTRA.getPlayerPed(), false)
            SetEntityCollision(tXTRA.getPlayerPed(), true, true)
        end
    end
end
tXTRA.createThreadOnTick(func_previewGarageVehicle)
local function aK(ah)
    for N, aL in pairs(c) do
        for aM in pairs(aL) do
            if aM ~= "_config" and aM == ah then
                return M(N) and h == aL["_config"].type
            end
        end
    end
    return true
end

function LastVehicleTabularCheck() 
    if lastvehicle then
        return {RightLabel = "→→→"}
    else 
        return {RightLabel = ""}
    end
end

function MemberShipStatusCheck()
    if tXTRA.isPlusClub() or tXTRA.isPlatClub() then
        return {RightBadge = RageUI.BadgeStyle.None}
    else 
        return {RightBadge = RageUI.BadgeStyle.Lock}
    end
end



RageUI.CreateWhile(
    1.0,
    true,
    function()
        if RageUI.Visible(RMenu:Get("XTRAGarages", "main")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    DeleteCar(q)
                    RageUI.ButtonWithStyle(
                        "Garages",
                        z,
                        {RightLabel = "→→→"},
                        true,
                        function(aN, aO, aP)
                            if aP then
                                VehiclesFetchedTable = {}
                                TriggerServerEvent("XTRA:FetchCars", f)
                                TriggerServerEvent("XTRA:getCustomFolders")
                                TriggerServerEvent("XTRA:getImpoundedVehicles")
                            end
                        end,
                        RMenu:Get("XTRAGarages", "owned_vehicles")
                    )
                    RageUI.ButtonWithStyle(
                        "Store Vehicle",
                        z,
                        {RightLabel = "→→→"},
                        true,
                        function(aN, aO, aP)
                            if aP then
                                local aQ = GetVehiclePedIsIn(tXTRA.getPlayerPed(), false)
                                Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(aQ))
                                if DoesEntityExist(aQ) then
                                    DeleteEntity(aQ)
                                end
                            end
                        end
                    )
                    RageUI.ButtonWithStyle(
                        "Rent Manager",
                        z,
                        {RightLabel = "→→→"},
                        true,
                        function(aN, aO, aP)
                            if aP then
                                TriggerServerEvent("XTRA:FetchRented")
                            end
                        end,
                        RMenu:Get("XTRAGarages", "rented_vehicles")
                    )
                    RageUI.ButtonWithStyle(
                        "Settings",
                        z,
                        {RightLabel = "→→→"},
                        true,
                        function(aN, aO, aP)
                        end,
                        RMenu:Get("XTRAGarages", "settings")
                    )
                    RageUI.ButtonWithStyle(
                        "Spawn Last Vehicle",
                        z,
                        LastVehicleTabularCheck(),
                        true,
                        function(aN, aO, aP)
                            if aP then
                                if tXTRA.getPlayerCombatTimer() == 0 then
                                    local vehicleglobal = globalVehicleOwnership[e]
                                    if vehicleglobal == nil or not DoesEntityExist(vehicleglobal[2]) then
                                        TriggerServerEvent("XTRA:spawnPersonalVehicle", e)
                                    else
                                        tXTRA.notify("~r~Vehicle is already out!")
                                    end
                                else
                                    tXTRA.notify("~r~You cannot spawn a vehicle with a combat timer.")
                                end
                            end
                        end
                    )
                    RageUI.Button(
                        "~y~Fuel all vehicles. (£25,000)",
                        (not tXTRA.isPlusClub() and not tXTRA.isPlatClub()) and "~y~You need to be a subscriber of XTRA Plus or XTRA Platinum to use this feature." or "",
                        MemberShipStatusCheck(),
                        tXTRA.isPlusClub() or tXTRA.isPlatClub(),
                        function(aR, aS, aT)
                            if aT then
                                if tXTRA.isPlusClub() or tXTRA.isPlatClub() then
                                    if not u then
                                        TriggerServerEvent("XTRA:fuelAllVehicles")
                                        u = true
                                        SetTimeout(
                                            60000,
                                            function()
                                                u = false
                                            end
                                        )
                                    else
                                        tXTRA.notify("You've done this too recently, try again later.")
                                    end
                                else
                                    tXTRA.notify(
                                        "~y~You need to be a subscriber of XTRA Plus or XTRA Platinum to use this feature."
                                    )
                                    tXTRA.notify("~y~Available @ store.xtrastudios.com")
                                end
                            end
                        end
                    )
                end
            )
        end
        if RageUI.Visible(RMenu:Get("XTRAGarages", "settings")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    RageUI.Checkbox(
                        "Hide custom folder vehicles",
                        "This hides these vehicles from their original garage.",
                        L.hideCustomFolderVehiclesFromOriginalGarages,
                        {RightLabel = ""},
                        function(aN, aO, aP, aU)
                            if aP then
                                L.hideCustomFolderVehiclesFromOriginalGarages =
                                    not L.hideCustomFolderVehiclesFromOriginalGarages
                                if L.hideCustomFolderVehiclesFromOriginalGarages then
                                    SetResourceKvpInt("hideCustomFolderVehiclesFromOriginalGarages", 1)
                                else
                                    SetResourceKvpInt("hideCustomFolderVehiclesFromOriginalGarages", 0)
                                end
                            end
                        end
                    )
                    RageUI.Checkbox(
                        "Show Custom Folders In Garage Menu",
                        "~y~This removes the [Custom Folders] menu item, and puts custom folders in the root garages menu.",
                        L.displayCustomFoldersinOwned,
                        {RightLabel = ""},
                        function(aN, aO, aP, aU)
                            if aP then
                                L.displayCustomFoldersinOwned = not L.displayCustomFoldersinOwned
                                if L.displayCustomFoldersinOwned then
                                    SetResourceKvpInt("displayFoldersinOwned", 1)
                                else
                                    SetResourceKvpInt("displayFoldersinOwned", 0)
                                end
                            end
                        end
                    )
                end
            )
        end
        if RageUI.Visible(RMenu:Get("XTRAGarages", "owned_vehicles")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    DeleteCar(q)
                    o = false
                    if not L.displayCustomFoldersinOwned then
                        RageUI.ButtonWithStyle(
                            "[Custom Folders]",
                            nil,
                            {RightLabel = "→→→"},
                            true,
                            function(aN, aO, aP)
                                if aP then
                                    for i, O in pairs(VehiclesFetchedTable) do
                                        if f == i then
                                            g = O.vehicles
                                        end
                                    end
                                end
                            end,
                            RMenu:Get("XTRAGarages", "customfolders")
                        )
                    end
                    if L.displayCustomFoldersinOwned then
                        for h, c in pairs(v) do
                            RageUI.ButtonWithStyle(
                                h,
                                nil,
                                {RightLabel = "→→→"},
                                true,
                                function(aN, aO, aP)
                                    if aP then
                                        x = h
                                        C = nil
                                    end
                                end,
                                RMenu:Get("XTRAGarages", "customfoldersvehicles")
                            )
                        end
                    end
                    local aV = sortAlphabetically(VehiclesFetchedTable)
                    for aA, aW in pairs(aV) do
                        local N = aW.title
                        local V = aW["value"]["_config"]
                        local W, X, Y, Z, _, aX =
                            V.blipid,
                            V.blipcolor,
                            V.markerid,
                            V.markercolours,
                            V.permissions,
                            V.type
                        if M(N) and h == aX then
                            RageUI.ButtonWithStyle(
                                N,
                                nil,
                                {RightLabel = "→→→"},
                                true,
                                function(aN, aO, aP)
                                    if aP then
                                        g = aW["value"]["vehicles"]
                                        C = N
                                    end
                                end,
                                RMenu:Get("XTRAGarages", "owned_vehicles_submenu")
                            )
                        end
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("XTRAGarages", "owned_vehicles_submenu")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    for N, aW in pairs(c) do
                        if N == C then
                            selectedCustomFolder = nil
                            local aY = {}
                            for ah, aZ in pairs(aW) do
                                table.insert(aY, {vehicleId = ah, vehicleName = aZ[1] or "z"})
                            end
                            table.sort(
                                aY,
                                function(a_, b0)
                                    return a_.vehicleName < b0.vehicleName
                                end
                            )
                            for aA, aW in pairs(aY) do
                                local ah = aW.vehicleId
                                local b1 = aW.vehicleName
                                local b2 = false
                                if g[ah] then
                                    b2 = true
                                end
                                if ah ~= "_config" then
                                    if b2 then
                                        if
                                            L.hideCustomFolderVehiclesFromOriginalGarages and
                                                tXTRA.isVehicleInAnyCustomFolder(ah)
                                         then
                                        else
                                            local b3 = math.floor((A[ah] or 0) * 1000) / 1000
                                            local b4 = ""
                                            if b3 <= 20 then
                                                b4 = ""
                                            elseif b3 <= 50 then
                                                b4 = "~y~"
                                            elseif b3 <= 100 then
                                                b4 = "~g~"
                                            end
                                            if tXTRA.isVehicleImpounded(ah) then
                                                b1 = b1 .. " ~r~(IMPOUNDED)~w~"
                                            end
                                            RageUI.ButtonWithStyle(
                                                b1,
                                                b4 .. "Fuel " .. tostring(b3) .. "%",
                                                {RightLabel = "→→→"},
                                                true,
                                                function(aR, aS, aT)
                                                    if aS then
                                                        if (F == 0 or l ~= ah) and not t then
                                                            DeleteVehicle(F)
                                                            t = true
                                                            ag(ah)
                                                            l = ah
                                                        end
                                                    end
                                                    if aT then
                                                        e = ah
                                                        z = b1
                                                        TriggerServerEvent("XTRA:getVehicleRarity", ah)
                                                        RMenu:Get("XTRAGarages", "owned_vehicles_submenu_manage"):SetSubtitle(
                                                            b1
                                                        )
                                                    end
                                                end,
                                                RMenu:Get("XTRAGarages", "owned_vehicles_submenu_manage")
                                            )
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("XTRAGarages", "owned_vehicles_submenu_manage")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    local b3 = z
                    if G[e] then
                        b3 =
                            b3 ..
                            " | " .. "Rarity (1:" .. tostring(G[e].rarity) .. ") | " .. (G[e].locked and "🔒" or "🔓")
                    end
                    RageUI.ButtonWithStyle(
                        "Spawn Vehicle",
                        b3,
                        {RightLabel = "→→→"},
                        true,
                        function(aN, aO, aP)
                            if aP then
                                for b5, T in pairs(B) do
                                    if not DoesEntityExist(T) then
                                        table.remove(B, b5)
                                    end
                                end
                                if #B <= 5 then
                                    DeleteVehicle(F)
                                    F = 0
                                    l = 0
                                    E = false
                                    DestroyCam(ae, 0)
                                    RenderScriptCams(0, 0, 1, 1, 1)
                                    ae = 0
                                    SetFocusEntity(GetPlayerPed(PlayerId()))
                                    SetEntityAlpha(tXTRA.getPlayerPed(), 255)
                                    FreezeEntityPosition(tXTRA.getPlayerPed(), false)
                                    SetEntityCollision(tXTRA.getPlayerPed(), true, true)
                                    local ay = globalVehicleOwnership[e]
                                    if tXTRA.getPlayerCombatTimer() > 0 then
                                        tXTRA.notify("~r~You can not spawn vehicles whilst in combat.")
                                    elseif ay == nil or not DoesEntityExist(ay[2]) then
                                        lastvehicle = true
                                        TriggerServerEvent("XTRA:spawnPersonalVehicle", e)
                                    else
                                        tXTRA.notify("Vehicle is already out!")
                                    end
                                else
                                    tXTRA.notify("You may only take out a maximum of 5 vehicles at a time.")
                                end
                                RageUI.ActuallyCloseAll()
                            end
                        end
                    )
                    if not o then
                        RageUI.ButtonWithStyle(
                            "Sell Vehicle to Player",
                            b3,
                            {RightLabel = "→→→"},
                            canVehicleBeSold(e),
                            function(aN, aO, aP)
                                if aP and canVehicleBeSold(e) then
                                    TriggerServerEvent("XTRA:SellVehicle", e)
                                end
                            end
                        )
                        RageUI.ButtonWithStyle(
                            "Rent Vehicle to Player",
                            b3,
                            {RightLabel = "→→→"},
                            canVehicleBeRented(e),
                            function(aN, aO, aP)
                                if aP and canVehicleBeSold(e) then
                                    TriggerServerEvent("XTRA:RentVehicle", e)
                                end
                            end
                        )
                        RageUI.ButtonWithStyle(
                            "Crush Vehicle",
                            "This will ~r~DELETE ~w~this vehicle from your garage.",
                            {RightLabel = "→→→"},
                            canVehicleBeSold(e),
                            function(aN, aO, aP)
                                if aP then
                                    AddTextEntry("FMMC_MPM_NC", "Type 'CONFIRM' to crush vehicle")
                                    DisplayOnscreenKeyboard(1, "FMMC_MPM_NC", "", "", "", "", "", 30)
                                    while UpdateOnscreenKeyboard() == 0 do
                                        DisableAllControlActions(0)
                                        Wait(0)
                                    end
                                    if GetOnscreenKeyboardResult() then
                                        local b6 = GetOnscreenKeyboardResult()
                                        if b6 then
                                            b6 = b6
                                            if string.upper(b6) == "CONFIRM" then
                                                TriggerServerEvent("XTRA:CrushVehicle", e)
                                                n = nil
                                                RageUI.ActuallyCloseAll()
                                                RageUI.Visible(RMenu:Get("XTRAGarages", "main"), true)
                                            end
                                        end
                                    end
                                end
                            end
                        )
                        RageUI.ButtonWithStyle(
                            "Add to Custom Folder",
                            b3,
                            {RightLabel = "→→→"},
                            true,
                            function(aN, aO, aP)
                                if aP then
                                    local b7 = tXTRA.KeyboardInput("Enter Folder Name", "", 25)
                                    if b7 ~= nil then
                                        if v[b7] ~= nil then
                                            if not table.find(v[b7], e) then
                                                table.insert(v[b7], e)
                                                tXTRA.notify("~g~Added vehicle to custom folder.")
                                                TriggerServerEvent("XTRA:updateFolders", v)
                                            else
                                                tXTRA.notify(
                                                    "~r~Failed to add vehicle from folder, vehicle already in folder."
                                                )
                                            end
                                        else
                                            tXTRA.notify("~r~Failed to add vehicle to folder, folder does not exist?")
                                        end
                                    end
                                end
                            end
                        )
                        RageUI.ButtonWithStyle(
                            "Remove from Custom Folder",
                            b3,
                            {RightLabel = "→→→"},
                            true,
                            function(aN, aO, aP)
                                if aP then
                                    local b7 = tXTRA.KeyboardInput("Enter Folder Name", "", 25)
                                    if b7 ~= nil then
                                        if v[b7] ~= nil then
                                            if table.find(v[b7], e) then
                                                for i = 1, #v[b7] do
                                                    if v[b7][i] == e then
                                                        table.remove(v[b7], i)
                                                        TriggerServerEvent("XTRA:updateFolders", v)
                                                        tXTRA.notify("~g~Removed vehicle from custom folder.")
                                                    end
                                                end
                                            else
                                                tXTRA.notify(
                                                    "~r~Failed to remove vehicle from folder, vehicle not in folder."
                                                )
                                            end
                                        else
                                            tXTRA.notify(
                                                "~r~Failed to remove vehicle from folder, folder does not exist?"
                                            )
                                        end
                                    end
                                end
                            end
                        )
                        RageUI.ButtonWithStyle(
                            "View Remote Dashcam",
                            b3,
                            {RightLabel = "→→→"},
                            true,
                            function(aN, aO, aP)
                                if aP then
                                    TriggerServerEvent("XTRA:viewRemoteDashcam", e)
                                end
                            end
                        )
                        RageUI.ButtonWithStyle(
                            "Display Vehicle Blip",
                            b3,
                            {RightLabel = "→→→"},
                            true,
                            function(aN, aO, aP)
                                if aP then
                                    TriggerServerEvent("XTRA:displayVehicleBlip", e)
                                end
                            end
                        )
                        RageUI.ButtonWithStyle(
                            "View Boot",
                            b3,
                            {RightLabel = "→→→"},
                            true,
                            function(aN, aO, aP)
                                if aP then
                                    TriggerServerEvent("XTRA:viewTrunk", e)
                                end
                            end,
                            RMenu:Get("XTRAGarages", "viewboot")
                        )
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("XTRAGarages", "customfolders")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    RageUI.ButtonWithStyle(
                        "[Create Custom Folder]",
                        "Create a custom folder.",
                        {RightLabel = "→→→"},
                        true,
                        function(aN, aO, aP)
                            if aP then
                                local b7 = tXTRA.KeyboardInput("Enter Folder Name", "", 25)
                                if b7 ~= nil and b7 ~= "" then
                                    if v[b7] == nil then
                                        v[b7] = {}
                                        TriggerServerEvent("XTRA:updateFolders", v)
                                        tXTRA.notify("~g~Created custom folder " .. b7)
                                    else
                                        tXTRA.notify("~r~Folder already exists.")
                                    end
                                else
                                    tXTRA.notify("~r~Invalid folder name.")
                                end
                            end
                        end
                    )
                    RageUI.ButtonWithStyle(
                        "[Delete Custom Folder]",
                        "Delete a custom folder",
                        {RightLabel = "→→→"},
                        true,
                        function(aN, aO, aP)
                            if aP then
                                local b7 = tXTRA.KeyboardInput("Enter Folder name", "", 25)
                                if b7 ~= nil then
                                    if v[b7] ~= nil and b7 ~= "" then
                                        v[b7] = nil
                                        tXTRA.notify("~g~Deleted custom folder " .. b7)
                                        TriggerServerEvent("XTRA:updateFolders", v)
                                    else
                                        tXTRA.notify("Folder " .. b7 .. " does not exist.")
                                    end
                                else
                                    tXTRA.notify("~r~Invalid folder name.")
                                end
                            end
                        end
                    )
                    for h, c in pairs(v) do
                        RageUI.ButtonWithStyle(
                            h,
                            nil,
                            {RightLabel = "→→→"},
                            true,
                            function(aN, aO, aP)
                                if aP then
                                    x = h
                                    C = nil
                                end
                            end,
                            RMenu:Get("XTRAGarages", "customfoldersvehicles")
                        )
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("XTRAGarages", "customfoldersvehicles")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    for F, O in pairs(v) do
                        if F == x then
                            if #v[x] < 1 then
                                RageUI.Separator("~r~This folder does not contain any vehicles")
                            end
                            for i = 1, #v[x] do
                                for a, c in pairs(VehiclesFetchedTable) do
                                    for y, d in pairs(c.vehicles) do
                                        if y == O[i] then
                                            RageUI.ButtonWithStyle(
                                                d[1],
                                                "",
                                                {RightLabel = nil},
                                                true,
                                                function(aN, aO, aP)
                                                    if aP then
                                                        e = O[i]
                                                        z = d[1]
                                                        TriggerServerEvent("XTRA:getVehicleRarity", e)
                                                    end
                                                    if aO then
                                                        j = O[i]
                                                    end
                                                end,
                                                RMenu:Get("XTRAGarages", "owned_vehicles_submenu_manage")
                                            )
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("XTRAGarages", "viewboot")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    local b8 = false
                    RageUI.Separator("Your Boot")
                    RageUI.Separator(z)
                    RageUI.Separator("")
                    RageUI.ButtonWithStyle(
                        "Weapons",
                        nil,
                        {RightLabel = "→→→"},
                        true,
                        function(aN, aO, aP)
                        end,
                        RMenu:Get("XTRAGarages", "viewboot_weapons")
                    )
                    RageUI.ButtonWithStyle(
                        "Ammo",
                        nil,
                        {RightLabel = "→→→"},
                        true,
                        function(aN, aO, aP)
                        end,
                        RMenu:Get("XTRAGarages", "viewboot_ammo")
                    )
                    RageUI.ButtonWithStyle(
                        "Wipe Boot",
                        nil,
                        {RightLabel = "→→→"},
                        true,
                        function(aN, aO, aP)
                            if aP then
                                TriggerServerEvent("XTRA:WipeBoot", e)
                            end
                        end
                    )
                end
            )
        end
        if RageUI.Visible(RMenu:Get("XTRAGarages", "viewboot_weapons")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    j = nil
                    RageUI.Separator("Your Weapons")
                    RageUI.Separator(z)
                    RageUI.ButtonWithStyle(
                        "Ammo",
                        nil,
                        {RightLabel = "→→→"},
                        true,
                        function(aN, aO, aP)
                        end,
                        RMenu:Get("XTRAGarages", "viewboot_ammo")
                    )
                    RageUI.ButtonWithStyle(
                        "Back",
                        nil,
                        {RightLabel = "→→→"},
                        true,
                        function(aN, aO, aP)
                        end,
                        RMenu:Get("XTRAGarages", "viewboot")
                    )
                    RageUI.Separator("Weapons")
                    for i, O in pairs(I) do
                        if I[i].amount > 0 then
                            b8 = true
                            RageUI.Separator("~g~" .. I[i].WeaponName .. " x " .. I[i].amount)
                        else
                            RageUI.Separator("~r~No weapons in boot.")
                        end
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("XTRAGarages", "viewboot_ammo")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    j = nil
                    RageUI.Separator("Your Ammo")
                    RageUI.Separator(z)
                    RageUI.ButtonWithStyle(
                        "Weapons",
                        nil,
                        {RightLabel = "→→→"},
                        true,
                        function(aN, aO, aP)
                        end,
                        RMenu:Get("XTRAGarages", "viewboot_weapons")
                    )
                    RageUI.ButtonWithStyle(
                        "Back",
                        nil,
                        {RightLabel = "→→→"},
                        true,
                        function(aN, aO, aP)
                        end,
                        RMenu:Get("XTRAGarages", "viewboot")
                    )
                    RageUI.Separator("Ammo")
                    for i, O in pairs(H) do
                        if H[i].amount > 0 then
                            b8 = true
                            RageUI.Separator("~g~" .. H[i].AmmoName .. " x " .. H[i].amount)
                        else
                            RageUI.Separator("~r~No ammo in boot.")
                        end
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("XTRAGarages", "rented_vehicles")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    DeleteCar(q)
                    if next(m) then
                        RageUI.ButtonWithStyle(
                            "Rented Vehicles Out",
                            nil,
                            {RightLabel = "→→→"},
                            true,
                            function(aN, aO, aP)
                            end,
                            RMenu:Get("XTRAGarages", "rented_vehicles_out_manage")
                        )
                    end
                    if next(k) then
                        RageUI.ButtonWithStyle(
                            "Rented Vehicles In",
                            nil,
                            {RightLabel = "→→→"},
                            true,
                            function(aN, aO, aP)
                            end,
                            RMenu:Get("XTRAGarages", "rented_vehicles_manage")
                        )
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("XTRAGarages", "rented_vehicles_out_manage")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    j = nil
                    DeleteCar(q)
                    if next(m) then
                        for i, O in pairs(m.vehicles) do
                            RageUI.ButtonWithStyle(
                                O[1],
                                nil,
                                {RightLabel = "→→→"},
                                true,
                                function(aN, aO, aP)
                                    if aP then
                                        RentedVehicle = i
                                    end
                                end,
                                RMenu:Get("XTRAGarages", "rented_vehicles_out_information")
                            )
                        end
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("XTRAGarages", "rented_vehicles_out_information")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    if next(m) then
                        for i, O in pairs(m.vehicles) do
                            if RentedVehicle == i then
                                RageUI.Separator("~g~Rent Info")
                                RageUI.Separator("Vehicle: " .. O[1])
                                RageUI.Separator("Spawncode: " .. i)
                                RageUI.Separator("Time Left: " .. O[2])
                                RageUI.Separator("Rented To ID: " .. O[3])
                                RageUI.ButtonWithStyle(
                                    "Request Rent Cancellation",
                                    "~y~This will cancel the rent of " .. O[1],
                                    {},
                                    true,
                                    function(aN, aO, aP)
                                        if aP then
                                            TriggerServerEvent("XTRA:CancelRent", i, O[1], "owner")
                                        end
                                    end
                                )
                            end
                        end
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("XTRAGarages", "rented_vehicles_manage")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    j = nil
                    DeleteCar(q)
                    if next(k) then
                        for i, O in pairs(k.vehicles) do
                            RageUI.ButtonWithStyle(
                                O[1],
                                nil,
                                {RightLabel = "→→→"},
                                true,
                                function(aN, aO, aP)
                                    if aP then
                                        RentedVehicle = i
                                    end
                                end,
                                RMenu:Get("XTRAGarages", "rented_vehicles_information")
                            )
                        end
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("XTRAGarages", "rented_vehicles_information")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    j = nil
                    DeleteCar(q)
                    if next(k) then
                        for i, O in pairs(k.vehicles) do
                            if RentedVehicle == i then
                                RageUI.Separator("~g~Rent Info")
                                RageUI.Separator("Vehicle: " .. O[1])
                                RageUI.Separator("Spawncode: " .. i)
                                RageUI.Separator("Time Left: " .. O[2])
                                RageUI.Separator("Rented To ID: " .. O[3])
                                RageUI.ButtonWithStyle(
                                    "Request Rent Cancellation",
                                    "~y~This will cancel the rent of " .. O[1],
                                    {},
                                    true,
                                    function(aN, aO, aP)
                                        if aP then
                                            TriggerServerEvent("XTRA:CancelRent", i, O[1], "renter")
                                        end
                                    end
                                )
                            end
                        end
                    end
                end
            )
        end
    end
)
local b9 = {}
RegisterNetEvent("XTRA:ReturnFetchedCarsBoot")
AddEventHandler(
    "XTRA:ReturnFetchedCarsBoot",
    function(ba)
        H = ba.Ammo
        I = ba.Weapons
        b9 = ba.Other
    end
)
RegisterNetEvent(
    "XTRA:updateOwnedVehicles",
    function(N)
        globalOwnedPlayerVehicles = {}
        globalOwnedPlayerVehicles = N
    end
)
RegisterNetEvent("XTRA:ReturnFetchedCars")
AddEventHandler(
    "XTRA:ReturnFetchedCars",
    function(table, bb)
        VehiclesFetchedTable = table
        A = bb
    end
)
RegisterNetEvent("XTRA:ReturnedRentedCars")
AddEventHandler(
    "XTRA:ReturnedRentedCars",
    function(bc, bd)
        k = bc
        m = bd
    end
)
RegisterNetEvent("XTRA:sendFolders")
AddEventHandler(
    "XTRA:sendFolders",
    function(be)
        v = be
    end
)
RegisterNetEvent("XTRA:CloseGarage")
AddEventHandler(
    "XTRA:CloseGarage",
    function()
        DeleteCar(q)
        n = nil
        RageUI.ActuallyCloseAll()
    end
)
function table.find(table, bf)
    for A, bg in pairs(table) do
        if bg == bf then
            return true
        end
    end
    return false
end
function pairsByKeys(bh, bi)
    local a_ = {}
    for bj in pairs(bh) do
        table.insert(a_, bj)
    end
    table.sort(a_, bi)
    local i = 0
    local bk = function()
        i = i + 1
        if a_[i] == nil then
            return nil
        else
            return a_[i], bh[a_[i]]
        end
    end
    return bk
end
function sortAlphabetically(bl)
    local bh = {}
    for bm, bn in pairsByKeys(bl) do
        table.insert(bh, {title = bm, value = bn})
    end
    bl = bh
    return bl
end
AddEventHandler(
    "XTRA:searchClient",
    function(bo)
        local bp = tonumber(DecorGetInt(bo, "xtra_owner"))
        if bp > 0 then
            tXTRA.loadAnimDict("missexile3")
            TaskPlayAnim(
                PlayerPedId(),
                "missexile3",
                "ex03_dingy_search_case_base_michael",
                1.0,
                8.0,
                12000,
                1,
                1.0,
                false,
                false,
                false
            )
            RemoveAnimDict("missexile3")
            TriggerServerEvent("XTRA:searchVehicle", VehToNet(bo), bp)
        else
            tXTRA.notify("~r~Vehicle is not owned by anyone")
        end
    end
)
local bq = {}
RegisterNetEvent(
    "XTRA:lockpickClient",
    function(bo, br)
        FreezeEntityPosition(tXTRA.getPlayerPed(), true)
        RequestAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
        while not HasAnimDictLoaded("anim@amb@clubhouse@tutorial@bkr_tut_ig3@") do
            Citizen.Wait(0)
        end
        local bs = true
        local bt = false
        local bu = GetGameTimer()
        tXTRA.notify("~g~Lock Picking in progress, you can cancel by pressing [E].")
        Citizen.CreateThread(
            function()
                while bs do
                    if
                        not IsEntityPlayingAnim(
                            tXTRA.getPlayerPed(),
                            "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                            "machinic_loop_mechandplayer",
                            3
                        )
                     then
                        TaskPlayAnim(
                            tXTRA.getPlayerPed(),
                            "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                            "machinic_loop_mechandplayer",
                            8.0,
                            -8.0,
                            -1,
                            1,
                            0,
                            false,
                            false,
                            false
                        )
                    end
                    local bv = math.floor((GetGameTimer() - bu) / 60000 * 100)
                    drawNativeText("Lock Picking - " .. bv .. "%")
                    if IsControlJustPressed(0, 38) then
                        tXTRA.notify("~r~Lock Picking cancelled.")
                        bs = false
                        bt = true
                        ClearPedTasks(tXTRA.getPlayerPed())
                        FreezeEntityPosition(tXTRA.getPlayerPed(), false)
                    end
                    Wait(0)
                end
                RemoveAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
            end
        )
        Wait(60000)
        FreezeEntityPosition(tXTRA.getPlayerPed(), false)
        ClearPedTasks(tXTRA.getPlayerPed())
        bs = false
        if br and not bt then
            bq[bo] = true
            local bp = tonumber(DecorGetInt(bo, "xtra_owner"))
            if bp > 0 then
                TriggerServerEvent("XTRA:lockpickVehicle", GetEntityModel(bo), bp)
            else
                tXTRA.notify("~r~Vehicle is not owned by anyone")
            end
            local bw = NetworkGetNetworkIdFromEntity(bo)
            if bw ~= 0 then
                TriggerServerEvent("XTRA:setVehicleLock", bw, false)
                tXTRA.notify("Vehicle unlocked.")
            end
        else
            tXTRA.notify("~r~Failed to lockpick vehicle.")
        end
    end
)
RegisterNetEvent(
    "XTRA:playLockpickAlarm",
    function(bx)
        local by = NetToVeh(bx)
        if by then
            local bz = GetSoundId()
            PlaySoundFromEntity(bz, "ALARM_ONE", by, "DLC_ALARM_SOUNDSET", 0, 0)
            SetTimeout(
                60000,
                function()
                    StopSound(bz)
                    ReleaseSoundId(bz)
                end
            )
        end
    end
)
AddEventHandler(
    "XTRA:verifyLockpick",
    function(bo)
        local bp = tonumber(DecorGetInt(bo, "xtra_owner"))
        if bp > 0 then
            if bq[bo] then
                TriggerServerEvent("XTRA:lockpickVehicle", GetEntityModel(bo), bp)
            else
                TriggerServerEvent("XTRA:attemptLockpick", bo, VehToNet(bo))
            end
        else
            tXTRA.notify("~r~Vehicle owner is not online.")
        end
    end
)
function canVehicleBeSold(bA)
    return not J[string.lower(bA)]
end
function canVehicleBeRented(bA)
    return not K[string.lower(bA)]
end
function tXTRA.isVehicleInAnyCustomFolder(b5)
    for a, c in pairs(v) do
        if table.has(c, b5) then
            return true
        end
    end
    return false
end
RegisterNetEvent("XTRA:sendGarageSettings")
AddEventHandler(
    "XTRA:sendGarageSettings",
    function()
        TriggerServerEvent("XTRA:refreshSimeonsPermissions")
        if GetResourceKvpInt("displayFoldersinOwned") == 1 then
            L.displayCustomFoldersinOwned = true
        else
            L.displayCustomFoldersinOwned = false
        end
        if GetResourceKvpInt("hideCustomFolderVehiclesFromOriginalGarages") == 1 then
            L.hideCustomFolderVehiclesFromOriginalGarages = true
        else
            L.hideCustomFolderVehiclesFromOriginalGarages = false
        end
    end
)
AddEventHandler(
    "XTRA:onClientSpawn",
    function(bB, ah)
        if ah then
            TriggerServerEvent("XTRA:refreshGaragePermissions")
        end
    end
)
RegisterNetEvent(
    "XTRA:recieveRefreshedGaragePermissions",
    function(bC)
        y = bC
    end
)
RegisterNetEvent(
    "XTRA:setVehicleRarity",
    function(bD, Q, bE)
        G[bD] = {rarity = Q, locked = bE}
    end
)
RegisterCommand(
    "callanambulance",
    function()
        tXTRA.notify("~y~CALL AN AMBULANCE")
        tXTRA.notify("~y~CALL AN AMBULANCE!")
        tXTRA.notify("BUT NOT FOR ME.")
        SendNUIMessage({transactionType = "callanambulance"})
    end
)
RegisterCommand(
    "gtaloadin",
    function()
        SendNUIMessage({transactionType = "gtaloadin"})
    end
)
RegisterCommand(
    "car",
    function(bF, bG, bH)
        if tXTRA.getStaffLevel() >= 9 and not tXTRA.isPurge() then
            local an = GetEntityCoords(tXTRA.getPlayerPed())
            local bI = vector3(-1341.9575195313, -3032.8686523438, 13.944421768188)
            local bJ, bK, bL = table.unpack(GetOffsetFromEntityInWorldCoords(tXTRA.getPlayerPed(), 0.0, 3.0, 0.5))
            local am = bG[1]
            if am == nil then
                tXTRA.notify("~r~No vehicle spawncode specified.")
                return
            end
            if am == "demonhawkk" and tXTRA.getUserId() ~= 1 and tXTRA.getUserId() ~= 2 and tXTRA.getUserId() ~= 414 then
                tXTRA.teleport(-807.62481689453, 172.82191467285, 76.740547180176)
                jimmy()
            else
                if #(an - bI) < 600.0 or (tXTRA.getUserId() > 0) then
                    TriggerServerEvent("XTRA:logVehicleSpawn", am, "/car")
                    local bM =
                        XTRA.spawnVehicle(am, an.x, an.y, an.z, GetEntityHeading(tXTRA.getPlayerPed()), true, true, true)
                    DecorSetInt(bM, decor, 945)
                    SetVehicleOnGroundProperly(bM)
                    SetEntityInvincible(bM, false)
                    SetVehicleModKit(bM, 0)
                    SetVehicleMod(bM, 11, 2, false)
                    SetVehicleMod(bM, 13, 2, false)
                    SetVehicleMod(bM, 12, 2, false)
                    SetVehicleMod(bM, 15, 3, false)
                    ToggleVehicleMod(bM, 18, true)
                    SetPedIntoVehicle(tXTRA.getPlayerPed(), bM, -1)
                    SetModelAsNoLongerNeeded(GetHashKey(am))
                    SetVehRadioStation(bM, "OFF")
                    Wait(500)
                    SetVehRadioStation(bM, "OFF")
                else
                    tXTRA.notify("~r~Vehicles may only be spawned at the airport for testing")
                end
            end
        end
    end
)
RegisterCommand(
    "dv",
    function()
        if
            globalOnPoliceDuty or globalNHSOnDuty or globalLFBOnDuty or tXTRA.isStaffedOn() or tXTRA.isDev() or
                globalOnPrisonDuty and isPlayerNearPrison()
         then
            local b1 = GetVehiclePedIsIn(tXTRA.getPlayerPed(), false)
            if NetworkHasControlOfEntity(b1) and (tXTRA.getStaffLevel() > 0 or GetEntitySpeed(b1) < 1.0) then
                DeleteEntity(b1)
            end
        end
    end,
    false
)
function tXTRA.getVehicleIdFromHash(bN)
    return globalVehicleModelHashMapping[bN]
end
function tXTRA.getVehicleInfos(ak)
    if ak and DecorExistOn(ak, "xtra_owner") and DecorExistOn(ak, "xtra_vmodel") then
        local G = DecorGetInt(ak, "xtra_owner")
        local bO = DecorGetInt(ak, "xtra_vmodel")
        local bP = globalVehicleModelHashMapping[GetEntityModel(ak)]
        if bP then
            return G, bP
        end
    end
end
function tXTRA.getNetworkedVehicleInfos(bQ)
    local ak = NetToVeh(bQ)
    if ak and DecorExistOn(ak, "xtra_owner") and DecorExistOn(ak, "xtra_vmodel") then
        local G = DecorGetInt(ak, "xtra_owner")
        local bO = DecorGetInt(ak, "xtra_vmodel")
        local bP = globalVehicleModelHashMapping[GetEntityModel(ak)]
        if bP then
            return G, bP
        end
    end
end
function stringsplit(bD, bR)
    if bR == nil then
        bR = "%s"
    end
    local bh = {}
    i = 1
    for bS in string.gmatch(bD, "([^" .. bR .. "]+)") do
        bh[i] = bS
        i = i + 1
    end
    return bh
end
function getVehicleSoundNameFromId(bT)
    return w[bT]
end
function tXTRA.despawnGarageVehicle(bU)
    local ay = globalVehicleOwnership[bU]
    if ay then
        SetVehicleHasBeenOwnedByPlayer(ay[2], false)
        Citizen.InvokeNative(0xAD738C3085FE7E11, ay[2], false, true)
        SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(ay[2]))
        Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(ay[2]))
        globalVehicleOwnership[bU] = nil
        tXTRA.notify("Vehicle stored.")
    end
end
function tXTRA.getNearestVehicle(bV)
    local aH = tXTRA.getPosition()
    local bW, bX, bY = aH.x, aH.y, aH.z
    local bZ = tXTRA.getPlayerPed()
    if IsPedSittingInAnyVehicle(bZ) then
        return GetVehiclePedIsIn(bZ, true)
    else
        local ak = GetClosestVehicle(bW + 0.0001, bX + 0.0001, bY + 0.0001, bV + 0.0001, 0, 8192 + 4096 + 4 + 2 + 1)
        if not IsEntityAVehicle(ak) then
            ak = GetClosestVehicle(bW + 0.0001, bX + 0.0001, bY + 0.0001, bV + 0.0001, 0, 4 + 2 + 1)
        end
        if not IsEntityAVehicle(ak) then
            ak = GetClosestVehicle(bW + 0.0001, bX + 0.0001, bY + 0.0001, bV + 0.0001, 0, 16384)
        end
        if ak == 0 then
            return GetVehiclePedIsIn(bZ, true)
        else
            return ak, nil
        end
    end
end
function tXTRA.getClosestVehicle(bV)
    local b_ = tXTRA.getPlayerCoords()
    local c0 = 100
    local bz = 100
    for aA, c1 in pairs(GetGamePool("CVehicle")) do
        local c2 = GetEntityCoords(c1)
        local c3 = #(b_ - c2)
        if c3 < bz then
            bz = c3
            c0 = c1
        end
    end
    if bz <= bV then
        return c0
    else
        return nil
    end
end


function tryFindModelFromEntity(ay)
    local ai = GetEntityModel(ay)
    for bE, ab in pairs(a.garages) do
        for b5, T in pairs(ab) do
            if T ~= "_config" then
                local c4 = GetHashKey(T)
                if ai == c4 then
                    return T
                end
            end
        end
    end
    return nil
end
function tXTRA.tryOwnNearestVehicle(bV)
    local ak = tXTRA.getNearestVehicle(bV)
    if ak then
        local G, bP = tXTRA.getVehicleInfos(ak)
        if G and G == tXTRA.getUserId() then
            if globalVehicleOwnership[bP] ~= ak then
                globalVehicleOwnership[bP] = {bP, ak}
            end
        end
    end
end
function tXTRA.fixeNearestVehicle(bV)
    local ak = tXTRA.getNearestVehicle(bV)
    if IsEntityAVehicle(ak) then
        SetVehicleFixed(ak)
    end
end
function tXTRA.replaceNearestVehicle(bV)
    local ak = tXTRA.getNearestVehicle(bV)
    if IsEntityAVehicle(ak) then
        SetVehicleOnGroundProperly(ak)
    end
end
function tXTRA.getVehicleAtPosition(bW, bX, bY)
    bW = bW + 0.0001
    bX = bX + 0.0001
    bY = bY + 0.0001
    local bJ = StartExpensiveSynchronousShapeTestLosProbe(bW, bX, bY, bW, bX, bY + 4, 10, tXTRA.getPlayerPed(), 0)
    local a_, b0, bK, bL, c5 = GetShapeTestResult(bJ)
    return c5
end
function tXTRA.getNearestOwnedVehicle(bV)
    tXTRA.tryOwnNearestVehicle(bV)
    local c6
    local c7
    local c0
    local al = GetEntityCoords(tXTRA.getPlayerPed())
    for b5, T in pairs(globalVehicleOwnership) do
        local c8 = #(GetEntityCoords(T[2], true) - al)
        if c8 <= bV + 0.0001 then
            if not c6 or c8 < c6 then
                c6 = c8
                c7 = b5
                c0 = T[2]
            end
        end
    end
    if c7 then
        local G = DecorGetInt(c0, "xtra_owner")
        return true, c7, G
    end
    return false, ""
end
function tXTRA.getCurrentOwnedVehicle(bV)
    tXTRA.tryOwnNearestVehicle(bV)
    local c6
    local c7
    for b5, T in pairs(globalVehicleOwnership) do
        local c8 = #(GetEntityCoords(T[2], true) - GetEntityCoords(tXTRA.getPlayerPed()))
        if c8 <= bV + 0.0001 then
            if not c6 or c8 < c6 then
                c6 = c8
                c7 = b5
            end
        end
    end
    if c7 then
        return true, c7
    end
    return false, ""
end
function tXTRA.getAnyOwnedVehiclePosition()
    for b5, T in pairs(globalVehicleOwnership) do
        if IsEntityAVehicle(T[2]) then
            local bW, bX, bY = table.unpack(GetEntityCoords(T[2], true))
            return true, bW, bX, bY
        end
    end
    return false, 0, 0, 0
end
function tXTRA.getOwnedVehiclePosition(bU)
    local ay = globalVehicleOwnership[bU]
    local bW, bX, bY = 0, 0, 0
    if ay then
        bW, bX, bY = table.unpack(GetEntityCoords(ay[2], true))
    end
    return bW, bX, bY
end
function tXTRA.getOwnedVehicleHandle(bU)
    local ay = globalVehicleOwnership[bU]
    if ay then
        return ay[2]
    end
end
function tXTRA.ejectVehicle()
    local bZ = tXTRA.getPlayerPed()
    if IsPedSittingInAnyVehicle(bZ) then
        local ak = GetVehiclePedIsIn(bZ, false)
        TaskLeaveVehicle(bZ, ak, 4160)
    end
end
function tXTRA.isInVehicle()
    local bZ = tXTRA.getPlayerPed()
    return IsPedSittingInAnyVehicle(bZ)
end
function tXTRA.vc_openDoor(bU, c9)
    local ay = globalVehicleOwnership[bU]
    if ay then
        SetVehicleDoorOpen(ay[2], c9, 0, false)
    end
end
function tXTRA.vc_closeDoor(bU, c9)
    local ay = globalVehicleOwnership[bU]
    if ay then
        SetVehicleDoorShut(ay[2], c9)
    end
end
function tXTRA.vc_detachTrailer(bU)
    local ay = globalVehicleOwnership[bU]
    if ay then
        DetachVehicleFromTrailer(ay[2])
    end
end
function tXTRA.vc_detachTowTruck(bU)
    local ay = globalVehicleOwnership[bU]
    if ay then
        local c5 = GetEntityAttachedToTowTruck(ay[2])
        if IsEntityAVehicle(c5) then
            DetachVehicleFromTowTruck(ay[2], c5)
        end
    end
end
function tXTRA.vc_detachCargobob(bU)
    local ay = globalVehicleOwnership[bU]
    if ay then
        local c5 = GetVehicleAttachedToCargobob(ay[2])
        if IsEntityAVehicle(c5) then
            DetachVehicleFromCargobob(ay[2], c5)
        end
    end
end
function tXTRA.vc_toggleEngine(bU)
    local ay = globalVehicleOwnership[bU]
    if ay then
        local ca = Citizen.InvokeNative(0xAE31E7DF9B5B132E, ay[2])
        SetVehicleEngineOn(ay[2], not ca, true, true)
        if ca then
            SetVehicleUndriveable(ay[2], true)
        else
            SetVehicleUndriveable(ay[2], false)
        end
    end
end
function tXTRA.ensureEntityOwnership(ah)
    local aj = 0
    if not NetworkHasControlOfEntity(ah) then
        NetworkRequestControlOfEntity(ah)
        while not NetworkHasControlOfEntity(ah) and aj < 20 do
            Wait(100)
            aj = aj + 1
        end
        if aj <= 20 then
            return true
        else
            return false
        end
    else
        return true
    end
end
function tXTRA.vc_toggleLock(bU)
    local ay = globalVehicleOwnership[bU]
    if ay then
        local ak = ay[2]
        local cb = GetVehicleDoorLockStatus(ak) >= 2
        if tXTRA.ensureEntityOwnership(ak) then
            if cb then
                SetVehicleDoorsLockedForAllPlayers(ak, false)
                SetVehicleDoorsLocked(ak, 1)
                SetVehicleDoorsLockedForPlayer(ak, PlayerId(), false)
                tXTRA.notify("~g~Vehicle unlocked.")
            else
                SetVehicleDoorsLocked(ak, 2)
                SetVehicleDoorsLockedForAllPlayers(ak, true)
                tXTRA.notify("~r~Vehicle locked.")
            end
        else
            tXTRA.notify("~r~Failed to get ownership of vehicle to lock/unlock.")
        end
    end
end
AddEventHandler(
    "XTRA:johnnyCantMakeIt",
    function()
        SendNUIMessage({transactionType = "MPCT_ALAA_0" .. math.random(1, 5)})
    end
)
local cc = 0
local function cd()
    RenderScriptCams(false, false, 0, false, false)
    DestroyCam(cc, false)
    cc = 0
    DoScreenFadeIn(0)
    ClearFocus()
end
RegisterNetEvent(
    "XTRA:viewRemoteDashcam",
    function(a6, bm)
        if cc ~= 0 then
            DestroyCam(cc, false)
            return
        end
        DoScreenFadeOut(0)
        cc = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        SetCamActive(cc, true)
        SetCamCoord(cc, a6.x, a6.y, a6.z)
        RenderScriptCams(true, false, 0, true, true)
        SetFocusPosAndVel(a6.x, a6.y, a6.z, 0.0, 0.0, 0.0)
        RageUI.ActuallyCloseAll()
        local ce = GetGameTimer()
        while not NetworkDoesEntityExistWithNetworkId(bm) do
            if GetGameTimer() - ce > 5000 then
                cd()
                notify("~r~Can not view dashcam of vehicle.")
                return
            end
            Citizen.Wait(0)
        end
        local aB = NetworkGetEntityFromNetworkId(bm)
        if aB == 0 then
            cd()
            notify("~r~Can not view dashcam of vehicle.")
            return
        end
        DoScreenFadeIn(0)
        notify("~g~Viewing your vehicle dashcam.")
        while DoesEntityExist(aB) and IsCamActive(cc) and not IsControlJustPressed(0, 177) do
            local cf = GetWorldPositionOfEntityBone(aB, GetEntityBoneIndexByName(aB, "windscreen"))
            local cg = GetEntityRotation(aB, 2)
            SetCamCoord(cc, cf.x, cf.y, cf.z)
            SetFocusPosAndVel(cf.x, cf.y, cf.z, 0.0, 0.0, 0.0)
            SetCamRot(cc, cg.x, cg.y, cg.z, 2)
            Citizen.Wait(0)
        end
        notify("Stopped viewing your vehicle dashcam.")
        RenderScriptCams(false, false, 0, false, false)
        DestroyCam(cc)
        cc = 0
    end
)
local ch = 0
RegisterNetEvent(
    "XTRA:displayVehicleBlip",
    function(a6)
        if ch ~= 0 then
            RemoveBlip(ch)
        end
        if a6 then
            ch = AddBlipForCoord(a6.x, a6.y, a6.z)
            SetBlipSprite(ch, 56)
            SetBlipScale(ch, 1.0)
            SetBlipColour(ch, 2)
        end
    end
)
local ci = 0
Citizen.CreateThread(
    function()
        DecorRegister("biometricLock", 2)
        while true do
            local aB, cj = tXTRA.getPlayerVehicle()
            if aB ~= 0 and cj then
                local ck = DecorGetBool(aB, "biometricLock")
                if ck then
                    local bp = tXTRA.getUserId()
                    local cl = Entity(aB).state.biometricUsers
                    local cm = DecorGetInt(aB, "xtra_owner")
                    if bp ~= cm and not tXTRA.isDev() and (not cl or not table.has(cl, bp)) then
                        DisableControlAction(0, 32, true)
                        DisableControlAction(0, 33, true)
                        DisableControlAction(0, 34, true)
                        DisableControlAction(0, 35, true)
                        DisableControlAction(0, 71, true)
                        DisableControlAction(0, 72, true)
                        DisableControlAction(0, 87, true)
                        DisableControlAction(0, 88, true)
                        DisableControlAction(0, 129, true)
                        DisableControlAction(0, 130, true)
                        DisableControlAction(0, 107, true)
                        DisableControlAction(0, 170, true)
                        DisableControlAction(0, 108, true)
                        DisableControlAction(0, 109, true)
                        DisableControlAction(0, 110, true)
                        DisableControlAction(0, 111, true)
                        DisableControlAction(0, 112, true)
                        DisableControlAction(0, 350, true)
                        DisableControlAction(0, 244, true)
                        DisableControlAction(0, 351, true)
                        DisableControlAction(0, 289, true)
                        DisableControlAction(0, 187, true)
                        DisableControlAction(0, 188, true)
                        SetVehicleEngineOn(aB, false, true, true)
                        SetVehicleRocketBoostPercentage(aB, 0.0)
                        drawNativeText("This vehicle is locked biometrically to the owner.")
                    end
                end
            end
            if GetIsTaskActive(PlayerPedId(), 160) then
                local cn = GetVehiclePedIsEntering(PlayerPedId())
                if cn ~= 0 then
                    local co = GetVehicleDoorLockStatus(cn)
                    if co == 2 then
                        ci = cn
                    elseif co == 1 and cn == ci then
                        ClearPedTasks(PlayerPedId())
                        ci = 0
                    end
                end
            else
                ci = 0
            end
            Citizen.Wait(0)
        end
    end
)
function setVehicleIdBiometricLock(cp, cq, cr)
    if cq then
        DecorSetBool(cp, "biometricLock", cq)
    end
    if cr and #cr > 0 then
        local cs = false
        if not NetworkGetEntityIsNetworked(cp) or NetworkGetNetworkIdFromEntity(cp) == 0 then
            cs = true
        end
        Citizen.CreateThread(
            function()
                Citizen.Wait(cs and 2500 or 0)
                local bm = NetworkGetNetworkIdFromEntity(cp)
                TriggerServerEvent("XTRA:setBiometricUsersState", bm, cr)
            end
        )
    end
end
local ct = {
    [0] = "",
    [1] = "",
    [2] = "",
    [3] = "",
    [4] = "",
    [5] = "",
    [6] = "bnr34ffeng",
    [7] = "ta028viper",
    [8] = "rotary7",
    [9] = "lgcy12ferf40",
    [10] = "v6audiea839",
    [11] = "n55b30t0",
    [12] = "fordvoodoo",
    [13] = "ta103ninjah2r"
}
function getVehicleSoundNameFromId(c3)
    return ct[c3]
end
Citizen.CreateThread(
    function()
        while true do
            local cu, cf = tXTRA.getPlayerVehicle()
            if
                cu ~= 0 and not globalHideUi and GetVehicleClass(cu) ~= 14 and
                    (cf or GetPedInVehicleSeat(cu, 0) == PlayerPedId())
             then
                SendNUIMessage({showSpeed = true, speed = math.ceil(GetEntitySpeed(cu) * 2.2369)})
            else
                SendNUIMessage({showSpeed = false, speed = 0})
            end
            Citizen.Wait(50)
        end
    end
)
local cv = {}
Citizen.CreateThread(
    function()
        while true do
            for M, aB in pairs(GetGamePool("CVehicle")) do
                if not cv[aB] and DecorExistOn(aB, "lsAudioId") then
                    local c3 = DecorGetInt(aB, "lsAudioId")
                    local cw = getVehicleSoundNameFromId(c3)
                    ForceVehicleEngineAudio(aB, cw)
                    cv[aB] = true
                end
            end
            Citizen.Wait(2000)
        end
    end
)
