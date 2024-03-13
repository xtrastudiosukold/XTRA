licensecentre = module("cfg/cfg_licensecentre")
local a = {}
RMenu.Add(
    "xtralicenses",
    "main",
    RageUI.CreateMenu(
        "",
        "~b~" .. "Job Centre",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "xtra_licenseui",
        "xtra_licenseui"
    )
)
RMenu.Add(
    "xtralicenses",
    "ownedlicenses",
    RageUI.CreateSubMenu(RMenu:Get("mglicenses", "main", tXTRA.getRageUIMenuWidth(), tXTRA.getRageUIMenuHeight()))
)
RMenu.Add(
    "xtralicenses",
    "buyconfirm",
    RageUI.CreateSubMenu(
        RMenu:Get("mglicenses", "main"),
        "",
        "Are you sure?",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight()
    )
)
RMenu.Add(
    "xtralicenses",
    "refundconfirm",
    RageUI.CreateSubMenu(
        RMenu:Get("mglicenses", "ownedlicenses"),
        "",
        "Are you sure?",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight()
    )
)
RageUI.CreateWhile(
    1.0,
    nil,
    function()
        RageUI.IsVisible(
            RMenu:Get("mglicenses", "main"),
            true,
            false,
            true,
            function()
                RageUI.ButtonWithStyle(
                    "Refund Licenses",
                    "Obtain 25% of the license value back.",
                    {RightLabel = "→→→"},
                    true,
                    function(b, c, d)
                    end,
                    RMenu:Get("mglicenses", "ownedlicenses")
                )
                for e, f in pairs(licensecentre.licenses) do
                    local g = not a[f.name]
                    RageUI.Button(
                        f.name .. " (£" .. getMoneyStringFormatted(tostring(f.price)) .. ")",
                        f.notOwned and "" or "You already own this license.",
                        f.notOwned and {RightLabel = "→→→"} or {RightLabel = ""},
                        f.notOwned,
                        function(b, c, d)
                            if d then
                                cGroup = f.group
                                cName = f.name
                            end
                        end,
                        RMenu:Get("mglicenses", "buyconfirm")
                    )
                end
            end,
            function()
            end
        )
        RageUI.IsVisible(
            RMenu:Get("mglicenses", "buyconfirm"),
            true,
            true,
            true,
            function()
                for h, i in pairs(licensecentre.licenses) do
                    if i.group == cGroup then
                        RageUI.Separator(i.name .. " Price: £" .. getMoneyStringFormatted(i.price))
                        if i.info ~= nil then
                            for j, k in pairs(i.info) do
                                RageUI.Separator(k)
                            end
                        end
                        RageUI.ButtonWithStyle(
                            "Confirm",
                            nil,
                            {RightLabel = ""},
                            true,
                            function(b, c, d)
                                if d then
                                    TriggerServerEvent("XTRA:buyLicense", cGroup, cName)
                                end
                            end,
                            RMenu:Get("mglicenses", "main")
                        )
                        RageUI.ButtonWithStyle(
                            "Decline",
                            nil,
                            {RightLabel = ""},
                            true,
                            function(b, c, d)
                            end,
                            RMenu:Get("mglicenses", "main")
                        )
                    end
                end
            end,
            function()
            end
        )
        RageUI.IsVisible(
            RMenu:Get("mglicenses", "ownedlicenses"),
            true,
            true,
            true,
            function()
                for e, f in pairs(licensecentre.licenses) do
                    local g = a[f.name]
                    if not f.notOwned then
                        RageUI.ButtonWithStyle(
                            "Refund " .. f.name .. " for (£" .. getMoneyStringFormatted(tostring(f.price * 0.25)) .. ")",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function(b, c, d)
                                if d then
                                    cGroup = f.group
                                    cName = f.name
                                end
                            end,
                            RMenu:Get("mglicenses", "refundconfirm")
                        )
                    end
                end
            end,
            function()
            end
        )
        RageUI.IsVisible(
            RMenu:Get("mglicenses", "refundconfirm"),
            true,
            true,
            true,
            function()
                for h, i in pairs(licensecentre.licenses) do
                    if i.group == cGroup then
                        RageUI.Separator("Refund Amount: £" .. getMoneyStringFormatted(i.price * 0.25))
                        RageUI.ButtonWithStyle(
                            "Confirm",
                            nil,
                            {RightLabel = ""},
                            true,
                            function(b, c, d)
                                if d then
                                    TriggerServerEvent("XTRA:refundLicense", cGroup, cName)
                                end
                            end,
                            RMenu:Get("mglicenses", "ownedlicenses")
                        )
                        RageUI.ButtonWithStyle(
                            "Decline",
                            nil,
                            {RightLabel = ""},
                            true,
                            function(b, c, d)
                            end,
                            RMenu:Get("mglicenses", "ownedlicenses")
                        )
                    end
                end
            end,
            function()
            end
        )
    end
)
AddEventHandler(
    "XTRA:onClientSpawn",
    function(f, l)
        if l then
            local m = function(n)
            end
            local o = function(n)
                RageUI.Visible(RMenu:Get("mglicenses", "main"), false)
                RageUI.Visible(RMenu:Get("mglicenses", "ownedlicenses"), false)
                RageUI.Visible(RMenu:Get("mglicenses", "buyconfirm"), false)
                RageUI.Visible(RMenu:Get("mglicenses", "refundconfirm"), false)
                RageUI.CloseAll()
            end
            local p = function(n)
                if IsControlJustPressed(1, 38) then
                    TriggerServerEvent("XTRA:getOwnedLicenses")
                    Wait(500)
                    RageUI.Visible(RMenu:Get("mglicenses", "main"), not RageUI.Visible(RMenu:Get("mglicenses", "main")))
                end
                local i, q, r = table.unpack(GetFinalRenderedCamCoord())
                DrawText3D(
                    licensecentre.location.x,
                    licensecentre.location.y,
                    licensecentre.location.z,
                    "Press [E] to open License Centre",
                    i,
                    q,
                    r
                )
                tXTRA.addMarker(
                    licensecentre.location.x,
                    licensecentre.location.y,
                    licensecentre.location.z - 0.98,
                    0.7,
                    0.7,
                    0.5,
                    255,
                    255,
                    255,
                    250,
                    50,
                    27,
                    false,
                    false
                )
            end
            tXTRA.createArea("licensecentre", licensecentre.location, 1.5, 6, m, o, p, {})
            tXTRA.addBlip(
                licensecentre.location.x,
                licensecentre.location.y,
                licensecentre.location.z,
                525,
                2,
                "License Shop"
            )
        end
    end
)
local j = false
local k = {}
local s = 0.033
local t = 0.033
local u = 0
local v = 0.306
function func_licenseMenuControl()
    if IsControlJustPressed(0, 167) then
        if j then
            j = false
        else
            TriggerServerEvent("XTRA:GetLicenses")
        end
    end

    if j then
        drawNativeNotification("Press ~INPUT_SELECT_CHARACTER_FRANKLIN~ to toggle the License Menu.")

        DrawRect(0.50, 0.222, 0.223, 0.075, 156, 92, 180, 255)
        DrawAdvancedText(0.595, 0.213, 0.005, 0.0028, 1.0, "XTRA Licenses", 255, 255, 255, 255, 1, 0)
        DrawAdvancedText(0.595, 0.275, 0.005, 0.0028, 0.4, "Licenses Owned", 0, 255, 50, 255, 6, 0)
        DrawRect(0.50, 0.272, 0.223, 0.026, 0, 0, 0, 222)

        local u = 0
        for w, x in pairs(k) do
            DrawAdvancedText(0.595, v + u * s, 0.005, 0.0028, 0.4, tostring(x), 255, 255, 255, 255, 6, 0)
            DrawRect(0.50, 0.301 + s * u, 0.223, 0.033, 0, 0, 0, 120)
            u = u + 1
        end
    end
end

if not tXTRA.isPurge() then
    tXTRA.createThreadOnTick(func_licenseMenuControl)
end
RegisterNetEvent(
    "XTRA:ReceivedLicenses",
    function(e)
        k = e
        j = true
    end
)
RegisterNetEvent(
    "XTRA:gotOwnedLicenses",
    function(e)
        for f, g in pairs(licensecentre.licenses) do
            g.notOwned = true
            for h, i in pairs(e) do
                if g.name == i then
                    g.notOwned = false
                end
            end
        end
    end
)
