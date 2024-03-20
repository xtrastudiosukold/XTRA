---Check if a vehicle is out
---@param plate string
---@param vehicles any
---@return boolean out
---@return number | nil vehicle
local function IsVehicleOut(plate, vehicles)
    if not vehicles then
        vehicles = GetAllVehicles()
    end

    for i = 1, #vehicles do
        local vehicle = vehicles[i]
        if DoesEntityExist(vehicle) then
            local vehiclePlate = GetVehicleNumberPlateText(vehicle):gsub("%s+", "")
            if vehiclePlate == plate:gsub("%s+", "") then
                return true, vehicle
            end
        end
    end

    return false
end

lib.RegisterCallback("phone:garage:findCar", function(source, cb, plate)
    local phoneNumber = GetEquippedPhoneNumber(source)

    local out, vehicle = IsVehicleOut(plate)
    if out and vehicle then
        return cb(GetEntityCoords(vehicle))
    end

    if phoneNumber then
        SendNotification(phoneNumber, {
            source = source,
            app = "Garage",
            title = L("BACKEND.GARAGE.VALET"),
            content = L("BACKEND.GARAGE.COULDNT_FIND"),
        })
    end

    cb(false)
end)

lib.RegisterCallback("phone:garage:getVehicles", function(source, cb)
    local vehicles = GetPlayerVehicles(source)

    local allVehicles = #vehicles > 0 and GetAllVehicles() or {}
    for i = 1, #vehicles do
        if IsVehicleOut(vehicles[i].plate, allVehicles) then
            vehicles[i].location = "out"
        end
    end

    cb(vehicles)
end)

lib.RegisterCallback("phone:garage:valetVehicle", function(source, cb, plate, coords, heading)
    local phoneNumber = GetEquippedPhoneNumber(source)
    if not phoneNumber then
        return cb()
    end

    if IsVehicleOut(plate) then
        SendNotification(phoneNumber, {
            app = "Garage",
            title = L("BACKEND.GARAGE.VALET"),
            content = L("BACKEND.GARAGE.ALREADY_OUT"),
        })
        return cb()
    end

    if Config.Valet.Price and GetBalance(source) < Config.Valet.Price then
        SendNotification(phoneNumber, {
            app = "Garage",
            title = L("BACKEND.GARAGE.VALET"),
            content = L("BACKEND.GARAGE.NO_MONEY"),
        })
        return cb()
    end

    local vehicleData = GetVehicle(source, plate)
    if not vehicleData then
        return cb()
    end

    if Config.Valet.Price and not RemoveMoney(source, Config.Valet.Price) then
        SendNotification(phoneNumber, {
            app = "Garage",
            title = L("BACKEND.GARAGE.VALET"),
            content = L("BACKEND.GARAGE.NO_MONEY"),
        })
        return cb()
    end

    SendNotification(phoneNumber, {
        app = "Garage",
        title = L("BACKEND.GARAGE.VALET"),
        content = L("BACKEND.GARAGE.ON_WAY"),
    })

    cb(vehicleData)
end)