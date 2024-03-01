RegisterCommand("a", function(source,args, rawCommand)
    if #args <= 0 then return end
    local message = table.concat(args, " ")
    local user_id = XTRA.getUserId(source)
    local name = XTRA.GetPlayerName(user_id)
    if XTRA.hasPermission(user_id, "admin.tickets") then
        XTRA.sendWebhook('staff', "XTRA Chat Logs", "```"..message.."```".."\n> Admin Name: **"..name.."**\n> Admin PermID: **"..user_id.."**\n> Admin TempID: **"..source.."**")
        for k, v in pairs(XTRA.getUsers({})) do
            if XTRA.hasPermission(k, 'admin.tickets') then
                TriggerClientEvent('chatMessage', v, "^3Admin Chat | " .. name..": " , { 128, 128, 128 }, message, "ooc")
            end
        end
    end
end)
RegisterServerEvent("XTRA:PoliceChat", function(source, args, rawCommand)
    if #args <= 0 then return end
    local source = source
    local user_id = XTRA.getUserId(source)   
    local message = args
    if XTRA.hasPermission(user_id, "police.armoury") then
        local callsign = ""
        if getCallsign('Police', source, user_id, 'Police') then
            callsign = "["..getCallsign('Police', source, user_id, 'Police').."]"
        end
        local playerName =  "^4Police Chat | "..callsign.." "..XTRA.GetPlayerName(user_id)..": "
        for k, v in pairs(XTRA.getUsers({})) do
            if XTRA.hasPermission(k, 'police.armoury') then
                TriggerClientEvent('chatMessage', v, playerName , { 128, 128, 128 }, message, "ooc", "Police")
            end
        end
    end
end)

RegisterCommand("p", function(source, args)
    local message = table.concat(args, " ")
    TriggerEvent("XTRA:PoliceChat", source, message)
end)
RegisterServerEvent("XTRA:Nchat", function(source, args, rawCommand)
    if #args <= 0 then return end
    local source = source
    local user_id = XTRA.getUserId(source)   
    local message = args
    if XTRA.hasPermission(user_id, "nhs.menu") then
        local playerName =  "^2NHS Chat | "..XTRA.GetPlayerName(user_id)..": "
        for k, v in pairs(XTRA.getUsers({})) do
            if XTRA.hasPermission(k, 'nhs.menu') then
                TriggerClientEvent('chatMessage', v, playerName , { 128, 128, 128 }, message, "ooc", "NHS")
            end
        end
    end
end)
RegisterCommand("n", function(source, args)
    local message = table.concat(args, " ")
    TriggerEvent("XTRA:Nchat", source, message)
end)

RegisterCommand("g", function(source, args)
    local message = table.concat(args, " ")
    TriggerEvent("XTRA:GangChat", source, message)
end)
RegisterServerEvent("XTRA:GangChat", function(source, message)
    local source = source
    local user_id = XTRA.getUserId(source)   
    local msg = message
    if XTRA.hasGroup(user_id,"Gang") then
        local gang = exports['xtra']:executeSync('SELECT gangname FROM xtra_user_gangs WHERE user_id = @user_id', {user_id = user_id})[1].gangname
        if gang then
            exports["xtra"]:execute("SELECT * FROM xtra_user_gangs WHERE gangname = @gangname", {gangname = gang},function(ganginfo)
                for A,B in pairs(ganginfo) do
                    local playersource = XTRA.getUserSource(B.user_id)
                    if playersource then
                        TriggerClientEvent('chatMessage',playersource,"^2[Gang Chat] " .. XTRA.GetPlayerName(user_id)..": ",{ 128, 128, 128 },msg,"ooc", "Gang")
                    end
                end
                XTRA.sendWebhook('gang', "XTRA Chat Logs", "```"..msg.."```".."\n> Player Name: **"..XTRA.GetPlayerName(user_id).."**\n> Player PermID: **"..user_id.."**\n> Player TempID: **"..source.."**")
            end)
        end
    end
end)

