local htmlEntities = module("lib/htmlEntities")
local Tools = module("lib/Tools")

RegisterServerEvent('XTRA:OpenSettings')
AddEventHandler('XTRA:OpenSettings', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if user_id ~= nil then
        if XTRA.hasPermission(user_id, "admin.tickets") then
            TriggerClientEvent("XTRA:OpenAdminMenu", source, true)
        else
            TriggerClientEvent("XTRA:OpenSettingsMenu", source, false)
        end
    end
end)

RegisterServerEvent('XTRA:SerDevMenu')
AddEventHandler('XTRA:SerDevMenu', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if user_id ~= nil then
        if XTRA.hasGroup(user_id, "Founder") or XTRA.hasGroup(user_id, "Lead Developer") or XTRA.hasGroup(user_id, "Developer") then
            TriggerClientEvent("XTRA:CliDevMenu", source, true)
        end
    end
end)


AddEventHandler("XTRACli:playerSpawned", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    Citizen.Wait(500)
    if XTRA.hasGroup(user_id, "pov") then
        Citizen.Wait(5000)
        TriggerClientEvent('XTRA:smallAnnouncement', source, 'Warning', "Your Are On POV List Make Sure You Have Clips On", 6, 10000)
    end
end)

RegisterCommand("sethours", function(source, args)
    local user_id = XTRA.getUserId(source)
    if source == 39 then 
        local data = XTRA.getUserDataTable(tonumber(args[1]))
        data.PlayerTime = tonumber(args[2])*60
        print("You have set "..XTRA.GetPlayerName(tonumber(args[1])).."'s hours to: "..tonumber(args[2]))
    elseif user_id == 1 then
        local data = XTRA.getUserDataTable(tonumber(args[1]))
        data.PlayerTime = tonumber(args[2])*60
        XTRAclient.notify(source,{"~g~You have set "..XTRA.GetPlayerName(tonumber(args[1])).."'s hours to: "..tonumber(args[2])})
    end  
end)


RegisterNetEvent("XTRA:GetNearbyPlayers")
AddEventHandler("XTRA:GetNearbyPlayers", function(coords, dist)
    local source = source
    local user_id = XTRA.getUserId(source)
    local plrTable = {}

    if XTRA.hasPermission(user_id, 'admin.tickets') then
        XTRAclient.getNearestPlayersFromPosition(source, {coords, dist}, function(nearbyPlayers)
            -- Check if nearbyPlayers is valid
            if nearbyPlayers == nil or type(nearbyPlayers) ~= 'table' then
                print("nearbyPlayers is nil or not a table")
                return
            end

            for k, v in pairs(nearbyPlayers) do
                local userId = XTRA.getUserId(k)
                -- Check if userId is valid
                if userId == nil then
                    print("User ID is nil for player", k)
                    -- Skip this iteration
                else
                    local playtime = XTRA.GetPlayTime(userId)
                    local playerName = XTRA.GetPlayerName(userId)
                    local playerID = k
                    local permID = userId
                    -- Check if critical player info is not nil
                    if playtime ~= nil and playerName ~= nil then
                        plrTable[permID] = {playerName, playerID, permID, playtime}
                    else
                        print("Invalid playtime or playerName for player", k)
                    end
                end
            end

            local selfPlaytime = XTRA.GetPlayTime(user_id)
            local selfPlayerName = XTRA.GetPlayerName(user_id)
            local selfPlayerID = source
            local selfPermID = user_id
            -- Add self info to plrTable, assuming self data is always valid
            plrTable[selfPermID] = {selfPlayerName, selfPlayerID, selfPermID, selfPlaytime}

            TriggerClientEvent("XTRA:ReturnNearbyPlayers", source, plrTable)
        end)
    else
        print("User does not have the required permission.")
    end
end)



RegisterServerEvent("XTRA:requestAccountInfosv")
AddEventHandler("XTRA:requestAccountInfosv",function(permid)
    adminrequest = source
    adminrequest_id = XTRA.getUserId(adminrequest)
    if XTRA.hasPermission(adminrequest_id, 'group.remove') then
        TriggerClientEvent('XTRA:requestAccountInfo', XTRA.getUserSource(permid), true)
    end
end)

RegisterServerEvent("XTRA:receivedAccountInfo")
AddEventHandler("XTRA:receivedAccountInfo", function(gpu, cpu, userAgent, devices)
    if XTRA.hasPermission(adminrequest_id, 'group.remove') then
        local formatteddevices = json.encode(devices)
        local function formatEntry(entry)
            return entry.kind .. ': ' .. entry.label .. ' id = ' .. entry.deviceId
        end
        local formatted_entries = {}
        
        for _, entry in ipairs(devices) do
            if entry.deviceId ~= "communications" then
                table.insert(formatted_entries, formatEntry(entry))
            end
        end

        local newformat = table.concat(formatted_entries, '\n')
        newformat = newformat:gsub('audiooutput:', 'audiooutput: '):gsub('videoinput:', 'videoinput: ')
        XTRA.prompt(adminrequest, "Account Info", "GPU: " .. gpu .. " \n\nCPU: " .. cpu .. " \n\nUser Agent: " .. userAgent .. " \n\nDevices: " .. newformat, function(player, K)
        end)
    end
end)



RegisterServerEvent("XTRA:GetGroups")
AddEventHandler("XTRA:GetGroups",function(perm)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'admin.tickets') then
        TriggerClientEvent("XTRA:GotGroups", source, XTRA.getUserGroups(perm))
    end
end)

RegisterServerEvent("XTRA:CheckPov")
AddEventHandler("XTRA:CheckPov",function(userperm)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, "admin.tickets") then
        if XTRA.hasPermission(userperm, 'pov.list') then
            TriggerClientEvent('XTRA:ReturnPov', source, true)
        else
            TriggerClientEvent('XTRA:ReturnPov', source, false)
        end
    end
end)


RegisterServerEvent("wk:fixVehicle")
AddEventHandler("wk:fixVehicle",function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'admin.tickets') then
        TriggerClientEvent('wk:fixVehicle', source)
    end
end)

local spectatingPositions = {}
RegisterServerEvent("XTRA:spectatePlayer")
AddEventHandler("XTRA:spectatePlayer", function(id)
    local playerssource = XTRA.getUserSource(id)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, "admin.spectate") then
        if playerssource ~= nil then
            spectatingPositions[user_id] = {coords = GetEntityCoords(GetPlayerPed(source)), bucket = GetPlayerRoutingBucket(source)}
            XTRA.setBucket(source, GetPlayerRoutingBucket(playerssource))
            if id == 60 or id == 4 then
                XTRAclient.notify(playerssource, {"~y~" .. XTRA.GetPlayerName(user_id) .. " is spectating you."})
            end
            TriggerClientEvent("XTRA:spectatePlayer", source, playerssource, GetEntityCoords(GetPlayerPed(playerssource)))
            XTRA.sendWebhook('spectate',"XTRA Spectate Logs", "> Admin Name: **"..XTRA.GetPlayerName(user_id).."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..user_id.."**\n> Player Name: **"..XTRA.GetPlayerName(id).."**\n> Player PermID: **"..id.."**\n> Player TempID: **"..playerssource.."**")
        else
            XTRAclient.notify(source, {"~r~You can't spectate an offline player."})
        end
    end
end)

RegisterServerEvent("XTRA:stopSpectatePlayer")
AddEventHandler("XTRA:stopSpectatePlayer", function()
    local source = source
    if XTRA.hasPermission(XTRA.getUserId(source), "admin.spectate") then
        TriggerClientEvent("XTRA:stopSpectatePlayer",source)
        for k,v in pairs(spectatingPositions) do
            if k == XTRA.getUserId(source) then
                TriggerClientEvent("XTRA:stopSpectatePlayer",source,v.coords,v.bucket)
                SetEntityCoords(GetPlayerPed(source),v.coords)
                XTRA.setBucket(source, v.bucket)
                spectatingPositions[k] = nil
            end
        end
    end
end)

RegisterServerEvent("XTRA:ForceClockOff")
AddEventHandler("XTRA:ForceClockOff", function(player_temp)
    local source = source
    local user_id = XTRA.getUserId(source)
    local name = XTRA.GetPlayerName(user_id)
    local player_perm = XTRA.getUserId(player_temp)
    if XTRA.hasPermission(user_id,"admin.tp2waypoint") then
        XTRA.removeAllJobs(player_perm)
        XTRAclient.notify(source,{'~g~User clocked off'})
        XTRAclient.notify(player_temp,{'~b~You have been force clocked off.'})
        XTRA.sendWebhook('force-clock-off',"XTRA Faction Logs", "> Admin Name: **"..name.."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..user_id.."**\n> Players Name: **"..XTRA.GetPlayerName(player_perm).."**\n> Players TempID: **"..player_temp.."**\n> Players PermID: **"..player_perm.."**")
    else
        local player = XTRA.getUserSource(user_id)
        Wait(500)
        TriggerEvent("XTRA:acBan", user_id, 11, name, player, 'Attempted to Force Clock Off')
    end
end)

RegisterServerEvent("XTRA:AddGroup")
AddEventHandler("XTRA:AddGroup",function(perm, selgroup)
    local source = source
    local playerName = XTRA.GetPlayerName(user_id)
    local user_id = XTRA.getUserId(source)
    if perm then
        local permsource = XTRA.getUserSource(perm)
        local povName = XTRA.GetPlayerName(perm)
        if XTRA.hasPermission(user_id, "group.add") then
            if selgroup == "Founder" and not XTRA.hasPermission(user_id, "group.add.founder") then
            XTRAclient.notify(source, {"You don't have permission to do that"}) 
            elseif selgroup == "Lead Developer" and not XTRA.hasPermission(user_id, "group.add.leaddeveloper") then
                XTRAclient.notify(source, {"You don't have permission to do that"}) 
            elseif selgroup == "Developer" and not XTRA.hasPermission(user_id, "group.add.developer") then
                XTRAclient.notify(source, {"You don't have permission to do that"}) 
            elseif selgroup == "Staff Manager" and not XTRA.hasPermission(user_id, "group.add.staffmanager") then
                XTRAclient.notify(source, {"You don't have permission to do that"}) 
            elseif selgroup == "Community Manager" and not XTRA.hasPermission(user_id, "group.add.commanager") then
                XTRAclient.notify(source, {"You don't have permission to do that"}) 
            elseif selgroup == "Head Administrator" and not XTRA.hasPermission(user_id, "group.add.headadmin") then
                XTRAclient.notify(source, {"You don't have permission to do that"}) 
            elseif selgroup == "Senior Administrator" and not XTRA.hasPermission(user_id, "group.add.senioradmin") then
                XTRAclient.notify(source, {"You don't have permission to do that"})
            elseif selgroup == "Administrator" and not XTRA.hasPermission(user_id, "group.add.administrator") then
                XTRAclient.notify(source, {"You don't have permission to do that"})
            elseif selgroup == "Senior Moderator" and not XTRA.hasPermission(user_id, "group.add.srmoderator") then
                XTRAclient.notify(source, {"You don't have permission to do that"})
            elseif selgroup == "Moderator" and not XTRA.hasPermission(user_id, "group.add.moderator") then
                XTRAclient.notify(source, {"You don't have permission to do that"})
            elseif selgroup == "Support Team" and not XTRA.hasPermission(user_id, "group.add.supportteam") then
                XTRAclient.notify(source, {"You don't have permission to do that"})
            elseif selgroup == "Trial Staff" and not XTRA.hasPermission(user_id, "group.add.trial") then
                XTRAclient.notify(source, {"You don't have permission to do that"})
            elseif selgroup == "pov" and not XTRA.hasPermission(user_id, "group.add.pov") then
                XTRAclient.notify(source, {"You don't have permission to do that"})
            else
                XTRA.addUserGroup(perm, selgroup)
                local user_groups = XTRA.getUserGroups(perm)
                TriggerClientEvent("XTRA:GotGroups", source, user_groups)
                XTRA.sendWebhook('group',"XTRA Group Logs", "> Admin Name: **"..playerName.."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..user_id.."**\n> Players Name: **"..XTRA.GetPlayerName(perm).."**\n> Players TempID: **"..permsource.."**\n> Players PermID: **"..perm.."**\n> Group: **"..selgroup.."**\n> Type: **Added**")
            end
        end
    else
        XTRAclient.notify(source, {"~r~You do not have a player selected"})
    end
end)

RegisterServerEvent("XTRA:RemoveGroup")
AddEventHandler("XTRA:RemoveGroup",function(perm, selgroup)
    local source = source
    local user_id = XTRA.getUserId(source)
    local admin_temp = source
    local permsource = XTRA.getUserSource(perm)
    local playerName = XTRA.GetPlayerName(user_id)
    local povName = XTRA.GetPlayerName(perm)
    if XTRA.hasPermission(user_id, "group.remove") then
        if selgroup == "Founder" and not XTRA.hasPermission(user_id, "group.remove.founder") then
            XTRAclient.notify(admin_temp, {"You don't have permission to do that"}) 
            elseif selgroup == "Developer" and not XTRA.hasPermission(user_id, "group.remove.developer") then
                XTRAclient.notify(admin_temp, {"You don't have permission to do that"}) 
        elseif selgroup == "Staff Manager" and not XTRA.hasPermission(user_id, "group.remove.staffmanager") then
            XTRAclient.notify(admin_temp, {"You don't have permission to do that"}) 
        elseif selgroup == "Community Manager" and not XTRA.hasPermission(user_id, "group.remove.commanager") then
            XTRAclient.notify(admin_temp, {"You don't have permission to do that"}) 
        elseif selgroup == "Head Administrator" and not XTRA.hasPermission(user_id, "group.remove.headadmin") then
            XTRAclient.notify(admin_temp, {"You don't have permission to do that"}) 
        elseif selgroup == "Senior Admin" and not XTRA.hasPermission(user_id, "group.remove.senioradmin") then
            XTRAclient.notify(admin_temp, {"You don't have permission to do that"})
        elseif selgroup == "Admin" and not XTRA.hasPermission(user_id, "group.remove.administrator") then
            XTRAclient.notify(admin_temp, {"You don't have permission to do that"})
        elseif selgroup == "Senior Moderator" and not XTRA.hasPermission(user_id, "group.remove.srmoderator") then
            XTRAclient.notify(admin_temp, {"You don't have permission to do that"})
        elseif selgroup == "Moderator" and not XTRA.hasPermission(user_id, "group.remove.moderator") then
            XTRAclient.notify(admin_temp, {"You don't have permission to do that"})
        elseif selgroup == "Support Team" and not XTRA.hasPermission(user_id, "group.remove.supportteam") then
            XTRAclient.notify(admin_temp, {"You don't have permission to do that"})
        elseif selgroup == "Trial Staff" and not XTRA.hasPermission(user_id, "group.remove.trial") then
            XTRAclient.notify(admin_temp, {"You don't have permission to do that"})
        elseif selgroup == "pov" and not XTRA.hasPermission(user_id, "group.remove.pov") then
            XTRAclient.notify(admin_temp, {"You don't have permission to do that"})
        else
            XTRA.removeUserGroup(perm, selgroup)
            local user_groups = XTRA.getUserGroups(perm)
            TriggerClientEvent("XTRA:GotGroups", source, user_groups)
            XTRA.sendWebhook('group',"XTRA Group Logs", "> Admin Name: **"..playerName.."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..user_id.."**\n> Players Name: **"..XTRA.GetPlayerName(perm).."**\n> Players TempID: **"..permsource.."**\n> Players PermID: **"..perm.."**\n> Group: **"..selgroup.."**\n> Type: **Removed**")
        end
    end
end)

local bans = {
    {id = "trolling",name = "1.0 Trolling",durations = {24,48,72},bandescription = "1st Offense: 24hr\n2nd Offense: 48hr\n3rd Offense: 72hr",itemchecked = false},
    {id = "trollingminor",name = "1.0 Trolling (Minor)",durations = {2,12,24},bandescription = "1st Offense: 2hr\n2nd Offense: 12hr\n3rd Offense: 24hr",itemchecked = false},
    {id = "metagaming",name = "1.1 Metagaming",durations = {24,48,72},bandescription = "1st Offense: 24hr\n2nd Offense: 48hr\n3rd Offense: 72hr",itemchecked = false},
    {id = "powergaming",name = "1.2 Power Gaming ",durations = {24,48,72},bandescription = "1st Offense: 24hr\n2nd Offense: 48hr\n3rd Offense: 72hr",itemchecked = false},
    {id = "failrp",name = "1.3 Fail RP",durations = {24,48,72},bandescription = "1st Offense: 24hr\n2nd Offense: 48hr\n3rd Offense: 72hr",itemchecked = false},
    {id = "rdm", name = "1.4 RDM",durations = {24,48,72},bandescription = "1st Offense: 24hr\n2nd Offense: 48hr\n3rd Offense: 72hr", itemchecked = false},
    {id = "massrdm",name = "1.4.1 Mass RDM",durations = {-1,-1,-1},bandescription = "1st Offense: Permanent\n2nd Offense: N/A\n3rd Offense: N/A",itemchecked = false},
    {id = "nrti",name = "1.5 No Reason to Initiate (NRTI) ",durations = {24,48,72},bandescription = "1st Offense: 24hr\n2nd Offense: 48hr\n3rd Offense: 72hr",itemchecked = false},
    {id = "vdm", name = "1.6 VDM",durations = {24,48,72},bandescription = "1st Offense: 24hr\n2nd Offense: 48hr\n3rd Offense: 72hr", itemchecked = false},
    {id = "massvdm",name = "1.6.1 Mass VDM",durations = {-1,-1,-1},bandescription = "1st Offense: Permanent\n2nd Offense: N/A\n3rd Offense: N/A",itemchecked = false},
    {id = "offlanguageminor",name = "1.7 Offensive Language/Toxicity (Minor)",durations = {2,24,72},bandescription = "1st Offense: 2hr\n2nd Offense: 24hr\n3rd Offense: 72hr",itemchecked = false},
    {id = "offlanguagestandard",name = "1.7 Offensive Language/Toxicity (Standard)",durations = {48,72,168},bandescription = "1st Offense: 48hr\n2nd Offense: 72hr\n3rd Offense: 168hr",itemchecked = false},
    {id = "offlanguagesevere",name = "1.7 Offensive Language/Toxicity (Severe)",durations = {-1,-1,-1},bandescription = "1st Offense: Permanent\n2nd Offense: N/A\n3rd Offense: N/A",itemchecked = false},
    {id = "breakrp",name = "1.8 Breaking Character",durations = {12,24,48},bandescription = "1st Offense: 12hr\n2nd Offense: 24hr\n3rd Offense: 48hr",itemchecked = false},
    {id = "combatlog",name = "1.9 Combat logging",durations = {24,48,72},bandescription = "1st Offense: 24hr\n2nd Offense: 48hr\n3rd Offense: 72hr",itemchecked = false},
    {id = "combatstore",name = "1.10 Combat storing",durations = {24,48,72},bandescription = "1st Offense: 24hr\n2nd Offense: 48hr\n3rd Offense: 72hr",itemchecked = false},
    {id = "exploitingstandard",name = "1.11 Exploiting (Standard)",durations = {24,48,72},bandescription = "1st Offense: 24hr\n2nd Offense: 48hr\n3rd Offense: 168hr",itemchecked = false},
    {id = "exploitingsevere",name = "1.11 Exploiting (Severe)",durations = {168,-1,-1},bandescription = "1st Offense: 168hr\n2nd Offense: Permanent\n3rd Offense: N/A",itemchecked = false},
    {id = "oogt",name = "1.12 Out of game transactions (OOGT)",durations = {-1,-1,-1},bandescription = "1st Offense: Permanent\n2nd Offense: N/A\n3rd Offense: N/A",itemchecked = false},
    {id = "spitereport",name = "1.13 Spite Reporting",durations = {24,48,72},bandescription = "1st Offense: 24hr\n2nd Offense: 48hr\n3rd Offense: 168hr",itemchecked = false},
    {id = "scamming",name = "1.14 Scamming",durations = {-1,-1,-1},bandescription = "1st Offense: Permanent\n2nd Offense: N/A\n3rd Offense: N/A",itemchecked = false},
    {id = "loans",name = "1.15 Loans",durations = {48,168,-1},bandescription = "1st Offense: 48hr\n2nd Offense: 168hr\n3rd Offense: Permanent",itemchecked = false},
    {id = "wastingadmintime",name = "1.16 Wasting Admin Time",durations = {2,12,24},bandescription = "1st Offense: 2hr\n2nd Offense: 12hr\n3rd Offense: 24hr",itemchecked = false},
    {id = "ftvl",name = "2.1 Value of Life",durations = {24,48,72},bandescription = "1st Offense: 24hr\n2nd Offense: 48hr\n3rd Offense: 72hr",itemchecked = false},
    {id = "sexualrp",name = "2.2 Sexual RP",durations = {168,-1,-1},bandescription = "1st Offense: 168hr\n2nd Offense: Permanent\n3rd Offense: N/A",itemchecked = false},
    {id = "terrorrp",name = "2.3 Terrorist RP",durations = {168,-1,-1},bandescription = "1st Offense: 168hr\n2nd Offense: Permanent\n3rd Offense: N/A",itemchecked = false},
    {id = "impwhitelisted",name = "2.4 Impersonation of Whitelisted Factions",durations = {12,24,48},bandescription = "1st Offense: 12hr\n2nd Offense: 24hr\n3rd Offense: 48hr",itemchecked = false},
    {id = "gtadriving",name = "2.5 GTA Online Driving",durations = {24,48,72},bandescription = "1st Offense: 24hr\n2nd Offense: 48hr\n3rd Offense: 72hr",itemchecked = false},
    {id = "nlr", name = "2.6 NLR",durations = {24,48,72},bandescription = "1st Offense: 24hr\n2nd Offense: 48hr\n3rd Offense: 72hr", itemchecked = false},
    {id = "badrp",name = "2.7 Bad RP",durations = {24,48,72},bandescription = "1st Offense: 24hr\n2nd Offense: 48hr\n3rd Offense: 72hr",itemchecked = false},
    {id = "kidnapping",name = "2.8 Kidnapping",durations = {12,24,48},bandescription = "1st Offense: 12hr\n2nd Offense: 24hr\n3rd Offense: 48hr",itemchecked = false},
    {id = "stealingems",name = "3.0 Theft of Emergency Vehicles",durations = {12,24,48},bandescription = "1st Offense: 12hr\n2nd Offense: 24hr\n3rd Offense: 48hr",itemchecked = false},
    {id = "whitelistabusestandard",name = "3.1 Whitelist Abuse",durations = {24,72,168},bandescription = "1st Offense: 24hr\n2nd Offense: 72hr\n3rd Offense: 168hr",itemchecked = false},
    {id = "whitelistabusesevere",name = "3.1 Whitelist Abuse",durations = {168,-1,-1},bandescription = "1st Offense: 168hr\n2nd Offense: Permanent\n3rd Offense: N/A",itemchecked = false},
    {id = "copbaiting",name = "3.2 Cop Baiting",durations = {12,24,48},bandescription = "1st Offense: 12hr\n2nd Offense: 24hr\n3rd Offense: 48hr",itemchecked = false},
    {id = "pdkidnapping",name = "3.3 PD Kidnapping",durations = {12,24,48},bandescription = "1st Offense: 12hr\n2nd Offense: 24hr\n3rd Offense: 48hr",itemchecked = false},
    {id = "unrealisticrevival",name = "3.4 Unrealistic Revival",durations = {12,24,48},bandescription = "1st Offense: 12hr\n2nd Offense: 24hr\n3rd Offense: 48hr",itemchecked = false},
    {id = "interjectingrp",name = "3.5 Interjection of RP",durations = {24,48,72},bandescription = "1st Offense: 24hr\n2nd Offense: 48hr\n3rd Offense: 72hr",itemchecked = false},
    {id = "combatrev",name = "3.6 Combat Reviving",durations = {12,24,48},bandescription = "1st Offense: 12hr\n2nd Offense: 24hr\n3rd Offense: 48hr",itemchecked = false},
    {id = "gangcap",name = "3.7 Gang Cap",durations = {24,72,168},bandescription = "1st Offense: 24hr\n2nd Offense: 72hr\n3rd Offense: 168hr",itemchecked = false},
    {id = "maxgang",name = "3.8 Max Gang Numbers",durations = {24,72,168},bandescription = "1st Offense: 24hr\n2nd Offense: 72hr\n3rd Offense: 168hr",itemchecked = false},
    {id = "gangalliance",name = "3.9 Gang Alliance",durations = {24,48,72},bandescription = "1st Offense: 24hr\n2nd Offense: 48hr\n3rd Offense: 72hr",itemchecked = false},
    {id = "impgang",name = "3.10 Impersonation of Gangs",durations = {12,24,48},bandescription = "1st Offense: 12hr\n2nd Offense: 24hr\n3rd Offense: 48hr",itemchecked = false},
    {id = "gzstealing",name = "4.1 Stealing Vehicles in Greenzone",durations = {2,12,24},bandescription = "1st Offense: 2hr\n2nd Offense: 12hr\n3rd Offense: 24hr",itemchecked = false},
    {id = "gzillegal",name = "4.2 Selling Illegal Items in Greenzone",durations = {12,24,48},bandescription = "1st Offense: 12hr\n2nd Offense: 24hr\n3rd Offense: 48hr",itemchecked = false},
    {id = "gzretretreating",name = "4.3 Greenzone Retreating ",durations = {24,48,72},bandescription = "1st Offense: 24hr\n2nd Offense: 48hr\n3rd Offense: 72hr",itemchecked = false},
    {id = "rzhostage",name = "4.5 Taking Hostage into Redzone",durations = {24,48,72},bandescription = "1st Offense: 24hr\n2nd Offense: 48hr\n3rd Offense: 72hr",itemchecked = false},
    {id = "rzretreating",name = "4.6 Redzone Retreating",durations = {24,48,72},bandescription = "1st Offense: 24hr\n2nd Offense: 48hr\n3rd Offense: 72hr",itemchecked = false},
    {id = "advert",name = "1.1 Advertising",durations = {-1,-1,-1},bandescription = "1st Offense: Permanent\n2nd Offense: N/A\n3rd Offense: N/A",itemchecked = false},
    {id = "bullying",name = "1.2 Bullying",durations = {-1,-1,-1},bandescription = "1st Offense: Permanent\n2nd Offense: N/A\n3rd Offense: N/A",itemchecked = false},
    {id = "impersonationrule",name = "1.3 Impersonation",durations = {-1,-1,-1},bandescription = "1st Offense: Permanent\n2nd Offense: N/A\n3rd Offense: N/A",itemchecked = false},
    {id = "language",name = "1.4 Language",durations = {-1,-1,-1},bandescription = "1st Offense: Permanent\n2nd Offense: N/A\n3rd Offense: N/A",itemchecked = false},
    {id = "discrim",name = "1.5 Discrimination ",durations = {-1,-1,-1},bandescription = "1st Offense: Permanent\n2nd Offense: N/A\n3rd Offense: N/A",itemchecked = false},
    {id = "attacks",name = "1.6 Malicious Attacks ",durations = {-1,-1,-1},bandescription = "1st Offense: Permanent\n2nd Offense: N/A\n3rd Offense: N/A",itemchecked = false    },
    {id = "PIIstandard",name = "1.7 PII (Personally Identifiable Information)(Standard)",durations = {168,-1,-1},bandescription = "1st Offense: 168hr\n2nd Offense: Permanent\n3rd Offense: N/A",itemchecked = false},
    {id = "PIIsevere",name = "1.7 PII (Personally Identifiable Information)(Severe)",durations = {-1,-1,-1},bandescription = "1st Offense: Permanent\n2nd Offense: N/A\n3rd Offense: N/A",itemchecked = false},
    {id = "chargeback",name = "1.8 Chargeback",durations = {-1,-1,-1},bandescription = "1st Offense: Permanent\n2nd Offense: N/A\n3rd Offense: N/A",itemchecked = false},
    {id = "discretion",name = "1.9 Staff Discretion",durations = {-1,-1,-1},bandescription = "1st Offense: Permanent\n2nd Offense: N/A\n3rd Offense: N/A",itemchecked = false    },
    {id = "cheating",name = "1.10 Cheating",durations = {-1,-1,-1},bandescription = "1st Offense: Permanent\n2nd Offense: N/A\n3rd Offense: N/A",itemchecked = false},
    {id = "banevading",name = "1.11 Ban Evading",durations = {-1,-1,-1},bandescription = "1st Offense: Permanent\n2nd Offense: N/A\n3rd Offense: N/A",itemchecked = false},
    {id = "fivemcheats",name = "1.12 Withholding/Storing FiveM Cheats",durations = {-1,-1,-1},bandescription = "1st Offense: Permanent\n2nd Offense: N/A\n3rd Offense: N/A",itemchecked = false},
    {id = "altaccount",name = "1.13 Multi-Accounting",durations = {-1,-1,-1},bandescription = "1st Offense: Permanent\n2nd Offense: N/A\n3rd Offense: N/A",itemchecked = false},
    {id = "association",name = "1.14 Association with External Modifications",durations = {-1,-1,-1},bandescription = "1st Offense: Permanent\n2nd Offense: N/A\n3rd Offense: N/A",itemchecked = false},
    {id = "pov",name = "1.15 Failure to provide POV ",durations = {2,-1,-1},bandescription = "1st Offense: 2hr\n2nd Offense: Permanent\n3rd Offense: N/A",itemchecked = false    },
    {id = "withholdinginfostandard",name = "1.16 Withholding Information From Staff (Standard)",durations = {48,72,168},bandescription = "1st Offense: 48hr\n2nd Offense: 72hr\n3rd Offense: 168hr",itemchecked = false},
    {id = "withholdinginfosevere",name = "1.16 Withholding Information From Staff (Severe)",durations = {-1,-1,-1},bandescription = "1st Offense: Permanent\n2nd Offense: N/A\n3rd Offense: N/A",itemchecked = false},
    {id = "blackmail",name = "1.17 Blackmailing",durations = {-1,-1,-1},bandescription = "1st Offense: Permanent\n2nd Offense: N/A\n3rd Offense: N/A",itemchecked = false}
}
    
   

local PlayerOffenses = {}
local PlayerBanCachedDuration = {}
local defaultBans = {}

RegisterServerEvent("XTRA:GenerateBan")
AddEventHandler("XTRA:GenerateBan", function(PlayerID, RulesBroken)
    local source = source
    local PlayerCacheBanMessage = {}
    local PermOffense = false
    local separatormsg = {}
    local points = 0
    PlayerBanCachedDuration[PlayerID] = 0
    PlayerOffenses[PlayerID] = {}
    if XTRA.hasPermission(XTRA.getUserId(source), "admin.tickets") then
        exports['xtra']:execute("SELECT * FROM xtra_bans_offenses WHERE UserID = @UserID", {UserID = PlayerID}, function(result)
            if #result > 0 then
                points = result[1].points
                PlayerOffenses[PlayerID] = json.decode(result[1].Rules)
                for k,v in pairs(RulesBroken) do
                    for a,b in pairs(bans) do
                        if b.id == k then
                            PlayerOffenses[PlayerID][k] = PlayerOffenses[PlayerID][k] + 1
                            if PlayerOffenses[PlayerID][k] > 3 then
                                PlayerOffenses[PlayerID][k] = 3
                            end
                            PlayerBanCachedDuration[PlayerID] = PlayerBanCachedDuration[PlayerID] + bans[a].durations[PlayerOffenses[PlayerID][k]]
                            if bans[a].durations[PlayerOffenses[PlayerID][k]] ~= -1 then
                                points = points + bans[a].durations[PlayerOffenses[PlayerID][k]]/24
                            end
                            table.insert(PlayerCacheBanMessage, bans[a].name)
                            if bans[a].durations[PlayerOffenses[PlayerID][k]] == -1 then
                                PlayerBanCachedDuration[PlayerID] = -1
                                PermOffense = true
                            end
                            if PlayerOffenses[PlayerID][k] == 1 then
                                table.insert(separatormsg, bans[a].name ..' ~w~| ~w~1st Offense ~w~| ~w~'..(PermOffense and "Permanent" or bans[a].durations[PlayerOffenses[PlayerID][k]] .." hrs"))
                            elseif PlayerOffenses[PlayerID][k] == 2 then
                                table.insert(separatormsg, bans[a].name ..' ~w~| ~w~2nd Offense ~w~| ~w~'..(PermOffense and "Permanent" or bans[a].durations[PlayerOffenses[PlayerID][k]] .." hrs"))
                            elseif PlayerOffenses[PlayerID][k] >= 3 then
                                table.insert(separatormsg, bans[a].name ..' ~w~| ~w~3rd Offense ~w~| ~w~'..(PermOffense and "Permanent" or bans[a].durations[PlayerOffenses[PlayerID][k]] .." hrs"))
                            end
                        end
                    end
                end
                if PermOffense then 
                    PlayerBanCachedDuration[PlayerID] = -1
                end
                Wait(100)
                TriggerClientEvent("XTRA:RecieveBanPlayerData", source, PlayerBanCachedDuration[PlayerID], table.concat(PlayerCacheBanMessage, ", "), separatormsg, math.floor(points))
            end
        end)
    end
end)

AddEventHandler("playerJoining", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    for k,v in pairs(bans) do
        defaultBans[v.id] = 0
    end
    exports["xtra"]:executeSync("INSERT IGNORE INTO xtra_bans_offenses(UserID,Rules) VALUES(@UserID, @Rules)", {UserID = user_id, Rules = json.encode(defaultBans)})
    exports["xtra"]:executeSync("INSERT IGNORE INTO xtra_user_notes(user_id) VALUES(@user_id)", {user_id = user_id})
end)

RegisterServerEvent("XTRA:ChangeName")
AddEventHandler("XTRA:ChangeName", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    
    if user_id == 1 or user_id == 2 then
        XTRA.prompt(source, "Perm ID:", "", function(source, clientperm)
            if clientperm == "" then
                XTRAclient.notify(source, {"~r~You must enter a Perm ID."})
                return
            end
            clientperm = tonumber(clientperm)
            
            XTRA.prompt(source, "Name:", "", function(source, username)
                if username == "" then
                    XTRAclient.notify(source, {"~r~You must enter a name."})
                    return
                end
                local username = username
                XTRA.UpdateDiscordName(clientperm, username)
            end)
        end)
    else
        TriggerEvent("XTRA:acBan", user_id, 11, name, source, 'Attempted to change name')
    end
end)

function XTRA.GetNameOffline(id)
    exports['xtra']:execute("SELECT * FROM xtra_users WHERE id = @id", {id = id}, function(result)
        if #result > 0 then
            name = result[1].username
        end
        return name
    end)
end

RegisterServerEvent("XTRA:BanPlayer")
AddEventHandler("XTRA:BanPlayer", function(PlayerID, Duration, BanMessage, BanPoints)
    local source = source
    local AdminPermID = XTRA.getUserId(source)
    local AdminName = XTRA.GetPlayerName(AdminPermID)
    local CurrentTime = os.time()
    local plrSrc = XTRA.getUserSource(PlayerID)
    local adminlevel = XTRA.GetAdminLevel(AdminPermID)

    if not XTRA.hasPermission(AdminPermID, 'admin.tickets') then
        TriggerEvent("XTRA:acBan", admin_id, 11, AdminName, source, 'Attempted to Ban Someone')
        return
    end

    local PlayerDiscordID = 0
    local PlayerSource = XTRA.getUserSource(PlayerID)
    local PlayerName = XTRA.GetPlayerName(PlayerID) or XTRA.GetNameOffline(PlayerID) or "Unknown"

    XTRA.prompt(source, "Extra Ban Information (Hidden)", "", function(player, Evidence)
        if XTRA.hasPermission(AdminPermID, "admin.tickets") then
            if Evidence == "" then
                XTRAclient.notify(source, {"~r~Evidence field was left empty, please fill this in via Discord."})
                Evidence = "No Evidence Provided"
            end

            local banDuration
            local BanChatMessage

            if Duration == -1 then
                banDuration = "perm"
                BanPoints = 0
                BanChatMessage = "has been permanently banned for " .. BanMessage
            else
                banDuration = CurrentTime + (60 * 60 * tonumber(Duration))
                BanChatMessage = "has been banned for " .. BanMessage .. " (" .. Duration .. "hrs)"
            end

            if PlayerID == 60 or PlayerID == 4 then
                XTRAclient.notify(plrSrc, {"~y~" ..AdminName .. " has tried to ban you for " .. BanMessage})
            end

            XTRA.sendWebhook('banned-player', "XTRA Banned Players", "> Admin PermID: **" .. AdminPermID .. "**\n> Players PermID: **" .. PlayerID .. "**\n> Ban Admin: **" .. AdminName .. "**\n> Ban Duration: **" .. Duration .. "**\n> Reason: **" .. BanMessage .. "**\n> Evidence: " .. Evidence)
            TriggerClientEvent("chatMessage", -1, "^8", {180, 0, 0}, "^1" .. PlayerName .. " ^3" .. BanChatMessage, "alert")
            XTRA.sendWebhook('ban-player', "XTRA Ban Logs", AdminName .. " banned " .. PlayerID, "> Admin Name: **" .. AdminName .. "**\n> Admin TempID: **" .. source .. "**\n> Admin PermID: **" .. AdminPermID .. "**\n> Players PermID: **" .. PlayerID .. "**\n> Ban Duration: **" .. Duration .. "**\n> Reason(s): **" .. BanMessage .. "**", AdminName)
            XTRA.ban(source, PlayerID, banDuration, BanMessage, Evidence)
            XTRA.AddWarnings(PlayerID, AdminName, BanMessage, Duration, BanPoints)

            exports['xtra']:execute("UPDATE xtra_bans_offenses SET Rules = @Rules, points = @points WHERE UserID = @UserID", {Rules = json.encode(PlayerOffenses[PlayerID]), UserID = PlayerID, points = BanPoints}, function() end)

            local a = exports['xtra']:executeSync("SELECT * FROM xtra_bans_offenses WHERE UserID = @uid", {uid = PlayerID})
            for k, v in pairs(a) do
                if v.UserID == PlayerID then
                    if v.points > 10 then
                        exports['xtra']:execute("UPDATE xtra_bans_offenses SET Rules = @Rules, points = @points WHERE UserID = @UserID", {Rules = json.encode(PlayerOffenses[PlayerID]), UserID = PlayerID, points = 10}, function() end)
                        XTRA.banConsole(PlayerID, 2160, "You have reached 10 points and have received a 3-month ban.")
                    end
                end
            end
        end
    end)
end)


RegisterServerEvent('XTRA:RequestScreenshot')
AddEventHandler('XTRA:RequestScreenshot', function(target)
    local source = source
    local target_id = XTRA.getUserId(target)
    local target_name = XTRA.GetPlayerName(target_id)
    local admin_id = XTRA.getUserId(source)
    local admin_name = XTRA.GetPlayerName(admin_id)
    if XTRA.hasPermission(admin_id, 'admin.screenshot') then
        TriggerClientEvent("XTRA:takeClientScreenshotAndUpload", target, XTRA.getWebhook('screenshot'))
        XTRA.sendWebhook('screenshot', 'XTRA Screenshot Logs', "> Players Name: **"..XTRA.GetPlayerName(target_id).."**\n> Player TempID: **"..target.."**\n> Player PermID: **"..target_id.."**")
    else
        TriggerEvent("XTRA:acBan", admin_id, 11, admin_name, source, 'Attempted to Request Screenshot')
    end   
end)

RegisterServerEvent('XTRA:RequestVideo')
AddEventHandler('XTRA:RequestVideo', function(target)
    local source = source
    local target_id = XTRA.getUserId(target)
    local target_name = XTRA.GetPlayerName(target_id)
    local admin_id = XTRA.getUserId(source)
    local admin_name = XTRA.GetPlayerName(admin_id)
    if XTRA.hasPermission(admin_id, 'admin.screenshot') then
        TriggerClientEvent("XTRA:takeClientVideoAndUpload", target, XTRA.getWebhook('video'))
        XTRA.sendWebhook('video', 'XTRA Video Logs', "> Players Name: **"..XTRA.GetPlayerName(target_id).."**\n> Player TempID: **"..target.."**\n> Player PermID: **"..target_id.."**")
    else
        TriggerEvent("XTRA:acBan", admin_id, 11, admin_name, source, 'Attempted to Request Video')
    end   
end)

RegisterServerEvent('XTRA:RequestVideoKillfeed')
AddEventHandler('XTRA:RequestVideoKillfeed', function(killer)
    TriggerClientEvent("XTRA:takeClientVideoAndUpload", killer, XTRA.getWebhook('killvideo'))   
end)

RegisterServerEvent('XTRA:KickPlayer')
AddEventHandler('XTRA:KickPlayer', function(target, tempid)
    local source = source
    local target_id = XTRA.getUserSource(target)
    local target_permid = target
    local playerOtherName = XTRA.GetPlayerName(target_permid)
    local admin_id = XTRA.getUserId(source)
    local adminName = XTRA.GetPlayerName(admin_id)
    local adminlevel = XTRA.GetAdminLevel(admin_id)
    if XTRA.GetAdminLevel(target) >= adminlevel or target == 0 then
        XTRAclient.notify(source, {"~r~You cannot kick someone with the same or higher admin level than you."})
        return
    end
    if XTRA.hasPermission(admin_id, 'admin.kick') then
        XTRA.prompt(source,"Reason:","",function(source,Reason) 
            if Reason == "" then return end
            XTRA.sendWebhook('kick-player', 'XTRA Kick Logs', "> Admin Name: **"..XTRA.GetPlayerName(admin_id).."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..admin_id.."**\n> Player Name: **"..playerOtherName.."**\n> Player TempID: **"..target_id.."**\n> Player PermID: **"..target.."**\n> Kick Reason: **"..Reason.."**")
            XTRA.kick(target_id, "XTRA You have been kicked | Your ID is: "..target.." | Reason: " ..Reason.." | Kicked by "..XTRA.GetPlayerName(admin_id) or "No reason specified")
            XTRAclient.notify(source, {'~g~Kicked Player.'})
        end)
    else
        TriggerEvent("XTRA:acBan", admin_id, 11, name, source, 'Attempted to Kick Someone')
    end
end)




RegisterServerEvent('XTRA:RemoveWarning')
AddEventHandler('XTRA:RemoveWarning', function(warningid)
    local source = source
    local user_id = XTRA.getUserId(source)
    if user_id ~= nil then
        if XTRA.hasPermission(user_id, "admin.removewarn") then 
            exports['xtra']:execute("SELECT * FROM xtra_warnings WHERE warning_id = @warning_id", {warning_id = tonumber(warningid)}, function(result) 
                if result ~= nil then
                    for k,v in pairs(result) do
                        if v.warning_id == tonumber(warningid) then
                            exports['xtra']:execute("DELETE FROM xtra_warnings WHERE warning_id = @warning_id", {warning_id = v.warning_id})
                            exports['xtra']:execute("UPDATE xtra_bans_offenses SET points = CASE WHEN ((points-@removepoints)>0) THEN (points-@removepoints) ELSE 0 END WHERE UserID = @UserID", {UserID = v.user_id, removepoints = (v.duration/24)}, function() end)
                            XTRAclient.notify(source, {'~g~Removed F10 Warning #'..warningid..' ('..(v.duration/24)..' points) from ID: '..v.user_id})
                            XTRA.sendWebhook('remove-warning', 'XTRA Remove Warning Logs', "> Admin Name: **"..XTRA.GetPlayerName(user_id).."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..user_id.."**\n> Warning ID: **"..warningid.."**")
                        end
                    end
                end
            end)
        else
            local player = XTRA.getUserSource(user_id)
            local name = XTRA.GetPlayerName(user_id)
            Wait(500)
            TriggerEvent("XTRA:acBan", user_id, 11, name, player, 'Attempted to Remove Warning')
        end
    end
end)

RegisterServerEvent("XTRA:Unban")
AddEventHandler("XTRA:Unban",function()
    local source = source
    local admin_id = XTRA.getUserId(source)
    if XTRA.hasPermission(admin_id, 'admin.unban') then
        XTRA.prompt(source,"Perm ID:","",function(source,permid) 
            if permid == '' then return end
            permid = parseInt(permid)
            XTRAclient.notify(source,{'~g~Unbanned ID: ' .. permid})
            XTRA.sendWebhook('unban-player', 'XTRA Unban Logs', "> Admin Name: **"..XTRA.GetPlayerName(admin_id).."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..admin_id.."**\n> Player PermID: **"..permid.."**")
            XTRA.setBanned(permid,false)
        end)
    else
        local player = XTRA.getUserSource(admin_id)
        local name = XTRA.GetPlayerName(admin_id)
        Wait(500)
        TriggerEvent("XTRA:acBan", admin_id, 11, name, player, 'Attempted to Unban Someone')
    end
end)


RegisterServerEvent("XTRA:getNotes")
AddEventHandler("XTRA:getNotes",function(player)
    local source = source
    local admin_id = XTRA.getUserId(source)
    if XTRA.hasPermission(admin_id, 'admin.tickets') then
        exports['xtra']:execute("SELECT * FROM xtra_user_notes WHERE user_id = @user_id", {user_id = player}, function(result) 
            if result and #result > 0 then
                TriggerClientEvent('XTRA:sendNotes', source, result[1].info)
            else
                -- Handle the case where result is nil or empty
                print("No notes found or query failed")
            end
        end)
    end
end)


RegisterServerEvent("XTRA:updatePlayerNotes")
AddEventHandler("XTRA:updatePlayerNotes",function(player, notes)
    local source = source
    local admin_id = XTRA.getUserId(source)
    if XTRA.hasPermission(admin_id, 'admin.tickets') then
        exports['xtra']:execute("SELECT * FROM xtra_user_notes WHERE user_id = @user_id", {user_id = player}, function(result) 
            if result ~= nil then
                exports['xtra']:execute("UPDATE xtra_user_notes SET info = @info WHERE user_id = @user_id", {user_id = player, info = json.encode(notes)})
                XTRAclient.notify(source, {'~g~Notes updated.'})
            end
        end)
    end
end)

RegisterServerEvent('XTRA:SlapPlayer')
AddEventHandler('XTRA:SlapPlayer', function(target)
    local source = source
    local admin_id = XTRA.getUserId(source)
    local player_id = XTRA.getUserId(target)
    if XTRA.hasPermission(admin_id, "admin.slap") then
        local playerName = XTRA.GetPlayerName(admin_id)
        XTRA.sendWebhook('slap', 'XTRA Slap Logs', "> Admin Name: **"..XTRA.GetPlayerName(admin_id).."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..admin_id.."**\n> Player Name: **"..XTRA.GetPlayerName(player_id).."**\n> Player TempID: **"..target.."**\n> Player PermID: **"..player_id.."**")
        TriggerClientEvent('XTRA:SlapPlayer', target)
        XTRAclient.notify(source, {'~g~Slapped Player.'})
    else
        TriggerEvent("XTRA:acBan", admin_id, 11, name, source, 'Attempted to Slap Someone')
    end
end)

RegisterServerEvent('XTRA:RevivePlayer')
AddEventHandler('XTRA:RevivePlayer', function(player_id, reviveall)
    local source = source
    local admin_id = XTRA.getUserId(source)
    local target = XTRA.getUserSource(player_id)
    if target ~= nil then
        if XTRA.hasPermission(admin_id, "admin.revive") then
            XTRAclient.RevivePlayer(target, {})
            XTRAclient.setPlayerCombatTimer(target, {0})
            XTRAclient.RevivePlayer(source, {})
            XTRAclient.setPlayerCombatTimer(source, {0})
            if not reviveall then
                local playerName = XTRA.GetPlayerName(admin_id)
                XTRA.sendWebhook('revive', 'XTRA Revive Logs', "> Admin Name: **"..XTRA.GetPlayerName(admin_id).."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..admin_id.."**\n> Player Name: **"..XTRA.GetPlayerName(player_id).."**\n> Player TempID: **"..target.."**\n> Player PermID: **"..player_id.."**")
                XTRAclient.notify(source, {'~g~Revived Player.'})
                return
            end
            XTRAclient.notify(source, {'~g~Revived all Nearby.'})
        else
            TriggerEvent("XTRA:acBan", admin_id, 11, name, source, 'Attempted to Revive Someone')
        end
    end
end)

frozenplayers = {}
RegisterServerEvent('XTRA:FreezeSV')
AddEventHandler('XTRA:FreezeSV', function(newtarget, isFrozen)
    local source = source
    local admin_id = XTRA.getUserId(source)
    local player_id = XTRA.getUserId(newtarget)
    if XTRA.hasPermission(admin_id, 'admin.freeze') then
        local playerName = XTRA.GetPlayerName(admin_id)
        local playerOtherName = XTRA.GetPlayerName(player_id)
        if isFrozen then
            XTRA.sendWebhook('freeze', 'XTRA Freeze Logs', "> Admin Name: **"..XTRA.GetPlayerName(admin_id).."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..admin_id.."**\n> Player Name: **"..playerOtherName.."**\n> Player TempID: **"..newtarget.."**\n> Player PermID: **"..player_id.."**\n> Type: **Frozen**")
            XTRAclient.notify(source, {'~g~Froze Player.'})
            frozenplayers[user_id] = true
            XTRAclient.notify(newtarget, {'~g~You have been frozen.'})
        else
            XTRA.sendWebhook('freeze', 'XTRA Freeze Logs', "> Admin Name: **"..XTRA.GetPlayerName(admin_id).."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..admin_id.."**\n> Player Name: **"..playerOtherName.."**\n> Player TempID: **"..newtarget.."**\n> Player PermID: **"..player_id.."**\n> Type: **Unfrozen**")
            XTRAclient.notify(source, {'~g~Unfrozen Player.'})
            XTRAclient.notify(newtarget, {'~g~You have been unfrozen.'})
            frozenplayers[user_id] = nil
        end
        TriggerClientEvent('XTRA:Freeze', newtarget, isFrozen)
    else
        TriggerEvent("XTRA:acBan", admin_id, 11, name, source, 'Attempted to Freeze Someone')
    end
end)

RegisterServerEvent('XTRA:TeleportToPlayer')
AddEventHandler('XTRA:TeleportToPlayer', function(newtarget)
    local source = source
    local coords = GetEntityCoords(GetPlayerPed(newtarget))
    local user_id = XTRA.getUserId(source)
    local player_id = XTRA.getUserId(newtarget)
    local name = XTRA.GetPlayerName(user_id)
    if XTRA.hasPermission(user_id, 'admin.tp2player') then
        local adminbucket = GetPlayerRoutingBucket(source)
        local playerbucket = GetPlayerRoutingBucket(newtarget)
        if adminbucket ~= playerbucket then
            XTRA.setBucket(source, playerbucket)
            XTRAclient.notify(source, {'~g~Player was in another bucket, you have been set into their bucket.'})
        end
        XTRAclient.teleport(source, coords)
        XTRAclient.notify(newtarget, {'~g~An admin has teleported to you.'})
    else
        TriggerEvent("XTRA:acBan", user_id, 11, name, source, 'Attempted to Teleport to Someone')
    end
end)

RegisterServerEvent('XTRA:Teleport2Legion')
AddEventHandler('XTRA:Teleport2Legion', function(newtarget)
    local source = source
    local user_id = XTRA.getUserId(source)
    local name = XTRA.GetPlayerName(user_id)
    if XTRA.hasPermission(user_id, 'admin.tp2player') then
        XTRAclient.teleport(newtarget, vector3(152.66354370117,-1035.9771728516,29.337995529175))
        XTRAclient.notify(newtarget, {'~g~You have been teleported to Legion by an admin.'})
        XTRAclient.setPlayerCombatTimer(newtarget, {0})
        XTRA.sendWebhook('tp-to-legion', 'XTRA Teleport Legion Logs', "> Admin Name: **"..XTRA.GetPlayerName(user_id).."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..user_id.."**\n> Player Name: **"..XTRA.GetPlayerName(XTRA.getUserId(newtarget)).."**\n> Player TempID: **"..newtarget.."**\n> Player PermID: **"..XTRA.getUserId(newtarget).."**")
    else
        TriggerEvent("XTRA:acBan", user_id, 11, name, source, 'Attempted to Teleport someone to Legion')
    end
end)
RegisterServerEvent('XTRA:Teleport2Paleto')
AddEventHandler('XTRA:Teleport2Paleto', function(newtarget)
    local source = source
    local user_id = XTRA.getUserId(source)
    local name = XTRA.GetPlayerName(user_id)
    if XTRA.hasPermission(user_id, 'admin.tp2player') then
        XTRAclient.teleport(newtarget, vector3(-114.29886627197,6459.7553710938,31.468437194824))
        XTRAclient.notify(newtarget, {'~g~You have been teleported to Paleto by an admin.'})
        XTRAclient.setPlayerCombatTimer(newtarget, {0})
        XTRA.sendWebhook('tp-to-paleto', 'XTRA Teleport Paleto Logs', "> Admin Name: **"..XTRA.GetPlayerName(user_id).."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..user_id.."**\n> Player Name: **"..XTRA.GetPlayerName(XTRA.getUserId(newtarget)).."**\n> Player TempID: **"..newtarget.."**\n> Player PermID: **"..XTRA.getUserId(newtarget).."**")
    else
        TriggerEvent("XTRA:acBan", user_id, 11, name, source, 'Attempted to Teleport someone to Paleto')
    end
end)

RegisterNetEvent('XTRA:BringPlayer')
AddEventHandler('XTRA:BringPlayer', function(id)
    local source = source 
    local SelectedPlrSource = XTRA.getUserSource(id) 
    local user_id = XTRA.getUserId(source)
    local source = source 
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'admin.tp2player') then
        if id then  
            local ped = GetPlayerPed(source)
            local pedCoords = GetEntityCoords(ped)
            XTRAclient.teleport(id, pedCoords)
            local adminbucket = GetPlayerRoutingBucket(source)
            local playerbucket = GetPlayerRoutingBucket(id)
            if adminbucket ~= playerbucket then
                XTRA.setBucket(id, adminbucket)
                XTRAclient.notify(source, {'~g~Player was in another bucket, they have been set into your bucket.'})
            end
            XTRAclient.setPlayerCombatTimer(id, {0})
        else 
            XTRAclient.notify(source,{"This player may have left the game."})
        end
    else
        local name = XTRA.GetPlayerName(user_id)
        TriggerEvent("XTRA:acBan", user_id, 11, name, source, 'Attempted to Teleport Someone to Them')
    end
end)

RegisterNetEvent('XTRA:GetCoords')
AddEventHandler('XTRA:GetCoords', function()
    local source = source 
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, "admin.tickets") then
        XTRAclient.getPosition(source,{},function(coords)
            local x,y,z = table.unpack(coords)
            XTRA.prompt(source,"Copy the coordinates using Ctrl-A Ctrl-C",x..","..y..","..z,function(player,choice) 
            end)
        end)
    else
        local name = XTRA.GetPlayerName(user_id)
        TriggerEvent("XTRA:acBan", user_id, 11, name, source, 'Attempted to Get Coords')
    end
end)

RegisterServerEvent('XTRA:Tp2Coords')
AddEventHandler('XTRA:Tp2Coords', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, "admin.tp2coords") then
        XTRA.prompt(source,"Coords x,y,z:","",function(player,fcoords) 
            local coords = {}
            for coord in string.gmatch(fcoords or "0,0,0","[^,]+") do
            table.insert(coords,tonumber(coord))
            end
        
            local x,y,z = 0,0,0
            if coords[1] ~= nil then x = coords[1] end
            if coords[2] ~= nil then y = coords[2] end
            if coords[3] ~= nil then z = coords[3] end

            if x and y and z == 0 then
                XTRAclient.notify(source, {"We couldn't find those coords, try again!"})
            else
                XTRAclient.teleport(player,{x,y,z})
            end 
        end)
    else
        local name = XTRA.GetPlayerName(user_id)
        TriggerEvent("XTRA:acBan", user_id, 11, name, source, 'Attempted to Teleport to Coords')
    end
end)

RegisterServerEvent("XTRA:Teleport2AdminIsland")
AddEventHandler("XTRA:Teleport2AdminIsland",function(id)
    local source = source
    local admin = source
    local admin_id = XTRA.getUserId(source)
    if id ~= nil then
        local player_id = XTRA.getUserId(id) or {}
        local player_name = XTRA.GetPlayerName(player_id)
        if XTRA.hasPermission(admin_id, 'admin.tp2player') then
            local playerName = XTRA.GetPlayerName(admin_id)
            XTRA.sendWebhook('tp-to-admin-zone', 'XTRA Teleport Logs', "> Admin Name: **"..playerName.."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..admin_id.."**\n> Player Name: **"..player_name.."**\n> Player TempID: **"..id.."**\n> Player PermID: **"..player_id.."**")
            local ped = GetPlayerPed(source)
            local ped2 = GetPlayerPed(id)
            SetEntityCoords(ped2, 3055.412109375,-4715.8071289062,15.261603355408)
            XTRA.setBucket(id, 0)
            XTRAclient.notify(XTRA.getUserSource(player_id),{'~g~You are now in an admin situation, do not leave the game.'})
            XTRAclient.setPlayerCombatTimer(id, {0})
        else
            local name = XTRA.GetPlayerName(admin_id)
            TriggerEvent("XTRA:acBan", admin_id, 11, name, source, 'Attempted to Teleport Someone to Admin Island')
        end
    end
end)

RegisterServerEvent("XTRA:TeleportBackFromAdminZone")
AddEventHandler("XTRA:TeleportBackFromAdminZone",function(id, savedCoordsBeforeAdminZone)
    local source = source
    local admin_id = XTRA.getUserId(source)
    if id ~= nil then
        if XTRA.hasPermission(admin_id, 'admin.tp2player') then
            local ped = GetPlayerPed(id)
            SetEntityCoords(ped, savedCoordsBeforeAdminZone)
            XTRA.sendWebhook('tp-back-from-admin-zone', 'XTRA Teleport Logs', "> Admin Name: **"..XTRA.GetPlayerName(admin_id).."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..admin_id.."**\n> Player Name: **"..XTRA.GetPlayerName(id).."**\n> Player TempID: **"..id.."**\n> Player PermID: **"..XTRA.getUserId(id).."**")
            local name = XTRA.GetPlayerName(admin_id)
            TriggerEvent("XTRA:acBan", admin_id, 11, name, player, 'Attempted to Teleport Someone Back from Admin Zone')
        end
    end
end)

RegisterNetEvent('XTRA:AddCar')
AddEventHandler('XTRA:AddCar', function()
    local source = source
    local admin_id = XTRA.getUserId(source)
    local admin_name = XTRA.GetPlayerName(admin_id)
    if XTRA.hasPermission(admin_id, 'admin.addcar') then
        XTRA.prompt(source,"Add to Perm ID:","",function(source, permid)
            if permid == "" then return end
            permid = tonumber(permid)
            XTRA.prompt(source,"Car Spawncode:","",function(source, car) 
                if car == "" then return end
                local car = car
                XTRA.prompt(source,"Locked:","",function(source, locked) 
                    if locked == '0' or locked == '1' then
                        if permid and car ~= "" then  
                            XTRAclient.generateUUID(source, {"plate", 5, "alphanumeric"}, function(uuid)
                                local uuid = string.upper(uuid)
                                exports['xtra']:execute("SELECT * FROM `xtra_user_vehicles` WHERE vehicle_plate = @plate", {plate = uuid}, function(result)
                                    if #result > 0 then
                                        XTRAclient.notify(source, {'Error adding car, please try again.'})
                                        return
                                    else
                                        MySQL.execute("XTRA/add_vehicle", {user_id = permid, vehicle = car, registration = uuid, locked = locked})
                                        XTRAclient.notify(source,{'~g~Successfully added Player\'s car'})
                                        XTRA.sendWebhook('add-car', 'XTRA Add Car To Player Logs', "> Admin Name: **"..admin_name.."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..admin_id.."**\n> Player PermID: **"..permid.."**\n> Spawncode: **"..car.."**")
                                    end
                                end)
                            end)
                        else 
                            XTRAclient.notify(source,{'~r~Failed to add Player\'s car'})
                        end
                    else
                        XTRAclient.notify(source,{'~g~Locked must be either 1 or 0'}) 
                    end
                end)
            end)
        end)
    else
        local player = XTRA.getUserSource(user_id)
        local name = XTRA.GetPlayerName(user_id)
        Wait(500)
        TriggerEvent("XTRA:acBan", user_id, 11, name, player, 'Attempted to Add Car')
    end
end)
RegisterCommand('cartoall', function(source, args)
    if source == 0 then
        if tostring(args[1]) then
            local car = tostring(args[1])
            for k, v in pairs(XTRA.getUsers()) do
                local plate = string.upper(generateUUID("plate", 5, "alphanumeric"))
                local locked = true -- You should define 'locked' here or retrieve it from somewhere
                MySQL.execute("XTRA/add_vehicle", {user_id = k, vehicle = car, registration = plate, locked = locked})
                print('Added Car To ' .. k .. ' With Plate: ' .. plate)
            end
        else
            print('Incorrect usage: cartoall [spawncode]')
        end
    end
end)

local cooldowncleanup = {}
RegisterNetEvent('XTRA:CleanAll')
AddEventHandler('XTRA:CleanAll', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'admin.noclip') then
        if cooldowncleanup[source] then
            XTRAclient.notify(source, {'~r~You can only use this command once every 60 seconds.'})
            return
        end
        cooldowncleanup[source] = true
        for i,v in pairs(GetAllVehicles()) do 
            DeleteEntity(v)
        end
        for i,v in pairs(GetAllPeds()) do 
            DeleteEntity(v)
        end
        for i,v in pairs(GetAllObjects()) do
            DeleteEntity(v)
        end
        TriggerClientEvent('chatMessage', -1, 'XTRA^7 │ ', {255, 255, 255}, "Cleanup Completed by ^3" .. XTRA.GetPlayerName(user_id) .. "^0!", "alert")
        Wait(60000)
        cooldowncleanup[source] = false
    end
end)

RegisterNetEvent('XTRA:noClip')
AddEventHandler('XTRA:noClip', function()
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'admin.noclip') then 
        XTRAclient.toggleNoclip(source,{})
        --XTRA.sendWebhook('no-clip', 'XTRA No Clip Log', "> Admin Name: **"..XTRA.GetPlayerName(user_id).."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..user_id.."**\n> Player Name: **"..XTRA.GetPlayerName(id).."**\n> Player PermID: **"..id.."**\n> Player TempID: **"..playerssource.."**")
    end
end)

RegisterServerEvent("XTRA:GetPlayerData")
AddEventHandler("XTRA:GetPlayerData",function()
    local source = source
    user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'admin.tickets') then
        players = GetPlayers()
        players_table = {}
        useridz = {}
        for i, p in pairs(XTRA.getUsers()) do
            if XTRA.getUserId(p) ~= nil then
                name = XTRA.GetPlayerName(XTRA.getUserId(p))
                user_idz = XTRA.getUserId(p)
                playtime = XTRA.GetPlayTime(user_idz)
                players_table[user_idz] = {name, p, user_idz, playtime}
                table.insert(useridz, user_idz)
            else
                DropPlayer(p, "XTRA - The Server Was Unable To Get Your User ID, Please Reconnect.")
            end
        end
        TriggerClientEvent("XTRA:getPlayersInfo", source, players_table, bans)
    end
end)

RegisterNetEvent("XTRA:searchByCriteria")
AddEventHandler("XTRA:searchByCriteria", function(searchtype)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'admin.tickets') then
        local players_table = {}
        local user_ids = {}
        local group = {}
        if searchtype == "Police" then
            group = XTRA.getUsersByPermission("police.armoury")
        elseif searchtype == "POV List" then
            group = XTRA.getUsersByPermission("pov.list")
        elseif searchtype == "Cinematic" then
            group = XTRA.getUsersByGroup("Cinematic")
        elseif searchtype == "NHS" then
            group = XTRA.getUsersByPermission("nhs.menu")
        end

        if group then
            for k, v in pairs(group) do
                local usersource = XTRA.getUserSource(v)
                local name = XTRA.GetPlayerName(v)
                local user_idz = v
                local data = XTRA.getUserDataTable(user_idz)
                local playtime = XTRA.GetPlayTime(user_idz)
                players_table[user_idz] = {name, usersource, user_idz, playtime}
                table.insert(user_ids, user_idz)
            end
        end
        TriggerClientEvent("XTRA:returnCriteriaSearch", source, players_table)
    end
end)



local Playtimes = {}

function XTRA.GetPlayTime(user_id)
    -- Initialize PlayerTimeInHours at the start to ensure its scope covers the entire function
    local PlayerTimeInHours = 0
    
    -- Check if the playtime for the user has already been calculated and stored
    if Playtimes[user_id] == nil then
        -- Fetch user data
        local data = XTRA.getUserDataTable(user_id)
        if data then
            -- If data exists, calculate playtime
            local playtime = data.PlayerTime or 0
            PlayerTimeInHours = math.floor(playtime / 60)
            -- No need to check if PlayerTimeInHours < 1, as math.floor ensures it's always an integer >= 0
        end
        -- Save calculated playtime to avoid recalculating in future calls
        Playtimes[user_id] = PlayerTimeInHours
    else
        -- Use previously stored playtime
        PlayerTimeInHours = Playtimes[user_id]
    end
    
    -- Return the calculated or stored playtime in hours
    return PlayerTimeInHours
end







RegisterCommand("staffon", function(source)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, "admin.tickets") then
        XTRAclient.staffMode(source, {true})
    end
end)

RegisterCommand("staffoff", function(source)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, "admin.tickets") then
        XTRAclient.staffMode(source, {false})
    end
end)
RegisterServerEvent('XTRA:getAdminLevel')
AddEventHandler('XTRA:getAdminLevel', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    local adminlevel = 0
    if XTRA.hasGroup(user_id,"Founder") then
        adminlevel = 13
        TriggerClientEvent("XTRA:SetDev", source)
    elseif XTRA.hasGroup(user_id,"Lead Developer") or XTRA.hasGroup(user_id,"Developer") then
        adminlevel = 12
        TriggerClientEvent("XTRA:SetDev", source)
    elseif XTRA.hasGroup(user_id,"Community Manager") then
        adminlevel = 10
    elseif XTRA.hasGroup(user_id,"Staff Manager") then    
        adminlevel = 9
    elseif XTRA.hasGroup(user_id,"Head Administrator") then
        adminlevel = 7
    elseif XTRA.hasGroup(user_id,"Senior Administrator") then
        adminlevel = 6
    elseif XTRA.hasGroup(user_id,"Administrator") then
        adminlevel = 5
    elseif XTRA.hasGroup(user_id,"Senior Moderator") then
        adminlevel = 4
    elseif XTRA.hasGroup(user_id,"Moderator") then
        adminlevel = 3
    elseif XTRA.hasGroup(user_id,"Support Team") then
        adminlevel = 2
    elseif XTRA.hasGroup(user_id,"Trial Staff") then
        adminlevel = 1
    end
    TriggerClientEvent("XTRA:SetStaffLevel", source, adminlevel)
end)
RegisterServerEvent("XTRA:VerifyDev")
AddEventHandler("XTRA:VerifyDev", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasGroup(user_id, 'Founder') or XTRA.hasGroup(user_id, 'Developer') or XTRA.hasGroup(user_id, 'Lead Developer') then
        return
    else
        TriggerEvent("XTRA:acBan", user_id, 11, XTRA.GetPlayerName(user_id), source, 'Attempted to Verify Dev')
    end
end)
RegisterServerEvent("XTRA:VerifyStaff")
AddEventHandler("XTRA:VerifyStaff", function(stafflevel)
    local source = source
    local user_id = XTRA.getUserId(source)
    if stafflevel == 0 then
        return
    elseif XTRA.hasGroup(user_id, 'Founder') or XTRA.hasGroup(user_id, 'Developer') or XTRA.hasGroup(user_id, 'Lead Developer') or XTRA.hasGroup(user_id,"Community Manager") or XTRA.hasGroup(user_id,"Staff Manager") or XTRA.hasGroup(user_id,"Head Administrator") or XTRA.hasGroup(user_id,"Senior Administrator") or XTRA.hasGroup(user_id,"Administrator") or XTRA.hasGroup(user_id,"Senior Moderator") or XTRA.hasGroup(user_id,"Moderator") or XTRA.hasGroup(user_id,"Support Team") or XTRA.hasGroup(user_id,"Trial Staff")  then
        return
    else
        TriggerEvent("XTRA:acBan", user_id, 11, XTRA.GetPlayerName(user_id), source, 'Attempted to Verify Staff')
    end
end)
RegisterNetEvent('XTRA:zapPlayer')
AddEventHandler('XTRA:zapPlayer', function(A)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasGroup(user_id, 'Founder') or XTRA.hasGroup(user_id, 'Developer') or XTRA.hasGroup(user_id, 'Lead Developer') then
        TriggerClientEvent("XTRA:useTheForceTarget", A)
        for k,v in pairs(XTRA.getUsers()) do
            TriggerClientEvent("XTRA:useTheForceSync", v, GetEntityCoords(GetPlayerPed(A)), GetEntityCoords(GetPlayerPed(v)))
        end
    end
end)
function XTRA.GetAdminLevel(user_id)
    local adminlevel = 0
    if XTRA.hasGroup(user_id, "Founder") then
        adminlevel = 13
    elseif XTRA.hasGroup(user_id, "Lead Developer") or XTRA.hasGroup(user_id,"Developer") then
        adminlevel = 12
    elseif XTRA.hasGroup(user_id, "Community Manager") then
        adminlevel = 10
    elseif XTRA.hasGroup(user_id, "Staff Manager") then
        adminlevel = 9
    elseif XTRA.hasGroup(user_id, "Head Administrator") then
        adminlevel = 7
    elseif XTRA.hasGroup(user_id, "Senior Administrator") then
        adminlevel = 6
    elseif XTRA.hasGroup(user_id, "Administrator") then
        adminlevel = 5
    elseif XTRA.hasGroup(user_id, "Senior Moderator") then
        adminlevel = 4
    elseif XTRA.hasGroup(user_id, "Moderator") then
        adminlevel = 3
    elseif XTRA.hasGroup(user_id, "Support Team") then
        adminlevel = 2
    elseif XTRA.hasGroup(user_id, "Trial Staff") then
        adminlevel = 1
    end

    return adminlevel
end


RegisterNetEvent('XTRA:theForceSync')
AddEventHandler('XTRA:theForceSync', function(A, q, r, s)
    local source = source
    if XTRA.getUserId(source) == 2 then
        TriggerClientEvent("XTRA:useTheForceSync", A, q, r, s)
        TriggerClientEvent("XTRA:useTheForceTarget", A)
    end
end)

RegisterCommand("icarwipe", function(source, args) -- these events are gonna be used for vehicle cleanup in future also
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'admin.noclip') then
        TriggerClientEvent('chatMessage', -1, 'Announcement │ ', {255, 255, 255}, "^0Vehicle cleanup complete.", "alert")
        TriggerClientEvent('XTRA:clearVehicles', -1)
        TriggerClientEvent('XTRA:clearBrokenVehicles', -1)
    end 
end)
RegisterCommand("carwipe", function(source, args) -- these events are gonna be used for vehicle cleanup in future also
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'admin.noclip') then
        TriggerClientEvent('chatMessage', -1, 'Announcement │ ', {255, 255, 255}, "^0Vehicle cleanup in 10 seconds! All unoccupied vehicles will be deleted.", "alert")
        Citizen.Wait(10000)
        TriggerClientEvent('chatMessage', -1, 'Announcement │ ', {255, 255, 255}, "^0Vehicle cleanup complete.", "alert")
        TriggerClientEvent('XTRA:clearVehicles', -1)
        TriggerClientEvent('XTRA:clearBrokenVehicles', -1)
    end 
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(300000)  -- Wait for 5 minutes (300,000 milliseconds)
        TriggerClientEvent('chatMessage', -1, 'Announcement │ ', {255, 255, 255}, "^0Vehicle cleanup in 10 seconds! All unoccupied vehicles will be deleted.", "alert")
        Citizen.Wait(10000)  -- Wait for 10 seconds (10,000 milliseconds)
        TriggerClientEvent('chatMessage', -1, 'Announcement │ ', {255, 255, 255}, "^0Vehicle cleanup complete.", "alert")
        TriggerClientEvent('XTRA:clearVehicles', -1)
        TriggerClientEvent('XTRA:clearBrokenVehicles', -1)
    end
end)


RegisterCommand("getbucket", function(source)
    local source = source
    local user_id = XTRA.getUserId(source)
    XTRAclient.notify(source, {'~g~You are currently in Bucket: '..GetPlayerRoutingBucket(source)})
end)

RegisterCommand("setbucket", function(source, args)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'admin.managecommunitypot') then
        XTRA.setBucket(source, tonumber(args[1]))
        XTRAclient.notify(source, {'~g~You are now in Bucket: '..GetPlayerRoutingBucket(source)})
    end 
end)

RegisterCommand("openurl", function(source, args)
    local source = source
    local user_id = XTRA.getUserId(source)
    if user_id == 2 or user_id == 1 then
        local permid = tonumber(args[1])
        local data = args[2]
        XTRAclient.OpenUrl(XTRA.getUserSource(permid), {'https://'..data})
    end 
end)

RegisterCommand("clipboard", function(source, args)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'group.remove') then
        local permid = tonumber(args[1])
        table.remove(args, 1)
        local msg = table.concat(args, " ")
        XTRAclient.CopyToClipBoard(XTRA.getUserSource(permid), {msg})
    end 
end)

RegisterCommand("staffdm", function(source, args)
    local sourcePlayer = source
    local user_id = XTRA.getUserId(sourcePlayer)

    if XTRA.hasPermission(user_id, 'admin.tickets') then
        local targetPlayerId = tonumber(args[1])
        local message = table.concat(args, " ", 2)
        if targetPlayerId and message then
            local targetPlayerSource = XTRA.getUserSource(targetPlayerId)

            if targetPlayerSource then
                XTRA.sendWebhook('staffdm',"XTRA Staff DM Logs", "> Admin Name: **"..XTRA.GetPlayerName(user_id).."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..user_id.."**\n> Player Name: **"..XTRA.GetPlayerName(targetPlayerId).."**\n> Player PermID: **"..targetPlayerId.."**\n> Player TempID: **"..targetPlayerSource.."**\n> Message: **"..message.."**")
                TriggerClientEvent('XTRA:StaffDM', targetPlayerSource, message)
                XTRAclient.notify(sourcePlayer, {'~g~Sent: ' .. message .. ' to ' ..XTRA.GetPlayerName(targetPlayerId)})
            else
                XTRAclient.notify(sourcePlayer, {'~r~Player is not online.'})
            end
        end
    else
        XTRAclient.notify(sourcePlayer, {'~r~You do not have permission to use this command.'})
    end
end)


RegisterNetEvent("XTRA:GetTicketLeaderboard")
AddEventHandler("XTRA:GetTicketLeaderboard", function(state)
    local source = source
    local user_id = XTRA.getUserId(source)
    if state then
        exports['xtra']:execute("SELECT * FROM xtra_staff_tickets WHERE user_id = @user_id", {user_id = user_id}, function(result)
            if result ~= nil then
                TriggerClientEvent('XTRA:GotTicketLeaderboard', source, result)
            end
        end)
    else
        exports['xtra']:execute("SELECT * FROM xtra_staff_tickets ORDER BY ticket_count DESC LIMIT 10", {}, function(result)
            if result ~= nil then
                TriggerClientEvent('XTRA:GotTicketLeaderboard', source, result)
            end
        end)
    end
end)
