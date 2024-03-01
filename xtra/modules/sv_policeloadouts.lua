loadouts = {
    ['Basic'] = {
        permission = "police.armoury",
        weapons = {
            "WEAPON_NIGHTSTICK",
            "WEAPON_STUNGUN",
            "WEAPON_FLASHLIGHT",
            "WEAPON_PDGLOCK",
        },
    },
    ['SCO-19'] = {
        permission = "police.loadshop2",
        weapons = {
            "WEAPON_NIGHTSTICK",
            "WEAPON_STUNGUN",
            "WEAPON_FLASHLIGHT",
            "WEAPON_PDGLOCK",
            "WEAPON_G36K",
        },
    },
    ['CTSFO'] = {
        permission = "police.maxarmour",
        weapons = {
            "WEAPON_NIGHTSTICK",
            "WEAPON_STUNGUN",
            "WEAPON_FLASHLIGHT",
            "WEAPON_PDGLOCK",
            "WEAPON_SPAR17",
            "WEAPON_REMINGTON700",
            "WEAPON_FLASHBANG",
        },
    },
    ['Envy'] = {
        permission = "police.dev",
        weapons = {
            "WEAPON_NIGHTSTICK",
            "WEAPON_STUNGUN",
            "WEAPON_FLASHLIGHT",
            "WEAPON_PDGLOCK",
            "WEAPON_MK18V2",
            "WEAPON_AX50",
            "WEAPON_NONMP5",
            "WEAPON_FLASHBANG",
        },
    },
}


RegisterNetEvent('XTRA:getPoliceLoadouts')
AddEventHandler('XTRA:getPoliceLoadouts', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    local loadoutsTable = {}
    if XTRA.hasPermission(user_id, 'police.armoury') then
        for k,v in pairs(loadouts) do
            v.hasPermission = XTRA.hasPermission(user_id, v.permission) 
            loadoutsTable[k] = v
        end
        TriggerClientEvent('XTRA:gotLoadouts', source, loadoutsTable)
    end
end)

RegisterNetEvent('XTRA:selectLoadout')
AddEventHandler('XTRA:selectLoadout', function(loadout)
    local source = source
    local user_id = XTRA.getUserId(source)
    for k,v in pairs(loadouts) do
        if k == loadout then
            if XTRA.hasPermission(user_id, 'police.armoury') and XTRA.hasPermission(user_id, v.permission) then
                for a,b in pairs(v.weapons) do
                    XTRAclient.giveWeapons(source, {{[b] = {ammo = 250}}, false})
                    XTRAclient.setArmour(source, {100, true})
                end
                XTRAclient.notify(source, {"~g~Received "..loadout.." loadout."})
            else
                XTRAclient.notify(source, {"You do not have permission to select this loadout"})
            end
        end
    end
end)