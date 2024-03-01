local lookup = {
    ["XTRAELS:changeStage"] = "XTRAELS:1",
    ["XTRAELS:toggleSiren"] = "XTRAELS:2",
    ["XTRAELS:toggleBullhorn"] = "XTRAELS:3",
    ["XTRAELS:patternChange"] = "XTRAELS:4",
    ["XTRAELS:vehicleRemoved"] = "XTRAELS:5",
    ["XTRAELS:indicatorChange"] = "XTRAELS:6"
}

local origRegisterNetEvent = RegisterNetEvent
RegisterNetEvent = function(name, callback)
    origRegisterNetEvent(lookup[name], callback)
end

if IsDuplicityVersion() then
    local origTriggerClientEvent = TriggerClientEvent
    TriggerClientEvent = function(name, target, ...)
        origTriggerClientEvent(lookup[name], target, ...)
    end

    TriggerClientScopeEvent = function(name, target, ...)
        exports["xtra"]:TriggerClientScopeEvent(lookup[name], target, ...)
    end
else
    local origTriggerServerEvent = TriggerServerEvent
    TriggerServerEvent = function(name, ...)
        origTriggerServerEvent(lookup[name], ...)
    end
end