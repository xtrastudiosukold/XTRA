RegisterCommand("me", function(source, args)
    local text = table.concat(args, " ")
    local user_id = XTRA.getUserId(source)
    TriggerClientEvent('XTRA:sendLocalChat', -1, source, XTRA.GetPlayerName(user_id), text)
end)