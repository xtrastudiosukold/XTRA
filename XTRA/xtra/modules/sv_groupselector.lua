local cfg=module("cfg/cfg_groupselector")

function XTRA.getJobSelectors(source)
    local source=source
    local jobSelectors={}
    local user_id = XTRA.getUserId(source)
    for k,v in pairs(cfg.selectors) do
        for i,j in pairs(cfg.selectorTypes) do
            if v.type == i then
                if j._config.permissions[1]~=nil then
                    if XTRA.hasPermission(XTRA.getUserId(source),j._config.permissions[1])then
                        v['_config'] = j._config
                        v['jobs'] = {}
                        for a,b in pairs(j.jobs) do
                            if XTRA.hasGroup(user_id, b[1]) then
                                table.insert(v['jobs'], b)
                            end
                        end
                        jobSelectors[k] = v
                    end
                else
                    v['_config'] = j._config
                    v['jobs'] = j.jobs
                    jobSelectors[k] = v
                end
            end
        end
    end
    TriggerClientEvent("XTRA:gotJobSelectors",source,jobSelectors)
end

RegisterNetEvent("XTRA:getJobSelectors")
AddEventHandler("XTRA:getJobSelectors",function()
    local source = source
    XTRA.getJobSelectors(source)
end)

function XTRA.removeAllJobs(user_id)
    local source = XTRA.getUserSource(user_id)
    for i,j in pairs(cfg.selectorTypes) do
        for k,v in pairs(j.jobs)do
            if i == 'default' and XTRA.hasGroup(user_id, v[1]) then
                XTRA.removeUserGroup(user_id, v[1])
            elseif i ~= 'default' and XTRA.hasGroup(user_id, v[1]..' Clocked') then
                XTRA.removeUserGroup(user_id, v[1]..' Clocked')
                RemoveAllPedWeapons(GetPlayerPed(source), true)
                XTRAclient.setArmour(source, {0})
                TriggerEvent('XTRA:clockedOffRemoveRadio', source)
            end
        end
    end
    -- remove all faction ranks
    XTRAclient.setPolice(source, {false})
    TriggerClientEvent('XTRA:globalOnPoliceDuty', source, false)
    XTRAclient.setNHS(source, {false})
    TriggerClientEvent('XTRA:globalOnNHSDuty', source, false)
    XTRAclient.setHMP(source, {false})
    TriggerClientEvent('XTRA:globalOnPrisonDuty', source, false)
    XTRAclient.setLFB(source, {false})
    XTRA.updateCurrentPlayerInfo()
    TriggerClientEvent('XTRA:disableFactionBlips', source)
    TriggerClientEvent('XTRA:radiosClearAll', source)
    TriggerClientEvent('XTRA:toggleTacoJob', source, false)
end

RegisterNetEvent("XTRA:jobSelector")
AddEventHandler("XTRA:jobSelector",function(a,b)
    local source = source
    local user_id = XTRA.getUserId(source)
    if #(GetEntityCoords(GetPlayerPed(source)) - cfg.selectors[a].position) > 20 then
        --TriggerEvent("XTRA:acBan", user_id, 11, XTRA.GetPlayerName(user_id), source, 'Triggering job selections from too far away')
        return
    end
    if b == "Unemployed" then
        XTRA.removeAllJobs(user_id)
        XTRAclient.notify(source, {"~g~You are now unemployed."})
    else
        if cfg.selectors[a].type == 'police' then
            if XTRA.hasGroup(user_id, b) then
                XTRA.removeAllJobs(user_id)
                XTRA.addUserGroup(user_id,b..' Clocked')
                XTRAclient.setPolice(source, {true})
                TriggerClientEvent('XTRA:globalOnPoliceDuty', source, true)
                XTRAclient.notify(source, {"~g~Clocked on as "..b.."."})
                RemoveAllPedWeapons(GetPlayerPed(source), true)
                XTRA.sendWebhook('pd-clock', 'XTRA Police Clock On Logs',"> Officer Name: **"..XTRA.GetPlayerName(user_id).."**\n> Officer TempID: **"..source.."**\n> Officer PermID: **"..user_id.."**\n> Clocked Rank: **"..b.."**")
            else
                XTRAclient.notify(source, {"You do not have permission to clock on as "..b.."."})
            end
        elseif cfg.selectors[a].type == 'nhs' then
            if XTRA.hasGroup(user_id, b) then
                XTRA.removeAllJobs(user_id)
                XTRA.addUserGroup(user_id,b..' Clocked')
                XTRAclient.setNHS(source, {true})
                TriggerClientEvent('XTRA:globalOnNHSDuty', source, true)
                XTRAclient.notify(source, {"~g~Clocked on as "..b.."."})
                RemoveAllPedWeapons(GetPlayerPed(source), true)
                XTRA.sendWebhook('nhs-clock', 'XTRA NHS Clock On Logs',"> Medic Name: **"..XTRA.GetPlayerName(user_id).."**\n> Medic TempID: **"..source.."**\n> Medic PermID: **"..user_id.."**\n> Clocked Rank: **"..b.."**")
            else
                XTRAclient.notify(source, {"You do not have permission to clock on as "..b.."."})
            end
        elseif cfg.selectors[a].type == 'lfb' then
            if XTRA.hasGroup(user_id, b) then
                XTRA.removeAllJobs(user_id)
                XTRA.addUserGroup(user_id,b..' Clocked')
                XTRAclient.setLFB(source, {true})
                XTRAclient.notify(source, {"~g~Clocked on as "..b.."."})
                RemoveAllPedWeapons(GetPlayerPed(source), true)
                XTRA.sendWebhook('lfb-clock', 'XTRA LFB Clock On Logs',"> Firefighter Name: **"..XTRA.GetPlayerName(user_id).."**\n> Firefighter TempID: **"..source.."**\n> Firefighter PermID: **"..user_id.."**\n> Clocked Rank: **"..b.."**")
            else
                XTRAclient.notify(source, {"You do not have permission to clock on as "..b.."."})
            end
        elseif cfg.selectors[a].type == 'hmp' then
            if XTRA.hasGroup(user_id, b) then
                XTRA.removeAllJobs(user_id)
                XTRA.addUserGroup(user_id,b..' Clocked')
                XTRAclient.setHMP(source, {true})
                TriggerClientEvent('XTRA:globalOnPrisonDuty', source, true)
                XTRAclient.notify(source, {"~g~Clocked on as "..b.."."})
                RemoveAllPedWeapons(GetPlayerPed(source), true)
                XTRA.sendWebhook('hmp-clock', 'XTRA HMP Clock On Logs',"> Prison Officer Name: **"..XTRA.GetPlayerName(user_id).."**\n> Prison Officer TempID: **"..source.."**\n> Prison Officer PermID: **"..user_id.."**\n> Clocked Rank: **"..b.."**")
            else
                XTRAclient.notify(source, {"You do not have permission to clock on as "..b.."."})
            end
        else
            XTRA.removeAllJobs(user_id)
            XTRA.addUserGroup(user_id,b)
            XTRAclient.notify(source, {"~g~Employed as "..b.."."})
            TriggerClientEvent('XTRA:jobInstructions',source,b)
            if b == 'Taco Seller' then
                TriggerClientEvent('XTRA:toggleTacoJob', source, true)
            end
        end
        TriggerEvent('XTRA:clockedOnCreateRadio', source)
        TriggerClientEvent('XTRA:radiosClearAll', source)
        TriggerClientEvent('XTRA:refreshGunStorePermissions', source)
        XTRA.updateCurrentPlayerInfo()
    end
end)