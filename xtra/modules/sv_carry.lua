carrying = {}
carried = {}
requests = {}

RegisterCommand('carryaccept', function(source)
    if requests[source] then
        TriggerClientEvent('CarryPeople:syncMe', requests[source], 'missfinale_c2mcs_1', 'fin_c2_mcs_1_camman', 0, 49)
        TriggerClientEvent('CarryPeople:syncTarget', source, requests[source], 'nm', 'firemans_carry', 0.15, 0.27, 0.63, GetEntityHeading(GetPlayerPed(requests[source])), 10000, 33)
        XTRAclient.notify(requests[source], {"~g~Request Accepted"})
        carrying[requests[source]] = source
        carried[source] = requests[source]
        requests[source] = nil
    end
end)

RegisterCommand('carryrefuse', function(source)
    if requests[source] then
        XTRAclient.notify(requests[source], {"Request Refused"})
        requests[source] = nil
    end
end)

RegisterServerEvent("CarryPeople:sync")
AddEventHandler("CarryPeople:sync", function(source, targetSrc)
    local sourcePed = GetPlayerPed(source)
    local sourceCoords = GetEntityCoords(sourcePed)
    local targetPed = GetPlayerPed(targetSrc)
    local targetCoords = GetEntityCoords(targetPed)
    if #(sourceCoords - targetCoords) <= 3.0 then 
        TriggerClientEvent('CarryPeople:syncMe', source, 'missfinale_c2mcs_1', 'fin_c2_mcs_1_camman', 0, 49)
        TriggerClientEvent('CarryPeople:syncTarget', targetSrc, source, 'nm', 'firemans_carry', 0.15, 0.27, 0.63, GetEntityHeading(sourcePed), 100000, 33)
        carrying[source] = targetSrc
        carried[targetSrc] = source
    end
end)

RegisterServerEvent("CarryPeople:requestCarry")
AddEventHandler("CarryPeople:requestCarry", function(targetSrc)
    local source = source
    if targetSrc ~= nil then
        requests[targetSrc] = source
        TriggerClientEvent('CarryPeople:carryRequest', targetSrc)
        XTRAclient.notify(source, {"~g~Request Sent"})
    end
end)

RegisterServerEvent("CarryPeople:stop")
AddEventHandler("CarryPeople:stop", function(targetSrc)
    local source = source
    if carrying[source] then
        TriggerClientEvent("CarryPeople:cl_stop", targetSrc)
        carrying[source] = nil
        carried[targetSrc] = nil
    elseif carried[source] then
        TriggerClientEvent("CarryPeople:cl_stop", carried[source])            
        carrying[carried[source]] = nil
        carried[source] = nil
    end
end)

AddEventHandler('playerDropped', function(reason)
    local source = source
    if carrying[source] then
        TriggerClientEvent("CarryPeople:cl_stop", carrying[source])
        carried[carrying[source]] = nil
        carrying[source] = nil
    end
    if carried[source] then
        TriggerClientEvent("CarryPeople:cl_stop", carried[source])
        carrying[carried[source]] = nil
        carried[source] = nil
    end
end)