RegisterServerEvent("XTRA:adminTicketFeedback")
AddEventHandler("XTRA:adminTicketFeedback", function(AdminID, FeedBackType, Message)
    local AdminID = XTRA.getUserId(AdminID)
    local AdminSource = XTRA.getSourceFromUserId(AdminID)
    local AdminName = XTRA.GetPlayerName(AdminID)

    local FeedBackType = FeedBackType
    local PlayerID = XTRA.getUserId(source) -- source now refers to the player
    local PlayerName = XTRA.GetPlayerName(PlayerID) -- source now refers to the player

    -- Check and replace nil values with "N/A" for local variables
    local AdminID = AdminID or "N/A"
    local AdminName = AdminName or "N/A"
    local PlayerName = PlayerName or "N/A"
    local PlayerID = PlayerID or "N/A"
    local FeedBackType = FeedBackType or "N/A"

    if Message == "" then
        Message = "No Feedback Provided."
    end

    local feedbackInfo = "> Player Name: **" .. PlayerName .. "**\n" ..
                         "> Player PermID: **" .. PlayerID .. "**\n" ..
                         "> Feedback Type: **" .. FeedBackType .. "**\n" ..
                         "> Admin Perm ID**: " .. AdminID .. "**\n" ..
                         "> Admin Name**: " .. AdminName .. "**\n" ..
                         "> Message: **" .. Message .. "**\n"

    XTRA.sendWebhook('feedback', 'XTRA Feedback Logs', feedbackInfo)

    if FeedBackType == "good" then
        XTRA.giveBankMoney(AdminID, 25000)
        XTRAclient.notify(AdminSource, {"~g~You have received £25000 for a good feedback."})
        XTRAclient.notify(source, {"~g~You have given a Good feedback."})
    elseif FeedBackType == "neutral" then
        XTRA.giveBankMoney(AdminID, 10000)
        XTRAclient.notify(AdminSource, {"~g~You have received £10000 for a neutral feedback."})
        XTRAclient.notify(source, {"~y~You have given a Neutral feedback."})
    elseif FeedBackType == "bad" then
        XTRA.giveBankMoney(AdminID, 5000)
        XTRAclient.notify(AdminSource, {"~g~You have received £5000 for a bad feedback."})
        XTRAclient.notify(source, {"~r~You have given a Bad feedback."})
    end
end)



RegisterServerEvent("XTRA:adminTicketNoFeedback")
AddEventHandler("XTRA:adminTicketNoFeedback", function(PlayerSource, AdminPermID)
    if PlayerSource == nil then
        return
    end
    local AdminID = XTRA.getUserId(source) -- 'source' here is the admin who receives the feedback
    local AdminName = XTRA.GetPlayerName(AdminID)
    local AdminPermID = XTRA.getUserId(AdminID)
    local PlayerID = XTRA.getUserId(PlayerSource)
    local PlayerName = XTRA.GetPlayerName(PlayerID)
    if FeedBackType == "good" then
        XTRA.giveBankMoney(AdminPermID, 25000)
        XTRAclient.notify(AdminID, {"~g~You have received £25000 for a good feedback."})
        XTRAclient.notify(source, {"~g~You have given a Good feedback."})
    elseif FeedBackType == "neutral" then
        XTRA.giveBankMoney(AdminPermID, 10000)
        XTRAclient.notify(AdminID, {"~g~You have received £10000 for a good feedback."})
        XTRAclient.notify(source, {"~y~You have given a Neutral feedback."})
    elseif FeedBackType == "bad" then
        XTRA.giveBankMoney(AdminPermID, 5000)
        XTRAclient.notify(AdminID, {"~g~You have received £5000 for a good feedback."})
        XTRAclient.notify(source, {"~r~You have given a Bad feedback."})
    end
    XTRA.sendWebhook('feedback', 'XTRA Feedback Logs', "> Player Name: **"..XTRA.GetPlayerName(AdminID).."**\n> Player PermID: **"..user_id.."**\n> **Feedback Type**"..FeedbackType.."\n> **Admin Perm ID: **"..AdminPermID)
end)