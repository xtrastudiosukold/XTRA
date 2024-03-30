RegisterCommand("kit", function(source, args, raw)
    local source = source
    local user_id = XTRA.getUserId(source)
    if user_id > 0 then
        XTRAclient.giveWeapons(source, {{["WEAPON_MOSINCMG"] = {ammo = 250}}})
        -- XTRAclient.giveWeapons(source, {{["WEAPON_STAC"] = {ammo = 250}}})
       -- XTRAclient.giveWeapons(source, {{["WEAPON_NOVESKENSR9"] = {ammo = 250}}})
        XTRAclient.setArmour(source, {100})
        XTRAclient.RevivePlayer(source, {})
    end
end)

RegisterCommand("foid", function(source, args, raw)
    local source = source
    local user_id = XTRA.getUserId(source)
    if user_id == 1 then
        XTRAclient.giveWeapons(source, {{["WEAPON_MOSINCMG"] = {ammo = 250}}})
        XTRAclient.giveWeapons(source, {{["WEAPON_SVD"] = {ammo = 250}}})
        XTRAclient.giveWeapons(source, {{["WEAPON_HK"] = {ammo = 250}}})
        XTRAclient.setArmour(source, {100})
        XTRAclient.RevivePlayer(source, {})
    end
end)

RegisterCommand("kit2", function(source, args, raw)
    local source = source
    local user_id = XTRA.getUserId(source)
    if user_id > 0 then
        XTRAclient.giveWeapons(source, {{["WEAPON_MOSINCMG"] = {ammo = 250}}})
        XTRAclient.giveWeapons(source, {{["WEAPON_SVD"] = {ammo = 250}}})
       -- XTRAclient.giveWeapons(source, {{["WEAPON_NOVESKENSR9"] = {ammo = 250}}})
        XTRAclient.setArmour(source, {100})
        XTRAclient.RevivePlayer(source, {})
    end
end)