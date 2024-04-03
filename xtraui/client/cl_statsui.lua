local statsOpen = false
local bIsNewPlayer = false

RegisterNetEvent("XTRAUI:setStatistics", function(stats, userId, statsCount)
    SendNUIMessage({
        type="SET_STATS",
        info = {
            stats = stats,
            userId = userId,
            pageCount = math.ceil(statsCount / 15)
        }
    })
end)

local function toggleStats()
    SendNUIMessage({
        app = statsOpen and "" or "stats",
        type = "APP_TOGGLE",
    })
    if not statsOpen then
        statsOpen = true
    else
        statsOpen = false
    end
    SetNuiFocus(statsOpen, statsOpen)
    SetNuiFocusKeepInput(statsOpen)
end

RegisterCommand("openstats", function()
    if GetEntityHealth(PlayerPedId()) <= 102 then
        return
    end
    toggleStats()
end, false)

RegisterNUICallback("closeStatsMenu", function(_, cb)
    toggleStats()
    cb({})
end)

RegisterKeyMapping("openstats", "Open the stats menu", "keyboard", "F9")

local function drawNativeNotification(text)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

Citizen.CreateThread(function()
    while true do
        if statsOpen then
            DisableAllControlActions(0)
            EnableControlAction(0, 249, true) -- INPUT_PUSH_TO_TALK
            if bIsNewPlayer then
                drawNativeNotification("Press ~INPUT_DF5476D8~ to toggle the Statistics Menu.")
            end
        end
        Citizen.Wait(0)
    end
end)

RegisterNetEvent("XTRA:setIsNewPlayer", function()
	bIsNewPlayer = true
end)