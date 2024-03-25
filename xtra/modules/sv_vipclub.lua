MySQL.createCommand("subscription/set_plushours","UPDATE xtra_subscriptions SET plushours = @plushours WHERE user_id = @user_id")
MySQL.createCommand("subscription/set_plathours","UPDATE xtra_subscriptions SET plathours = @plathours WHERE user_id = @user_id")
MySQL.createCommand("subscription/set_lastused","UPDATE xtra_subscriptions SET last_used = @last_used WHERE user_id = @user_id")
MySQL.createCommand("subscription/get_subscription","SELECT * FROM xtra_subscriptions WHERE user_id = @user_id")
MySQL.createCommand("subscription/get_all_subscriptions","SELECT * FROM xtra_subscriptions")
MySQL.createCommand("subscription/add_id", "INSERT IGNORE INTO xtra_subscriptions SET user_id = @user_id, plushours = 0, plathours = 0, last_used = ''")

AddEventHandler("playerJoining", function()
    local user_id = XTRA.getUserId(source)
    MySQL.execute("subscription/add_id", {user_id = user_id})
end)

function XTRA.getSubscriptions(user_id,cb)
    MySQL.query("subscription/get_subscription", {user_id = user_id}, function(rows, affected)
        if #rows > 0 then
           cb(true, rows[1].plushours, rows[1].plathours, rows[1].last_used)
        else
            cb(false)
        end
    end)
end

RegisterNetEvent("XTRA:setPlayerSubscription")
AddEventHandler("XTRA:setPlayerSubscription", function(playerid, subtype)
    local user_id = XTRA.getUserId(source)
    local player = XTRA.getUserSource(user_id)
    if XTRA.hasGroup(user_id, "Founder") then
        XTRA.prompt(player,"Number of days ","",function(player, hours)
            if tonumber(hours) and tonumber(hours) >= 0 then
                hours = hours * 24
                if subtype == "Plus" then
                    MySQL.execute("subscription/set_plushours", {user_id = playerid, plushours = hours})
                elseif subtype == "Platinum" then
                    MySQL.execute("subscription/set_plathours", {user_id = playerid, plathours = hours})
                end
                TriggerClientEvent('XTRA:userSubscriptionUpdated', player)
            else
                XTRAclient.notify(player,{"~r~Number of days must be a number."})
            end
        end)
    else
        TriggerEvent("XTRA:acBan", user_id, 11, XTRA.GetPlayerName(user_id), player, 'Trigger Set Player Subscription')
    end
end)

RegisterNetEvent("XTRA:getPlayerSubscription")
AddEventHandler("XTRA:getPlayerSubscription", function(playerid)
    local user_id = XTRA.getUserId(source)
    local player = XTRA.getUserSource(user_id)
    if playerid ~= nil then
        XTRA.getSubscriptions(playerid, function(cb, plushours, plathours)
            if cb then
                TriggerClientEvent('XTRA:getUsersSubscription', player, playerid, plushours, plathours)
            else
                XTRAclient.notify(player, {"~r~Player not found."})
            end
        end)
    else
        XTRA.getSubscriptions(user_id, function(cb, plushours, plathours)
            if cb then
                TriggerClientEvent('XTRA:setVIPClubData', player, plushours, plathours)
            end
        end)
    end
end)

RegisterNetEvent("XTRA:beginSellSubscriptionToPlayer")
AddEventHandler("XTRA:beginSellSubscriptionToPlayer", function(subtype)
    local user_id = XTRA.getUserId(source)
    local player = XTRA.getUserSource(user_id)
    XTRAclient.getNearestPlayers(player,{15},function(nplayers) --get players nearby
        usrList = ""
        for k, v in pairs(nplayers) do
            usrList = usrList .. "[" .. XTRA.getUserId(k) .. "]" .. XTRA.GetPlayerName(XTRA.getUserId(k)) .. " | " --add to list
        end
        if usrList ~= "" then
            XTRA.prompt(player,"Players Nearby: " .. usrList .. "","",function(player, target_id) --ask for id
                target_id = target_id
                if target_id ~= nil and target_id ~= "" then --validation
                    local target = XTRA.getUserSource(tonumber(target_id)) --get source of the new owner id
                    if target ~= nil then
                        XTRA.prompt(player,"Number of days ","",function(player, hours) -- ask for number of hours
                            if tonumber(hours) and tonumber(hours) > 0 then
                                MySQL.query("subscription/get_subscription", {user_id = user_id}, function(rows, affected)
                                    sellerplushours = rows[1].plushours
                                    sellerplathours = rows[1].plathours
                                    if (subtype == 'Plus' and sellerplushours >= tonumber(hours)*24) or (subtype == 'Platinum' and sellerplathours >= tonumber(hours)*24) then
                                        XTRA.prompt(player,"Price £: ","",function(player, amount) --ask for price
                                            if tonumber(amount) and tonumber(amount) > 0 then
                                                XTRA.request(target,XTRA.GetPlayerName(user_id).." wants to sell: " ..hours.. " days of "..subtype.." subscription for £"..getMoneyStringFormatted(amount), 30, function(target,ok) --request player if they want to buy sub
                                                    if ok then --bought
                                                        MySQL.query("subscription/get_subscription", {user_id = XTRA.getUserId(target)}, function(rows, affected)
                                                            if subtype == "Plus" then
                                                                if XTRA.tryFullPayment(XTRA.getUserId(target),tonumber(amount)) then
                                                                    MySQL.execute("subscription/set_plushours", {user_id = XTRA.getUserId(target), plushours = rows[1].plushours + tonumber(hours)*24})
                                                                    MySQL.execute("subscription/set_plushours", {user_id = user_id, plushours = sellerplushours - tonumber(hours)*24})
                                                                    XTRAclient.notify(player,{'~g~You have sold '..hours..' days of '..subtype..' subscription to '..XTRA.GetPlayerName(XTRA.getUserId(target))..' for £'..amount})
                                                                    XTRAclient.notify(target, {'~g~'..XTRA.GetPlayerName(user_id)..' has sold '..hours..' days of '..subtype..' subscription to you for £'..amount})
                                                                    XTRA.giveBankMoney(user_id,tonumber(amount))
                                                                    XTRA.updateInvCap(XTRA.getUserId(target), 40)
                                                                else
                                                                    XTRAclient.notify(player,{"~r~".. XTRA.GetPlayerName(XTRA.getUserId(target)).." doesn't have enough money!"}) --notify original owner
                                                                    XTRAclient.notify(target,{"~r~You don't have enough money!"}) --notify new owner
                                                                end
                                                            elseif subtype == "Platinum" then
                                                                if XTRA.tryFullPayment(XTRA.getUserId(target),tonumber(amount)) then
                                                                    MySQL.execute("subscription/set_plathours", {user_id = XTRA.getUserId(target), plathours = rows[1].plathours + tonumber(hours)*24})
                                                                    MySQL.execute("subscription/set_plathours", {user_id = user_id, plathours = sellerplathours - tonumber(hours)*24})
                                                                    XTRAclient.notify(player,{'~g~You have sold '..hours..' days of '..subtype..' subscription to '..XTRA.GetPlayerName(XTRA.getUserId(target))..' for £'..amount})
                                                                    XTRAclient.notify(target, {'~g~'..XTRA.GetPlayerName(user_id)..' has sold '..hours..' days of '..subtype..' subscription to you for £'..amount})
                                                                    XTRA.giveBankMoney(user_id,tonumber(amount))
                                                                    XTRA.updateInvCap(XTRA.getUserId(target), 50)
                                                                    TriggerClientEvent('XTRA:refreshGunStorePermissions', target)
                                                                else
                                                                    XTRAclient.notify(player,{"~r~".. XTRA.GetPlayerName(XTRA.getUserId(target)).." doesn't have enough money!"}) --notify original owner
                                                                    XTRAclient.notify(target,{"~r~You don't have enough money!"}) --notify new owner
                                                                end
                                                            end
                                                        end)
                                                    else
                                                        XTRAclient.notify(player,{"~r~"..XTRA.GetPlayerName(XTRA.getUserId(target)).." has refused to buy " ..hours.. " days of "..subtype.." subscription for £"..amount}) --notify owner that refused
                                                        XTRAclient.notify(target,{"~r~You have refused to buy " ..hours.. " days of "..subtype.." subscription for £"..amount}) --notify new owner that refused
                                                    end
                                                end)
                                            else
                                                XTRAclient.notify(player,{"~r~Price of subscription must be a number."})
                                            end
                                        end)
                                    else
                                        XTRAclient.notify(player,{"~r~You do not have "..hours.." days of "..subtype.."."})
                                    end
                                end)
                            else
                                XTRAclient.notify(player,{"~r~Number of days must be a number."})
                            end
                        end)
                    else
                        XTRAclient.notify(player,{"~r~That Perm ID seems to be invalid!"}) --couldnt find perm id
                    end
                else
                    XTRAclient.notify(player,{"~r~No Perm ID selected!"}) --no perm id selected
                end
            end)
        else
            XTRAclient.notify(player,{"~r~No players nearby!"}) --no players nearby
        end
    end)
end)

local usertable = {}
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000)
        MySQL.query("subscription/get_all_subscriptions", {}, function(rows, affected)
            if #rows > 0 then
                for k,v in pairs(rows) do
                    if v.plushours > 0 or v.plathours > 0 then
                        local user_id = v.user_id
                        local plushours = v.plushours
                        local plathours = v.plathours
                        local user = XTRA.getUserSource(user_id)
                        usertable[user_id] = {}
                        if plushours >= 1/60 then
                            usertable[user_id].plushours = plushours-1/60
                        else
                            usertable[user_id].plushours = 0
                        end
                        if plathours >= 1/60 then
                            usertable[user_id].plathours = plathours-1/60
                        else
                            usertable[user_id].plathours = 0
                        end
                        if user ~= nil then
                            TriggerClientEvent('XTRA:setVIPClubData', user, usertable[user_id].plushours, usertable[user_id].plathours)
                        end
                    end
                end
                SetAllUsers(usertable)
            end
        end)
    end
end)



function SetAllUsers(tbl)
    for A,B in pairs(tbl) do
        MySQL.execute("subscription/set_plushours", {user_id = A, plushours = B.plushours})
        MySQL.execute("subscription/set_plathours", {user_id = A, plathours = B.plathours})
        Wait(250)
    end
end

RegisterNetEvent("XTRA:claimWeeklyKit") -- need to add a thing for restricting the kit to actually being weekly
AddEventHandler("XTRA:claimWeeklyKit", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    XTRA.getSubscriptions(user_id, function(cb, plushours, plathours, last_used)
        if cb then
            if plathours >= 168 or plushours >= 168 then
                if last_used == '' or (os.time() >= tonumber(last_used+24*60*60*7)) then
                    if plathours >= 168 then
                        XTRA.giveInventoryItem(user_id, "Morphine", 5, true)
                        XTRA.giveInventoryItem(user_id, "Taco", 5, true)
                        XTRAclient.giveWeapons(source, {{['WEAPON_M1911'] = {ammo = 250}}, false})
                        XTRAclient.giveWeapons(source, {{['WEAPON_OLYMPIA'] = {ammo = 250}}, false})
                        XTRAclient.giveWeapons(source, {{['WEAPON_UMP45'] = {ammo = 250}}, false})
                        XTRAclient.setArmour(source, {100, true})
                        MySQL.execute("subscription/set_lastused", {user_id = user_id, last_used = os.time()})
                    elseif plushours >= 168 then
                        XTRA.giveInventoryItem(user_id, "Morphine", 5, true)
                        XTRA.giveInventoryItem(user_id, "Taco", 5, true)
                        XTRAclient.giveWeapons(source, {{['WEAPON_M1911'] = {ammo = 250}}, false})
                        XTRAclient.giveWeapons(source, {{['WEAPON_UMP45'] = {ammo = 250}}, false})
                        XTRAclient.setArmour(source, {100, true})
                        MySQL.execute("subscription/set_lastused", {user_id = user_id, last_used = os.time()})
                    else
                        XTRAclient.notify(source,{"~r~You need at least 1 week of subscription to redeem the kit."})
                    end
                else
                    XTRAclient.notify(source,{"~r~You can only claim your weekly kit once a week."})
                end
            else
                XTRAclient.notify(source,{"~r~You require at least 1 week of a subscription to claim a kit."})
            end
        end
    end)
end)
--exports['xtra']:execute("UPDATE xtra_staff_tickets SET ticket_count = 0")
RegisterCommand("redeemreset", function(source, args, rawCommand)
    local source = source
    if source == 0 then
        print('Resetting Redeemed Subscriptions')
        exports['xtra']:execute("UPDATE xtra_subscriptions SET redeemed = 0")
    else
        print("Error: You are not the console")
    end
end)


RegisterNetEvent("XTRA:fuelAllVehicles")
AddEventHandler("XTRA:fuelAllVehicles", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    XTRA.getSubscriptions(user_id, function(cb, plushours, plathours)
        if cb then
            if plushours > 0 or plathours > 0 then
                if XTRA.tryFullPayment(user_id,25000) then
                    exports["xtra"]:execute("UPDATE xtra_user_vehicles SET fuel_level = 100 WHERE user_id = @user_id", {user_id = user_id}, function() end)
                    TriggerClientEvent("XTRA:PlaySound", source, "money")
                    XTRAclient.notify(source,{"~g~Vehicles Refueled."})
                end
            end
        end
    end)
end)

RegisterCommand('redeem', function(source)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.checkForRole(user_id, '1173412751155138662') then
        MySQL.query("subscription/get_subscription", {user_id = user_id}, function(rows, affected)
            if #rows > 0 then
                local redeemed = rows[1].redeemed
                if redeemed == 0 then
                    exports["xtra"]:execute("UPDATE xtra_subscriptions SET redeemed = 1 WHERE user_id = @user_id", {user_id = user_id}, function() end)
                    XTRA.giveBankMoney(user_id, 1000000)
                    TriggerClientEvent('XTRA:smallAnnouncement', source, 'XTRA Studios', "You have redeemed your perks of £1,000,000 and 2 Week of Platinum Subscription!\n", 18, 10000)
                    MySQL.execute("subscription/set_plathours", {user_id = user_id, plathours = rows[1].plathours + 336})
                else
                    XTRAclient.notify(source, {'~r~You have already redeemed your subscription.'})
                end
            end
        end)
    else
        XTRAclient.notify(source, {'~r~You Have Not Boosted The Discord Server'})
    end
end)