local coinflipTables = {
    [1] = false,
    [2] = false,
    [5] = false,
    [6] = false,
}

local linkedTables = {
    [1] = 2,
    [2] = 1,
    [5] = 6,
    [6] = 5,
}

local coinflipGameInProgress = {}
local coinflipGameData = {}

local betId = 0

function giveChips(source,amount)
    local user_id = XTRA.getUserId(source)
    MySQL.execute("casinochips/add_chips", {user_id = user_id, amount = amount})
    TriggerClientEvent('XTRA:chipsUpdated', source)
end

AddEventHandler('playerDropped', function (reason)
    local source = source
    for k,v in pairs(coinflipTables) do
        if v == source then
            coinflipTables[k] = false
            coinflipGameData[k] = nil
        end
    end
end)

RegisterNetEvent("XTRA:requestCoinflipTableData")
AddEventHandler("XTRA:requestCoinflipTableData", function()   
    local source = source
    TriggerClientEvent("XTRA:sendCoinflipTableData",source,coinflipTables)
end)

RegisterNetEvent("XTRA:requestSitAtCoinflipTable")
AddEventHandler("XTRA:requestSitAtCoinflipTable", function(chairId)
    local source = source
    if source ~= nil then
        for k,v in pairs(coinflipTables) do
            if v == source then
                coinflipTables[k] = false
                return
            end
        end
        coinflipTables[chairId] = source
        local currentBetForThatTable = coinflipGameData[chairId]
        TriggerClientEvent("XTRA:sendCoinflipTableData",-1,coinflipTables)
        TriggerClientEvent("XTRA:sitAtCoinflipTable",source,chairId,currentBetForThatTable)
    end
end)

RegisterNetEvent("XTRA:leaveCoinflipTable")
AddEventHandler("XTRA:leaveCoinflipTable", function(chairId)
    local source = source
    if source ~= nil then 
        for k,v in pairs(coinflipTables) do 
            if v == source then 
                coinflipTables[k] = false
                coinflipGameData[k] = nil
            end
        end
        TriggerClientEvent("XTRA:sendCoinflipTableData",-1,coinflipTables)
    end
end)

RegisterNetEvent("XTRA:proposeCoinflip")
AddEventHandler("XTRA:proposeCoinflip",function(betAmount)
    local source = source
    local user_id = XTRA.getUserId(source)
    betId = betId+1
    if betAmount ~= nil then 
        if coinflipGameData[betId] == nil then
            coinflipGameData[betId] = {}
        end
        if not coinflipGameInProgress[betId] then
            if tonumber(betAmount) then
                betAmount = tonumber(betAmount)
                if betAmount >= 100000 then
                    MySQL.query("casinochips/get_chips", {user_id = user_id}, function(rows, affected)
                        chips = rows[1].chips
                        if chips >= betAmount then
                            TriggerClientEvent('XTRA:chipsUpdated', source)
                            if coinflipGameData[betId][source] == nil then
                                coinflipGameData[betId][source] = {}
                            end
                            coinflipGameData[betId] = {betId = betId, betAmount = betAmount, user_id = user_id}
                            for k,v in pairs(coinflipTables) do
                                if v == source then
                                    TriggerClientEvent('XTRA:addCoinflipProposal', source, betId, {betId = betId, betAmount = betAmount, user_id = user_id})
                                    if coinflipTables[linkedTables[k]] then
                                        TriggerClientEvent('XTRA:addCoinflipProposal', coinflipTables[linkedTables[k]], betId, {betId = betId, betAmount = betAmount, user_id = user_id})
                                    end
                                end
                            end
                            XTRAclient.notify(source,{"~g~Bet placed: " .. getMoneyStringFormatted(betAmount) .. " chips."})
                        else 
                            XTRAclient.notify(source,{"Not enough chips!"})
                        end
                    end)
                else
                    XTRAclient.notify(source,{'Minimum bet at this table is £100,000.'})
                    return
                end
            end
        end
    else
       XTRAclient.notify(source,{"Error betting!"})
    end
end)

RegisterNetEvent("XTRA:requestCoinflipTableData")
AddEventHandler("XTRA:requestCoinflipTableData", function()   
    local source = source
    TriggerClientEvent("XTRA:sendCoinflipTableData",source,coinflipTables)
end)

RegisterNetEvent("XTRA:cancelCoinflip")
AddEventHandler("XTRA:cancelCoinflip", function()   
    local source = source
    local user_id = XTRA.getUserId(source)
    for k,v in pairs(coinflipGameData) do
        if v.user_id == user_id then
            coinflipGameData[k] = nil
            TriggerClientEvent("XTRA:cancelCoinflipBet",-1,k)
        end
    end
end)

RegisterNetEvent("XTRA:acceptCoinflip")
AddEventHandler("XTRA:acceptCoinflip", function(gameid)   
    local source = source
    local user_id = XTRA.getUserId(source)
    for k,v in pairs(coinflipGameData) do
        if v.betId == gameid then
            MySQL.query("casinochips/get_chips", {user_id = user_id}, function(rows, affected)
                chips = rows[1].chips
                if chips >= v.betAmount then
                    MySQL.execute("casinochips/remove_chips", {user_id = user_id, amount = v.betAmount})
                    TriggerClientEvent('XTRA:chipsUpdated', source)
                    MySQL.execute("casinochips/remove_chips", {user_id = v.user_id, amount = v.betAmount})
                    TriggerClientEvent('XTRA:chipsUpdated', XTRA.getUserSource(v.user_id))
                    local coinFlipOutcome = math.random(0,1)
                    if coinFlipOutcome == 0 then
                        local game = {amount = v.betAmount, winner = XTRA.GetPlayerName(user_id), loser = XTRA.getPlayerName(XTRA.getUserSource(v.user_id))}
                        TriggerClientEvent('XTRA:coinflipOutcome', source, true, game)
                        TriggerClientEvent('XTRA:coinflipOutcome', XTRA.getUserSource(v.user_id), false, game)
                        Wait(10000)
                        MySQL.execute("casinochips/add_chips", {user_id = user_id, amount = v.betAmount*2})
                        TriggerClientEvent('XTRA:chipsUpdated', source)
                        if v.betAmount > 10000000 then
                            TriggerClientEvent('chatMessage', -1, "^7Coin Flip |", { 124, 252, 0 }, ""..XTRA.GetPlayerName(user_id).." has WON a coin flip against "..XTRA.getPlayerName(XTRA.getUserSource(v.user_id)).." for "..getMoneyStringFormatted(v.betAmount).." chips!")
                        end
                        XTRA.sendWebhook('coinflip-bet',"XTRA Coinflip Logs", "> Winner Name: **"..XTRA.GetPlayerName(user_id).."**\n> Winner TempID: **"..source.."**\n> Winner PermID: **"..user_id.."**\n> Loser Name: **"..XTRA.getPlayerName(XTRA.getUserSource(v.user_id)).."**\n> Loser TempID: **"..XTRA.getUserSource(v.user_id).."**\n> Loser PermID: **"..v.user_id.."**\n> Amount: **"..getMoneyStringFormatted(v.betAmount).."**")
                    else
                        local game = {amount = v.betAmount, winner = XTRA.getPlayerName(XTRA.getUserSource(v.user_id)), loser = XTRA.GetPlayerName(user_id)}
                        TriggerClientEvent('XTRA:coinflipOutcome', source, false, game)
                        TriggerClientEvent('XTRA:coinflipOutcome', XTRA.getUserSource(v.user_id), true, game)
                        Wait(10000)
                        MySQL.execute("casinochips/add_chips", {user_id = v.user_id, amount = v.betAmount*2})
                        TriggerClientEvent('XTRA:chipsUpdated', XTRA.getUserSource(v.user_id))
                        if v.betAmount > 10000000 then
                            TriggerClientEvent('chatMessage', -1, "^7Coin Flip |", { 124, 252, 0 }, ""..XTRA.GetPlayerName(user_id).." has WON a coin flip against "..XTRA.getPlayerName(XTRA.getUserSource(v.user_id)).." for "..getMoneyStringFormatted(v.betAmount).." chips!")
                        end
                        XTRA.sendWebhook('coinflip-bet',"XTRA Coinflip Logs", "> Winner Name: **"..XTRA.getPlayerName(XTRA.getUserSource(v.user_id)).."**\n> Winner TempID: **"..XTRA.getUserSource(v.user_id).."**\n> Winner PermID: **"..v.user_id.."**\n> Loser Name: **"..XTRA.GetPlayerName(user_id).."**\n> Loser TempID: **"..source.."**\n> Loser PermID: **"..user_id.."**\n> Amount: **"..getMoneyStringFormatted(v.betAmount).."**")
                    end
                else 
                    XTRAclient.notify(source,{"Not enough chips!"})
                end
            end)
        end
    end
end)

RegisterCommand('tables', function(source)
    print(json.encode(coinflipTables))
end)