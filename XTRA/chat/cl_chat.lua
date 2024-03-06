local isRDR = not TerraingridActivate and true or false

local hideChat = false
local chatInputActive = false
local chatInputActivating = false
local chatLoaded = false
local isReducedOpacity = false
local isFirstLoad = true

RegisterNetEvent('chatMessage')
RegisterNetEvent('chat:addTemplate')
RegisterNetEvent('chat:addMessage')
RegisterNetEvent('chat:addSuggestion')
RegisterNetEvent('chat:addSuggestions')
RegisterNetEvent('chat:addMode')
RegisterNetEvent('chat:removeMode')
RegisterNetEvent('chat:removeAllModes')
RegisterNetEvent('chat:removeSuggestion')
RegisterNetEvent('chat:clear')

-- internal events
RegisterNetEvent('__cfx_internal:serverPrint')

RegisterNetEvent('_chat:messageEntered')

local specialSyntax = {
  ["^"] = true,
  ["."] = true,
  ["+"] = true,
  ["*"] = true,
  ["-"] = true,
  ["?"] = true,
}

local function removePatternsFromString(content)
  local characters = {}
  for characterIndex = 1, #content do
    local character = string.sub(content, characterIndex, characterIndex)
    if specialSyntax[character] then
      table.insert(characters, "%")
    end
    table.insert(characters, character)
  end
  return table.concat(characters)
end

local function getPlayerNameSafe()
  if GetResourceState("xtra") == "started" then
    local name = exports["xtra"]:getPlayerName(PlayerId())
    if name and type(name) == "string" then
      return name
    end
  end
  return GetPlayerName(PlayerId())
end

local function containsMyName(args)
  if #args > 0 then
    local content = args[1]
    if string.match(content, "OOC |") or string.match(content, "Global @") then
      if string.match(content, "Global @^1Anonymous") and args[2] then
        content = args[2]
      end
      local myName = getPlayerNameSafe()
      if myName then
        local contentSafe = removePatternsFromString(content)
        local nameSafe = removePatternsFromString(myName)
        local index = string.find(string.lower(contentSafe), string.lower(nameSafe))
        if index and index > 0 then
          local beforeOffset = index - 1
          if beforeOffset > 0 then
            local beforeCharacter = string.sub(contentSafe, beforeOffset, beforeOffset)
            if beforeCharacter ~= "@" then
              return false
            end
          end
          local afterOffset = index + #nameSafe
          if afterOffset <= #contentSafe then
            local afterCharacter = string.sub(contentSafe, afterOffset, afterOffset)
            if afterCharacter ~= " " or afterCharacter == ":" then
              return false
            end
          end
          return true
        end
      end
    end
  end
  return false
end

local function getUserIdSafe()
  if GetResourceState("xtra") == "started" then
    local user_id = exports["xtra"]:getUserId()
    if user_id and type(user_id) == "number" then
      return user_id
    end
  end
  return -1
end

local function containsMyPermID(args)
  if #args > 0 then
    local content = args[1]
    if string.match(content, "OOC |") or string.match(content, "Global @") then
      if string.match(content, "Global @^1Anonymous") and args[2] then
        content = args[2]
      end
      local myPermID = tostring(getUserIdSafe())
      if myPermID and #myPermID >= 1 and myPermID ~= "nil" then
        local contentSafe = removePatternsFromString(content)
        local permIDSafe = removePatternsFromString(myPermID)
        local index = string.find(string.lower(contentSafe), string.lower(permIDSafe))
        if index and index > 0 then
          local beforeOffset = index - 1
          if beforeOffset > 0 then
            local beforeCharacter = string.sub(contentSafe, beforeOffset, beforeOffset)
            if beforeCharacter ~= "@" then
              return false
            end
          end
          local afterOffset = index + #permIDSafe
          if afterOffset <= #contentSafe then
            local afterCharacter = string.sub(contentSafe, afterOffset, afterOffset)
            if afterCharacter ~= " " or afterCharacter == ":" then
              return false
            end
          end
          return true
        end
      end
    end
  end
  return false
end

--deprecated, use chat:addMessage
AddEventHandler('chatMessage', function(author, color, text, msgType, modeName)
  if not hideChat then
    local args = { text }
    if author ~= "" then
      table.insert(args, 1, author)
    end
    SendNUIMessage({
      type = 'ON_MESSAGE',
      message = {
        msgType = msgType,
        color = color,
        multiline = true,
        args = args,
        transparent = isReducedOpacity,
        isMention = containsMyName(args),
        isPermMention = containsMyPermID(args),
        mode = modeName
      }
    })
  end
end)

AddEventHandler('__cfx_internal:serverPrint', function(msg)
  print(msg)

  SendNUIMessage({
    type = 'ON_MESSAGE',
    message = {
      templateId = 'print',
      multiline = true,
      args = { msg },
      mode = '_global'
    }
  })
end)

local isChatActive = function()
  return chatInputActive
end
exports('isChatActive', isChatActive)

-- addMessage
local addMessage = function(message)
  if not hideChat then
    if type(message) == 'string' then
      message = {
        args = { message }
      }
    end

    SendNUIMessage({
      type = 'ON_MESSAGE',
      message = message
    })
  end
end

exports('addMessage', addMessage)
AddEventHandler('chat:addMessage', addMessage)

-- addSuggestion
local addSuggestion = function(name, help, params)
  SendNUIMessage({
    type = 'ON_SUGGESTION_ADD',
    suggestion = {
      name = name,
      help = help,
      params = params or nil
    }
  })
end

exports('addSuggestion', addSuggestion)
AddEventHandler('chat:addSuggestion', addSuggestion)

AddEventHandler('chat:addSuggestions', function(suggestions)
  for _, suggestion in ipairs(suggestions) do
    SendNUIMessage({
      type = 'ON_SUGGESTION_ADD',
      suggestion = suggestion
    })
  end
end)

AddEventHandler('chat:removeSuggestion', function(name)
  SendNUIMessage({
    type = 'ON_SUGGESTION_REMOVE',
    name = name
  })
end)

AddEventHandler('chat:addMode', function(mode)
  SendNUIMessage({
    type = 'ON_MODE_ADD',
    mode = mode
  })
end)

AddEventHandler('chat:removeMode', function(name)
  SendNUIMessage({
    type = 'ON_MODE_REMOVE',
    name = name
  })
end)

AddEventHandler('chat:removeAllModes', function()
  SendNUIMessage({
    type = 'ON_MODE_REMOVE_ALL'
  })
end)

AddEventHandler('chat:addTemplate', function(id, html)
  SendNUIMessage({
    type = 'ON_TEMPLATE_ADD',
    template = {
      id = id,
      html = html
    }
  })
end)

AddEventHandler('chat:clear', function(name)
  SendNUIMessage({
    type = 'ON_CLEAR'
  })
end)

RegisterNUICallback('chatResult', function(data, cb)
  chatInputActive = false
  SetNuiFocus(false)

  if not data.canceled then
    local id = PlayerId()

    --deprecated
    local r, g, b = 0, 0x99, 255

    if data.message:sub(1, 1) == '/' then
      ExecuteCommand(data.message:sub(2))
    else
      TriggerServerEvent('_chat:messageEntered', GetPlayerName(id), { r, g, b }, data.message, data.mode)
    end
  end

  cb('ok')
end)

local function refreshCommands()
  if GetRegisteredCommands then
    local registeredCommands = GetRegisteredCommands()

    local suggestions = {}

    for _, command in ipairs(registeredCommands) do
        if IsAceAllowed(('command.%s'):format(command.name)) and command.name ~= 'toggleChat' then
            table.insert(suggestions, {
                name = '/' .. command.name,
                help = ''
            })
        end
    end

    TriggerEvent('chat:addSuggestions', suggestions)
  end
end

local function refreshThemes()
  local themes = {}

  for resIdx = 0, GetNumResources() - 1 do
    local resource = GetResourceByFindIndex(resIdx)

    if GetResourceState(resource) == 'started' then
      local numThemes = GetNumResourceMetadata(resource, 'chat_theme')

      if numThemes > 0 then
        local themeName = GetResourceMetadata(resource, 'chat_theme')
        local themeData = json.decode(GetResourceMetadata(resource, 'chat_theme_extra') or 'null')

        if themeName and themeData then
          themeData.baseUrl = 'nui://' .. resource .. '/'
          themes[themeName] = themeData
        end
      end
    end
  end

  SendNUIMessage({
    type = 'ON_UPDATE_THEMES',
    themes = themes
  })
end

AddEventHandler('onClientResourceStart', function(resName)
  Wait(500)

  refreshCommands()
  refreshThemes()
end)

AddEventHandler('onClientResourceStop', function(resName)
  Wait(500)

  refreshCommands()
  refreshThemes()
end)

RegisterNUICallback('loaded', function(data, cb)
  TriggerServerEvent('chat:init')

  refreshCommands()
  refreshThemes()

  chatLoaded = true

  cb('ok')
end)

local CHAT_HIDE_STATES = {
  SHOW_WHEN_ACTIVE = 0,
  ALWAYS_SHOW = 1,
  ALWAYS_HIDE = 2
}

-- local kvpEntry = GetResourceKvpString('hideState')
local chatHideState = --[[kvpEntry and tonumber(kvpEntry) or]] CHAT_HIDE_STATES.SHOW_WHEN_ACTIVE
local isFirstHide = true

if not isRDR then
  -- if RegisterKeyMapping then
  --   RegisterKeyMapping('toggleChat', 'Toggle chat', 'keyboard', 'l')
  -- end

  -- RegisterCommand('toggleChat', function()
  --   if chatHideState == CHAT_HIDE_STATES.SHOW_WHEN_ACTIVE then
  --     chatHideState = CHAT_HIDE_STATES.ALWAYS_SHOW
  --   elseif chatHideState == CHAT_HIDE_STATES.ALWAYS_SHOW then
  --     chatHideState = CHAT_HIDE_STATES.ALWAYS_HIDE
  --   elseif chatHideState == CHAT_HIDE_STATES.ALWAYS_HIDE then
  --     chatHideState = CHAT_HIDE_STATES.SHOW_WHEN_ACTIVE
  --   end

  --   isFirstHide = false

  --   SetResourceKvp('hideState', tostring(chatHideState))
  -- end, false)
end

Citizen.CreateThread(function()
  SetTextChatEnabled(false)
  SetNuiFocus(false)

  local lastChatHideState = -1
  local origChatHideState = -1

  while true do
    Wait(0)

    if not chatInputActive then
      if IsControlPressed(0, isRDR and `INPUT_MP_TEXT_CHAT_ALL` or 245) --[[ INPUT_MP_TEXT_CHAT_ALL ]] then
        chatInputActive = true
        chatInputActivating = true

        if isFirstLoad then
          SendNUIMessage({
            type = 'ON_MODE_SET_GLOBAL'
          })
          isFirstLoad = false
        end

        SendNUIMessage({
          type = 'ON_OPEN'
        })
      end
    end

    if chatInputActivating then
      if not IsControlPressed(0, isRDR and `INPUT_MP_TEXT_CHAT_ALL` or 245) then
        SetNuiFocus(true)

        chatInputActivating = false
      end
    end

    if chatLoaded then
      local forceHide = IsScreenFadedOut() or IsPauseMenuActive()
      local wasForceHide = false

      if chatHideState ~= CHAT_HIDE_STATES.ALWAYS_HIDE then
        if forceHide then
          origChatHideState = chatHideState
          chatHideState = CHAT_HIDE_STATES.ALWAYS_HIDE
        end
      elseif not forceHide and origChatHideState ~= -1 then
        chatHideState = origChatHideState
        origChatHideState = -1
        wasForceHide = true
      end

      if chatHideState ~= lastChatHideState then
        lastChatHideState = chatHideState

        SendNUIMessage({
          type = 'ON_SCREEN_STATE_CHANGE',
          hideState = chatHideState,
          fromUserInteraction = not forceHide and not isFirstHide and not wasForceHide
        })

        isFirstHide = false
      end
    end
  end
end)

AddEventHandler("XTRA:hideChat",function(flag)
  hideChat = flag
end)

AddEventHandler("XTRA:chatReduceOpacity", function(flag)
  isReducedOpacity = flag
end)

AddEventHandler("onClientResourceStart", function(resourceName)
  if resourceName == "xtra" then
    isFirstLoad = true
  end
end)