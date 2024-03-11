local tickets = {}
local callID = 0
local cooldown = {}
local permid = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000)
        for k,v in pairs(cooldown) do
            if cooldown[k].time > 0 then
                cooldown[k].time = cooldown[k].time - 1
            end
        end
    end
end)

RegisterCommand("calladmin", function(source)
    local user_id = XTRA.getUserId(source)
    local user_source = XTRA.getUserSource(user_id)
    for k,v in pairs(cooldown) do
        if k == user_id and v.time > 0 then
            XTRAclient.notify(user_source,{"~r~You have already called an admin, please wait 5 minutes before calling again."})
            return
        end
    end
    XTRA.prompt(user_source, "Please enter call reason: ", "", function(player, reason)
        if reason ~= "" then
            if #reason >= 5 then
                callID = callID + 1
                tickets[callID] = {
                    name = XTRA.GetPlayerName(user_id),
                    permID = user_id,
                    tempID = user_source,
                    reason = reason,
                    type = 'admin',
                }
                cooldown[user_id] = {time = 5}
                for k, v in pairs(XTRA.getUsers({})) do
                    TriggerClientEvent("XTRA:addEmergencyCall", v, callID, XTRA.GetPlayerName(user_id), user_id, GetEntityCoords(GetPlayerPed(user_source)), reason, 'admin')
                end
                XTRAclient.notify(user_source,{"~b~Your request has been sent."})
            else
                XTRAclient.notify(user_source,{"~r~Please enter a minimum of 5 characters."})
            end
        else
            XTRAclient.notify(user_source,{"~r~Please enter a valid reason."})
        end
    end)
end)
RegisterCommand("calladmin", function(source)
    local user_id = XTRA.getUserId(source)
    local user_source = XTRA.getUserSource(user_id)
    for k,v in pairs(cooldown) do
        if k == user_id and v.time > 0 then
            XTRAclient.notify(user_source,{"~r~You have already called an admin, please wait 5 minutes before calling again."})
            return
        end
    end
    XTRA.prompt(user_source, "Please enter call reason: ", "", function(player, reason)
        if reason ~= "" then
            if #reason >= 5 then
                callID = callID + 1
                tickets[callID] = {
                    name = XTRA.GetPlayerName(user_id),
                    permID = user_id,
                    tempID = user_source,
                    reason = reason,
                    type = 'admin',
                }
                cooldown[user_id] = {time = 5}
                for k, v in pairs(XTRA.getUsers({})) do
                    TriggerClientEvent("XTRA:addEmergencyCall", v, callID, XTRA.GetPlayerName(user_id), user_id, GetEntityCoords(GetPlayerPed(user_source)), reason, 'admin')
                end
                XTRAclient.notify(user_source,{"~b~Your request has been sent."})
            else
                XTRAclient.notify(user_source,{"~r~Please enter a minimum of 5 characters."})
            end
        else
            XTRAclient.notify(user_source,{"~r~Please enter a valid reason."})
        end
    end)
end)

RegisterCommand("help", function(source)
    local user_id = XTRA.getUserId(source)
    local user_source = XTRA.getUserSource(user_id)
    for k,v in pairs(cooldown) do
        if k == user_id and v.time > 0 then
            XTRAclient.notify(user_source,{"~r~You have already called an admin, please wait 5 minutes before calling again."})
            return
        end
    end
    XTRA.prompt(user_source, "Please enter call reason: ", "", function(player, reason)
        if reason ~= "" then
            if #reason >= 5 then
                callID = callID + 1
                tickets[callID] = {
                    name = XTRA.GetPlayerName(user_id),
                    permID = user_id,
                    tempID = user_source,
                    reason = reason,
                    type = 'admin',
                }
                cooldown[user_id] = {time = 5}
                for k, v in pairs(XTRA.getUsers({})) do
                    TriggerClientEvent("XTRA:addEmergencyCall", v, callID, XTRA.GetPlayerName(user_id), user_id, GetEntityCoords(GetPlayerPed(user_source)), reason, 'admin')
                end
                XTRAclient.notify(user_source,{"~b~Your request has been sent."})
            else
                XTRAclient.notify(user_source,{"~r~Please enter a minimum of 5 characters."})
            end
        else
            XTRAclient.notify(user_source,{"~r~Please enter a valid reason."})
        end
    end)
end)

RegisterCommand("report", function(source)
    local user_id = XTRA.getUserId(source)
    local user_source = XTRA.getUserSource(user_id)
    for k,v in pairs(cooldown) do
        if k == user_id and v.time > 0 then
            XTRAclient.notify(user_source,{"~r~You have already called an admin, please wait 5 minutes before calling again."})
            return
        end
    end
    XTRA.prompt(user_source, "Please enter call reason: ", "", function(player, reason)
        if reason ~= "" then
            if #reason >= 5 then
                callID = callID + 1
                tickets[callID] = {
                    name = XTRA.GetPlayerName(user_id),
                    permID = user_id,
                    tempID = user_source,
                    reason = reason,
                    type = 'admin',
                }
                cooldown[user_id] = {time = 5}
                for k, v in pairs(XTRA.getUsers({})) do
                    TriggerClientEvent("XTRA:addEmergencyCall", v, callID, XTRA.GetPlayerName(user_id), user_id, GetEntityCoords(GetPlayerPed(user_source)), reason, 'admin')
                end
                XTRAclient.notify(user_source,{"~b~Your request has been sent."})
            else
                XTRAclient.notify(user_source,{"~r~Please enter a minimum of 5 characters."})
            end
        else
            XTRAclient.notify(user_source,{"~r~Please enter a valid reason."})
        end
    end)
end)

RegisterCommand("999", function(source)
    local user_id = XTRA.getUserId(source)
    local user_source = XTRA.getUserSource(user_id)
    XTRA.prompt(user_source, "Please enter call reason: ", "", function(player, reason)
        if reason ~= "" then
            callID = callID + 1
            tickets[callID] = {
                name = XTRA.GetPlayerName(user_id),
                permID = user_id,
                tempID = user_source,
                reason = reason,
                type = 'met'
            }
            for k, v in pairs(XTRA.getUsers({})) do
                TriggerClientEvent("XTRA:addEmergencyCall", v, callID, XTRA.GetPlayerName(user_id), user_id, GetEntityCoords(GetPlayerPed(user_source)), reason, 'met')
            end
            XTRAclient.notify(user_source,{"~b~Sent Police Call."})
        else
            XTRAclient.notify(user_source,{"~r~Please enter a valid reason."})
        end
    end)
end)

RegisterCommand("111", function(source)
    local user_id = XTRA.getUserId(source)
    local user_source = XTRA.getUserSource(user_id)
    XTRA.prompt(user_source, "Please enter call reason: ", "", function(player, reason)
        if reason ~= "" then
            callID = callID + 1
            tickets[callID] = {
                name = XTRA.GetPlayerName(user_id),
                permID = user_id,
                tempID = user_source,
                reason = reason,
                type = 'nhs'
            }
            for k, v in pairs(XTRA.getUsers({})) do
                TriggerClientEvent("XTRA:addEmergencyCall", v, callID, XTRA.GetPlayerName(user_id), user_id, GetEntityCoords(GetPlayerPed(user_source)), reason, 'nhs')
            end
            XTRAclient.notify(user_source,{"~g~Sent NHS Call."})
        else
            XTRAclient.notify(user_source,{"~r~Please enter a valid reason."})
        end
    end)
end)

local savedPositions = {}
RegisterCommand("return", function(source)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'admin.tickets') then
        TriggerEvent('XTRA:Return', source)
    end
end)
local adminFeedback = {} 
AddEventHandler("XTRA:Return", function(source)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'admin.tickets') then
        local v = adminFeedback[user_id]
        if savedPositions[user_id] then
            XTRA.setBucket(source, savedPositions[user_id].bucket)
            XTRAclient.teleport(source, {table.unpack(savedPositions[user_id].coords)})
            XTRAclient.notify(source, {'~g~Returned to position.'})
            savedPositions[user_id] = nil
        else
            XTRAclient.notify(source, {"~r~Unable to find last location."})
        end
        TriggerClientEvent('XTRA:sendTicketInfo', source)
        XTRAclient.staffMode(source, {false})
        SetTimeout(1000, function() 
            XTRAclient.setPlayerCombatTimer(source, {0}) 
        end)
    end
end)

RegisterNetEvent("XTRA:TakeTicket")
AddEventHandler("XTRA:TakeTicket", function(ticketID)
    local user_id = XTRA.getUserId(source)
    local admin_source = XTRA.getUserSource(user_id)
    if tickets[ticketID] ~= nil then
        for k, v in pairs(tickets) do
            if ticketID == k then
                if tickets[ticketID].type == 'admin' and XTRA.hasPermission(user_id, "admin.tickets") then
                    if XTRA.getUserSource(v.permID) ~= nil then
                        if user_id ~= v.permID then
                            local tempID = v.tempID
                            local adminbucket = GetPlayerRoutingBucket(admin_source)
                            local playerbucket = GetPlayerRoutingBucket(v.tempID)
                            savedPositions[user_id] = {bucket = adminbucket, coords = GetEntityCoords(GetPlayerPed(admin_source))}
                            if adminbucket ~= playerbucket then
                                XTRA.setBucket(admin_source, playerbucket)
                                XTRAclient.notify(admin_source, {'~g~Player was in another bucket, you have been set into their bucket.'})
                            end
                            XTRAclient.getPosition(v.tempID, {}, function(coords)
                                XTRAclient.staffMode(admin_source, {true})
                                adminFeedback[user_id] = {playersource = tempID, ticketID = ticketID}
                                TriggerClientEvent('XTRA:sendTicketInfo', admin_source, v.permID, v.name, v.reason)
                                local ticketPay = 0
                                if os.date('%A') == 'Saturday' or os.date('%A') == 'Sunday' then
                                    ticketPay = 30000
                                else
                                    ticketPay = 20000
                                end
                                exports['xtra']:execute("SELECT * FROM `xtra_staff_tickets` WHERE user_id = @user_id", {user_id = user_id}, function(result)
                                    if result ~= nil then 
                                        for k,v in pairs(result) do
                                            if v.user_id == user_id then
                                                exports['xtra']:execute("UPDATE xtra_staff_tickets SET ticket_count = @ticket_count, username = @username WHERE user_id = @user_id", {user_id = user_id, ticket_count = v.ticket_count + 1, username = XTRA.GetPlayerName(user_id)}, function() end)
                                                return
                                            end
                                        end
                                        exports['xtra']:execute("INSERT INTO xtra_staff_tickets (`user_id`, `ticket_count`, `username`) VALUES (@user_id, @ticket_count, @username);", {user_id = user_id, ticket_count = 1, username = XTRA.GetPlayerName(user_id)}, function() end) 
                                    end
                                end)
                                XTRA.giveBankMoney(user_id, ticketPay)
                                XTRAclient.notify(admin_source,{"~g~£"..getMoneyStringFormatted(ticketPay).." earned for taking a ticket."})
                                XTRAclient.notify(v.tempID,{"~g~An admin has taken your ticket."})
                                TriggerClientEvent('XTRA:smallAnnouncement', v.tempID, 'ticket accepted', "Your admin ticket has been accepted by "..XTRA.GetPlayerName(user_id), 33, 10000)
                                XTRA.sendWebhook('ticket-logs',"XTRA Ticket Logs", "> Admin Name: **"..XTRA.GetPlayerName(user_id).."**\n> Admin TempID: **"..admin_source.."**\n> Admin PermID: **"..user_id.."**\n> Player Name: **"..v.name.."**\n> Player PermID: **"..v.permID.."**\n> Player TempID: **"..v.tempID.."**\n> Reason: **"..v.reason.."**")
                                XTRAclient.teleport(admin_source, {table.unpack(coords)})
                                TriggerClientEvent("XTRA:removeEmergencyCall", -1, ticketID)
                                tickets[ticketID] = nil
                            end)
                        else
                            XTRAclient.notify(admin_source,{"~r~You can't take your own ticket!"})
                        end
                    else
                        XTRAclient.notify(admin_source,{"You cannot take a ticket from an offline player."})
                        TriggerClientEvent("XTRA:removeEmergencyCall", -1, ticketID)
                    end
                elseif tickets[ticketID].type == 'met' and XTRA.hasPermission(user_id, "police.armoury") then
                    if XTRA.getUserSource(v.permID) ~= nil then
                        if user_id ~= v.permID then
                            if v.tempID ~= nil then
                                XTRAclient.notify(v.tempID,{"~b~Your MET Police call has been accepted!"})
                            end
                            tickets[ticketID] = nil
                            TriggerClientEvent("XTRA:removeEmergencyCall", -1, ticketID)
                        else
                            XTRAclient.notify(admin_source,{"~r~You can't take your own call!"})
                        end
                    else
                        TriggerClientEvent("XTRA:removeEmergencyCall", -1, ticketID)
                    end
                elseif tickets[ticketID].type == 'nhs' and XTRA.hasPermission(user_id, "nhs.menu") then
                    if XTRA.getUserSource(v.permID) ~= nil then
                        if user_id ~= v.permID then
                            XTRAclient.notify(v.tempID,{"~g~Your NHS call has been accepted!"})
                            tickets[ticketID] = nil
                            TriggerClientEvent("XTRA:removeEmergencyCall", -1, ticketID)
                        else
                            XTRAclient.notify(admin_source,{"~r~You can't take your own call!"})
                        end
                    else
                        TriggerClientEvent("XTRA:removeEmergencyCall", -1, ticketID)
                    end
                end
            end
        end
    end         
end)

RegisterNetEvent("XTRA:PDRobberyCall")
AddEventHandler("XTRA:PDRobberyCall", function(source, store, position)
    local source = source
    local user_id = XTRA.getUserId(source)
    callID = callID + 1
    tickets[callID] = {
        name = 'Store Robbery',
        permID = 999,
        tempID = nil,
        reason = 'Robbery in progress at '..store,
        type = 'met'
    }
    for k, v in pairs(XTRA.getUsers({})) do
        TriggerClientEvent("XTRA:addEmergencyCall", v, callID, 'Store Robbery', 999, position, 'Robbery in progress at '..store, 'met')
    end
end)

RegisterNetEvent("XTRA:NHSComaCall")
AddEventHandler("XTRA:NHSComaCall", function()
    local user_id = XTRA.getUserId(source)
    local user_source = XTRA.getUserSource(user_id)
    if XTRA.getUsersByPermission("nhs.menu") == nil then
        XTRAclient.notify(user_source,{"~r~There are no NHS on duty."})
        return
    end
    XTRAclient.notify(user_source,{"~g~NHS have been notified."})
    callID = callID + 1
    tickets[callID] = {
        name = XTRA.GetPlayerName(user_id),
        permID = user_id,
        tempID = user_source,
        reason = "Immediate Attention",
        type = 'nhs'
    }
    for k, v in pairs(XTRA.getUsers({})) do
        TriggerClientEvent("XTRA:addEmergencyCall", v, callID, XTRA.GetPlayerName(user_id), user_id, GetEntityCoords(GetPlayerPed(user_source)),"Immediate Attention", 'nhs')
    end
end)

AddEventHandler('playerDropped', function(reason)
    local source = source
    local user_id = XTRA.getUserId(source)
    for k,v in pairs(cooldown) do
        if k == user_id and v.time > 0 then
            exports['xtra']:ticketdm(source, { discordid, user_id }, function() end)
        end
    end
end)