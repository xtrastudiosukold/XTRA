local a = {}
local b = nil
local c = module("cfg/weapons")
local d = {
    vector3(457.0222, -983.0001, 30.68948),
    vector3(1844.323, 3692.164, 34.26707),
    vector3(-435.9965, 5989.574, 31.71618),
    vector3(-1106.505, -826.4623, 14.2828)
}
RMenu.Add(
    "policeloadouts",
    "main",
    RageUI.CreateMenu(
        "",
        "Please Select Division",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "xtra_jobselectorui",
        "metpd"
    )
)
RMenu.Add(
    "policeloadouts",
    "confirm",
    RageUI.CreateSubMenu(
        RMenu:Get("policeloadouts", "main"),
        "",
        "Confirm Selection",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight()
    )
)
RageUI.CreateWhile(
    1.0,
    true,
    function()
        if RageUI.Visible(RMenu:Get("policeloadouts", "main")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    for e, f in pairs(a) do
                        RageUI.Button(
                            e,
                            nil,
                            {RightBadge = "→→→"},
                            f.hasPermission,
                            function(g, h, i)
                                if i then
                                    b = e
                                end
                            end,
                            RMenu:Get("policeloadouts", "confirm")
                        )
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("policeloadouts", "confirm")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    RageUI.Separator("~g~" .. b)
                    for e, f in pairs(a[b].weapons) do
                        RageUI.Separator(c.weapons[f].name)
                    end
                    RageUI.Button(
                        "Confirm",
                        nil,
                        {RightBadge = "→→→"},
                        true,
                        function(g, h, i)
                            if i then
                                TriggerServerEvent("XTRA:selectLoadout", b)
                                RageUI.Visible(RMenu:Get("policeloadouts", "confirm"), false)
                                RageUI.ActuallyCloseAll()
                            end
                        end
                    )
                end
            )
        end
    end
)
RegisterNetEvent("XTRA:gotLoadouts")
AddEventHandler(
    "XTRA:gotLoadouts",
    function(j)
        a = j
    end
)
AddEventHandler(
    "XTRA:onClientSpawn",
    function(k, l)
        if l then
            local m = function(n)
            end
            local o = function(n)
                b = nil
                RageUI.Visible(RMenu:Get("policeloadouts", "main"), false)
                RageUI.Visible(RMenu:Get("policeloadouts", "confirm"), false)
                RageUI.ActuallyCloseAll()
            end
            local p = function(n)
                if IsControlJustPressed(1, 38) then
                    TriggerServerEvent("XTRA:getPoliceLoadouts")
                    RageUI.Visible(
                        RMenu:Get("policeloadouts", "main"),
                        not RageUI.Visible(RMenu:Get("policeloadouts", "main"))
                    )
                end
                local f, q, r = table.unpack(GetFinalRenderedCamCoord())
                DrawText3D(
                    d[n.locationId].x,
                    d[n.locationId].y,
                    d[n.locationId].z,
                    "Press [E] to open Police Loadouts",
                    f,
                    q,
                    r
                )
            end
            for e, f in pairs(d) do
                tXTRA.createArea("police_loadouts_" .. e, f, 1.5, 6, m, o, p, {locationId = e})
            end
        end
    end
)
