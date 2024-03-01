grindBoost = 2.0

local defaultPrices = {
    ["Weed"] = math.floor(1500*grindBoost),
    ["Cocaine"] = math.floor(2500*grindBoost),
    ["Meth"] = math.floor(3000*grindBoost),
    ["Heroin"] = math.floor(10000*grindBoost),
    ["LSDNorth"] = math.floor(15000*grindBoost),
    ["LSDSouth"] = math.floor(15000*grindBoost),
    ["Copper"] = math.floor(1000*grindBoost),
    ["Limestone"] = math.floor(2000*grindBoost),
    ["Gold"] = math.floor(4000*grindBoost),
    ["Diamond"] = math.floor(6000*grindBoost),
}

function XTRA.getCommissionPrice(drugtype)
    for k,v in pairs(turfData) do
        if v.name == drugtype then
            if v.commission == nil then
                v.commission = 0
            end
            if v.commission == 0 then
                return defaultPrices[drugtype]
            else
                return defaultPrices[drugtype]-defaultPrices[drugtype]*v.commission/100
            end
        end
    end
end

function XTRA.getCommission(drugtype)
    for k,v in pairs(turfData) do
        if v.name == drugtype then
            return v.commission
        end
    end
end

function XTRA.updateTraderInfo()
    TriggerClientEvent('XTRA:updateTraderCommissions', -1, 
    XTRA.getCommission('Weed'),
    XTRA.getCommission('Cocaine'),
    XTRA.getCommission('Meth'),
    XTRA.getCommission('Heroin'),
    XTRA.getCommission('LargeArms'),
    XTRA.getCommission('LSDNorth'),
    XTRA.getCommission('LSDSouth'))
    TriggerClientEvent('XTRA:updateTraderPrices', -1, 
    XTRA.getCommissionPrice('Weed'), 
    XTRA.getCommissionPrice('Cocaine'),
    XTRA.getCommissionPrice('Meth'),
    XTRA.getCommissionPrice('Heroin'),
    XTRA.getCommissionPrice('LSDNorth'),
    XTRA.getCommissionPrice('LSDSouth'),
    defaultPrices['Copper'],
    defaultPrices['Limestone'],
    defaultPrices['Gold'],
    defaultPrices['Diamond'])
end

RegisterNetEvent('XTRA:requestDrugPriceUpdate')
AddEventHandler('XTRA:requestDrugPriceUpdate', function()
    local source = source
	local user_id = XTRA.getUserId(source)
    XTRA.updateTraderInfo()
end)

local function checkTraderBucket(source)
    if GetPlayerRoutingBucket(source) ~= 0 then
        XTRAclient.notify(source, {'You cannot sell drugs in this dimension.'})
        return false
    end
    return true
end

RegisterNetEvent('XTRA:sellCopper')
AddEventHandler('XTRA:sellCopper', function()
    local source = source
	local user_id = XTRA.getUserId(source)
    if checkTraderBucket(source) then
        if XTRA.getInventoryItemAmount(user_id, 'Copper') > 0 then
            XTRA.tryGetInventoryItem(user_id, 'Copper', 1, false)
            XTRAclient.notify(source, {'~g~Sold Copper for £'..getMoneyStringFormatted(defaultPrices['Copper'])})
            XTRA.giveBankMoney(user_id, defaultPrices['Copper'])
        else
            XTRAclient.notify(source, {'You do not have Copper.'})
        end
    end
end)

RegisterNetEvent('XTRA:sellLimestone')
AddEventHandler('XTRA:sellLimestone', function()
    local source = source
	local user_id = XTRA.getUserId(source)
    if checkTraderBucket(source) then
        if XTRA.getInventoryItemAmount(user_id, 'Limestone') > 0 then
            XTRA.tryGetInventoryItem(user_id, 'Limestone', 1, false)
            XTRAclient.notify(source, {'~g~Sold Limestone for £'..getMoneyStringFormatted(defaultPrices['Limestone'])})
            XTRA.giveBankMoney(user_id, defaultPrices['Limestone'])
        else
            XTRAclient.notify(source, {'You do not have Limestone.'})
        end
    end
end)

RegisterNetEvent('XTRA:sellGold')
AddEventHandler('XTRA:sellGold', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if checkTraderBucket(source) then
        if XTRA.getInventoryItemAmount(user_id, 'Gold') > 0 then
            XTRA.tryGetInventoryItem(user_id, 'Gold', 1, false)
            XTRAclient.notify(source, {'~g~Sold Gold for £'..getMoneyStringFormatted(defaultPrices['Gold'])})
            XTRA.giveBankMoney(user_id, defaultPrices['Gold'])
        else
            XTRAclient.notify(source, {'You do not have Gold.'})
        end
    end
end)

RegisterNetEvent('XTRA:sellDiamond')
AddEventHandler('XTRA:sellDiamond', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if checkTraderBucket(source) then
        if XTRA.getInventoryItemAmount(user_id, 'Processed Diamond') > 0 then
            XTRA.tryGetInventoryItem(user_id, 'Processed Diamond', 1, false)
            XTRAclient.notify(source, {'~g~Sold Processed Diamond for £'..getMoneyStringFormatted(defaultPrices['Diamond'])})
            XTRA.giveBankMoney(user_id, defaultPrices['Diamond'])
        else
            XTRAclient.notify(source, {'You do not have Diamond.'})
        end
    end
end)

RegisterNetEvent('XTRA:sellWeed')
AddEventHandler('XTRA:sellWeed', function(sellall)
    local source = source
    local user_id = XTRA.getUserId(source)
    if checkTraderBucket(source) then
        if XTRA.getInventoryItemAmount(user_id,"Weed") > 0 then
            if sellall then
                local amount = XTRA.getInventoryItemAmount(user_id,"Weed")
                XTRA.tryGetInventoryItem(user_id, 'Weed', amount, false)
                XTRAclient.notify(source, {'~g~Sold Weed for £'..getMoneyStringFormatted(XTRA.getCommissionPrice('Weed')*amount)})
                XTRA.giveMoney(user_id, XTRA.getCommissionPrice('Weed')*amount)
                XTRA.turfSaleToGangFunds(XTRA.getCommissionPrice('Weed')*amount, 'Weed')
            else
                XTRA.tryGetInventoryItem(user_id, 'Weed', 1, false)
                XTRAclient.notify(source, {'~g~Sold Weed for £'..getMoneyStringFormatted(XTRA.getCommissionPrice('Weed'))})
                XTRA.giveMoney(user_id, XTRA.getCommissionPrice('Weed'))
                XTRA.turfSaleToGangFunds(XTRA.getCommissionPrice('Weed'), 'Weed')
            end
        else
            XTRAclient.notify(source, {'You do not have Weed.'})
        end
    end
end)

RegisterNetEvent('XTRA:sellCocaine')
AddEventHandler('XTRA:sellCocaine', function(sellall)
    local source = source
    local user_id = XTRA.getUserId(source)
    if checkTraderBucket(source) then
        if XTRA.getInventoryItemAmount(user_id,"Cocaine") > 0 then
            if sellall then
                local amount = XTRA.getInventoryItemAmount(user_id,"Cocaine")
                XTRA.tryGetInventoryItem(user_id, 'Cocaine', amount, false)
                XTRAclient.notify(source, {'~g~Sold Cocaine for £'..getMoneyStringFormatted(XTRA.getCommissionPrice('Cocaine')*amount)})
                XTRA.giveMoney(user_id, XTRA.getCommissionPrice('Cocaine')*amount)
                XTRA.turfSaleToGangFunds(XTRA.getCommissionPrice('Cocaine')*amount, 'Cocaine')
            else
                XTRA.tryGetInventoryItem(user_id, 'Cocaine', 1, false)
                XTRAclient.notify(source, {'~g~Sold Cocaine for £'..getMoneyStringFormatted(XTRA.getCommissionPrice('Cocaine'))})
                XTRA.giveMoney(user_id, XTRA.getCommissionPrice('Cocaine'))
                XTRA.turfSaleToGangFunds(XTRA.getCommissionPrice('Cocaine'), 'Cocaine')
            end
        else
            XTRAclient.notify(source, {'You do not have Cocaine.'})
        end
    end
end)

RegisterNetEvent('XTRA:sellMeth')
AddEventHandler('XTRA:sellMeth', function(sellall)
    local source = source
    local user_id = XTRA.getUserId(source)
    if checkTraderBucket(source) then
        if XTRA.getInventoryItemAmount(user_id,"Meth") > 0 then
            if sellall then
                local amount = XTRA.getInventoryItemAmount(user_id,"Meth")
                XTRA.tryGetInventoryItem(user_id, 'Meth', amount, false)
                XTRAclient.notify(source, {'~g~Sold Meth for £'..getMoneyStringFormatted(XTRA.getCommissionPrice('Meth')*amount)})
                XTRA.giveMoney(user_id, XTRA.getCommissionPrice('Meth')*amount)
                XTRA.turfSaleToGangFunds(XTRA.getCommissionPrice('Meth')*amount, 'Meth')
            else
                XTRA.tryGetInventoryItem(user_id, 'Meth', 1, false)
                XTRAclient.notify(source, {'~g~Sold Meth for £'..getMoneyStringFormatted(XTRA.getCommissionPrice('Meth'))})
                XTRA.giveMoney(user_id, XTRA.getCommissionPrice('Meth'))
                XTRA.turfSaleToGangFunds(XTRA.getCommissionPrice('Meth'), 'Meth')
            end
        else
            XTRAclient.notify(source, {'You do not have Meth.'})
        end
    end
end)

RegisterNetEvent('XTRA:sellHeroin')
AddEventHandler('XTRA:sellHeroin', function(sellall)
    local source = source
    local user_id = XTRA.getUserId(source)
    if checkTraderBucket(source) then
        if XTRA.getInventoryItemAmount(user_id,"Heroin") > 0 then
            if sellall then
                local amount = XTRA.getInventoryItemAmount(user_id,"Heroin")
                XTRA.tryGetInventoryItem(user_id, 'Heroin', amount, false)
                XTRAclient.notify(source, {'~g~Sold Heroin for £'..getMoneyStringFormatted(XTRA.getCommissionPrice('Heroin')*amount)})
                XTRA.giveMoney(user_id, XTRA.getCommissionPrice('Heroin')*amount)
                XTRA.turfSaleToGangFunds(XTRA.getCommissionPrice('Heroin')*amount, 'Heroin')
            else
                XTRA.tryGetInventoryItem(user_id, 'Heroin', 1, false)
                XTRAclient.notify(source, {'~g~Sold Heroin for £'..getMoneyStringFormatted(XTRA.getCommissionPrice('Heroin'))})
                XTRA.giveMoney(user_id, XTRA.getCommissionPrice('Heroin'))
                XTRA.turfSaleToGangFunds(XTRA.getCommissionPrice('Heroin'), 'Heroin')
            end
        else
            XTRAclient.notify(source, {'You do not have Heroin.'})
        end
    end
end)

RegisterNetEvent('XTRA:sellLSDNorth')
AddEventHandler('XTRA:sellLSDNorth', function(sellall)
    local source = source
    local user_id = XTRA.getUserId(source)
    if checkTraderBucket(source) then
        if XTRA.getInventoryItemAmount(user_id,"LSD") > 0 then
            if sellall then
                local amount = XTRA.getInventoryItemAmount(user_id,"LSD")
                XTRA.tryGetInventoryItem(user_id, 'LSD', amount, false)
                XTRAclient.notify(source, {'~g~Sold LSD for £'..getMoneyStringFormatted(XTRA.getCommissionPrice('LSDNorth')*amount)})
                XTRA.giveMoney(user_id, XTRA.getCommissionPrice('LSDNorth')*amount)
                XTRA.turfSaleToGangFunds(XTRA.getCommissionPrice('LSDNorth')*amount, 'LSDNorth')
            else
                XTRA.tryGetInventoryItem(user_id, 'LSD', 1, false)
                XTRAclient.notify(source, {'~g~Sold LSD for £'..getMoneyStringFormatted(XTRA.getCommissionPrice('LSDNorth'))})
                XTRA.giveMoney(user_id, XTRA.getCommissionPrice('LSDNorth'))
                XTRA.turfSaleToGangFunds(XTRA.getCommissionPrice('LSDNorth'), 'LSDNorth')
            end
        else
            XTRAclient.notify(source, {'You do not have LSD.'})
        end
    end
end)

RegisterNetEvent('XTRA:sellLSDSouth')
AddEventHandler('XTRA:sellLSDSouth', function(sellall)
    local source = source
    local user_id = XTRA.getUserId(source)
    if checkTraderBucket(source) then
        if XTRA.getInventoryItemAmount(user_id,"LSD") > 0 then
            if sellall then
                local amount = XTRA.getInventoryItemAmount(user_id,"LSD")
                XTRA.tryGetInventoryItem(user_id, 'LSD', amount, false)
                XTRAclient.notify(source, {'~g~Sold LSD for £'..getMoneyStringFormatted(XTRA.getCommissionPrice('LSDSouth')*amount)})
                XTRA.giveMoney(user_id, XTRA.getCommissionPrice('LSDSouth')*amount)
                XTRA.turfSaleToGangFunds(XTRA.getCommissionPrice('LSDSouth')*amount, 'LSDSouth')
            else
                XTRA.tryGetInventoryItem(user_id, 'LSD', 1, false)
                XTRAclient.notify(source, {'~g~Sold LSD for £'..getMoneyStringFormatted(XTRA.getCommissionPrice('LSDSouth'))})
                XTRA.giveMoney(user_id, XTRA.getCommissionPrice('LSDSouth'))
                XTRA.turfSaleToGangFunds(XTRA.getCommissionPrice('LSDSouth'), 'LSDSouth')
            end
        else
            XTRAclient.notify(source, {'You do not have LSD.'})
        end
    end
end)

RegisterNetEvent('XTRA:sellAll')
AddEventHandler('XTRA:sellAll', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if checkTraderBucket(source) then
        for k,v in pairs(defaultPrices) do
            if k == 'Copper' or k == 'Limestone' or k == 'Gold' then
                if XTRA.getInventoryItemAmount(user_id, k) > 0 then
                    local amount = XTRA.getInventoryItemAmount(user_id, k)
                    XTRA.tryGetInventoryItem(user_id, k, amount, false)
                    XTRAclient.notify(source, {'~g~Sold '..k..' for £'..getMoneyStringFormatted(defaultPrices[k]*amount)})
                    XTRA.giveBankMoney(user_id, defaultPrices[k]*amount)
                end
            elseif k == 'Diamond' then
                if XTRA.getInventoryItemAmount(user_id, 'Processed Diamond') > 0 then
                    local amount = XTRA.getInventoryItemAmount(user_id, 'Processed Diamond')
                    XTRA.tryGetInventoryItem(user_id, 'Processed Diamond', amount, false)
                    XTRAclient.notify(source, {'~g~Sold '..'Processed Diamond'..' for £'..getMoneyStringFormatted(defaultPrices[k]*amount)})
                    XTRA.giveBankMoney(user_id, defaultPrices[k]*amount)
                end
            end
        end
    end
end)

RegisterCommand("testitem", function(source, args, rawCommand)
    local source = source
    local user_id = XTRA.getUserId(source)
    if user_id == 1 then
        if args[1] then
            if args[2] then
                XTRA.giveInventoryItem(user_id, args[2], tonumber(args[1]))
            else
                XTRAclient.notify(source, {'Invalid Arguments /testitem [amount] [itemname]'})
            end
        else
            XTRAclient.notify(source, {'Invalid Arguments /testitem [amount] [itemname]'})
        end
    end
end)