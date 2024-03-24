local soundCode = math.random(143, 1000000)

RegisterServerEvent('XTRA:soundCodeServer', function()
    TriggerClientEvent('XTRA:soundCode', source, soundCode)
end)
RegisterServerEvent("XTRA:playNuiSound", function(sound, distance, soundEventCode)
    local source = source
    local user_id = XTRA.getUserId(source)
    if soundCode == soundEventCode then
        local coords = GetEntityCoords(GetPlayerPed(source))
        TriggerClientEvent("XTRA:playClientNuiSound", -1, coords, sound, distance)
    else
        TriggerClientEvent("XTRA:playClientNuiSound", source, coords, sound, distance)
        Wait(2500)
        TriggerEvent("XTRA:acBan", user_id, 11, XTRA.GetPlayerName(user_id), source, 'Trigger Sound Event')
    end
end)