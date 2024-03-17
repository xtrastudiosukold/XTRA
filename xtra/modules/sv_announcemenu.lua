local announceTables = {
    {permission = 'admin.managecommunitypot', info = {name = "Server Announcement", desc = "Announce something to the server", price = 0}, image = 'https://i.imgur.com/FZMys0F.png'},
    {permission = 'admin.managecommunitypot', info = {name = "Event Announcement", desc = "Announce something to the server", price = 0}, image = 'https://i.imgur.com/28BBh5w.png'},
    {permission = 'police.announce', info = {name = "PD Announcement", desc = "Announce something to the server", price = 10000}, image = 'https://i.imgur.com/I7c5LsN.png'},
    {permission = 'nhs.announce', info = {name = "NHS Announcement", desc = "Announce something to the server", price = 10000}, image = 'https://i.imgur.com/SypLbMo.png'},
    {permission = 'lfb.announce', info = {name = "LFB Announcement", desc = "Announce something to the server", price = 10000}, image = 'https://i.imgur.com/AFqPgYk.png'},
    {permission = 'hmp.announce', info = {name = "HMP Announcement", desc = "Announce something to the server", price = 10000}, image = 'https://i.imgur.com/rPF5FgQ.png'},
}

RegisterServerEvent("XTRA:getAnnounceMenu")
AddEventHandler("XTRA:getAnnounceMenu", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    local hasPermsFor = {}
    for k,v in pairs(announceTables) do
        if XTRA.hasPermission(user_id, v.permission) or XTRA.hasGroup(user_id, 'Founder') or XTRA.hasGroup(user_id, 'Lead Developer') or XTRA.hasGroup(user_id,"Developer") then
            table.insert(hasPermsFor, v.info)
        end
    end
    if #hasPermsFor > 0 then
        TriggerClientEvent("XTRA:buildAnnounceMenu", source, hasPermsFor)
    end
end)

RegisterServerEvent("XTRA:serviceAnnounce")
AddEventHandler("XTRA:serviceAnnounce", function(announceType)
    local source = source
    local user_id = XTRA.getUserId(source)
    for k,v in pairs(announceTables) do
        if v.info.name == announceType then
            if XTRA.hasPermission(user_id, v.permission) or XTRA.getStaffLevel(user_id) >= 5 then
                if XTRA.tryFullPayment(user_id, v.info.price) then
                    XTRA.prompt(source,"Input text to announce","",function(source,data) 
                        TriggerClientEvent('XTRA:serviceAnnounceCl', -1, v.image, data)
                        if v.info.price > 0 then
                            XTRAclient.notify(source, {"~g~Purchased a "..v.info.name.." for £"..v.info.price.." with content ~b~"..data})
                            XTRA.sendWebhook('announce', "XTRA Announcement Logs", "```"..data.."```".."\n> Player Name: **"..XTRA.GetPlayerName(user_id).."**\n> Player PermID: **"..user_id.."**\n> Player TempID: **"..source.."**")
                        else
                            XTRAclient.notify(source, {"~g~Sending a "..v.info.name.." with content ~b~"..data})
                            XTRA.sendWebhook('announce', "XTRA Announcement Logs", "```"..data.."```".."\n> Player Name: **"..XTRA.GetPlayerName(user_id).."**\n> Player PermID: **"..user_id.."**\n> Player TempID: **"..source.."**")
                        end
                    end)
                else
                    XTRAclient.notify(source, {"~r~You do not have enough money to do this."})
                end
            else
                TriggerEvent("XTRA:acBan", user_id, 11, XTRA.GetPlayerName(user_id), source, 'Attempted to Trigger an announcement')
            end
        end
    end
end)



RegisterCommand("consoleannounce", function(source, args)
    local source = source
    if source == 0 then
        local data = table.concat(args, " ")
        print("[XTRA Announcement] "..data)
        TriggerClientEvent('XTRA:serviceAnnounceCl', -1, 'https://i.imgur.com/FZMys0F.png', data)
        XTRA.sendWebhook('announce', "XTRA Announcement Logs", "```"..data.."```")
    else
        XTRAclient.notify(source, {"~r~You do not have permission to do this."})
    end
end)