RegisterServerEvent('XTRA:playTaserSound')
AddEventHandler('XTRA:playTaserSound', function(coords, sound)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'police.armoury') or XTRA.hasPermission(user_id, 'hmp.menu') then
        TriggerClientEvent('playTaserSoundClient', -1, coords, sound)
    end
end)

RegisterServerEvent('XTRA:reactivatePed')
AddEventHandler('XTRA:reactivatePed', function(id)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'police.armoury') or XTRA.hasPermission(user_id, 'hmp.menu') then
      TriggerClientEvent('XTRA:receiveActivation', id)
      TriggerClientEvent('TriggerTazer', id)
    end
end)

RegisterServerEvent('XTRA:arcTaser')
AddEventHandler('XTRA:arcTaser', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'police.armoury') or XTRA.hasPermission(user_id, 'hmp.menu') then
      XTRAclient.getNearestPlayer(source, {3}, function(nplayer)
        local nuser_id = XTRA.getUserId(nplayer)
        if nuser_id ~= nil then
            TriggerClientEvent('XTRA:receiveBarbs', nplayer, source)
            TriggerClientEvent('TriggerTazer', id)
        end
      end)
    end
end)

RegisterServerEvent('XTRA:barbsNoLongerServer')
AddEventHandler('XTRA:barbsNoLongerServer', function(id)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'police.armoury') or XTRA.hasPermission(user_id, 'hmp.menu') then
      TriggerClientEvent('XTRA:barbsNoLonger', id)
    end
end)

RegisterServerEvent('XTRA:barbsRippedOutServer')
AddEventHandler('XTRA:barbsRippedOutServer', function(id)
    local source = source
    local user_id = XTRA.getUserId(source)
    TriggerClientEvent('XTRA:barbsRippedOut', id)
end)

RegisterCommand('rt', function(source, args)
  local source = source
  local user_id = XTRA.getUserId(source)
  if XTRA.hasPermission(user_id, 'police.armoury') or XTRA.hasPermission(user_id, 'hmp.menu') then
      TriggerClientEvent('XTRA:reloadTaser', source)
  end
end)