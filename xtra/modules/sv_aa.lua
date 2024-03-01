RegisterServerEvent('XTRA:openAAMenu')
AddEventHandler('XTRA:openAAMenu', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if user_id ~= nil and XTRA.hasPermission(user_id, "aa.menu")then
      XTRAclient.openAAMenu(source,{})
    end
end)

RegisterServerEvent('XTRA:setAAMenu')
AddEventHandler('XTRA:setAAMenu', function(status)
    local source = source
    local user_id = XTRA.getUserId(source)
end)