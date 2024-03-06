local rpZones = {}
local numRP = 0
RegisterServerEvent("XTRA:createRPZone")
AddEventHandler("XTRA:createRPZone", function(a)
	local source = source
	local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'group.remove') then
        numRP = numRP + 1
        a['uuid'] = numRP
        rpZones[numRP] = a
        TriggerClientEvent('XTRA:createRPZone', -1, a)
    end
end)

RegisterServerEvent("XTRA:removeRPZone")
AddEventHandler("XTRA:removeRPZone", function(b)
	local source = source
	local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'group.remove') then
        if next(rpZones) then
            for k,v in pairs(rpZones) do
                if v.uuid == b then
                    rpZones[k] = nil
                    TriggerClientEvent('XTRA:removeRPZone', -1, b)
                end
            end
        end
    end
end)

AddEventHandler("XTRA:playerSpawn", function(user_id, source, first_spawn)
    if first_spawn then
        for k,v in pairs(rpZones) do
            TriggerClientEvent('XTRA:createRPZone', source, v)
        end
    end
end)
