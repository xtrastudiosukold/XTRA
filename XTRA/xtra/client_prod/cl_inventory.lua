drawInventoryUI = false
local a = false
local b = false
local c = false
local d = 0.00
local e = 0.00
local f = nil
local g = nil
local h = nil
local i = false
local j = nil
local k = 0
local l = 0
local m = false
local currentInventoryMaxWeight = 30
local n = {
    ["9mm Bullets"] = true,
    ["12 Gauge Bullets"] = true,
    [".308 Sniper Rounds"] = true,
    ["7.62mm Bullets"] = true,
    ["5.56mm NATO"] = true,
    [".357 Bullets"] = true,
    ["Police Issued 5.56mm"] = true,
    ["Police Issued .308 Sniper Rounds"] = true,
    ["Police Issued 9mm"] = true,
    ["Police Issued 12 Gauge"] = true
}
local o = json.decode(GetResourceKvpString("xtra_gang_inv_colour")) or {r = 0, g = 50, b = 142}
local p = nil
local q = nil
local r = nil
local s = false
inventoryType = nil
local t = false
local function u()
    if IsUsingKeyboard(2) and not tXTRA.isInComa() and not tXTRA.isHandcuffed() then
        TriggerServerEvent("XTRA:FetchPersonalInventory")
        if not i then
            drawInventoryUI = not drawInventoryUI
            if drawInventoryUI then
                setCursor(1)
            else
                setCursor(0)
                inGUIXTRA = false
                if p then
                    tXTRA.vc_closeDoor(q, 5)
                    p = nil
                    q = nil
                    r = nil
                    TriggerEvent("XTRA:clCloseTrunk")
                end
                inventoryType = nil
                FRSecondItemList = {}
            end
        else
            tXTRA.notify("~r~Cannot open inventory right before a restart!")
        end
    end
end
RegisterCommand("inventory", u, false)
RegisterKeyMapping("inventory", "Open Inventory", "KEYBOARD", "L")
Citizen.CreateThread(
    function()
        while true do
            if drawInventoryUI and IsDisabledControlJustReleased(0, 200) then
                u()
            end
            Wait(0)
        end
    end
)
local v = {}
local w = 0
local FRSecondItemList = {}
local x = 0
local y = 14
function tXTRA.getSpaceInFirstChest()
    return currentInventoryMaxWeight - d
end
function tXTRA.getSpaceInSecondChest()
    local z = 0
    if next(FRSecondItemList) == nil then
        return e
    else
        for u, w in pairs(FRSecondItemList) do
            z = z + w.amount * w.Weight
        end
        return e - z
    end
end
RegisterNetEvent(
    "XTRA:FetchPersonalInventory",
    function(A, B, C)
        v = A
        d = B
        currentInventoryMaxWeight = C
    end
)
RegisterNetEvent(
    "XTRA:SendSecondaryInventoryData",
    function(x, y, D, E)
        if E ~= nil then
            r = E
            inventoryType = "CarBoot"
        end
        FRSecondItemList = x
        e = D
        c = true
        drawInventoryUI = true
        setCursor(1)
        if D then
            g = D
            h = GetEntityCoords(tXTRA.getPlayerPed())
            if D == "notmytrunk" then
                j = GetEntityCoords(tXTRA.getPlayerPed())
            end
            if string.match(D, "player_") then
                l = string.gsub(D, "player_", "")
            else
                l = 0
            end
        end
    end
)
RegisterNetEvent("XTRA:CloseToRestart", function(x)
    CloseToRestart = true 
    TriggerServerEvent("XTRA:CloseToRestarting")
    Citizen.CreateThread(function()
        while true do
            FRSecondItemList = {}
            c = false
            drawInventoryUI = false
            setCursor(0)
            Wait(50)
        end
    end)
end)
RegisterNetEvent(
    "XTRA:closeSecondInventory",
    function()
        FRSecondItemList = {}
        c = false
        drawInventoryUI = false
        g = nil
        setCursor(0)
    end
)
AddEventHandler(
    "XTRA:clCloseTrunk",
    function()
        c = false
        drawInventoryUI = false
        g = nil
        setCursor(0)
        f = nil
        inGUIXTRA = false
        FRSecondItemList = {}
    end
)
AddEventHandler(
    "XTRA:clOpenTrunk",
    function()
        local F, G, H = tXTRA.getNearestOwnedVehicle(3.5)
        r = G
        q = H
        if F and IsPedInAnyVehicle(GetPlayerPed(-1), false) == false then
            p = GetEntityCoords(PlayerPedId())
            tXTRA.vc_openDoor(G, 5)
            inventoryType = "CarBoot"
            TriggerServerEvent("XTRA:FetchTrunkInventory", G)
        else
            tXTRA.notify("~r~You don't have the keys to this vehicle!")
        end
    end
)
Citizen.CreateThread(
    function()
        while true do
            if f ~= nil and c then
                local I = GetEntityCoords(tXTRA.getPlayerPed())
                local J = GetEntityCoords(f)
                local K = #(I - J)
                if K > 10.0 then
                    TriggerEvent("XTRA:clCloseTrunk")
                    TriggerServerEvent("XTRA:closeChest")
                end
            end
            if g == "house" and c then
                local I = GetEntityCoords(tXTRA.getPlayerPed())
                local J = h
                local K = #(I - J)
                if K > 5.0 then
                    TriggerEvent("XTRA:clCloseTrunk")
                    TriggerServerEvent("XTRA:closeChest")
                end
            end
            if g == "notmytrunk" and c then
                local I = GetEntityCoords(tXTRA.getPlayerPed())
                local J = j
                local K = #(I - J)
                if K > 5.0 then
                    TriggerEvent("XTRA:clCloseTrunk")
                    TriggerServerEvent("XTRA:closeChest")
                end
            end
            if l ~= 0 and c then
                local I = GetEntityCoords(tXTRA.getPlayerPed())
                local J = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(tonumber(l))))
                local K = #(I - J)
                if K > 5.0 then
                    TriggerEvent("XTRA:clCloseTrunk")
                    TriggerServerEvent("XTRA:closeChest")
                end
            end
            if f == nil and g == "trunk" then
                c = false
                drawInventoryUI = false
            end
            Wait(500)
        end
    end
)
local function L(M, N)
    local O = sortAlphabetically(M)
    local P = #O
    local Q = N * y
    local R = {}
    for S = Q + 1, math.min(Q + y, P) do
        table.insert(R, O[S])
    end
    return R
end
Citizen.CreateThread(function()
        while true do
            if drawInventoryUI then
                DrawRect(0.5, 0.53, 0.572, 0.508, 0, 0, 0, 150)
                DrawAdvancedText(
                    0.593,
                    0.235,
                    0.005,
                    0.0028,
                    0.66,
                    "XTRA INVENTORY",
                    255,
                    255,
                    255,
                    255,
                    tXTRA.getFontId("Akrobat-ExtraBold"),
                    0
                )
                DrawRect(0.5, 0.24, 0.572, 0.058, 0, 0, 0, 225)
                DrawRect(0.342, 0.536, 0.215, 0.436, 0, 0, 0, 150)
                DrawRect(0.652, 0.537, 0.215, 0.436, 0, 0, 0, 150)
                if s then
                    DrawAdvancedText(0.664, 0.305, 0.005, 0.0028, 0.325, "Loot All", 255, 255, 255, 255, 6, 0)
                end
                if c and r then
                    DrawAdvancedText(0.440, 0.305, 0.005, 0.0028, 0.325, "Transfer All", 255, 255, 255, 255, 6, 0)
                end
                if next(v) then
                    DrawAdvancedText(0.355, 0.305, 0.005, 0.0028, 0.325, "Equip All", 255, 255, 255, 255, 6, 0)
                end
                if m then
                    DrawAdvancedText(0.575, 0.364, 0.005, 0.0028, 0.325, "Use", 255, 255, 255, 255, 6, 0)
                    DrawAdvancedText(0.615, 0.364, 0.005, 0.0028, 0.325, "Use All", 255, 255, 255, 255, 6, 0)
                    DrawAdvancedText(0.575, 0.634, 0.005, 0.0028, 0.35, "Give X", 255, 255, 255, 255, 6, 0)
                    DrawAdvancedText(0.615, 0.634, 0.005, 0.0028, 0.35, "Give All", 255, 255, 255, 255, 6, 0)
                else
                    DrawAdvancedText(
                        0.595,
                        0.634,
                        0.005,
                        0.0028,
                        0.35,
                        "Give to Nearest Player",
                        255,
                        255,
                        255,
                        255,
                        6,
                        0
                    )
                    DrawAdvancedText(0.594, 0.364, 0.005, 0.0028, 0.4, "Use", 255, 255, 255, 255, 6, 0)
                end
                DrawAdvancedText(0.594, 0.454, 0.005, 0.0028, 0.4, "Move", 255, 255, 255, 255, 6, 0)
                DrawAdvancedText(0.575, 0.545, 0.005, 0.0028, 0.325, "Move X", 255, 255, 255, 255, 6, 0)
                DrawAdvancedText(0.615, 0.545, 0.005, 0.0028, 0.325, "Move All", 255, 255, 255, 255, 6, 0)
                DrawAdvancedText(0.594, 0.722, 0.005, 0.0028, 0.4, "Trash", 255, 255, 255, 255, 6, 0)
                DrawAdvancedText(0.488, 0.335, 0.005, 0.0028, 0.366, "Amount", 255, 255, 255, 255, 4, 0)
                DrawAdvancedText(0.404, 0.335, 0.005, 0.0028, 0.366, "Item Name", 255, 255, 255, 255, 4, 0)
                DrawAdvancedText(0.521, 0.335, 0.005, 0.0028, 0.366, "Weight", 255, 255, 255, 255, 4, 0)
                DrawAdvancedText(0.833, 0.776, 0.005, 0.0028, 0.288, "[Press L to close]", 255, 255, 255, 255, 4, 0)
                DrawRect(0.5, 0.273, 0.572, 0.0069999999999999, o.r, o.g, o.b, 150)
                DisableControlAction(0, 200, true)
                if table.count(v) > y then
                    DrawAdvancedText(0.528, 0.742, 0.005, 0.0008, 0.4, "Next", 255, 255, 255, 255, 6, 0)
                    if
                        CursorInArea(0.412, 0.432, 0.72, 0.76) and
                            (IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329))
                     then
                        local T = math.floor(table.count(v) / y)
                        w = math.min(w + 1, T)
                    end
                    DrawAdvancedText(0.349, 0.742, 0.005, 0.0008, 0.4, "Previous", 255, 255, 255, 255, 6, 0)
                    if
                        CursorInArea(0.239, 0.269, 0.72, 0.76) and
                            (IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329))
                     then
                        w = math.max(w - 1, 0)
                    end
                end
                inGUIXTRA = true
                if not c then
                    DrawAdvancedText(
                        0.751,
                        0.525,
                        0.005,
                        0.0028,
                        0.49,
                        "2nd Inventory not available",
                        255,
                        255,
                        255,
                        118,
                        6,
                        0
                    )
                elseif g ~= nil then
                    DrawAdvancedText(0.798, 0.335, 0.005, 0.0028, 0.366, "Amount", 255, 255, 255, 255, 4, 0)
                    DrawAdvancedText(0.714, 0.335, 0.005, 0.0028, 0.366, "Item Name", 255, 255, 255, 255, 4, 0)
                    DrawAdvancedText(0.831, 0.335, 0.005, 0.0028, 0.366, "Weight", 255, 255, 255, 255, 4, 0)
                    local U = 0.026
                    local V = 0.026
                    local W = 0
                    local X = 0
                    for Y, Z in pairs(sortAlphabetically(FRSecondItemList)) do
                        X = X + Z["value"].amount * Z["value"].Weight
                    end
                    local _ = L(FRSecondItemList, x)
                    if #_ == 0 then
                        x = 0
                    end
                    for Y, Z in pairs(_) do
                        local a0 = Z.title
                        local a1 = Z["value"]
                        local a2, a3, z = a1.ItemName, a1.amount, a1.Weight
                        DrawAdvancedText(0.714, 0.360 + W * V, 0.005, 0.0028, 0.366, a2, 255, 255, 255, 255, 4, 0)
                        DrawAdvancedText(
                            0.831,
                            0.360 + W * V,
                            0.005,
                            0.0028,
                            0.366,
                            tostring(z * a3) .. "kg",
                            255,
                            255,
                            255,
                            255,
                            4,
                            0
                        )
                        DrawAdvancedText(0.798, 0.360 + W * V, 0.005, 0.0028, 0.366, a3, 255, 255, 255, 255, 4, 0)
                        if CursorInArea(0.5443, 0.7584, 0.3435 + W * V, 0.3690 + W * V) then
                            DrawRect(0.652, 0.331 + U * (W + 1), 0.215, 0.026, o.r, o.g, o.b, 150)
                            if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                                PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                if not lockInventorySoUserNoSpam then
                                    b = a0
                                    a = false
                                    k = a3
                                    selectedItemWeight = z
                                    lockInventorySoUserNoSpam = true
                                    Citizen.CreateThread(
                                        function()
                                            Wait(250)
                                            lockInventorySoUserNoSpam = false
                                        end
                                    )
                                end
                            end
                        elseif a0 == b then
                            DrawRect(0.652, 0.331 + U * (W + 1), 0.215, 0.026, o.r, o.g, o.b, 150)
                        end
                        W = W + 1
                    end
                    if X / e > 0.5 then
                        if X / e > 0.9 then
                            DrawAdvancedText(
                                0.826,
                                0.307,
                                0.005,
                                0.0028,
                                0.366,
                                "Weight: " .. X .. "/" .. e .. "kg",
                                255,
                                50,
                                0,
                                255,
                                4,
                                0
                            )
                        else
                            DrawAdvancedText(
                                0.826,
                                0.307,
                                0.005,
                                0.0028,
                                0.366,
                                "Weight: " .. X .. "/" .. e .. "kg",
                                255,
                                165,
                                0,
                                255,
                                4,
                                0
                            )
                        end
                    else
                        DrawAdvancedText(
                            0.826,
                            0.307,
                            0.005,
                            0.0028,
                            0.366,
                            "Weight: " .. X .. "/" .. e .. "kg",
                            255,
                            255,
                            153,
                            255,
                            4,
                            0
                        )
                    end
                    if table.count(FRSecondItemList) > y then
                        DrawAdvancedText(0.84, 0.742, 0.005, 0.0008, 0.4, "Next", 255, 255, 255, 255, 6, 0)
                        if
                            CursorInArea(0.735, 0.755, 0.72, 0.76) and
                                (IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329))
                         then
                            local T = math.floor(table.count(FRSecondItemList) / y)
                            x = math.min(x + 1, T)
                        end
                        DrawAdvancedText(0.661, 0.742, 0.005, 0.0008, 0.4, "Previous", 255, 255, 255, 255, 6, 0)
                        if
                            CursorInArea(0.55, 0.58, 0.72, 0.76) and
                                (IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329))
                         then
                            x = math.max(x - 1, 0)
                        end
                    end
                end
                if m then
                    if CursorInArea(0.46, 0.496, 0.33, 0.383) then
                        DrawRect(0.48, 0.359, 0.0375, 0.056, o.r, o.g, o.b, 150)
                        if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                            PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                            if not lockInventorySoUserNoSpam then
                                if a then
                                    TriggerServerEvent("XTRA:UseItem", a, "Plr")
                                elseif b and g ~= nil and c then
                                    FRserver.useInventoryItem({b})
                                else
                                    tXTRA.notify("~r~No item selected!")
                                end
                            end
                            lockInventorySoUserNoSpam = true
                            Citizen.CreateThread(
                                function()
                                    Wait(250)
                                    lockInventorySoUserNoSpam = false
                                end
                            )
                        end
                    else
                        DrawRect(0.48, 0.359, 0.0375, 0.056, 0, 0, 0, 150)
                    end
                    if CursorInArea(0.501, 0.536, 0.329, 0.381) then
                        DrawRect(0.52, 0.359, 0.0375, 0.056, o.r, o.g, o.b, 150)
                        if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                            PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                            if not lockInventorySoUserNoSpam then
                                if a then
                                    TriggerServerEvent("XTRA:UseAllItem", a, "Plr")
                                elseif b and g ~= nil and c then
                                    FRserver.useInventoryItem({b})
                                else
                                    tXTRA.notify("~r~No item selected!")
                                end
                            end
                            lockInventorySoUserNoSpam = true
                            Citizen.CreateThread(
                                function()
                                    Wait(250)
                                    lockInventorySoUserNoSpam = false
                                end
                            )
                        end
                    else
                        DrawRect(0.52, 0.359, 0.0375, 0.056, 0, 0, 0, 150)
                    end
                else
                    if CursorInArea(0.4598, 0.5333, 0.3283, 0.3848) then
                        DrawRect(0.5, 0.36, 0.075, 0.056, o.r, o.g, o.b, 150)
                        if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                            PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                            if not lockInventorySoUserNoSpam then
                                if a then
                                    TriggerServerEvent("XTRA:UseItem", a, "Plr")
                                elseif b and g ~= nil and c then
                                else
                                    tXTRA.notify("~r~No item selected!")
                                end
                            end
                            lockInventorySoUserNoSpam = true
                            Citizen.CreateThread(
                                function()
                                    Wait(250)
                                    lockInventorySoUserNoSpam = false
                                end
                            )
                        end
                    else
                        DrawRect(0.5, 0.36, 0.075, 0.056, 0, 0, 0, 150)
                    end
                end
                if not m then
                    if CursorInArea(0.4598, 0.5333, 0.5931, 0.6477) then
                        DrawRect(0.5, 0.63, 0.075, 0.056, o.r, o.g, o.b, 150)
                        if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                            PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                            if not lockInventorySoUserNoSpam then
                                if a then
                                    TriggerServerEvent("XTRA:GiveItem", a, "Plr")
                                elseif b then
                                    FRserver.giveToNearestPlayer({b})
                                else
                                    tXTRA.notify("~r~No item selected!")
                                end
                            end
                            lockInventorySoUserNoSpam = true
                            Citizen.CreateThread(
                                function()
                                    Wait(250)
                                    lockInventorySoUserNoSpam = false
                                end
                            )
                        end
                    else
                        DrawRect(0.5, 0.63, 0.075, 0.056, 0, 0, 0, 150)
                    end
                end
                if CursorInArea(0.4598, 0.5333, 0.418, 0.4709) then
                    DrawRect(0.5, 0.45, 0.075, 0.056, o.r, o.g, o.b, 150)
                    if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                        PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                        if not lockInventorySoUserNoSpam then
                            if c then
                                if a and g ~= nil and c then
                                    if tXTRA.isPurge() then
                                        notify("~r~No items will be saved during a purge.")
                                    end
                                    if tXTRA.getPlayerCombatTimer() > 0 then
                                        notify("~r~You can not store items whilst in combat.")
                                    else
                                        if inventoryType == "CarBoot" then
                                            TriggerServerEvent("XTRA:MoveItem", "Plr", a, r, false)
                                        elseif inventoryType == "Housing" then
                                            TriggerServerEvent("XTRA:MoveItem", "Plr", a, "home", false)
                                        elseif inventoryType == "Crate" then
                                            TriggerServerEvent("XTRA:MoveItem", "Plr", a, "crate", false)
                                        elseif s then
                                            TriggerServerEvent("XTRA:MoveItem", "Plr", a, "LootBag", true)
                                        end
                                    end
                                elseif b and g ~= nil and c then
                                    if inventoryType == "CarBoot" then
                                        TriggerServerEvent("XTRA:MoveItem", inventoryType, b, r, false)
                                    elseif inventoryType == "Housing" then
                                        TriggerServerEvent("XTRA:MoveItem", inventoryType, b, "home", false)
                                    elseif inventoryType == "Crate" then
                                        TriggerServerEvent("XTRA:MoveItem", inventoryType, b, "crate", false)
                                    else
                                        TriggerServerEvent("XTRA:MoveItem", "LootBag", b, LootBagIDNew, true)
                                    end
                                else
                                    tXTRA.notify("~r~No item selected!")
                                end
                            else
                                tXTRA.notify("~r~No second inventory available!")
                            end
                        end
                        lockInventorySoUserNoSpam = true
                        Citizen.CreateThread(
                            function()
                                Wait(250)
                                lockInventorySoUserNoSpam = false
                            end
                        )
                    end
                else
                    DrawRect(0.5, 0.45, 0.075, 0.056, 0, 0, 0, 150)
                end
                if CursorInArea(0.4598, 0.498, 0.5042, 0.5666) then
                    DrawRect(0.48, 0.54, 0.0375, 0.056, o.r, o.g, o.b, 150)
                    if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                        PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                        local a4 = tonumber(GetInvAmountText()) or 1
                        if not lockInventorySoUserNoSpam then
                            if c then
                                if a and g ~= nil and c then
                                    if tXTRA.isPurge() then
                                        notify("~r~You can not store items during a purge.")
                                        return
                                    end
                                    if tXTRA.getPlayerCombatTimer() > 0 then
                                        notify("~r~You can not store items whilst in combat.")
                                    else
                                        if inventoryType == "CarBoot" then
                                            TriggerServerEvent("XTRA:MoveItemX", "Plr", a, r, false, a4)
                                        elseif inventoryType == "Housing" then
                                            TriggerServerEvent("XTRA:MoveItemX", "Plr", a, "home", false, a4)
                                        elseif inventoryType == "Crate" then
                                            TriggerServerEvent("XTRA:MoveItemX", "Plr", a, "crate", false, a4)
                                        elseif s then
                                            TriggerServerEvent("XTRA:MoveItemX", "Plr", a, "LootBag", true, a4)
                                        end
                                    end
                                elseif b and g ~= nil and c then
                                    if inventoryType == "CarBoot" then
                                        TriggerServerEvent("XTRA:MoveItemX", inventoryType, b, r, false, a4)
                                    elseif inventoryType == "Housing" then
                                        TriggerServerEvent("XTRA:MoveItemX", inventoryType, b, "home", false, a4)
                                    elseif inventoryType == "Crate" then
                                        TriggerServerEvent("XTRA:MoveItemX", inventoryType, b, "crate", false, a4)
                                    else
                                        TriggerServerEvent("XTRA:MoveItemX", "LootBag", b, LootBagIDNew, true, a4)
                                    end
                                else
                                    tXTRA.notify("~r~No item selected!")
                                end
                            else
                                tXTRA.notify("~r~No second inventory available!")
                            end
                        end
                        lockInventorySoUserNoSpam = true
                        Citizen.CreateThread(
                            function()
                                Wait(250)
                                lockInventorySoUserNoSpam = false
                            end
                        )
                    end
                else
                    DrawRect(0.48, 0.54, 0.0375, 0.056, 0, 0, 0, 150)
                end
                if CursorInArea(0.5004, 0.5333, 0.5042, 0.5666) then
                    DrawRect(0.52, 0.54, 0.0375, 0.056, o.r, o.g, o.b, 150)
                    if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                        PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                        if not lockInventorySoUserNoSpam then
                            if c then
                                if a and g ~= nil and c then
                                    local L = tXTRA.getSpaceInSecondChest()
                                    local a4 = k
                                    if k * selectedItemWeight > L then
                                        a4 = math.floor(L / selectedItemWeight)
                                    end
                                    if a4 > 0 then
                                        if tXTRA.isPurge() then
                                            notify("~r~You can not store items during a purge.")
                                            return
                                        end
                                        if tXTRA.getPlayerCombatTimer() > 0 then
                                            notify("~r~You can not store items whilst in combat.")
                                        else
                                            if inventoryType == "CarBoot" then
                                                TriggerServerEvent(
                                                    "XTRA:MoveItemAll",
                                                    "Plr",
                                                    a,
                                                    r,
                                                    NetworkGetNetworkIdFromEntity(tXTRA.getNearestVehicle(3))
                                                )
                                            elseif inventoryType == "Housing" then
                                                TriggerServerEvent("XTRA:MoveItemAll", "Plr", a, "home")
                                            elseif inventoryType == "Crate" then
                                                TriggerServerEvent("XTRA:MoveItemAll", "Plr", a, "crate")
                                            elseif s then
                                                TriggerServerEvent("XTRA:MoveItemAll", "Plr", a, "LootBag")
                                            end
                                        end
                                    else
                                        tXTRA.notify("~r~Not enough space in secondary chest!")
                                    end
                                elseif b and g ~= nil and c then
                                    local M = tXTRA.getSpaceInFirstChest()
                                    local a4 = k
                                    if k * selectedItemWeight > M then
                                        a4 = math.floor(M / selectedItemWeight)
                                    end
                                    if a4 > 0 then
                                        if inventoryType == "CarBoot" then
                                            TriggerServerEvent(
                                                "XTRA:MoveItemAll",
                                                inventoryType,
                                                b,
                                                r,
                                                NetworkGetNetworkIdFromEntity(tXTRA.getNearestVehicle(3))
                                            )
                                        elseif inventoryType == "Housing" then
                                            TriggerServerEvent("XTRA:MoveItemAll", inventoryType, b, "home")
                                        elseif inventoryType == "Crate" then
                                            TriggerServerEvent("XTRA:MoveItemAll", inventoryType, b, "crate")
                                        else
                                            TriggerServerEvent("XTRA:MoveItemAll", "LootBag", b, LootBagIDNew)
                                        end
                                    else
                                        tXTRA.notify("~r~Not enough space in secondary chest!")
                                    end
                                else
                                    tXTRA.notify("~r~No item selected!")
                                end
                            else
                                tXTRA.notify("~r~No second inventory available!")
                            end
                        end
                        lockInventorySoUserNoSpam = true
                        Citizen.CreateThread(
                            function()
                                Wait(250)
                                lockInventorySoUserNoSpam = false
                            end
                        )
                    end
                else
                    DrawRect(0.52, 0.54, 0.0375, 0.056, 0, 0, 0, 150)
                end
                if m then
                    if CursorInArea(0.4598, 0.498, 0.5931, 0.6477) then
                        DrawRect(0.48, 0.63, 0.0375, 0.056, o.r, o.g, o.b, 150)
                        if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                            PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                            if not lockInventorySoUserNoSpam then
                                if a then
                                    TriggerServerEvent("XTRA:GiveItem", a, "Plr")
                                elseif b then
                                    FRserver.giveToNearestPlayer({b})
                                else
                                    tXTRA.notify("~r~No item selected!")
                                end
                            end
                            lockInventorySoUserNoSpam = true
                            Citizen.CreateThread(
                                function()
                                    Wait(250)
                                    lockInventorySoUserNoSpam = false
                                end
                            )
                        end
                    else
                        DrawRect(0.48, 0.63, 0.0375, 0.056, 0, 0, 0, 150)
                    end
                end
                if m then
                    if CursorInArea(0.5004, 0.5333, 0.5931, 0.6477) then
                        DrawRect(0.52, 0.63, 0.0375, 0.056, o.r, o.g, o.b, 150)
                        if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                            PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                            if not lockInventorySoUserNoSpam then
                                if a then
                                    TriggerServerEvent("XTRA:GiveItemAll", a, "Plr")
                                elseif b then
                                    FRserver.giveToNearestPlayer({b})
                                else
                                    tXTRA.notify("~r~No item selected!")
                                end
                            end
                            lockInventorySoUserNoSpam = true
                            Citizen.CreateThread(
                                function()
                                    Wait(250)
                                    lockInventorySoUserNoSpam = false
                                end
                            )
                        end
                    else
                        DrawRect(0.52, 0.63, 0.0375, 0.056, 0, 0, 0, 150)
                    end
                end
                if s then
                    if CursorInArea(0.5428, 0.5952, 0.2879, 0.3111) then
                        DrawRect(0.5695, 0.3, 0.05, 0.025, o.r, o.g, o.b, 150)
                        if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                            PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                            if not lockInventorySoUserNoSpam then
                                TriggerServerEvent("XTRA:LootItemAll", LootBagIDNew)
                            end
                            lockInventorySoUserNoSpam = true
                            Citizen.CreateThread(
                                function()
                                    Wait(250)
                                    lockInventorySoUserNoSpam = false
                                end
                            )
                        end
                    else
                        DrawRect(0.5695, 0.3, 0.05, 0.025, 0, 0, 0, 150)
                    end
                end
                if next(v) then
                    if CursorInArea(0.233854, 0.282813, 0.287037, 0.308333) then
                        DrawRect(0.2600, 0.3, 0.05, 0.025, o.r, o.g, o.b, 150)
                        if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                            PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                            if not lockInventorySoUserNoSpam then
                                TriggerServerEvent("XTRA:EquipAll")
                            end
                            lockInventorySoUserNoSpam = true
                            Citizen.CreateThread(
                                function()
                                    Wait(250)
                                    lockInventorySoUserNoSpam = false
                                end
                            )
                        end
                    else
                        DrawRect(0.2600, 0.3, 0.05, 0.025, 0, 0, 0, 150)
                    end
                end
                if c and r then
                    if CursorInArea(0.32000, 0.37000, 0.287037, 0.308333) then
                        DrawRect(0.3453, 0.3, 0.05, 0.025, o.r, o.g, o.b, 150)
                        if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                            PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                            if not lockInventorySoUserNoSpam then
                                TriggerServerEvent("XTRA:TransferAll",r)
                            end
                            lockInventorySoUserNoSpam = true
                            Citizen.CreateThread(function()
                                Wait(250)
                                lockInventorySoUserNoSpam = false
                            end)
                        end
                    else
                        DrawRect(0.3453, 0.3, 0.05, 0.025, 0, 0, 0, 150)
                    end
                end
                if CursorInArea(0.4598, 0.5333, 0.6831, 0.7377) then
                    DrawRect(0.5, 0.72, 0.075, 0.056, o.r, o.g, o.b, 150)
                    if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                        PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                        if not lockInventorySoUserNoSpam then
                            if a then
                                TriggerServerEvent("XTRA:TrashItem", a, "Plr")
                            elseif b then
                                tXTRA.notify("~r~Please move the item to your inventory to trash")
                            else
                                tXTRA.notify("~r~No item selected!")
                            end
                        end
                        lockInventorySoUserNoSpam = true
                        Citizen.CreateThread(
                            function()
                                Wait(250)
                                lockInventorySoUserNoSpam = false
                            end
                        )
                    end
                else
                    DrawRect(0.5, 0.72, 0.075, 0.056, 0, 0, 0, 150)
                end
                local U = 0.026
                local V = 0.026
                local W = 0
                local X = 0
                local a5 = sortAlphabetically(v)
                for Y, Z in pairs(a5) do
                    local a0 = Z.title
                    local a1 = Z["value"]
                    local a2, a3, z = a1.ItemName, a1.amount, a1.Weight
                    X = X + a3 * z
                    DrawAdvancedText(0.404, 0.360 + W * V, 0.005, 0.0028, 0.366, a2, 255, 255, 255, 255, 4, 0)
                    DrawAdvancedText(
                        0.521,
                        0.360 + W * V,
                        0.005,
                        0.0028,
                        0.366,
                        tostring(z * a3) .. "kg",
                        255,
                        255,
                        255,
                        255,
                        4,
                        0
                    )
                    DrawAdvancedText(0.488, 0.360 + W * V, 0.005, 0.0028, 0.366, a3, 255, 255, 255, 255, 4, 0)
                    if CursorInArea(0.2343, 0.4484, 0.3435 + W * V, 0.3690 + W * V) then
                        DrawRect(0.342, 0.331 + U * (W + 1), 0.215, 0.026, o.r, o.g, o.b, 150)
                        if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then
                            PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                            a = a0
                            if n[a] then
                                m = true
                            else
                                m = false
                            end
                            k = a3
                            selectedItemWeight = z
                            b = false
                        end
                    elseif a0 == a then
                        DrawRect(0.342, 0.331 + U * (W + 1), 0.215, 0.026, o.r, o.g, o.b, 150)
                    end
                    W = W + 1
                end
                if X / currentInventoryMaxWeight > 0.5 then
                    if X / currentInventoryMaxWeight > 0.9 then
                        DrawAdvancedText(
                            0.516,
                            0.307,
                            0.005,
                            0.0028,
                            0.366,
                            "Weight: " .. X .. "/" .. currentInventoryMaxWeight .. "kg",
                            255,
                            50,
                            0,
                            255,
                            4,
                            0
                        )
                    else
                        DrawAdvancedText(
                            0.516,
                            0.307,
                            0.005,
                            0.0028,
                            0.366,
                            "Weight: " .. X .. "/" .. currentInventoryMaxWeight .. "kg",
                            255,
                            165,
                            0,
                            255,
                            4,
                            0
                        )
                    end
                else
                    DrawAdvancedText(
                        0.516,
                        0.307,
                        0.005,
                        0.0028,
                        0.366,
                        "Weight: " .. X .. "/" .. currentInventoryMaxWeight .. "kg",
                        255,
                        255,
                        255,
                        255,
                        4,
                        0
                    )
                end
            end
            Wait(0)
        end
    end
)
Citizen.CreateThread(
    function()
        while true do
            if GetEntityHealth(tXTRA.getPlayerPed()) <= 102 then
                FRSecondItemList = {}
                c = false
                drawInventoryUI = false
                inGUIXTRA = false
                setCursor(0)
            end
            Wait(50)
        end
    end
)
function GetInvAmountText()
    AddTextEntry("FMMC_MPM_NA", "Enter amount: (Blank to cancel)")
    DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "Enter amount: (Blank to cancel)", "", "", "", "", 30)
    while UpdateOnscreenKeyboard() == 0 do
        DisableAllControlActions(0)
        Wait(0)
    end
    if GetOnscreenKeyboardResult() then
        local N = GetOnscreenKeyboardResult()
        return N
    end
    return nil
end
Citizen.CreateThread(
    function()
        while true do
            Wait(250)
            if p then
                if #(p - GetEntityCoords(PlayerPedId())) > 8.0 then
                    drawInventoryUI = false
                    tXTRA.vc_closeDoor(q, 5)
                    p = nil
                    q = nil
                    r = nil
                    inventoryType = nil
                end
            end
            if drawInventoryUI then
                if
                    tXTRA.isInComa() or
                        inventoryType == "Crate" and
                            GetClosestObjectOfType(
                                GetEntityCoords(PlayerPedId()),
                                5.0,
                                GetHashKey("xs_prop_arena_crate_01a"),
                                false,
                                false,
                                false
                            ) == 0
                 then
                    TriggerEvent("XTRA:InventoryOpen", false)
                    if p then
                        tXTRA.vc_closeDoor(q, 5)
                        p = nil
                        q = nil
                        r = nil
                    end
                end
            end
        end
    end
)
function LoadAnimDict(a6)
    while not HasAnimDictLoaded(a6) do
        RequestAnimDict(a6)
        Citizen.Wait(5)
    end
end
RegisterNetEvent("XTRA:InventoryOpen")
AddEventHandler(
    "XTRA:InventoryOpen",
    function(a7, a8, a9)
        s = a8
        LootBagIDNew = a9
        if a7 and not i then
            drawInventoryUI = true
            setCursor(1)
            inGUIXTRA = true
        else
            drawInventoryUI = false
            setCursor(0)
            FRSecondItemList = {}
            inGUIXTRA = false
            inventoryType = nil
            local aa = PlayerPedId()
            local X = GetEntityCoords(aa)
            ClearPedTasks(aa)
            ForcePedAiAndAnimationUpdate(aa, false, false)
            if tXTRA.getPlayerVehicle() == 0 then
                SetEntityCoordsNoOffset(aa, X.x, X.y, X.z + 0.1, true, false, false)
            end
        end
    end
)
function tXTRA.setInventoryColour()
    tXTRA.clientPrompt(
        "Enter rgb value eg 255,100,150:",
        "",
        function(aa)
            if aa ~= "" then
                local I = stringsplit(aa, ",")
                if I[1] ~= nil and I[2] ~= nil and I[3] ~= nil then
                    o.r = tonumber(I[1])
                    o.g = tonumber(I[2])
                    o.b = tonumber(I[3])
                    tXTRA.notify("~g~Inventory colour updated.")
                else
                    tXTRA.notify("~r~Invalid value")
                end
            else
                tXTRA.notify("~r~Invalid value")
            end
            SetResourceKvp("xtra_gang_inv_colour", json.encode(o))
        end
    )
end
