-- local cfg = module("cfg/cfg_trucking")
-- local ownedtrucks = {}
-- local rentedtrucks = {}
-- local onTruckJob = false


-- AddEventHandler("XTRACli:playerSpawned", function()
--     local source = source
--     TriggerEvent("XTRA:updateOwnedTruckssv", source)
-- end)


-- local d = {
--     owned = {},
--     rented = {}
-- }

-- RegisterNetEvent("XTRA:updateOwnedTruckssv")
-- AddEventHandler("XTRA:updateOwnedTruckssv", function(ownedTrucks, rentedTrucks)
--     local source = source
    
--     d["owned"][source] = ownedTrucks
--     d["rented"][source] = rentedTrucks
--     TriggerClientEvent("XTRA:updateOwnedTrucks", source, d["owned"][source], d["rented"][source])
-- end)







-- RegisterServerEvent("XTRA:rentTruck")
-- AddEventHandler("XTRA:rentTruck", function(vehicleName, price)
--     local source = source
--     local user_id = XTRA.getUserId(source)
    
--     ownedtrucks[user_id] = ownedtrucks[user_id] or {}
--     rentedtrucks[user_id] = rentedtrucks[user_id] or {}
    
--     TriggerClientEvent("XTRA:updateOwnedTrucks", source, ownedtrucks[user_id], rentedtrucks[user_id])
-- end)

-- RegisterServerEvent("XTRA:spawnTruck")
-- AddEventHandler("XTRA:spawnTruck", function(vehicleName)
--     local source = source
--     TriggerClientEvent("XTRA:spawnTruckCl", source, vehicleName)
-- end)

-- RegisterServerEvent("XTRA:truckJobBuyAllTrucks")
-- AddEventHandler("XTRA:truckerJobBuyAllTrucks", function()
--     local source = source
    
--     -- Add your logic to handle buying all trucks here
    
--     TriggerClientEvent("XTRA:updateOwnedTrucks", source, ownedtrucks[source], rentedtrucks[source])
-- end)

-- RegisterServerEvent("XTRA:toggleTruckJob")
-- AddEventHandler("XTRA:toggleTruckJob", function(onDuty)
--     local source = source
--     onTruckJob = onDuty
    
--     -- Add your logic to handle the trucker job status here
    
--     TriggerClientEvent("XTRA:setTruckerOnDuty", source, onDuty)
-- end)
