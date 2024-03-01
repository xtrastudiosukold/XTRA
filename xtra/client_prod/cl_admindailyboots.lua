local a = {}
local b = {}
RMenu.Add(
    "XTRA",
    "admindailyboot",
    RageUI.CreateMenu("", "Daily Boot", tXTRA.getRageUIMenuWidth(), tXTRA.getRageUIMenuHeight(), "xtra_adminui", "xtra_adminui")
)
RMenu.Add("XTRA", "subadmindailyboot", RageUI.CreateSubMenu(RMenu:Get("XTRA", "admindailyboot"), "", "Daily Boot"))
RMenu.Add("XTRA", "weaponadmindailyboot", RageUI.CreateSubMenu(RMenu:Get("XTRA", "subadmindailyboot"), "", "Daily Boot"))
RageUI.CreateWhile(
    1.0,
    true,
    function()
        if RageUI.Visible(RMenu:Get("XTRA", "admindailyboot")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    if next(a) ~= nil then
                        RageUI.Separator("Claimed: " .. tostring("~g~" .. a.claimed))
                        RageUI.Separator(
                            "Redeem Time: " ..
                                string.format("%02d:%02d", tonumber(a.time.hour), tonumber(a.time.minute))
                        )
                        RageUI.Separator("Reward: £" .. getMoneyStringFormatted("~g~" .. a.money))
                        RageUI.Separator("Reward Items: ")
                        for c, d in pairs(a.items) do
                            RageUI.Separator(c .. " x" .. d)
                        end
                        RageUI.Button(
                            "Change Information",
                            "",
                            {},
                            true,
                            function(e, f, g)
                            end,
                            RMenu:Get("XTRA", "subadmindailyboot")
                        )
                    else
                        RageUI.Separator("Loading...")
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("XTRA", "subadmindailyboot")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    RageUI.ButtonWithStyle(
                        "Redeem Time",
                        "Change the time the daily boot is redeemable",
                        {},
                        true,
                        function(e, f, g)
                            if g then
                                TriggerServerEvent("XTRA:RequestChange", "openingtime")
                            end
                        end
                    )
                    RageUI.ButtonWithStyle(
                        "Reward Money",
                        "Change the reward of the daily boot",
                        {},
                        true,
                        function(e, f, g)
                            if g then
                                TriggerServerEvent("XTRA:RequestChange", "moneyreward")
                            end
                        end
                    )
                    RageUI.ButtonWithStyle(
                        "Reward Items",
                        "Change the reward items of the daily boot",
                        {},
                        true,
                        function(e, f, g)
                        end,
                        RMenu:Get("XTRA", "weaponadmindailyboot")
                    )
                end
            )
        end
        if RageUI.Visible(RMenu:Get("XTRA", "weaponadmindailyboot")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    for c, d in pairs(weaponlist.weapons) do
                        print(d.wepname)
                        print(d.weight)
                        print(d.checked)
                    end
                    RageUI.ButtonWithStyle(
                        "Cancel",
                        "",
                        {},
                        true,
                        function(e, f, g)
                            if g then
                                for c, d in pairs(weaponlist) do
                                    b[c] = false
                                end
                            end
                        end,
                        RMenu:Get("XTRA", "subadmindailyboot")
                    )
                    RageUI.ButtonWithStyle(
                        "Confirm",
                        "",
                        {},
                        true,
                        function(e, f, g)
                            if g then
                                TriggerServerEvent("XTRA:RequestChange", "rewarditems", b)
                                b = {}
                            end
                        end
                    )
                end
            )
        end
    end
)
RegisterNetEvent(
    "XTRA:ReturnAdminBootTable",
    function(h, i)
        weaponlist = i
        a = h
        RageUI.Visible(RMenu:Get("XTRA", "admindailyboot"), not RageUI.Visible(RMenu:Get("XTRA", "admindailyboot")))
    end
)
RegisterNetEvent(
    "XTRA:RefreshBootData",
    function(h)
        a = h
    end
)
