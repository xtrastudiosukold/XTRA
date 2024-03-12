RegisterNetEvent("XTRA:tchat_receive")
AddEventHandler("XTRA:tchat_receive", function(message)
  SendNUIMessage({event = 'tchat_receive', message = message})
end)

RegisterNetEvent("XTRA:tchat_channel")
AddEventHandler("XTRA:tchat_channel", function(channel, messages)
  SendNUIMessage({event = 'tchat_channel', messages = messages})
end)

RegisterNUICallback('tchat_addMessage', function(data, cb)
  TriggerServerEvent('XTRA:tchat_addMessage', data.channel, data.message)
end)

RegisterNUICallback('tchat_getChannel', function(data, cb)
  TriggerServerEvent('XTRA:tchat_channel', data.channel)
end)
