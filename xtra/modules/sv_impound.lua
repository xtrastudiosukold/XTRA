local cfg = module("xtra-vehicles","cfg/cfg_garages")
local impoundcfg = module("cfg/cfg_impound")

MySQL.createCommand("XTRA/get_impounded_vehicles", "SELECT * FROM xtra_user_vehicles WHERE user_id = @user_id AND impounded = 1")
MySQL.createCommand("XTRA/get_vehicles", "SELECT vehicle, rentedtime, vehicle_plate, fuel_level FROM xtra_user_vehicles WHERE user_id = @user_id AND rented = 0")
MySQL.createCommand("XTRA/unimpound_vehicle", "UPDATE xtra_user_vehicles SET impounded = 0, impound_info = null, impound_time = null WHERE vehicle = @vehicle AND user_id = @user_id")
MySQL.createCommand("XTRA/impound_vehicle", "UPDATE xtra_user_vehicles SET impounded = 1, impound_info = @impound_info, impound_time = @impound_time WHERE vehicle = @vehicle AND user_id = @user_id")



RegisterNetEvent('XTRA:getImpoundedVehicles')
AddEventHandler('XTRA:getImpoundedVehicles', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    local returned_table = {}
    if user_id then
        MySQL.query("XTRA/get_impounded_vehicles", {user_id = user_id}, function(impoundedvehicles)
            for k, v in pairs(impoundedvehicles) do
                if impoundedvehicles[k]['impound_info'] ~= '' then
                    data = json.decode(impoundedvehicles[k]['impound_info'])
                    returned_table[v.vehicle] = {vehicle = v.vehicle, vehicle_name = data.vehicle_name, impounded_by_name = data.impounded_by_name, impounder = data.impounder, reasons = data.reasons}
                end
            end
            TriggerClientEvent('XTRA:receiveImpoundedVehicles', source, returned_table)
        end)
    end
end)



RegisterNetEvent('XTRA:fetchInfoForVehicleToImpound')
AddEventHandler('XTRA:fetchInfoForVehicleToImpound', function(userid, spawncode, entityid)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'police.armoury') then
        for k, v in pairs(cfg.garages) do
            for a, b in pairs(v) do
                if a == spawncode then
                    vehicle = spawncode
                    vehicle_name = b[1]
                    owner_id = userid
                    vehiclenetid = entityid
                    if XTRA.getUserSource(userid) ~= nil then
                        owner_name = XTRA.GetPlayerName(userid)
                        TriggerClientEvent('XTRA:receiveInfoForVehicleToImpound', source, owner_id, owner_name, vehicle, vehicle_name, vehiclenetid)
                        return
                    else
                        XTRAclient.notify(source, {'~r~Unable to locate owner.'})
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('XTRA:releaseImpoundedVehicle')
AddEventHandler('XTRA:releaseImpoundedVehicle', function(spawncode)
    local source = source
    local user_id = XTRA.getUserId(source)

    MySQL.query("XTRA/get_impounded_vehicles", { user_id = user_id }, function(impoundedvehicles)
        local playerCoords = GetEntityCoords(GetPlayerPed(source))
        local distanceToPaleto = #(playerCoords - vector3(-443.73971557617, 5993.7709960938, 31.340530395508))
        local distanceToCity = #(playerCoords - vector3(370.70745849609, -1609.1722412109, 29.291934967041))
        local impoundLocation
        if distanceToPaleto <= 150.0 and distanceToCity <= 150.0 then
            if distanceToPaleto < distanceToCity then
                impoundLocation = "Paleto"
            else
                impoundLocation = "City"
            end
        elseif distanceToPaleto <= 150.0 then
            impoundLocation = "Paleto"
        elseif distanceToCity <= 150.0 then
            impoundLocation = "City"
        else
            impoundLocation = nil
        end
        if impoundLocation then
            local spawnLocation = impoundcfg.positions[impoundLocation][math.random(#impoundcfg.positions[impoundLocation])]
            
            if spawnLocation then
                MySQL.query("XTRA/get_vehicles", { user_id = user_id }, function(result)
                    if result ~= nil then
                        for k, v in pairs(result) do
                            if v.vehicle == spawncode then
                                if XTRA.tryFullPayment(user_id, impoundcfg.impoundPrice) then
                                    MySQL.execute("XTRA/unimpound_vehicle", {vehicle = spawncode, user_id = user_id})
                                    TriggerClientEvent('XTRA:spawnPersonalVehicle', source, v.vehicle, user_id, false, vector3(spawnLocation.x, spawnLocation.y, spawnLocation.z), v.vehicle_plate, v.fuel_level)
                                    TriggerEvent('XTRA:addToCommunityPot', 10000)
                                    XTRAclient.notifyPicture(source, {"polnotification", "notification", "Your vehicle has been released from the impound at the cost of ~g~£10,000~w~."})
                                else
                                    XTRAclient.notify(source, {'~r~You do not have enough money to retrieve your vehicle from the impound.'})
                                end
                                return
                            end
                        end
                    end
                end)
            else
                XTRAclient.notify(source, {'~r~No valid spawn location found for this impound.'})
            end
        else
            XTRAclient.notify(source, {'~r~Invalid impound location.'})
        end
    end)
end)





RegisterNetEvent('XTRA:impoundVehicle')
AddEventHandler('XTRA:impoundVehicle', function(userid, name, spawncode, vehiclename, reasons, entityid)
    local source = source
    local user_id = XTRA.getUserId(source)
    local entitynetid = NetworkGetEntityFromNetworkId(entityid)
    if XTRA.hasPermission(user_id, 'police.armoury') then
        local m = {}
        for k, v in pairs(impoundcfg.reasonsForImpound) do
            for a, b in pairs(reasons) do
                if k == a then
                    table.insert(m, v.option)
                end
            end
        end
        MySQL.execute("XTRA/impound_vehicle", {impound_info = json.encode({vehicle_name = vehiclename, impounded_by_name = XTRA.GetPlayerName(user_id), impounder = user_id, reasons = m}), impound_time = os.time(), vehicle = spawncode, user_id = userid})
        local A, B = GetVehicleColours(entitynetid)
        TriggerClientEvent('XTRA:impoundSuccess', source, entityid, vehiclename, XTRA.GetPlayerName(userid), spawncode, A, B, GetEntityCoords(entitynetid), GetEntityHeading(entitynetid))
        XTRAclient.notifyPicture(XTRA.getUserSource(userid), {"polnotification","notification","Your "..vehiclename.." has been impounded by ~b~"..XTRA.GetPlayerName(user_id).." \n\n~w~For more information please visit the impound.","Metropolitan Police","Impound",nil,nil})
        XTRA.sendWebhook('impound', 'XTRA Seize Boot Logs', "> Officer Name: **"..XTRA.GetPlayerName(user_id).."**\n> Officer TempID: **"..source.."**\n> Officer PermID: **"..user_id.."**\n> Vehicle: **"..spawncode.."**\n> Vehicle Name: **"..vehiclename.."**\n> Owner ID: **"..userid.."**")
    end
end)


RegisterServerEvent("XTRA:deleteImpoundEntities")
AddEventHandler("XTRA:deleteImpoundEntities", function(a, b, c)
    TriggerClientEvent("XTRA:deletePropClient", -1, a)
    TriggerClientEvent("XTRA:deletePropClient", -1, b)
    TriggerClientEvent("XTRA:deletePropClient", -1, c)
end)

RegisterServerEvent("XTRA:awaitTowTruckArrival")
AddEventHandler("XTRA:awaitTowTruckArrival", function(vehicle, flatbed, ped)
    local count = 0
    while count < 30 do
        Citizen.Wait(1000)
        count = count + 1
    end
    if count == 30 then
        TriggerClientEvent("XTRA:deletePropClient", -1, vehicle)
        TriggerClientEvent("XTRA:deletePropClient", -1, flatbed)
        TriggerClientEvent("XTRA:deletePropClient", -1, ped)
    end
end)
