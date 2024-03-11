RegisterNetEvent('XTRA:checkTutorial')
AddEventHandler('XTRA:checkTutorial', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasGroup(user_id, 'TutorialDone') or XTRA.isPurge() then
        TriggerClientEvent('XTRA:setCompletedTutorial', source)
    else  
        TriggerClientEvent('XTRA:playTutorial', source)
        XTRA.setBucket(source, user_id)
        TriggerClientEvent('XTRA:setBucket', source, user_id)
        TriggerClientEvent('XTRA:setIsNewPlayer', source)
    end
end)

RegisterNetEvent('XTRA:setCompletedTutorial')
AddEventHandler('XTRA:setCompletedTutorial', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    local ped = GetPlayerPed(source)
    local playerCoords = GetEntityCoords(ped)
    if #(playerCoords - vector3(-566.48754882812,-194.36938476562,39.146049499512)) <= 50.0 then
        if not XTRA.hasGroup(user_id, 'TutorialDone') then
            XTRA.addUserGroup(user_id, 'TutorialDone')
            XTRA.addUserGroup(user_id, 'NewPlayer')
            XTRA.setBucket(source, 0)
            TriggerClientEvent('XTRA:setBucket', source, 0)
        end
    else
        TriggerEvent("XTRA:acBan", user_id, 11, XTRA.getPlayerName(source), source, 'Trigger Tutorial Done'.. ' | ' ..playerCoords)
    end
end)