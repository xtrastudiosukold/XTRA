RegisterServerEvent('XTRA:saveTattoos')
AddEventHandler('XTRA:saveTattoos', function(tattooData, price)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.tryFullPayment(user_id, price) then
        XTRA.setUData(user_id, "XTRA:Tattoo:Data", json.encode(tattooData))
    end
end)

RegisterServerEvent('XTRA:getPlayerTattoos')
AddEventHandler('XTRA:getPlayerTattoos', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    XTRA.getUData(user_id, "XTRA:Tattoo:Data", function(data)
        if data ~= nil then
            TriggerClientEvent('XTRA:setTattoos', source, json.decode(data))
        end
    end)
end)
