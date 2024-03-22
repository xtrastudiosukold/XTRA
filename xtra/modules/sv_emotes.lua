RegisterNetEvent('XTRA:sendSharedEmoteRequest')
AddEventHandler('XTRA:sendSharedEmoteRequest', function(playersrc, emote)
    local source = source
    TriggerClientEvent('XTRA:sendSharedEmoteRequest', playersrc, source, emote)
end)

RegisterNetEvent('XTRA:receiveSharedEmoteRequest')
AddEventHandler('XTRA:receiveSharedEmoteRequest', function(i, a)
    local source = source
    if a == -1 then 
        TriggerEvent("XTRA:acBan", XTRA.getUserId(source), 11, XTRA.GetPlayerName(user_id), source, "Triggering receiveSharedEmoteRequest")
    end
    TriggerClientEvent('XTRA:receiveSharedEmoteRequestSource', i)
    TriggerClientEvent('XTRA:receiveSharedEmoteRequest', source, a)
end)


local shavedPlayers = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000)
        for k,v in pairs(shavedPlayers) do
            if shavedPlayers[k] then
                if shavedPlayers[k].cooldown > 0 then
                    shavedPlayers[k].cooldown = shavedPlayers[k].cooldown - 1
                else
                    shavedPlayers[k] = nil
                end
            end
        end
    end
end)

AddEventHandler("XTRA:playerSpawn", function(user_id, source, first_spawn)
    SetTimeout(1000, function() 
        local source = source
        local user_id = XTRA.getUserId(source)
        if first_spawn and shavedPlayers[user_id] then
            TriggerClientEvent('XTRA:setAsShaved', source, (shavedPlayers[user_id].cooldown*60*1000))
        end
    end)
end)

function XTRA.ShaveHead(source)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.getInventoryItemAmount(user_id, 'Shaver') >= 1 then
        XTRAclient.getNearestPlayer(source,{4},function(nplayer)
            if nplayer then
                XTRAclient.isPlayerSurrenderedNoProgressBar(nplayer,{},function(surrendering)
                    if surrendering then
                        XTRA.tryGetInventoryItem(user_id, 'Shaver', 1)
                        TriggerClientEvent('XTRA:startShavingPlayer', source, nplayer)
                        shavedPlayers[XTRA.getUserId(nplayer)] = {
                            cooldown = 30,
                        }
                    else
                        XTRAclient.notify(source,{'~r~This player is not on their knees.'})
                    end
                end)
            else
                XTRAclient.notify(source, {"~r~No one nearby."})
            end
        end)
    end
end

local radioCreated = {}

Citizen.CreateThread(function()
    while true do
        for _, player in ipairs(GetPlayers()) do
            local user_id = XTRA.getUserId(player)
            if radioCreated[user_id] ~= nil and XTRA.getInventoryItemAmount(user_id, 'civilian_radio') >= 1 then
               createRadio(player)
               radioCreated[user_id] = true
            else
                radioCreated[user_id] = nil
            end
        end
        Citizen.Wait(1000)
    end
end)