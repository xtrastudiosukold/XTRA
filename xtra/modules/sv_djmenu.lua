-- Table to track DJ sessions
local c = {}

-- Command: Toggle DJ Menu
RegisterCommand("djmenu", function(source, args, rawCommand)
    local user_id = XTRA.getUserId(source)
    if XTRA.hasGroup(user_id, "DJ") then
        TriggerClientEvent('XTRA:toggleDjMenu', source)
    end
end)

-- Command: Toggle DJ Admin Menu
RegisterCommand("djadmin", function(source, args, rawCommand)
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, "admin.noclip") then
        TriggerClientEvent('XTRA:toggleDjAdminMenu', source, c)
    end
end)

-- Command: Play a song
RegisterCommand("play", function(source, args, rawCommand)
    local user_id = XTRA.getUserId(source)
    if XTRA.hasGroup(user_id, "DJ") and #args > 0 then
        TriggerClientEvent('XTRA:finaliseSong', source, args[1])
    end
end)

-- Server Event: Admin Stop Song
RegisterServerEvent("XTRA:adminStopSong")
AddEventHandler("XTRA:adminStopSong", function(param)
    if c[param] then
        TriggerClientEvent('XTRA:stopSong', -1, c[param][2])
        c[param] = nil
        TriggerClientEvent('XTRA:toggleDjAdminMenu', source, c)
    end
end)

-- Server Event: Play DJ Song
RegisterServerEvent("XTRA:playDjSongServer")
AddEventHandler("XTRA:playDjSongServer", function(param, coords)
    local user_id = XTRA.getUserId(source)
    local name = XTRA.GetPlayerName(user_id)
    c[tostring(source)] = {param, coords, user_id, name, "true"}
    TriggerClientEvent('XTRA:playDjSong', -1, param, coords, user_id, name)
end)

-- Server Event: Skip Song
RegisterServerEvent("XTRA:skipServer")
AddEventHandler("XTRA:skipServer", function(coords, param)
    TriggerClientEvent('XTRA:skipDj', -1, coords, param)
end)

-- Server Event: Stop Song
RegisterServerEvent("XTRA:stopSongServer")
AddEventHandler("XTRA:stopSongServer", function(coords)
    c[tostring(source)] = nil
    TriggerClientEvent('XTRA:stopSong', -1, coords)
end)

-- Server Event: Update Volume
RegisterServerEvent("XTRA:updateVolumeServer")
AddEventHandler("XTRA:updateVolumeServer", function(coords, volume)
    TriggerClientEvent('XTRA:updateDjVolume', -1, coords, volume)
end)

-- Server Event: Request Current Progress
RegisterServerEvent("XTRA:requestCurrentProgressServer")
AddEventHandler("XTRA:requestCurrentProgressServer", function(a, b)
    TriggerClientEvent('XTRA:requestCurrentProgress', -1, a, b)
end)

-- Server Event: Return Progress
RegisterServerEvent("XTRA:returnProgressServer")
AddEventHandler("XTRA:returnProgressServer", function(x, y, z)
    for k, v in pairs(c) do
        if tonumber(k) == XTRA.getUserSource(x) then
            TriggerClientEvent('XTRA:returnProgress', -1, x, y, z, v[1])
        end
    end
end)
