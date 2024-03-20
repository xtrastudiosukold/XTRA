local lang = XTRA.lang
local cfg = module("xtra-vehicles", "cfg/cfg_garages")
local cfg_inventory = module("xtra-vehicles", "cfg/cfg_inventory")
local vehicle_groups = cfg.garages
local limit = cfg.limit or 1000000000
MySQL.createCommand("XTRA/add_vehicle","INSERT IGNORE INTO xtra_user_vehicles(user_id,vehicle,vehicle_plate,locked) VALUES(@user_id,@vehicle,@registration,@locked)")
MySQL.createCommand("XTRA/remove_vehicle","DELETE FROM xtra_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
MySQL.createCommand("XTRA/get_vehicles", "SELECT vehicle, rentedtime, vehicle_plate, fuel_level, impounded FROM xtra_user_vehicles WHERE user_id = @user_id")
MySQL.createCommand("XTRA/get_rented_vehicles_in", "SELECT vehicle, rentedtime, user_id FROM xtra_user_vehicles WHERE user_id = @user_id AND rented = 1")
MySQL.createCommand("XTRA/get_rented_vehicles_out", "SELECT vehicle, rentedtime, user_id FROM xtra_user_vehicles WHERE rentedid = @user_id AND rented = 1")
MySQL.createCommand("XTRA/get_vehicle","SELECT vehicle FROM xtra_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
MySQL.createCommand("XTRA/get_vehicle_fuellevel","SELECT fuel_level FROM xtra_user_vehicles WHERE vehicle = @vehicle")
MySQL.createCommand("XTRA/check_rented","SELECT * FROM xtra_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle AND rented = 1")
MySQL.createCommand("XTRA/sell_vehicle_player","UPDATE xtra_user_vehicles SET user_id = @user_id, vehicle_plate = @registration WHERE user_id = @oldUser AND vehicle = @vehicle")
MySQL.createCommand("XTRA/rentedupdate", "UPDATE xtra_user_vehicles SET user_id = @id, rented = @rented, rentedid = @rentedid, rentedtime = @rentedunix WHERE user_id = @user_id AND vehicle = @veh")
MySQL.createCommand("XTRA/fetch_rented_vehs", "SELECT * FROM xtra_user_vehicles WHERE rented = 1")
MySQL.createCommand("XTRA/get_vehicle_count","SELECT * FROM xtra_user_vehicles WHERE vehicle = @vehicle")
MySQL.createCommand("XTRA/get_vehicle_lock_state", "SELECT * FROM xtra_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")

RegisterServerEvent("XTRA:spawnPersonalVehicle")
AddEventHandler('XTRA:spawnPersonalVehicle', function(vehicle)
    local source = source
    local user_id = XTRA.getUserId(source)
    MySQL.query("XTRA/get_vehicles", {user_id = user_id}, function(result)
        if result ~= nil then 
            for k,v in pairs(result) do
                if v.vehicle == vehicle then
                    if v.impounded then
                        XTRAclient.notify(source, {'~r~This vehicle is currently impounded.'})
                        return
                    else
                        TriggerClientEvent('XTRA:spawnPersonalVehicle', source, v.vehicle, user_id, false, GetEntityCoords(GetPlayerPed(source)), v.vehicle_plate, v.fuel_level)
                        return
                    end
                end
            end
        end
    end)
end)

RegisterServerEvent('phone:garage:getVehicles')
AddEventHandler('phone:garage:getVehicles', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    MySQL.query("XTRA/get_vehicles", {user_id = user_id}, function(result)
        if result then 
            local vehicles = {}
            for i, vehicle in ipairs(result) do
                vehicles[i] = {model = vehicle.vehicle, plate = vehicle.vehicle_plate}
            end

            TriggerClientEvent('phone:garage:receiveVehicles', source, vehicles)
        end
    end)
end)


valetCooldown = {}
RegisterServerEvent("XTRA:valetSpawnVehicle")
AddEventHandler('XTRA:valetSpawnVehicle', function(spawncode)
    local source = source
    local user_id = XTRA.getUserId(source)
    XTRAclient.isPlusClub(source,{},function(plusclub)
        XTRAclient.isPlatClub(source,{},function(platclub)
            if plusclub or platclub then
                if valetCooldown[source] and not (os.time() > valetCooldown[source]) then
                    return XTRAclient.notify(source,{"~r~Please wait before using this again."})
                else
                    valetCooldown[source] = nil
                end
                MySQL.query("XTRA/get_vehicles", {user_id = user_id}, function(result)
                    if result ~= nil then 
                        for k,v in pairs(result) do
                            if v.vehicle == spawncode then
                                TriggerClientEvent('XTRA:spawnPersonalVehicle', source, v.vehicle, user_id, true, GetEntityCoords(GetPlayerPed(source)), v.vehicle_plate, v.fuel_level)
                                valetCooldown[source] = os.time() + 60
                                return
                            end
                        end
                    end
                end)
            else
                XTRAclient.notify(source, {"~y~You need to be a subscriber of XTRA Plus or XTRA Platinum to use this feature."})
                XTRAclient.notify(source, {"~y~Available @ store.xtrastudios.com"})
            end
        end)
    end)
end)

RegisterServerEvent("XTRA:getVehicleRarity")
AddEventHandler('XTRA:getVehicleRarity', function(spawncode)
    local source = source
    local user_id = XTRA.getUserId(source)
    MySQL.query("XTRA/get_vehicle_lock_state", {user_id = user_id,vehicle = spawncode}, function(results)
        if results ~= nil then
            MySQL.query("XTRA/get_vehicle_count", {vehicle = spawncode}, function(result)
                if result ~= nil then
                    TriggerClientEvent('XTRA:setVehicleRarity', source, spawncode,#result,tobool(results[1].locked))
                end
            end)
        end
    end)
end)

RegisterServerEvent("XTRA:displayVehicleBlip")
AddEventHandler('XTRA:displayVehicleBlip', function(spawncode)
    local source = source
    local user_id = XTRA.getUserId(source)
    MySQL.query("XTRAls/get_vehicle_modifications", {user_id = user_id, vehicle = spawncode}, function(rows, affected) 
        if rows ~= nil then 
            if #rows > 0 then
                XTRAclient.getOwnedVehiclePosition(source, {spawncode}, function(x,y,z)
                    if vector3(x,y,z) ~= vector3(0,0,0) then
                        local mods = json.decode(rows[1].modifications) or {}
                        if mods['remoteblips'] == 1 then
                            local position = {}
                            position.x, position.y, position.z = x,y,z
                            if next(position) then
                                TriggerClientEvent('XTRA:displayVehicleBlip', source, position)
                                XTRAclient.notify(source, {"~g~Vehicle blip enabled."})
                                return
                            end
                        end
                        XTRAclient.notify(source, {"~r~This vehicle does not have a remote vehicle blip installed."})
                    else
                        XTRAclient.notify(source, {"~r~Can not locate vehicle with the plate "..rows[1].vehicle_plate.." in this city."})
                    end
                end)
            end
        end
    end)
end)

-- Example server-side callback
RegisterServerEvent("phone:garage:getVehicles")
AddEventHandler("phone:garage:getVehicles", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    local vehicles = {} -- This should be replaced with actual database query results

    -- Example database query (pseudo-code)
    MySQL.query("SELECT * FROM xtra_user_vehicles WHERE user_id = @user_id", {user_id = user_id}, function(result)
        if result then
            for _, vehicle in pairs(result) do
                table.insert(vehicles, {
                    -- Assuming your vehicle data structure has these fields
                    model = xtra_user_vehicles.vehicle,
                    plate = xtra_user_vehicles.vehicle_plate,
                    -- Other vehicle details...
                })
            end
        end

        -- Sending the vehicle data back to the client
        TriggerClientEvent("phone:garage:returnVehicles", source, vehicles)
    end)
end)


RegisterNetEvent("XTRA:logVehicleSpawn")
AddEventHandler("XTRA:logVehicleSpawn", function(spawncode)
    local source = source
    local user_id = XTRA.getUserId(source)
    XTRA.sendWebhook('spawn-vehicle', "XTRA Spawn Vehicle Logs", "> Player Name: **"..XTRA.GetPlayerName(user_id).."**\n> Player TempID: **"..source.."**\n> Player PermID: **"..XTRA.getUserId(source).."**\n> Vehicle: **"..spawncode.."**")
end)


RegisterServerEvent("XTRA:viewRemoteDashcam")
AddEventHandler('XTRA:viewRemoteDashcam', function(spawncode)
    local source = source
    local user_id = XTRA.getUserId(source)
    MySQL.query("XTRAls/get_vehicle_modifications", {user_id = user_id, vehicle = spawncode}, function(rows, affected) 
        if rows ~= nil then 
            if #rows > 0 then
                XTRAclient.getOwnedVehiclePosition(source, {spawncode}, function(x,y,z)
                    if vector3(x,y,z) ~= vector3(0,0,0) then
                        local mods = json.decode(rows[1].modifications) or {}
                        if mods['dashcam'] == 1 then
                            if next(table.pack(x,y,z)) then
                                for k,v in pairs(netObjects) do
                                    if math.floor(vector3(x,y,z)) == math.floor(GetEntityCoords(NetworkGetEntityFromNetworkId(k))) then
                                        TriggerClientEvent('XTRA:viewRemoteDashcam', source, table.pack(x,y,z), k)
                                        return
                                    end
                                end
                            end
                        end
                        XTRAclient.notify(source, {"~r~This vehicle does not have a remote dashcam installed."})
                    else
                        XTRAclient.notify(source, {"~r~Can not locate vehicle with the plate "..rows[1].vehicle_plate.." in this city."})
                    end
                end)
            end
        end
    end)
end)

RegisterServerEvent("XTRA:updateFuel")
AddEventHandler('XTRA:updateFuel', function(vehicle, fuel_level)
    local source = source
    local user_id = XTRA.getUserId(source)
    exports["xtra"]:execute("UPDATE xtra_user_vehicles SET fuel_level = @fuel_level WHERE user_id = @user_id AND vehicle = @vehicle", {fuel_level = fuel_level, user_id = user_id, vehicle = vehicle}, function() end)
end)

RegisterServerEvent("XTRA:getCustomFolders")
AddEventHandler('XTRA:getCustomFolders', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    exports["xtra"]:execute("SELECT * from `xtra_custom_garages` WHERE user_id = @user_id", {user_id = user_id}, function(Result)
        if #Result > 0 then
            TriggerClientEvent("XTRA:sendFolders", source, json.decode(Result[1].folder))
        end
    end)
end)


RegisterServerEvent("XTRA:updateFolders")
AddEventHandler('XTRA:updateFolders', function(FolderUpdated)
    local source = source
    local user_id = XTRA.getUserId(source)
    exports["xtra"]:execute("SELECT * from `xtra_custom_garages` WHERE user_id = @user_id", {user_id = user_id}, function(Result)
        if #Result > 0 then
            exports['xtra']:execute("UPDATE xtra_custom_garages SET folder = @folder WHERE user_id = @user_id", {folder = json.encode(FolderUpdated), user_id = user_id}, function() end)
        else
            exports['xtra']:execute("INSERT INTO xtra_custom_garages (`user_id`, `folder`) VALUES (@user_id, @folder);", {user_id = user_id, folder = json.encode(FolderUpdated)}, function() end)
        end
    end)
end)

Citizen.CreateThread(function()
    while true do
        Wait(60000)
        MySQL.query('XTRA/fetch_rented_vehs', {}, function(pvehicles)
            for i,v in pairs(pvehicles) do 
               if os.time() > tonumber(v.rentedtime) then
                  MySQL.execute('XTRA/rentedupdate', {id = v.rentedid, rented = 0, rentedid = "", rentedunix = "", user_id = v.user_id, veh = v.vehicle})
                  if XTRA.getUserSource(v.rentedid) ~= nil then
                    XTRAclient.notify(XTRA.getUserSource(v.rentedid), {"~r~Your rented vehicle has been returned."})
                  end
               end
            end
        end)
    end
end)

RegisterNetEvent('XTRA:FetchCars')
AddEventHandler('XTRA:FetchCars', function(type)
    local source = source
    local user_id = XTRA.getUserId(source)
    local returned_table = {}
    local fuellevels = {}
    if user_id then
        MySQL.query("XTRA/get_vehicles", {user_id = user_id}, function(pvehicles, affected)
            for _, veh in pairs(pvehicles) do
                for i, v in pairs(vehicle_groups) do
                    local perms = false
                    local config = vehicle_groups[i]._config
                    if config.type == vehicle_groups[type]._config.type then 
                        local perm = config.permissions or nil
                        if next(perm) then
                            for i, v in pairs(perm) do
                                if XTRA.hasPermission(user_id, v) then
                                    perms = true
                                end
                            end
                        else
                            perms = true
                        end
                        if perms then 
                            for a, z in pairs(v) do
                                if a ~= "_config" and veh.vehicle == a then
                                    if not returned_table[i] then 
                                        returned_table[i] = {["_config"] = config}
                                    end
                                    if not returned_table[i].vehicles then 
                                        returned_table[i].vehicles = {}
                                    end
                                    returned_table[i].vehicles[a] = {z[1], z[2], veh.vehicle_plate, veh.fuel_level}
                                    fuellevels[a] = veh.fuel_level
                                end
                            end
                        end
                    end
                end
            end
            TriggerClientEvent('XTRA:ReturnFetchedCars', source, returned_table, fuellevels)
        end)
    end
end)

RegisterNetEvent('XTRA:CrushVehicle')
AddEventHandler('XTRA:CrushVehicle', function(vehicle)
    local source = source
    local user_id = XTRA.getUserId(source)
    if user_id then 
        MySQL.query("XTRA/check_rented", {user_id = user_id, vehicle = vehicle}, function(pvehicles)
            MySQL.query("XTRA/get_vehicle", {user_id = user_id, vehicle = vehicle}, function(pveh)
                if #pveh < 0 then 
                    XTRAclient.notify(source,{"~r~You cannot destroy a vehicle you do not own"})
                    return
                end
                if #pvehicles > 0 then 
                    XTRAclient.notify(source,{"~r~You cannot destroy a rented vehicle!"})
                    return
                end
                MySQL.execute('XTRA/remove_vehicle', {user_id = user_id, vehicle = vehicle})
                XTRA.sendWebhook('crush-vehicle', "XTRA Crush Vehicle Logs", "> Player Name: **"..XTRA.GetPlayerName(user_id).."**\n> Player TempID: **"..source.."**\n> Player PermID: **"..user_id.."**\n> Vehicle: **"..vehicle.."**")
                TriggerClientEvent('XTRA:CloseGarage', source)
            end)
        end)
    end
end)
RegisterNetEvent('XTRA:SellVehicle')
AddEventHandler('XTRA:SellVehicle', function(veh)
    local name = veh
    local player = source
    local playerID = XTRA.getUserId(source)
    if playerID ~= nil then
        XTRAclient.getNearestPlayers(player, {15}, function(nplayers)
            usrList = ""
            for k, v in pairs(nplayers) do
                usrList = usrList .. "[" .. XTRA.getUserId(k) .. "]" .. XTRA.GetPlayerName(XTRA.getUserId(k)) .. " | "
            end
            if usrList ~= "" then
                XTRA.prompt(player, "Players Nearby: " .. usrList .. "", "", function(player, user_id)
                    user_id = user_id
                    if user_id ~= nil and user_id ~= "" then
                        local target = XTRA.getUserSource(tonumber(user_id))
                        if target ~= nil then
                            XTRA.prompt(player, "Price £: ", "", function(player, amount)
                                if tonumber(amount) and tonumber(amount) > 0 and tonumber(amount) < limit then
                                    MySQL.query("XTRA/get_vehicle", { user_id = user_id, vehicle = name }, function(pvehicle, affected)
                                        if #pvehicle > 0 then
                                            XTRAclient.notify(player, {"~r~The player already has this vehicle type."})
                                        else
                                            local tmpdata = XTRA.getUserTmpTable(playerID)
                                            MySQL.query("XTRA/check_rented", { user_id = playerID, vehicle = veh }, function(pvehicles)
                                                if #pvehicles > 0 then
                                                    XTRAclient.notify(player, {"~r~You cannot sell a rented vehicle!"})
                                                    return
                                                else
                                                    XTRA.prompt(player, "Please replace text with YES or NO to confirm", "Sell Details:\nVehicle: " .. name .. "\nPrice: £" .. getMoneyStringFormatted(amount) .. "\nSelling to player: " .. XTRA.GetPlayerName(XTRA.getUserId(target)) .. "(" .. XTRA.getUserId(target) .. ")", function(player, details)
                                                        if string.upper(details) == 'YES' then
                                                            XTRAclient.notify(player, {'~g~Sell offer sent!'})
                                                            XTRA.request(target, XTRA.GetPlayerName(playerID) .. " wants to sell: " .. name .. " Price: £" .. getMoneyStringFormatted(amount), 10, function(target, ok)
                                                                if ok then
                                                                    local pID = XTRA.getUserId(target)
                                                                    amount = tonumber(amount)
                                                                    if XTRA.tryFullPayment(pID, amount) then
                                                                        XTRAclient.despawnGarageVehicle(player, {'car', 15})
                                                                        XTRA.getUserIdentity(pID, function(identity)
                                                                            MySQL.execute("XTRA/sell_vehicle_player", { user_id = user_id, registration = "P " .. identity.registration, oldUser = playerID, vehicle = name })
                                                                        end)
                                                                        XTRA.giveBankMoney(playerID, amount)
                                                                        XTRAclient.notify(player, {"~g~You have successfully sold the vehicle to " .. XTRA.GetPlayerName(pID) .. " for £" .. getMoneyStringFormatted(amount) .. "!"})
                                                                        XTRAclient.notify(target, {"~g~" .. XTRA.GetPlayerName(playerID) .. " has successfully sold you the car for £" .. getMoneyStringFormatted(amount) .. "!"})
                                                                        XTRA.sendWebhook('sell-vehicle', "XTRA Sell Vehicle Logs", "> Seller Name: **" .. XTRA.GetPlayerName(playerID) .. "**\n> Seller TempID: **" .. player .. "**\n> Seller PermID: **" .. playerID .. "**\n> Buyer Name: **" .. XTRA.GetPlayerName(user_id) .. "**\n> Buyer TempID: **" .. target .. "**\n> Buyer PermID: **" .. user_id .. "**\n> Amount: **£" .. getMoneyStringFormatted(amount) .. "**\n> Vehicle: **" .. name .. "**")
                                                                        TriggerClientEvent('XTRA:CloseGarage', player)
                                                                    else
                                                                        XTRAclient.notify(player, {"~r~" .. XTRA.GetPlayerName(pID) .. " doesn't have enough money!"})
                                                                        XTRAclient.notify(target, {"~r~You don't have enough money!"})
                                                                    end
                                                                else
                                                                    XTRAclient.notify(player, {"~r~" .. XTRA.GetPlayerName(pID) .. " has refused to buy the car."})
                                                                    XTRAclient.notify(target, {"~r~You have refused to buy " .. XTRA.GetPlayerName(playerID) .. "'s car."})
                                                                end
                                                            end)
                                                        else
                                                            XTRAclient.notify(player, {'~r~Sell offer cancelled!'})
                                                        end
                                                    end)
                                                end
                                            end)
                                        end
                                    end)
                                else
                                    XTRAclient.notify(player, {"~r~The price of the car has to be a number."})
                                end
                            end)
                        else
                            XTRAclient.notify(player, {"~r~That ID seems invalid."})
                        end
                    else
                        XTRAclient.notify(player, {"~r~No player ID selected."})
                    end
                end)
            else
                XTRAclient.notify(player, {"~r~No players nearby."})
            end
        end)
    end
end)



RegisterNetEvent('XTRA:RentVehicle')
AddEventHandler('XTRA:RentVehicle', function(veh)
    local name = veh
    local player = source 
    local playerID = XTRA.getUserId(source)
    if playerID ~= nil then
		XTRAclient.getNearestPlayers(player,{15},function(nplayers)
			usrList = ""
			for k,v in pairs(nplayers) do
				usrList = usrList .. "[" .. XTRA.getUserId(k) .. "]" .. XTRA.GetPlayerName(XTRA.getUserId(k)) .. " | "
			end
			if usrList ~= "" then
				XTRA.prompt(player,"Players Nearby: " .. usrList .. "","",function(player,user_id) 
					user_id = user_id
					if user_id ~= nil and user_id ~= "" then 
						local target = XTRA.getUserSource(tonumber(user_id))
						if target ~= nil then
							XTRA.prompt(player,"Price £: ","",function(player,amount)
                                XTRA.prompt(player,"Rent time (in hours): ","",function(player,rent)
                                    if tonumber(rent) and tonumber(rent) >  0 then 
                                        if tonumber(amount) and tonumber(amount) > 0 and tonumber(amount) < limit then
                                            MySQL.query("XTRA/get_vehicle", {user_id = user_id, vehicle = name}, function(pvehicle, affected)
                                                if #pvehicle > 0 then
                                                    XTRAclient.notify(player,{"~r~The player already has this vehicle."})
                                                else
                                                    local tmpdata = XTRA.getUserTmpTable(playerID)
                                                    MySQL.query("XTRA/check_rented", {user_id = playerID, vehicle = veh}, function(pvehicles)
                                                        if #pvehicles > 0 then 
                                                            return
                                                        else
                                                            XTRA.prompt(player, "Please replace text with YES or NO to confirm", "Rent Details:\nVehicle: "..name.."\nRent Cost: "..getMoneyStringFormatted(amount).."\nDuration: "..rent.." hours\nRenting to player: "..XTRA.GetPlayerName(XTRA.getUserId(target)).."("..XTRA.getUserId(target)..")",function(player,details)
                                                                if string.upper(details) == 'YES' then
                                                                    XTRAclient.notify(player, {'~g~Rent offer sent!'})
                                                                    XTRA.request(target,XTRA.GetPlayerName(playerID).." wants to rent: " ..name.. " Price: £"..getMoneyStringFormatted(amount) .. ' | for: ' .. rent .. 'hours', 10, function(target,ok)
                                                                        local pID = XTRA.getUserId(target)
                                                                        if ok then
                                                                            amount = tonumber(amount)
                                                                            if XTRA.tryFullPayment(pID,amount) then
                                                                                XTRAclient.despawnGarageVehicle(player,{'car',15}) 
                                                                                XTRA.getUserIdentity(pID, function(identity)
                                                                                    local rentedTime = os.time()
                                                                                    rentedTime = rentedTime  + (60 * 60 * tonumber(rent)) 
                                                                                    MySQL.execute("XTRA/rentedupdate", {user_id = playerID, veh = name, id = pID, rented = 1, rentedid = playerID, rentedunix =  rentedTime }) 
                                                                                end)
                                                                                XTRA.giveBankMoney(playerID, amount)
                                                                                XTRAclient.notify(player,{"~g~You have successfully rented the vehicle to "..XTRA.GetPlayerName(pID).." for £"..getMoneyStringFormatted(amount)..' for ' ..rent.. 'hours'})
                                                                                XTRAclient.notify(target,{"~g~"..XTRA.GetPlayerName(playerID).." has successfully rented you the car for £"..getMoneyStringFormatted(amount)..' for ' ..rent.. 'hours'})
                                                                                XTRA.sendWebhook('rent-vehicle', "XTRA Rent Vehicle Logs", "> Renter Name: **"..XTRA.GetPlayerName(playerID).."**\n> Renter TempID: **"..player.."**\n> Renter PermID: **"..playerID.."**\n> Rentee Name: **"..XTRA.GetPlayerName(pID).."**\n> Rentee TempID: **"..target.."**\n> Rentee PermID: **"..pID.."**\n> Amount: **£"..getMoneyStringFormatted(amount).."**\n> Duration: **"..rent.." hours**\n> Vehicle: **"..veh.."**")
                                                                                --TriggerClientEvent('XTRA:CloseGarage', player)
                                                                            else
                                                                                XTRAclient.notify(player,{"~r~".. XTRA.GetPlayerName(pID).." doesn't have enough money!"})
                                                                                XTRAclient.notify(target,{"~r~You don't have enough money!"})
                                                                            end
                                                                        else
                                                                            XTRAclient.notify(player,{"~r~"..XTRA.GetPlayerName(pID).." has refused to rent the car."})
                                                                            XTRAclient.notify(target,{"~r~You have refused to rent "..XTRA.GetPlayerName(playerID).."'s car."})
                                                                        end
                                                                    end)
                                                                else
                                                                    XTRAclient.notify(player, {'~r~Rent offer cancelled!'})
                                                                end
                                                            end)
                                                        end
                                                    end)
                                                end
                                            end) 
                                        else
                                            XTRAclient.notify(player,{"~r~The price of the car has to be a number."})
                                        end
                                    else 
                                        XTRAclient.notify(player,{"~r~The rent time of the car has to be in hours and a number."})
                                    end
                                end)
							end)
						else
							XTRAclient.notify(player,{"~r~That ID seems invalid."})
						end
					else
						XTRAclient.notify(player,{"~r~No player ID selected."})
					end
				end)
			else
				XTRAclient.notify(player,{"~r~No players nearby."})
			end
		end)
    end
end)



RegisterNetEvent('XTRA:FetchRented')
AddEventHandler('XTRA:FetchRented', function()
    local rentedin = {}
    local rentedout = {}
    local source = source
    local user_id = XTRA.getUserId(source)
    MySQL.query("XTRA/get_rented_vehicles_in", {user_id = user_id}, function(pvehicles, affected)
        for _, veh in pairs(pvehicles) do
            for i, v in pairs(vehicle_groups) do
                local config = vehicle_groups[i]._config
                local perm = config.permissions or nil
                if perm then
                    for i, v in pairs(perm) do
                        if not XTRA.hasPermission(user_id, v) then
                            break
                        end
                    end
                end
                for a, z in pairs(v) do
                    if a ~= "_config" and veh.vehicle == a then
                        if not rentedin.vehicles then 
                            rentedin.vehicles = {}
                        end
                        local hoursLeft = ((tonumber(veh.rentedtime)-os.time()))/3600
                        local minutesLeft = nil
                        if hoursLeft < 1 then
                            minutesLeft = hoursLeft * 60
                            minutesLeft = string.format("%." .. (0) .. "f", minutesLeft)
                            datetime = minutesLeft .. " mins" 
                        else
                            hoursLeft = string.format("%." .. (0) .. "f", hoursLeft)
                            datetime = hoursLeft .. " hours" 
                        end
                        rentedin.vehicles[a] = {z[1], datetime, veh.user_id, a}
                    end
                end
            end
        end
        MySQL.query("XTRA/get_rented_vehicles_out", {user_id = user_id}, function(pvehicles, affected)
            for _, veh in pairs(pvehicles) do
                for i, v in pairs(vehicle_groups) do
                    local config = vehicle_groups[i]._config
                    local perm = config.permissions or nil
                    if perm then
                        for i, v in pairs(perm) do
                            if not XTRA.hasPermission(user_id, v) then
                                break
                            end
                        end
                    end
                    for a, z in pairs(v) do
                        if a ~= "_config" and veh.vehicle == a then
                            if not rentedout.vehicles then 
                                rentedout.vehicles = {}
                            end
                            local hoursLeft = ((tonumber(veh.rentedtime)-os.time()))/3600
                            local minutesLeft = nil
                            if hoursLeft < 1 then
                                minutesLeft = hoursLeft * 60
                                minutesLeft = string.format("%." .. (0) .. "f", minutesLeft)
                                datetime = minutesLeft .. " mins" 
                            else
                                hoursLeft = string.format("%." .. (0) .. "f", hoursLeft)
                                datetime = hoursLeft .. " hours" 
                            end
                            rentedout.vehicles[a] = {z[1], datetime, veh.user_id, a}
                        end
                    end
                end
            end
            TriggerClientEvent('XTRA:ReturnedRentedCars', source, rentedin, rentedout)
        end)
    end)
end)

RegisterNetEvent('XTRA:CancelRent')
AddEventHandler('XTRA:CancelRent', function(spawncode, VehicleName, a)
    local source = source
    local user_id = XTRA.getUserId(source)
    if a == 'owner' then
        exports['xtra']:execute("SELECT * FROM xtra_user_vehicles WHERE rentedid = @id", {id = user_id}, function(result)
            if #result > 0 then 
                for i = 1, #result do 
                    if result[i].vehicle == spawncode and result[i].rented then
                        local target = XTRA.getUserSource(result[i].user_id)
                        if target ~= nil then
                            XTRA.request(target,XTRA.GetPlayerName(user_id).." would like to cancel the rent on the vehicle: ", 10, function(target,ok)
                                if ok then
                                    MySQL.execute('XTRA/rentedupdate', {id = user_id, rented = 0, rentedid = "", rentedunix = "", user_id = result[i].user_id, veh = spawncode})
                                    XTRAclient.notify(target, {"~r~" ..VehicleName.." has been returned to the vehicle owner."})
                                    XTRAclient.notify(source, {"~r~" ..VehicleName.." has been returned to your garage."})
                                else
                                    XTRAclient.notify(source, {"~r~User has declined the request to cancel the rental of vehicle: " ..VehicleName})
                                end
                            end)
                        else
                            XTRAclient.notify(source, {"~r~The player is not online."})
                        end
                    end
                end
            end
        end)
    elseif a == 'renter' then
        exports['xtra']:execute("SELECT * FROM xtra_user_vehicles WHERE user_id = @id", {id = user_id}, function(result)
            if #result > 0 then 
                for i = 1, #result do 
                    if result[i].vehicle == spawncode and result[i].rented then
                        local rentedid = tonumber(result[i].rentedid)
                        local target = XTRA.getUserSource(rentedid)
                        if target ~= nil then
                            XTRA.request(target,XTRA.GetPlayerName(user_id).." would like to cancel the rent on the vehicle: ", 10, function(target,ok)
                                if ok then
                                    MySQL.execute('XTRA/rentedupdate', {id = rentedid, rented = 0, rentedid = "", rentedunix = "", user_id = user_id, veh = spawncode})
                                    XTRAclient.notify(source, {"~r~" ..VehicleName.." has been returned to the vehicle owner."})
                                    XTRAclient.notify(target, {"~r~" ..VehicleName.." has been returned to your garage."})
                                else
                                    XTRAclient.notify(source, {"~r~User has declined the request to cancel the rental of vehicle: " ..VehicleName})
                                end
                            end)
                        else
                            XTRAclient.notify(source, {"~r~The player is not online."})
                        end
                    end
                end
            end
        end)
    end
end)

-- repair nearest vehicle
local function ch_repair(player,choice)
  local user_id = XTRA.getUserId(player)
  if user_id ~= nil then
    -- anim and repair
    if XTRA.tryGetInventoryItem(user_id,"repairkit",1,true) then
      XTRAclient.playAnim(player,{false,{task="WORLD_HUMAN_WELDING"},false})
      SetTimeout(15000, function()
        XTRAclient.fixeNearestVehicle(player,{7})
        XTRAclient.stopAnim(player,{false})
      end)
    end
  end
end

RegisterNetEvent("XTRA:PayVehicleTax")
AddEventHandler("XTRA:PayVehicleTax", function()
    local user_id = XTRA.getUserId(source)
    if user_id ~= nil then
        local bank = XTRA.getBankMoney(user_id)
        local payment = bank / 10000
        if XTRA.tryBankPayment(user_id, payment) then
            XTRAclient.notify(source,{"~g~Paid £"..getMoneyStringFormatted(math.floor(payment)).." vehicle tax."})
            TriggerEvent('XTRA:addToCommunityPot', math.floor(payment))
        else
            XTRAclient.notify(source,{"~r~Its fine... Tax payers will pay your vehicle tax instead."})
        end
    end
end)

RegisterNetEvent("XTRA:refreshGaragePermissions")
AddEventHandler("XTRA:refreshGaragePermissions",function(src)
    local source=source
    if src then
        source = src
    end
    local garageTable={}
    local user_id = XTRA.getUserId(source)
    for k,v in pairs(cfg.garages) do
        for a,b in pairs(v) do
            if a == "_config" then
                if json.encode(b.permissions) ~= '[""]' then
                    local hasPermissions = 0
                    for c,d in pairs(b.permissions) do
                        if XTRA.hasPermission(user_id, d) then
                            hasPermissions = hasPermissions + 1
                        end
                    end
                    if hasPermissions == #b.permissions then
                        table.insert(garageTable, k)
                    end
                else
                    table.insert(garageTable, k)
                end
            end
        end
    end
    local ownedVehicles = {}
    if user_id then
        MySQL.query("XTRA/get_vehicles", {user_id = user_id}, function(pvehicles, affected)
            for k,v in pairs(pvehicles) do
                table.insert(ownedVehicles, v.vehicle)
            end
            TriggerClientEvent('XTRA:updateOwnedVehicles', source, ownedVehicles)
        end)
    end
    TriggerClientEvent("XTRA:recieveRefreshedGaragePermissions",source,garageTable)
end)


RegisterNetEvent("XTRA:getGarageFolders")
AddEventHandler("XTRA:getGarageFolders",function()
    local source = source
    local user_id = XTRA.getUserId(source)
    local garageFolders = {}
    local addedFolders = {}
    MySQL.query("XTRA/get_vehicles", {user_id = user_id}, function(result)
        if result ~= nil then 
            for k,v in pairs(result) do
                local spawncode = v.vehicle 
                for a,b in pairs(vehicle_groups) do
                    local hasPerm = true
                    if next(b._config.permissions) then
                        if not XTRA.hasPermission(user_id, b._config.permissions[1]) then
                            hasPerm = false
                        end
                    end
                    if hasPerm then
                        for c,d in pairs(b) do
                            if c == spawncode and not v.impounded then
                                if not addedFolders[a] then
                                    table.insert(garageFolders, {display = a})
                                    addedFolders[a] = true
                                end
                                for e,f in pairs (garageFolders) do
                                    if f.display == a then
                                        if f.vehicles == nil then
                                            f.vehicles = {}
                                        end
                                        table.insert(f.vehicles, {display = d[1], spawncode = spawncode})
                                    end
                                end
                            end
                        end
                    end
                end
            end
            TriggerClientEvent('XTRA:setVehicleFolders', source, garageFolders)
        end
    end)
end)

local cfg_weapons = module("xtra-vehicles", "cfg/weapons")

RegisterServerEvent("XTRA:searchVehicle")
AddEventHandler('XTRA:searchVehicle', function(entity, permid)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'police.armoury') then
        if XTRA.getUserSource(permid) ~= nil then
            XTRAclient.getNetworkedVehicleInfos(XTRA.getUserSource(permid), {entity}, function(owner, spawncode)
                if spawncode and owner == permid then
                    local vehformat = 'chest:u1veh_'..spawncode..'|'..permid
                    XTRA.getSData(vehformat, function(cdata)
                        if cdata ~= nil then
                            cdata = json.decode(cdata) or {}
                            if next(cdata) then
                                for a,b in pairs(cdata) do
                                    if string.find(a, 'wbody|') then
                                        c = a:gsub('wbody|', '')
                                        cdata[c] = b
                                        cdata[a] = nil
                                    end
                                end
                                for k,v in pairs(cfg_weapons.weapons) do
                                    if cdata[k] ~= nil then
                                        if not v.policeWeapon then
                                            XTRAclient.notify(source, {'~r~Seized '..v.name..' x'..cdata[k].amount..'.'})
                                            cdata[k] = nil
                                        end
                                    end
                                end
                                for c,d in pairs(cdata) do
                                    if seizeBullets[c] then
                                        XTRAclient.notify(source, {'~r~Seized '..c..' x'..d.amount..'.'})
                                        cdata[c] = nil
                                    end
                                    if seizeDrugs[c] then
                                        XTRAclient.notify(source, {'~r~Seized '..c..' x'..d.amount..'.'})
                                        cdata[c] = nil
                                    end
                                end
                                XTRA.setSData(vehformat, json.encode(cdata))
                                XTRA.sendWebhook('seize-boot', 'XTRA Seize Boot Logs', "> Officer Name: **"..XTRA.GetPlayerName(user_id).."**\n> Officer TempID: **"..source.."**\n> Officer PermID: **"..user_id.."**\n> Vehicle: **"..spawncode.."**\n> Owner ID: **"..permid.."**")
                            else
                                XTRAclient.notify(source, {'~r~This vehicle is empty.'})
                            end
                        else
                            XTRAclient.notify(source, {'~r~This vehicle is empty.'})
                        end
                    end)
                end
            end)
        end
    end
end)


Citizen.CreateThread(function()
    Wait(1500)
    exports['xtra']:execute([[
        CREATE TABLE IF NOT EXISTS `xtra_custom_garages` (
            `user_id` INT(11) NOT NULL AUTO_INCREMENT,
            `folder` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
            PRIMARY KEY (`user_id`) USING BTREE
        );
    ]])
end)
