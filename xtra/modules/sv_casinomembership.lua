RegisterNetEvent('XTRA:purchaseHighRollersMembership')
AddEventHandler('XTRA:purchaseHighRollersMembership', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if not XTRA.hasGroup(user_id, 'Highroller') then
        if XTRA.tryFullPayment(user_id,10000000) then
            XTRA.addUserGroup(user_id, 'Highroller')
            XTRAclient.notify(source, {'~g~You have purchased the ~b~High Rollers ~g~membership.'})
            XTRA.sendWebhook('purchase-highrollers',"XTRA Purchased Highrollers Logs", "> Player Name: **"..XTRA.GetPlayerName(user_id).."**\n> Player TempID: **"..source.."**\n> Player PermID: **"..user_id.."**")
        else
            XTRAclient.notify(source, {'You do not have enough money to purchase this membership.'})
        end
    else
        XTRAclient.notify(source, {"You already have High Roller's License."})
    end
end)

RegisterNetEvent('XTRA:removeHighRollersMembership')
AddEventHandler('XTRA:removeHighRollersMembership', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasGroup(user_id, 'Highroller') then
        XTRA.removeUserGroup(user_id, 'Highroller')
    else
        XTRAclient.notify(source, {"You do not have High Roller's License."})
    end
end)