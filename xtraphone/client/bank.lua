
inMenu = true
local bank = 0
function setBankBalance(value)
    bank = value
    SendNUIMessage({event = 'updateBankbalance', banking = bank})
end

RegisterNetEvent("XTRA:setAccountMoney")
AddEventHandler("XTRA:setAccountMoney", function(bankMoney)
    setBankBalance(bankMoney)
end)

RegisterNUICallback("bank_transfer", function(data) 
    TriggerServerEvent("XTRA:bankTransfer", data.user_id, data.amount)
end)