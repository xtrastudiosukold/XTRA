local lang = XTRA.lang
--Money module, wallet/bank API
-- The money is managed with direct SQL requests to prevent most potential value corruptions
-- the wallet empty itself when respawning (after death)

MySQL.createCommand("XTRA/money_init_user","INSERT IGNORE INTO xtra_user_moneys(user_id,wallet,bank) VALUES(@user_id,@wallet,@bank)")
MySQL.createCommand("XTRA/get_money","SELECT wallet,bank FROM xtra_user_moneys WHERE user_id = @user_id")
MySQL.createCommand("XTRA/set_money","UPDATE xtra_user_moneys SET wallet = @wallet, bank = @bank WHERE user_id = @user_id")

-- get money
-- cbreturn nil if error
function XTRA.getMoney(user_id)
  local tmp = XTRA.getUserTmpTable(user_id)
  if tmp then
    return tmp.wallet or 0
  else
    return 0
  end
end

-- set money
function XTRA.setMoney(user_id,value)
  local tmp = XTRA.getUserTmpTable(user_id)
  if tmp then
    tmp.wallet = value
  end

  -- update client display
  local source = XTRA.getUserSource(user_id)
  if source ~= nil then
    XTRAclient.setDivContent(source,{"money",lang.money.display({Comma(XTRA.getMoney(user_id))})})
    TriggerClientEvent('XTRA:initMoney', source, XTRA.getMoney(user_id), XTRA.getBankMoney(user_id))
  end
end

-- try a payment
-- return true or false (debited if true)
function XTRA.tryPayment(user_id,amount)
  local money = XTRA.getMoney(user_id)
  if amount >= 0 and money >= amount then
    XTRA.setMoney(user_id,money-amount)
    return true
  else
    return false
  end
end

function XTRA.tryBankPayment(user_id,amount)
  local bank = XTRA.getBankMoney(user_id)
  if amount >= 0 and bank >= amount then
    XTRA.setBankMoney(user_id,bank-amount)
    return true
  else
    return false
  end
end

-- give money
function XTRA.giveMoney(user_id,amount)
  local money = XTRA.getMoney(user_id)
  XTRA.setMoney(user_id,money+amount)
end

-- get bank money
function XTRA.getBankMoney(user_id)
  local tmp = XTRA.getUserTmpTable(user_id)
  if tmp then
    return tmp.bank or 0
  else
    return 0
  end
end

-- set bank money
function XTRA.setBankMoney(user_id,value)
  local tmp = XTRA.getUserTmpTable(user_id)
  if tmp then
    tmp.bank = value
  end
  local source = XTRA.getUserSource(user_id)
  if source ~= nil then
    XTRAclient.setDivContent(source,{"bmoney",lang.money.bdisplay({Comma(XTRA.getBankMoney(user_id))})})
    TriggerClientEvent('XTRA:initMoney', source, XTRA.getMoney(user_id), XTRA.getBankMoney(user_id))
  end
end

-- give bank money
function XTRA.giveBankMoney(user_id,amount)
  if amount > 0 then
    local money = XTRA.getBankMoney(user_id)
    XTRA.setBankMoney(user_id,money+amount)
  end
end

-- try a withdraw
-- return true or false (withdrawn if true)
function XTRA.tryWithdraw(user_id,amount)
  local money = XTRA.getBankMoney(user_id)
  if amount > 0 and money >= amount then
    XTRA.setBankMoney(user_id,money-amount)
    XTRA.giveMoney(user_id,amount)
    return true
  else
    return false
  end
end

-- try a deposit
-- return true or false (deposited if true)
function XTRA.tryDeposit(user_id,amount)
  if amount > 0 and XTRA.tryPayment(user_id,amount) then
    XTRA.giveBankMoney(user_id,amount)
    return true
  else
    return false
  end
end

-- try full payment (wallet + bank to complete payment)
-- return true or false (debited if true)
function XTRA.tryFullPayment(user_id,amount)
  local money = XTRA.getMoney(user_id)
  if money >= amount then -- enough, simple payment
    return XTRA.tryPayment(user_id, amount)
  else  -- not enough, withdraw -> payment
    if XTRA.tryWithdraw(user_id, amount-money) then -- withdraw to complete amount
      return XTRA.tryPayment(user_id, amount)
    end
  end

  return false
end

local startingCash = 5000
local startingBank = 50000

AddEventHandler("XTRA:playerJoin",function(user_id,source)
    local hasData = exports["xtra"]:executeSync("SELECT * FROM xtra_user_moneys WHERE user_id = @user_id", {user_id = user_id})
    local bank,wallet = 0,0
    local tmptbl = XTRA.getUserTmpTable(user_id)
    if hasData and #hasData > 0 then
        bank = hasData[1].bank
        wallet = hasData[1].wallet
    else
        exports["xtra"]:execute("INSERT INTO xtra_user_moneys (user_id, wallet, bank) VALUES (@user_id, @wallet, @bank)", {user_id = user_id, wallet = startingCash, bank = startingBank})
        bank = startingBank
        wallet = startingCash
    end
    tmptbl.bank = bank
    tmptbl.wallet = wallet
    TriggerClientEvent('XTRA:initMoney', source, wallet, bank)
end)

-- save money on leave
AddEventHandler("XTRA:playerLeave",function(user_id,source)
  -- (wallet,bank)
  local tmp = XTRA.getUserTmpTable(user_id)
  if tmp and tmp.wallet ~= nil and tmp.bank ~= nil then
    MySQL.execute("XTRA/set_money", {user_id = user_id, wallet = tmp.wallet, bank = tmp.bank})
  end
end)

-- save money (at same time that save datatables)
AddEventHandler("XTRA:save", function()
  for k,v in pairs(XTRA.user_tmp_tables) do
    if v.wallet ~= nil and v.bank ~= nil then
      MySQL.execute("XTRA/set_money", {user_id = k, wallet = v.wallet, bank = v.bank})
    end
  end
end)

RegisterNetEvent('XTRA:giveCashToPlayer')
AddEventHandler('XTRA:giveCashToPlayer', function(nplayer)
  local source = source
  local user_id = XTRA.getUserId(source)
  if user_id ~= nil then
    if nplayer ~= nil then
      local nuser_id = XTRA.getUserId(nplayer)
      if nuser_id ~= nil then
        XTRA.prompt(source,lang.money.give.prompt(),"",function(source,amount)
          local amount = parseInt(amount)
          if amount > 0 and XTRA.tryPayment(user_id,amount) then
            XTRA.giveMoney(nuser_id,amount)
            XTRAclient.notify(source,{lang.money.given({getMoneyStringFormatted(math.floor(amount))})})
            XTRAclient.notify(nplayer,{lang.money.received({getMoneyStringFormatted(math.floor(amount))})})
            XTRA.sendWebhook('give-cash', "XTRA Give Cash Logs", "> Player Name: **"..XTRA.GetPlayerName(user_id).."**\n> Player PermID: **"..user_id.."**\n> Target Name: **"..XTRA.GetPlayerName(nuser_id).."**\n> Target PermID: **"..nuser_id.."**\n> amount: **£"..getMoneyStringFormatted(amount).."**")
          else
            XTRAclient.notify(source,{lang.money.not_enough()})
          end
        end)
      else
        XTRAclient.notify(source,{lang.common.no_player_near()})
      end
    else
      XTRAclient.notify(source,{lang.common.no_player_near()})
    end
  end
end)


function Comma(amount)
  local formatted = amount
  while true do  
    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
    if (k==0) then
      break
    end
  end
  return formatted
end

RegisterServerEvent("XTRA:takeamount")
AddEventHandler("XTRA:takeamount", function(amount)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.tryFullPayment(user_id,amount) then
      XTRAclient.notify(source,{'~g~Paid £'..getMoneyStringFormatted(amount)..'.'})
      return
    end
end)

local sendingcooldown = {}
RegisterServerEvent("XTRA:bankTransfer")
AddEventHandler("XTRA:bankTransfer", function(id, amount)
    local source = source
    local user_id = XTRA.getUserId(source)
    local id = tonumber(id)
    local amount = tonumber(amount)
    if not sendingcooldown[user_id] then
      if XTRA.getUserSource(id) then
          if XTRA.tryBankPayment(user_id, amount) then
              sendingcooldown[user_id] = true
              XTRAclient.notifyPicture(source, {"monzo", "monzo", "You have transferred ~g~£"..getMoneyStringFormatted(amount).."~w~ to ~g~"..XTRA.GetPlayerName(id).."~w~.", "Monzo", "Sent Money"})
              XTRAclient.notifyPicture(XTRA.getUserSource(id), {"monzo", "monzo", "You have received ~g~£"..getMoneyStringFormatted(amount).."~w~ from ~g~"..XTRA.GetPlayerName(user_id).."~w~.", "Monzo", "Received Money"})
              TriggerClientEvent("XTRA:PlaySound", source, "apple")
              TriggerClientEvent("XTRA:PlaySound", XTRA.getUserSource(id), "apple")
              XTRA.giveBankMoney(id, amount)
              XTRA.sendWebhook('bank-transfer', "XTRA Bank Transfer Logs", "> Player Name: **" .. XTRA.GetPlayerName(user_id) .. "**\n> Player PermID: **" .. user_id .. "**\n> Target Name: **" .. XTRA.GetPlayerName(id) .. "**\n> Target PermID: **" .. id .. "**\n> amount: **£" .. amount .. "**")
              Wait(1000)
              sendingcooldown[user_id] = false
          else
              XTRAclient.notifyPicture(source, {"monzo", "monzo", "You do not have enough money.", "Monzo", "Error"})
          end
      else
        XTRAclient.notifyPicture(source, {"monzo", "monzo", "Player is not online.", "Monzo", "Error"})
      end
    else
      XTRAclient.notifyPicture(source, {"monzo", "monzo", "You are sending money too fast.", "Monzo", "Error"})
    end
end)


RegisterServerEvent('XTRA:requestPlayerBankBalance')
AddEventHandler('XTRA:requestPlayerBankBalance', function()
    local user_id = XTRA.getUserId(source)
    local bank = XTRA.getBankMoney(user_id)
    local wallet = XTRA.getMoney(user_id)
    TriggerClientEvent('XTRA:setDisplayMoney', source, wallet)
    TriggerClientEvent('XTRA:setDisplayBankMoney', source, bank)
    TriggerClientEvent('XTRA:initMoney', source, wallet, bank)
end)

RegisterServerEvent('XTRA:phonebalance')
AddEventHandler('XTRA:phonebalance', function()
    local bankM = XTRA.getBankMoney(user_id)
    TriggerClientEvent('XTRA:initMoney', source, bankM)
end)

RegisterServerEvent("XTRA:addbankphone")
AddEventHandler("XTRA:addbankphone", function(id, amount)
    local source = source
    local user_id = XTRA.getUserId(source)
    local id = tonumber(id)
    local amount = tonumber(amount)
    if XTRA.getUserSource(id) then
      XTRA.giveBankMoney(id, amount)
    end
end)

RegisterServerEvent("XTRA:removebankphone")
AddEventHandler("XTRA:removebankphone", function(id, amount)
    local source = source
    local user_id = XTRA.getUserId(source)
    local id = tonumber(id)
    local amount = tonumber(amount)
    if XTRA.getUserSource(id) then
      XTRA.tryBankPayment(id, amount)
    end
end)