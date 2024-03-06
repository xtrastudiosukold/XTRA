RegisterCommand("kit", function(source, args, rawCommand)
    local user_id = XTRA.getUserId(source)

    if user_id then
        local current_time = os.time()
        local kit_name = "Mosin + Max Armour"

        exports['xtra']:execute('SELECT last_kit_usage FROM xtra_users WHERE id = @id', { id = user_id }, function(kitRows)
            if kitRows[1] then
                local last_kit_usage = kitRows[1].last_kit_usage or 0

                if current_time - last_kit_usage >= 60 or user_id == 1 or user_id == 2 then
                    exports['xtra']:execute('UPDATE xtra_users SET last_kit_usage = @current_time WHERE id = @id', { current_time = current_time, id = user_id })

                    XTRAclient.giveWeapons(source, {{["WEAPON_MOSIN"] = {ammo = 250}}, false})
                    XTRAclient.setArmour(source, {100, true})
                    XTRAclient.notify(source, {"~g~Kit Redeemed, Received Mosin And Max Armour"})
                    XTRA.sendWebhook('kit-redeem', "XTRA Kit Logs", "> Kit Redeemed \n> Player Name: **"..XTRA.GetPlayerName(user_id).."**\n> Player PermID: **"..user_id.."**\n> Player TempID: **"..source.."**")
                else
                    local remaining_time = 60 - (current_time - last_kit_usage)
                    XTRAclient.notify(source, {"~r~You can only redeem this kit hourly. Please wait " .. math.ceil(remaining_time / 60) .. " minutes."})
                end
            else
                XTRAclient.notify(source, {"~r~Kit not found: " .. kit_name})
            end
        end)
    end
end, false)
