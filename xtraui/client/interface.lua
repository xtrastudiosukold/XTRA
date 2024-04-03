exports("sendMessage", function(message)
    SendNUIMessage(message)
end)

exports("setFocus", function(hasFocus, hasCursor, keepInput)
    SetNuiFocus(hasFocus, hasCursor)
    if type(keepInput) == "boolean" then
        SetNuiFocusKeepInput(keepInput)
    end
end)

exports("registerCallback", function(name, handler)
    RegisterNUICallback(name, function(data, callback)
        local response = handler(data)
        callback(response)
    end)
end)