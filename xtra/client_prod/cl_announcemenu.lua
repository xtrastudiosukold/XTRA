RMenu.Add(
    "xtraannouncements",
    "main",
    RageUI.CreateMenu(
        "",
        "Announcement Menu",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "xtra_announceui",
        "xtra_announceui"
    )
)
local a = {}
RageUI.CreateWhile(
    1.0,
    true,
    function()
        if RageUI.Visible(RMenu:Get("xtraannouncements", "main")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    for b, c in pairs(a) do
                        RageUI.Button(
                            c.name,
                            string.format("%s Price: £%s", c.desc, getMoneyStringFormatted(c.price)),
                            {RightLabel = "→→→"},
                            true,
                            function(d, e, f)
                                if f then
                                    TriggerServerEvent("XTRA:serviceAnnounce", c.name)
                                end
                            end
                        )
                    end
                end
            )
        end
    end
)
RegisterNetEvent(
    "XTRA:serviceAnnounceCl",
    function(g, h)
        tXTRA.announce(g, h)
    end
)
RegisterNetEvent(
    "XTRA:buildAnnounceMenu",
    function(i)
        a = i
        RageUI.Visible(RMenu:Get("xtraannouncements", "main"), not RageUI.Visible(RMenu:Get("xtraannouncements", "main")))
    end
)
RegisterCommand(
    "announcemenu",
    function()
        TriggerServerEvent("XTRA:getAnnounceMenu")
    end
)
