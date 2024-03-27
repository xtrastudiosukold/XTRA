local cfg = module("cfg/atms")
local organcfg = module("cfg/cfg_organheist")
local lang = XTRA.lang

RegisterServerEvent("XTRA:Withdraw")
AddEventHandler('XTRA:Withdraw', function(amount)
    local source = source
    local user_id = XTRA.getUserId(source)
    local amount = tonumber(amount)
    if amount > 0 then  
        if user_id ~= nil then
            if XTRA.tryWithdraw(user_id, amount) then
                XTRAclient.notify(source, {"~g~You have withdrawn £"..getMoneyStringFormatted(amount)})
            else 
                XTRAclient.notify(source, {"~r~You do not have enough money to withdraw."})
            end
        end
    end
end)
RegisterServerEvent("XTRA:Deposit")
AddEventHandler('XTRA:Deposit', function(amount)
    local source = source
    local user_id = XTRA.getUserId(source)
    local amount = tonumber(amount)
    if amount > 0 then  
        if user_id ~= nil then
            if XTRA.tryDeposit(user_id, amount) then
                XTRAclient.notify(source, {"~g~You have deposited £"..getMoneyStringFormatted(amount)})
            else 
                XTRAclient.notify(source, {"~r~You do not have enough money to deposit."})
            end
        end
    end
end)

RegisterServerEvent("XTRA:WithdrawAll")
AddEventHandler('XTRA:WithdrawAll', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    local amount = XTRA.getBankMoney(XTRA.getUserId(source))
    if amount > 0 then  
        if user_id ~= nil then
            if XTRA.tryWithdraw(user_id, amount) then
                XTRAclient.notify(source, {"~g~You have withdrawn £"..getMoneyStringFormatted(amount)})
            else 
                XTRAclient.notify(source, {"~r~You do not have enough money to withdraw."})
            end
        end
    end
end)

RegisterServerEvent("XTRA:DepositAll")
AddEventHandler('XTRA:DepositAll', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    local amount = XTRA.getMoney(XTRA.getUserId(source))
    if amount > 0 then  
        if user_id ~= nil then
            if XTRA.tryDeposit(user_id, amount) then
                XTRAclient.notify(source, {"~g~You have deposited £"..getMoneyStringFormatted(amount)})
            else 
                XTRAclient.notify(source, {"~r~You do not have enough money to deposit."})
            end
        end
    end
end)

