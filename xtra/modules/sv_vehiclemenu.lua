-- local price = 2500000

-- local function checkBoot(vehicle, userId, callback)
--     exports['xtra']:executeSync('SELECT * FROM xtra_user_boot WHERE vehicle = @vehicle AND user_id = @user_id', 
--         { vehicle = vehicle, user_id = userId }, callback)
-- end

-- local function handleBootCheckResult(source, result)
--     if result and result[1] then
--         if result[1].owned then
--             print("Sending boot data to client")
--             TriggerClientEvent("XTRA:VehicleBoot:Return", source, true, {})
--         end
--     else
--         TriggerClientEvent("XTRA:VehicleBoot:Return", source, false, {})
--     end
-- end

-- RegisterServerEvent('XTRA:VehicleBoot:Check')
-- AddEventHandler("XTRA:VehicleBoot:Check", function(vehicle)
--     local userId = XTRA.getUserId(source)
--     exports['xtra']:executeSync('SELECT * FROM xtra_user_vehicles WHERE vehicle = @vehicle AND user_id = @user_id', 
--         { vehicle = vehicle, user_id = userId }, function(vehicleCheckResult)
        
--         if vehicleCheckResult and vehicleCheckResult[1] then
--             checkBoot(vehicle, userId, function(bootCheckResult)
--                 handleBootCheckResult(source, bootCheckResult)
--             end)
--         end
--     end)
-- end)

-- RegisterServerEvent('XTRA:VehicleBoot:Purchase')
-- AddEventHandler("XTRA:VehicleBoot:Purchase", function(vehicle)
--     local userId = XTRA.getUserId(source)
--     if XTRA.tryFullPayment(userId, price) then
--         checkBoot(vehicle, userId, function(result)
--             if not result[1] then
--                 exports['xtra']:execute('INSERT INTO xtra_user_boot (user_id, vehicle, owned) VALUES (@user_id, @vehicle, @owned)', 
--                     { user_id = userId, vehicle = vehicle, owned = true })

--                 TriggerClientEvent("XTRA:VehicleBoot:Return", source, true, {})
--                 XTRAclient.notify(source, {"~g~You have purchased a vehicle boot!"})
--             end
--         end)
--     else
--         XTRAclient.notify(source, {"~r~You don't have enough money!"})
--     end
-- end)

-- local function updateUserBoot(source, vehicle, userId, target_id, target_name, updateCallback)
--     exports['xtra']:execute('SELECT * FROM xtra_user_boot WHERE vehicle = @vehicle AND user_id = @user_id', 
--         { vehicle = vehicle, user_id = userId }, function(result)
--             if result and result[1] then
--                 local users = json.decode(result[1].users) or {}
--                 updateCallback(users, function(updatedUsers)e
--                     local updatedUsersJson = json.encode(updatedUsers)
--                     exports['xtra']:execute('UPDATE xtra_user_boot SET users = @users WHERE vehicle = @vehicle AND user_id = @user_id', 
--                         { users = updatedUsersJson, vehicle = vehicle, user_id = userId })
--                     TriggerClientEvent("XTRA:VehicleBoot:Return", source, true, updatedUsers)
--                 end)
--             else
--                 print("No result found for vehicle: " .. vehicle .. " and user_id: " .. userId)
--             end
--         end)
-- end

-- RegisterServerEvent("XTRA:VehicleBoot:Add")
-- AddEventHandler("XTRA:VehicleBoot:Add", function(vehicle)
--     local userId = XTRA.getUserId(source)
--     XTRA.prompt(source, "Enter Perm ID", "", function(source, target_id)
--         if XTRA.getUserSource(target_id) then
--             XTRAclient.notify(source, {"~r~Player is online!"})
--             return
--         end
--         local target_name = XTRA.GetPlayerName(target_id)
--         if target_name then
--             updateUserBoot(source, vehicle, userId, target_id, target_name, function(users, commitChanges)
--                 if not users[target_id] then
--                     users[target_id] = { name = target_name, user_id = target_id }
--                     commitChanges(users)
--                     print("Added user_id: " .. target_id .. " to vehicle boot.")
--                 else
--                     print("User with ID " .. target_id .. " already exists in vehicle boot.")
--                 end
--             end)
--         else
--             XTRAclient.notify(source, {"~r~Player not found!"})
--         end
--     end)
-- end)


-- RegisterServerEvent("XTRA:VehicleBoot:Remove")
-- AddEventHandler("XTRA:VehicleBoot:Remove", function(vehicle, target_id)
--     local userId = XTRA.getUserId(source)
--     updateUserBoot(source, vehicle, userId, target_id, function(users, commitChanges)
--         if users[target_id] then
--             users[target_id] = nil
--             commitChanges(users)
--             print("Removed user_id: " .. target_id .. " from vehicle boot.")
--         else
--             print("User with ID " .. target_id .. " not found in vehicle boot.")
--         end
--     end)
-- end)


