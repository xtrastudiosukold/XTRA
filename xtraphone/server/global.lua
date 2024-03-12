--====================================================================================
-- #Author: Jonathan D @ Gannon
--====================================================================================

function GlobalGetGlobals (accountId, cb)
  if accountId == nil then
    exports["xtra"]:executeSync([===[
      SELECT global_globals.*,
        global_accounts.username as author,
        global_accounts.avatar_url as authorIcon
      FROM global_globals
        LEFT JOIN global_accounts
        ON global_globals.authorId = global_accounts.id
      ORDER BY time DESC LIMIT 130
      ]===], {}, cb)
  else
    exports["xtra"]:executeSync([===[
      SELECT global_globals.*,
        global_accounts.username as author,
        global_accounts.avatar_url as authorIcon,
        global_likes.id AS isLikes
      FROM global_globals
        LEFT JOIN global_accounts
          ON global_globals.authorId = global_accounts.id
        LEFT JOIN global_likes 
          ON global_globals.id = global_likes.tweetId AND global_likes.authorId = @accountId
      ORDER BY time DESC LIMIT 130
    ]===], { ['@accountId'] = accountId }, cb)
  end
end

function GlobalGetFavotireGlobals (accountId, cb)
  if accountId == nil then
    exports["xtra"]:executeSync([===[
      SELECT global_globals.*,
        global_accounts.username as author,
        global_accounts.avatar_url as authorIcon
      FROM global_globals
        LEFT JOIN global_accounts
          ON global_globals.authorId = global_accounts.id
      WHERE global_globals.TIME > CURRENT_TIMESTAMP() - INTERVAL '15' DAY
      ORDER BY likes DESC, TIME DESC LIMIT 30
    ]===], {}, cb)
  else
    exports["xtra"]:executeSync([===[
      SELECT global_globals.*,
        global_accounts.username as author,
        global_accounts.avatar_url as authorIcon,
        global_likes.id AS isLikes
      FROM global_globals
        LEFT JOIN global_accounts
          ON global_globals.authorId = global_accounts.id
        LEFT JOIN global_likes 
          ON global_globals.id = global_likes.tweetId AND global_likes.authorId = @accountId
      WHERE global_globals.TIME > CURRENT_TIMESTAMP() - INTERVAL '15' DAY
      ORDER BY likes DESC, TIME DESC LIMIT 30
    ]===], { ['@accountId'] = accountId }, cb)
  end
end

function getUser(username, password, cb)
  exports["xtra"]:executeSync("SELECT id, username as author, avatar_url as authorIcon FROM global_accounts WHERE global_accounts.username = @username AND global_accounts.password = @password", {
    ['@username'] = username,
    ['@password'] = password
  }, function (data)
    cb(data[1])
  end)
end

function GlobalPostTweet (username, password, message, sourcePlayer, realUser, cb)
  getUser(username, password, function (user)
    if user == nil then
      if sourcePlayer then
        GlobalShowError(sourcePlayer, 'Global Info', 'APP_GLOBAL_NOTIF_LOGIN_ERROR')
      end
      return
    end
    exports["xtra"]:insert("INSERT INTO global_globals (`authorId`, `message`, `realUser`) VALUES(@authorId, @message, @realUser);", {
      ['@authorId'] = user.id,
      ['@message'] = message,
      ['@realUser'] = realUser
    }, function (id)
      exports["xtra"]:executeSync('SELECT * from global_globals WHERE id = @id', {
        ['@id'] = id
      }, function (globals)
        tweet = globals[1]
        tweet['author'] = user.author
        tweet['authorIcon'] = user.authorIcon
        TriggerClientEvent('XTRA:global_newGlobals', -1, tweet)
        TriggerEvent('XTRA:global_newGlobals', tweet)
      end)
    end)
  end)
end

function GlobalToogleLike (username, password, tweetId, sourcePlayer)
  getUser(username, password, function (user)
    if user == nil then
      if sourcePlayer then
        GlobalShowError(sourcePlayer, 'Global Info', 'APP_GLOBAL_NOTIF_LOGIN_ERROR')
      end
      return
    end
    exports["xtra"]:executeSync('SELECT * FROM global_globals WHERE id = @id', {
      ['@id'] = tweetId
    }, function (globals)
      if (globals[1] == nil) then return end
      local tweet = globals[1]
      exports["xtra"]:executeSync('SELECT * FROM global_likes WHERE authorId = @authorId AND tweetId = @tweetId', {
        ['authorId'] = user.id,
        ['tweetId'] = tweetId
      }, function (row) 
        if (row[1] == nil) then
          exports["xtra"]:insert('INSERT INTO global_likes (`authorId`, `tweetId`) VALUES(@authorId, @tweetId)', {
            ['authorId'] = user.id,
            ['tweetId'] = tweetId
          }, function (newrow)
            exports["xtra"]:execute('UPDATE `global_globals` SET `likes`= likes + 1 WHERE id = @id', {
              ['@id'] = tweet.id
            }, function ()
              TriggerClientEvent('XTRA:global_updateTweetLikes', -1, tweet.id, tweet.likes + 1)
              TriggerClientEvent('XTRA:global_setTweetLikes', sourcePlayer, tweet.id, true)
              TriggerEvent('XTRA:global_updateTweetLikes', tweet.id, tweet.likes + 1)
            end)    
          end)
        else
          exports["xtra"]:execute('DELETE FROM global_likes WHERE id = @id', {
            ['@id'] = row[1].id,
          }, function (newrow)
            exports["xtra"]:execute('UPDATE `global_globals` SET `likes`= likes - 1 WHERE id = @id', {
              ['@id'] = tweet.id
            }, function ()
              TriggerClientEvent('XTRA:global_updateTweetLikes', -1, tweet.id, tweet.likes - 1)
              TriggerClientEvent('XTRA:global_setTweetLikes', sourcePlayer, tweet.id, false)
              TriggerEvent('XTRA:global_updateTweetLikes', tweet.id, tweet.likes - 1)
            end)
          end)
        end
      end)
    end)
  end)
end

function GlobalCreateAccount(username, password, avatarUrl, cb)
  exports["xtra"]:insert('INSERT IGNORE INTO global_accounts (`username`, `password`, `avatar_url`) VALUES(@username, @password, @avatarUrl)', {
    ['username'] = username,
    ['password'] = password,
    ['avatarUrl'] = avatarUrl
  }, cb)
end
-- ALTER TABLE `global_accounts`	CHANGE COLUMN `username` `username` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8_general_ci';

function GlobalShowError (sourcePlayer, title, message)
  TriggerClientEvent('XTRA:global_showError', sourcePlayer, message)
end
function GlobalShowSuccess (sourcePlayer, title, message)
  TriggerClientEvent('XTRA:global_showSuccess', sourcePlayer, title, message)
end

RegisterServerEvent('XTRA:global_login')
AddEventHandler('XTRA:global_login', function(username, password)
  local sourcePlayer = tonumber(source)
  getUser(username, password, function (user)
    if user == nil then
      GlobalShowError(sourcePlayer, 'Global Info', 'APP_GLOBAL_NOTIF_LOGIN_ERROR')
    else
      GlobalShowSuccess(sourcePlayer, 'Global Info', 'APP_GLOBAL_NOTIF_LOGIN_SUCCESS')
      TriggerClientEvent('XTRA:global_setAccount', sourcePlayer, username, password, user.authorIcon)
    end
  end)
end)

RegisterServerEvent('XTRA:global_changePassword')
AddEventHandler('XTRA:global_changePassword', function(username, password, newPassword)
  local sourcePlayer = tonumber(source)
  getUser(username, password, function (user)
    if user == nil then
      GlobalShowError(sourcePlayer, 'Global Info', 'APP_GLOBAL_NOTIF_NEW_PASSWORD_ERROR')
    else
      exports["xtra"]:execute("UPDATE `global_accounts` SET `password`= @newPassword WHERE global_accounts.username = @username AND global_accounts.password = @password", {
        ['@username'] = username,
        ['@password'] = password,
        ['@newPassword'] = newPassword
      }, function (result)
        if (result == 1) then
          TriggerClientEvent('XTRA:global_setAccount', sourcePlayer, username, newPassword, user.authorIcon)
          GlobalShowSuccess(sourcePlayer, 'Global Info', 'APP_GLOBAL_NOTIF_NEW_PASSWORD_SUCCESS')
        else
          GlobalShowError(sourcePlayer, 'Global Info', 'APP_GLOBAL_NOTIF_NEW_PASSWORD_ERROR')
        end
      end)
    end
  end)
end)


RegisterServerEvent('XTRA:global_createAccount')
AddEventHandler('XTRA:global_createAccount', function(username, password, avatarUrl)
  local sourcePlayer = tonumber(source)
  GlobalCreateAccount(username, password, avatarUrl, function (id)
    if (id ~= 0) then
      TriggerClientEvent('XTRA:global_setAccount', sourcePlayer, username, password, avatarUrl)
      GlobalShowSuccess(sourcePlayer, 'Global Info', 'APP_GLOBAL_NOTIF_ACCOUNT_CREATE_SUCCESS')
    else
      GlobalShowError(sourcePlayer, 'Global Info', 'APP_GLOBAL_NOTIF_ACCOUNT_CREATE_ERROR')
    end
  end)
end)

RegisterServerEvent('XTRA:global_getGlobals')
AddEventHandler('XTRA:global_getGlobals', function(username, password)
  local sourcePlayer = tonumber(source)
  if username and username ~= "" and password and password ~= "" then
    getUser(username, password, function (user)
      local accountId = user and user.id
      GlobalGetGlobals(accountId, function (globals)
        TriggerClientEvent('XTRA:global_getGlobals', sourcePlayer, globals)
      end)
    end)
  else
    GlobalGetGlobals(nil, function (globals)
      TriggerClientEvent('XTRA:global_getGlobals', sourcePlayer, globals)
    end)
  end
end)

RegisterServerEvent('XTRA:global_getFavoriteGlobals')
AddEventHandler('XTRA:global_getFavoriteGlobals', function(username, password)
  local sourcePlayer = tonumber(source)
  if username and username ~= "" and password and password ~= "" then
    getUser(username, password, function (user)
      local accountId = user and user.id
      GlobalGetFavotireGlobals(accountId, function (globals)
        TriggerClientEvent('XTRA:global_getFavoriteGlobals', sourcePlayer, globals)
      end)
    end)
  else
    GlobalGetFavotireGlobals(nil, function (globals)
      TriggerClientEvent('XTRA:global_getFavoriteGlobals', sourcePlayer, globals)
    end)
  end
end)

RegisterServerEvent('XTRA:global_postGlobals')
AddEventHandler('XTRA:global_postGlobals', function(username, password, message)
  local sourcePlayer = tonumber(source)
  local srcIdentifier = getPlayerID(source)
  GlobalPostTweet(username, password, message, sourcePlayer, srcIdentifier)
end)

RegisterServerEvent('XTRA:global_toogleLikeTweet')
AddEventHandler('XTRA:global_toogleLikeTweet', function(username, password, tweetId)
  local sourcePlayer = tonumber(source)
  GlobalToogleLike(username, password, tweetId, sourcePlayer)
end)


RegisterServerEvent('XTRA:global_setAvatarUrl')
AddEventHandler('XTRA:global_setAvatarUrl', function(username, password, avatarUrl)
  local sourcePlayer = tonumber(source)
  exports["xtra"]:execute("UPDATE `global_accounts` SET `avatar_url`= @avatarUrl WHERE global_accounts.username = @username AND global_accounts.password = @password", {
    ['@username'] = username,
    ['@password'] = password,
    ['@avatarUrl'] = avatarUrl
  }, function (result)
    if (result == 1) then
      TriggerClientEvent('XTRA:global_setAccount', sourcePlayer, username, password, avatarUrl)
      GlobalShowSuccess(sourcePlayer, 'Global Info', 'APP_GLOBAL_NOTIF_AVATAR_SUCCESS')
    else
      GlobalShowError(sourcePlayer, 'Global Info', 'APP_GLOBAL_NOTIF_LOGIN_ERROR')
    end
  end)
end)

AddEventHandler('XTRA:global_newGlobals', function (tweet)
  local discord_webhook = GetConvar('discord_webhook', '')
  if discord_webhook == '' then
    return
  end
  local headers = {
    ['Content-Type'] = 'application/json'
  }
  local data = {
    ["username"] = tweet.author,
    ["embeds"] = {{
      ["thumbnail"] = {
        ["url"] = tweet.authorIcon
      },
      ["color"] = 1942002,
      ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ", tweet.time / 1000 )
    }}
  }
  local isHttp = string.sub(tweet.message, 0, 7) == 'http://' or string.sub(tweet.message, 0, 8) == 'https://'
  local ext = string.sub(tweet.message, -4)
  local isImg = ext == '.png' or ext == '.pjg' or ext == '.gif' or string.sub(tweet.message, -5) == '.jpeg'
  if (isHttp and isImg) and true then
    data['embeds'][1]['image'] = { ['url'] = tweet.message }
  else
    data['embeds'][1]['description'] = tweet.message
  end
  PerformHttpRequest(discord_webhook, function(err, text, headers) end, 'POST', json.encode(data), headers)
end)