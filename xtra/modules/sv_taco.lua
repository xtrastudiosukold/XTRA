local tacoDrivers = {}

RegisterNetEvent('XTRA:addTacoSeller')
AddEventHandler('XTRA:addTacoSeller', function(coords, price)
    local source = source
    local user_id = XTRA.getUserId(source)
    tacoDrivers[user_id] = {position = coords, amount = price}
    TriggerClientEvent('XTRA:sendClientTacoData', -1, tacoDrivers)
end)

RegisterNetEvent('XTRA:RemoveMeFromTacoPositions')
AddEventHandler('XTRA:RemoveMeFromTacoPositions', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    tacoDrivers[user_id] = nil
    TriggerClientEvent('XTRA:removeTacoSeller', -1, user_id)
end)

RegisterNetEvent('XTRA:payTacoSeller')
AddEventHandler('XTRA:payTacoSeller', function(id)
    local source = source
    local user_id = XTRA.getUserId(source)
    if tacoDrivers[id] then
        if XTRA.getInventoryWeight(user_id)+1 <= XTRA.getInventoryMaxWeight(user_id) then
            if XTRA.tryFullPayment(user_id,15000) then
                XTRA.giveInventoryItem(user_id, 'Taco', 1)
                XTRA.giveBankMoney(id, 15000)
                TriggerClientEvent("XTRA:PlaySound", source, "money")
            else
                XTRAclient.notify(source, {'You do not have enough money.'})
            end
        else
            XTRAclient.notify(source, {'Not enough inventory space.'})
        end
    end
end)