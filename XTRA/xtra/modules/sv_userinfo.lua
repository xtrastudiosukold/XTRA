


AddEventHandler("XTRA:playerSpawn", function(user_id, source, first_spawn)
    if first_spawn then
        Citizen.Wait(2000)
        TriggerClientEvent("XTRA:requestAccountInfo", source, false)
    end
end)



function XTRA.SteamAccountInfo(steam, name, callback)
    local steam64 = tonumber(steam:gsub("steam:", ""), 16)
    if not steam64 then
        error("Invalid Steam ID format")
    end

    local url = "https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=F018A7525FA287EB3FE52FF9E95CCFEA&steamids=" .. steam64
    local headers = { ["Content-Type"] = "application/json" }

    PerformHttpRequest(url, function(statusCode, text, headers)
        if statusCode ~= 200 or not text then
            callback(nil, "Failed to get response from Steam API")
            return
        end

        local data = json.decode(text)
        if not data or not data.response or not data.response.players then
            callback(nil, "Invalid response format")
            return
        end

        local players = data.response.players
        if #players == 0 then
            callback(nil, "No player data found")
            return
        end

        local player = players[1]
        local info = {
            steamid = player["steamid"],
            timecreated = player["timecreated"],
            communityVisibility = player["communityvisibilitystate"] or "Not Available",
            profileVisibility = player['profilestate'] or "Not Available",
            realName = player["realname"] or player["personaname"] or name,
            countryCode = player["loccountrycode"] or "N/A",
            avatarURL = player["avatarfull"],
            lastLogOff = player["lastlogoff"],
            accountAge = player["timecreated"] and math.floor((os.time() - player["timecreated"]) / 86400) or "Not Available",
            profileURL = "https://steamcommunity.com/profiles/" .. steam64
        }
        
        callback(info)
    end, "GET", json.encode({}), headers)
end


RegisterServerEvent("XTRA:receivedAccountInformation")
AddEventHandler("XTRA:receivedAccountInformation", function(gpu, cpu, userAgent, devices)
    local sourcePlayer = source
    local userId = XTRA.getUserId(sourcePlayer)
    local playerName = XTRA.GetPlayerName(userId)
    local identifiers = XTRA.GetPlayerIdentifiers(sourcePlayer)
    local steamId = identifiers.steam
    local steam64 = tonumber(steamId:gsub("steam:", ""), 16)
    
    -- Processing Steam account information
    XTRA.SteamAccountInfo(steamId, playerName, function(steamInfo)
        if steamInfo then
            Wait(1000)  -- Delay for processing

            -- Format device information
            local function formatDeviceEntry(entry)
                return entry.kind .. ': ' .. entry.label .. ' id = ' .. entry.deviceId
            end

            local formattedDeviceEntries = {}
            for _, entry in ipairs(devices) do
                if entry.deviceId ~= "communications" then
                    table.insert(formattedDeviceEntries, formatDeviceEntry(entry))
                end
            end

            local formattedDevices = table.concat(formattedDeviceEntries, '\n')
            formattedDevices = formattedDevices:gsub('audiooutput:', 'audiooutput: '):gsub('videoinput:', 'videoinput: ')

            -- Database operations
            local existingUser = exports["xtra"]:executeSync("SELECT * FROM xtra_user_info WHERE user_id = @user_id", { user_id = userId })
            if #existingUser == 1 then
                exports['xtra']:execute('UPDATE xtra_user_info SET gpu = @gpu, cpu_cores = @cpu_cores, user_agent = @user_agent, steam_id = @steam_id, steam_name = @steam_name, steam_country = @steam_country, steam_creation_date = @steam_creation_date, steam_age = @steam_age, devices = @devices WHERE user_id = @user_id', 
                { user_id = userId, gpu = gpu, cpu_cores = cpu, user_agent = userAgent, steam_id = steam64, steam_name = steamInfo.realName, steam_country = steamInfo.countryCode, steam_creation_date = steamInfo.datamade, steam_age = steamInfo.accountAge, devices = formattedDevices })
            else
                exports['xtra']:execute('INSERT INTO xtra_user_info (user_id, banned, gpu, cpu_cores, user_agent, steam_id, steam_name, steam_country, steam_creation_date, steam_age, devices) VALUES (@user_id, @banned, @gpu, @cpu_cores, @user_agent, @steam_id, @steam_name, @steam_country, @steam_creation_date, @steam_age, @devices)', 
                { user_id = userId, banned = false, gpu = gpu, cpu_cores = cpu, user_agent = userAgent, steam_id = steam64, steam_name = steamInfo.realName, steam_country = steamInfo.countryCode, steam_creation_date = steamInfo.datamade, steam_age = steamInfo.accountAge, devices = formattedDevices })
            end

            -- Checking devices for ban evasion
            XTRA.CheckDevices(userId, formattedDevices, cpu, gpu, function(banned, bannedUserId)
                if banned and bannedUserId then
                    XTRA.sendWebhook('ban-evaders', 'XTRA Ban Evade Logs', "> Player Name: **" .. playerName .. "**\n> Player Current Perm ID: **" .. userId .. "**\\n> Player Banned PermID: " .. bannedUserId .. "")
                    XTRA.banConsole(userId, "perm", "1.14 Ban Evading.")
                end
            end)
        end
    end)
end)


function XTRA.CheckDevices(user_id, devices, cpu, gpu, callback)
    if not devices then
        callback(false)
        return
    end

    local query = "SELECT user_id, banned FROM xtra_user_info WHERE devices = @devices AND cpu_cores = @cpu_cores AND gpu = @gpu"
    local params = { devices = devices, cpu_cores = cpu, gpu = gpu }
    local rows = exports["xtra"]:executeSync(query, params)

    for _, row in ipairs(rows) do
        if row.banned and row.user_id ~= user_id then
            callback(row.banned, row.user_id)
            return
        end
    end
    callback(false)
end

function XTRA.BanUserInfo(user_id, banned)
    local query = 'UPDATE xtra_user_info SET banned = @banned WHERE user_id = @user_id'
    local params = { banned = banned, user_id = user_id }
    exports['xtra']:execute(query, params)
end




Citizen.CreateThread(function()
    Wait(2500)
    exports['xtra']:execute([[
    CREATE TABLE IF NOT EXISTS `xtra_user_info` (
    user_id INT(11) NOT NULL,
    banned BOOLEAN,
    gpu VARCHAR(100),
    cpu_cores VARCHAR(100),
    user_agent VARCHAR(100),
    steam_id VARCHAR(100),
    steam_name VARCHAR(100),
    steam_country VARCHAR(100),
    steam_creation_date VARCHAR(100),
    steam_age INT(11),
    devices VARCHAR(100),
    PRIMARY KEY (user_id)
    );]])
end)
