local cfg = module("cfg/survival")
local lang = XTRA.lang


-- handlers

-- init values
AddEventHandler("XTRA:playerJoin", function(user_id, source, name, last_login)
    local data = XTRA.getUserDataTable(user_id)
end)


---- revive
local revive_seq = {{"amb@medic@standing@kneel@enter", "enter", 1}, {"amb@medic@standing@kneel@idle_a", "idle_a", 1},
                    {"amb@medic@standing@kneel@exit", "exit", 1}}

local choice_revive = {function(player, choice)
    local user_id = XTRA.getUserId(player)
    if user_id ~= nil then
        XTRAclient.getNearestPlayer(player, {10}, function(nplayer)
            local nuser_id = XTRA.getUserId(nplayer)
            if nuser_id ~= nil then
                XTRAclient.isInComa(nplayer, {}, function(in_coma)
                    if in_coma then
                        if XTRA.tryGetInventoryItem(user_id, "medkit", 1, true) then
                            XTRAclient.playAnim(player, {false, revive_seq, false}) -- anim
                            SetTimeout(15000, function()
                                XTRAclient.varyHealth(nplayer, {50}) -- heal 50
                            end)
                        end
                    else
                        XTRAclient.notify(player, {lang.emergency.menu.revive.not_in_coma()})
                    end
                end)
            else
                XTRAclient.notify(player, {lang.common.no_player_near()})
            end
        end)
    end
end, lang.emergency.menu.revive.description()}

RegisterNetEvent('XTRA:SearchForPlayer')
AddEventHandler('XTRA:SearchForPlayer', function()
    TriggerClientEvent('XTRA:ReceiveSearch', -1, source)
end)


