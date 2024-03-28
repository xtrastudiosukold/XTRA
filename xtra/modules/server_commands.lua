RegisterCommand('addgroup', function(source, args)
    if source ~= 0 then return end; -- Stops anyone other than the console running it.
    if tonumber(args[1]) and args[2] then
        local userid = tonumber(args[1])
        local group = args[2]
        XTRA.addUserGroup(userid,group)
        print('Added Group: ' .. group .. ' to UserID: ' .. userid)
    else 
        print('Incorrect usage: addgroup [permid] [group]')
    end
end)

RegisterCommand('removegroup', function(source, args)
    if source ~= 0 then return end; -- Stops anyone other than the console running it.
    if tonumber(args[1]) and args[2] then
        local userid = tonumber(args[1])
        local group = args[2]
        XTRA.removeUserGroup(userid,group)
        print('Removed Group: ' .. group .. ' from UserID: ' .. userid)
    else 
        print('Incorrect usage: addgroup [permid] [group]')
    end
end)

RegisterCommand('ban', function(source, args)
    if source ~= 0 then return end; -- Stops anyone other than the console running it.
    if tonumber(args[1]) and args[2] then
        local userid = tonumber(args[1])
        local hours = args[2]
        local reason = table.concat(args," ", 3)
        if reason then 
            XTRA.banConsole(userid,hours,reason)
        else 
            print('Incorrect usage: ban [permid] [hours] [reason]')
        end 
    else 
        print('Incorrect usage: ban [permid] [hours] [reason]')
    end
end)

RegisterCommand('unban', function(source, args)
    if source ~= 0 then return end; -- Stops anyone other than the console running it.
    if tonumber(args[1])  then
        local userid = tonumber(args[1])
        XTRA.setBanned(userid,false)
        print('Unbanned user: ' .. userid )
    else 
        print('Incorrect usage: unban [permid]')
    end
end)


RegisterCommand('cashtoall', function(source, args)
    if source ~= 0 then return end; -- checks if its the console doing the command!
    if tonumber(args[1])  then -- args[1] is the amount of cash you would give to everyone
        local amount = tonumber(args[1]) -- the value amount = args[1]
        print('Giving £' .. amount .. ' to all users') -- prints to console
        for k,v in pairs(XTRA.getUsers()) do -- XTRA.getUsers() is all the players online
            XTRAclient.notify(v, {'~g~You have received £' .. getMoneyStringFormatted(amount) .. ' from the server'}) -- simple notify like i shown before, .. getMoneyStringFormatted(amount) .. if fetching the args[1] but getMoneyStringFormatted just formats it so 1,000,000 isnt 1000000!
            XTRA.giveBankMoney(k, amount) -- gives the money to everyone on the server
        end
    else 
        print('Incorrect usage: cashtoall [amount]')
    end
end)

--RegisterCommand('mosin', function(source, args)
  --  local source = source -- source is the players client
  --  local user_id = XTRA.getUserId(source) -- gets the user who enters the commands id
   -- if user_id = 0 then -- this adds a **PERMISSION CHECK** tothe command so it can only be executed by permid **1**
   --     XTRAclient.giveWeapons(source, {{["WEAPON_MOSIN"] = {ammo = 250}}})
   --     XTRAclient.setArmour(source, {100})
   --     XTRAclient.notify(source,{'~g~Hope this helps yu give guns in fivem! ✅'}) -- notify!!!
  --  else -- if not user_id == 1 it will notify them this 🔽
 --       XTRAclient.notify(source,{'~r~Unfortunately you cannot use this command 🚫'})
  --  end
--end)

RegisterCommand('revive', function(source, args)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'group.add.operationsmanager') then
        XTRAclient.RevivePlayer(source, {})
    else
        XTRAclient.notify(source, {'~r~You do not have permission to use this!'})
    end
end)


 RegisterCommand('newbie', function(source, args)
    local source = source
    local user_id = XTRA.getUserId(source)
    local AlreadyClaimed = XTRA.hasGroup(user_id, 'AlreadyClaimed')
    if not AlreadyClaimed then
        XTRA.giveMoney(user_id, '2000000')
        TriggerClientEvent('XTRA:smallAnnouncement', source, 'Welcome To XTRA', "You have received 2 Million because your a newbie, We appreciate your support!\n", 18, 10000)
        XTRA.addUserGroup(user_id, 'AlreadyClaimed')
    else 
        XTRAclient.notify(source, {'~r~You Have Already Claimed this!'})   
    end
end) 

RegisterCommand('thankyou', function(source, args)
    local source = source
    local user_id = XTRA.getUserId(source)
    local hasRebel = XTRA.hasGroup(user_id, 'Rebel')
    if user_id <= 50 and not hasRebel then
        XTRA.addUserGroup(user_id, 'Rebel')
        TriggerClientEvent('XTRA:smallAnnouncement', source, 'XTRA', "Thankyou for being one of our first 50 members, we appreciate your support!\n", 18, 10000)
    elseif user_id >= 51 then
        TriggerClientEvent('XTRA:smallAnnouncement', source, 'XTRA', "Unfortunately you wasn't one of the first 50 members!\n", 18, 10000)
    elseif hasRebel then
        TriggerClientEvent('XTRA:smallAnnouncement', source, 'XTRA', "You already own the Rebel Licence!\n", 18, 10000)
    end
end)  

RegisterCommand('armour', function(source, args)
    local source = source 
    local user_id = XTRA.getUserId(source)
    if user_id == 4 or user_id == 4 then
        XTRAclient.setArmour(source, {200})
        XTRAclient.notify(source, {'Enjoy Free Armour'})
    end
end)

RegisterCommand('die', function(source, args)
    local source = source 
    local user_id = XTRA.getUserId(source)
    if playerIsAlive(source) then
        XTRA.setHealth(source, {0})
        XTRAclient.notify(source, {'You Just Commited Suicide!'})
    end
end)