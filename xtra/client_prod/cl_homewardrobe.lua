local a = nil
local b = {}
local c = ""
local function d()
    if next(b) then
        return true
    end
    return false
end
RMenu.Add(
    "xtrawardrobe",
    "mainmenu",
    RageUI.CreateMenu("", "", tXTRA.getRageUIMenuWidth(), tXTRA.getRageUIMenuHeight(), "xtra_wardrobeui", "xtra_wardrobeui")
)
RMenu:Get("xtrawardrobe", "mainmenu"):SetSubtitle("HOME")
RMenu.Add(
    "xtrawardrobe",
    "listoutfits",
    RageUI.CreateSubMenu(
        RMenu:Get("xtrawardrobe", "mainmenu"),
        "",
        "Wardrobe",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight()
    )
)
RMenu.Add(
    "xtrawardrobe",
    "equip",
    RageUI.CreateSubMenu(
        RMenu:Get("xtrawardrobe", "listoutfits"),
        "",
        "Wardrobe",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight()
    )
)
RageUI.CreateWhile(
    1.0,
    true,
    function()
        if RageUI.Visible(RMenu:Get("xtrawardrobe", "mainmenu")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    RageUI.Button(
                        "List Outfits",
                        "",
                        {RightLabel = "→→→"},
                        d(),
                        function(e, f, g)
                        end,
                        RMenu:Get("xtrawardrobe", "listoutfits")
                    )
                    RageUI.Button(
                        "Save Outfit",
                        "",
                        {RightLabel = "→→→"},
                        true,
                        function(e, f, g)
                            if g then
                                c = tXTRA.KeyboardInput("Outfit Name:", "", 20)
                                if c then
                                    if not tXTRA.isPlayerInAnimalForm() then
                                        TriggerServerEvent("XTRA:saveWardrobeOutfit", c)
                                    else
                                        tXTRA.notify("Cannot save animal in wardrobe.")
                                    end
                                else
                                    tXTRA.notify("~r~Invalid outfit name")
                                end
                            end
                        end
                    )
                    RageUI.Button(
                        "Get Outfit Code",
                        "Gets a code for your current outfit which can be shared with other players.",
                        {RightLabel = "→→→"},
                        true,
                        function(e, f, g)
                            if g then
                                if tXTRA.isPlusClub() or tXTRA.isPlatClub() then
                                    TriggerServerEvent("XTRA:getCurrentOutfitCode")
                                else
                                    tXTRA.notify(
                                        "~y~You need to be a subscriber of XTRA Plus or XTRA Platinum to use this feature."
                                    )
                                    tXTRA.notify("~y~Available @ store.xtrastudios.com")
                                end
                            end
                        end,
                        nil
                    )
                end,
                function()
                end
            )
        end
        if RageUI.Visible(RMenu:Get("xtrawardrobe", "listoutfits")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    if b ~= {} then
                        for h, i in pairs(b) do
                            RageUI.Button(
                                h,
                                "",
                                {RightLabel = "→→→"},
                                true,
                                function(e, f, g)
                                    if g then
                                        c = h
                                    end
                                end,
                                RMenu:Get("xtrawardrobe", "equip")
                            )
                        end
                    else
                        RageUI.Button(
                            "No outfits saved",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function(e, f, g)
                            end,
                            RMenu:Get("xtrawardrobe", "mainmenu")
                        )
                    end
                end,
                function()
                end
            )
        end
        if RageUI.Visible(RMenu:Get("xtrawardrobe", "equip")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = true},
                function()
                    RageUI.Button(
                        "Equip Outfit",
                        "",
                        {RightLabel = "→→→"},
                        true,
                        function(e, f, g)
                            if g then
                                TriggerServerEvent("XTRA:equipWardrobeOutfit", c)
                            end
                        end,
                        RMenu:Get("xtrawardrobe", "listoutfits")
                    )
                    RageUI.Button(
                        "Delete Outfit",
                        "",
                        {RightLabel = "→→→"},
                        true,
                        function(e, f, g)
                            if g then
                                TriggerServerEvent("XTRA:deleteWardrobeOutfit", c)
                            end
                        end,
                        RMenu:Get("xtrawardrobe", "listoutfits")
                    )
                end,
                function()
                end
            )
        end
    end
)
local function j()
    RageUI.ActuallyCloseAll()
    RageUI.Visible(RMenu:Get("xtrawardrobe", "mainmenu"), true)
end
local function k()
    RageUI.ActuallyCloseAll()
    RageUI.Visible(RMenu:Get("xtrawardrobe", "mainmenu"), false)
end
RegisterNetEvent(
    "XTRA:openOutfitMenu",
    function(l)
        if l then
            b = l
        else
            TriggerServerEvent("XTRA:initWardrobe")
        end
        j()
    end
)
RegisterNetEvent(
    "XTRA:refreshOutfitMenu",
    function(l)
        b = l
    end
)
RegisterNetEvent(
    "XTRA:closeOutfitMenu",
    function()
        k()
    end
)
