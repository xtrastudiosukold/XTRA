netObjects = {}

RegisterServerEvent("XTRA:spawnVehicleCallback")
AddEventHandler('XTRA:spawnVehicleCallback', function(a, b)
    netObjects[b] = {source = XTRA.getUserSource(a), id = a, name = XTRA.GetPlayerName(a)}
end)

RegisterServerEvent("XTRA:delGunDelete")
AddEventHandler("XTRA:delGunDelete", function(object)
    local source = source
    local user_id = XTRA.getUserId(user_id)
    if XTRA.hasPermission(user_id, 'admin.tickets') then
        TriggerClientEvent("XTRA:deletePropClient", -1, object)
        if netObjects[object] then
            TriggerClientEvent("XTRA:returnObjectDeleted", source, 'This object was created by ~b~'..netObjects[object].name..'~w~. Temp ID: ~b~'..netObjects[object].source..'~w~.\nPerm ID: ~b~'..netObjects[object].id..'~w~.')
        end
    end
end)