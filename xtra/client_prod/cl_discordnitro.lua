local a = GetGameTimer()
RegisterNetEvent(
    "XTRA:spawnNitroBMX",
    function()
        if not tXTRA.isInComa() and not tXTRA.isHandcuffed() and not insideDiamondCasino then
            if GetTimeDifference(GetGameTimer(), a) > 10000 then
                a = GetGameTimer()
                tXTRA.notify("~g~Crafting a BMX")
                local b = tXTRA.getPlayerPed()
                TaskStartScenarioInPlace(b, "WORLD_HUMAN_HAMMERING", 0, true)
                Wait(5000)
                ClearPedTasksImmediately(b)
                local c = GetEntityCoords(b)
                XTRA.spawnVehicle("bmx", c.x, c.y, c.z, GetEntityHeading(b), true, true, true)
            else
                tXTRA.notify("~r~Nitro BMX cooldown, please wait.")
            end
        else
            tXTRA.notify("~r~Cannot craft a BMX right now.")
        end
    end
)
RegisterNetEvent(
    "XTRA:spawnMoped",
    function()
        if not tXTRA.isInComa() and not tXTRA.isHandcuffed() and not insideDiamondCasino then
            if GetTimeDifference(GetGameTimer(), a) > 10000 then
                a = GetGameTimer()
                tXTRA.notify("~g~Crafting a Moped")
                local b = tXTRA.getPlayerPed()
                TaskStartScenarioInPlace(b, "WORLD_HUMAN_HAMMERING", 0, true)
                Wait(5000)
                ClearPedTasksImmediately(b)
                local c = GetEntityCoords(b)
                XTRA.spawnVehicle("faggio", c.x, c.y, c.z, GetEntityHeading(b), true, true, true)
            else
                tXTRA.notify("~r~Nitro BMX cooldown, please wait.")
            end
        else
            tXTRA.notify("~r~Cannot craft a Moped right now.")
        end
    end
)
