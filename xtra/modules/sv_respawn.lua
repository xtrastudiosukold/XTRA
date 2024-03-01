local cfg=module("cfg/cfg_respawn")

RegisterNetEvent("XTRA:SendSpawnMenu")
AddEventHandler("XTRA:SendSpawnMenu",function()
    local source = source
    local user_id = XTRA.getUserId(source)
    local spawnTable={}
    for k,v in pairs(cfg.spawnLocations)do
        if v.permission[1] ~= nil then
            if XTRA.hasPermission(XTRA.getUserId(source),v.permission[1])then
                table.insert(spawnTable, k)
            end
        else
            table.insert(spawnTable, k)
        end
    end
    exports['xtra']:execute("SELECT * FROM `xtra_user_homes` WHERE user_id = @user_id", {user_id = user_id}, function(result)
        if result ~= nil then 
            for a,b in pairs(result) do
                table.insert(spawnTable, b.home)
            end
            if XTRA.isPurge() then
                TriggerClientEvent("XTRA:purgeSpawnClient",source)
            else
                TriggerClientEvent("XTRA:OpenSpawnMenu",source,spawnTable)
                XTRA.clearInventory(user_id) 
                XTRAclient.setPlayerCombatTimer(source, {0})
            end
        end
    end)
end)