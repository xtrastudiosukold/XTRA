local countdown = 0

RegisterNetEvent("XTRA:CLOSE_DEATH_SCREEN", function()
    SendNUIMessage({
        app = "",
        type = "APP_TOGGLE",
    })
    SetNuiFocus(false, false)
    countdown = 0
end)

RegisterNetEvent("XTRA:respawnKeyPressed", function()
    SendNUIMessage({
        page = "deathscreen",
        type = "RESPAWN_KEY_PRESSED",
    })
end)

RegisterNetEvent("XTRA:SHOW_DEATH_SCREEN", function(timer, killer, killerPermId, killedByWeapon, suicide)
    SendNUIMessage({
        page = "deathscreen",
        type = "SHOW_DEATH_SCREEN",
        info = {
            timer = timer,
            killer = killer,
            killerPermId = killerPermId,
            killedByWeapon = killedByWeapon,
            suicide = suicide,
        }
    })
    countdown = math.floor(timer)
end)

RegisterNetEvent("XTRA:DEATH_SCREEN_NHS_CALLED", function()
    SendNUIMessage({
        page = "deathscreen",
        type = "DEATH_SCREEN_NHS_CALLED",
    })
end)

Citizen.CreateThread(function()
    while true do
        if countdown > 0 then
            countdown = countdown - 1
            if countdown == 0 then
                TriggerEvent("XTRA:countdownEnded")
            end
        end
        Citizen.Wait(1000)
    end
end)