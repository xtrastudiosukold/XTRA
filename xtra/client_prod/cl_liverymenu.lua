RMenu.Add(
    "xtraliverymenu",
    "main",
    RageUI.CreateMenu(
        "XTRA Livery Menu",
        "~w~XTRA Livery Menu",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight()
    )
)
RageUI.CreateWhile(
    1.0,
    true,
    function()
        if RageUI.Visible(RMenu:Get("frliverymenu", "main")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    for a = 1, GetVehicleLiveryCount(GetVehiclePedIsIn(GetPlayerPed(-1), false)) do
                        RageUI.Button(
                            "Livery " .. tostring(a),
                            nil,
                            {RightLabel = "→→→"},
                            true,
                            function(b, c, d)
                                if d then
                                    SetVehicleLivery(GetVehiclePedIsIn(GetPlayerPed(-1), false), a)
                                end
                            end
                        )
                    end
                end
            )
        end
    end
)
RegisterCommand(
    "liverymenu",
    function()
        if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
            RageUI.Visible(RMenu:Get("xtraliverymenu", "main"), true)
        end
    end
)
RegisterKeyMapping("liverymenu", "Opens Livery Menu", "keyboard", "insert")
