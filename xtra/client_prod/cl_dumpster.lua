local searched = {}
local canSearch = true
local dumpsters = {218085040, 666561306, -58485588, -206690185, 1511880420, 682791951}
local searchTime = 14000

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if canSearch then
            local ped = GetPlayerPed(-1)
            local pos = GetEntityCoords(ped)
            local nearDumpster = false

            for _, dumpsterModel in ipairs(dumpsters) do
                local dumpster = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, dumpsterModel, false, false, false)
                if dumpster ~= 0 then
                    local dumpPos = GetEntityCoords(dumpster)
                    if #(pos - dumpPos) < 1.8 then
                        nearDumpster = true
                        if IsPedInAnyVehicle(ped, false) then
                            tXTRA.notify("You cannot search dumpsters while in a vehicle.")
                            break
                        else
                            if searched[dumpster] then
                                tXTRA.notify("~r~Dumpster has recently been searched")
                            else
                                drawNativeNotification("Press ~INPUT_PICKUP~ to search the dumpster.")
                                    if IsControlJustReleased(0, 38) then
                                        TriggerServerEvent('XTRA:startDumpsterTimer', dumpster)
                                        searched[dumpster] = true
                                        startSearching(searchTime, 'amb@prop_human_bum_bin@base', 'base', 'XTRA:giveDumpsterReward')
                                    end
                                end
                            end
                        end
                    end
                end
            end

            -- If not near any dumpster, and the player is in a vehicle, do not display the notification
            if not nearDumpster and IsPedInAnyVehicle(ped, false) then
                -- Do nothing or add any other condition you want to handle here
            end
        end
    end
end)

RegisterNetEvent('XTRA:removeDumpster')
AddEventHandler('XTRA:removeDumpster', function(object)
    searched[object] = nil
end)

-- Functions
function startSearching(time, animDict, animation, cb)
    local ped = GetPlayerPed(-1)
    canSearch = false

    -- Request and load animation dictionary
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(0)
    end

    -- Start the dumpster diving animation
    TaskPlayAnim(ped, animDict, animation, 8.0, 8.0, time, 1, 1, 0, 0, 0)
    tXTRA.startCircularProgressBar("", 5000, nil)

    -- Freeze the player in place
    FreezeEntityPosition(ped, true)

    -- Wait for the search time to finish
    Citizen.Wait(0)

    -- Unfreeze the player
    FreezeEntityPosition(ped, false)

    -- Clear the animation from the player
    ClearPedTasks(ped)

    -- Allow searching again
    canSearch = true

    -- Trigger server event after searching is complete
    TriggerServerEvent(cb)
end
 

