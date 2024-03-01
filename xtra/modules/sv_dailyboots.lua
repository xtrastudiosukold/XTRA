local VehicleBoots = module("xtra-vehicles", "cfg/cfg_inventory")
local Garage = module("xtra-vehicles", "cfg/cfg_garages") 
RegisterCommand("dailyboot",function(source,args,raw)
    local source = source
    local user_id = XTRA.getUserId(source)
    if BootRedeemable then
        if not table1.Claimed[user_id] then
            local vehicletable = {}
            MySQL.query("XTRA/get_vehicles", {user_id = user_id}, function(vehicles)
                if vehicles then
                    for A, B in pairs(vehicles) do
                        local isSkipCategory = IsSkipCategory(B.vehicle)
                        if not isSkipCategory then
                            vehicletable[B.vehicle] = {kg = VehicleBoots.vehicle_chest_weights[B.vehicle] or VehicleBoots.default_vehicle_chest_weight, checked = false}
                        end
                    end
                    TriggerClientEvent("XTRA:ReturnVehicleTable", source, vehicletable)
                else
                    XTRAclient.notify(source, {"Please Contact a Developer with the code 'XTRA-DB-1\nUser ID: " .. user_id})
                end
            end)
        else
            XTRAclient.notify(source,{"~r~You have already claimed your daily boot!"})
        end
    else
        XTRAclient.notify(source,{"~r~The daily boot is not redeemable at this time!"})
    end
end)

RegisterServerEvent("XTRA:ClaimBoot",function(table)
    local source = source
    local user_id = XTRA.getUserId(source)
    if not table1.Claimed[user_id] or not table1.Processing[user_id] and BootRedeemable then 
        table1.Processing[user_id] = true
        for A,B in pairs(table) do
            if B.checked then
                XTRA.getSData("chest:u1veh_"..A.."|"..user_id,function(cardata)
                    cardata = json.decode(cardata) or {}
                    local maxVehKg = VehicleBoots.vehicle_chest_weights[A] or VehicleBoots.default_vehicle_chest_weight
                    local weightCalculation = XTRA.computeItemsWeight(cardata)+30
                    if weightCalculation == nil then return end
                    if weightCalculation >= maxVehKg then
                        XTRAclient.notify(source,{"You cannot claim with this vehicle\nPlease Pick another!"})
                    else
                        for C,D in pairs(bootinformation.reward.items) do
                            print(C)
                            print(D)
                            cardata[C] = cardata[C] or {}
                            cardata[C].amount = (cardata[C].amount or 0) + D
                        end
                        table1.Claimed[user_id] = true
                        XTRA.giveBankMoney(user_id, bootinformation.reward.money)
                        TriggerClientEvent("XTRA:RewardClaimed",source)
                        TriggerClientEvent("XTRA:storeDrawEffects",source)
                        XTRA.setSData("chest:u1veh_"..A.."|"..user_id, json.encode(cardata))
                        XTRAclient.notify(source,{"You have claimed your daily boot and received "..getMoneyStringFormatted(bootinformation.reward.money).."!"})
                    end
                    table1.Processing[user_id] = false
                end)
            end
        end
    else
        XTRAclient.notify(source,{table1.Claimed[user_id] and "You have already claimed your daily boot!" or table1.Processing[user_id] and "You are already processing a boot!" or not BootRedeemable and "The daily boot is not redeemable at this time!" or "Please contact a developer with the code 'XTRA-ERR-1'"})
    end
end)

function IsSkipCategory(vehicleName)
    local skipCategories = {"police.armoury", "nhs.menu", "hmp.menu", "lfb.onduty.permission"}
    for garageName, garageData in pairs(Garage.garages) do
        local config = garageData._config
        local permissions = config.permissions or {}
        for _, permission in ipairs(permissions) do
            if tableContains(skipCategories, permission) and garageData[vehicleName] then
                return true
            end
        end
    end
    return false
end