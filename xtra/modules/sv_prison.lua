MySQL.createCommand("XTRA/get_prison_time","SELECT prison_time FROM xtra_prison WHERE user_id = @user_id")
MySQL.createCommand("XTRA/set_prison_time","UPDATE xtra_prison SET prison_time = @prison_time WHERE user_id = @user_id")
MySQL.createCommand("XTRA/add_prisoner", "INSERT IGNORE INTO xtra_prison SET user_id = @user_id")
MySQL.createCommand("XTRA/get_current_prisoners", "SELECT * FROM xtra_prison WHERE prison_time > 0")
MySQL.createCommand("XTRA/add_jail_stat","UPDATE xtra_police_hours SET total_player_jailed = (total_player_jailed+1) WHERE user_id = @user_id")

local cfg = module("cfg/cfg_prison")
local newDoors = {}
for k,v in pairs(cfg.doors) do
    for a,b in pairs(v) do
        newDoors[b.doorHash] = b
        newDoors[b.doorHash].currentState = 0
    end
end  
local prisonItems = {"toothbrush", "blade", "rope", "metal_rod", "spring"}
local lastCellUsed = 0

AddEventHandler("playerJoining", function()
    local user_id = XTRA.getUserId(source)
    MySQL.execute("XTRA/add_prisoner", {user_id = user_id})
end)

AddEventHandler("XTRA:playerSpawn", function(user_id, source, first_spawn)
    if first_spawn then
        MySQL.query("XTRA/get_prison_time", {user_id = user_id}, function(prisontime)
            if prisontime and #prisontime > 0 and prisontime[1] and prisontime[1].prison_time then 
                if prisontime[1].prison_time > 0 then
                    if lastCellUsed == 27 then
                        lastCellUsed = 0
                    end
                    TriggerClientEvent('XTRA:putInPrisonOnSpawn', source, lastCellUsed+1)
                    TriggerClientEvent('XTRA:forcePlayerInPrison', source, true)
                    TriggerClientEvent('XTRA:prisonCreateBreakOutAreas', source)
                    TriggerClientEvent('XTRA:prisonUpdateClientTimer', source, prisontime[1].prison_time)

                    local prisonItemsTable = {}
                    if cfg.prisonItems and prisonItems and #prisonItems > 0 then
                        for k,v in pairs(cfg.prisonItems) do
                            local item = math.random(1, #prisonItems)
                            prisonItemsTable[prisonItems[item]] = v
                        end
                    end
                    TriggerClientEvent('XTRA:prisonCreateItemAreas', source, prisonItemsTable)
                end
            end
        end)
        TriggerClientEvent('XTRA:prisonUpdateGuardNumber', -1, #XTRA.getUsersByPermission('hmp.menu'))
        TriggerClientEvent('XTRA:prisonSyncAllDoors', source, newDoors)
    end
end)


RegisterNetEvent("XTRA:getNumOfNHSOnline")
AddEventHandler("XTRA:getNumOfNHSOnline", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    MySQL.query("XTRA/get_prison_time", {user_id = user_id}, function(prisontime)
        if prisontime and #prisontime > 0 then
            if prisontime[1].prison_time > 0 then
                TriggerClientEvent('XTRA:prisonSpawnInMedicalBay', source)
                XTRAclient.RevivePlayer(source, {})
            else
                TriggerClientEvent('XTRA:getNumberOfDocsOnline', source, #XTRA.getUsersByPermission('nhs.menu'))
            end
        end
    end)
end)

RegisterServerEvent("XTRA:prisonArrivedForJail")
AddEventHandler("XTRA:prisonArrivedForJail", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    MySQL.query("XTRA/get_prison_time", {user_id = user_id}, function(prisontime)
        if prisontime ~= nil then 
            if prisontime[1].prison_time > 0 then
                XTRA.setBucket(source, 0)
                TriggerClientEvent('XTRA:unHandcuff', source, false)
                TriggerClientEvent('XTRA:toggleHandcuffs', source, false)
                TriggerClientEvent('XTRA:forcePlayerInPrison', source, true)
                TriggerClientEvent('XTRA:prisonCreateBreakOutAreas', source)
                TriggerClientEvent('XTRA:prisonUpdateClientTimer', source, prisontime[1].prison_time)
            end
        end
    end)
end)

local prisonPlayerJobs = {}

RegisterServerEvent("XTRA:prisonStartJob")
AddEventHandler("XTRA:prisonStartJob", function(job)
    local source = source
    local user_id = XTRA.getUserId(source)
    prisonPlayerJobs[user_id] = job
end)

RegisterServerEvent("XTRA:prisonEndJob")
AddEventHandler("XTRA:prisonEndJob", function(job)
    local source = source
    local user_id = XTRA.getUserId(source)
    if prisonPlayerJobs[user_id] == job then
        prisonPlayerJobs[user_id] = nil
        MySQL.query("XTRA/get_prison_time", {user_id = user_id}, function(prisontime)
            if prisontime ~= nil then 
                if prisontime[1].prison_time > 21 then
                    MySQL.execute("XTRA/set_prison_time", {user_id = user_id, prison_time = prisontime[1].prison_time - 20})
                    TriggerClientEvent('XTRA:prisonUpdateClientTimer', source, prisontime[1].prison_time - 20)
                    XTRAclient.notify(source, {"~g~Prison time reduced by 20s."})
                end
            end
        end)
    end
end)

RegisterServerEvent("XTRA:jailPlayer")
AddEventHandler("XTRA:jailPlayer", function(player)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'police.armoury') then
        XTRAclient.getNearestPlayers(source,{15},function(nplayers)
            if nplayers[player] then
                XTRAclient.isHandcuffed(player,{}, function(handcuffed)  -- check handcuffed
                    if handcuffed then
                        -- check for gc in cfg 
                        MySQL.query("XTRA/get_prison_time", {user_id = XTRA.getUserId(player)}, function(prisontime)
                            if prisontime ~= nil then 
                                if prisontime[1].prison_time == 0 then
                                    XTRA.prompt(source,"Jail Time (in minutes):","",function(source,jailtime) 
                                        local jailtime = math.floor(tonumber(jailtime) * 60)
                                        if jailtime > 3 and jailtime <= cfg.maxTimeNotGc then
                                            MySQL.execute("XTRA/set_prison_time", {user_id = XTRA.getUserId(player), prison_time = jailtime})
                                            if lastCellUsed == 27 then
                                                lastCellUsed = 0
                                            end
                                            TriggerClientEvent('XTRA:prisonTransportWithBus', player, lastCellUsed+1)
                                            XTRA.setBucket(player, lastCellUsed+1)
                                            local prisonItemsTable = {}
                                            for k,v in pairs(cfg.prisonItems) do
                                                local item = math.random(1, #prisonItems)
                                                prisonItemsTable[prisonItems[item]] = v
                                            end
                                            exports['xtra']:execute("SELECT * FROM `xtra_police_hours` WHERE user_id = @user_id", {user_id = user_id}, function(result)
                                                if result ~= nil then 
                                                    for k,v in pairs(result) do
                                                        if v.user_id == user_id then
                                                            exports['xtra']:execute("UPDATE xtra_police_hours SET total_players_jailed = @total_players_jailed WHERE user_id = @user_id", {user_id = user_id, total_players_jailed = v.total_players_jailed + 1}, function() end)
                                                            return
                                                        end
                                                        TriggerClientEvent('XTRA:toggleHandcuffs', XTRA.getUserSource(v.user_id), false)
                                                    end
                                                    exports['xtra']:execute("INSERT INTO xtra_police_hours (`user_id`, `total_players_jailed`, `username`) VALUES (@user_id, @total_players_jailed, @username);", {user_id = user_id, total_players_jailed = 1}, function() end) 
                                                end
                                            end)
                                            TriggerClientEvent('XTRA:prisonCreateItemAreas', player, prisonItemsTable)
                                            TriggerClientEvent('XTRA:playHandcuffSound', -1, GetEntityCoords(GetPlayerPed(source)))
                                            XTRAclient.notify(source, {"~g~Jailed Player."})
                                            XTRA.sendWebhook('jail-player', 'XTRA Jail Logs',"> Officer Name: **"..XTRA.GetPlayerName(user_id).."**\n> Officer TempID: **"..source.."**\n> Officer PermID: **"..user_id.."**\n> Criminal Name: **"..XTRA.GetPlayerName(user_id).."**\n> Criminal PermID: **"..XTRA.getUserId(player).."**\n> Criminal TempID: **"..player.."**\n> Duration: **"..math.floor(jailtime/60).." minutes**")
                                        else
                                            XTRAclient.notify(source, {"Invalid time."})
                                        end
                                    end)
                                else
                                    XTRAclient.notify(source, {"Player is already in prison."})
                                end
                            end
                        end)
                    else
                        XTRAclient.notify(source, {"You must have the player handcuffed."})
                    end
                end)
            else
                XTRAclient.notify(source, {"Player not found."})
            end
        end)
    end
end)


Citizen.CreateThread(function()
    while true do
        MySQL.query("XTRA/get_current_prisoners", {}, function(currentPrisoners)
            if currentPrisoners and #currentPrisoners > 0 then
                for k,v in pairs(currentPrisoners) do
                    if XTRA.getUserSource(v.user_id) and v.prison_time > 0 then
                        MySQL.execute("XTRA/set_prison_time", {user_id = v.user_id, prison_time = v.prison_time-1})
                        if v.prison_time-1 == 0 then
                            TriggerClientEvent('XTRA:prisonStopClientTimer', XTRA.getUserSource(v.user_id))
                            TriggerClientEvent('XTRA:prisonReleased', XTRA.getUserSource(v.user_id))
                            TriggerClientEvent('XTRA:forcePlayerInPrison', XTRA.getUserSource(v.user_id), false)
                            XTRAclient.setHandcuffed(XTRA.getUserSource(v.user_id), {false})
                        end
                    end
                end
            end
        end)
        Citizen.Wait(1000)
    end
end)

RegisterCommand('unjail', function(source)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'admin.noclip') then
        XTRA.prompt(source,"Enter Temp ID:","",function(source, player) 
            local player = tonumber(player)
            if player ~= nil then
                MySQL.execute("XTRA/set_prison_time", {user_id = XTRA.getUserId(player), prison_time = 0})
                TriggerClientEvent('XTRA:prisonStopClientTimer', player)
                TriggerClientEvent('XTRA:prisonReleased', player)
                TriggerClientEvent('XTRA:forcePlayerInPrison', player, false)
                XTRAclient.setHandcuffed(player, {false})
                XTRAclient.notify(source, {"~g~Target will be released soon."})
            else
                XTRAclient.notify(source, {"Invalid ID."})
            end
        end)
    end
end)


AddEventHandler("XTRA:playerSpawn", function(user_id, source, first_spawn)
    if first_spawn then
        TriggerClientEvent('XTRA:prisonUpdateGuardNumber', -1, #XTRA.getUsersByPermission('hmp.menu'))
    end
end)

local currentLockdown = false
RegisterServerEvent("XTRA:prisonToggleLockdown")
AddEventHandler("XTRA:prisonToggleLockdown", function(lockdownState)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'dev.menu') then -- change this to the hmp hq permission
        currentLockdown = lockdownState
        if currentLockdown then
            TriggerClientEvent('XTRA:prisonSetAllDoorStates', -1, 1)
        else
            TriggerClientEvent('XTRA:prisonSetAllDoorStates', -1)
        end
    end
end)

RegisterServerEvent("XTRA:prisonSetDoorState")
AddEventHandler("XTRA:prisonSetDoorState", function(doorHash, state)
    local source = source
    local user_id = XTRA.getUserId(source)
    TriggerClientEvent('XTRA:prisonSyncDoor', -1, doorHash, state)
end)

RegisterServerEvent("XTRA:enterPrisonAreaSyncDoors")
AddEventHandler("XTRA:enterPrisonAreaSyncDoors", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    TriggerClientEvent('XTRA:prisonAreaSyncDoors', source, doors)
end)

-- on pickup 
-- XTRA:prisonRemoveItemAreas(item)

-- hmp should be able to see all prisoners
-- XTRA:requestPrisonerData