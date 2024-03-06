local trainingWorlds = {}
local trainingWorldsCount = 0
RegisterCommand('trainingworlds', function(source)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'police.armoury') then
        TriggerClientEvent('XTRA:trainingWorldSendAll', source, trainingWorlds)
        TriggerClientEvent('XTRA:trainingWorldOpen', source, XTRA.hasPermission(user_id, 'police.announce'))
    end
end)

RegisterNetEvent("XTRA:trainingWorldCreate")
AddEventHandler("XTRA:trainingWorldCreate", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    trainingWorldsCount = trainingWorldsCount + 1
    XTRA.prompt(source,"World Name:","",function(player,worldname) 
        if string.gsub(worldname, "%s+", "") ~= '' then
            if next(trainingWorlds) then
                for k,v in pairs(trainingWorlds) do
                    if v.name == worldname then
                        XTRAclient.notify(source, {"This world name already exists."})
                        return
                    elseif v.ownerUserId == user_id then
                        XTRAclient.notify(source, {"You already have a world, please delete it first."})
                        return
                    end
                end
            end
            XTRA.prompt(source,"World Password:","",function(player,password) 
                trainingWorlds[trainingWorldsCount] = {name = worldname, ownerName = XTRA.GetPlayerName(user_id), ownerUserId = user_id, bucket = trainingWorldsCount, members = {}, password = password}
                table.insert(trainingWorlds[trainingWorldsCount].members, user_id)
                XTRA.setBucket(source, trainingWorldsCount)
                TriggerClientEvent('XTRA:trainingWorldSend', -1, trainingWorldsCount, trainingWorlds[trainingWorldsCount])
                XTRAclient.notify(source, {'~g~Training World Created!'})
            end)
        else
            XTRAclient.notify(source, {"Invalid World Name."})
        end
    end)
end)

RegisterNetEvent("XTRA:trainingWorldRemove")
AddEventHandler("XTRA:trainingWorldRemove", function(world)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'police.announce') then
        if trainingWorlds[world] ~= nil then
            TriggerClientEvent('XTRA:trainingWorldRemove', -1, world)
            for k,v in pairs(trainingWorlds[world].members) do
                local memberSource = XTRA.getUserSource(v)
                if memberSource ~= nil then
                    XTRA.setBucket(memberSource, 0)
                    XTRAclient.notify(memberSource, {"~w~The training world you were in was deleted, you have been returned to the main dimension."})
                end
            end
            trainingWorlds[world] = nil
        end
    end
end)

RegisterNetEvent("XTRA:trainingWorldJoin")
AddEventHandler("XTRA:trainingWorldJoin", function(world)
    local source = source
    local user_id = XTRA.getUserId(source)
    XTRA.prompt(source,"Enter Password:","",function(player,password) 
        if password ~= trainingWorlds[world].password then
            XTRAclient.notify(source, {"Invalid Password."})
            return
        else
            XTRA.setBucket(source, world)
            table.insert(trainingWorlds[world].members, user_id)
            XTRAclient.notify(source, {"~w~You have joined training world "..trainingWorlds[world].name..' owned by '..trainingWorlds[world].ownerName..'.'})
        end
    end)
end)

RegisterNetEvent("XTRA:trainingWorldLeave")
AddEventHandler("XTRA:trainingWorldLeave", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    XTRA.setBucket(source, 0)
    XTRAclient.notify(source, {"~w~You have left the training world."})
end)

