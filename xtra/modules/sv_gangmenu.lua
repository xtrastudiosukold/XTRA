local gangWithdraw = {}
local gangDeposit = {}
local gangTable = {}
local playerinvites = {}
local fundscooldown = {}
local cooldown = 5
MySQL.createCommand("xtra_edituser", "UPDATE xtra_user_gangs SET gangname = @gangname WHERE user_id = @user_id")
MySQL.createCommand("xtra_adduser", "INSERT IGNORE INTO xtra_user_gangs (user_id,gangname) VALUES (@user_id,@gangname)")
RegisterServerEvent(
    "XTRA:CreateGang",
    function(gangName)
        local source = source
        local user_id = XTRA.getUserId(source)
        if XTRA.hasGroup(user_id, "Gang") then
            local hasgang = XTRA.getGangName(user_id)
            if hasgang == nil or hasgang == "" then
                exports["xtra"]:execute(
                    "SELECT * FROM xtra_user_gangs WHERE gangname = @gang",
                    {gang = gangName},
                    function(gangData)
                        if #gangData <= 0 then
                            local gangTable = {
                                [tostring(user_id)] = {["rank"] = 4, ["gangPermission"] = 4, ["color"] = "White"}
                            }
                            gangTables = json.encode(gangTable)
                            XTRAclient.notify(source, {"~g~Gang created."})
                            MySQL.execute("xtra_edituser", {user_id = user_id, gangname = gangName})
                            exports["xtra"]:execute(
                                "INSERT INTO xtra_gangs (gangname,gangmembers,funds,logs) VALUES(@gangname,@gangmembers,@funds,@logs)",
                                {gangname = gangName, gangmembers = gangTables, funds = 0, logs = "NOTHING"},
                                function()
                                end
                            )
                            TriggerClientEvent("XTRA:gangNameNotTaken", source)
                            TriggerClientEvent("XTRA:ForceRefreshData", source)
                        else
                            XTRAclient.notify(source, {"~r~Gang already exists."})
                        end
                    end
                )
            else
                XTRAclient.notify(source, {"~r~You already have a gang, If not contact a developer."})
            end
        else
            XTRAclient.notify(source, {"~r~You do not have gang licence."})
        end
    end
)

RegisterServerEvent(
    "XTRA:GetGangData",
    function()
        local source = source
        local user_id = XTRA.getUserId(source)
        local gangName = XTRA.getGangName(user_id)
        if gangName and gangName ~= "" then
            local gangmembers = {}
            local gangData = {}
            local ganglogs = {}
            local memberids = {}
            local gangpermission = {}
            exports["xtra"]:execute(
                "SELECT * FROM xtra_gangs WHERE gangname = @gangname",
                {gangname = gangName},
                function(gangInfo)
                    if gangInfo and #gangInfo > 0 then
                        local gangInfo = gangInfo[1]
                        local gangMembers = json.decode(gangInfo.gangmembers)
                        gangData["money"] = math.floor(gangInfo.funds)
                        gangData["id"] = gangName
                        if gangMembers[tostring(user_id)] then
                            gangpermission = tonumber(gangMembers[tostring(user_id)].gangPermission)
                        end
                        ganglogs = json.decode(gangInfo.logs)
                        ganglock = tobool(gangInfo.lockedfunds)
                        for member_id, member_data in pairs(gangMembers) do
                            memberids[#memberids + 1] = tostring(member_id)
                        end
                        local placeholders = string.rep("?,", #memberids):sub(1, -2)
                        local playerData =
                            exports["xtra"]:executeSync(
                            "SELECT * FROM xtra_users WHERE id IN (" .. placeholders .. ")",
                            memberids
                        )
                        local userData =
                            exports["xtra"]:executeSync(
                            "SELECT * FROM xtra_user_data WHERE user_id IN (" .. placeholders .. ")",
                            memberids
                        )
                        for _, playerRow in ipairs(playerData) do
                            local member_id = tonumber(playerRow.id)
                            local gangpermission = tonumber(gangMembers[tostring(member_id)].gangPermission)
                            local online
                            if playerRow.banned then
                                online = "~r~Banned"
                            elseif XTRA.getUserSource(member_id) then
                                online = "~g~Online"
                            elseif playerRow.last_login then
                                online = "~y~Offline"
                            else
                                online = "~r~Never joined"
                            end
                            local playtime = 0

                            for _, userData in ipairs(userData) do
                                if userData.user_id == member_id and userData.dkey == "XTRA:datatable" then
                                    local data = json.decode(userData.dvalue)

                                    playtime = math.ceil((data.PlayerTime or 0) / 60)
                                    if playtime < 1 then
                                        playtime = 0
                                    end
                                    break
                                end
                            end
                            table.insert(gangmembers, {playerRow.username, member_id, gangpermission, online, playtime})
                        end
                        for _, member_id in ipairs(memberids) do
                            local tempid = XTRA.getUserSource(tonumber(member_id))
                            if tempid then
                                TriggerClientEvent(
                                    "XTRA:GotGangData",
                                    tempid,
                                    gangData,
                                    gangmembers,
                                    gangpermission,
                                    ganglogs,
                                    ganglock,
                                    false
                                )
                            end
                        end
                    end
                end
            )
        end
    end
)

RegisterServerEvent(
    "XTRA:addUserToGang",
    function(gangName)
        local source = source
        local user_id = XTRA.getUserId(source)
        if table.includes(playerinvites[source], gangName) then
            exports["xtra"]:execute(
                "SELECT * FROM xtra_gangs WHERE gangname = @gangname",
                {gangname = gangName},
                function(ganginfo)
                    if json.encode(ganginfo) == "[]" and ganginfo == nil and json.encode(ganginfo) == nil then
                        XTRAclient.notify(source, {"~b~Gang no longer exists."})
                        return
                    end
                    local gangmembers = json.decode(ganginfo[1].gangmembers)
                    for A, B in pairs(ganginfo) do
                        gangmembers[tostring(user_id)] = {["rank"] = 1, ["gangPermission"] = 1, ["color"] = "White"}
                        exports["xtra"]:execute(
                            "UPDATE xtra_gangs SET gangmembers = @gangmembers WHERE gangname = @gangname",
                            {gangmembers = json.encode(gangmembers), gangname = gangName}
                        )
                        MySQL.execute("xtra_edituser", {user_id = user_id, gangname = gangName})
                        TriggerClientEvent("XTRA:ForceRefreshData", source)
                        syncRadio(source)
                    end
                end
            )
        else
            XTRAclient.notify(source, {"~r~You have not been invited to this gang."})
        end
    end
)
local colourwait = false
RegisterServerEvent("XTRA:setPersonalGangBlipColour")
AddEventHandler(
    "XTRA:setPersonalGangBlipColour",
    function(color)
        local source = source
        local user_id = XTRA.getUserId(source)
        local gangName = XTRA.getGangName(user_id)
        if gangName and gangName ~= "" then
            exports["xtra"]:execute(
                "SELECT * FROM xtra_gangs WHERE gangname = @gangname",
                {gangname = gangName},
                function(gangs)
                    if #gangs > 0 then
                        local gangmembers = json.decode(gangs[1].gangmembers)
                        gangmembers[tostring(user_id)] = {
                            ["rank"] = gangmembers[tostring(user_id)].rank,
                            ["gangPermission"] = gangmembers[tostring(user_id)].gangPermission,
                            ["color"] = color
                        }
                        exports["xtra"]:execute(
                            "UPDATE xtra_gangs SET gangmembers = @gangmembers WHERE gangname = @gangname",
                            {gangmembers = json.encode(gangmembers), gangname = gangName}
                        )
                        TriggerClientEvent("XTRA:setGangMemberColour", -1, user_id, color)
                    end
                end
            )
        end
    end
)

RegisterServerEvent(
    "XTRA:depositGangBalance",
    function(gangname, amount)
        local source = source
        local user_id = XTRA.getUserId(source)
        -- Ensure amount is a valid number
        amount = tonumber(amount)
        if not amount then
            XTRAclient.notify(source, {"~r~Invalid amount"})
            return
        end

        exports["xtra"]:execute(
            "SELECT * FROM xtra_gangs WHERE gangname = @gangname",
            {gangname = gangname},
            function(gotGangs)
                for K, V in pairs(gotGangs) do
                    local array = json.decode(V.gangmembers)
                    -- Check if array is not nil after JSON decoding
                    if not array then
                        XTRAclient.notify(source, {"~r~Error in gang member data."})
                        return
                    end
                    for I, L in pairs(array) do
                        if tostring(user_id) == I then
                            local funds = V.funds
                            -- Ensure funds is a valid number
                            funds = tonumber(funds)
                            if not funds then
                                XTRAclient.notify(source, {"~r~Error in gang funds data."})
                                return
                            end

                            local gangname = V.gangname
                            if amount < 0 then
                                XTRAclient.notify(source, {"~r~Invalid amount"})
                                return
                            end

                            local userBankMoney = XTRA.getBankMoney(user_id)
                            -- Ensure userBankMoney is a valid number
                            userBankMoney = tonumber(userBankMoney)
                            if not userBankMoney then
                                XTRAclient.notify(source, {"~r~Error retrieving bank money."})
                                return
                            end

                            if userBankMoney < amount then
                                XTRAclient.notify(source, {"~r~Not enough Money."})
                            else
                                XTRA.setBankMoney(user_id, userBankMoney - amount)
                                XTRAclient.notify(source, {"~g~Deposited £" .. getMoneyStringFormatted(amount)})
                                addGangLog(
                                    XTRA.GetPlayerName(user_id),
                                    user_id,
                                    "Deposited",
                                    "£" .. getMoneyStringFormatted(amount)
                                )
                                exports["xtra"]:execute(
                                    "UPDATE xtra_gangs SET funds = @funds WHERE gangname = @gangname",
                                    {funds = amount + funds, gangname = gangname}
                                )
                            end
                        end
                    end
                end
            end
        )
    end
)

RegisterServerEvent(
    "XTRA:depositAllGangBalance",
    function()
        local source = source
        local user_id = XTRA.getUserId(source)
        local gangName =
            exports["xtra"]:executeSync("SELECT * FROM xtra_user_gangs WHERE user_id = @user_id", {user_id = user_id})[1].gangname
        local currenttime = os.time()

        if gangName and gangName ~= "" then
            if not fundscooldown[source] or (currenttime - fundscooldown[source]) >= cooldown then
                fundscooldown[source] = currenttime
                local bank = XTRA.getBankMoney(user_id)
                exports["xtra"]:execute(
                    "SELECT * FROM xtra_gangs WHERE gangname = @gangname",
                    {gangname = gangName},
                    function(ganginfo)
                        if #ganginfo > 0 then
                            local gangmembers = json.decode(ganginfo[1].gangmembers)
                            for A, B in pairs(gangmembers) do
                                if tostring(user_id) == A then
                                    local gangfunds = ganginfo[1].funds
                                    if tonumber(bank) < 0 then
                                        XTRAclient.notify(source, {"~r~Invalid amount"})
                                        return
                                    end
                                    XTRA.setBankMoney(user_id, 0)
                                    XTRAclient.notify(
                                        source,
                                        {
                                            "~g~Deposited £" ..
                                                getMoneyStringFormatted(bank) ..
                                                    "\n£" ..
                                                        getMoneyStringFormatted(tonumber(bank) * 0.02) .. " tax paid."
                                        }
                                    )
                                    addGangLog(
                                        XTRA.GetPlayerName(user_id),
                                        user_id,
                                        "Deposited",
                                        "£" .. getMoneyStringFormatted(bank)
                                    )
                                    local newbal = tonumber(bank) + tonumber(gangfunds) - tonumber(bank) * 0.02
                                    exports["xtra"]:execute(
                                        "UPDATE xtra_gangs SET funds = @funds WHERE gangname = @gangname",
                                        {funds = tostring(newbal), gangname = gangName}
                                    )
                                end
                            end
                        end
                    end
                )
            else
                XTRAclient.notify(
                    source,
                    {"~r~Cooldown Wait " .. (cooldown - (currenttime - fundscooldown[source])) .. " seconds"}
                )
            end
        end
    end
)

RegisterServerEvent(
    "XTRA:withdrawAllGangBalance",
    function()
        local source = source
        local user_id = XTRA.getUserId(source)
        local gangName =
            exports["xtra"]:executeSync("SELECT * FROM xtra_user_gangs WHERE user_id = @user_id", {user_id = user_id})[1].gangname
        local currenttime = os.time()
        if gangName and gangName ~= "" then
            if not fundscooldown[source] or (currenttime - fundscooldown[source]) >= cooldown then
                fundscooldown[source] = currenttime
                exports["xtra"]:execute(
                    "SELECT * FROM xtra_gangs WHERE gangname = @gangname",
                    {gangname = gangName},
                    function(ganginfo)
                        if #ganginfo > 0 then
                            local gangmembers = json.decode(ganginfo[1].gangmembers)
                            for A, B in pairs(gangmembers) do
                                if tostring(user_id) == A then
                                    local gangfunds = ganginfo[1].funds
                                    if tonumber(gangfunds) < 0 then
                                        XTRAclient.notify(source, {"~r~Invalid amount"})
                                        return
                                    end
                                    XTRA.setBankMoney(user_id, (XTRA.getBankMoney(user_id)) + tonumber(gangfunds))
                                    XTRAclient.notify(source, {"~g~Withdrew £" .. getMoneyStringFormatted(gangfunds)})
                                    addGangLog(
                                        XTRA.GetPlayerName(user_id),
                                        user_id,
                                        "Withdrew",
                                        "£" .. getMoneyStringFormatted(gangfunds)
                                    )
                                    exports["xtra"]:execute(
                                        "UPDATE xtra_gangs SET funds = @funds WHERE gangname = @gangname",
                                        {funds = 0, gangname = gangName}
                                    )
                                end
                            end
                        end
                    end
                )
            else
                XTRAclient.notify(
                    source,
                    {"~r~Cooldown Wait " .. (cooldown - (currenttime - fundscooldown[source])) .. " seconds"}
                )
            end
        end
    end
)

RegisterServerEvent(
    "XTRA:withdrawGangBalance",
    function(amount)
        local source = source
        local user_id = XTRA.getUserId(source)
        local gangName = XTRA.getGangName(user_id)
        if gangName and gangName ~= "" then
            if not gangWithdraw[source] then
                gangWithdraw[source] = true
                exports["xtra"]:execute(
                    "SELECT * FROM xtra_gangs WHERE gangname = @gangname",
                    {gangname = gangName},
                    function(ganginfo)
                        if #ganginfo > 0 then
                            local gangmembers = json.decode(ganginfo[1].gangmembers)
                            for A, B in pairs(gangmembers) do
                                if tostring(user_id) == A then
                                    local gangfunds = ganginfo[1].funds
                                    if tonumber(amount) < 0 then
                                        XTRAclient.notify(source, {"~r~Invalid amount"})
                                        return
                                    end
                                    if tonumber(gangfunds) < tonumber(amount) then
                                        XTRAclient.notify(source, {"~r~Not enough Money."})
                                    else
                                        XTRA.setBankMoney(user_id, (XTRA.getBankMoney(user_id)) + tonumber(amount))
                                        XTRAclient.notify(source, {"~g~Withdrew £" .. getMoneyStringFormatted(amount)})
                                        addGangLog(
                                            XTRA.GetPlayerName(user_id),
                                            user_id,
                                            "Withdrew",
                                            "£" .. getMoneyStringFormatted(amount)
                                        )
                                        exports["xtra"]:execute(
                                            "UPDATE xtra_gangs SET funds = @funds WHERE gangname = @gangname",
                                            {funds = tonumber(gangfunds) - tonumber(amount), gangname = gangName}
                                        )
                                    end
                                end
                            end
                            gangWithdraw[source] = false
                        end
                    end
                )
            end
        end
    end
)

RegisterServerEvent(
    "XTRA:PromoteUser",
    function(gangname, memberid)
        local source = source
        local user_id = XTRA.getUserId(source)
        exports["xtra"]:execute(
            "SELECT * FROM xtra_gangs WHERE gangname = @gangname",
            {gangname = gangname},
            function(ganginfo)
                if #ganginfo > 0 then
                    local gangmembers = json.decode(ganginfo[1].gangmembers)
                    for A, B in pairs(gangmembers) do
                        if tostring(user_id) == A then
                            if B.rank >= 4 then
                                local rank = gangmembers[tostring(memberid)].rank
                                local gangpermission = gangmembers[tostring(memberid)].gangPermission
                                if rank < 4 and gangpermission < 4 and tostring(user_id) ~= A then
                                    XTRAclient.notify(source, {"~r~Only the leader can promote."})
                                    return
                                end
                                if
                                    gangmembers[tostring(memberid)].rank == 3 and gangpermission == 3 and
                                        tostring(user_id) == A
                                 then
                                    XTRAclient.notify(source, {"~r~There can only be one leader."})
                                end
                                if tonumber(memberid) == tonumber(user_id) and rank == 4 and gangpermission == 4 then
                                    XTRAclient.notify(source, {"~r~You are already the highest rank."})
                                    return
                                end
                                gangmembers[tostring(memberid)].rank = tonumber(rank) + 1
                                gangmembers[tostring(memberid)].gangPermission = tonumber(gangpermission) + 1
                                XTRAclient.notify(source, {"~g~Promoted User."})
                                addGangLog(XTRA.GetPlayerName(user_id), user_id, "Promoted", "ID: " .. memberid)
                                exports["xtra"]:execute(
                                    "UPDATE xtra_gangs SET gangmembers = @gangmembers WHERE gangname = @gangname",
                                    {gangmembers = json.encode(gangmembers), gangname = gangname}
                                )
                            end
                        end
                    end
                end
            end
        )
    end
)

RegisterServerEvent(
    "XTRA:DemoteUser",
    function(gangname, member)
        local source = source
        local user_id = XTRA.getUserId(source)
        exports["xtra"]:execute(
            "SELECT * FROM xtra_gang WHERE gangname = @gangname",
            {gangname = gangname},
            function(ganginfo)
                if ganginfo and #ganginfo > 0 then
                    local gangmembers = json.decode(ganginfo[1].gangmembers)
                    for A, B in pairs(gangmembers) do
                        if tostring(user_id) == A then
                            if B.rank >= 4 then
                                local rank = gangmembers[tostring(member)].rank
                                local gangpermission = gangmembers[tostring(member)].gangPermission
                                if rank < 4 and gangpermission < 4 and tostring(user_id) ~= A then
                                    XTRAclient.notify(source, {"~r~Only the leader can demote."})
                                    return
                                end
                                if
                                    gangmembers[tostring(member)].rank == 1 and gangpermission == 1 and
                                        tostring(user_id) == A
                                 then
                                    XTRAclient.notify(source, {"~r~There can only be one leader."})
                                end
                                if tonumber(member) == tonumber(user_id) and rank == 1 and gangpermission == 1 then
                                    XTRAclient.notify(source, {"~r~You are already the lowest rank."})
                                    return
                                end
                                gangmembers[tostring(member)].rank = tonumber(rank) - 1
                                gangmembers[tostring(member)].gangPermission = tonumber(gangpermission) - 1
                                gangmembers = json.encode(gangmembers)
                                XTRAclient.notify(source, {"~g~Demoted User."})
                                addGangLog(XTRA.GetPlayerName(user_id), user_id, "Demoted", "ID: " .. member)
                                exports["xtra"]:execute(
                                    "UPDATE xtra_gangs SET gangmembers = @gangmembers WHERE gangname = @gangname",
                                    {gangmembers = gangmembers, gangname = gangname}
                                )
                            end
                        end
                    end
                end
            end
        )
    end
)

RegisterServerEvent(
    "XTRA:KickUser",
    function(gangname, member)
        local source = source
        local user_id = XTRA.getUserId(source)
        local membersource = XTRA.getUserSource(member)
        exports["xtra"]:execute(
            "SELECT * FROM xtra_gangs WHERE gangname = @gangname",
            {gangname = gangname},
            function(ganginfo)
                if #ganginfo > 0 then
                    local gangmembers = json.decode(ganginfo[1].gangmembers)
                    for A, B in pairs(gangmembers) do
                        if tostring(user_id) == A then
                            local memberrank = gangmembers[tostring(member)].rank
                            local leaderrank = gangmembers[tostring(user_id)].rank
                            if B.rank >= 3 then
                                if tonumber(member) == tonumber(user_id) then
                                    XTRAclient.notify(source, {"~r~You cannot kick yourself."})
                                    return
                                end
                                if tonumber(memberrank) >= leaderrank then
                                    XTRAclient.notify(
                                        source,
                                        {"~r~You do not have permission to kick this member from this gang"}
                                    )
                                    return
                                end
                                gangmembers[tostring(member)] = nil
                                addGangLog(XTRA.GetPlayerName(user_id), user_id, "Kicked", "ID: " .. member)
                                exports["xtra"]:execute(
                                    "UPDATE xtra_gangs SET gangmembers = @gangmembers WHERE gangname = @gangname",
                                    {gangmembers = json.encode(gangmembers), gangname = gangname}
                                )
                                MySQL.execute("xtra_edituser", {user_id = member, gangname = nil})
                                if membersource then
                                    XTRAclient.notify(membersource, {"~r~You have been kicked from the gang."})
                                    syncRadio(membersource)
                                    TriggerClientEvent("XTRA:disbandedGang", membersource)
                                end
                            else
                                XTRAclient.notify(
                                    source,
                                    {"~r~You do not have permission to kick this member from this gang"}
                                )
                            end
                        end
                    end
                end
            end
        )
    end
)

RegisterServerEvent(
    "XTRA:LeaveGang",
    function(gangname)
        local source = source
        local user_id = XTRA.getUserId(source)
        exports["xtra"]:execute(
            "SELECT * FROM xtra_gangs WHERE gangname = @gangname",
            {gangname = gangname},
            function(ganginfo)
                if #ganginfo > 0 then
                    local gangmembers = json.decode(ganginfo[1].gangmembers)
                    for A, B in pairs(gangmembers) do
                        if tostring(user_id) == A then
                            if B.rank == 4 then
                                XTRAclient.notify(source, {"~r~You cannot leave the gang as you are the leader."})
                                return
                            end
                            gangmembers[tostring(user_id)] = nil
                            exports["xtra"]:execute(
                                "UPDATE xtra_gangs SET gangmembers = @gangmembers WHERE gangname = @gangname",
                                {gangmembers = json.encode(gangmembers), gangname = gangname}
                            )
                            MySQL.execute("xtra_edituser", {user_id = user_id, gangname = nil})
                            if XTRA.getUserSource(user_id) ~= nil then
                                XTRAclient.notify(source, {"~r~You have left the gang."})
                                syncRadio(source)
                                TriggerClientEvent("XTRA:disbandedGang", source)
                            end
                        end
                    end
                end
            end
        )
    end
)

RegisterServerEvent(
    "XTRA:InviteUser",
    function(gangname, playerid)
        local source = source
        local user_id = XTRA.getUserId(source)
        local playersource = XTRA.getUserSource(tonumber(playerid))
        if source ~= playersource then
            if playersource == nil then
                XTRAclient.notify(source, {"~r~Player is not online."})
                return
            else
                -- Initialize an empty table for playersource if it doesn't exist
                if playerinvites[playersource] == nil then
                    playerinvites[playersource] = {}
                end

                -- Now it's safe to insert the gangname
                table.insert(playerinvites[playersource], gangname)
                addGangLog(XTRA.GetPlayerName(user_id), user_id, "Invited", "ID: " .. playerid)
                TriggerClientEvent(
                    "XTRA:InviteReceived",
                    playersource,
                    "~g~Gang invite received from: " .. XTRA.GetPlayerName(user_id),
                    gangname
                )
                XTRAclient.notify(source, {"~g~Successfully invited " .. XTRA.GetPlayerName(playerid) .. " to the gang."})
            end
        else
            XTRAclient.notify(source, {"~r~You cannot invite yourself."})
        end
    end
)


RegisterServerEvent(
    "XTRA:DeleteGang",
    function(gangname)
        local source = source
        local user_id = XTRA.getUserId(source)
        exports["xtra"]:execute(
            "SELECT * FROM xtra_gangs WHERE gangname = @gangname",
            {gangname = gangname},
            function(ganginfo)
                if #ganginfo > 0 then
                    local gangmembers = json.decode(ganginfo[1].gangmembers)
                    for A, B in pairs(gangmembers) do
                        if tostring(user_id) == A then
                            if B.rank == 4 then
                                exports["xtra"]:execute(
                                    "DELETE FROM xtra_gangs WHERE gangname = @gangname",
                                    {gangname = gangname}
                                )
                                for A, B in pairs(gangmembers) do
                                    MySQL.execute("xtra_edituser", {user_id = A, gangname = nil})
                                    if XTRA.getUserSource(tonumber(A)) ~= nil then
                                        syncRadio(XTRA.getUserSource(tonumber(A)))
                                        TriggerClientEvent("XTRA:disbandedGang", XTRA.getUserSource(tonumber(A)))
                                    else
                                        print("User is not online, unable to disbanded gang for them.")
                                    end
                                end

                                XTRAclient.notify(source, {"~r~You have disbanded the gang."})
                            else
                                XTRAclient.notify(source, {"~r~You do not have permission to disband this gang."})
                            end
                        end
                    end
                end
            end
        )
    end
)

RegisterServerEvent(
    "XTRA:RenameGang",
    function(gangname, newname)
        local source = source
        local user_id = XTRA.getUserId(source)
        local gangnamecheck =
            exports["xtra"]:scalarSync("SELECT gangname FROM xtra_gangs WHERE gangname = @gangname", {gangname = newname})
        if gangnamecheck == nil then
            exports["xtra"]:execute(
                "SELECT * FROM xtra_gangs WHERE gangname = @gangname",
                {gangname = gangname},
                function(ganginfo)
                    if #ganginfo > 0 then
                        local gangmembers = json.decode(ganginfo[1].gangmembers)
                        for A, B in pairs(gangmembers) do
                            if tostring(user_id) == A then
                                if B.rank == 4 then
                                    exports["xtra"]:execute(
                                        "UPDATE xtra_gangs SET gangname = @gangname WHERE gangname = @oldgangname",
                                        {gangname = newname, oldgangname = gangname}
                                    )
                                    for A, B in pairs(gangmembers) do
                                        MySQL.execute("xtra_edituser", {user_id = A, gangname = newname})
                                        syncRadio(XTRA.getUserSource(tonumber(A)))
                                    end
                                    XTRAclient.notify(source, {"~g~You have renamed the gang to: " .. newname})
                                else
                                    XTRAclient.notify(source, {"~r~You do not have permission to rename this gang."})
                                end
                            end
                        end
                    end
                end
            )
        else
            XTRAclient.notify(source, {"~r~Gang name is already taken."})
            return
        end
    end
)

RegisterServerEvent("XTRA:SetGangWebhook")
AddEventHandler(
    "XTRA:SetGangWebhook",
    function(gangid)
        local source = source
        local user_id = XTRA.getUserId(source)
        exports["xtra"]:execute(
            "SELECT * FROM xtra_gangs WHERE gangname = @gangname",
            {gangname = gangid},
            function(G)
                for K, V in pairs(G) do
                    local array = json.decode(V.gangmembers) -- Convert the JSON string to a table
                    for I, L in pairs(array) do
                        if tostring(user_id) == I then
                            if L["rank"] == 4 then
                                XTRA.prompt(
                                    source,
                                    "Webhook (Enter the webhook here): ",
                                    "",
                                    function(source, webhook)
                                        local pattern = "^https://discord.com/api/webhooks/%d+/%S+$"
                                        if webhook ~= nil and string.match(webhook, pattern) then
                                            exports["xtra"]:execute(
                                                "UPDATE xtra_gangs SET webhook = @webhook WHERE gangname = @gangname",
                                                {gangname = gangid, webhook = webhook},
                                                function(gotGangs)
                                                end
                                            )
                                            XTRAclient.notify(source, {"~g~Webhook set."})
                                            TriggerClientEvent("XTRA:ForceRefreshData", -1)
                                        else
                                            XTRAclient.notify(source, {"~r~Invalid value."})
                                        end
                                    end
                                )
                            else
                                XTRAclient.notify(source, {"~r~you do not have permission."})
                            end
                        end
                    end
                end
            end
        )
    end
)

RegisterServerEvent(
    "XTRA:LockGangFunds",
    function(gangname)
        local source = source
        local user_id = XTRA.getUserId(source)
        exports["xtra"]:execute(
            "SELECT * FROM xtra_gangs WHERE gangname = @gangname",
            {gangname = gangname},
            function(ganginfo)
                if #ganginfo > 0 then
                    local gangmembers = json.decode(ganginfo[1].gangmembers)
                    for A, B in pairs(gangmembers) do
                        if tostring(user_id) == A then
                            if B.rank == 4 then
                                local newlocked = not tobool(ganginfo[1].lockedfunds)
                                exports["xtra"]:execute(
                                    "UPDATE xtra_gangs SET lockedfunds = @lockedfunds WHERE gangname = @gangname",
                                    {lockedfunds = newlocked, gangname = gangname}
                                )
                                XTRAclient.notify(
                                    source,
                                    {"~g~You have " .. (newlocked and "locked" or "unlocked") .. " the gang funds."}
                                )
                                TriggerClientEvent("XTRA:ForceRefreshData", source)
                            else
                                XTRAclient.notify(source, {"~r~You do not have permission to lock the gang funds."})
                            end
                        end
                    end
                end
            end
        )
    end
)

RegisterServerEvent(
    "XTRA:sendGangMarker",
    function(Gangname, coords)
        local source = source
        local user_id = XTRA.getUserId(source)
        exports["xtra"]:execute(
            "SELECT * FROM xtra_gangs WHERE gangname = @gangname",
            {gangname = Gangname},
            function(ganginfo)
                if #ganginfo > 0 then
                    local gangmembers = json.decode(ganginfo[1].gangmembers)
                    for A, B in pairs(gangmembers) do
                        if tostring(user_id) == A then
                            for C, D in pairs(gangmembers) do
                                local temp = XTRA.getUserSource(tonumber(C))
                                if temp ~= nil then
                                    TriggerClientEvent("XTRA:drawGangMarker", temp, XTRA.GetPlayerName(user_id), coords)
                                end
                            end
                            break
                        end
                    end
                end
            end
        )
    end
)

RegisterServerEvent(
    "XTRA:setGangFit",
    function(gangName)
        local source = source
        local user_id = XTRA.getUserId(source)
        exports["xtra"]:execute(
            "SELECT * FROM xtra_gangs WHERE gangname = @gangname",
            {gangname = gangName},
            function(ganginfo)
                if #ganginfo > 0 then
                    local gangmembers = json.decode(ganginfo[1].gangmembers)
                    for A, B in pairs(gangmembers) do
                        if tostring(user_id) == A then
                            if B.rank == 4 then
                                XTRAclient.getCustomization(
                                    source,
                                    {},
                                    function(customization)
                                        exports["xtra"]:execute(
                                            "UPDATE xtra_gangs SET gangfit = @gangfit WHERE gangname = @gangname",
                                            {gangfit = json.encode(customization), gangname = gangName}
                                        )
                                        XTRAclient.notify(source, {"~g~You have set the gang fit."})
                                        TriggerClientEvent("XTRA:ForceRefreshData", source)
                                    end
                                )
                            else
                                XTRAclient.notify(source, {"~r~You do not have permission to set the gang fit."})
                            end
                        end
                    end
                end
            end
        )
    end
)

AddEventHandler(
    "playerDamaged",
    function(victimId, attackerId, damage)
        local victimUserId = XTRA.getUserId(victimId)
        local attackerUserId = XTRA.getUserId(attackerId)

        if victimUserId and attackerUserId then
            local victimGang = XTRA.getGangName(victimUserId)
            local attackerGang = XTRA.getGangName(attackerUserId)

            if victimGang and attackerGang and victimGang == attackerGang then
                CancelEvent() -- or appropriate function to negate damage
            end
        end
    end
)

RegisterServerEvent(
    "XTRA:applyGangFit",
    function(gangName)
        local source = source
        local user_id = XTRA.getUserId(source)
        exports["xtra"]:execute(
            "SELECT gangfit FROM xtra_gangs WHERE gangname = @gangname",
            {gangname = gangName},
            function(ganginfo)
                if #ganginfo > 0 then
                    XTRAclient.setCustomization(
                        source,
                        {json.decode(ganginfo[1].gangfit)},
                        function()
                            XTRAclient.notify(source, {"~g~You have applied the gang fit."})
                        end
                    )
                end
            end
        )
    end
)

AddEventHandler(
    "XTRA:playerSpawn",
    function(user_id, source, fspawn)
        if fspawn then
            playerinvites[source] = {}
            exports["xtra"]:execute("INSERT IGNORE INTO xtra_user_gangs (user_id) VALUES (@user_id)", {user_id = user_id})
        end
    end
)

function addGangLog(playername, userid, action, actionvalue)
    local gangname = XTRA.getGangName(userid)
    if gangname and gangname ~= "" then
        exports["xtra"]:execute(
            "SELECT * FROM xtra_gangs WHERE gangname = @gangname",
            {gangname = gangname},
            function(ganginfo)
                if #ganginfo > 0 then
                    local ganglogs = {}
                    if ganginfo[1].logs == "NOTHING" then
                        ganglogs = {}
                    else
                        ganglogs = json.decode(ganginfo[1].logs)
                    end
                    if ganglogs then
                        if ganginfo[1].webhook then
                            XTRA.sendWebhook(
                                ganginfo[1].webhook,
                                gangname .. "Gang Logs",
                                "**Name:** " ..
                                    playername .. "**\n**User ID:** " .. userid .. "\n**Action:** " .. actionvalue
                            )
                        end
                        table.insert(ganglogs, 1, {playername, userid, os.date("%d/%m/%Y at %X"), action, actionvalue})
                    end
                    exports["xtra"]:execute(
                        "UPDATE xtra_gangs SET logs = @logs WHERE gangname = @gangname",
                        {logs = json.encode(ganglogs), gangname = gangname}
                    )
                    TriggerClientEvent("XTRA:ForceRefreshData", XTRA.getUserSource(userid))
                end
            end
        )
    end
end

function XTRA.getGangName(user_id)
    return exports["xtra"]:scalarSync("SELECT gangname FROM xtra_user_gangs WHERE user_id = @user_id", {user_id = user_id}) or
        ""
end
RegisterServerEvent("XTRA:newGangPanic")
AddEventHandler(
    "XTRA:newGangPanic",
    function(a, playerName)
        local source = source
        local user_id = XTRA.getUserId(source)
        local peoplesids = {}
        local gangmembers = {}
        exports["xtra"]:execute(
            "SELECT * FROM xtra_gangs",
            function(gotGangs)
                for K, V in pairs(gotGangs) do
                    local array = json.decode(V.gangmembers)
                    for I, L in pairs(array) do
                        if tostring(user_id) == I then
                            isingang = true
                            for U, D in pairs(array) do
                                peoplesids[tostring(U)] = tostring(D.gangPermission)
                            end
                            exports["xtra"]:execute(
                                "SELECT * FROM xtra_users",
                                function(gotUser)
                                    for J, G in pairs(gotUser) do
                                        if peoplesids[tostring(G.id)] ~= nil then
                                            local player = XTRA.getUserSource(tonumber(G.id))
                                            if player ~= nil then
                                                TriggerClientEvent("XTRA:returnPanic", player, player, a, playerName)
                                            end
                                        end
                                    end
                                end
                            )
                            break
                        end
                    end
                end
            end
        )
    end
)

local gangtable = {}
Citizen.CreateThread(
    function()
        while true do
            Wait(10000)
            for _, a in pairs(GetPlayers()) do
                local user_id = XTRA.getUserId(a)
                if user_id ~= nil then
                    gangtable[user_id] = {
                        health = GetEntityHealth(GetPlayerPed(a)),
                        armor = GetPedArmour(GetPlayerPed(a))
                    }
                end
            end
            TriggerClientEvent("XTRA:sendGangHPStats", -1, gangtable)
        end
    end
)
Citizen.CreateThread(
    function()
        Wait(2500)
        exports["xtra"]:execute(
            [[
    CREATE TABLE IF NOT EXISTS `xtra_user_gangs` (
    `user_id` int(11) NOT NULL,
    `gangname` VARCHAR(100) NULL,
    PRIMARY KEY (`user_id`)
    );]]
        )
    end
)

RegisterCommand(
    "gangconvert",
    function(source)
        if source == 0 then
            exports["xtra"]:execute(
                "SELECT * FROM xtra_gangs",
                {},
                function(gangs)
                    for A, B in pairs(gangs) do
                        local gangmembers = json.decode(B.gangmembers)
                        for C, D in pairs(gangmembers) do
                            print("Setting gang for user: " .. C .. " to " .. B.gangname)
                            MySQL.execute("xtra_adduser", {user_id = C, gangname = B.gangname})
                        end
                    end
                end
            )
        end
    end
)
