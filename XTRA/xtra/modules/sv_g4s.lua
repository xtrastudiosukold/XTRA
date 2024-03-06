local currentUsersOnG4SJob={}
local collectFrom={
    [1]={
        collectionName="Bean Machine",
        collectionPoint=vector3(-628.38208007812,239.23078918457,81.894218444824)
    },
    [2]={
        collectionName="LA | Fitness",
        collectionPoint=vector3(256.7271, -257.4939, 54.03673)
    },
    [3]={
        collectionName="PFC Arena",
        collectionPoint=vector3(-265.88760375977,-2017.5471191406,30.145708084106)
    },
    [4]={
        collectionName="Redwood Cigarettes",
        collectionPoint=vector3(1332.0754394531,-1642.0830078125,52.117248535156)
    },
}
local depositTo={
    [1]={
        depositName="Pacific Standard Bank",
        depositPoint=vector3(254.10975646973,225.61262512207,101.87567901611)
    },
    [2]={
        depositName="Fleeca Bank",
        depositPoint=vector3(314.35034179688,-278.65893554688,54.170753479004)
    },
    [3]={
        depositName="Maze Bank",
        depositPoint=vector3(5.2346858978271,-934.26495361328,29.904996871948)
    },
    [4]={
        depositName="Union Depository",
        depositPoint=vector3(5.282205581665,-707.33819580078,45.97477722168)
    },
}
local jobsCompleted = {}

function GetCollection(user_id)
    local randomShop=math.random(1,#collectFrom)
    local randomBank=math.random(1,#depositTo)
    local returnedTable={}
    for k,v in pairs(collectFrom)do
        if k==randomShop then
            returnedTable.collected=v.collected
            returnedTable.collecting=false
            returnedTable.collectionName=v.collectionName
            returnedTable.collectionCoords=v.collectionPoint
        end
    end
    for k,v in pairs(depositTo)do
        if k==randomBank then
            returnedTable.deposited=v.deposited
            returnedTable.depositName=v.depositName
            returnedTable.depositCoords=v.depositPoint
        end
    end
    returnedTable.jobActive=false
    jobsCompleted[user_id] = jobsCompleted[user_id] + 1
    returnedTable.totalJobs = jobsCompleted[user_id]
    returnedTable.moneyInVehicle=false
    returnedTable.moneyOutVehicle=false
    currentUsersOnG4SJob[user_id].currentJob=returnedTable
    return returnedTable
end

RegisterNetEvent("XTRA:toggleShiftG4S")
AddEventHandler("XTRA:toggleShiftG4S", function(Status)
    local source=source
    local user_id=XTRA.getUserId(source)
    if XTRA.hasGroup(user_id,"G4S Driver")then
        if Status then
            currentUsersOnG4SJob[user_id]={currentJob=""}
            TriggerClientEvent("XTRA:startShiftG4S",source,math.random(1000,9999))
            jobsCompleted[user_id] = 0
            Wait(10000)
            TriggerClientEvent("XTRA:updateJobInformation",source,GetCollection(user_id))
        else
            if currentUsersOnG4SJob[user_id]~=nil then
                currentUsersOnG4SJob[user_id]=nil
                jobsCompleted[user_id] = nil
                TriggerClientEvent("XTRA:endShiftG4S",source)
            end
        end
    else
        XTRAclient.notify(source,{"~r~You are not clocked on as currentUsersOnG4SJob G4S Driver."})
    end
end)

RegisterNetEvent("XTRA:acceptJob")
AddEventHandler("XTRA:acceptJob",function()
    local source=source
    local user_id=XTRA.getUserId(source)
    if XTRA.hasGroup(user_id,"G4S Driver")then
        for k,v in pairs(currentUsersOnG4SJob)do
            if k == user_id then    
                v.currentJob.jobActive=true
                v.currentJob.collected=false
                v.currentJob.collecting=false
                v.currentJob.depoting=true
                v.currentJob.deposited=false
                currentUsersOnG4SJob[user_id].currentJob=v.currentJob
                TriggerClientEvent("XTRA:updateJobInformation",source,v.currentJob)
            end
        end
    else
        XTRAclient.notify(source,{"~r~You are not clocked on as currentUsersOnG4SJob G4S Driver."})
    end
end)

RegisterNetEvent("XTRA:updateMoneyInVehicle")
AddEventHandler("XTRA:updateMoneyInVehicle", function()
    local source=source
    local user_id=XTRA.getUserId(source)
    if XTRA.hasGroup(user_id,"G4S Driver")then
        for k,v in pairs(currentUsersOnG4SJob)do
            if k==user_id then
                v.currentJob.moneyInVehicle=true
                v.currentJob.moneyOutVehicle=false
                currentUsersOnG4SJob[user_id].currentJob=v.currentJob
            end
        end
    else
        XTRAclient.notify(source,{"~r~You are not clocked on as currentUsersOnG4SJob G4S Driver."})
    end
end)

RegisterNetEvent("XTRA:updateMoneyOutVehicle")
AddEventHandler("XTRA:updateMoneyOutVehicle", function()
    local source=source
    local user_id=XTRA.getUserId(source)
    if XTRA.hasGroup(user_id,"G4S Driver")then
        for k,v in pairs(currentUsersOnG4SJob)do
            if k==user_id then
                v.currentJob.moneyOutVehicle=true
                v.currentJob.moneyInVehicle = false
                currentUsersOnG4SJob[user_id].currentJob=v.currentJob
            end
        end
    else
        XTRAclient.notify(source,{"~r~You are not clocked on as currentUsersOnG4SJob G4S Driver."})
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(1000)
        for k,v in pairs(currentUsersOnG4SJob)do
            if v.currentJob.jobActive then
                if XTRA.getUserSource(k)then
                    if not v.currentJob.collected then
                        if #(GetEntityCoords(GetPlayerPed(XTRA.getUserSource(k)))-v.currentJob.collectionCoords)<1.5 then
                            v.currentJob.collected=true
                            currentUsersOnG4SJob[k].currentJob=v.currentJob
                            TriggerClientEvent("XTRA:updateJobInformation",XTRA.getUserSource(k),v.currentJob)
                            TriggerClientEvent("XTRA:requestMoneyInVehicle",XTRA.getUserSource(k))
                        end
                    elseif v.currentJob.moneyInVehicle and not v.currentJob.depositing and not v.currentJob.moneyOutVehicle then
                        if #(GetEntityCoords(GetPlayerPed(XTRA.getUserSource(k)))-v.currentJob.depositCoords)<20 then
                            v.currentJob.depositing=true
                            currentUsersOnG4SJob[k].currentJob=v.currentJob
                            TriggerClientEvent("XTRA:updateJobInformation",XTRA.getUserSource(k),v.currentJob)
                            TriggerClientEvent("XTRA:requestMoneyOutVehicle",XTRA.getUserSource(k))
                        end
                    elseif not v.currentJob.deposited and v.currentJob.moneyOutVehicle then
                        if #(GetEntityCoords(GetPlayerPed(XTRA.getUserSource(k)))-v.currentJob.depositCoords)<1.5 then
                            v.currentJob.deposited=true
                            v.currentJob.depositing=false
                            TriggerClientEvent("XTRA:updateJobInformation",XTRA.getUserSource(k),GetCollection(k))
                            local pay = grindBoost*math.random(8000,12000)
                            XTRA.giveBankMoney(k,pay)
                        end
                    end
                end
            end
        end
    end
end)

RegisterCommand('g4s', function(source, args)
    local source = source
    local user_id = XTRA.getUserId(source)
    for k,v in pairs(currentUsersOnG4SJob) do
        if k == user_id then
            TriggerClientEvent("XTRA:openG4SMenu", source)
        end
    end
end)