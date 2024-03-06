local verifyCodes = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(300000)
        for k, v in pairs(verifyCodes) do
            if verifyCodes[k] ~= nil then
                verifyCodes[k] = nil
            end
        end
    end
end)

RegisterServerEvent('XTRA:changeLinkedDiscord', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    XTRA.prompt(source, "Enter Discord Id:", "", function(source, discordid)
        if discordid ~= nil then
            TriggerClientEvent('XTRA:gotDiscord', source)
            generateUUID({"linkcode", 5, "alphanumeric"}, function(code)
                verifyCodes[user_id] = { code = code, discordid = discordid, timestamp = os.time() }
                exports['xtra-bot']:dmUser(source, { discordid, code, user_id }, function() end)
            end)
        end
    end)
end)

RegisterServerEvent('XTRA:enterDiscordCode', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    local currentTimestamp = os.time()
    local verification = verifyCodes[user_id]

    if verification and currentTimestamp - verification.timestamp <= 300 then
        XTRA.prompt(source, "Enter Code:", "", function(source, code)
            if code and code ~= "" then
                if verification.code == code then
                    exports['xtra']:execute("UPDATE `xtra_verification` SET discord_id = @discord_id WHERE user_id = @user_id", { user_id = user_id, discord_id = verification.discordid }, function() end)
                    XTRAclient.notify(source, { '~g~Your discord has been successfully updated.' })
                else
                    XTRAclient.notify(source, { '~r~Invalid code.' })
                end
            else
                XTRAclient.notify(source, { '~r~You need to enter a code!' })
            end
        end)
    else
        XTRAclient.notify(source, { '~r~Your code has expired.' })
    end
end)
