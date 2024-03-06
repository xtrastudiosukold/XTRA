
local cfg = module("cfg/cfg_licensecentre")

RegisterServerEvent("XTRA:buyLicense")
AddEventHandler('XTRA:buyLicense', function(job, name)
    local source = source
    local user_id = XTRA.getUserId(source)
    local coords = cfg.location
    local ped = GetPlayerPed(source)
    local playerCoords = GetEntityCoords(ped)
    if not XTRA.hasGroup(user_id, "Rebel") and job == "AdvancedRebel" then
        XTRAclient.notify(source, {"You need to have Rebel License."})
        return
    end
    if #(playerCoords - coords) <= 15.0 then
        if XTRA.hasGroup(user_id, job) then 
            XTRAclient.notify(source, {"~o~You have already purchased this license!"})
            TriggerClientEvent("XTRA:PlaySound", source, 2)
        else
            for k,v in pairs(cfg.licenses) do
                if v.group == job then
                    if XTRA.tryFullPayment(user_id, v.price) then
                        XTRA.addUserGroup(user_id,job)
                        XTRAclient.notifyPicture(source, {"monzo", "monzo", "~g~Purchased " .. name .. " for ".. '£' ..tostring(getMoneyStringFormatted(v.price)) .. " ❤️"})

                        XTRA.sendWebhook('purchases',"XTRA License Centre Logs", "> Player Name: **"..XTRA.GetPlayerName(user_id).."**\n> Player TempID: **"..source.."**\n> Player PermID: **"..user_id.."**\n> Purchased: **"..name.."**")
                        TriggerClientEvent("XTRA:PlaySound", source, "playMoney")
                        TriggerClientEvent("XTRA:gotOwnedLicenses", source, getLicenses(user_id))
                        TriggerClientEvent("XTRA:refreshGunStorePermissions", source)
                    else 
                        XTRAclient.notifyPicture(source, {"monzo", "monzo", "You do not have enough money to purchase this license!"})

                        TriggerClientEvent("XTRA:PlaySound", source, 2)
                    end
                end
            end
        end
    else 
        TriggerEvent("XTRA:acBan", userid, 11, XTRA.GetPlayerName(user_id), source, 'Trigger License Menu Purchase')
    end
end)

RegisterServerEvent("XTRA:refundLicense")
AddEventHandler('XTRA:refundLicense', function(job, name)
    local source = source
    local user_id = XTRA.getUserId(source)
    local coords = cfg.location
    local ped = GetPlayerPed(source)
    local playerCoords = GetEntityCoords(ped)
    if #(playerCoords - coords) <= 15.0 then
        local refundPercentage = 0.25
        for k, v in pairs(cfg.licenses) do
            if v.group == job then
                local refundAmount = v.price * refundPercentage
                XTRA.setBankMoney(user_id, XTRA.getBankMoney(user_id) + refundAmount)
                XTRA.removeUserGroup(user_id, job)
                XTRAclient.notifyPicture(source, {"monzo", "monzo", "~g~Refunded " .. name .. " for " .. '£' .. tostring(getMoneyStringFormatted(refundAmount))})
                XTRA.sendWebhook('purchases', "XTRA License Centre Logs Refund", "> Player Name: **" .. XTRA.GetPlayerName(user_id) .. "**\n> Player TempID: **" .. source .. "**\n> Player PermID: **" .. user_id .. "**\n> Refund: **" .. name .. "**")
                TriggerClientEvent("XTRA:PlaySound", source, "playMoney")
                TriggerClientEvent("XTRA:gotOwnedLicenses", source, getLicenses(user_id))
                TriggerClientEvent("XTRA:refreshGunStorePermissions", source)
            end
        end
    else 
        TriggerEvent("XTRA:acBan", user_id, 11, XTRA.GetPlayerName(user_id), source, 'Trigger License Menu Refund')
    end
end)







function getLicenses(user_id)
    local licenses = {}
    if user_id ~= nil then
        for k, v in pairs(cfg.licenses) do
            if XTRA.hasGroup(user_id, v.group) then
                table.insert(licenses, v.name)
            end
        end
        return licenses
    end
end

RegisterNetEvent("XTRA:GetLicenses")
AddEventHandler("XTRA:GetLicenses", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if user_id ~= nil then
        TriggerClientEvent("XTRA:ReceivedLicenses", source, getLicenses(user_id))
    end
end)

RegisterNetEvent("XTRA:getOwnedLicenses")
AddEventHandler("XTRA:getOwnedLicenses", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if user_id ~= nil then
        TriggerClientEvent("XTRA:gotOwnedLicenses", source, getLicenses(user_id))
    end
end)