XTRA = {}

function table.has(table, val)
    for i=1, #table do
        if table[i] == val then
            return true
        end
    end
    return false
end

function table.find(table, val)  -- find hte key of the value
    for k,v in pairs(table) do
        if v == val then return k end
    end
    return false
end

function table.add(table, value)
    table[#table+1] = value
end

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

function table.count(self)
    local count = 0
    for _, _ in pairs(self) do
        count = count + 1
    end
    return count
end

function table.copy(obj, seen)
    if type(obj) ~= 'table' then return obj end
    if seen and seen[obj] then return seen[obj] end
    local s = seen or {}
    local res = setmetatable({}, getmetatable(obj))
    s[obj] = res
    for k, v in pairs(obj) do res[table.copy(k, s)] = table.copy(v, s) end
    return res
end

function sortedKeys(query, sortFunction)
	local keys, len = {}, 0
	for k,_ in pairs(query) do
		len = len + 1
		keys[len] = k
	end
	table.sort(keys, sortFunction)
	return keys
end


function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k,v in pairs(o) do
            if type(k) ~= 'number' then k = '"'..k..'"' end
            s = s .. '['..k..'] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

function math.round(a, b)
	return (math.floor(a / b) * b)
end

function math.rounddp(a, b)
	local b = b or 0
	return(math.floor(a*10^b+0.5)/10^b)
end

function table.contentEquals(o1, o2, ignore_mt)
    if o1 == o2 then return true end
    local o1Type = type(o1)
    local o2Type = type(o2)
    if o1Type ~= o2Type then return false end
    if o1Type ~= 'table' then return false end

    if not ignore_mt then
        local mt1 = getmetatable(o1)
        if mt1 and mt1.__eq then
            --compare using built in method
            return o1 == o2
        end
    end

    local keySet = {}

    for key1, value1 in pairs(o1) do
        local value2 = o2[key1]
        if value2 == nil or table.contentEquals(value1, value2, ignore_mt) == false then
            return false
        end
        keySet[key1] = true
    end

    for key2, _ in pairs(o2) do
        if not keySet[key2] then return false end
    end
    return true
end

function table.empty(self)
    for _, _ in pairs(self) do
        return false
    end
    return true
end
--date functions
local days = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}
local months = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"}

function getDaySuffix(day)
    local suffix = day:sub(-1)
    if suffix == "1" then
        if day ~= 11 then
            suffix = "st"
        else
            suffix = "th"
        end
    elseif suffix == "2" then
        if day ~= 12 then
            suffix = "nd"
        else
            suffix = "th"
        end
    elseif suffix == "3" then
        if day ~= 13 then
            suffix = "rd"
        else
            suffix = "th"
        end
    else
        suffix = "th"
    end
    return suffix
end

function getDayName(day) -- takes day int
    return days[day]
end

function getMonthName(month) -- takes month int
    return months[month]
end

function formatTime(time) -- returns table of numerical values
    local timeTable = {}
    timeTable.years = math.floor(time/31556926)
    local remaining = time % 31556926
    timeTable.months = math.floor(remaining/2629743)
    remaining = remaining % 2629743
    timeTable.days = math.floor(remaining/86400)
    remaining = remaining % 86400
    timeTable.hours = math.floor(remaining/3600)
    remaining = remaining % 3600
    timeTable.minutes = math.floor(remaining/60)
    remaining = remaining % 60
    timeTable.seconds = math.floor(remaining)
    return timeTable
end

function formatTimeString(timeTable) -- called after formatTime
    local timeString = ""
    if timeTable.years ~= nil and timeTable.years > 0 then
        if timeTable.years == 1 then
            timeString = "1 Year"
        else
            timeString = string.format("%u Years", timeTable.years)
        end
    end
    if timeTable.months ~= nil and timeTable.months > 0 then
        if timeTable.months == 1 then
            if timeString == "" then
                timeString = "1 Month"
            else
                timeString = timeString..", 1 Month"
            end
        else
            if timeString == "" then
                timeString = string.format("%u Months", timeTable.months)
            else
                timeString = string.format("%s, %u Months",timeString, timeTable.months)
            end
        end
    end
    if timeTable.days ~= nil and timeTable.days > 0 then
        if timeTable.days == 1 then
            if timeString == "" then
                timeString = "1 Day"
            else
                timeString = timeString..", 1 Day"
            end
        else
            if timeString == "" then
                timeString = string.format("%u Days", timeTable.days)
            else
                timeString = string.format("%s, %u Days",timeString, timeTable.days)
            end
        end
    end
    if timeTable.hours ~= nil and timeTable.hours > 0 then
        if timeTable.hours == 1 then
            if timeString == "" then
                timeString = "1 Hour"
            else
                timeString = timeString..", 1 Hour"
            end
        else
            if timeString == "" then
                timeString = string.format("%u Hour", timeTable.hours)
            else
                timeString = string.format("%s, %u Hours",timeString, timeTable.hours)
            end
        end
    end
    if timeTable.minutes ~= nil and timeTable.minutes > 0 then
        if timeTable.minutes == 1 then
            if timeString == "" then
                timeString = "1 Minute"
            else
                timeString = timeString..", 1 Minute"
            end
        else
            if timeString == "" then
                timeString = string.format("%u Minutes", timeTable.minutes)
            else
                timeString = string.format("%s, %u Minutes",timeString, timeTable.minutes)
            end
        end
    end
    if timeTable.seconds ~= nil and timeTable.seconds > 0 then
        if timeTable.seconds == 1 then
            if timeString == "" then
                timeString = "1 Second"
            else
                timeString = timeString.."and  1 Second"
            end
        else
            if timeString == "" then
                timeString = string.format("%u Seconds", timeTable.seconds)
            else
                timeString = string.format("%s and %u Seconds",timeString, timeTable.seconds)
            end
        end
    end
    return timeString
end

local UUIDs = {}

local uuidTypes = {
    ["alphabet"] = "abcdefghijklmnopqrstuvwxyz",
    ["numerical"] = "0123456789",
    ["alphanumeric"] = "abcdefghijklmnopqrstuvwxyz0123456789",
}

local function randIntKey(length, type)
    local pw, rnd = "", 0
    local chars = uuidTypes[type]  -- Access the string directly from uuidTypes

    -- Check if the type is valid
    if not chars then
        error("Invalid type: " .. tostring(type))
        return nil
    end

    repeat
        rnd = math.random(#chars)  -- Get a random index within the length of chars
        pw = pw .. chars:sub(rnd, rnd)  -- Append the random character to pw
    until #pw >= length  -- Check the length of pw

    return pw
end


function generateUUID(key,length,type)
    if UUIDs[key] == nil then
        UUIDs[key] = {}
    end

    if type == nil then type = "alphanumeric" end

    local uuid = randIntKey(length,type)
    if UUIDs[key][uuid] then
        while UUIDs[key][uuid] ~= nil do
            uuid = randIntKey(length,type)
            Wait(0)
        end
    end
    UUIDs[key][uuid] = true
    return uuid
end

function tobool(input)
    if input == "true" or tonumber(input) == 1 or input == true then
        return true
    else
        return false
    end
end
-- Map Manager

mapFiles = {}

function addMap(file, owningResource)
    if not mapFiles[owningResource] then
        mapFiles[owningResource] = {}
    end

    table.insert(mapFiles[owningResource], file)
end

undoCallbacks = {}

function loadMap(res)
    if mapFiles[res] then
        for _, file in ipairs(mapFiles[res]) do
            parseMap(file, res)
        end
    end
end

function unloadMap(res)
    if undoCallbacks[res] then
        for _, cb in ipairs(undoCallbacks[res]) do
            cb()
        end

        undoCallbacks[res] = nil
        mapFiles[res] = nil
    end
end

function parseMap(file, owningResource)
    if not undoCallbacks[owningResource] then
        undoCallbacks[owningResource] = {}
    end

    local env = {
        math = math, pairs = pairs, ipairs = ipairs, next = next, tonumber = tonumber, tostring = tostring,
        type = type, table = table, string = string, _G = env
    }

    TriggerEvent('getMapDirectives', function(key, cb, undocb)
        env[key] = function(...)
            local state = {}

            state.add = function(k, v)
                state[k] = v
            end

            local result = cb(state, ...)
            local args = table.pack(...)

            table.insert(undoCallbacks[owningResource], function()
                undocb(state)
            end)

            return result
        end
    end)

    local mt = {
        __index = function(t, k)
            if rawget(t, k) ~= nil then return rawget(t, k) end

            local f = function()
                return f
            end

            return function() return f end
        end
    }

    setmetatable(env, mt)
    
    local fileData = LoadResourceFile(owningResource, file)
    local mapFunction, err = load(fileData, file, 't', env)

    if not mapFunction then
        Citizen.Trace("Couldn't load map " .. file .. ": " .. err .. " (type of fileData: " .. type(fileData) .. ")\n")
        return
    end

    mapFunction()
end