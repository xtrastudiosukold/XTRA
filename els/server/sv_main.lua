RegisterNetEvent("XTRAELS:changeStage", function(stage)
    local source = source
    local vehicleNetId = NetworkGetNetworkIdFromEntity(GetVehiclePedIsIn(GetPlayerPed(source)))
	TriggerClientEvent('XTRAELS:changeStage', -1, vehicleNetId, stage)
end)

RegisterNetEvent("XTRAELS:toggleSiren", function(tone)
    local source = source
    local vehicleNetId = NetworkGetNetworkIdFromEntity(GetVehiclePedIsIn(GetPlayerPed(source)))
	TriggerClientEvent('XTRAELS:toggleSiren', -1, vehicleNetId, tone)
end)

RegisterNetEvent("XTRAELS:toggleBullhorn", function(enabled)
    local source = source
    local vehicleNetId = NetworkGetNetworkIdFromEntity(GetVehiclePedIsIn(GetPlayerPed(source)))
	TriggerClientEvent('XTRAELS:toggleBullhorn', -1, vehicleNetId, enabled)
end)

RegisterNetEvent("XTRAELS:patternChange", function(patternIndex, enabled)
    local source = source
    local vehicleNetId = NetworkGetNetworkIdFromEntity(GetVehiclePedIsIn(GetPlayerPed(source)))
	TriggerClientEvent('XTRAELS:patternChange', -1, vehicleNetId, patternIndex, enabled)
end)

RegisterNetEvent("XTRAELS:vehicleRemoved", function(stage)
	TriggerClientEvent('XTRAELS:vehicleRemoved', -1, stage)
end)

RegisterNetEvent("XTRAELS:indicatorChange", function(indicator, enabled)
    local source = source
    local vehicleNetId = NetworkGetNetworkIdFromEntity(GetVehiclePedIsIn(GetPlayerPed(source)))
	TriggerClientEvent('XTRAELS:indicatorChange', -1, vehicleNetId, indicator, enabled)
end)