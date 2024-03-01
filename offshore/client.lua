local lastMoneyAmount = 0

local function AddApp()
    exports["lb-phone"]:AddCustomApp({
        identifier = "offshore",
        name = "Offshore",
        description = "Offshore Banking",
        developer = "XTRA",
        defaultApp = true,
        size = 59812,
        images = {},
        ui = GetCurrentResourceName() .. "/ui/dist/index.html",
        icon = "https://cfx-nui-" .. GetCurrentResourceName() .. "/ui/icon.png"
    })
end

local function updateOffshoreMoney(amount)
    exports["lb-phone"]:SendCustomAppMessage("offshore", {
        type = "setOffshoreMoney",
        amount = amount
    })
end

CreateThread(function ()
    while GetResourceState("lb-phone") ~= "started" do
        Wait(500)
    end

    AddApp()

    AddEventHandler("onResourceStart", function(resource)
        if resource == "lb-phone" then
            AddApp()
        end
    end)

    RegisterNetEvent("XTRA:initMoney", function(_, bank)
        if GetResourceState("lb-phone") == "started" then
            lastMoneyAmount = bank
            updateOffshoreMoney(bank)
        end
    end)

    RegisterNetEvent("XTRA:setDisplayOffshore", function(value)
        if GetResourceState("lb-phone") == "started" then
            lastMoneyAmount = value
            updateOffshoreMoney(value)
        end
    end)

    RegisterNUICallback("depositOffshoreMoney", function(data, cb)
        if data.moneyAmount then
            local moneyAmount = tonumber(data.moneyAmount)
            if moneyAmount then
                TriggerServerEvent("XTRA:depositOffshoreMoney", moneyAmount)
            end
        end
        cb("ok")
    end)

    RegisterNUICallback("withdrawOffshoreMoney", function(data, cb)
        if data.moneyAmount then
            local moneyAmount = tonumber(data.moneyAmount)
            if moneyAmount then
                TriggerServerEvent("XTRA:withdrawOffshoreMoney", moneyAmount)
            end
        end
        cb("ok")
    end)

    RegisterNUICallback("depositAllOffshoreMoney", function(data, cb)
        TriggerServerEvent("XTRA:depositAllOffshoreMoney")
        cb("ok")
    end)

    RegisterNUICallback("withdrawAllOffshoreMoney", function(data, cb)
        TriggerServerEvent("XTRA:withdrawAllOffshoreMoney")
        cb("ok")
    end)

    RegisterNUICallback("getOffshoreMoney", function(data, cb)
        updateOffshoreMoney(lastMoneyAmount)
        cb("ok")
    end)
end)