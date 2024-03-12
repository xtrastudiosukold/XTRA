--====================================================================================
-- #Author: Jonathan D @ Gannon
--====================================================================================

RegisterNetEvent("XTRA:global_getGlobals")
AddEventHandler("XTRA:global_getGlobals", function(globals)
  SendNUIMessage({event = 'global_globals', globals = globals})
end)

RegisterNetEvent("XTRA:global_getFavoriteGlobals")
AddEventHandler("XTRA:global_getFavoriteGlobals", function(globals)
  SendNUIMessage({event = 'global_favoriteglobals', globals = globals})
end)

RegisterNetEvent("XTRA:global_newGlobals")
AddEventHandler("XTRA:global_newGlobals", function(tweet)
  SendNUIMessage({event = 'global_newTweet', tweet = tweet})
end)

RegisterNetEvent("XTRA:global_updateTweetLikes")
AddEventHandler("XTRA:global_updateTweetLikes", function(tweetId, likes)
  SendNUIMessage({event = 'global_updateTweetLikes', tweetId = tweetId, likes = likes})
end)

RegisterNetEvent("XTRA:global_setAccount")
AddEventHandler("XTRA:global_setAccount", function(username, password, avatarUrl)
  SendNUIMessage({event = 'global_setAccount', username = username, password = password, avatarUrl = avatarUrl})
end)

RegisterNetEvent("XTRA:global_createAccount")
AddEventHandler("XTRA:global_createAccount", function(account)
  SendNUIMessage({event = 'global_createAccount', account = account})
end)

RegisterNetEvent("XTRA:global_showError")
AddEventHandler("XTRA:global_showError", function(title, message)
  SendNUIMessage({event = 'global_showError', message = message, title = title})
end)

RegisterNetEvent("XTRA:global_showSuccess")
AddEventHandler("XTRA:global_showSuccess", function(title, message)
  SendNUIMessage({event = 'global_showSuccess', message = message, title = title})
end)

RegisterNetEvent("XTRA:global_setTweetLikes")
AddEventHandler("XTRA:global_setTweetLikes", function(tweetId, isLikes)
  SendNUIMessage({event = 'global_setTweetLikes', tweetId = tweetId, isLikes = isLikes})
end)



RegisterNUICallback('global_login', function(data, cb)
  TriggerServerEvent('XTRA:global_login', data.username, data.password)
end)

RegisterNUICallback('global_getGlobals', function(data, cb)
  TriggerServerEvent('XTRA:global_getGlobals')
end)

RegisterNUICallback('global_getFavoriteGlobals', function(data, cb)
  TriggerServerEvent('XTRA:global_getFavoriteGlobals')
end)

RegisterNUICallback('global_postTweet', function(data, cb)
  TriggerServerEvent('XTRA:global_postGlobals', data.message)
end)

RegisterNUICallback('global_postTweetImg', function(data, cb)
  TriggerServerEvent('XTRA:global_postGlobals', data.username or '', data.password or '', data.message)
end)

RegisterNUICallback('global_toggleLikeTweet', function(data, cb)
  TriggerServerEvent('XTRA:likeTweet',data.tweetId)
end)

RegisterNUICallback('global_setAvatarUrl', function(data, cb)
    TriggerServerEvent("XTRA:setGlobalAvatar", data.avatarUrl)
end)
