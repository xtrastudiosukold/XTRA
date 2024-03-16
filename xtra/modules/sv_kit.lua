RegisterCommand("kit", function(source, args, raw)
    local source = source
    local user_id = XTRA.getUserId(source)
    if user_id > 0 then
        XTRAclient.giveWeapons(source, {{["WEAPON_MOSIN"] = {ammo = 250}}})
        -- XTRAclient.giveWeapons(source, {{["WEAPON_STAC"] = {ammo = 250}}})
       -- XTRAclient.giveWeapons(source, {{["WEAPON_NOVESKENSR9"] = {ammo = 250}}})
        XTRAclient.setArmour(source, {100})
        TriggerClientEvent("XTRA:Revive", source)
    end
end)

RegisterCommand("kit2", function(source, args, raw)
    local source = source
    local user_id = XTRA.getUserId(source)
    if user_id > 0 then
        XTRAclient.giveWeapons(source, {{["WEAPON_MOSIN"] = {ammo = 250}}})
        XTRAclient.giveWeapons(source, {{["WEAPON_SVD"] = {ammo = 250}}})
        XTRAclient.giveWeapons(source, {{["WEAPON_DIAMONDMP5"] = {ammo = 250}}})
        XTRAclient.setArmour(source, {100})
        TriggerClientEvent("XTRA:Revive", source)
    end
end)