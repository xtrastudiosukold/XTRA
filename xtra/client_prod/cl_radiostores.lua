local a = module("cfg/cfg_radiostores")
RMenu.Add(
    "XTRARadioShops",
    "main",
    RageUI.CreateMenu(
        "",
        "Shop",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "xtra_marketui",
        "xtra_marketui"
    )
)
RMenu.Add(
    "XTRARadioShops",
    "confirm",
    RageUI.CreateSubMenu(RMenu:Get("XTRARadioShops", "main", tXTRA.getRageUIMenuWidth(), tXTRA.getRageUIMenuHeight()))
)
RageUI.CreateWhile(
    1.0,
    true,
    function()
        if RageUI.Visible(RMenu:Get("XTRARadioShops", "main")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    for b, c in pairs(a.RadioItems) do
                        RageUI.Button(
                            c.name,
                            nil,
                            {RightLabel = "~g~£" .. getMoneyStringFormatted(c.price)},
                            true,
                            function(d, e, f)
                                if f then
                                    cPrice = c.price
                                    cHash = c.itemID
                                    cName = c.name
                                end
                            end,
                            RMenu:Get("XTRARadioShops", "confirm")
                        )
                    end
                end
            )
        end
    end
)
local g = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"}
local h = 1
RageUI.CreateWhile(
    1.0,
    true,
    function()
        if RageUI.Visible(RMenu:Get("XTRARadioShops", "confirm")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    RageUI.Separator(
                        "Item Name: " .. cName,
                        function()
                        end
                    )
                    RageUI.Separator(
                        "Item Price: £" .. getMoneyStringFormatted(cPrice * h),
                        function()
                        end
                    )
                    RageUI.List(
                        cName,
                        g,
                        h,
                        nil,
                        {},
                        true,
                        function(d, e, f, i)
                            h = i
                        end
                    )
                    RageUI.Button(
                        "Confirm Purchase",
                        nil,
                        {RightLabel = "→"},
                        true,
                        function(d, e, f)
                            if f then
                                TriggerServerEvent("XTRA:BuyStoreItem", cHash, tonumber(h))
                            end
                        end,
                        RMenu:Get("XTRARadioShops", "main")
                    )
                end
            )
        end
    end
)
local j = false
local k = nil
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            for b, c in pairs(a.Radioshops) do
                if isInArea(c, 100.0) then
                    DrawMarker(
                        29,
                        c,
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                        0.4,
                        0.4,
                        0.4,
                        14,
                        212,
                        0,
                        250,
                        true,
                        true,
                        false,
                        false,
                        nil,
                        nil,
                        false
                    )
                end
                if isInArea(c, 1.0) and j == false then
                    alert("Press ~INPUT_VEH_HORN~ to open the Store")
                    if IsControlJustPressed(0, 51) then
                        j = true
                        k = b
                        PlaySound(-1, "Hit", "RESPAWN_SOUNDSET", 0, 0, 1)
                        RageUI.Visible(RMenu:Get("XTRARadioShops", "main"), true)
                        cLoaction = c
                    end
                end
                if isInArea(c, 1.0) == false and j and b == k then
                    j = false
                    k = nil
                    RageUI.ActuallyCloseAll()
                end
            end
        end
    end
)
