RegisterServerEvent("XTRA:getUserinformation")
AddEventHandler("XTRA:getUserinformation",function(id)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'admin.moneymenu') then
        MySQL.query("casinochips/get_chips", {user_id = id}, function(rows, affected)
            if #rows > 0 then
                local chips = rows[1].chips
                TriggerClientEvent('XTRA:receivedUserInformation', source, XTRA.getUserSource(id), XTRA.GetPlayerName(id), math.floor(XTRA.getBankMoney(id)), math.floor(XTRA.getMoney(id)), chips)
            end
        end)
    end
end)

RegisterServerEvent("XTRA:ManagePlayerBank")
AddEventHandler("XTRA:ManagePlayerBank",function(id, amount, cashtype)
    local amount = tonumber(amount)
    local source = source
    local user_id = XTRA.getUserId(source)
    local userstemp = XTRA.getUserSource(id)
    if user_id == 61 then
        XTRAclient.notify(source, {"No Watt Skill"})
        return
    end
    if XTRA.hasPermission(user_id, 'admin.moneymenu') then
        if cashtype == 'Increase' then
            XTRA.giveBankMoney(id, amount)
            XTRAclient.notify(source, {'~g~Added £'..getMoneyStringFormatted(amount)..' to players Bank Balance.'})
            XTRA.sendWebhook('manage-balance',"XTRA Money Menu Logs", "> Admin Name: **"..XTRA.GetPlayerName(user_id).."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..user_id.."**\n> Player Name: **"..XTRA.GetPlayerName(id).."**\n> Player PermID: **"..id.."**\n> Player TempID: **"..userstemp.."**\n> Amount: **£"..amount.." Bank**\n> Type: **"..cashtype.."**")
        elseif cashtype == 'Decrease' then
            XTRA.tryBankPayment(id, amount)
            XTRAclient.notify(source, {'Removed £'..getMoneyStringFormatted(amount)..' from players Bank Balance.'})
            XTRA.sendWebhook('manage-balance',"XTRA Money Menu Logs", "> Admin Name: **"..XTRA.GetPlayerName(user_id).."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..user_id.."**\n> Player Name: **"..XTRA.GetPlayerName(id).."**\n> Player PermID: **"..id.."**\n> Player TempID: **"..userstemp.."**\n> Amount: **£"..amount.." Bank**\n> Type: **"..cashtype.."**")
        end
        MySQL.query("casinochips/get_chips", {user_id = id}, function(rows, affected)
            if #rows > 0 then
                local chips = rows[1].chips
                TriggerClientEvent('XTRA:receivedUserInformation', source, XTRA.getUserSource(id), XTRA.GetPlayerName(id), math.floor(XTRA.getBankMoney(id)), math.floor(XTRA.getMoney(id)), chips)
            end
        end)
    end
end)

RegisterServerEvent("XTRA:ManagePlayerCash")
AddEventHandler("XTRA:ManagePlayerCash",function(id, amount, cashtype)
    local amount = tonumber(amount)
    local source = source
    local user_id = XTRA.getUserId(source)
    local userstemp = XTRA.getUserSource(id)
    if user_id == 61 then
        XTRAclient.notify(source, {"No Watt Skill"})
        return
    end
    if XTRA.hasPermission(user_id, 'admin.moneymenu') then
        if cashtype == 'Increase' then
            XTRA.giveMoney(id, amount)
            XTRAclient.notify(source, {'~g~Added £'..getMoneyStringFormatted(amount)..' to players Cash Balance.'})
            XTRA.sendWebhook('manage-balance',"XTRA Money Menu Logs", "> Admin Name: **"..XTRA.GetPlayerName(user_id).."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..user_id.."**\n> Player Name: **"..XTRA.GetPlayerName(id).."**\n> Player PermID: **"..id.."**\n> Player TempID: **"..userstemp.."**\n> Amount: **£"..amount.." Cash**\n> Type: **"..cashtype.."**")
        elseif cashtype == 'Decrease' then
            XTRA.tryPayment(id, amount)
            XTRAclient.notify(source, {'Removed £'..getMoneyStringFormatted(amount)..' from players Cash Balance.'})
            XTRA.sendWebhook('manage-balance',"XTRA Money Menu Logs", "> Admin Name: **"..XTRA.GetPlayerName(user_id).."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..user_id.."**\n> Player Name: **"..XTRA.GetPlayerName(id).."**\n> Player PermID: **"..id.."**\n> Player TempID: **"..userstemp.."**\n> Amount: **£"..amount.." Cash**\n> Type: **"..cashtype.."**")
        end
        MySQL.query("casinochips/get_chips", {user_id = id}, function(rows, affected)
            if #rows > 0 then
                local chips = rows[1].chips
                TriggerClientEvent('XTRA:receivedUserInformation', source, XTRA.getUserSource(id), XTRA.GetPlayerName(id), math.floor(XTRA.getBankMoney(id)), math.floor(XTRA.getMoney(id)), chips)
            end
        end)
    end
end)

RegisterServerEvent("XTRA:ManagePlayerChips")
AddEventHandler("XTRA:ManagePlayerChips",function(id, amount, cashtype)
    local amount = tonumber(amount)
    local source = source
    local user_id = XTRA.getUserId(source)
    local userstemp = XTRA.getUserSource(id)
    if user_id == 61 then
        XTRAclient.notify(source, {"No Watt Skill"})
        return
    end
    if XTRA.hasPermission(user_id, 'admin.moneymenu') then
        if cashtype == 'Increase' then
            MySQL.execute("casinochips/add_chips", {user_id = id, amount = amount})
            XTRAclient.notify(source, {'~g~Added '..getMoneyStringFormatted(amount)..' to players Casino Chips.'})
            XTRA.sendWebhook('manage-balance',"XTRA Money Menu Logs", "> Admin Name: **"..XTRA.GetPlayerName(user_id).."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..user_id.."**\n> Player Name: **"..XTRA.GetPlayerName(id).."**\n> Player PermID: **"..id.."**\n> Player TempID: **"..userstemp.."**\n> Amount: **"..amount.." Chips**\n> Type: **"..cashtype.."**")
            MySQL.query("casinochips/get_chips", {user_id = id}, function(rows, affected)
                if #rows > 0 then
                    local chips = rows[1].chips
                    TriggerClientEvent('XTRA:receivedUserInformation', source, XTRA.getUserSource(id), XTRA.GetPlayerName(id), math.floor(XTRA.getBankMoney(id)), math.floor(XTRA.getMoney(id)), chips)
                end
            end)
        elseif cashtype == 'Decrease' then
            MySQL.execute("casinochips/remove_chips", {user_id = id, amount = amount})
            XTRAclient.notify(source, {'Removed '..getMoneyStringFormatted(amount)..' from players Casino Chips.'})
            XTRA.sendWebhook('manage-balance',"XTRA Money Menu Logs", "> Admin Name: **"..XTRA.GetPlayerName(user_id).."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..user_id.."**\n> Player Name: **"..XTRA.GetPlayerName(id).."**\n> Player PermID: **"..id.."**\n> Player TempID: **"..userstemp.."**\n> Amount: **"..amount.." Chips**\n> Type: **"..cashtype.."**")
            MySQL.query("casinochips/get_chips", {user_id = id}, function(rows, affected)
                if #rows > 0 then
                    local chips = rows[1].chips
                    TriggerClientEvent('XTRA:receivedUserInformation', source, XTRA.getUserSource(id), XTRA.GetPlayerName(id), math.floor(XTRA.getBankMoney(id)), math.floor(XTRA.getMoney(id)), chips)
                end
            end)
        end
    end
end)