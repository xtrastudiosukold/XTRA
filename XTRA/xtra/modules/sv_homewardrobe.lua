local outfitCodes = {}

RegisterNetEvent("XTRA:saveWardrobeOutfit")
AddEventHandler("XTRA:saveWardrobeOutfit", function(outfitName)
    local source = source
    local user_id = XTRA.getUserId(source)
    XTRA.getUData(user_id, "XTRA:home:wardrobe", function(data)
        local sets = json.decode(data)
        if sets == nil then
            sets = {}
        end
        XTRAclient.getCustomization(source,{},function(custom)
            sets[outfitName] = custom
            XTRA.setUData(user_id,"XTRA:home:wardrobe",json.encode(sets))
            XTRAclient.notify(source,{"~g~Saved outfit "..outfitName.." to wardrobe!"})
            TriggerClientEvent("XTRA:refreshOutfitMenu", source, sets)
        end)
    end)
end)

RegisterNetEvent("XTRA:deleteWardrobeOutfit")
AddEventHandler("XTRA:deleteWardrobeOutfit", function(outfitName)
    local source = source
    local user_id = XTRA.getUserId(source)
    XTRA.getUData(user_id, "XTRA:home:wardrobe", function(data)
        local sets = json.decode(data)
        if sets == nil then
            sets = {}
        end
        sets[outfitName] = nil
        XTRA.setUData(user_id,"XTRA:home:wardrobe",json.encode(sets))
        XTRAclient.notify(source,{"Remove outfit "..outfitName.." from wardrobe!"})
        TriggerClientEvent("XTRA:refreshOutfitMenu", source, sets)
    end)
end)

RegisterNetEvent("XTRA:equipWardrobeOutfit")
AddEventHandler("XTRA:equipWardrobeOutfit", function(outfitName)
    local source = source
    local user_id = XTRA.getUserId(source)
    XTRA.getUData(user_id, "XTRA:home:wardrobe", function(data)
        local sets = json.decode(data)
        XTRAclient.setCustomization(source, {sets[outfitName]})
        XTRAclient.getHairAndTats(source, {})
    end)
end)

RegisterNetEvent("XTRA:initWardrobe")
AddEventHandler("XTRA:initWardrobe", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    XTRA.getUData(user_id, "XTRA:home:wardrobe", function(data)
        local sets = json.decode(data)
        if sets == nil then
            sets = {}
        end
        TriggerClientEvent("XTRA:refreshOutfitMenu", source, sets)
    end)
end)

RegisterNetEvent("XTRA:getCurrentOutfitCode")
AddEventHandler("XTRA:getCurrentOutfitCode", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    XTRAclient.getCustomization(source,{},function(custom)
        XTRAclient.generateUUID(source, {"outfitcode", 5, "alphanumeric"}, function(uuid)
            local uuid = string.upper(uuid)
            outfitCodes[uuid] = custom
            XTRAclient.CopyToClipBoard(source, {uuid})
            XTRAclient.notify(source, {"~g~Outfit code copied to clipboard."})
            XTRAclient.notify(source, {"The code ~y~"..uuid.."~w~ will persist until restart."})
        end)
    end)
end)

RegisterNetEvent("XTRA:applyOutfitCode")
AddEventHandler("XTRA:applyOutfitCode", function(outfitCode)
    local source = source
    local user_id = XTRA.getUserId(source)
    if outfitCodes[outfitCode] ~= nil then
        XTRAclient.setCustomization(source, {outfitCodes[outfitCode]})
        XTRAclient.notify(source, {"~g~Outfit code applied."})
        XTRAclient.getHairAndTats(source, {})
    else
        XTRAclient.notify(source, {"Outfit code not found."})
    end
end)

RegisterCommand('wardrobe', function(source)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasGroup(user_id, 'Founder') or XTRA.hasGroup(user_id, 'Developer') or XTRA.hasGroup(user_id, 'Lead Developer') then
        TriggerClientEvent("XTRA:openOutfitMenu", source)
    end
end)

RegisterCommand('copyfit', function(source, args)
    local source = source
    local user_id = XTRA.getUserId(source)
    local permid = tonumber(args[1])
    if XTRA.hasGroup(user_id, 'Founder') or XTRA.hasGroup(user_id, 'Developer') or XTRA.hasGroup(user_id, 'Lead Developer') then
        XTRAclient.getCustomization(XTRA.getUserSource(permid),{},function(custom)
            XTRAclient.setCustomization(source, {custom})
        end)
    end
end)