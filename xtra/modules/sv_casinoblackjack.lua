MySQL = module("modules/MySQL")
MySQL.createCommand("casinochips/get_chips","SELECT * FROM xtra_casino_chips WHERE user_id = @user_id")
MySQL.createCommand("casinochips/add_chips", "UPDATE xtra_casino_chips SET chips = (chips + @amount) WHERE user_id = @user_id")
MySQL.createCommand("casinochips/remove_chips", "UPDATE xtra_casino_chips SET chips = (chips - @amount) WHERE user_id = @user_id")


local blackjackTables = {
    --[chairId] == false or source if taken
}

for i=0,127,1 do
    blackjackTables[i] = false
end

local blackjackGameInProgress = {}
local blackjackGameData = {}


function giveChips(source,amount)
    local user_id = XTRA.getUserId(source)
    MySQL.execute("casinochips/add_chips", {user_id = user_id, amount = amount})
    TriggerClientEvent('XTRA:chipsUpdated', source)
end

AddEventHandler('playerDropped', function (reason)
    local source = source
    for k,v in pairs(blackjackTables) do
        if v == source then
            blackjackTables[k] = false
        end
    end
end)

RegisterNetEvent("Blackjack:requestBlackjackTableData")
AddEventHandler("Blackjack:requestBlackjackTableData", function()
    local source = source
    TriggerClientEvent("Blackjack:sendBlackjackTableData",source,blackjackTables)
end)

RegisterNetEvent("Blackjack:requestSitAtBlackjackTable")
AddEventHandler("Blackjack:requestSitAtBlackjackTable", function(chairId)
    local source = source
    local user_id = XTRA.getUserId(source)
    if source ~= nil then
        for k,v in pairs(blackjackTables) do 
            if v == source then 
                blackjackTables[k] = false
                return
            end
        end
        if chairId > 7 then
            if XTRA.hasGroup(user_id,"Highroller") then
                blackjackTables[chairId] = source
                TriggerClientEvent("Blackjack:sendBlackjackTableData",-1,blackjackTables)
                TriggerClientEvent("Blackjack:sitAtBlackjackTable",source,chairId)
                return
            else
                XTRAclient.notify(source,{'You need to be a Highroller to sit at this table.'})
                return
            end
        end
        if chairId <= 7 then
            blackjackTables[chairId] = source
            TriggerClientEvent("Blackjack:sendBlackjackTableData",-1,blackjackTables)
            TriggerClientEvent("Blackjack:sitAtBlackjackTable",source,chairId)
            return
        end
    else
        TriggerClientEvent("blackjack:notify",source,"Error, can't sit you down.")
    end
end)

RegisterNetEvent("Blackjack:leaveBlackjackTable")
AddEventHandler("Blackjack:leaveBlackjackTable", function(chairId)
    local source = source
    if source ~= nil then 
        for k,v in pairs(blackjackTables) do 
            if v == source then 
                blackjackTables[k] = false
            end
        end
        TriggerClientEvent("Blackjack:sendBlackjackTableData",-1,blackjackTables)
    end
end)

RegisterNetEvent("Blackjack:setBlackjackBet")
AddEventHandler("Blackjack:setBlackjackBet",function(gameId,betAmount,chairId)
    local source = source
    local user_id = XTRA.getUserId(source)
    local chips = nil
    if gameId ~= nil and betAmount ~= nil and chairId ~= nil then 
        if blackjackGameData[gameId] == nil then
            blackjackGameData[gameId] = {}
        end
        if not blackjackGameInProgress[gameId] then
            if tonumber(betAmount) then
                betAmount = tonumber(betAmount)
                if betAmount > 0 then
                    MySQL.query("casinochips/get_chips", {user_id = user_id}, function(rows, affected)
                        chips = rows[1].chips
                        if chips >= betAmount then
                            if chairId < 8 and betAmount > 100000 then
                                XTRAclient.notify(source,{'Maximum bet at this table is £100,000.'})
                                return
                            end
                            if chairId > 7 and betAmount < 100000 then
                                XTRAclient.notify(source,{'Minimum bet at this table is £100,000.'})
                                return
                            end
                            MySQL.execute("casinochips/remove_chips", {user_id = user_id, amount = betAmount})
                            TriggerClientEvent('XTRA:chipsUpdated', source)
                            if blackjackGameData[gameId][source] == nil then
                                blackjackGameData[gameId][source] = {}
                            end
                            blackjackGameData[gameId][source][1] = betAmount
                            TriggerClientEvent("Blackjack:successBlackjackBet",source)
                            TriggerClientEvent("Blackjack:syncChipsPropBlackjack",-1,betAmount,chairId)
                            TriggerClientEvent("blackjack:notify",source,"~g~Bet placed: " .. getMoneyStringFormatted(tostring(betAmount)) .. " chips.")
                            XTRA.sendWebhook('blackjack-bet',"XTRA Blackjack Logs", "> Player Name: **"..XTRA.GetPlayerName(user_id).."**\n> Player TempID: **"..source.."**\n> Player PermID: **"..user_id.."**\n> Amount: **"..getMoneyStringFormatted(tostring(betAmount)).."**")
                        else 
                            TriggerClientEvent("blackjack:notify",source,"Not enough chips!")
                        end
                    end)
                end
            end
        end
    else
        TriggerClientEvent("blackjack:notify",source,"Error betting!")
    end
end)

RegisterNetEvent("Blackjack:hitBlackjack")
AddEventHandler("Blackjack:hitBlackjack",function(gameId,nextCardCount)
    local source = source
    if source ~= nil then 
        blackjackGameData[gameId][source][2][nextCardCount] = true
    end
end)

RegisterNetEvent("Blackjack:standBlackjack")
AddEventHandler("Blackjack:standBlackjack",function(gameId,nextCardCount)
    local source = source
    if source ~= nil and gameId ~= nil and nextCardCount ~= nil then 
        blackjackGameData[gameId][source][2][nextCardCount] = false
    end
end)

for i=0,31,1 do
    Citizen.CreateThread(function()
        math.randomseed(os.clock()*100000000000)
        while true do
            math.random() 
            math.random()
            math.random()
            local game_ready = false
            local players_ready = {}
            local tableId = i
            local chairIdInitial = i*4 --0-3,4-7,8-11,12-15
            local chairIdFinal = (i*4)+3
            for chairID=chairIdInitial,chairIdFinal do
                if blackjackTables[chairID] ~= false then
                    table.insert(players_ready,blackjackTables[chairID])
                    game_ready = true
                end
            end
            if game_ready then
                local gameId = math.random(1000,10000000)
                blackjackGameData[gameId] = {} --init game data
                blackjackGameInProgress[gameId] = false
                for k,v in pairs(players_ready) do 
                    local source = v
                    blackjackGameData[gameId][v] = {}
                    if source ~= nil then 
                        TriggerClientEvent("Blackjack:beginBetsBlackjack",source,gameId,tableId)
                    end
                end
                Wait(21000) --Wait 20 seconds for everyone to put bets up
                if blackjackGameData[gameId] ~= nil then
                    for k,v in pairs(blackjackGameData[gameId]) do
                        if v ~= nil then
                            local playerBetted = false 
                            betAmount = v[1]
                            if betAmount ~= nil and betAmount > 0 then 
                                playerBetted = true
                            end
                            if not playerBetted then
                                blackjackGameData[gameId][k] = nil
                            end
                        end
                    end
                    if not isTableEmpty(blackjackGameData[gameId]) then
                        blackjackGameInProgress[gameId] = true
                        for cardIndex=0,1,1 do
                            for chairID=chairIdInitial,chairIdFinal do
                                if blackjackTables[chairID] ~= false then
                                    local source = blackjackTables[chairID]
                                    if blackjackGameData[gameId] == nil then
                                        blackjackGameData[gameId] = {}
                                    end
                                    if blackjackGameData[gameId][source] == nil then
                                        blackjackGameData[gameId][source] = {}
                                    end
                                    if blackjackGameData[gameId][source][1] ~= nil then 
                                        if blackjackGameData[gameId][source][1] > 0 then     
                                            if blackjackGameData[gameId][source]["cardData"] == nil then 
                                                blackjackGameData[gameId][source]["cardData"] = {}
                                            end
                                            local randomCard = math.random(1,52)
                                            table.insert(blackjackGameData[gameId][source]["cardData"], randomCard)
                                            TriggerClientEvent("Blackjack:beginCardGiveOut",-1,gameId,blackjackGameData[gameId][source]["cardData"],chairID,cardIndex,getCurrentHand(gameId,source),tableId)
                                            Wait(3500)
                                        else 
                                            blackjackGameData[gameId][source] = nil
                                        end
                                    else 
                                        blackjackGameData[gameId][source] = nil
                                    end
                                end
                            end
                            if blackjackGameData[gameId]["dealer"] == nil then 
                                blackjackGameData[gameId]["dealer"] = {}
                            end
                            if blackjackGameData[gameId]["dealer"]["cardData"] == nil then 
                                blackjackGameData[gameId]["dealer"]["cardData"] = {}
                            end
                            if cardIndex == 0 then
                                local randomCard = math.random(1,52)
                                table.insert(blackjackGameData[gameId]["dealer"]["cardData"], randomCard) 
                                TriggerClientEvent("Blackjack:beginCardGiveOut",-1,gameId,blackjackGameData[gameId]["dealer"]["cardData"],gameId,cardIndex,getCurrentHand(gameId,"dealer"),tableId)
                            end
                            Wait(1500) --Wait between each initial give out card 
                        end
                        for chairID=chairIdInitial,chairIdFinal do
                            if blackjackTables[chairID] ~= false then
                                local source = blackjackTables[chairID]
                                if blackjackGameData[gameId][source] ~= nil then 
                                    local nextCardCount = 1
                                    local currentHand = getCurrentHand(gameId,source)
                                    if currentHand < 21 then
                                        TriggerClientEvent("Blackjack:standOrHit",-1,gameId,chairID,nextCardCount,tableId)                            
                                        blackjackGameData[gameId][source][2] = {}
                                        while nextCardCount >= 1 do
                                            secondsWaited = 0
                                            while blackjackGameData[gameId][source][2][nextCardCount] == nil and secondsWaited < 20 do 
                                                Wait(100)
                                                secondsWaited = secondsWaited + 0.1
                                            end
                                            if blackjackGameData[gameId][source][2][nextCardCount] == true then --if hit 
                                                nextCardCount = nextCardCount + 1
                                                local randomCard = math.random(1,52)
                                                table.insert(blackjackGameData[gameId][source]["cardData"], randomCard)
                                                TriggerClientEvent("Blackjack:singleCard",-1,gameId,randomCard,chairID,nextCardCount,getCurrentHand(gameId,source),tableId) 
                                                Wait(2000)
                                                local currentHand = getCurrentHand(gameId,source)
                                                if currentHand > 21 then
                                                    TriggerClientEvent("Blackjack:bustBlackjack",-1,chairID,tableId)
                                                    nextCardCount = 0
                                                    blackjackGameData[gameId][source]["status"] = "bust"
                                                    local lostAmount = blackjackGameData[gameId][source][1]
                                                    TriggerClientEvent("blackjack:notify",source,"-"..getMoneyStringFormatted(tostring(lostAmount)).." chips")
                                                    if lostAmount > 10000000 then
                                                        TriggerClientEvent('chatMessage', -1, "^7Diamond Casino |", { 128, 128, 128 }, ""..XTRA.GetPlayerName(user_id).." has LOST "..tostring(getMoneyStringFormatted(lostAmount)).." chips!", "alert")
                                                    end
                                                elseif currentHand < 21 then
                                                    TriggerClientEvent("Blackjack:standOrHit",-1,gameId,chairID,nextCardCount,tableId)  
                                                else
                                                    nextCardCount = 0
                                                    blackjackGameData[gameId][source]["status"] = "stand"
                                                end
                                            elseif blackjackGameData[gameId][source][2][nextCardCount] == false then --if stand
                                                nextCardCount = 0
                                                blackjackGameData[gameId][source]["status"] = "stand"
                                            else 
                                                nextCardCount = 0
                                                blackjackGameData[gameId][source]["status"] = "stand"
                                            end
                                        end
                                    else 
                                        blackjackGameData[gameId][source]["status"] = "stand"
                                    end
                                end
                                TriggerClientEvent("Blackjack:endStandOrHitPhase",-1,chairID,tableId) 
                            end
                        end
                        local randomCard = math.random(1,52)
                        table.insert(blackjackGameData[gameId]["dealer"]["cardData"], randomCard) 
                        TriggerClientEvent("Blackjack:beginCardGiveOut",-1,gameId,blackjackGameData[gameId]["dealer"]["cardData"],gameId,1,getCurrentHand(gameId,"dealer"),tableId)
                        Wait(2800)
                        dealerHand = getCurrentHand(gameId,"dealer")
                        TriggerClientEvent("Blackjack:flipDealerCard",-1,dealerHand,tableId,gameId)
                        Wait(2800)
                        local allPlayersHaveBusted = true
                        for k,v in pairs(blackjackGameData[gameId]) do 
                            local betStatus = v["status"]
                            if betStatus ~= nil then 
                                if betStatus == "stand" then 
                                    allPlayersHaveBusted = false
                                end
                            end
                        end
                        dealerHand = getCurrentHand(gameId,"dealer")
                        if not allPlayersHaveBusted then
                            if dealerHand >= 17 then
                            else
                                local nextCardCount = 2
                                local highestPlayerHand = 0
                                for k,v in pairs(blackjackGameData[gameId]) do 
                                    if k ~= "dealer" then 
                                        playerHand = getCurrentHand(gameId,k)
                                        if playerHand ~= nil then
                                            if playerHand > highestPlayerHand and playerHand <= 21 then
                                                highestPlayerHand = playerHand
                                            end
                                        end
                                    end
                                end
                                while dealerHand < 17 do
                                    local randomCard = math.random(1,52)
                                    table.insert(blackjackGameData[gameId]["dealer"]["cardData"], randomCard)
                                    TriggerClientEvent("Blackjack:singleDealerCard",-1,gameId,randomCard,nextCardCount,getCurrentHand(gameId,"dealer"),tableId)
                                    Wait(2800)
                                    nextCardCount = nextCardCount + 1
                                    dealerHand = getCurrentHand(gameId,"dealer")
                                end
                            end
                        end
                        for k,v in pairs(blackjackGameData[gameId]) do
                            if k ~= "dealer" then
                                local source = k
                                if blackjackGameData[gameId][source] ~= nil then
                                    if blackjackGameData[gameId][source]["status"] ~= "bust" then 
                                        local currentHand = getCurrentHand(gameId,source)
                                        if currentHand ~= nil then
                                            if currentHand <= 21 then
                                                local potentialWinAmount = blackjackGameData[gameId][source][1] * 2
                                                local potentialPushAmount = blackjackGameData[gameId][source][1]
                                                local playerPing = GetPlayerPing(source)
                                                if dealerHand > 21 then
                                                    giveChips(source,potentialWinAmount)
                                                    if playerPing ~= nil then
                                                        if playerPing > 0 then
                                                            TriggerClientEvent("Blackjack:blackjackWin",source,tableId)
                                                            TriggerClientEvent("blackjack:notify",source,"~g~+"..getMoneyStringFormatted(tostring(potentialWinAmount)).." ~g~chips")
                                                            if potentialPushAmount > 10000000 then
                                                                TriggerClientEvent('chatMessage', -1, "^7Diamond Casino |", { 124, 252, 0 }, ""..XTRA.GetPlayerName(user_id).." has WON "..tostring(getMoneyStringFormatted(potentialWinAmount)).." chips!", "alert")
                                                            end
                                                        end
                                                    end
                                                    TriggerClientEvent("Blackjack:dealerBusts",-1,tableId) 
                                                elseif currentHand > dealerHand and currentHand <= 21 then
                                                    giveChips(source,potentialWinAmount)
                                                    if playerPing ~= nil then
                                                        if playerPing > 0 then
                                                            TriggerClientEvent("Blackjack:blackjackWin",source,tableId)
                                                            TriggerClientEvent("blackjack:notify",source,"~g~+"..getMoneyStringFormatted(tostring(potentialWinAmount)).." ~g~chips")
                                                            if potentialPushAmount > 10000000 then
                                                                TriggerClientEvent('chatMessage', -1, "^7Diamond Casino |", { 124, 252, 0 }, ""..XTRA.GetPlayerName(user_id).." has WON "..tostring(getMoneyStringFormatted(potentialWinAmount)).." chips!", "alert")
                                                            end
                                                        end
                                                    end
                                                    
                                                elseif currentHand == dealerHand then
                                                    giveChips(source,potentialPushAmount)
                                                    if playerPing ~= nil then
                                                        if playerPing > 0 then
                                                            TriggerClientEvent("Blackjack:blackjackPush",source,tableId)
                                                            TriggerClientEvent("blackjack:notify",source,"~g~+0 chips")
                                                        end
                                                    end
                                                else
                                                    if playerPing ~= nil then
                                                        if playerPing > 0 then
                                                            TriggerClientEvent("Blackjack:blackjackLose",source,tableId)
                                                            TriggerClientEvent("blackjack:notify",source,"~r~-"..getMoneyStringFormatted(tostring(potentialPushAmount)).." ~r~chips")
                                                            if potentialPushAmount > 10000000 then
                                                                TriggerClientEvent('chatMessage', -1, "^7Diamond Casino |", { 128, 128, 128 }, ""..XTRA.GetPlayerName(user_id).." has LOST "..tostring(getMoneyStringFormatted(potentialPushAmount)).." chips!", "alert")
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        for chairID=chairIdInitial,chairIdFinal do
                            if blackjackTables[chairID] ~= false then
                                local source = blackjackTables[chairID]
                                if blackjackGameData[gameId][source] ~= nil then 
                                    TriggerClientEvent("Blackjack:chipsCleanup",-1,chairID,tableId) 
                                    TriggerClientEvent("Blackjack:chipsCleanup",-1,tostring(chairID).."chips",tableId)
                                    Wait(3500)
                                end
                            end
                        end
                        TriggerClientEvent("Blackjack:chipsCleanup",-1,gameId,tableId)
                        for chairID=chairIdInitial,chairIdFinal do
                            TriggerClientEvent("Blackjack:chipsCleanupNoAnim",-1,chairID,tableId) 
                            TriggerClientEvent("Blackjack:chipsCleanupNoAnim",-1,tostring(chairID).."chips",tableId)
                        end
                        blackjackGameInProgress[gameId] = false
                    end
                end
            else 
                Wait(1000)
            end
            Wait(1000) --Check ever second if anyones sitting at the table
        end
    end)
end

function getCurrentHand(gameId,userId)
    if blackjackGameData[gameId][userId]["cardData"] ~= nil then 
        local hand = 0
        local numberOfAces = 0
        for k,v in pairs(blackjackGameData[gameId][userId]["cardData"]) do
            local nextCard = getCardNumberFromCardId(v)
            if nextCard == 11 then
                numberOfAces = numberOfAces + 1
            else
                hand = hand + nextCard
            end
        end
        for i=1,numberOfAces,1 do 
            if i == 1 then 
                if hand + 11 > 21 then
                    nextCard = 1
                else
                    nextCard = 11
                end
            else
                nextCard = 1
            end
            hand = hand + nextCard
        end
        return hand
    end
end

function chairIdToTableId(chairId)
    if chairId <= 3 then return 0 end 
    if chairId <= 7 then return 1 end 
    if chairId <= 11 then return 2 end 
    if chairId <= 15 then return 3 end  
end

function getCardNumberFromCardId(cardId)
    if cardId == 1 then
        return 11
    elseif cardId == 2 then
        return 2
    elseif cardId == 3 then
        return 3
    elseif cardId == 4 then
        return 4
    elseif cardId == 5 then
        return 5
    elseif cardId == 6 then
        return 6
    elseif cardId == 7 then
        return 7
    elseif cardId == 8 then
        return 8
    elseif cardId == 9 then
        return 9
    elseif cardId == 10 then
        return 10
    elseif cardId == 11 then
        return 10
    elseif cardId == 12 then
        return 10
    elseif cardId == 13 then
        return 10
    elseif cardId == 14 then
        return 11
    elseif cardId == 15 then
        return 2
    elseif cardId == 16 then
        return 3
    elseif cardId == 17 then
        return 4        
    elseif cardId == 18 then
        return 5
    elseif cardId == 19 then
        return 6
    elseif cardId == 20  then
        return 7
    elseif cardId == 21 then
        return 8
    elseif cardId == 22 then
        return 9
    elseif cardId == 23 then
        return 10
    elseif cardId == 24 then
        return 10
    elseif cardId == 25 then
        return 10
    elseif cardId == 26 then
        return 10
    elseif cardId == 27 then
        return 11
    elseif cardId == 28 then
        return 2
    elseif cardId == 29 then
        return 3
    elseif cardId == 30 then
        return 4
    elseif cardId == 31 then
        return 5
    elseif cardId == 32 then
        return 6
    elseif cardId == 33 then
        return 7
    elseif cardId == 34 then
        return 8
    elseif cardId == 35 then
        return 9
    elseif cardId == 36 then
        return 10
    elseif cardId == 37 then
        return 10
    elseif cardId == 38 then
        return 10
    elseif cardId == 39 then
        return 10
    elseif cardId == 40 then
        return 11
    elseif cardId == 41 then
        return 2
    elseif cardId == 42 then
        return 3
    elseif cardId == 43 then
        return 4
    elseif cardId == 44 then
        return 5
    elseif cardId == 45 then
        return 6
    elseif cardId == 46 then
        return 7
    elseif cardId == 47 then
        return 8
    elseif cardId == 48 then
        return 9
    elseif cardId == 49 then
        return 10
    elseif cardId == 50 then
        return 10
    elseif cardId == 51 then
        return 10
    elseif cardId == 52 then
        return 10
    end
end

function isTableEmpty(self)
    for _, _ in pairs(self) do
        return false
    end
    return true
end

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end
