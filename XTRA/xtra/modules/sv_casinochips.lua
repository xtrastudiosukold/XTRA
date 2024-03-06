MySQL.createCommand("casinochips/add_id", "INSERT IGNORE INTO xtra_casino_chips SET user_id = @user_id")
MySQL.createCommand("casinochips/get_chips","SELECT * FROM xtra_casino_chips WHERE user_id = @user_id")
MySQL.createCommand("casinochips/add_chips", "UPDATE xtra_casino_chips SET chips = (chips + @amount) WHERE user_id = @user_id")
MySQL.createCommand("casinochips/remove_chips", "UPDATE xtra_casino_chips SET chips = CASE WHEN ((chips - @amount)>0) THEN (chips - @amount) ELSE 0 END WHERE user_id = @user_id")


AddEventHandler("playerJoining", function()
    local user_id = XTRA.getUserId(source)
    MySQL.execute("casinochips/add_id", {user_id = user_id})
end)

RegisterNetEvent("XTRA:enterDiamondCasino")
AddEventHandler("XTRA:enterDiamondCasino", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    XTRA.setBucket(source, 777)
    MySQL.query("casinochips/get_chips", {user_id = user_id}, function(rows, affected)
        if #rows > 0 then
            TriggerClientEvent('XTRA:setDisplayChips', source, rows[1].chips)
            return
        end
    end)
end)

RegisterNetEvent("XTRA:exitDiamondCasino")
AddEventHandler("XTRA:exitDiamondCasino", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    XTRA.setBucket(source, 0)
end)

RegisterNetEvent("XTRA:getChips")
AddEventHandler("XTRA:getChips", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    MySQL.query("casinochips/get_chips", {user_id = user_id}, function(rows, affected)
        if #rows > 0 then
            TriggerClientEvent('XTRA:setDisplayChips', source, rows[1].chips)
            return
        end
    end)
end)

RegisterNetEvent("XTRA:buyChips")
AddEventHandler("XTRA:buyChips", function(amount)
    local source = source
    local user_id = XTRA.getUserId(source)
    if not amount then amount = XTRA.getBankMoney(user_id) end
    if XTRA.tryBankPayment(user_id, amount) then
        MySQL.execute("casinochips/add_chips", {user_id = user_id, amount = amount})
        TriggerClientEvent('XTRA:chipsUpdated', source)
        XTRA.sendWebhook('purchase-chips',"XTRA Chip Logs", "> Player Name: **"..XTRA.GetPlayerName(user_id).."**\n> Player TempID: **"..source.."**\n> Player PermID: **"..user_id.."**\n> Amount: **"..getMoneyStringFormatted(amount).."**")
        return
    else
        XTRAclient.notify(source,{"You don't have enough money."})
        return
    end
end)

local sellingChips = {}
RegisterNetEvent("XTRA:sellChips")
AddEventHandler("XTRA:sellChips", function(amount)
    local source = source
    local user_id = XTRA.getUserId(source)
    local chips = nil
    if not sellingChips[source] then
        sellingChips[source] = true
        MySQL.query("casinochips/get_chips", {user_id = user_id}, function(rows, affected)
            if #rows > 0 then
                local chips = rows[1].chips
                if not amount then amount = chips end
                if amount > 0 and chips > 0 and chips >= amount then
                    MySQL.execute("casinochips/remove_chips", {user_id = user_id, amount = amount})
                    TriggerClientEvent('XTRA:chipsUpdated', source)
                    XTRA.sendWebhook('sell-chips',"XTRA Chip Logs", "> Player Name: **"..XTRA.GetPlayerName(user_id).."**\n> Player TempID: **"..source.."**\n> Player PermID: **"..user_id.."**\n> Amount: **"..getMoneyStringFormatted(amount).."**")
                    XTRA.giveBankMoney(user_id, amount)
                else
                    XTRAclient.notify(source,{"You don't have enough chips."})
                end
                sellingChips[source] = nil
            end
        end)
    end
end)