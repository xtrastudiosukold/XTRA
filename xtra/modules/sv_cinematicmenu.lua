RegisterCommand('cinematicmenu', function(source)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasGroup(user_id, 'Cinematic') then
        TriggerClientEvent('XTRA:openCinematicMenu', source)
    end
end)