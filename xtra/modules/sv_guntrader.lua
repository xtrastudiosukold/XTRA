RegisterNetEvent('XTRA:gunTraderSell')
AddEventHandler('XTRA:gunTraderSell', function()
    local source = source
	local user_id = XTRA.getUserId(source)
    if checkTraderBucket(source) then
        if XTRA.getInventoryItemAmount(user_id, 'weapon') > 0 then
            XTRA.tryGetInventoryItem(user_id, 'weapon', 1, false)
            XTRAclient.notify(source, {'~g~Sold weapon for £'..getMoneyStringFormatted(a.refundPercentage)})
            XTRA.giveBankMoney(user_id, defaultPrices['weapon'])
        else
            XTRAclient.notify(source, {'You do not have a weapon.'})
        end
    end
end)