local cfg = module("cfg/cfg_radios")

local function getRadioType(user_id)
    if XTRA.hasPermission(user_id, "police.armoury") then
        return "Police"
    elseif XTRA.hasPermission(user_id, "nhs.menu") then
        return "NHS"
    elseif XTRA.hasPermission(user_id, "hmp.menu") then
        return "HMP"
    end
    return false
end

local function getFactionRadioType(user_id)
    if XTRA.hasPermission(user_id, "nhs.menu") or XTRA.hasPermission(user_id, "hmp.menu") or XTRA.hasPermission(user_id, "police.armoury") then
        return "Faction"
    end
    return false
end


local radioChannels = {
    ['Police'] = {
        name = 'Police',
        players = {},
        channel = 1,
        callsign = true,
    },
    ['NHS'] = {
        name = 'NHS',
        players = {},
        channel = 2,
    },
    ['HMP'] = {
        name = 'HMP',
        players = {},
        channel = 3,
    },
    ['Faction'] = {
        name = 'Faction',
        players = {},
        channel = 4,
    },
}

function createRadio(source)
    local source = source
    local user_id = XTRA.getUserId(source)
    local radioType = getRadioType(user_id)
    local factionType = getFactionRadioType(user_id)
    
    if radioType then
        Wait(1000)
        for k,v in pairs(cfg.sortOrder[radioType]) do
            if XTRA.hasPermission(user_id, v) then
                local sortOrder = k
                local name = XTRA.GetPlayerName(user_id)
                local callsign = getCallsign(radioType, source, user_id, radioType)
                if radioChannels[radioType].callsign then
                    if callsign then
                        name = name.." ["..callsign.."]"
                    end
                end
                radioChannels[radioType]['players'][source] = {name = name, sortOrder = sortOrder}
                TriggerClientEvent('XTRA:radiosCreateChannel', source, radioChannels[radioType].channel, radioChannels[radioType].name, radioChannels[radioType].players, true)
                TriggerClientEvent('XTRA:radiosAddPlayer', -1, radioChannels[radioType].channel, source, {name = name, sortOrder = sortOrder})
                TriggerClientEvent('XTRA:radiosCreateChannel', source, radioChannels[factionType].channel, radioChannels[factionType].name, radioChannels[factionType].players, false)
                TriggerClientEvent('XTRA:radiosAddPlayer', -1, radioChannels[factionType].channel, source, {name = name, sortOrder = sortOrder})
                TriggerEvent("XTRA:ChatClockOn", source, radioType, true)
            end
        end
    elseif XTRA.getInventoryItemAmount(user_id, 'civilian_radio') >= 1 then
        local gang = XTRA.getGangName(user_id)
        if gang and gang ~= "" then
            if not radioChannels[gang] then
                radioChannels[gang] = {name = gang, players = {}, channel = math.random(5, 1000)}
            end
            
            local name = XTRA.GetPlayerName(user_id)
            radioChannels[gang]['players'][source] = {name = name, sortOrder = 1}
            TriggerClientEvent('XTRA:radiosCreateChannel', source, radioChannels[gang].channel, radioChannels[gang].name, radioChannels[gang].players, true)
            TriggerClientEvent('XTRA:radiosAddPlayer', -1, radioChannels[gang].channel, source, {name = name, sortOrder = 1})
        end
    end
end




function removeRadio(source)
    for a,b in pairs(radioChannels) do
        if next(radioChannels[a]['players']) then
            for k,v in pairs(radioChannels[a]['players']) do
                if k == source then
                    if a then
                        TriggerEvent("XTRA:ChatClockOn", source, a, false)
                    end
                    TriggerClientEvent('XTRA:radiosRemovePlayer', -1, radioChannels[a].channel, k)
                    radioChannels[a]['players'][source] = nil
                end
            end
        end
    end
end

RegisterServerEvent("XTRA:clockedOnCreateRadio")
AddEventHandler("XTRA:clockedOnCreateRadio", function(source)
    local source = source
    syncRadio(source)
end)

RegisterServerEvent("XTRA:clockedOffRemoveRadio")
AddEventHandler("XTRA:clockedOffRemoveRadio", function(source)
    local source = source
    syncRadio(source)
end)

AddEventHandler("XTRA:playerSpawn", function(user_id, source, first_spawn)
    local source = source
    syncRadio(source)
end)

AddEventHandler('playerDropped', function(reason)
    local source = source
    removeRadio(source)
end)

RegisterCommand("reconnectradio", function(source, args, rawCommand) -- To Recoonect Source To Radio
    local source = source
    syncRadio(source)
end)

function syncRadio(source)
    removeRadio(source)
    TriggerClientEvent('XTRA:radiosClearAll', source)
    Wait(500)
    createRadio(source)
end

RegisterServerEvent("XTRA:radiosSetIsMuted")
AddEventHandler("XTRA:radiosSetIsMuted", function(mutedState)
    local source = source
    local user_id = XTRA.getUserId(source)
    local radioType = getRadioType(user_id)
    if radioType then
        for k,v in pairs(radioChannels[radioType]['players']) do
            if k == source then
                TriggerClientEvent('XTRA:radiosSetPlayerIsMuted', -1, radioChannels[radioType].channel, k, mutedState)
            end
        end
    else
        local gang = XTRA.getGangName(user_id)
        if gang then
            for k,v in pairs(radioChannels[gang]['players']) do
                if k == source then
                    TriggerClientEvent('XTRA:radiosSetPlayerIsMuted', -1, radioChannels[gang].channel, k, mutedState)
                end
            end
        end
    end
end)


AddEventHandler("XTRA:ChatClockOn", function(source, mode, state)
    local policechat = {
        name = "Police",
        displayName = "Police",
        isChannel = "Police",
        color = {255, 0, 0},
        isGlobal = false,
    }
    local nhschat = {
        name = "NHS",
        displayName = "NHS",
        isChannel = "NHS",
        color = {255, 0, 0},
        isGlobal = false,
    }
    local hmpchat = {
        name = "HMP",
        displayName = "HMP",
        isChannel = "HMP",
        color = {255, 0, 0},
        isGlobal = false,
    }
    if state then
        if mode == "Police" then
            TriggerClientEvent('chat:addMode', source, policechat)
        elseif mode == "NHS" then
            TriggerClientEvent('chat:addMode', source, nhschat)
        elseif mode == "HMP" then
            TriggerClientEvent('chat:addMode', source, hmpchat)
        end
    else
        TriggerClientEvent('chat:removeMode', source, mode)
    end
end)
        