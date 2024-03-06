local flaggedVehicles = {}

AddEventHandler("XTRA:playerSpawn", function(user_id, source, first_spawn)
    if first_spawn then
        if XTRA.hasPermission(user_id, 'police.armoury') then
            TriggerClientEvent('XTRA:setFlagVehicles', source, flaggedVehicles)
        end
    end
end)

RegisterServerEvent("XTRA:flagVehicleAnpr")
AddEventHandler("XTRA:flagVehicleAnpr", function(plate, reason)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'police.armoury') then
        flaggedVehicles[plate] = reason
        TriggerClientEvent('XTRA:setFlagVehicles', -1, flaggedVehicles)
    end
end)