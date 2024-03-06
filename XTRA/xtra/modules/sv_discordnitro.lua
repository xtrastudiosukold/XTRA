RegisterCommand('craftbmx', function(source)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'admin.tickets') then
        TriggerClientEvent("XTRA:spawnNitroBMX", source)
    else
        if XTRA.checkForRole(user_id, '1173412751155138662') then
            TriggerClientEvent("XTRA:spawnNitroBMX", source)
        end
    end
end)

RegisterCommand('craftmoped', function(source)
    local source = source
    local user_id = XTRA.getUserId(source)
    XTRAclient.isPlatClub(source, {}, function(isPlatClub)
        if isPlatClub then
            TriggerClientEvent("XTRA:spawnMoped", source)
        end
    end)
end)


function CheckDiscordActivity()
    for i = 0, GetNumPlayerIndices() - 1 do
        local source = GetPlayerFromIndex(i)
        local user_id = XTRA.getUserId(source)

        if user_id then
            local kickReason = '[XTRA] Connection Refused \nReason: Not Present In The Discord \nPlease Contact management if this was a mistake \nUser ID:' .. user_id

            if not tXTRA.checkForRole(user_id, '1173412751155138662') then
                print("[XTRA] Player " .. XTRA.GetPlayerName(user_id) .. " was not detected in the discord!")
                XTRA.sendWebhook('kick-player', 'XTRA Kick Logs', "> Player Name: **" .. XTRA.GetPlayerName(user_id).. "**\n> Player PermID: **" .. user_id .. "**\n> Player TempID: **" .. source .. "**\n> Reason: **Not Detected in the discord**")
                DropPlayer(source, kickReason)
            end
        else
            print("[XTRA] No one online to check discord activity.")
        end
    end
end
exports('CheckDiscordActivity', CheckDiscordActivity)

