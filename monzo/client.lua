local lastMoneyAmount = 0

local function AddApp()
    exports["lb-phone"]:AddCustomApp({
        identifier = "monzo",
        name = "Monzo",
        description = "Monzo Banking",
        developer = "XTRA",
        defaultApp = true,
        size = 59812,
        images = {},
        ui = GetCurrentResourceName() .. "/ui/dist/index.html",
        icon = "https://cfx-nui-" .. GetCurrentResourceName() .. "/ui/icon.png"
    })
end

local function updateMonzoMoney(amount)
    exports["lb-phone"]:SendCustomAppMessage("monzo", {
        type = "setMonzoMoney",
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
            updateMonzoMoney(bank)
        end
    end)

    RegisterNetEvent("XTRA:setDisplayBankMoney", function(value)
        if GetResourceState("lb-phone") == "started" then
            lastMoneyAmount = value
            updateMonzoMoney(value)
        end
    end)

    RegisterNUICallback("transferMonzoMoney", function(data, cb)
        if data.permId and data.moneyAmount then
            local permId = tonumber(data.permId)
            local moneyAmount = tonumber(data.moneyAmount)
            if permId and moneyAmount then
                TriggerServerEvent("XTRA:transferMoneyViaPermID", permId, moneyAmount)
            end
        end
        cb("ok")
    end)

    RegisterNUICallback("getMoneyMoney", function(data, cb)
        updateMonzoMoney(lastMoneyAmount)
        cb("ok")
    end)
end)