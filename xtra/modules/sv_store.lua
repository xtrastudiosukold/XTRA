local cfg = module("cfg/cfg_store")
local Ranks = {'Baller','Rainmaker','Kingpin','Supreme','Premium','Supporter'}
RegisterServerEvent('XTRA:OpenStore')
AddEventHandler('XTRA:OpenStore', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if user_id ~= nil then
        ForceRefresh(source)
        TriggerClientEvent("XTRA:OpenStoreMenu", source, true)
    end
end)

function RequestRank(user_id)
    for k,v in pairs(Ranks) do
        if XTRA.hasGroup(user_id,v) then
            return v
        end
    end
    return 'None'
end

function ForceRefresh(source)
    local source = source
    local user_id = XTRA.getUserId(source)
    exports['xtra']:execute('SELECT * FROM xtra_stores WHERE user_id = @user_id', {user_id = user_id}, function(result)
        storeItemsOwned = {}
        if #result > 0 then
            for a,b in pairs(result) do
                storeItemsOwned[b.code] = b.item
            end
            TriggerClientEvent('XTRA:sendStoreItems', XTRA.getUserSource(user_id), storeItemsOwned)
        end
    end)
end

function AddVehicle(user_id,vehicle)
    XTRAclient.generateUUID(XTRA.getUserSource(user_id), {"plate", 5, "alphanumeric"}, function(uuid)
        local uuid = string.upper(uuid)
        MySQL.execute("XTRA/add_vehicle", {user_id = user_id, vehicle = vehicle, registration = 'P'..uuid})
    end)
end

function CreateItem(user_id, itemname, source)
    local first, second = generateUUID("Items", 4, "alphanumeric"), generateUUID("Items", 4, "alphanumeric")
    local code = string.upper(first .. "-" .. second)
    local currentDate = os.date("%d/%m/%Y")
    
    exports['xtra']:execute("INSERT INTO xtra_stores (code, item, user_id, date) VALUES (@code, @item, @user_id, @date)", {code = code, item = itemname, user_id = user_id, date = currentDate})
    
    Wait(100)
    
    if user_id then
        ForceRefresh(user_id)
    else
        ForceRefresh(XTRA.getUserSource(source))
    end
end


AddEventHandler('XTRA:playerSpawn', function(user_id,source,first_spawn)
    ForceRefresh(source)
    TriggerClientEvent('XTRA:setStoreRankName', source, RequestRank(user_id))
end)



RegisterServerEvent('XTRA:setInVehicleTestingBucket', function(status)
    local source = source
    if status then
        XTRA.setBucket(source, 100)
    else
        XTRA.setBucket(source, 0)
    end
end)

RegisterServerEvent("XTRA:getStoreLockedVehicleCategories", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    local permissiontable = {}
    for a,b in pairs(cfg.vehicleCategoryToPermissionLookup) do
        if XTRA.hasPermission(user_id,b) then
            table.insert(permissiontable,a)
        end
    end
    TriggerClientEvent("XTRA:setStoreLockedVehicleCategories", source, permissiontable)
end)

RegisterServerEvent("XTRA:redeemStoreItem", function(code, table)
    local source = source
    local user_id = XTRA.getUserId(source)
    exports['xtra']:execute('SELECT * FROM xtra_stores WHERE code = @code', {code = code}, function(result)
        if #result > 0 then
            if result[1].user_id == user_id then
                if result[1].item == "1_money_bag" then
                    XTRA.giveBankMoney(user_id, 1000000)
                elseif result[1].item == "2_money_bag" then
                    XTRA.giveBankMoney(user_id, 2000000)
                elseif result[1].item == "5_money_bag" then
                    XTRA.giveBankMoney(user_id, 5000000)
                elseif result[1].item == "10_money_bag" then
                    XTRA.giveBankMoney(user_id, 10000000)
                elseif result[1].item == "20_money_bag" then
                    XTRA.giveBankMoney(user_id, 20000000)
                elseif result[1].item == "30_money_bag" then
                    XTRA.giveBankMoney(user_id, 30000000)    
                elseif result[1].item == "100_money_bag" then
                    XTRA.giveBankMoney(user_id, 100000000) 
                elseif result[1].item == "250_money_bag" then
                    XTRA.giveBankMoney(user_id, 250000000)
                elseif result[1].item == "500_money_bag" then
                    XTRA.giveBankMoney(user_id, 500000000)  
                elseif result[1].item == "xtra_plus" then
                    XTRA.getSubscriptions(user_id, function(cb, plushours, plathours)
                       if cb then
                            MySQL.execute("subscription/set_plushours", {user_id = user_id, plushours = plushours + 720})
                        end
                    end)
                elseif result[1].item == "xtra_platinum" then
                    XTRA.getSubscriptions(user_id, function(cb, plushours, plathours)
                        if cb then
                             MySQL.execute("subscription/set_plathours", {user_id = user_id, plathours = plathours + 720})
                         end
                    end)
                elseif result[1].item == "import_slot" then
                    AddVehicle(user_id,table.customCar)
                elseif result[1].item == "supporter" then
                    AddVehicle(user_id,table.vipCar1)
                    XTRA.giveBankMoney(user_id, 1000000)
                    XTRA.addUserGroup(user_id,"Supporter")
                elseif result[1].item == "premium" then
                    AddVehicle(user_id,table.vipCar1)
                    XTRA.giveBankMoney(user_id, 1500000)
                    XTRA.addUserGroup(user_id,"Premium")
                elseif result[1].item == "supreme" then
                    AddVehicle(user_id,table.vipCar1)
                    AddVehicle(user_id,table.vipCar2)
                    XTRA.giveBankMoney(user_id, 2500000)
                    XTRA.addUserGroup(user_id,"Supreme")
                elseif result[1].item == "kingpin" then
                    AddVehicle(user_id,table.vipCar1)
                    AddVehicle(user_id,table.vipCar2)
                    XTRA.giveBankMoney(user_id, 5000000)
                    XTRA.addUserGroup(user_id,"Kingpin")
                    if table.customCar1 == nil then
                        CreateItem(user_id,"import_slot")
                    else
                        AddVehicle(user_id,table.customCar1)
                    end
                elseif result[1].item == "rainmaker" then
                    AddVehicle(user_id,table.vipCar1)
                    AddVehicle(user_id,table.vipCar2)
                    AddVehicle(user_id,table.vipCar3)
                    XTRA.giveBankMoney(user_id, 5000000)
                    XTRA.addUserGroup(user_id,"Rainmaker")
                    if table.customCar1 == nil then
                        CreateItem(user_id,"import_slot")
                    else
                        AddVehicle(user_id,table.customCar1)
                    end
                    if table.customCar2 == nil then
                        CreateItem(user_id,"import_slot")
                    else
                        AddVehicle(user_id,table.customCar2)
                    end
                    if table.customCar3 == nil then
                        CreateItem(user_id,"import_slot")
                    else
                        AddVehicle(user_id,table.customCar3)
                    end
                elseif result[1].item == "baller" then
                    XTRA.giveBankMoney(user_id, 100000000)
                    XTRA.addUserGroup(user_id,"Baller")
                    CreateItem(user_id,"lock_slot")
                    AddVehicle(user_id,table.vipCar1)
                    AddVehicle(user_id,table.vipCar2)
                    AddVehicle(user_id,table.vipCar3)
                    AddVehicle(user_id,table.vipCar4)
                    if table.customCar1 == nil then
                        CreateItem(user_id,"import_slot")
                    else
                        AddVehicle(user_id,table.customCar1)
                    end
                    if table.customCar2 == nil then
                        CreateItem(user_id,"import_slot")
                    else
                        AddVehicle(user_id,table.customCar2)
                    end
                    if table.customCar3 == nil then
                        CreateItem(user_id,"import_slot")
                    else
                        AddVehicle(user_id,table.customCar3)
                    end
                    if table.customCar4 == nil then
                        CreateItem(user_id,"import_slot")
                    else
                        AddVehicle(user_id,table.customCar4)
                    end
                    if table.customCar5 == nil then
                        CreateItem(user_id,"import_slot")
                    else
                        AddVehicle(user_id,table.customCar5)
                    end
                    if table.customCar6 == nil then
                        CreateItem(user_id,"import_slot")
                    else
                        AddVehicle(user_id,table.customCar6)
                    end
                end
                exports['xtra']:execute("DELETE FROM xtra_stores WHERE code = @code", {code = code})
                XTRAclient.notify(source, {"~g~Successfully redeemed " ..cfg.items[result[1].item].name.. "!"})
                XTRA.sendWebhook('store-redeem', "XTRA Store Logs", "> Player PermID: **" .. user_id .. "**\n> Item: **" .. cfg.items[result[1].item].name .. "**")
                TriggerEvent("XTRA:refreshGaragePermissions",source)
                TriggerClientEvent("XTRA:storeDrawEffects", source)
                Wait(250)
                TriggerClientEvent("XTRA:storeCloseMenu",source)
                ForceRefresh(source)
            end
        end
    end)
end)

RegisterServerEvent("XTRA:startSellStoreItem", function(code)
    local source = source
    local user_id = XTRA.getUserId(source)

    exports['xtra']:execute('SELECT * FROM xtra_stores WHERE code = @code', {code = code}, function(result)
        if #result > 0 then
            local itemname = cfg.items[result[1].item].name

            XTRAclient.getNearestPlayers(source, {5}, function(players)
                local usrList = ""
                for a, b in pairs(players) do
                    usrList = usrList .. "[" .. a .. "]" .. XTRA.getPlayerName(a) .. " | "
                end

                XTRA.prompt(source, "Sell to: " .. usrList, "", function(source, player_id)  -- Change playersource to player_id
                    if player_id ~= nil and player_id ~= "" then
                        player_id = tonumber(player_id)

                        if players[player_id] then
                            XTRA.prompt(source, "Amount:", "", function(source, amount)
                                if tonumber(amount) and tonumber(amount) >= 0 then
                                    local buyer_id = XTRA.getUserId(player_id)  -- Get the buyer's user_id

                                    XTRAclient.notify(source, {"~g~Offer sent for " .. XTRA.getPlayerName(player_id) .. " to buy " .. itemname .. " for £" .. getMoneyStringFormatted(tonumber(amount)) .. "!"})

                                    XTRA.request(player_id, XTRA.getPlayerName(source) .. " is selling you a " .. itemname .. " for £" .. getMoneyStringFormatted(tonumber(amount)), 30, function(player_id, ok)
                                        if ok then
                                            if XTRA.tryFullPayment(buyer_id, tonumber(amount)) then
                                                exports['xtra']:execute("UPDATE xtra_stores SET user_id = @user_id WHERE code = @code", {user_id = buyer_id, code = code})
                                                exports['xtra']:execute("UPDATE xtra_stores SET date = @date WHERE code = @code", {date = os.date("%d/%m/%Y"), code = code})
                                                exports['xtra']:execute("UPDATE xtra_stores SET seller_id = @seller_id WHERE code = @code", {seller_id = user_id, code = code})
                                                Wait(250)
                                                TriggerClientEvent("XTRA:storeCloseMenu", source)
                                                ForceRefresh(source)
                                                TriggerClientEvent("XTRA:storeCloseMenu", player_id)
                                                ForceRefresh(player_id)
                                                XTRA.giveBankMoney(user_id, tonumber(amount))
                                                XTRAclient.notify(source, {"~g~Successfully sold " .. itemname .. " for £" .. getMoneyStringFormatted(tonumber(amount)) .. "!"})
                                                XTRAclient.notify(player_id, {"~g~Successfully bought " .. itemname .. " for £" .. getMoneyStringFormatted(tonumber(amount)) .. "!"})
                                                XTRA.sendWebhook('store-sell', "XTRA Store Logs", "> Seller PermID: **" .. user_id .. "**\n> Buyer PermID: **" .. buyer_id .. "**\n> Item: **" .. itemname .. "**\n> Amount: **£" .. getMoneyStringFormatted(tonumber(amount)) .. "**")
                                            else
                                                XTRAclient.notify(source, {"~r~" .. XTRA.getPlayerName(player_id) .. " does not have enough money!"})
                                                XTRAclient.notify(player_id, {"~r~You do not have enough money!"})
                                            end
                                        else
                                            XTRAclient.notify(source, {"~r~" .. XTRA.getPlayerName(player_id) .. " declined your offer!"})
                                            XTRAclient.notify(player_id, {"~r~You declined the offer!"})
                                        end
                                    end)
                                else
                                    XTRAclient.notify(source, {"~r~Invalid amount!"})
                                end
                            end)
                        else
                            XTRAclient.notify(source, {"~r~Invalid player!"})
                        end
                    else
                        XTRAclient.notify(source, {"~r~Invalid player!"})
                    end
                end)
            end)
        else
            XTRAclient.notify(source, {"~r~Invalid code!"})
        end
    end)
end)





RegisterCommand('cheatunban', function(source, args)
    if source ~= 0 then return end; -- Stops anyone other than the console running it.
    if tonumber(args[1])  then
        local userid = tonumber(args[1])
        XTRA.setBanned(userid,false)
        XTRA.sendWebhook('store-unban', "XTRA Store Unban Logs", "> Player PermID: **" .. userid .. "**")
        print('Unbanned user: ' .. userid )
    else 
        print('Incorrect usage: unban [permid]')
    end
end)
RegisterCommand('storeunban', function(source, args)
    if source ~= 0 then return end -- Stops anyone other than the console running it.

    if tonumber(args[1]) then
        local userid = tonumber(args[1])

        exports['xtra']:execute('SELECT banreason FROM xtra_users WHERE id = ?', {userid}, function(result)
            if result[1] and result[1].banreason and string.find(result[1].banreason, "cheating") then
                -- The ban reason includes "cheating", so we won't unban the user.
                print('User with PermID ' .. userid .. ' has a cheating ban reason. Not unbanning.')
            else
                -- The ban reason does not include "cheating", so we unban the user.
                exports['xtra']:execute('UPDATE xtra_users SET banned = 0 WHERE id = ?', {userid})
                XTRA.sendWebhook('store-unban', "XTRA Cheating Unban Logs", "> Player PermID: **" .. userid .. "**")
                print('Unbanned user: ' .. userid)
            end
        end)
    else
        print('Incorrect usage: unban [permid]')
    end
end)

RegisterCommand("additem", function(source, args, raw)
    if source == 0 then
        local user_id, item = args[1], args[2]
        if user_id and item then
            local code1, code2 = generateUUID("Items", 4, "alphanumeric"), generateUUID("Items", 4, "alphanumeric")
            local code = string.upper(code1 .. "-" .. code2)
            local xtra = exports['xtra']
            local currentDate = os.date("%d/%m/%Y")
            local insertQuery = "INSERT INTO xtra_stores (code, item, user_id, date) VALUES (@code, @item, @user_id, @date)"
            local queryParams = {code = code, item = item, user_id = user_id, date = currentDate}
            
            print("Added item: " .. item .. " to user: " .. user_id)
            XTRA.sendWebhook('donation', "XTRA Donation Logs", "> Player PermID: **"..user_id.."**\n> Code: **"..code.."**\n> Item: **"..item.."**")
            
            xtra:execute(insertQuery, queryParams)
        else
            print("Usage: additem [user_id] [item]")
        end
    end
end)

RegisterCommand("storelog", function(source, args)
    local user_id = args[1] or "N/A"
    local transaction = args[2] or "N/A"
    local price = args[3] or "N/A"
    local packageName = args[4] or "N/A"
    local email = args[5] or "N/A"
    if price == "£0.00" then
        price = "Free"
    end
    XTRA.sendWebhook('tebex', "XTRA Tebex Logs", "> Player Perm ID: **"..user_id.."**\n> Transaction ID: **"..transaction.."**\n> Price: **£"..price.."**\n> Package: **"..packageName.."**\n> Email: **"..email.."**")
end, true)
RegisterCommand("storelogchargeback", function(source, args)
    local user_id = args[1]
    local transaction = args[2]
    local price = args[3]
    local packageName = args[4]
    local email = args[5]
    XTRA.setBanned(user_id,true,"perm","1.8 Chargeback","XTRA Store",transaction)
    XTRA.sendWebhook('tebex', "XTRA Tebex Charge Back Logs", "> Player Perm ID: **"..user_id.."**\n> Transaction: **"..transaction.."**\n> Price: **£"..price.."**\n> Package: **"..packageName.."**\n> Email: **"..email.."**\n > User Banned: **1.8 Chargeback**")
end, true)
