RegisterServerEvent('XTRA:setCarDevMode')
AddEventHandler('XTRA:setCarDevMode', function(status)
    local source = source
    local user_id = XTRA.getUserId(source)
    if user_id ~= nil and XTRA.hasPermission(user_id, "cardev.menu") then 
      if status then
        XTRA.setBucket(source, 333)
      else
        XTRA.setBucket(source, 0)
      end
    else
      TriggerEvent("XTRA:acBan", user_id, 11, XTRA.GetPlayerName(user_id), source, 'Attempted to Teleport to Car Dev Universe')
    end
end)