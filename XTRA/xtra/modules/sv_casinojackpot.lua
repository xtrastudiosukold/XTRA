local jackpotChairs = {
    [0] = false,
    [1] = false,
    [2] = false,
    [3] = false,
    [4] = false,
    [5] = false,
    [6] = false,
    [7] = false,
    [8] = false,
    [9] = false,
    [10] = false,
    [11] = false,
    [12] = false,
    [13] = false,
    [14] = false,
    [15] = false,
}
local currentJackpotTotal = 0
local currentJackpotBets = {}
local numJackpotBets = 0
local currentJackpotInProgress = false

RegisterNetEvent("XTRA:requestJackpotChairData")
AddEventHandler("XTRA:requestJackpotChairData", function()   
    local source = source
    TriggerClientEvent('XTRA:sendJackpotChairData', source, jackpotChairs)
end)

RegisterNetEvent("XTRA:requestSitAtJackpot")
AddEventHandler("XTRA:requestSitAtJackpot", function(chair)   
    local source = source
    local user_id = XTRA.getUserId(source)
    if jackpotChairs[chair] == false then
        jackpotChairs[chair] = user_id
        TriggerClientEvent("XTRA:sitAtJackpotChair", source, chair)
    end
end)

RegisterNetEvent("XTRA:leaveJackpotChair")
AddEventHandler("XTRA:leaveJackpotChair", function()   
    local source = source
    local user_id = XTRA.getUserId(source)
    for k,v in pairs(jackpotChairs) do
        if v == user_id then
            jackpotChairs[k] = false
        end
    end
end)

RegisterNetEvent("XTRA:setJackpotBet")
AddEventHandler("XTRA:setJackpotBet", function(betAmount)   
    local source = source
    local user_id = XTRA.getUserId(source)
    if not currentJackpotInProgress then
        MySQL.query("casinochips/get_chips", {user_id = user_id}, function(rows, affected)
            chips = rows[1].chips
            if chips >= betAmount then
                MySQL.execute("casinochips/remove_chips", {user_id = user_id, amount = betAmount})
                currentJackpotBets[user_id] = {user_id = user_id, colour = {r = math.random(0,255), g = math.random(0,255), b = math.random(0,255), a = 255}, betAmount = betAmount, tickets_start = currentJackpotTotal, tickets_end = currentJackpotTotal + betAmount}
                currentJackpotTotal = currentJackpotTotal + betAmount
                numJackpotBets = numJackpotBets + 1
                TriggerClientEvent("XTRA:updateTotalPot", -1, currentJackpotTotal)
                TriggerClientEvent('XTRA:successJackpotBet', source)
                TriggerClientEvent('XTRA:newJackpotBet', -1, currentJackpotBets[user_id])
                TriggerClientEvent('XTRA:chipsUpdated', source)
                for k,v in pairs(currentJackpotBets) do
                    if XTRA.getUserSource(k) ~= nil then
                        TriggerClientEvent("XTRA:updatePlayerWinChance", XTRA.getUserSource(k), (v.betAmount/currentJackpotTotal)*100)
                    end
                end
            else 
                XTRAclient.notify(source,{"Not enough chips!"})
            end
        end)
    else
        XTRAclient.notify(source,{"Please wait for the next Jackpot."})
    end
end)

local winner = nil
local winnerName = nil
local winnerBetPercentage = nil
local winnerTicketsBought = nil
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if numJackpotBets >= 2 and not currentJackpotInProgress then
            TriggerClientEvent('XTRA:beginJackpot', -1)
            currentJackpotInProgress = true
            Wait(60000)
            local winningTicket = math.random(1, currentJackpotTotal)
            for k,v in pairs(currentJackpotBets) do
                if winningTicket >= v.tickets_start and winningTicket <= v.tickets_end then
                    winner = v.user_id
                    winnerName = XTRA.GetPlayerName(winner)
                    winnerBetPercentage = (v.betAmount/currentJackpotTotal)*100
                    winnerTicketsBought = v.betAmount
                end
            end
            TriggerClientEvent('XTRA:rollJackpot', -1, winner, winnerTicketsBought, winnerName, winnerBetPercentage, winner)
        end
    end
end)

RegisterNetEvent("XTRA:waitingOnWinConfirm")
AddEventHandler("XTRA:waitingOnWinConfirm", function()   
    local source = source
    local user_id = XTRA.getUserId(source)
    if user_id == winner then
        MySQL.execute("casinochips/add_chips", {user_id = winner, amount = currentJackpotTotal})
        TriggerClientEvent('XTRA:chipsUpdated', source)
        Wait(10000)
        TriggerClientEvent("XTRA:cleanupJackpot", -1)
        currentJackpotTotal = 0
        currentJackpotBets = {}
        winner = nil
        winnerName = nil
        winnerBetPercentage = nil
        winnerTicketsBought = nil
        currentJackpotInProgress = false
    end
end)