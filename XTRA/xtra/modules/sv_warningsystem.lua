

function XTRA.GetWarnings(user_id, source)
    local frwarningstables = exports['xtra']:executeSync("SELECT * FROM xtra_warnings WHERE user_id = @uid", { uid = user_id })
    for warningID, warningTable in pairs(frwarningstables) do
        local date = warningTable["warning_date"]
        local newdate = tonumber(date) / 1000
        newdate = os.date('%Y-%m-%d', newdate)
        warningTable["warning_date"] = newdate
		local points = warningTable["point"]
    end
    return frwarningstables
end




function XTRA.AddWarnings(target_id, adminName, warningReason, warning_duration, point)
    if warning_duration == -1 then
        warning_duration = 0
    end
    exports['xtra']:execute("INSERT INTO xtra_warnings (`user_id`, `warning_type`, `duration`, `admin`, `warning_date`, `reason`, `point`) VALUES (@user_id, @warning_type, @duration, @admin, @warning_date, @reason, @point);", { user_id = target_id, warning_type = "Ban", admin = adminName, duration = warning_duration, warning_date = os.date("%Y/%m/%d"), reason = warningReason, point = point })
end



RegisterServerEvent("XTRA:refreshWarningSystem")
AddEventHandler("XTRA:refreshWarningSystem", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    local frwarningstables = XTRA.GetWarnings(user_id, source)
    local a = exports['xtra']:executeSync("SELECT * FROM xtra_bans_offenses WHERE UserID = @uid", { uid = user_id })
    for k, v in pairs(a) do
        if v.UserID == user_id then
            for warningID, warningTable in pairs(frwarningstables) do
                warningTable["points"] = v.points
            end
            local info = { user_id = user_id, playtime = XTRA.GetPlayTime(user_id) }
            TriggerClientEvent("XTRA:recievedRefreshedWarningData", source, frwarningstables, v.points, info)
        end
    end
end)

RegisterCommand('sw', function(source, args)
    local user_id = XTRA.getUserId(source)
    local user_id = tonumber(args[1])
    if user_id then
        if XTRA.hasPermission(user_id, "admin.tickets") then
            local frwarningstables = XTRA.GetWarnings(user_id, source)
            local a = exports['xtra']:executeSync("SELECT * FROM xtra_bans_offenses WHERE UserID = @uid", { uid = user_id })
            for k, v in pairs(a) do
                if v.UserID == user_id then
                    for warningID, warningTable in pairs(frwarningstables) do
                        warningTable["points"] = v.points
                    end
                    local info = { user_id = user_id, playtime = XTRA.GetPlayTime(user_id) }
                    TriggerClientEvent("XTRA:showWarningsOfUser", source, frwarningstables, v.points, info)
                end
            end
        end
    end
end)
