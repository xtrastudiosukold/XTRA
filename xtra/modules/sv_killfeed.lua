local f = module("xtra-vehicles", "cfg/weapons")
f = f.weapons
illegalWeapons = f.nativeWeaponModelsToNames

local function getWeaponName(weapon)
    for k,v in pairs(f) do
        if weapon == 'Mosin Nagant' then
            return 'Heavy'
        elseif weapon == 'Nerf Mosin' then
            return 'Heavy'
        elseif weapon == 'CB Mosin' then
            return 'Heavy'
        elseif weapon == 'Fists' then
            return 'Fist'
        elseif weapon == 'Fire' then
            return 'Fire'
        elseif weapon == 'Explosion' then
            return 'Explode'
        elseif weapon == 'Suicide' then
            return 'Suicide'
        end
        if v.name == weapon then
            return v.class
        end
    end
    return "Unknown"
end

local function getweaponnames(weapon)
    for k,v in pairs(f) do
        if v.name == weapon then
            return v.name
        end
    end
    return "Unknown"
end

local function checkIfMosin(weapon)
    for k, v in pairs(f) do
        if v.name == weapon and string.find(weapon, "mosin") then
            return true
        end
    end
end



RegisterNetEvent('XTRA:onPlayerKilled')
AddEventHandler('XTRA:onPlayerKilled', function(killtype, killer, weaponhash, suicide, distance, combat)
    local source = source
    local killergroup = 'none'
    local killedgroup = 'none'
    local killer_id = XTRA.getUserId(killer)
    if distance ~= nil then
        distance = math.floor(distance)
    end

    if killtype == 'killed' then
        if XTRA.hasPermission(XTRA.getUserId(source), 'police.armoury') then
            killedgroup = 'police'
        elseif XTRA.hasPermission(XTRA.getUserId(source), 'nhs.menu') then
            killedgroup = 'nhs'
        end

        if XTRA.hasPermission(XTRA.getUserId(killer), 'police.armoury') then
            killergroup = 'police'
        elseif XTRA.hasPermission(XTRA.getUserId(killer), 'nhs.menu') then
            killergroup = 'nhs'
        end

        if killer ~= nil then
            TriggerClientEvent('XTRA:newKillFeed', -1, XTRA.GetPlayerName(killer_id), XTRA.GetPlayerName(XTRA.getUserId(source)), getWeaponName(weaponhash), suicide, distance, killedgroup, killergroup)
            TriggerClientEvent('XTRA:deathSound', -1, GetEntityCoords(GetPlayerPed(source)))
            if XTRA.isPurge then
                TriggerEvent("XTRA:AddKill", killer_id)
            end
            if not XTRA.hasPermission(killer_id,"police.armoury") and not XTRAclient.isStaffedOn(killer) and not XTRA.isDeveloper(killer_id) then
                XTRAclient.getPlayerCombatTimer(killer,{},function(timer)
                    if timer < 57 then
                        TriggerClientEvent("XTRA:takeClientScreenshotAndUpload", killer, XTRA.getWebhook("trigger-bot"))
                        Citizen.Wait(1500)
                        XTRA.sendWebhook("trigger-bot", "XTRA Trigger Bot Logs", "> Player Name: **"..XTRA.GetPlayerName(killer_id).."**\n> Player User ID: **"..XTRA.getUserId(killer).."**")
                    end
                end)
            end
            if not XTRA.isPurge() then
                if not gettingVideo then
                    gettingVideo = true
                    TriggerClientEvent("XTRA:takeClientVideoAndUpload", killer, XTRA.getWebhook('killvideo'))
                    gettingVideo = false
                    Wait(100000)
                end
            end
            if XTRA.GetPlayerName(killer_id) and XTRA.GetPlayerName(XTRA.getUserId(source)) and XTRA.getUserId(killer) and XTRA.getUserId(source) and getweaponnames(weaponhash) and distance then
                XTRA.sendWebhook('kills', "XTRA Kill Logs", "> Killer Name: **"..XTRA.GetPlayerName(killer_id).."**\n> Killer ID: **"..XTRA.getUserId(killer).."**\n> Weapon: **"..getweaponnames(weaponhash).."**\n> Victim Name: **"..XTRA.GetPlayerName(XTRA.getUserId(source)).."**\n> Victim ID: **"..XTRA.getUserId(source).."**\n> Distance: **"..distance.."m**")
            end
        else
            TriggerClientEvent('XTRA:newKillFeed', -1, XTRA.GetPlayerName(XTRA.getUserId(source)), XTRA.GetPlayerName(XTRA.getUserId(source)), 'suicide', suicide, distance, killedgroup, killergroup)
            TriggerClientEvent('XTRA:deathSound', -1, GetEntityCoords(GetPlayerPed(source)))
        end
    end
end)

AddEventHandler('weaponDamageEvent', function(sender, ev)
    local user_id = XTRA.getUserId(sender)

    -- Check if user_id is not nil
    if user_id then
        local name = XTRA.GetPlayerName(user_id)
        if ev.weaponDamage ~= 0 then
            if ev.weaponType == 911657153 and not XTRA.hasPermission(user_id, 'police.armoury') or ev.weaponType == 3452007600 then
                TriggerEvent("XTRA:acBan", user_id, 8, name, sender, "Using a weapon that is not allowed")
            end
            if ev.weaponType == 133987706 then
                print("Weapon Type 133987706 has been flagged by " ..name.. " | " ..user_id)
            end
            XTRA.sendWebhook('damage', "XTRA Damage Logs", "> Player Name: **"..name.."**\n> Player Temp ID: **"..sender.."**\n> Player Perm ID: **"..user_id.."**\n> Damage: **"..ev.weaponDamage.."**\n> Weapon : **"..getweaponnames(ev.weaponType).."**")
        end
    else
        -- Handle the case where user_id is nil
        print("Error: user_id is nil for sender " .. tostring(sender))
    end
end)
