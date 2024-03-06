RegisterCommand('k9', function(source)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasGroup(user_id, 'K9 Trained') then
        TriggerClientEvent('XTRA:policeDogMenu', source)
    end
end)

RegisterCommand('k9attack', function(source)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasGroup(user_id, 'K9 Trained') then
        TriggerClientEvent('XTRA:policeDogAttack', source)
    end
end)

RegisterNetEvent("XTRA:serverDogAttack")
AddEventHandler("XTRA:serverDogAttack", function(player)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasGroup(user_id, 'K9 Trained') then
        TriggerClientEvent('XTRA:sendClientRagdoll', player)
    end
end)

RegisterNetEvent("XTRA:policeDogSniffPlayer")
AddEventHandler("XTRA:policeDogSniffPlayer", function(playerSrc)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasGroup(user_id, 'K9 Trained') then
       -- check for drugs
        local player_id = XTRA.getUserId(playerSrc)
        local cdata = XTRA.getUserDataTable(player_id)
        for a,b in pairs(cdata.inventory) do
            for c,d in pairs(seizeDrugs) do
                if a == c then
                    TriggerClientEvent('XTRA:policeDogIndicate', source, playerSrc)
                end
            end
        end
    end
end)

RegisterNetEvent("XTRA:performDogLog")
AddEventHandler("XTRA:performDogLog", function(text)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasGroup(user_id, 'K9 Trained') then
        XTRA.sendWebhook('police-k9', 'XTRA Police Dog Logs',"> Officer Name: **"..XTRA.GetPlayerName(user_id).."**\n> Officer TempID: **"..source.."**\n> Officer PermID: **"..user_id.."**\n> Info: **"..text.."**")
    end
end)