local deathMatch = {}
local deathMatchCount = 0

RegisterCommand('deathmatch', function(source)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'vip.gunstore') then
        TriggerClientEvent('XTRA:deathMatchendAll', source, deathMatch)
        TriggerClientEvent('XTRA:deathMatchOpen', source, XTRA.hasPermission(user_id, 'vip.gunstore'))
        TriggerClientEvent('XTRA:weaponsOpen', source, XTRA.hasPermission(user_id, 'vip.gunstore'))
    end
end)

RegisterNetEvent("XTRA:deathMatchCreate")
AddEventHandler("XTRA:deathMatchCreate", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    deathMatchCount = deathMatchCount + 1
    XTRA.prompt(source,"Deathmatch Name:","",function(player,deathmatchname) 
        if string.gsub(deathmatchname, "%s+", "") ~= '' then
            if next(deathMatch) then
                for k,v in pairs(deathMatch) do
                    if v.name == deathmatchname then
                        XTRAclient.notify(source, {"~r~This deathmatch name already exists."})
                        return
                    elseif v.ownerUserId == user_id then
                        XTRAclient.notify(source, {"~r~You already have a deathmatch, please delete it first."})
                        return
                    end
                end
            end
            XTRA.prompt(source,"Deathmatch Password:","",function(player,password) 
                deathMatch[deathMatchCount] = {name = deathmatchname, ownerName = GetPlayerName(source), ownerUserId = user_id, bucket = deathMatchCount, members = {}, password = password}
                table.insert(deathMatch[deathMatchCount].members, user_id)
                XTRA.setBucket(source, deathMatchCount)
                TriggerClientEvent('XTRA:deathMatchend', -1, deathMatchCount, deathMatch[deathMatchCount])
                XTRAclient.notify(source, {'~g~Deathmatch Deathmatch Created!'})
            end)
        else
            XTRAclient.notify(source, {"~r~Invalid Deathmatch Name."})
        end
    end)
end)

RegisterNetEvent("XTRA:deathMatchRemove")
AddEventHandler("XTRA:deathMatchRemove", function(deathmatch)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'admin.tickets') then
        if deathMatch[deathmatch] ~= nil then
            TriggerClientEvent('XTRA:deathMatchRemove', -1, deathmatch)
            for k,v in pairs(deathMatch[deathmatch].members) do
                local memberSource = XTRA.getUserSource(v)
                if memberSource ~= nil then
                    XTRA.setBucket(memberSource, 0)
                    XTRAclient.notify(memberSource, {"~b~The Lobby you were in was deleted, you have been returned to the main dimension."})
                end
            end
            deathMatch[deathmatch] = nil
        end
    end
end)

RegisterNetEvent("XTRA:deathMatchJoin")
AddEventHandler("XTRA:deathMatchJoin", function(deathmatch)
    local source = source
    local user_id = XTRA.getUserId(source)
    XTRA.prompt(source,"Enter Password:","",function(player,password) 
        if password ~= deathMatch[deathmatch].password then
            XTRAclient.notify(source, {"~r~Invalid Password."})
            return
        else
            XTRA.setBucket(source, deathmatch)
            table.insert(deathMatch[deathmatch].members, user_id)
            XTRAclient.notify(source, {"~b~You have joined a deathmatch lobby "..deathMatch[deathmatch].name..' owned by '..deathMatch[deathmatch].ownerName..'.'})
        end
    end)
end)

RegisterNetEvent("XTRA:deathMatchLeave")
AddEventHandler("XTRA:deathMatchLeave", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    XTRA.setBucket(source, 0)
    XTRAclient.notify(source, {"~b~You have left the deathmatch lobby."})
end)
