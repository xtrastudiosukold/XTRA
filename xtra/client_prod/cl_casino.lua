insideDiamondCasino = false
AddEventHandler(
    "XTRA:onClientSpawn",
    function(a, b)
        if b then
            local c = vector3(1121.7922363281, 239.42251586914, -50.440742492676)
            local d = function(e)
                insideDiamondCasino = true
                tXTRA.setCanAnim(false)
                tXTRA.overrideTime(12, 0, 0)
                TriggerEvent("XTRA:enteredDiamondCasino")
                TriggerServerEvent("XTRA:getChips")
            end
            local f = function(e)
                insideDiamondCasino = false
                tXTRA.setCanAnim(true)
                tXTRA.cancelOverrideTimeWeather()
                TriggerEvent("XTRA:exitedDiamondCasino")
            end
            local g = function(e)
            end
            tXTRA.createArea("diamondcasino", c, 100.0, 20, d, f, g, {})
        end
    end
)
