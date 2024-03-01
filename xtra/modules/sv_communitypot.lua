RegisterServerEvent("XTRA:getCommunityPotAmount")
AddEventHandler("XTRA:getCommunityPotAmount", function()
    local playerSource = source  -- Make sure this is a valid player identifier
    local user_id = XTRA.getUserId(playerSource)
    exports['xtra']:execute("SELECT value FROM xtra_community_pot", function(potbalance)
        if potbalance and potbalance[1] then
            TriggerClientEvent('XTRA:gotCommunityPotAmount', playerSource, tonumber(potbalance[1].value))
        else
            exports['xtra']:execute("INSERT INTO xtra_community_pot (value) VALUES (?)", {0})
        end
    end)    
end)

RegisterServerEvent("XTRA:tryDepositCommunityPot")
AddEventHandler("XTRA:tryDepositCommunityPot", function(amount)
    local source = source
    local user_id = XTRA.getUserId(source)
    local amount = tonumber(amount)
    if XTRA.hasPermission(user_id, 'admin.managecommunitypot') and amount and amount > 0 then
        local potbal = exports["xtra"]:executeSync("SELECT value FROM xtra_community_pot")
        if potbal and potbal[1] then
            local potbalance = tonumber(potbal[1].value)
            if XTRA.tryFullPayment(user_id, amount) then
                local newpotbalance = potbalance + amount
                exports['xtra']:execute("UPDATE xtra_community_pot SET value = ?", {newpotbalance})
                TriggerClientEvent('XTRA:gotCommunityPotAmount', source, newpotbalance)
                XTRA.sendWebhook('com-pot', 'XTRA Community Pot Logs', "> Admin Name: **"..XTRA.GetPlayerName(user_id).."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..user_id.."**\n> Type: **Deposit**\n> Amount: £**"..getMoneyStringFormatted(amount).."**")
            end
        end
    end
end)

RegisterServerEvent("XTRA:tryWithdrawCommunityPot")
AddEventHandler("XTRA:tryWithdrawCommunityPot", function(amount)
    amount = tonumber(amount)
    if amount and amount > 0 then
        local user_id = XTRA.getUserId(source)
        if XTRA.hasPermission(user_id, 'admin.managecommunitypot') then
            exports['xtra']:execute("SELECT value FROM xtra_community_pot", function(potbalance)
                if potbalance and potbalance[1] and tonumber(potbalance[1].value) >= amount then
                    local newpotbalance = tonumber(potbalance[1].value) - amount
                    exports['xtra']:execute("UPDATE xtra_community_pot SET value = ?", {newpotbalance})
                    TriggerClientEvent('XTRA:gotCommunityPotAmount', source, newpotbalance)
                    XTRA.giveMoney(user_id, amount)
                    XTRA.sendWebhook('com-pot', 'XTRA Community Pot Logs', "> Admin Name: **"..XTRA.GetPlayerName(user_id).."**\n> Admin TempID: **"..source.."**\n> Admin PermID: **"..user_id.."**\n> Type: **Withdraw**\n> Amount: £**"..getMoneyStringFormatted(amount).."**")
                end
            end)
        end
    end
end)

AddEventHandler("XTRA:addToCommunityPot", function(amount)
    amount = tonumber(amount)
    if amount and amount > 0 then
        exports['xtra']:execute("SELECT value FROM xtra_community_pot", function(potbalance)
            if potbalance and potbalance[1] then
                local newpotbalance = tonumber(potbalance[1].value) + amount
                exports['xtra']:execute("UPDATE xtra_community_pot SET value = ?", {newpotbalance})
            end
        end)
    end
end)

function getMoneyStringFormatted(cashString)
    local i, j, minus, int = tostring(cashString):find('([-]?)(%d+)%.?%d*')
    
    if int == nil then 
        return cashString
    else
        -- reverse the int-string and append a comma to all blocks of 3 digits
        int = int:reverse():gsub("(%d%d%d)", "%1,")
  
        -- reverse the int-string back, remove an optional comma, and put the optional minus back
        return minus .. int:reverse():gsub("^,", "")
    end
end
