local usedwheel = {}
local alreadyspinning = false
RegisterNetEvent("XTRA:requestSpinLuckyWheel")
AddEventHandler("XTRA:requestSpinLuckyWheel", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    local chips = nil
    if not usedwheel[user_id] then
        if not alreadyspinning then
            MySQL.query("casinochips/get_chips", {user_id = user_id}, function(rows, affected)
                if #rows > 0 then
                    chips = rows[1].chips
                    if chips < 50000 then
                        XTRAclient.notify(source,{"You don't have enough chips."})
                    else
                        local chance = math.random(1,20)
                        usedwheel[user_id] = true
                        alreadyspinning = true
                        MySQL.execute("casinochips/remove_chips", {user_id = user_id, amount = 50000})
                        TriggerClientEvent('XTRA:chipsUpdated', source)
                        TriggerClientEvent('XTRA:spinLuckyWheel', source)
                        TriggerClientEvent('XTRA:syncLuckyWheel', -1, chance) -- the number correlates to the item on the wheel
                        Wait(12500)
                        TriggerEvent("XTRA:Reward",user_id,chance)
                    end
                end
            end)
        else
            XTRAclient.notify(source,{"~r~Someone is already spinning the wheel."})
        end
    else
        XTRAclient.notify(source,{"~r~You have already used the wheel this restart."})
    end
end)

AddEventHandler("XTRA:Reward",function(user_id,number)
    if number == 1 or number == 9 or number == 13 or number == 17 then
        XTRA.giveInventoryItem(user_id, "wbody|WEAPON_REVOLVER357", 1)
        XTRA.giveInventoryItem(user_id, ".357 Bullets", 250)
        casinowheelnotify = "Rebel Revolver"
    elseif number == 2 or number == 6 or number == 10 or number == 14 or number == 18 then
        XTRA.giveInventoryItem(user_id, "handcuff", 1)
        casinowheelnotify = "handcuffs"
    elseif number == 3 or number == 7 or number == 15 or number == 20 then
        XTRA.giveBankMoney(user_id,100000)
        casinowheelnotify = "£100,000"
    elseif number == 4 or number == 8 or number == 11 or number == 16 then
        giveChips(XTRA.getUserSource(user_id), 100000)
        casinowheelnotify = "100,000 Chips"
    elseif number == 5 then
        XTRA.giveInventoryItem(user_id, "rock", 1)
        casinowheelnotify = "rock"
    elseif number == 12 then
        XTRA.giveInventoryItem(user_id,"handcuffkeys",1)
        casinowheelnotify = "handcuff keys"
    elseif number == 19 then
        AddVehicle(user_id,"m4lb")
        casinowheelnotify = "the casino car"
    end
    XTRAclient.notify(XTRA.getUserSource(user_id),{"~g~You have won " ..casinowheelnotify.. "!"})
    TriggerClientEvent("XTRA:spinLuckyWheelReaction", XTRA.getUserSource(user_id), "_big")
    alreadyspinning = false
end)