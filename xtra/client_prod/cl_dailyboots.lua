local a = {}
local b = module("xtra-vehicles", "cfg/cfg_garages")
RMenu.Add(
    "XTRA",
    "dailyboot",
    RageUI.CreateMenu(
        "",
        "Claim your daily boot!",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "xtra_loginrewards",
        "xtra_loginrewards"
    )
)
RageUI.CreateWhile(
    1.0,
    true,
    function()
        if RageUI.Visible(RMenu:Get("XTRA", "dailyboot")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    RageUI.Separator("You can claim your daily boot")
                    for c, d in pairs(a) do
                        GetVehicleName(c, d)
                    end
                    RageUI.ButtonWithStyle(
                        "Claim Boot",
                        "Claim your daily boot!",
                        {RightLabel = "→→→"},
                        true,
                        function(e, f, g)
                            if g then
                                TriggerServerEvent("XTRA:ClaimBoot", a)
                            end
                        end
                    )
                end
            )
        end
    end
)
function GetVehicleName(h, i)
    for j, k in pairs(b.garages) do
        for l, m in pairs(k) do
            if l == h then
                RageUI.Checkbox(
                    m[1],
                    "",
                    i.checked,
                    {},
                    function()
                    end,
                    function()
                        for n, e in pairs(a) do
                            e.checked = false
                        end
                        a[h].checked = true
                    end,
                    function()
                    end
                )
            end
        end
    end
end
RegisterNetEvent(
    "XTRA:ReturnVehicleTable",
    function(o)
        a = o
        RageUI.Visible(RMenu:Get("XTRA", "dailyboot"), true)
    end
)
RegisterNetEvent(
    "XTRA:RewardClaimed",
    function()
        RageUI.ActuallyCloseAll()
        RageUI.Visible(RMenu:Get("XTRA", "dailyboot"), false)
    end
)
