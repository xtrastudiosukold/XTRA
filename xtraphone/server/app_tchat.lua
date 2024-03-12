function TchatGetMessageChannel (channel, cb)
    exports["xtra"]:executeSync("SELECT * FROM phone_app_chat WHERE channel = @channel ORDER BY time DESC LIMIT 100", { 
        ['@channel'] = channel
    }, cb)
end

function TchatAddMessage (channel, message)
  local Query = "INSERT INTO phone_app_chat (`channel`, `message`) VALUES(@channel, @message);"
  local Query2 = 'SELECT * from phone_app_chat WHERE `id` = @id;'
  local Parameters = {
    ['@channel'] = channel,
    ['@message'] = message
  }
  exports["xtra"]:insert(Query, Parameters, function (id)
    exports["xtra"]:executeSync(Query2, { ['@id'] = id }, function (reponse)
      TriggerClientEvent('XTRA:tchat_receive', -1, reponse[1])
    end)
  end)
end


RegisterServerEvent('XTRA:tchat_channel')
AddEventHandler('XTRA:tchat_channel', function(channel)
  local sourcePlayer = tonumber(source)
  TchatGetMessageChannel(channel, function (messages)
    TriggerClientEvent('XTRA:tchat_channel', sourcePlayer, channel, messages)
  end)
end)

RegisterServerEvent('XTRA:tchat_addMessage')
AddEventHandler('XTRA:tchat_addMessage', function(channel, message)
  TchatAddMessage(channel, message)
end)