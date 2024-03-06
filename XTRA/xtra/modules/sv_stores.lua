local cfg = module("cfg/cfg_stores")


RegisterNetEvent("XTRA:BuyStoreItem")
AddEventHandler("XTRA:BuyStoreItem", function(item, amount)
    local user_id = XTRA.getUserId(source)
    local ped = GetPlayerPed(source)
    for k,v in pairs(cfg.shopItems) do
        if item == v.itemID then
            if XTRA.getInventoryWeight(user_id) <= 25 then
                if XTRA.tryPayment(user_id,v.price*amount) then
                    XTRA.giveInventoryItem(user_id, item, amount, false)
                    XTRAclient.notifyPicture(source, {"monzo", "monzo", "~g~Paid ".. '£' ..getMoneyStringFormatted(v.price*amount)..'.'})

                    TriggerClientEvent("XTRA:PlaySound", source, "playMoney")
                else
                    XTRAclient.notify(source, {"Not enough money."})
                    TriggerClientEvent("XTRA:PlaySound", source, 2)
                end
            else
                XTRAclient.notify(source,{'Not enough inventory space.'})
                TriggerClientEvent("XTRA:PlaySound", source, 2)
            end
        end
    end
end)