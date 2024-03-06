local lib = exports.loaf_lib:GetLib()

RegisterNUICallback("Home", function(data, cb)
    local action = data.action

    if action == "getHomes" then
        exports["xtra"]:lbGetHomes(data, cb)
    elseif action == "removeKeyholder" then
        exports["xtra"]:lbRemoveKeyHolder(data, cb)
    elseif action == "addKeyholder" then
        exports["xtra"]:lbAddKeyholder(data, cb)
    elseif action == "toggleLocked" then
        exports["xtra"]:lbToggleLocked(data, cb)
    elseif action == "setWaypoint" then
        exports["xtra"]:lbSetWaypoint(data)
    end
end)