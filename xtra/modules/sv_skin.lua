RegisterNetEvent("XTRA:saveFaceData")
AddEventHandler("XTRA:saveFaceData", function(faceSaveData)
    local source = source
    local user_id = XTRA.getUserId(source)
    XTRA.setUData(user_id,"XTRA:Face:Data",json.encode(faceSaveData))
end)

RegisterNetEvent("XTRA:saveClothingHairData") -- this updates hair from clothing stores
AddEventHandler("XTRA:saveClothingHairData", function(hairtype, haircolour)
    local source = source
    local user_id = XTRA.getUserId(source)
    local facesavedata = {}
    XTRA.getUData(user_id, "XTRA:Face:Data", function(data)
        if data ~= nil and data ~= 0 and hairtype ~= nil and haircolour ~= nil then
            facesavedata = json.decode(data)
            if facesavedata == nil then
                facesavedata = {}
            end
            facesavedata["hair"] = hairtype
            facesavedata["haircolor"] = haircolour
            XTRA.setUData(user_id,"XTRA:Face:Data",json.encode(facesavedata))
        end
    end)
end)

RegisterNetEvent("XTRA:getPlayerHairstyle")
AddEventHandler("XTRA:getPlayerHairstyle", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    XTRA.getUData(user_id,"XTRA:Face:Data", function(data)
        if data ~= nil and data ~= 0 then
            TriggerClientEvent("XTRA:setHairstyle", source, json.decode(data))
        end
    end)
end)

AddEventHandler("XTRA:playerSpawn", function(user_id, source, first_spawn)
    SetTimeout(1000, function() 
        local source = source
        local user_id = XTRA.getUserId(source)
        XTRA.getUData(user_id,"XTRA:Face:Data", function(data)
            if data ~= nil and data ~= 0 then
                TriggerClientEvent("XTRA:setHairstyle", source, json.decode(data))
            end
        end)
    end)
end)