local a = {
    ["burger"] = {
        [1] = 'bun',
        [2] = 'lettuce',
        [3] = 'tomato',
        [4] = 'onion',
        [5] = 'cheese',
        [6] = 'beef_patty',
        [7] = 'bbq',
    }
}

local cookingStages = {}
RegisterNetEvent('XTRA:requestStartCooking')
AddEventHandler('XTRA:requestStartCooking', function(recipe)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasGroup(user_id, 'Burger Shot Cook') then
        for k,v in pairs(a) do
            if k == recipe then
                cookingStages[user_id] = 1
                TriggerClientEvent('XTRA:beginCooking', source, recipe)
                TriggerClientEvent('XTRA:cookingInstruction', source, v[cookingStages[user_id]])
            end
        end
    else
        XTRAclient.notify(source, {"You aren't clocked on as a Burger Shot Cook, head to cityhall to sign up."})
    end
end)

RegisterNetEvent('XTRA:pickupCookingIngredient')
AddEventHandler('XTRA:pickupCookingIngredient', function(recipe, ingredient)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasGroup(user_id, 'Burger Shot Cook') then
        if ingredient == 'bbq' and cookingStages[user_id] == 7 then
            cookingStages[user_id] = nil
            TriggerClientEvent('XTRA:finishedCooking', source)
            XTRA.giveBankMoney(user_id, grindBoost*4000)
        else
            for k,v in pairs(a) do
                if k == recipe then
                    cookingStages[user_id] = cookingStages[user_id] + 1
                    TriggerClientEvent('XTRA:cookingInstruction', source, v[cookingStages[user_id]])
                end
            end
        end
    else
        XTRAclient.notify(source, {"You aren't clocked on as a Burger Shot Cook, head to cityhall to sign up."})
    end
end)