function getPlayerFaction(user_id)
    if XTRA.hasPermission(user_id, 'police.armoury') then
        return 'pd'
    elseif XTRA.hasPermission(user_id, 'nhs.menu') then
        return 'nhs'
    elseif XTRA.hasPermission(user_id, 'hmp.menu') then
        return 'hmp'
    elseif XTRA.hasPermission(user_id, 'lfb.onduty.permission') then
        return 'lfb'
    end
    return nil
end

RegisterServerEvent('XTRA:factionAfkAlert')
AddEventHandler('XTRA:factionAfkAlert', function(text)
    local source = source
    local user_id = XTRA.getUserId(source)
    if getPlayerFaction(user_id) ~= nil then
        XTRA.sendWebhook(getPlayerFaction(user_id)..'-afk', 'XTRA AFK Logs', "> Player Name: **"..XTRA.GetPlayerName(user_id).."**\n> Player TempID: **"..source.."**\n> Player PermID: **"..user_id.."**\n> Info: **"..text.."**")
    end
end)

RegisterServerEvent('XTRA:setNoLongerAFK')
AddEventHandler('XTRA:setNoLongerAFK', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if getPlayerFaction(user_id) ~= nil then
        XTRA.sendWebhook(getPlayerFaction(user_id)..'-afk', 'XTRA AFK Logs', "> Player Name: **"..XTRA.GetPlayerName(user_id).."**\n> Player TempID: **"..source.."**\n> Player PermID: **"..user_id.."**\n> Info: **"..text.."**")
    end
end)

RegisterServerEvent('kick:AFK')
AddEventHandler('kick:AFK', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if not XTRA.hasPermission(user_id, 'group.add') then
        DropPlayer(source, 'You have been kicked for being AFK for too long.')
    end
end)