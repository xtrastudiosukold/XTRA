local usersInDeliverooJob={}
local deliverooStops={
    [1]={
        stopPosition=vector3(396.8274230957,-993.54077148438,29.404117584229)
    },
    [2]={
        stopPosition=vector3(146.29943847656,-1002.9825439453,29.345203399658)
    },
    [3]={
        stopPosition=vector3(-45.810665130615,-1129.7127685547,26.039571762085)
    },
    [4]={
        stopPosition=vector3(-230.99066162109,-979.03881835938,29.242504119873)
    },
    [5]={
        stopPosition=vector3(62.544189453125,-728.20678710938,44.133487701416)
    },
    [6]={
        stopPosition=vector3(-349.51934814453,-1.5412160158157,47.257663726807)
    },
    [7]={
        stopPosition=vector3(-459.90826416016,-366.56008911133,33.858005523682)
    },
    [8]={
        stopPosition=vector3(153.43214416504,-1029.8165283203,29.21466255188)
    },
    [9]={
        stopPosition=vector3(399.83349609375,-995.69421386719,29.457012176514)
    },
    [10]={
        stopPosition=vector3(472.25814819336,-598.60290527344,28.499515533447)
    }
}

RegisterNetEvent("XTRA:attemptBeginDeliverooJob")
AddEventHandler("XTRA:attemptBeginDeliverooJob",function()
    local source=source
    local user_id=XTRA.getUserId(source)
    local deliverooJobTable={}
    if XTRA.hasGroup(user_id,"Deliveroo")then
        if not usersInDeliverooJob[user_id] then
            usersInDeliverooJob[user_id]={currentJob=""}
            deliverooJobTable.jobActive=true
            deliverooJobTable.stopNumber=1
            usersInDeliverooJob[user_id].currentJob=deliverooJobTable
            TriggerClientEvent("XTRA:beginDeliverooJob",source)
            Wait(100)
            TriggerClientEvent("XTRA:deliverooJobSetNextBlip",source,deliverooStops[deliverooJobTable.stopNumber].stopPosition)
        else
            XTRAclient.notify(source,{"You are already a Deliveroo Driver."})
        end
    else
        XTRAclient.notify(source,{"~r~You are not clocked on as a Deliveroo Driver."})
    end
end)

Citizen.CreateThread(function()
    while true do
        for k,v in pairs(usersInDeliverooJob)do
            if v.currentJob.jobActive then
                for a,b in pairs(deliverooStops)do
                    if XTRA.getUserSource(k)then
                        if#(GetEntityCoords(GetPlayerPed(XTRA.getUserSource(k)))-deliverooStops[v.currentJob.stopNumber].stopPosition)<5.0 then
                            local pay = grindBoost*math.random(1000,1500)
                            XTRA.giveBankMoney(k,pay)
                            TriggerClientEvent("XTRA:deliverooJobReachedNextStop",XTRA.getUserSource(k),pay)
                            if v.currentJob.stopNumber==#deliverooStops then
                                TriggerClientEvent("XTRA:deliverooJobEnd", XTRA.getUserSource(k), true)
                                v.currentJob.jobActive=false
                                usersInDeliverooJob[user_id] = nil
                            else
                                v.currentJob.stopNumber=v.currentJob.stopNumber+1
                                TriggerClientEvent("XTRA:deliverooJobSetNextBlip",XTRA.getUserSource(k),deliverooStops[v.currentJob.stopNumber].stopPosition)
                            end
                        end
                    end
                end
            end
        end
        Citizen.Wait(1000)
    end
end)