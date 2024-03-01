local cfg=module("cfg/cfg_simeons")
local inventory=module("xtra-vehicles", "cfg/cfg_inventory")


RegisterNetEvent("XTRA:refreshSimeonsPermissions")
AddEventHandler("XTRA:refreshSimeonsPermissions",function()
    local source=source
    local simeonsCategories={}
    local user_id = XTRA.getUserId(source)
    for k,v in pairs(cfg.simeonsCategories) do
        for a,b in pairs(v) do
            if a == "_config" then
                if b.permissionTable[1] ~= nil then
                    if XTRA.hasPermission(XTRA.getUserId(source),b.permissionTable[1])then
                        for c,d in pairs(v) do
                            if inventory.vehicle_chest_weights[c] then
                                table.insert(v[c],inventory.vehicle_chest_weights[c])
                            else
                                table.insert(v[c],30)
                            end
                        end
                        simeonsCategories[k] = v
                    end
                else
                    for c,d in pairs(v) do
                        if inventory.vehicle_chest_weights[c] then
                            table.insert(v[c],inventory.vehicle_chest_weights[c])
                        else
                            table.insert(v[c],30)
                        end
                    end
                    simeonsCategories[k] = v
                end
            end
        end
    end
    TriggerClientEvent("XTRA:gotCarDealerInstances",source,cfg.simeonsInstances)
    TriggerClientEvent("XTRA:gotCarDealerCategories",source,simeonsCategories)
end)

RegisterNetEvent('XTRA:purchaseCarDealerVehicle')
AddEventHandler('XTRA:purchaseCarDealerVehicle', function(vehicleclass, vehicle)
    local source = source
    local user_id = XTRA.getUserId(source)
    local playerName = XTRA.GetPlayerName(user_id)   
    for k,v in pairs(cfg.simeonsCategories[vehicleclass]) do
        if k == vehicle then
            local vehicle_name = v[1]
            local vehicle_price = v[2]
            MySQL.query("XTRA/get_vehicle", {user_id = user_id, vehicle = vehicle}, function(pvehicle, affected)
                if #pvehicle > 0 then
                    XTRAclient.notify(source,{"Vehicle already owned."})
                else
                    if XTRA.tryFullPayment(user_id, vehicle_price) then
                        XTRAclient.generateUUID(source, {"plate", 5, "alphanumeric"}, function(uuid)
                            local uuid = string.upper(uuid)
                            MySQL.execute("XTRA/add_vehicle", {user_id = user_id, vehicle = vehicle, registration = 'P'..uuid})
                            XTRAclient.notifyPicture(source, {"monzo", "monzo", "~g~You paid £"..vehicle_price.." for "..vehicle_name.."."})

                            TriggerClientEvent("XTRA:PlaySound", source, "playMoney")
                        end)
                    else
                        XTRAclient.notify(source,{"Not enough money."})
                        TriggerClientEvent("XTRA:PlaySound", source, 2)
                    end
                end
            end)
        end
    end
end)
