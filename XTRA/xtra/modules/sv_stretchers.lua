RegisterServerEvent("XTRA:stretcherAttachPlayer")
AddEventHandler('XTRA:stretcherAttachPlayer', function(playersrc)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'nhs.menu') then
        TriggerClientEvent('XTRA:stretcherAttachPlayer', source, playersrc)
    end
end)

RegisterServerEvent("XTRA:toggleAmbulanceDoors")
AddEventHandler('XTRA:toggleAmbulanceDoors', function(stretcherNetid)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'nhs.menu') then
        TriggerClientEvent('XTRA:toggleAmbulanceDoorStatus', -1, stretcherNetid)
    end
end)

RegisterServerEvent("XTRA:updateHasStretcherInsideDecor")
AddEventHandler('XTRA:updateHasStretcherInsideDecor', function(stretcherNetid, status)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'nhs.menu') then
        TriggerClientEvent('XTRA:setHasStretcherInsideDecor', -1, stretcherNetid, status)
    end
end)

RegisterServerEvent("XTRA:updateStretcherLocation")
AddEventHandler('XTRA:updateStretcherLocation', function(a,b)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'nhs.menu') then
        TriggerClientEvent('XTRA:XTRA:setStretcherInside', -1, a,b)
    end
end)

RegisterServerEvent("XTRA:removeStretcher")
AddEventHandler('XTRA:removeStretcher', function(stretcher)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'nhs.menu') then
        TriggerClientEvent('XTRA:deletePropClient', -1, stretcher)
    end
end)

RegisterServerEvent("XTRA:forcePlayerOnToStretcher")
AddEventHandler('XTRA:forcePlayerOnToStretcher', function(id, stretcher)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'nhs.menu') then
        TriggerClientEvent('XTRA:forcePlayerOnToStretcher', id, stretcher)
    end
end)