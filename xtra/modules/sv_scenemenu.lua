local spikes = 0
local speedzones = 0

RegisterNetEvent("XTRA:placeSpike")
AddEventHandler("XTRA:placeSpike", function(heading, coords)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'police.armoury') then
        TriggerClientEvent('XTRA:addSpike', -1, coords, heading)
    end
end)

RegisterNetEvent("XTRA:removeSpike")
AddEventHandler("XTRA:removeSpike", function(entity)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'police.armoury') then
        TriggerClientEvent('XTRA:deleteSpike', -1, entity)
        TriggerClientEvent("XTRA:deletePropClient", -1, entity)
    end
end)

RegisterNetEvent("XTRA:requestSceneObjectDelete")
AddEventHandler("XTRA:requestSceneObjectDelete", function(prop)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'police.armoury') or XTRA.hasPermission(user_id, 'hmp.menu') then
        TriggerClientEvent("XTRA:deletePropClient", -1, prop)
    end
end)

RegisterNetEvent("XTRA:createSpeedZone")
AddEventHandler("XTRA:createSpeedZone", function(coords, radius, speed)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'police.armoury') or XTRA.hasPermission(user_id, 'hmp.menu') then
        speedzones = speedzones + 1
        TriggerClientEvent('XTRA:createSpeedZone', -1, speedzones, coords, radius, speed)
    end
end)

RegisterNetEvent("XTRA:deleteSpeedZone")
AddEventHandler("XTRA:deleteSpeedZone", function(speedzone)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'police.armoury') or XTRA.hasPermission(user_id, 'hmp.menu') then
        TriggerClientEvent('XTRA:deleteSpeedZone', -1, speedzones, coords, radius, speed)
    end
end)

