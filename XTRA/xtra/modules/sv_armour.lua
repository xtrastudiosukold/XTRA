RegisterNetEvent("XTRA:getArmour")
AddEventHandler("XTRA:getArmour",function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, "police.armoury") then
        if XTRA.hasPermission(user_id, "police.maxarmour") then
            XTRAclient.setArmour(source, {100, true})
        elseif XTRA.hasGroup(user_id, "Inspector Clocked") then
            XTRAclient.setArmour(source, {75, true})
        elseif XTRA.hasGroup(user_id, "Senior Constable Clocked") or XTRA.hasGroup(user_id, "Sergeant Clocked") then
            XTRAclient.setArmour(source, {50, true})
        elseif XTRA.hasGroup(user_id, "PCSO Clocked") or XTRA.hasGroup(user_id, "PC Clocked") then
            XTRAclient.setArmour(source, {25, true})
        end
        TriggerClientEvent("XTRA:PlaySound", source, "playMoney")
        XTRAclient.notify(source, {"~g~You have received your armour."})
    else
        local player = XTRA.getUserSource(user_id)
        local name = XTRA.GetPlayerName(user_id)
        Wait(500)
        TriggerEvent("XTRA:acBan", user_id, 11, name, player, 'Attempted to use pd armour trigger')
    end
end)

local equipingplates = {}

function XTRA.ArmourPlate(src)
    local user_id = XTRA.getUserId(src)
    if GetPedArmour(GetPlayerPed(src)) < 100 then
        if not equipingplates[user_id] then
            if XTRA.tryGetInventoryItem(user_id,"armourplate",1) then
                equipingplates[user_id] = true
                TriggerClientEvent("XTRA:playArmourApplyAnim",src)
                Wait(5000)
                XTRAclient.setArmour(src, {100})
                equipingplates[user_id] = false
                XTRAclient.notify(src, {"~g~You have equipped an armour plate."})
            else
                XTRAclient.notify(src, {"~r~You do not have any armour plates."})
            end
        else
            XTRAclient.notify(src, {"~r~You are already equipping armour plates."})
        end
    else
        XTRAclient.notify(src, {"~r~You already have 100% armour."})
    end
end