local CharSetLookup = {}
local over = true
local theString = ""
local theReward = 0

-- Function to generate a random 5-letter string with uppercase letters (A-Z)
local function generateRandomLetters()
    local chars = {}
    for loop = 1, 5 do
        local randomChar = string.char(math.random(65, 90)) -- ASCII values for A to Z
        chars[loop] = randomChar
    end
    return table.concat(chars)
end
--TriggerClientEvent('chatMessage', source, "XTRA",  { 255, 255, 255 }, "You are being rate limited.", "alert", mode)

Citizen.CreateThread(function()
    while true do
        if over then
            over = false
            local Code = generateRandomLetters() -- Generate a random 5-letter string
            print("Generated string: " .. theString)
            theReward = math.random(10000, 50000) * 2
            theString = Code
            --TriggerClientEvent('chatMessage', -1, "~r~[XTRA]","^2[Mini-Event] Who writes the word: " .. theString .. " first gets £" .. getMoneyStringFormatted(theReward))
            TriggerClientEvent('chatMessage', -1, "~r~[XTRA]",  { 255, 255, 255 }, "^2[Mini-Event] Who writes the word: " .. theString .. " first gets £" .. getMoneyStringFormatted(theReward),  "ooc", "OOC")
            SetTimeout(10000, function()
                if not over then
                    TriggerClientEvent('chatMessage', -1, "~r~[XTRA]",  { 255, 255, 255 }, "^2[Mini-Event] Time is over, no one wrote the word!",  "ooc", "OOC")
                    over = true
                    theReward = 0
                    theString = ""
                end
            end)
        end
        Citizen.Wait(1800000) -- Wait for 30 minutes (1800000 milliseconds)
    end
end)


function HandleMoneys(user_id, theReward) 
    TriggerClientEvent('chatMessage', -1, "~r~[XTRA]",  { 255, 255, 255 }, "^2[Mini-Event] " .. XTRA.GetPlayerName(user_id) .. " wrote the word and won £" .. getMoneyStringFormatted(theReward),  "ooc", "OOC")
    -- Reset Event
    theReward = 0
    theString = 0 
    over = true;
end

RegisterNetEvent('_chat:messageEntered')
AddEventHandler('_chat:messageEntered', function(author, color, text, msgType, modeName)
    local source = source
    print("Text: " .. text, "String: " .. theString, "Over: " .. tostring(over), string.upper(text) == theString)
    if not over and string.upper(text) == theString then
        local user_id = XTRA.getUserId(source)
        print("Correct word typed by: " .. XTRA.GetPlayerName(user_id))
        HandleMoneys(user_id, theReward)
    end
end)
