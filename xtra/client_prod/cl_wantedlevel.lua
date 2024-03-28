Citizen.CreateThread(
    function()
        while true do
            SetMaxWantedLevel(0)
            DisablePlayerVehicleRewards(PlayerId())
            Citizen.Wait(0)
        end
    end
)
CreateThread(
    function()
        while true do
            DistantCopCarSirens(false)
            Citizen.Wait(400)
        end
    end
)
