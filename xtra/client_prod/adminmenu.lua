XTRAclient = Tunnel.getInterface("XTRA", "XTRA")
local a = 0
local b = false
local c = false
local d = {}
local e = {}
local f = 250
local g = {}
local h
local i = nil
local j = nil
local k = nil
local l = nil
local m = nil
local n = {}
local o = {}
local p = 0
local q = "N/A"
local r = 1
local s = {}
local t = {}
local u = 0
local v
local w = {}
local x = 1
local y = {}
local z = ""
local A = ""
local B
local C = false
local D = {"POV List", "Cinematic", "Police", "NHS", "New Player"}
local E = 1
local F = {}
admincfg = {}
admincfg.perm = "admin.tickets"
admincfg.IgnoreButtonPerms = false
admincfg.admins_cant_ban_admins = false
local G = {
    "PD (Mission Row)",
    "PD (Sandy)",
    "PD (Paleto)",
    "City Hall",
    "Airport",
    "HMP",
    "Rebel Diner",
    "St Thomas",
   -- "Tutorial Spawn",
    "Simeons"
}
local H = {
    vector3(446.72503662109, -982.44342041016, 30.68931579589),
    vector3(1839.3137207031, 3671.0014648438, 34.310436248779),
    vector3(-437.32931518555, 6021.2114257813, 31.490119934082),
    vector3(-551.08221435547, -194.19259643555, 38.219661712646),
    vector3(-1142.0673828125, -2851.802734375, 13.94624710083),
    vector3(1848.2724609375, 2586.7385253906, 45.671997070313),
    vector3(1588.3441162109, 6439.3696289063, 25.123600006104),
    vector3(283.37664794922, -579.45318603516, 43.219303131104),
    vector3(-1035.9499511719, -2734.6240234375, 13.756628036499),
    vector3(-39.604099273682, -1111.8635253906, 26.438835144043)
}
local I = 1
menuColour = "~b~"
RMenu.Add(
    "adminmenu",
    "main",
    RageUI.CreateMenu(
        "",
        menuColour .. "Admin Menu",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "banners",
        "admin"
    )
)
RMenu.Add(
    "adminmenu",
    "players",
    RageUI.CreateSubMenu(
        RMenu:Get("adminmenu", "main"),
        "",
        menuColour .. "Admin Player Interaction Menu",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "banners",
        "admin"
    )
)
RMenu.Add(
    "adminmenu",
    "closeplayers",
    RageUI.CreateSubMenu(
        RMenu:Get("adminmenu", "main"),
        "",
        menuColour .. "Admin Player Interaction Menu",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "banners",
        "admin"
    )
)
RMenu.Add(
    "adminmenu",
    "staffmembers",
    RageUI.CreateSubMenu(
        RMenu:Get("adminmenu", "main"),
        "",
        menuColour .. "Admin Player Interaction Menu",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "banners",
        "admin"
    )
)
RMenu.Add(
    "adminmenu",
    "searchoptions",
    RageUI.CreateSubMenu(
        RMenu:Get("adminmenu", "main"),
        "",
        menuColour .. "Admin Player Search Menu",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "banners",
        "admin"
    )
)
RMenu.Add(
    "adminmenu",
    "functions",
    RageUI.CreateSubMenu(
        RMenu:Get("adminmenu", "main"),
        "",
        menuColour .. "Admin Functions Menu",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "banners",
        "admin"
    )
)
RMenu.Add(
    "adminmenu",
    "devfunctions",
    RageUI.CreateSubMenu(
        RMenu:Get("adminmenu", "main"),
        "",
        menuColour .. "Dev Functions Menu",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "banners",
        "admin"
    )
)
RMenu.Add(
    "adminmenu",
    "communitypot",
    RageUI.CreateSubMenu(
        RMenu:Get("adminmenu", "functions"),
        "",
        menuColour .. "Community Pot",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "banners",
        "admin"
    )
)
RMenu.Add(
    "adminmenu",
    "ticketdata",
    RageUI.CreateSubMenu(
        RMenu:Get("adminmenu", "functions"),
        "",
        menuColour .. "Ticket Leaderboard",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "banners",
        "admin"
    )
)
RMenu.Add(
    "adminmenu",
    "moneymenu",
    RageUI.CreateSubMenu(
        RMenu:Get("adminmenu", "functions"),
        "",
        menuColour .. "Money Menu",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "banners",
        "admin"
    )
)
RMenu.Add(
    "adminmenu",
    "submenu",
    RageUI.CreateSubMenu(
        RMenu:Get("adminmenu", "players"),
        "",
        menuColour .. "Admin Player Interaction Menu",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "banners",
        "admin"
    )
)
RMenu.Add(
    "adminmenu",
    "searchname",
    RageUI.CreateSubMenu(
        RMenu:Get("adminmenu", "searchoptions"),
        "",
        menuColour .. "Admin Player Search Menu",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "banners",
        "admin"
    )
)
RMenu.Add(
    "adminmenu",
    "searchtempid",
    RageUI.CreateSubMenu(
        RMenu:Get("adminmenu", "searchoptions"),
        "",
        menuColour .. "Admin Player Search Menu",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "banners",
        "admin"
    )
)
RMenu.Add(
    "adminmenu",
    "searchpermid",
    RageUI.CreateSubMenu(
        RMenu:Get("adminmenu", "searchoptions"),
        "",
        menuColour .. "Admin Player Search Menu",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "banners",
        "admin"
    )
)
RMenu.Add(
    "adminmenu",
    "searchhistory",
    RageUI.CreateSubMenu(
        RMenu:Get("adminmenu", "searchoptions"),
        "",
        menuColour .. "Admin Player Search Menu",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "banners",
        "admin"
    )
)
RMenu.Add(
    "adminmenu",
    "criteriasearch",
    RageUI.CreateSubMenu(
        RMenu:Get("adminmenu", "searchoptions"),
        "",
        menuColour .. "Admin Player Interaction Menu",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "banners",
        "admin"
    )
)
RMenu.Add(
    "adminmenu",
    "notespreviewban",
    RageUI.CreateSubMenu(
        RMenu:Get("adminmenu", "players"),
        "",
        menuColour .. "Player Notes",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "banners",
        "admin"
    )
)
RMenu.Add(
    "adminmenu",
    "banselection",
    RageUI.CreateSubMenu(
        RMenu:Get("adminmenu", "notespreviewban"),
        "",
        menuColour .. "Ban Menu ~w~- ~o~[Tab] to search bans",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "banners",
        "admin"
    )
)
RMenu.Add(
    "adminmenu",
    "generatedban",
    RageUI.CreateSubMenu(
        RMenu:Get("adminmenu", "banselection"),
        "",
        menuColour .. "Ban Menu",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "banners",
        "admin"
    )
)
RMenu.Add(
    "adminmenu",
    "notesub",
    RageUI.CreateSubMenu(
        RMenu:Get("adminmenu", "players"),
        "",
        menuColour .. "Player Notes",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "banners",
        "admin"
    )
)
RMenu.Add(
    "adminmenu",
    "groups",
    RageUI.CreateSubMenu(
        RMenu:Get("adminmenu", "submenu"),
        "",
        menuColour .. "Admin Groups Menu ~w~- ~o~[Tab] to search groups",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "banners",
        "admin"
    )
)
RMenu.Add(
    "adminmenu",
    "addgroup",
    RageUI.CreateSubMenu(
        RMenu:Get("adminmenu", "groups"),
        "",
        menuColour .. "Admin Groups Menu",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "banners",
        "admin"
    )
)
RMenu.Add(
    "adminmenu",
    "removegroup",
    RageUI.CreateSubMenu(
        RMenu:Get("adminmenu", "groups"),
        "",
        menuColour .. "Admin Groups Menu",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "banners",
        "admin"
    )
)
RMenu:Get("adminmenu", "main")
local J = {
    ["Supporter"] = "Supporter",
    ["Premium"] = "Premium",
    ["Supreme"] = "Supreme",
    ["Kingpin"] = "King Pin",
    ["Rainmaker"] = "Rainmaker",
    ["Baller"] = "Baller",
    ["pov"] = "POV List",
    ["Copper"] = "Copper License",
    ["Weed"] = "Weed License",
    ["Limestone"] = "Limestone License",
    ["Gang"] = "Gang License",
    ["Cocaine"] = "Cocaine License",
    ["Meth"] = "Meth License",
    ["Heroin"] = "Heroin License",
    ["LSD"] = "LSD License",
    ["Rebel"] = "Rebel License",
    ["AdvancedRebel"] = "Advanced Rebel License",
    ["Gold"] = "Gold License",
    ["Diamond"] = "Diamond License",
    ["DJ"] = "DJ License",
    ["PilotLicense"] = "Pilot License",
    ["polblips"] = "Long Range Emergency Blips",
    ["Highroller"] = "Highrollers License",
    ["TutorialDone"] = "Completed Tutorial",
    ["Royal Mail Driver"] = "Royal Mail Driver",
    ["AA Mechanic"] = "AA Mechanic",
    ["Bus Driver"] = "Bus Driver",
    ["Deliveroo"] = "Deliveroo",
    ["Scuba Diver"] = "Scuba Diver",
    ["G4S Driver"] = "G4S Driver",
    ["Taco Seller"] = "Taco Seller",
    ["Burger Shot Cook"] = "Burger Shot Cook",
    ["Cinematic"] = "Cinematic Menu"
}
RegisterNetEvent("XTRA:ReturnNearbyPlayers")
AddEventHandler(
    "XTRA:ReturnNearbyPlayers",
    function(K)
        e = K
    end
)
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            if m ~= nil then
                local L = GetEntityCoords(tXTRA.getPlayerPed())
                if tXTRA.isInSpectate() then
                    L = GetFinalRenderedCamCoord()
                end
                TriggerServerEvent("XTRA:GetNearbyPlayers", L, 250)
                Citizen.Wait(1000)
            end
        end
    end
)
local M = "Loading..."
RegisterNetEvent("XTRA:gotCommunityPotAmount")
AddEventHandler(
    "XTRA:gotCommunityPotAmount",
    function(N)
        M = tonumber(N)
    end
)
local O = {}
RegisterNetEvent("XTRA:GotTicketLeaderboard")
AddEventHandler(
    "XTRA:GotTicketLeaderboard",
    function(P)
        O = P
    end
)
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            if m ~= nil then
                local P = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(m)))
                DrawMarker(
                    2,
                    P.x,
                    P.y,
                    P.z + 1.1,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    -180.0,
                    0.0,
                    0.4,
                    0.4,
                    0.4,
                    255,
                    255,
                    0,
                    125,
                    false,
                    true,
                    2,
                    false
                )
            end
        end
    end
)
RageUI.CreateWhile(
    1.0,
    true,
    function()
        if tXTRA.getStaffLevel() >= 1 then
            if RageUI.Visible(RMenu:Get("adminmenu", "main")) then
                RageUI.DrawContent(
                    {header = true, glare = false, instructionalButton = false},
                    function()
                        m = nil
                        o = {}
                        for y, Q in pairs(n) do
                            Q.itemchecked = false
                        end
                        RageUI.ButtonWithStyle(
                            "All Players",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                            end,
                            RMenu:Get("adminmenu", "players")
                        )
                        RageUI.ButtonWithStyle(
                            "Nearby Players",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    local L = GetEntityCoords(tXTRA.getPlayerPed())
                                    if tXTRA.isInSpectate() then
                                        L = GetFinalRenderedCamCoord()
                                    end
                                    TriggerServerEvent("XTRA:GetNearbyPlayers", L, 250)
                                end
                            end,
                            RMenu:Get("adminmenu", "closeplayers")
                        )
                        RageUI.ButtonWithStyle(
                            "Search Players",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                            end,
                            RMenu:Get("adminmenu", "searchoptions")
                        )
                        RageUI.ButtonWithStyle(
                            "Staff Members",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                            end,
                            RMenu:Get("adminmenu", "staffmembers")
                        )
                        RageUI.ButtonWithStyle(
                            "Functions",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                            end,
                            RMenu:Get("adminmenu", "functions")
                        )
                        RageUI.ButtonWithStyle(
                            "Settings",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                            end,
                            RMenu:Get("SettingsMenu", "MainMenu")
                        )
                    end
                )
            end
        end
        if RageUI.Visible(RMenu:Get("adminmenu", "players")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    for y, Q in pairs(d) do
                        if not tXTRA.isUserHidden(Q[3]) then
                            RageUI.ButtonWithStyle(
                                Q[1] .. " [" .. Q[2] .. "]",
                                Q[1] .. " (" .. Q[4] .. " hours) PermID: " .. Q[3] .. " TempID: " .. Q[2],
                                {RightLabel = "→→→"},
                                true,
                                function(R, S, T)
                                    if T then
                                        SelectedPlayer = d[y]
                                        j = Q[3]
                                        TriggerServerEvent("XTRA:CheckPov", Q[3])
                                    end
                                end,
                                RMenu:Get("adminmenu", "submenu")
                            )
                        end
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("adminmenu", "closeplayers")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    if next(e) then
                        for x, Q in pairs(e) do
                            if not tXTRA.isUserHidden(Q[3]) then
                                RageUI.ButtonWithStyle(
                                    Q[1] .. " [" .. Q[2] .. "]",
                                    Q[1] .. " (" .. Q[4] .. " hours) PermID: " .. Q[3] .. " TempID: " .. Q[2],
                                    {RightLabel = "→→→"},
                                    true,
                                    function(R, S, T)
                                        if T then
                                            SelectedPlayer = e[x]
                                            j = Q[3]
                                            TriggerServerEvent("XTRA:CheckPov", Q[3])
                                        end
                                        if S then
                                            m = Q[2]
                                        end
                                    end,
                                    RMenu:Get("adminmenu", "submenu")
                                )
                            end
                        end
                    else
                        RageUI.Separator("~r~No players nearby!")
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("adminmenu", "staffmembers")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    for y, Q in pairs(d) do
                        if not tXTRA.isUserHidden(Q[3]) and tXTRA.clientGetPlayerIsStaff(Q[3]) then
                            RageUI.ButtonWithStyle(
                                Q[1] .. " [" .. Q[2] .. "]",
                                Q[1] .. " (" .. Q[4] .. " hours) PermID: " .. Q[3] .. " TempID: " .. Q[2],
                                {RightLabel = "→→→"},
                                true,
                                function(R, S, T)
                                    if T then
                                        SelectedPlayer = d[y]
                                        j = Q[3]
                                        TriggerServerEvent("XTRA:CheckPov", Q[3])
                                    end
                                end,
                                RMenu:Get("adminmenu", "submenu")
                            )
                        end
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("adminmenu", "searchoptions")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    b = false
                    RageUI.ButtonWithStyle(
                        "Search by Name",
                        "",
                        {RightLabel = "→→→"},
                        true,
                        function(R, S, T)
                        end,
                        RMenu:Get("adminmenu", "searchname")
                    )
                    RageUI.ButtonWithStyle(
                        "Search by Perm ID",
                        "",
                        {RightLabel = "→→→"},
                        true,
                        function(R, S, T)
                        end,
                        RMenu:Get("adminmenu", "searchpermid")
                    )
                    RageUI.ButtonWithStyle(
                        "Search by Temp ID",
                        "",
                        {RightLabel = "→→→"},
                        true,
                        function(R, S, T)
                        end,
                        RMenu:Get("adminmenu", "searchtempid")
                    )
                    RageUI.ButtonWithStyle(
                        "Search History",
                        "",
                        {RightLabel = "→→→"},
                        true,
                        function(R, S, T)
                        end,
                        RMenu:Get("adminmenu", "searchhistory")
                    )
                    if tXTRA.getStaffLevel() >= 6 then
                        RageUI.List(
                            "Search By Criteria",
                            D,
                            E,
                            "",
                            {},
                            true,
                            function(S, T, U, V)
                                if V ~= E then
                                    E = V
                                elseif U then
                                    TriggerServerEvent("XTRA:searchByCriteria", D[E])
                                end
                            end
                        )
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("adminmenu", "functions")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    if tXTRA.getStaffLevel() >= 1 then
                        RageUI.ButtonWithStyle(
                            "Get Coords",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    TriggerServerEvent("XTRA:GetCoords")
                                end
                            end
                        )
                        RageUI.ButtonWithStyle(
                            "Ticket Leaderboard",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    TriggerServerEvent("XTRA:GetTicketLeaderboard")
                                end
                            end,
                            RMenu:Get("adminmenu", "ticketdata")
                        )
                        RageUI.List(
                            "Teleport",
                            G,
                            I,
                            "",
                            {},
                            true,
                            function(U, V, W, X)
                                I = X
                                if W then
                                    tXTRA.teleport2(vector3(H[I]), true)
                                end
                            end,
                            function()
                            end
                        )
                    end
                    if tXTRA.getStaffLevel() >= 5 then
                        RageUI.ButtonWithStyle(
                            "TP To Coords",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    TriggerServerEvent("XTRA:Tp2Coords")
                                end
                            end
                        )
                    end
                    -- if tXTRA.getStaffLevel() >= 2 then
                    --     RageUI.ButtonWithStyle(
                    --         "Offline Ban",
                    --         "",
                    --         {RightLabel = "→→→"},
                    --         true,
                    --         function(R, S, T)
                    --             if T then
                    --                 tXTRA.clientPrompt(
                    --                     "Perm ID:",
                    --                     "",
                    --                     function(Y)
                    --                         banningPermID = Y
                    --                         banningName = "ID: " .. banningPermID
                    --                         z = nil
                    --                         o = {}
                    --                         for y, Q in pairs(n) do
                    --                             Q.itemchecked = false
                    --                         end
                    --                         TriggerServerEvent("XTRA:getNotes", banningPermID)
                    --                     end
                    --                 )
                    --             end
                    --         end,
                    --         RMenu:Get("adminmenu", "notespreviewban")
                    --     )
                    -- end
                    if tXTRA.getStaffLevel() >= 5 then
                        RageUI.ButtonWithStyle(
                            "TP To Waypoint",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    local Z = GetFirstBlipInfoId(8)
                                    if Z ~= nil and DoesBlipExist(Z) then
                                        local _ = GetBlipInfoIdCoord(Z)
                                        for a0 = 1, 1000 do
                                            SetPedCoordsKeepVehicle(PlayerPedId(), _.x, _.y, a0 + 0.0)
                                            local a1, a2 = GetGroundZFor_3dCoord(_.x, _.y, a0 + 0.0)
                                            if a1 then
                                                SetPedCoordsKeepVehicle(PlayerPedId(), _.x, _.y, a0 + 0.0)
                                                break
                                            end
                                            Citizen.Wait(5)
                                        end
                                    else
                                        tXTRA.notify("~r~You do not have a waypoint set")
                                    end
                                end
                            end
                        )
                    end
                    -- if tXTRA.getStaffLevel() >= 5 then
                    --     RageUI.ButtonWithStyle(
                    --         "Unban",
                    --         "",
                    --         {RightLabel = "→→→"},
                    --         true,
                    --         function(R, S, T)
                    --             if T then
                    --                 TriggerServerEvent("XTRA:Unban")
                    --             end
                    --         end
                    --     )
                    -- end
                    if tXTRA.getStaffLevel() >= 3 then
                        RageUI.ButtonWithStyle(
                            "Spawn Taxi",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    local a3 = GetEntityCoords(tXTRA.getPlayerPed())
                                    XTRA.spawnVehicle(
                                        "taxi",
                                        a3.x,
                                        a3.y,
                                        a3.z,
                                        GetEntityHeading(tXTRA.getPlayerPed()),
                                        true,
                                        true,
                                        true
                                    )
                                end
                            end
                        )
                    end

                    -- if tXTRA.getStaffLevel() >= 10 then
                    --     RageUI.ButtonWithStyle(
                    --         "Commit Godly Wrath",
                    --         "",
                    --         {RightLabel = "→→→"},
                    --         true,
                    --         function(R, S, T)
                    --             if T then
                    --                 ExecuteCommand("theforce")
                    --             end
                    --         end
                    --     )
                    -- end
                    if tXTRA.getStaffLevel() >= 8 then
                        RageUI.ButtonWithStyle(
                            "Revive All Nearby",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    local a4 = tXTRA.getPlayerCoords()
                                    for a5, a6 in pairs(GetActivePlayers()) do
                                        local a7 = GetPlayerServerId(a6)
                                        local a8 = GetPlayerPed(a6)
                                        if a7 ~= -1 and a8 ~= 0 then
                                            local a9 = GetEntityCoords(a8, true)
                                            if #(a4 - a9) < 50.0 then
                                                local aa = tXTRA.clientGetUserIdFromSource(a7)
                                                if aa > 0 then
                                                    TriggerServerEvent("XTRA:RevivePlayer", aa, true)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        )
                        RageUI.ButtonWithStyle(
                            "Remove Warning",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    AddTextEntry("FMMC_MPM_NC", "Enter the Warning ID")
                                    DisplayOnscreenKeyboard(1, "FMMC_MPM_NC", "", "", "", "", "", 30)
                                    while UpdateOnscreenKeyboard() == 0 do
                                        DisableAllControlActions(0)
                                        Wait(0)
                                    end
                                    if GetOnscreenKeyboardResult() then
                                        local ab = GetOnscreenKeyboardResult()
                                        if ab then
                                            TriggerServerEvent("XTRA:RemoveWarning", ab)
                                        end
                                    end
                                end
                            end
                        )
                    end
                    if tXTRA.getStaffLevel() >= 6 then
                    --     local ac = ""
                    --     if tXTRA.hasStaffBlips() then
                    --         ac = "Turn off blips"
                    --     else
                    --         ac = "~g~Turn on blips"
                    --     end
                    --     RageUI.ButtonWithStyle(
                    --         "Toggle Blips",
                    --         ac,
                    --         {RightLabel = "→→→"},
                    --         true,
                    --         function(R, S, T)
                    --             if T then
                    --                 tXTRA.staffBlips(not tXTRA.hasStaffBlips())
                    --             end
                    --         end
                    --     )
                        -- RageUI.ButtonWithStyle(
                        --     "Community Pot Menu",
                        --     "",
                        --     {RightLabel = "→→→"},
                        --     true,
                        --     function(R, S, T)
                        --         if T then
                        --             TriggerServerEvent("XTRA:getCommunityPotAmount")
                        --         end
                        --     end,
                        --     RMenu:Get("adminmenu", "communitypot")
                        -- )
                        RageUI.ButtonWithStyle(
                            "RP Zones",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                            end,
                            RMenu:Get("rpzones", "mainmenu")
                        )
                    end
                    -- if tXTRA.getStaffLevel() >= 10 then
                    --     RageUI.ButtonWithStyle(
                    --         "Manage Money",
                    --         "",
                    --         {RightLabel = "→→→"},
                    --         true,
                    --         function(R, S, T)
                    --         end,
                    --         RMenu:Get("adminmenu", "moneymenu")
                    --     )
                    -- end
                    if tXTRA.getStaffLevel() >= 10 then
                        -- RageUI.ButtonWithStyle(
                        --     "Admin Daily Boots",
                        --     "",
                        --     {RightLabel = "→→→"},
                        --     true,
                        --     function(R, S, T)
                        --         if T then
                        --             ExecuteCommand("admindailyboots")
                        --         end
                        --     end
                        -- )
                        RageUI.ButtonWithStyle(
                            "Add Car",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    TriggerServerEvent("XTRA:AddCar")
                                end
                            end,
                            RMenu:Get("adminmenu", "functions")
                        )
                        RageUI.Checkbox(
                            "Set Globally Hidden",
                            "",
                            tXTRA.isLocalPlayerHidden(),
                            {},
                            function()
                            end,
                            function()
                                TriggerServerEvent("XTRA:setUserHidden", true)
                            end,
                            function()
                                TriggerServerEvent("XTRA:setUserHidden", false)
                            end
                        )
                        RageUI.ButtonWithStyle(
                            "Change User Name",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    TriggerServerEvent("XTRA:ChangeName")
                                end
                            end,
                            RMenu:Get("adminmenu", "functions")
                        )
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("adminmenu", "moneymenu")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    if B ~= nil and sn ~= nil and sc ~= nil and sb ~= nil and sw ~= nil and sch ~= nil then
                        RageUI.Separator("Name: " .. sn)
                        RageUI.Separator("PermID: " .. B)
                        RageUI.Separator("TempID: " .. sc)
                        RageUI.Separator("Bank Balance: £" .. sb)
                        RageUI.Separator("Cash Balance: £" .. sw)
                        RageUI.Separator("Casino Chips: " .. sch)
                        RageUI.Separator("")
                        RageUI.ButtonWithStyle(
                            "Bank Balance ~g~+",
                            nil,
                            {RightLabel = "→→→"},
                            true,
                            function(ad, U, V)
                                if V then
                                    tXTRA.clientPrompt(
                                        "Amount:",
                                        "",
                                        function(ae)
                                            if tonumber(ae) then
                                                TriggerServerEvent("XTRA:ManagePlayerBank", B, ae, "Increase")
                                            else
                                                tXTRA.notify("~r~Invalid Amount")
                                            end
                                        end
                                    )
                                end
                            end
                        )
                        RageUI.ButtonWithStyle(
                            "Bank Balance ~r~-",
                            nil,
                            {RightLabel = "→→→"},
                            true,
                            function(ad, U, V)
                                if V then
                                    tXTRA.clientPrompt(
                                        "Amount:",
                                        "",
                                        function(ae)
                                            if tonumber(ae) then
                                                TriggerServerEvent("XTRA:ManagePlayerBank", B, ae, "Decrease")
                                            else
                                                tXTRA.notify("~r~Invalid Amount")
                                            end
                                        end
                                    )
                                end
                            end
                        )
                        RageUI.ButtonWithStyle(
                            "Cash Balance ~g~+~w~",
                            nil,
                            {RightLabel = "→→→"},
                            true,
                            function(ad, U, V)
                                if V then
                                    tXTRA.clientPrompt(
                                        "Amount:",
                                        "",
                                        function(af)
                                            if tonumber(af) then
                                                TriggerServerEvent("XTRA:ManagePlayerCash", B, af, "Increase")
                                            else
                                                tXTRA.notify("~r~Invalid Amount")
                                            end
                                        end
                                    )
                                end
                            end
                        )
                        RageUI.ButtonWithStyle(
                            "Cash Balance ~r~-",
                            nil,
                            {RightLabel = "→→→"},
                            true,
                            function(ad, U, V)
                                if V then
                                    tXTRA.clientPrompt(
                                        "Amount:",
                                        "",
                                        function(af)
                                            if tonumber(af) then
                                                TriggerServerEvent("XTRA:ManagePlayerCash", B, af, "Decrease")
                                            else
                                                tXTRA.notify("~r~Invalid Amount")
                                            end
                                        end
                                    )
                                end
                            end
                        )
                        RageUI.ButtonWithStyle(
                            "Casino Chips ~g~+",
                            nil,
                            {RightLabel = "→→→"},
                            true,
                            function(ad, U, V)
                                if V then
                                    tXTRA.clientPrompt(
                                        "Amount:",
                                        "",
                                        function(af)
                                            if tonumber(af) then
                                                TriggerServerEvent("XTRA:ManagePlayerChips", B, af, "Increase")
                                            else
                                                tXTRA.notify("~r~Invalid Amount")
                                            end
                                        end
                                    )
                                end
                            end
                        )
                        RageUI.ButtonWithStyle(
                            "Casino Chips ~r~-",
                            nil,
                            {RightLabel = "→→→"},
                            true,
                            function(ad, U, V)
                                if V then
                                    tXTRA.clientPrompt(
                                        "Amount:",
                                        "",
                                        function(af)
                                            if tonumber(af) then
                                                TriggerServerEvent("XTRA:ManagePlayerChips", B, af, "Decrease")
                                            else
                                                tXTRA.notify("~r~Invalid Amount")
                                            end
                                        end
                                    )
                                end
                            end
                        )
                    end
                    RageUI.ButtonWithStyle(
                        "Choose PermID",
                        nil,
                        {RightLabel = "→→→"},
                        true,
                        function(ad, U, V)
                            if V then
                                tXTRA.clientPrompt(
                                    "PermID:",
                                    "",
                                    function(ae)
                                        if tonumber(ae) then
                                            B = tonumber(ae)
                                            tXTRA.notify("~g~PermID Set To " .. ae)
                                            TriggerServerEvent("XTRA:getUserinformation", B)
                                        else
                                            tXTRA.notify("~r~Invalid PermID")
                                            B = nil
                                        end
                                    end
                                )
                            end
                        end,
                        RMenu:Get("adminmenu", "moneymenu")
                    )
                end
            )
        end
        if RageUI.Visible(RMenu:Get("adminmenu", "ticketdata")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    if not O or next(O) == nil then
                        RageUI.Separator("~r~No Tickets")
                    else
                        for a0, ag in pairs(O) do
                            if ag and ag.username and ag.ticket_count and ag.user_id then
                                RageUI.Separator(ag.username .. " - " .. ag.ticket_count)
                            else
                                RageUI.Separator("~r~No Tickets")
                            end
                        end
                    end
                    RageUI.ButtonWithStyle(
                        "View Leaderboard",
                        nil,
                        {RightLabel = "→→→"},
                        true,
                        function(a0, a0, ah)
                            if ah then
                                TriggerServerEvent("XTRA:GetTicketLeaderboard")
                            end
                        end
                    )
                    RageUI.ButtonWithStyle(
                        "View Self",
                        nil,
                        {RightLabel = "→→→"},
                        true,
                        function(a0, a0, ah)
                            if ah then
                                TriggerServerEvent("XTRA:GetTicketLeaderboard", true)
                            end
                        end
                    )
                end
            )
        end
        if RageUI.Visible(RMenu:Get("adminmenu", "communitypot")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    RageUI.Separator("Community Pot Balance: ~g~£" .. getMoneyStringFormatted(M))
                    RageUI.ButtonWithStyle(
                        "Deposit",
                        "",
                        {RightLabel = "→→→"},
                        true,
                        function(ai, aj, v)
                            if v then
                                tXTRA.clientPrompt(
                                    "Enter Amount:",
                                    "",
                                    function(N)
                                        if tonumber(N) then
                                            TriggerServerEvent("XTRA:tryDepositCommunityPot", N)
                                        else
                                            tXTRA.notify("~r~Invalid amount.")
                                        end
                                    end
                                )
                            end
                        end
                    )
                    RageUI.ButtonWithStyle(
                        "Withdraw",
                        "",
                        {RightLabel = "→→→"},
                        true,
                        function(ai, aj, v)
                            if v then
                                tXTRA.clientPrompt(
                                    "Enter Amount:",
                                    "",
                                    function(N)
                                        if tonumber(N) then
                                            TriggerServerEvent("XTRA:tryWithdrawCommunityPot", N)
                                        else
                                            tXTRA.notify("~r~Invalid amount.")
                                        end
                                    end
                                )
                            end
                        end
                    )
                end
            )
        end
        if RageUI.Visible(RMenu:Get("adminmenu", "devfunctions")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    if tXTRA.isDev() or tXTRA.getStaffLevel() >= 10 then
                        RageUI.ButtonWithStyle(
                            "Spawn Weapon",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    TriggerServerEvent("XTRA:Giveweapon")
                                end
                            end,
                            RMenu:Get("adminmenu", "devfunctions")
                        )
                        RageUI.ButtonWithStyle(
                            "Give Weapon",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    TriggerServerEvent("XTRA:GiveWeaponToPlayer")
                                end
                            end,
                            RMenu:Get("adminmenu", "devfunctions")
                        )
                        RageUI.ButtonWithStyle(
                            "Armour",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    tXTRA.setArmour(100)
                                end
                            end,
                            RMenu:Get("adminmenu", "devfunctions")
                        )
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("adminmenu", "searchpermid")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    if b == false then
                        searchforPermID = tXTRA.KeyboardInput("Enter Perm ID", "", 10)
                        if searchforPermID == nil then
                            searchforPermID = ""
                        end
                    end
                    for y, Q in pairs(d) do
                        b = true
                        if string.find(Q[3], searchforPermID) then
                            if not tXTRA.isUserHidden(Q[3]) then
                                RageUI.ButtonWithStyle(
                                    Q[1] .. " [" .. Q[2] .. "]",
                                    Q[1] .. " (" .. Q[4] .. " hours) PermID: " .. Q[3] .. " TempID: " .. Q[2],
                                    {RightLabel = "→→→"},
                                    true,
                                    function(R, S, T)
                                        if T then
                                            SelectedPlayer = d[y]
                                            TriggerServerEvent("XTRA:CheckPov", Q[3])
                                            v = Q[3]
                                            w[x] = v
                                            x = x + 1
                                        end
                                    end,
                                    RMenu:Get("adminmenu", "submenu")
                                )
                            end
                        end
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("adminmenu", "searchtempid")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    if b == false then
                        searchid = tXTRA.KeyboardInput("Enter Temp ID", "", 10)
                        if searchid == nil then
                            searchid = ""
                        end
                    end
                    for y, Q in pairs(d) do
                        b = true
                        if string.find(Q[2], searchid) then
                            if not tXTRA.isUserHidden(Q[3]) then
                                RageUI.ButtonWithStyle(
                                    Q[1] .. " [" .. Q[2] .. "]",
                                    Q[1] .. " (" .. Q[4] .. " hours) PermID: " .. Q[3] .. " TempID: " .. Q[2],
                                    {RightLabel = "→→→"},
                                    true,
                                    function(R, S, T)
                                        if T then
                                            SelectedPlayer = d[y]
                                            TriggerServerEvent("XTRA:CheckPov", Q[3])
                                            v = Q[2]
                                            w[x] = v
                                            x = x + 1
                                        end
                                    end,
                                    RMenu:Get("adminmenu", "submenu")
                                )
                            end
                        end
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("adminmenu", "searchname")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    if b == false then
                        SearchName = tXTRA.KeyboardInput("Enter Name", "", 10)
                        if SearchName == nil then
                            SearchName = ""
                        end
                    end
                    for y, Q in pairs(d) do
                        b = true
                        if string.find(string.lower(Q[1]), string.lower(SearchName)) then
                            if not tXTRA.isUserHidden(Q[3]) then
                                RageUI.ButtonWithStyle(
                                    Q[1] .. " [" .. Q[2] .. "]",
                                    Q[1] .. " (" .. Q[4] .. " hours) PermID: " .. Q[3] .. " TempID: " .. Q[2],
                                    {RightLabel = "→→→"},
                                    true,
                                    function(R, S, T)
                                        if T then
                                            SelectedPlayer = d[y]
                                            TriggerServerEvent("XTRA:CheckPov", Q[3])
                                            v = Q[1]
                                            w[x] = v
                                            x = x + 1
                                        end
                                    end,
                                    RMenu:Get("adminmenu", "submenu")
                                )
                            end
                        end
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("adminmenu", "searchhistory")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    for y, Q in pairs(d) do
                        if x > 1 then
                            for ak = #w, #w - 10, -1 do
                                if w[ak] then
                                    if tonumber(w[ak]) == Q[3] or tonumber(w[ak]) == Q[2] or w[ak] == Q[1] then
                                        RageUI.ButtonWithStyle(
                                            "[" .. Q[3] .. "] " .. Q[1],
                                            Q[1] .. " Perm ID: " .. Q[3] .. " Temp ID: " .. Q[2],
                                            {RightLabel = "→→→"},
                                            true,
                                            function(R, S, T)
                                                if T then
                                                    SelectedPlayer = d[y]
                                                    TriggerServerEvent("XTRA:CheckPov", Q[3])
                                                end
                                            end,
                                            RMenu:Get("adminmenu", "submenu")
                                        )
                                    end
                                end
                            end
                        end
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("adminmenu", "criteriasearch")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    if next(F) then
                        for t, N in pairs(F) do
                            if not tXTRA.isUserHidden(N[3]) then
                                RageUI.ButtonWithStyle(
                                    (N[5] and "~o~" or "") .. N[1] .. " [" .. N[2] .. "]",
                                    N[1] .. " (" .. N[4] .. " hours) PermID: " .. N[3] .. " TempID: " .. N[2],
                                    {RightLabel = "→→→"},
                                    true,
                                    function(P, Q, R)
                                        if R then
                                            SelectedPlayer = F[t]
                                            TriggerServerEvent("XTRA:CheckPov", N[3])
                                            o = N[1]
                                            s[r] = o
                                            r = r + 1
                                        end
                                    end,
                                    RMenu:Get("adminmenu", "submenu")
                                )
                            end
                        end
                    else
                        RageUI.Separator("~r~There are currently no players that match criteria.")
                        RageUI.Separator("~r~" .. D[E])
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("adminmenu", "submenu")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    m = nil
                    if tXTRA.isUserHidden(SelectedPlayer[3]) then
                        RageUI.ActuallyCloseAll()
                    end
                    if i == nil then
                        RageUI.Separator("~y~Player must provide POV on request: ~o~Loading...")
                    elseif i == true then
                        RageUI.Separator("~y~Player must provide POV on request: ~g~true")
                    elseif i == false then
                        RageUI.Separator("~y~Player must provide POV on request: ~r~false")
                    end
                    if tXTRA.getStaffLevel() >= 1 then
                        RageUI.ButtonWithStyle(
                            "Player Notes",
                            SelectedPlayer[1] .. " Perm ID: " .. SelectedPlayer[3] .. " Temp ID: " .. SelectedPlayer[2],
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    TriggerServerEvent("XTRA:getNotes", SelectedPlayer[3])
                                end
                            end,
                            RMenu:Get("adminmenu", "notesub")
                        )
                        RageUI.ButtonWithStyle(
                            "Kick Player",
                            SelectedPlayer[1] .. " Perm ID: " .. SelectedPlayer[3] .. " Temp ID: " .. SelectedPlayer[2],
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    local al = GetPlayerServerId(PlayerId())
                                    TriggerServerEvent("XTRA:KickPlayer", SelectedPlayer[3], SelectedPlayer[2])
                                end
                            end,
                            RMenu:Get("adminmenu", "submenu")
                        )
                    end
                    if tXTRA.getStaffLevel() >= 2 then
                    --     RageUI.ButtonWithStyle(
                    --         "Ban Player",
                    --         SelectedPlayer[1] .. " Perm ID: " .. SelectedPlayer[3] .. " Temp ID: " .. SelectedPlayer[2],
                    --         {RightLabel = "→→→"},
                    --         true,
                    --         function(R, S, T)
                    --             if T then
                    --                 banningPermID = SelectedPlayer[3]
                    --                 banningName = SelectedPlayer[1]
                    --                 z = nil
                    --                 TriggerServerEvent("XTRA:getNotes", SelectedPlayer[3])
                    --                 o = {}
                    --                 for y, Q in pairs(n) do
                    --                     Q.itemchecked = false
                    --                 end
                    --             end
                    --         end,
                    --         RMenu:Get("adminmenu", "notespreviewban")
                    --     )
                        RageUI.ButtonWithStyle(
                            "Spectate Player",
                            SelectedPlayer[1] .. " Perm ID: " .. SelectedPlayer[3] .. " Temp ID: " .. SelectedPlayer[2],
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    if tonumber(SelectedPlayer[2]) ~= GetPlayerServerId(PlayerId()) then
                                        if not tXTRA.isInSpectate() then
                                            inRedZone = false
                                            TriggerServerEvent("XTRA:spectatePlayer", SelectedPlayer[3])
                                            c = true
                                            RageUI.Text({message = string.format("~r~Press [E] to stop spectating.")})
                                        else
                                            tXTRA.notify("You are already spectating a player.")
                                        end
                                    else
                                        tXTRA.notify("You cannot spectate yourself.")
                                    end
                                end
                            end,
                            RMenu:Get("adminmenu", "submenu")
                        )
                    end
                    if tXTRA.getStaffLevel() >= 3 then
                        RageUI.ButtonWithStyle(
                            "Revive",
                            SelectedPlayer[1] .. " Perm ID: " .. SelectedPlayer[3] .. " Temp ID: " .. SelectedPlayer[2],
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    local al = GetPlayerServerId(PlayerId())
                                    TriggerServerEvent("XTRA:RevivePlayer", SelectedPlayer[3])
                                end
                            end,
                            RMenu:Get("adminmenu", "submenu")
                        )
                    end
                    if tXTRA.getStaffLevel() >= 1 then
                        RageUI.ButtonWithStyle(
                            "Teleport to Player",
                            "Name: " ..
                                SelectedPlayer[1] ..
                                    " Perm ID: " .. SelectedPlayer[3] .. " Temp ID: " .. SelectedPlayer[2],
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    local am = GetPlayerServerId(PlayerId())
                                    TriggerServerEvent("XTRA:TeleportToPlayer", SelectedPlayer[2])
                                end
                            end,
                            RMenu:Get("adminmenu", "submenu")
                        )
                        RageUI.ButtonWithStyle(
                            "Teleport Player to Me",
                            "Name: " ..
                                SelectedPlayer[1] ..
                                    " Perm ID: " .. SelectedPlayer[3] .. " Temp ID: " .. SelectedPlayer[2],
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    TriggerServerEvent("XTRA:BringPlayer", SelectedPlayer[2])
                                end
                            end,
                            RMenu:Get("adminmenu", "submenu")
                        )
                        RageUI.ButtonWithStyle(
                            "Teleport to Admin Zone",
                            SelectedPlayer[1] .. " Perm ID: " .. SelectedPlayer[3] .. " Temp ID: " .. SelectedPlayer[2],
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    inRedZone = false
                                    savedCoordsBeforeAdminZone =
                                        GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(SelectedPlayer[2])))
                                    TriggerServerEvent("XTRA:Teleport2AdminIsland", SelectedPlayer[2])
                                end
                            end,
                            RMenu:Get("adminmenu", "submenu")
                        )
                        RageUI.ButtonWithStyle(
                            "Teleport Back from Admin Zone",
                            SelectedPlayer[1] .. " Perm ID: " .. SelectedPlayer[3] .. " Temp ID: " .. SelectedPlayer[2],
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    TriggerServerEvent(
                                        "XTRA:TeleportBackFromAdminZone",
                                        SelectedPlayer[2],
                                        savedCoordsBeforeAdminZone
                                    )
                                end
                            end,
                            RMenu:Get("adminmenu", "submenu")
                        )
                        RageUI.ButtonWithStyle(
                            "Teleport to Legion",
                            SelectedPlayer[1] .. " Perm ID: " .. SelectedPlayer[3] .. " Temp ID: " .. SelectedPlayer[2],
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    TriggerServerEvent("XTRA:Teleport2Legion", SelectedPlayer[2])
                                end
                            end,
                            RMenu:Get("adminmenu", "submenu")
                        )
                        RageUI.ButtonWithStyle(
                            "Teleport to Paleto",
                            SelectedPlayer[1] .. " Perm ID: " .. SelectedPlayer[3] .. " Temp ID: " .. SelectedPlayer[2],
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    TriggerServerEvent("XTRA:Teleport2Paleto", SelectedPlayer[2])
                                end
                            end,
                            RMenu:Get("adminmenu", "submenu")
                        )
                        RageUI.ButtonWithStyle(
                            "Freeze",
                            SelectedPlayer[1] .. " Perm ID: " .. SelectedPlayer[3] .. " Temp ID: " .. SelectedPlayer[2],
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    local al = GetPlayerServerId(PlayerId())
                                    isFrozen = not isFrozen
                                    TriggerServerEvent("XTRA:FreezeSV", SelectedPlayer[2], isFrozen)
                                end
                            end,
                            RMenu:Get("adminmenu", "submenu")
                        )
                    end
                    if tXTRA.getStaffLevel() >= 5 then
                        RageUI.ButtonWithStyle(
                            "Slap Player",
                            SelectedPlayer[1] .. " Perm ID: " .. SelectedPlayer[3] .. " Temp ID: " .. SelectedPlayer[2],
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    local al = GetPlayerServerId(PlayerId())
                                    TriggerServerEvent("XTRA:SlapPlayer", SelectedPlayer[2])
                                end
                            end,
                            RMenu:Get("adminmenu", "submenu")
                        )
                        RageUI.ButtonWithStyle(
                            "Force Clock Off",
                            SelectedPlayer[1] .. " Perm ID: " .. SelectedPlayer[3] .. " Temp ID: " .. SelectedPlayer[2],
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    TriggerServerEvent("XTRA:ForceClockOff", SelectedPlayer[2])
                                end
                            end,
                            RMenu:Get("adminmenu", "submenu")
                        )
                    end
                    if tXTRA.getStaffLevel() >= 1 then
                        RageUI.ButtonWithStyle(
                            "Open F10 Warning Log",
                            SelectedPlayer[1] .. " Perm ID: " .. SelectedPlayer[3] .. " Temp ID: " .. SelectedPlayer[2],
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    ExecuteCommand("sw " .. SelectedPlayer[3])
                                end
                            end,
                            RMenu:Get("adminmenu", "submenu")
                        )
                    end
                    if tXTRA.getStaffLevel() >= 2 then
                        RageUI.ButtonWithStyle(
                            "Take Screenshot",
                            SelectedPlayer[1] .. " Perm ID: " .. SelectedPlayer[3] .. " Temp ID: " .. SelectedPlayer[2],
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    local al = GetPlayerServerId(PlayerId())
                                    TriggerServerEvent("XTRA:RequestScreenshot", SelectedPlayer[2])
                                end
                            end,
                            RMenu:Get("adminmenu", "submenu")
                        )
                        RageUI.Button(
                            "Take Video",
                            SelectedPlayer[1] .. " Perm ID: " .. SelectedPlayer[3] .. " Temp ID: " .. SelectedPlayer[2],
                            C and {RightLabel = ""} or {RightLabel = "→→→"},
                            not C,
                            function(R, S, T)
                                if T then
                                    local al = GetPlayerServerId(PlayerId())
                                    TriggerServerEvent("XTRA:RequestVideo", SelectedPlayer[2])
                                    C = true
                                    SetTimeout(
                                        20000,
                                        function()
                                            C = false
                                        end
                                    )
                                end
                            end,
                            RMenu:Get("adminmenu", "submenu")
                        )
                    end
                    if tXTRA.getStaffLevel() >= 6 then
                        RageUI.ButtonWithStyle(
                            "Request Account Info",
                            SelectedPlayer[1] .. " Perm ID: " .. SelectedPlayer[3] .. " Temp ID: " .. SelectedPlayer[2],
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    TriggerServerEvent("XTRA:requestAccountInfosv", SelectedPlayer[3])
                                end
                            end,
                            RMenu:Get("adminmenu", "submenu")
                        )
                        RageUI.ButtonWithStyle(
                            "See Groups",
                            SelectedPlayer[1] .. " Perm ID: " .. SelectedPlayer[3] .. " Temp ID: " .. SelectedPlayer[2],
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    TriggerServerEvent("XTRA:GetGroups", SelectedPlayer[3])
                                    A = ""
                                end
                            end,
                            RMenu:Get("adminmenu", "groups")
                        )
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("adminmenu", "notespreviewban")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    if tXTRA.getStaffLevel() >= 2 then
                        if noteslist == nil then
                            RageUI.Separator("~g~Player notes: Loading...")
                        elseif #noteslist == 0 then
                            RageUI.Separator("~r~There are no player notes to display.")
                        else
                            RageUI.Separator("~o~Player notes:")
                            for an = 1, #noteslist do
                                RageUI.Separator(
                                    "~g~ID: " ..
                                        noteslist[an].id ..
                                            " " .. noteslist[an].note .. " (" .. noteslist[an].author .. ")"
                                )
                            end
                        end
                        RageUI.ButtonWithStyle(
                            "Continue to Ban",
                            nil,
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                            end,
                            RMenu:Get("adminmenu", "banselection")
                        )
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("adminmenu", "banselection")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    if tXTRA.getStaffLevel() >= 2 then
                        if IsControlJustPressed(0, 37) then
                            tXTRA.clientPrompt(
                                "Search for: ",
                                "",
                                function(ao)
                                    if ao ~= "" then
                                        z = string.lower(ao)
                                    else
                                        z = nil
                                    end
                                end
                            )
                        end
                        for y, Q in pairs(n) do
                            local function ap()
                                o[Q.id] = true
                            end
                            local function aq()
                                o[Q.id] = nil
                            end
                            if z == nil or string.match(string.lower(Q.id), z) or string.match(string.lower(Q.name), z) then
                                RageUI.Checkbox(
                                    Q.name,
                                    Q.bandescription,
                                    Q.itemchecked,
                                    {RightBadge = RageUI.CheckboxStyle.Tick},
                                    function(R, T, S, ar)
                                        if T then
                                            if Q.itemchecked then
                                                ap()
                                            end
                                            if not Q.itemchecked then
                                                aq()
                                            end
                                        end
                                        Q.itemchecked = ar
                                    end
                                )
                            end
                        end
                        RageUI.ButtonWithStyle(
                            "Confirm Ban",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    TriggerServerEvent("XTRA:GenerateBan", banningPermID, o)
                                end
                            end,
                            RMenu:Get("adminmenu", "generatedban")
                        )
                        RageUI.ButtonWithStyle(
                            "Cancel Ban",
                            "",
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    o = {}
                                    for y, Q in pairs(n) do
                                        Q.itemchecked = false
                                    end
                                    RageUI.ActuallyCloseAll()
                                end
                            end
                        )
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("adminmenu", "generatedban")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    if tXTRA.getStaffLevel() >= 2 then
                        if next(o) then
                            if q == "N/A" then
                                RageUI.Separator("~g~Generating ban info, please wait...")
                            else
                                RageUI.Separator(
                                    "~r~You are about to ban " .. banningName,
                                    function()
                                    end
                                )
                                RageUI.Separator(
                                    "~w~For the following reason(s):",
                                    function()
                                    end
                                )
                                for y, Q in pairs(SeparatorMsg) do
                                    RageUI.Separator(
                                        Q,
                                        function()
                                        end
                                    )
                                end
                                local a9 = false
                                if p == -1 then
                                    a9 = true
                                end
                                RageUI.Separator("~w~Total Length: " .. (a9 and "Permanent" or p .. " hrs"))
                                RageUI.ButtonWithStyle(
                                    "Cancel",
                                    "",
                                    {RightLabel = "→→→"},
                                    true,
                                    function(R, S, T)
                                        if T then
                                            o = {}
                                            for y, Q in pairs(n) do
                                                Q.itemchecked = false
                                            end
                                            RageUI.ActuallyCloseAll()
                                        end
                                    end
                                )
                                RageUI.ButtonWithStyle(
                                    "Confirm",
                                    "",
                                    {RightLabel = "→→→"},
                                    true,
                                    function(R, S, T)
                                        if T then
                                            TriggerServerEvent("XTRA:BanPlayer", banningPermID, p, q, u)
                                        end
                                    end
                                )
                            end
                        else
                            RageUI.Separator(
                                "You must select at least one ban reason.",
                                function()
                                end
                            )
                        end
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("adminmenu", "notesub")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    if noteslist == nil then
                        RageUI.Separator("~o~Player notes: Loading...")
                    elseif #noteslist == 0 then
                        RageUI.Separator("~o~There are no player notes to display.")
                    else
                        RageUI.Separator("~o~Player notes:")
                        for an = 1, #noteslist do
                            RageUI.Separator(
                                "~o~ID: " ..
                                    noteslist[an].id .. " " .. noteslist[an].note .. " (" .. noteslist[an].author .. ")"
                            )
                        end
                    end
                    if tXTRA.getStaffLevel() >= 1 then
                        RageUI.ButtonWithStyle(
                            "Add To Notes:",
                            SelectedPlayer[1] .. " Perm ID: " .. SelectedPlayer[3] .. " Temp ID: " .. SelectedPlayer[2],
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    tXTRA.clientPrompt(
                                        "Add To Notes: ",
                                        "",
                                        function(as)
                                            if as ~= "" then
                                                if #noteslist ~= 0 then
                                                    noteslist[#noteslist + 1] = {
                                                        id = #noteslist + 1,
                                                        note = as,
                                                        author = tXTRA.getUserId()
                                                    }
                                                else
                                                    noteslist = {{id = 1, note = as, author = tXTRA.getUserId()}}
                                                end
                                                TriggerServerEvent(
                                                    "XTRA:updatePlayerNotes",
                                                    SelectedPlayer[3],
                                                    noteslist
                                                )
                                            end
                                        end
                                    )
                                end
                            end
                        )
                        RageUI.ButtonWithStyle(
                            "Remove Note",
                            nil,
                            {RightLabel = "→→→"},
                            true,
                            function(R, S, T)
                                if T then
                                    tXTRA.clientPrompt(
                                        "Type the ID of the note",
                                        "",
                                        function(as)
                                            if as ~= "" then
                                                as = tonumber(as)
                                                local at = {}
                                                local au = false
                                                for an = 1, #noteslist do
                                                    if noteslist[an].id == as then
                                                        for av = 1, #noteslist do
                                                            if av ~= an then
                                                                at[#at + 1] = {
                                                                    id = #at + 1,
                                                                    note = noteslist[av].note,
                                                                    author = noteslist[av].author
                                                                }
                                                            end
                                                        end
                                                        au = true
                                                        break
                                                    end
                                                end
                                                if au == true then
                                                    if #at == 0 then
                                                        at = nil
                                                        noteslist = {}
                                                    else
                                                        noteslist = at
                                                    end
                                                    TriggerServerEvent("XTRA:updatePlayerNotes", SelectedPlayer[3], at)
                                                end
                                            end
                                        end
                                    )
                                end
                            end
                        )
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("adminmenu", "groups")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    if tXTRA.getStaffLevel() >= 7 then
                        if IsControlJustPressed(0, 37) then
                            tXTRA.clientPrompt(
                                "Search for: ",
                                "",
                                function(a6)
                                    A = string.lower(a6)
                                end
                            )
                        end
                        for y, a6 in pairs(J) do
                            if A == "" or string.find(string.lower(a6), string.lower(A)) then
                                if g[y] then
                                    RageUI.ButtonWithStyle(
                                        "~g~" .. a6,
                                        "~g~User has this group.",
                                        {RightLabel = "→→→"},
                                        true,
                                        function(U, V, W)
                                            if W then
                                                h = y
                                            end
                                        end,
                                        RMenu:Get("adminmenu", "removegroup")
                                    )
                                else
                                    RageUI.ButtonWithStyle(
                                        "~r~" .. a6,
                                        "~r~User does not have this group.",
                                        {RightLabel = "→→→"},
                                        true,
                                        function(U, V, W)
                                            if W then
                                                h = y
                                            end
                                        end,
                                        RMenu:Get("adminmenu", "addgroup")
                                    )
                                end
                            end
                        end
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("adminmenu", "addgroup")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    RageUI.ButtonWithStyle(
                        "Add this group to user",
                        "",
                        {RightLabel = "→→→"},
                        true,
                        function(R, S, T)
                            if T then
                                TriggerServerEvent("XTRA:AddGroup", j, h)
                            end
                        end,
                        RMenu:Get("adminmenu", "groups")
                    )
                end
            )
        end
        if RageUI.Visible(RMenu:Get("adminmenu", "removegroup")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    RageUI.ButtonWithStyle(
                        "Remove user from group",
                        "",
                        {RightLabel = "→→→"},
                        true,
                        function(R, S, T)
                            if T then
                                TriggerServerEvent("XTRA:RemoveGroup", j, h)
                            end
                        end,
                        RMenu:Get("adminmenu", "groups")
                    )
                end
            )
        end
    end
)
RegisterCommand(
    "cleanup",
    function()
        TriggerServerEvent("XTRA:CleanAll")
    end
)
RegisterNetEvent("XTRA:SlapPlayer")
AddEventHandler(
    "XTRA:SlapPlayer",
    function()
        SetEntityHealth(PlayerPedId(), 0)
    end
)
frozen = false
RegisterNetEvent(
    "XTRA:Freeze",
    function()
        local aw = tXTRA.getPlayerPed()
        if IsPedSittingInAnyVehicle(aw) then
            local ax = GetVehiclePedIsIn(aw, false)
            TaskLeaveVehicle(aw, ax, 4160)
        end
        if not frozen then
            FreezeEntityPosition(aw, true)
            frozen = true
            while frozen do
                tXTRA.setWeapon(aw, "WEAPON_UNARMED", true)
                Wait(0)
            end
        else
            FreezeEntityPosition(aw, false)
            frozen = false
        end
    end
)
RegisterNetEvent(
    "XTRA:sendNotes",
    function(as)
        as = json.decode(as)
        if as == nil then
            noteslist = {}
        else
            noteslist = as
        end
    end
)
RegisterNetEvent("XTRA:ReturnPov")
AddEventHandler(
    "XTRA:ReturnPov",
    function(ay)
        i = ay
    end
)
RegisterNetEvent("XTRA:GotGroups")
AddEventHandler(
    "XTRA:GotGroups",
    function(az)
        g = az
    end
)
RegisterNetEvent("XTRA:getPlayersInfo")
AddEventHandler(
    "XTRA:getPlayersInfo",
    function(aA, aB)
        d = aA
        n = aB
        RageUI.Visible(RMenu:Get("adminmenu", "main"), not RageUI.Visible(RMenu:Get("adminmenu", "main")))
    end
)
RegisterNetEvent("XTRA:RecieveBanPlayerData")
AddEventHandler(
    "XTRA:RecieveBanPlayerData",
    function(aC, aD, aE, aF)
        p = aC
        q = aD
        SeparatorMsg = aE
        u = aF
        RageUI.Visible(RMenu:Get("adminmenu", "generatedban"), true)
    end
)
RegisterNetEvent("XTRA:receivedUserInformation")
AddEventHandler(
    "XTRA:receivedUserInformation",
    function(aG, aH, aI, aJ, aK)
        if aG == nil or aH == nil or aI == nil or aJ == nil or aK == nil then
            B = nil
            tXTRA.notify("~r~Player does not exist.")
            return
        end
        sc = aG
        sn = aH
        sb = getMoneyStringFormatted(aI)
        sw = getMoneyStringFormatted(aJ)
        sch = getMoneyStringFormatted(aK)
    end
)
function Draw2DText(U, V, aL, aM)
    SetTextFont(4)
    SetTextProportional(7)
    SetTextScale(aM, aM)
    SetTextColour(255, 255, 255, 255)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextEntry("STRING")
    AddTextComponentString(aL)
    DrawText(U, V)
end
RegisterNetEvent("XTRA:OpenAdminMenu")
AddEventHandler(
    "XTRA:OpenAdminMenu",
    function(aN)
        if aN then
            TriggerServerEvent("XTRA:GetPlayerData")
            TriggerServerEvent("XTRA:GetNearbyPlayerData")
            TriggerServerEvent("XTRA:getAdminLevel")
        end
    end
)
function DrawHelpMsg(aO)
    SetTextComponentFormat("STRING")
    AddTextComponentString(aO)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
function bank_drawTxt(U, V, aP, a0, aM, aL, H, v, aQ, Y, aR)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(aM, aM)
    SetTextColour(H, v, aQ, Y)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if aR then
        SetTextOutline()
    end
    SetTextEntry("STRING")
    AddTextComponentString(aL)
    DrawText(U - aP / 2, V - a0 / 2 + 0.005)
end
function func_checkSpectatorMode()
    if c then
        if IsControlJustPressed(0, 51) then
            c = false
            TriggerServerEvent("XTRA:stopSpectatePlayer")
        end
    end
end
tXTRA.createThreadOnTick(func_checkSpectatorMode)
RegisterNetEvent(
    "XTRA:takeClientScreenshotAndUpload",
    function(aS)
        local aS = aS
        exports["els"]:requestScreenshotUpload(
            aS,
            "files[]",
            function(aT)
            end
        )
    end
)
RegisterNetEvent(
    "XTRA:returnCriteriaSearch",
    function(az)
        F = az
        RageUI.Visible(RMenu:Get("adminmenu", "criteriasearch"), true)
    end
)
RegisterNetEvent(
    "XTRA:takeClientVideoAndUpload",
    function(aS)
        local aS = aS
        exports["els"]:requestVideoUpload(
            aS,
            "files[]",
            {headers = {}, isVideo = true, isManual = true, encoding = "mp4"},
            function(aU)
            end
        )
    end
)
local aV = 0
local function aW()
    local aX = GetResourceState("els")
    if aX == "started" then
        exports["els"]:requestKeepAlive(
            function(aY)
                if not aY then
                    aV = GetGameTimer()
                end
            end
        )
    end
    if GetGameTimer() - aV > 60000 then
        TriggerServerEvent("XTRA:acType16")
    end
end
AddEventHandler(
    "XTRA:onClientSpawn",
    function(aZ, a4)
        if a4 then
            aV = GetGameTimer()
            while true do
                aW()
                Citizen.Wait(5000)
            end
        end
    end
)
local a_ = false
RegisterNetEvent(
    "XTRA:adminTicketFeedback",
    function(b0, b1)
        local b2, b3 = tXTRA.getPlayerVehicle()
        if b2 ~= 0 and b3 and GetEntitySpeed(b2) > 25.0 or tXTRA.getPlayerCombatTimer() > 0 then
            return
        end
        if a_ then
            return
        end
        a_ = true
        RequestStreamedTextureDict("ticket_response", false)
        while not HasStreamedTextureDictLoaded("ticket_response") do
            Citizen.Wait(0)
        end
        setCursor(1)
        TriggerScreenblurFadeIn(500.0)
        tXTRA.hideUI()
        local b4 = nil
        while not b4 do
            DisableControlAction(0, 202, true)
            drawNativeNotification("Press ~INPUT_FRONTEND_CANCEL~ to stop providing feedback")
            for b5 = 0, 6 do
                DisableControlAction(0, b5, true)
            end
            DrawSprite("ticket_response", "faces", 0.5, 0.575, 0.39, 0.28275, 0.0, 255, 255, 255, 255)
            DrawAdvancedText(
                0.58,
                0.4,
                0.01,
                0.01,
                0.65,
                "How would you rate your experience with the admin?",
                255,
                255,
                255,
                255,
                0,
                0
            )
            if CursorInArea(0.304, 0.411, 0.483, 0.669) and IsControlJustPressed(0, 237) then
                b4 = "good"
            end
            if CursorInArea(0.446, 0.552, 0.483, 0.669) and IsControlJustPressed(0, 237) then
                b4 = "neutral"
            end
            if CursorInArea(0.588, 0.693, 0.483, 0.669) and IsControlJustPressed(0, 237) then
                b4 = "bad"
            end
            if IsDisabledControlJustPressed(0, 202) then
                break
            end
            Citizen.Wait(0)
        end
        setCursor(0)
        SetStreamedTextureDictAsNoLongerNeeded("ticket_response")
        if b4 then
            local b6 = false
            tXTRA.clientPrompt(
                "Attached Message",
                "",
                function(b7)
                    TriggerServerEvent("XTRA:adminTicketFeedback", b0, b4, b7, b1)
                    b6 = true
                end
            )
            while not b6 do
                for b5 = 0, 6 do
                    DisableControlAction(0, b5, true)
                end
                drawNativeNotification("Press ~INPUT_FRONTEND_RUP~ to submit the " .. b4 .. " feedback")
                DrawAdvancedText(
                    0.58,
                    0.4,
                    0.01,
                    0.01,
                    0.65,
                    "Would you like to provide any additional feedback?",
                    255,
                    255,
                    255,
                    255,
                    0,
                    0
                )
                Citizen.Wait(0)
            end
        else
            TriggerServerEvent("XTRA:adminTicketNoFeedback", b0, b1)
        end
        tXTRA.showUI()
        TriggerScreenblurFadeOut(500.0)
        a_ = false
    end
)
