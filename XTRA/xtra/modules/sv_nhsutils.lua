local bodyBags = {}

RegisterServerEvent("XTRA:requestBodyBag")
AddEventHandler('XTRA:requestBodyBag', function(playerToBodyBag)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'nhs.menu') then
        TriggerClientEvent('XTRA:placeBodyBag', playerToBodyBag)
    end
end)

RegisterServerEvent("XTRA:removeBodybag")
AddEventHandler('XTRA:removeBodybag', function(bodybagObject)
    local source = source
    local user_id = XTRA.getUserId(source)
    TriggerClientEvent('XTRA:removeIfOwned', -1, NetworkGetEntityFromNetworkId(bodybagObject))
end)

RegisterServerEvent("XTRA:playNhsSound")
AddEventHandler('XTRA:playNhsSound', function(sound)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'nhs.menu') then
        TriggerClientEvent('XTRA:clientPlayNhsSound', -1, GetEntityCoords(GetPlayerPed(source)), sound)
    else
        TriggerEvent("XTRA:acBan", user_id, 11, XTRA.GetPlayerName(user_id), source, 'Trigger Play NHS Sound')
    end
end)


-- a = coma
-- c = userid
-- b = permid
-- 4th ready to revive
-- name

local lifePaksConnected = {}

RegisterServerEvent("XTRA:attachLifepakServer")
AddEventHandler('XTRA:attachLifepakServer', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'nhs.menu') then
        XTRAclient.getNearestPlayer(source, {3}, function(nplayer)
            local nuser_id = XTRA.getUserId(nplayer)
            if nuser_id ~= nil then
                XTRAclient.isInComa(nplayer, {}, function(in_coma)
                    TriggerClientEvent('XTRA:attachLifepak', source, in_coma, nuser_id, nplayer, XTRA.GetPlayerName(nuser_id))
                    lifePaksConnected[user_id] = {permid = nuser_id} 
                end)
            else
                XTRAclient.notify(source, {"There is no player nearby"})
            end
        end)
    else
        TriggerEvent("XTRA:acBan", user_id, 11, XTRA.GetPlayerName(user_id), source, 'Trigger Attack Lifepak')
    end
end)


RegisterServerEvent("XTRA:finishRevive")
AddEventHandler('XTRA:finishRevive', function(permid)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'nhs.menu') then 
        if next(lifePaksConnected) then
            for k,v in pairs(lifePaksConnected) do
                if k == user_id and v.permid == permid then
                    TriggerClientEvent('XTRA:returnRevive', source)
                    XTRA.giveBankMoney(user_id, 5000)
                    XTRAclient.notify(source, {"~g~You have been paid £5,000 for reviving this person."})
                    lifePaksConnected[k] = nil
                    Wait(15000)
                    XTRAclient.RevivePlayer(XTRA.getUserSource(permid), {})
                end
            end
        else
            XTRAclient.notify(source, {"There is currently no one to revive."})
        end
    else
        TriggerEvent("XTRA:acBan", user_id, 11, XTRA.GetPlayerName(user_id), source, 'Trigger Finish Revive')
    end
end)


RegisterServerEvent("XTRA:nhsRevive") -- nhs radial revive
AddEventHandler('XTRA:nhsRevive', function(playersrc)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'nhs.menu') then
        XTRAclient.isInComa(playersrc, {}, function(in_coma)
            if in_coma then
                TriggerClientEvent('XTRA:beginRevive', source, in_coma, XTRA.getUserId(playersrc), playersrc, XTRA.GetPlayerName(XTRA.getUserId(playersrc)))
                lifePaksConnected[user_id] = {permid = XTRA.getUserId(playersrc)} 
            end
        end)
    else
        TriggerEvent("XTRA:acBan", user_id, 11, XTRA.GetPlayerName(user_id), source, 'Trigger NHS Revive')
    end
end)

local playersInCPR = {}

RegisterServerEvent("XTRA:attemptCPR")
AddEventHandler('XTRA:attemptCPR', function(playersrc)
    local source = source
    local user_id = XTRA.getUserId(source)

    XTRAclient.getNearestPlayers(source, {15}, function(nplayers)
        local targetPlayer = nplayers[playersrc]

        if targetPlayer then
            local targetPed = GetPlayerPed(playersrc)
            local targetHealth = GetEntityHealth(targetPed)

            if targetHealth > 102 then
                XTRAclient.notify(source, {"This person is already healthy."})
            else
                playersInCPR[user_id] = true
                TriggerClientEvent('XTRA:attemptCPR', source)

                Citizen.Wait(15000) -- Wait for 15 seconds

                if playersInCPR[user_id] then
                    local cprChance = math.random(1, 10)

                    if cprChance == 1 then
                        XTRAclient.RevivePlayer(playersrc, {})
                        XTRAclient.notify(playersrc, {"~b~Your life has been saved."})
                        XTRAclient.notify(source, {"~b~You have saved this person's life."})
                    else
                        XTRAclient.notify(source, {'~r~Failed to perform CPR.'})
                    end

                    playersInCPR[user_id] = nil
                    XTRAclient.notify(source, {"~r~CPR has been canceled."})
                    TriggerClientEvent('XTRA:cancelCPRAttempt', source)
                end
            end
        else
            XTRAclient.notify(source, {"Player not found."})
        end
    end)
end)


RegisterServerEvent("XTRA:cancelCPRAttempt")
AddEventHandler('XTRA:cancelCPRAttempt', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if playersInCPR[user_id] then
        playersInCPR[user_id] = nil
        XTRAclient.notify(source, {"~r~CPR has been canceled."})
        TriggerClientEvent('XTRA:cancelCPRAttempt', source)
    end
end)

RegisterServerEvent("XTRA:syncWheelchairPosition")
AddEventHandler('XTRA:syncWheelchairPosition', function(netid, coords, heading)
    local source = source
    local user_id = XTRA.getUserId(source)
    entity = NetworkGetEntityFromNetworkId(netid)
    SetEntityCoords(entity, coords.x, coords.y, coords.z)
    SetEntityHeading(entity, heading)
end)

RegisterServerEvent("XTRA:wheelchairAttachPlayer")
AddEventHandler('XTRA:wheelchairAttachPlayer', function(entity)
    local source = source
    local user_id = XTRA.getUserId(source)
    TriggerClientEvent('XTRA:wheelchairAttachPlayer', -1, entity, source)
end)