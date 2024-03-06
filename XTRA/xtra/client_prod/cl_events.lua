RMenu.Add("eventmenu", "mainmenu", RageUI.CreateMenu("Event Menu", "Main Menu"))
RMenu.Add("eventmenu", "koth", RageUI.CreateSubMenu(RMenu:Get("eventmenu", "mainmenu"), "KOTH Event", "Manage KOTH Event"))
RMenu.Add("eventmenu", "announce", RageUI.CreateSubMenu(RMenu:Get("eventmenu", "mainmenu"), "Event Announcement", "Create an Event Announcement"))

RegisterNetEvent("OpenEventMenu")
AddEventHandler("OpenEventMenu", function()
    RageUI.Visible(RMenu:Get("eventmenu", "mainmenu"), true)
end)

RageUI.CreateWhile(1.0, true, function()
    if RageUI.Visible(RMenu:Get('eventmenu', 'mainmenu')) then
        RageUI.DrawContent({ header = true, glare = false, instructionalButton = false }, function()
            RageUI.ButtonWithStyle("KOTH", "Manage KOTH Event", {}, true, function(_, _, selected)
                if
                selected then
                    RageUI.Visible(RMenu:Get("eventmenu", "koth"), true)
                    end
                    end)
                    end)
                    end

                    if RageUI.Visible(RMenu:Get('eventmenu', 'koth')) then
                        RageUI.DrawContent({ header = true, glare = false, instructionalButton = false }, function()
                            RageUI.ButtonWithStyle("Start KOTH Event", "Start the KOTH event (Testing)", {}, true, function(_, _, selected)
                                if selected then
                                    TriggerServerEvent("XTRA:serviceAnnounce", "Event Announcement")
                                    TriggerServerEvent("StartKothEvent")
                                    print("KOTH Event Start button pressed - functionality pending")
                                    -- Placeholder for future functionality
                                end
                            end)
                        end)
                    end
                    
                    if RageUI.Visible(RMenu:Get('eventmenu', 'announce')) then
                        RageUI.DrawContent({ header = true, glare = false, instructionalButton = false }, function()
                            RageUI.ButtonWithStyle("Submit Announcement", "Enter your announcement text", {}, true, function(_, _, selected)
                                if selected then
                                    TriggerServerEvent("XTRA:serviceAnnounce", "Event Announcement")
                                end
                            end)
                        end)
                    end
                end)                    

                RegisterCommand("eventmenu", function()
                    local userId = tXTRA.getUserId()
                    if userId == 1 or userId == 2 then
                    TriggerEvent("OpenEventMenu")
                    else
                    print("You do not have permission to open this menu.")
                    end
                    end)
                    
                    RegisterNetEvent("StartKothEvent")
                    AddEventHandler("StartKothEvent", function()
                    -- Triggering the announcement for KOTH event
                    -- Additional logic for starting the KOTH event can be added here
                    end)