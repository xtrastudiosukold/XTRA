MySQL = module("modules/MySQL")

Proxy = module("lib/Proxy")
Tunnel = module("lib/Tunnel")
Lang = module("lib/Lang")
Debug = module("lib/Debug")

local config = module("cfg/base")
local version = module("version")
local WhiteListed = false
local verify_card = {
    ["type"] = "AdaptiveCard",
    ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
    ["version"] = "1.3",
    ["backgroundImage"] = {
        ["url"] = "https://cdn.discordapp.com/attachments/1195851571150467097/1210381117983694908/yup.png?ex=660609c2&is=65f394c2&hm=54b2baacf47d017d0046bc0c37612bda6bde0231b174b29b94fe9f50d5a14124&",
    },
    ["body"] = {
        {
            ["type"] = "TextBlock",
            ["text"] = "",
            ["horizontalAlignment"] = "Center",
            ["size"] = "Large",
            ["wrap"] = true,
            ["weight"] = "Bolder"
        },
        {
            ["type"] = "Container",
            ["horizontalAlignment"] = "Center",
            ["size"] = "Large",
            ["items"] = {
                {
                    ["type"] = "TextBlock",
                    ["text"] = "In order to connect to XTRA you must be in our discord and verify your account",
                    ["horizontalAlignment"] = "Center",
                    ["size"] = "Large",
                    ["wrap"] = false,
                },
                {
                    ["type"] = "TextBlock",
                    ["text"] = "Join the XTRA discord (discord.gg/xtra)",
                    ["horizontalAlignment"] = "Center",
                    ["size"] = "Large",
                    ["wrap"] = false,
                },
                {
                    ["type"] = "TextBlock",
                    ["text"] = "In the #verify channel, type the following command",
                    ["horizontalAlignment"] = "Center",
                    ["size"] = "Large",
                    ["wrap"] = false,
                },
                {
                    ["type"] = "TextBlock",
                    ["color"] = "Attention",
                    ["horizontalAlignment"] = "Center",
                    ["size"] = "Large",
                    ["text"] = "!verify NULL",
                    ["wrap"] = false,
                },
                {
                    ["type"] = "TextBlock",
                    ["color"] = "Attention",
                    ["horizontalAlignment"] = "Center",
                    ["size"] = "Large",
                    ["text"] = "Your account has not beem verified yet. (Attempt 0)",
                    ["wrap"] = false,
                }
            }
        },
        {
            ['type'] = 'ActionSet',
            ["horizontalAlignment"] = "Center",
            ["size"] = "Large",
            ['actions'] = {
                {
                    ['type'] = 'Action.Submit',
                    ['title'] = 'Enter XTRA',
                    ["horizontalAlignment"] = "Center",
                    ["size"] = "Large",
                    ['id'] = 'connectButton', -- Add an ID to the button action
                    ['data'] = {
                        ['action'] = 'connectClicked',
                    },
                },             
            },
        },
    }
}
local ban_card = {
    ["type"] = "AdaptiveCard",
    ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
    ["version"] = "1.3",
    ["backgroundImage"] = {
        ["url"] = "https://cdn.discordapp.com/attachments/1195851571150467097/1210381117983694908/yup.png?ex=660609c2&is=65f394c2&hm=54b2baacf47d017d0046bc0c37612bda6bde0231b174b29b94fe9f50d5a14124&",
    },
    ["body"] = {
        {
            ["type"] = "TextBlock",
            ["text"] = "XTRA Public",
            ["highlight"] = true,
            ["horizontalAlignment"] = "Center",
            ["size"] = "Medium",
            ["wrap"] = true,
            ["weight"] = "Bolder",
        },
        {
            ["type"] = "Container",
            ["horizontalAlignment"] = "Center",
            ["items"] = {
                {
                    ["type"] = "TextBlock",
                    ["text"] = "Ban expires in NULL",
                    ["horizontalAlignment"] = "Center",
                    ["size"] = "Large",
                    ["wrap"] = false,

                },
                {
                    ["type"] = "TextBlock",
                    ["text"] = "Your ID: NULL",
                    ["horizontalAlignment"] = "Center",
                    ["size"] = "Large",
                    ["wrap"] = false,
                },
                {
                    ["type"] = "TextBlock",
                    ["horizontalAlignment"] = "Center",
                    ["size"] = "Large",
                    ["text"] = "Reason: NULL",
                    ["wrap"] = false,
                },
                {
                    ["type"] = "TextBlock",
                    ["color"] = "Attention",
                    ["horizontalAlignment"] = "Center",
                    ["size"] = "Medium",
                    ["color"] = "Warning",
                    ["text"] = "If you believe this ban is invalid, please appeal on our discord",
                    ["wrap"] = false,
                    ["isSubtle"] = true,
                },
            }
        },
        {
            ['type'] = 'ActionSet',
            ["horizontalAlignment"] = "Center",
            ["size"] = "Large",
            ['actions'] = {
                {
                    ['type'] = 'Action.OpenUrl',
                    ['title'] = 'XTRA Discord',
                    ["horizontalAlignment"] = "Center",
                    ["size"] = "Large",
                    ["url"] = "https://discord.gg/xtra",
                },
                {
                    ['type'] = 'Action.Submit',
                    ['title'] = 'XTRA Support',
                    ["horizontalAlignment"] = "Center",
                    ["size"] = "Large",
                    ["url"] = "https://discord.gg/xtrasupport",
                },
            },
        }
    }
}





Debug.active = config.debug
XTRA = {}
Proxy.addInterface("XTRA",XTRA)

tXTRA = {}
Tunnel.bindInterface("XTRA",tXTRA) -- listening for client tunnel

-- load language 
local dict = module("cfg/lang/"..config.lang) or {}
XTRA.lang = Lang.new(dict)

-- init
XTRAclient = Tunnel.getInterface("XTRA","XTRA") -- server -> client tunnel

XTRA.users = {} -- will store logged users (id) by first identifier
XTRA.rusers = {} -- store the opposite of users
XTRA.user_tables = {} -- user data tables (logger storage, saved to database)
XTRA.user_tmp_tables = {} -- user tmp data tables (logger storage, not saved)
XTRA.user_sources = {} -- user sources 
Citizen.CreateThread(function()
    Wait(1000) -- Wait for GHMatti to Initialize
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS xtra_users(
    id INTEGER AUTO_INCREMENT,
    last_login VARCHAR(100),
    username VARCHAR(100),
    license VARCHAR(100),
    banned BOOLEAN,
    bantime VARCHAR(100) NOT NULL DEFAULT "",
    banreason VARCHAR(1000) NOT NULL DEFAULT "",
    banadmin VARCHAR(100) NOT NULL DEFAULT "",
    baninfo VARCHAR(2000) NOT NULL DEFAULT "",
    last_kit_usage INT NOT NULL DEFAULT 0,
    CONSTRAINT pk_user PRIMARY KEY(id)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS xtra_user_ids (
    identifier VARCHAR(100) NOT NULL,
    user_id INTEGER,
    banned BOOLEAN,
    CONSTRAINT pk_user_ids PRIMARY KEY(identifier)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS xtra_user_ids (
    identifier VARCHAR(100) NOT NULL,
    user_id INTEGER,
    banned BOOLEAN,
    CONSTRAINT pk_user_ids PRIMARY KEY(identifier)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS cardevs (
    userid varchar(255),
    reportscompleted int,
    currentreport int,
    PRIMARY KEY(userid)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS cardev (
    reportid int NOT NULL AUTO_INCREMENT,
    spawncode varchar(255),
    issue varchar(255), 
    reporter varchar(255), 
    claimed varchar(255),
    completed boolean,
    notes varchar(255),
    PRIMARY KEY (reportid)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS xtra_user_data(
    user_id INTEGER,
    dkey VARCHAR(100),
    dvalue TEXT,
    CONSTRAINT pk_user_data PRIMARY KEY(user_id,dkey),
    CONSTRAINT fk_user_data_users FOREIGN KEY(user_id) REFERENCES xtra_users(id) ON DELETE CASCADE
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS xtra_user_moneys(
    user_id INTEGER,
    wallet bigint,
    bank bigint,
    CONSTRAINT pk_user_moneys PRIMARY KEY(user_id),
    CONSTRAINT fk_user_moneys_users FOREIGN KEY(user_id) REFERENCES xtra_users(id) ON DELETE CASCADE
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS xtra_srv_data(
    dkey VARCHAR(100),
    dvalue TEXT,
    CONSTRAINT pk_srv_data PRIMARY KEY(dkey)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS xtra_user_vehicles(
    user_id INTEGER,
    vehicle VARCHAR(100),
    vehicle_plate varchar(255) NOT NULL,
    rented BOOLEAN NOT NULL DEFAULT 0,
    rentedid varchar(200) NOT NULL DEFAULT '',
    rentedtime varchar(2048) NOT NULL DEFAULT '',
    locked BOOLEAN NOT NULL DEFAULT 0,
    fuel_level FLOAT NOT NULL DEFAULT 100,
    impounded BOOLEAN NOT NULL DEFAULT 0,
    impound_info varchar(2048) NOT NULL DEFAULT '',
    impound_time VARCHAR(100) NOT NULL DEFAULT '',
    CONSTRAINT pk_user_vehicles PRIMARY KEY(user_id,vehicle),
    CONSTRAINT fk_user_vehicles_users FOREIGN KEY(user_id) REFERENCES xtra_users(id) ON DELETE CASCADE
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS xtra_user_identities(
    user_id INTEGER,
    registration VARCHAR(100),
    phone VARCHAR(100),
    firstname VARCHAR(100),
    name VARCHAR(100),
    age INTEGER,
    CONSTRAINT pk_user_identities PRIMARY KEY(user_id),
    CONSTRAINT fk_user_identities_users FOREIGN KEY(user_id) REFERENCES xtra_users(id) ON DELETE CASCADE,
    INDEX(registration),
    INDEX(phone)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS xtra_warnings (
    warning_id INT AUTO_INCREMENT,
    user_id INT,
    warning_type VARCHAR(25),
    duration INT,
    admin VARCHAR(100),
    warning_date DATE,
    reason VARCHAR(2000),
    point INT,
    PRIMARY KEY (warning_id)
    )
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS xtra_gangs (
    gangname VARCHAR(255) NULL DEFAULT NULL,
    gangmembers VARCHAR(3000) NULL DEFAULT NULL,
    funds BIGINT NULL DEFAULT NULL,
    logs VARCHAR(3000) NULL DEFAULT NULL,
    gangfit TEXT DEFAULT NULL,
    lockedfunds BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (gangname)
    )
    ]])              
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS xtra_user_notes (
    user_id INT,
    info VARCHAR(500) NULL DEFAULT NULL,
    PRIMARY KEY (user_id)
    )
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS xtra_user_homes(
    user_id INTEGER,
    home VARCHAR(100),
    number INTEGER,
    rented BOOLEAN NOT NULL DEFAULT 0,
    rentedid varchar(200) NOT NULL DEFAULT '',
    rentedtime varchar(2048) NOT NULL DEFAULT '',
    CONSTRAINT pk_user_homes PRIMARY KEY(home),
    CONSTRAINT fk_user_homes_users FOREIGN KEY(user_id) REFERENCES xtra_users(id) ON DELETE CASCADE,
    UNIQUE(home,number)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS xtra_bans_offenses(
    UserID INTEGER AUTO_INCREMENT,
    Rules TEXT NULL DEFAULT NULL,
    points INT(10) NOT NULL DEFAULT 0,
    CONSTRAINT pk_user PRIMARY KEY(UserID)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS xtra_dvsa(
    user_id INT(11),
    licence VARCHAR(100) NULL DEFAULT NULL,
    testsaves VARCHAR(1000) NULL DEFAULT NULL,
    points VARCHAR(500) NULL DEFAULT NULL,
    id VARCHAR(500) NULL DEFAULT NULL,
    datelicence VARCHAR(500) NULL DEFAULT NULL,
    penalties VARCHAR(500) NULL DEFAULT NULL,
    PRIMARY KEY (user_id)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS xtra_subscriptions (
    user_id INT(11),
    plathours FLOAT(10) NULL DEFAULT NULL,
    plushours FLOAT(10) NULL DEFAULT NULL,
    last_used VARCHAR(100) NOT NULL DEFAULT "",
    redeemed INT DEFAULT 0,
    CONSTRAINT pk_user PRIMARY KEY (user_id)
    );
    ]]);      
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS xtra_casino_chips(
    user_id INT(11),
    chips bigint NOT NULL DEFAULT 0,
    CONSTRAINT pk_user PRIMARY KEY(user_id)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS xtra_verification(
    user_id INT(11),
    code VARCHAR(100) NULL DEFAULT NULL,
    discord_id VARCHAR(100) NULL DEFAULT NULL,
    verified TINYINT NULL DEFAULT NULL,
    CONSTRAINT pk_user PRIMARY KEY(user_id)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS phone_users_contacts (
    id int(11) NOT NULL AUTO_INCREMENT,
    identifier varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
    number varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
    display varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1',
    PRIMARY KEY (id)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS phone_messages (
    id int(11) NOT NULL AUTO_INCREMENT,
    transmitter varchar(10) NOT NULL,
    receiver varchar(10) NOT NULL,
    message varchar(255) NOT NULL DEFAULT '0',
    time timestamp NOT NULL DEFAULT current_timestamp(),
    isRead int(11) NOT NULL DEFAULT 0,
    owner int(11) NOT NULL DEFAULT 0,
    PRIMARY KEY (id)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS phone_calls (
    id int(11) NOT NULL AUTO_INCREMENT,
    owner varchar(10) NOT NULL COMMENT 'Num such owner',
    num varchar(10) NOT NULL COMMENT 'Reference number of the contact',
    incoming int(11) NOT NULL COMMENT 'Defined if we are at the origin of the calls',
    time timestamp NOT NULL DEFAULT current_timestamp(),
    accepts int(11) NOT NULL COMMENT 'Calls accept or not',
    PRIMARY KEY (id)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS phone_app_chat (
    id int(11) NOT NULL AUTO_INCREMENT,
    channel varchar(20) NOT NULL,
    message varchar(255) NOT NULL,
    time timestamp NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (id)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS global_tweets (
    id int(11) NOT NULL AUTO_INCREMENT,
    authorId int(11) NOT NULL,
    realUser varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    message varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
    time timestamp NOT NULL DEFAULT current_timestamp(),
    likes int(11) NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    KEY FK_global_tweets_global_accounts (authorId),
    CONSTRAINT FK_global_tweets_global_accounts FOREIGN KEY (authorId) REFERENCES global_accounts (id)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS global_likes (
    id int(11) NOT NULL AUTO_INCREMENT,
    authorId int(11) DEFAULT NULL,
    tweetId int(11) DEFAULT NULL,
    PRIMARY KEY (id),
    KEY FK_global_likes_global_accounts (authorId),
    KEY FK_global_likes_global_tweets (tweetId),
    CONSTRAINT FK_global_likes_global_accounts FOREIGN KEY (authorId) REFERENCES global_accounts (id),
    CONSTRAINT FK_global_likes_global_tweets FOREIGN KEY (tweetId) REFERENCES global_tweets (id) ON DELETE CASCADE
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS global_accounts (
    id int(11) NOT NULL AUTO_INCREMENT,
    username varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
    password varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
    avatar_url varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY username (username)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS xtra_community_pot (
    id INT AUTO_INCREMENT PRIMARY KEY,
    value BIGINT(20) NOT NULL DEFAULT 0
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS xtra_quests (
    user_id INT(11),
    quests_completed INT(11) NOT NULL DEFAULT 0,
    reward_claimed BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (user_id)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS xtra_weapon_whitelists (
    user_id INT(11),
    weapon_info varchar(2048) DEFAULT '{}',
    PRIMARY KEY (user_id)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS xtra_weapon_codes (
    user_id INT(11),
    spawncode varchar(2048) NOT NULL DEFAULT '',
    weapon_code int(11) NOT NULL DEFAULT 0,
    PRIMARY KEY (weapon_code)
    );
    ]])
    MySQL.SingleQuery([[
CREATE TABLE IF NOT EXISTS xtra_prison (
    user_id INT(11) NOT NULL,
    prison_time INT(11) NOT NULL DEFAULT 0,
    PRIMARY KEY (user_id)
);
 

    
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS xtra_staff_tickets (
    user_id INT(11),
    ticket_count INT(11) NOT NULL DEFAULT 0,
    username VARCHAR(100) NOT NULL,
    PRIMARY KEY (user_id)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS xtra_daily_rewards (
    user_id INT(11),
    last_reward INT(11) NOT NULL DEFAULT 0,
    streak INT(11) NOT NULL DEFAULT 0,
    PRIMARY KEY (user_id)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS `xtra_user_tokens` (
    `token` varchar(200) NOT NULL,
    `user_id` int(11) DEFAULT NULL,
    `banned` tinyint(1) NOT NULL DEFAULT 0,
    PRIMARY KEY (`token`)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS `xtra_user_device` (
    `devices` longtext NOT NULL,
    `user_id` int(11) DEFAULT NULL,
    `banned` tinyint(1) NOT NULL DEFAULT 0,
    PRIMARY KEY (`user_id`)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS xtra_police_hours (
    user_id INT(11),
    weekly_hours FLOAT(10) NOT NULL DEFAULT 0,
    total_hours FLOAT(10) NOT NULL DEFAULT 0,
    username VARCHAR(100) NOT NULL,
    last_clocked_date VARCHAR(100) NOT NULL,
    last_clocked_rank VARCHAR(100) NOT NULL,
    total_players_fined INT(11) NOT NULL DEFAULT 0,
    total_players_jailed INT(11) NOT NULL DEFAULT 0,
    PRIMARY KEY (user_id)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS xtra_stores (
    code VARCHAR(255) NOT NULL,
    item VARCHAR(255) NOT NULL,
    date VARCHAR(255) NOT NULL,
    user_id INT(11),
    PRIMARY KEY (code)
    );
    ]])
    MySQL.SingleQuery("ALTER TABLE xtra_users ADD IF NOT EXISTS bantime varchar(100) NOT NULL DEFAULT '';")
    MySQL.SingleQuery("ALTER TABLE xtra_users ADD IF NOT EXISTS banreason varchar(100) NOT NULL DEFAULT '';")
    MySQL.SingleQuery("ALTER TABLE xtra_users ADD IF NOT EXISTS banadmin varchar(100) NOT NULL DEFAULT ''; ")
    MySQL.SingleQuery("ALTER TABLE xtra_user_vehicles ADD IF NOT EXISTS rented BOOLEAN NOT NULL DEFAULT 0;")
    MySQL.SingleQuery("ALTER TABLE xtra_user_vehicles ADD IF NOT EXISTS rentedid varchar(200) NOT NULL DEFAULT '';")
    MySQL.SingleQuery("ALTER TABLE xtra_user_vehicles ADD IF NOT EXISTS rentedtime varchar(2048) NOT NULL DEFAULT '';")
    MySQL.createCommand("XTRAls/create_modifications_column", "alter table xtra_user_vehicles add if not exists modifications text not null")
	MySQL.createCommand("XTRAls/update_vehicle_modifications", "update xtra_user_vehicles set modifications = @modifications where user_id = @user_id and vehicle = @vehicle")
	MySQL.createCommand("XTRAls/get_vehicle_modifications", "select modifications, vehicle_plate from xtra_user_vehicles where user_id = @user_id and vehicle = @vehicle")
	MySQL.execute("XTRAls/create_modifications_column")
    print("[XTRA] ^2Base tables initialised.^0")
end)

MySQL.createCommand('XTRA/CreateUser', 'INSERT INTO xtra_users(license,banned) VALUES(@license,false)')
MySQL.createCommand('XTRA/GetUserByLicense', 'SELECT id FROM xtra_users WHERE license = @license')
MySQL.createCommand("XTRA/AddIdentifier", "INSERT INTO xtra_user_ids (identifier, user_id, banned) VALUES(@identifier, @user_id, false)")
MySQL.createCommand("XTRA/GetUserByIdentifier", "SELECT user_id FROM xtra_user_ids WHERE identifier = @identifier")
MySQL.createCommand("XTRA/GetIdentifiers", "SELECT identifier FROM xtra_user_ids WHERE user_id = @user_id")
MySQL.createCommand("XTRA/BanIdentifier", "UPDATE xtra_user_ids SET banned = @banned WHERE identifier = @identifier")

MySQL.createCommand("XTRA/identifier_all","SELECT * FROM xtra_user_ids WHERE identifier = @identifier")
MySQL.createCommand("XTRA/select_identifier_byid_all","SELECT * FROM xtra_user_ids WHERE user_id = @id")

MySQL.createCommand("XTRA/set_userdata","REPLACE INTO xtra_user_data(user_id,dkey,dvalue) VALUES(@user_id,@key,@value)")
MySQL.createCommand("XTRA/get_userdata","SELECT dvalue FROM xtra_user_data WHERE user_id = @user_id AND dkey = @key")

MySQL.createCommand("XTRA/set_srvdata","REPLACE INTO xtra_srv_data(dkey,dvalue) VALUES(@key,@value)")
MySQL.createCommand("XTRA/get_srvdata","SELECT dvalue FROM xtra_srv_data WHERE dkey = @key")

MySQL.createCommand("XTRA/get_banned","SELECT banned FROM xtra_users WHERE id = @user_id")
MySQL.createCommand("XTRA/set_banned","UPDATE xtra_users SET banned = @banned, bantime = @bantime,  banreason = @banreason,  banadmin = @banadmin, baninfo = @baninfo WHERE id = @user_id")
MySQL.createCommand("XTRA/set_identifierbanned","UPDATE xtra_user_ids SET banned = @banned WHERE identifier = @iden")
MySQL.createCommand("XTRA/getbanreasontime", "SELECT * FROM xtra_users WHERE id = @user_id")

MySQL.createCommand("XTRA/set_last_login","UPDATE xtra_users SET last_login = @last_login WHERE id = @user_id")
MySQL.createCommand("XTRA/get_last_login","SELECT last_login FROM xtra_users WHERE id = @user_id")

--Token Banning 
MySQL.createCommand("XTRA/add_token","INSERT INTO xtra_user_tokens(token,user_id) VALUES(@token,@user_id)")
MySQL.createCommand("XTRA/check_token","SELECT user_id, banned FROM xtra_user_tokens WHERE token = @token")
MySQL.createCommand("XTRA/check_token_userid","SELECT token FROM xtra_user_tokens WHERE user_id = @id")
MySQL.createCommand("XTRA/ban_token","UPDATE xtra_user_tokens SET banned = @banned WHERE token = @token")
MySQL.createCommand("XTRA/delete_token","DELETE FROM xtra_user_tokens WHERE token = @token")
--Device Banning
MySQL.createCommand("device/add_info", "INSERT IGNORE INTO xtra_user_device SET user_id = @user_id")
MySQL.createCommand("XTRA/get_device", "SELECT devices FROM xtra_user_device WHERE user_id = @user_id")
MySQL.createCommand("XTRA/set_device", "UPDATE xtra_user_device SET devices = @devices WHERE user_id = @user_id")
MySQL.createCommand("XTRA/get_device_banned", "SELECT banned FROM xtra_user_device WHERE devices = @devices")
MySQL.createCommand("XTRA/check_device_userid","SELECT devices FROM xtra_user_device WHERE user_id = @id")
MySQL.createCommand("XTRA/ban_device","UPDATE xtra_user_device SET banned = @banned WHERE devices = @devices")
MySQL.createCommand("XTRA/check_device","SELECT user_id, banned FROM xtra_user_device WHERE devices = @devices")
MySQL.createCommand("ac/delete_ban","DELETE FROM xtra_anticheat WHERE @user_id = user_id")

function XTRA.getUsers()
    local users = {}
    for k,v in pairs(XTRA.user_sources) do
        users[k] = v
    end
    return users
end


-- [[ User Information ]] --


function XTRA.checkidentifiers(userid,identifier,cb)
    for A,B in pairs(identifier) do
        MySQL.query("XTRA/GetUserByIdentifier", {identifier = B}, function(rows, affected)
            if rows[1] then
                if rows[1].id ~= userid then
                    XTRA.isBanned(rows[1].id, function(banned)
                        if banned then
                            cb(true, rows[1].id,"Ban Evading",B)
                        else
                            cb(true, rows[1].id,"Multi Accounting",B)
                        end
                    end)
                end
            else
                if A ~= "ip" then
                    MySQL.query("XTRA/AddIdentifier", {identifier = B, user_id = userid})
                end
            end
        end)
    end
end

function XTRA.getUserByLicense(license, cb)
    MySQL.query('XTRA/GetUserByLicense', {license = license}, function(rows, affected)
        if rows[1] then
            cb(rows[1].id)
        else
            MySQL.query('XTRA/CreateUser', {license = license}, function(rows, affected)
                if rows.affectedRows > 0 then
                    XTRA.getUserByLicense(license, cb)
                end
            end)
            for k, v in pairs(XTRA.getUsers()) do
                XTRAclient.notify(v, {'~g~You have received £50,000 as someone new has joined the server.'})
                XTRA.giveBankMoney(k, 50000)
            end
        end
    end)
end


function XTRA.SetIdentifierban(user_id,banned)
    MySQL.query("XTRA/GetIdentifiers", {user_id = user_id}, function(rows)
        if banned then
            for i=1, #rows do
                MySQL.query("XTRA/BanIdentifier", {identifier = rows[i].identifier, banned = true})
                Wait(50)
            end
        else
            for i=1, #rows do
                MySQL.query("XTRA/BanIdentifier", {identifier = rows[i].identifier, banned = false})
            end
        end
    end)
end

-- return identification string for the source (used for non XTRA identifications, for rejected players)
function XTRA.getSourceIdKey(source)
    local Identifiers = GetPlayerIdentifiers(source)
    local idk = "idk_"
    for k,v in pairs(Identifiers) do
        idk = idk..v
    end
    return idk
end

function XTRA.getPlayerIP(player)
    return GetPlayerEP(player) or "0.0.0.0"
end

--- sql

function XTRA.ReLoadChar(source)
    local Identifiers = GetPlayerIdentifiers(source)
    local ids = {}
    for _,identifier in pairs(Identifiers) do
        local key,value = string.match(identifier, "([^:]+):(.+)")
        if key and value then
            ids[key] = ids[key] or key..":"..value
        end
    end
    if ids.license then
        XTRA.getUserByLicense(ids.license, function(user_id)
            XTRA.GetDiscordName(user_id)
            Wait(250)
            if user_id then
                local name = XTRA.GetPlayerName(user_id) 
                XTRA.StoreTokens(source, user_id) 
                if XTRA.rusers[user_id] == nil then
                    XTRA.users[Identifiers[1]] = user_id
                    XTRA.rusers[user_id] = Identifiers[1]
                    XTRA.user_tables[user_id] = {}
                    XTRA.user_tmp_tables[user_id] = {}
                    XTRA.user_sources[user_id] = source
                    XTRA.getUData(user_id, "XTRA:datatable", function(sdata)
                        local data = json.decode(sdata)
                        if type(data) == "table" then XTRA.user_tables[user_id] = data end
                        local tmpdata = XTRA.getUserTmpTable(user_id)
                        XTRA.getLastLogin(user_id, function(last_login)
                            tmpdata.last_login = last_login or ""
                            tmpdata.spawns = 0
                            local last_login_stamp = os.date("%H:%M:%S %d/%m/%Y")
                            MySQL.execute("XTRA/set_last_login", {user_id = user_id, last_login = last_login_stamp})
                            print("[XTRA] "..name.." ^2Joined^0 | Perm ID: "..user_id)
                            TriggerEvent("XTRA:playerJoin", user_id, source, name, tmpdata.last_login)
                            TriggerClientEvent("XTRA:CheckIdRegister", source)
                        end)
                    end)
                else -- already connected
                    print("[XTRA] "..name.." ^2Re-Joined^0 | Perm ID: "..user_id)
                    TriggerEvent("XTRA:playerRejoin", user_id, source, name)
                    TriggerClientEvent("XTRA:CheckIdRegister", source)
                    local tmpdata = XTRA.getUserTmpTable(user_id)
                    tmpdata.spawns = 0
                end
            end
        end)
    end
end

exports("xtra", function(method_name, params, cb)
    if cb then 
        cb(XTRA[method_name](table.unpack(params)))
    else 
        return XTRA[method_name](table.unpack(params))
    end
end)

RegisterNetEvent("XTRA:CheckID")
AddEventHandler("XTRA:CheckID", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if not user_id then
        XTRA.ReLoadChar(source)
    end
end)

function XTRA.isBanned(user_id, cbr)
    local task = Task(cbr, {false})
    MySQL.query("XTRA/get_banned", {user_id = user_id}, function(rows, affected)
        if #rows > 0 then
            task({rows[1].banned})
        else
            task()
        end
    end)
end
function XTRA.getLastLogin(user_id, cbr)
    local task = Task(cbr,{""})
    MySQL.query("XTRA/get_last_login", {user_id = user_id}, function(rows, affected)
        if #rows > 0 then
            task({rows[1].last_login})
        else
            task()
        end
    end)
end

function XTRA.fetchBanReasonTime(user_id,cbr)
    MySQL.query("XTRA/getbanreasontime", {user_id = user_id}, function(rows, affected)
        if #rows > 0 then 
            cbr(rows[1].bantime, rows[1].banreason, rows[1].banadmin)
        end
    end)
end

function XTRA.setUData(user_id,key,value)
    MySQL.execute("XTRA/set_userdata", {user_id = user_id, key = key, value = value})
end

function XTRA.getUData(user_id,key,cbr)
    local task = Task(cbr,{""})
    MySQL.query("XTRA/get_userdata", {user_id = user_id, key = key}, function(rows, affected)
        if rows and #rows > 0 then
            task({rows[1].dvalue})
        else
            task()
        end
    end)
end

function XTRA.setSData(key,value)
    MySQL.execute("XTRA/set_srvdata", {key = key, value = value})
end

function XTRA.getSData(key, cbr)
    local task = Task(cbr,{""})
    MySQL.query("XTRA/get_srvdata", {key = key}, function(rows, affected)
        if rows and #rows > 0 then
            task({rows[1].dvalue})
        else
            task()
        end
    end)
end

-- return user data table for XTRA internal persistant connected user storage
function XTRA.getUserDataTable(user_id)
    return XTRA.user_tables[user_id]
end

function XTRA.getUserTmpTable(user_id)
    return XTRA.user_tmp_tables[user_id]
end

function XTRA.isConnected(user_id)
    return XTRA.rusers[user_id] ~= nil
end

function XTRA.isFirstSpawn(user_id)
    local tmp = XTRA.getUserTmpTable(user_id)
    return tmp and tmp.spawns == 1
end

function XTRA.getUserId(source)
    if source then
        local Identifiers = GetPlayerIdentifiers(source)
        if Identifiers and #Identifiers > 0 then
            return XTRA.users[Identifiers[1]]
        end
    end
    return nil
end

-- return source or nil
function XTRA.getUserSource(user_id)
    return XTRA.user_sources[user_id]
end

function XTRA.IdentifierBanCheck(source,user_id,cb)
    for i,v in pairs(GetPlayerIdentifiers(source)) do 
        MySQL.query('XTRA/identifier_all', {identifier = v}, function(rows)
            for i = 1,#rows do 
                if rows[i].banned then 
                    if user_id ~= rows[i].user_id then 
                        cb(true, rows[i].user_id, v)
                    end 
                end
            end
        end)
    end
end

function XTRA.BanIdentifiers(user_id, value)
    MySQL.query('XTRA/select_identifier_byid_all', {id = user_id}, function(rows)
        for i = 1, #rows do 
            MySQL.execute("XTRA/set_identifierbanned", {banned = value, iden = rows[i].identifier })
        end
    end)
end

function calculateTimeRemaining(expireTime)
    local datetime = ''
    local expiry = os.date("%d/%m/%Y at %H:%M", tonumber(expireTime))
    local hoursLeft = ((tonumber(expireTime)-os.time()))/3600
    local minutesLeft = nil
    if hoursLeft < 1 then
        minutesLeft = hoursLeft * 60
        minutesLeft = string.format("%." .. (0) .. "f", minutesLeft)
        datetime = minutesLeft .. " mins" 
        return datetime
    else
        hoursLeft = string.format("%." .. (0) .. "f", hoursLeft)
        datetime = hoursLeft .. " hours" 
        return datetime
    end
    return datetime
end

function XTRA.setBanned(user_id,banned,time,reason,admin,baninfo)
    if banned then 
        MySQL.execute("XTRA/set_banned", {user_id = user_id, banned = banned, bantime = time, banreason = reason, banadmin = admin, baninfo = baninfo})
        XTRA.BanIdentifiers(user_id, true)
        XTRA.BanTokens(user_id, true)
        XTRA.BanUserInfo(user_id, true)
    else 
        MySQL.execute("XTRA/set_banned", {user_id = user_id, banned = banned, bantime = "", banreason =  "", banadmin =  "", baninfo = ""})
        XTRA.BanIdentifiers(user_id, false)
        XTRA.BanTokens(user_id, false)
        XTRA.BanUserInfo(user_id, false)
        MySQL.execute("ac/delete_ban", {user_id = user_id})
    end 
end

function XTRA.ban(adminsource,permid,time,reason,baninfo)
    local adminPermID = XTRA.getUserId(adminsource)
    local PlayerSource = XTRA.getUserSource(tonumber(permid))
    local getBannedPlayerSrc = XTRA.getUserSource(tonumber(permid))
    local adminname = XTRA.GetPlayerName(adminPermID)
    if getBannedPlayerSrc then 
        if tonumber(time) then
            XTRA.setBucket(PlayerSource, permid)
            XTRA.setBanned(permid,true,time,reason,adminname,baninfo)
            XTRA.kick(getBannedPlayerSrc,"[XTRA] Ban expires in: "..calculateTimeRemaining(time).."\nYour ID is: "..permid.."\nReason: " .. reason .. "\nAppeal @ discord.gg/xtra") 
        else
            XTRA.setBucket(PlayerSource, permid)
            XTRA.setBanned(permid,true,"perm",reason,adminname,baninfo)
            XTRA.kick(getBannedPlayerSrc,"[XTRA] Permanent Ban\nYour ID is: "..permid.."\nReason: " .. reason .. "\nAppeal @ discord.gg/xtra") 
        end
        XTRAclient.notify(adminsource,{"~g~Success banned! User PermID: " .. permid})
    else 
        if tonumber(time) then 
            XTRA.setBanned(permid,true,time,reason,adminname,baninfo)
        else 
            XTRA.setBanned(permid,true,"perm",reason,adminname,baninfo)
        end
        XTRAclient.notify(adminsource,{"~g~Success banned! User PermID: " .. permid})
    end
end

function XTRA.banConsole(permid,time,reason)
    local adminPermID = "XTRA"
    local getBannedPlayerSrc = XTRA.getUserSource(tonumber(permid))
    if getBannedPlayerSrc then 
        if tonumber(time) then 
            local banTime = os.time()
            banTime = banTime  + (60 * 60 * tonumber(time))  
            XTRA.setBanned(permid,true,banTime,reason, adminPermID)
            XTRA.kick(getBannedPlayerSrc,"[XTRA] Ban expires in "..calculateTimeRemaining(banTime).."\nYour ID is: "..permid.."\nReason: " .. reason .. "\nBanned by XTRA \nAppeal @ discord.gg/xtra") 
        else 
            XTRA.setBanned(permid,true,"perm",reason, adminPermID)
            XTRA.kick(getBannedPlayerSrc,"[XTRA] Permanent Ban\nYour ID is: "..permid.."\nReason: " .. reason .. "\nBanned by XTRA \nAppeal @ discord.gg/xtra") 
        end
        print("Successfully banned Perm ID: " .. permid)
    else 
        if tonumber(time) then 
            local banTime = os.time()
            banTime = banTime  + (60 * 60 * tonumber(time))  
            XTRA.setBanned(permid,true,banTime,reason, adminPermID)
        else 
            XTRA.setBanned(permid,true,"perm",reason, adminPermID)
        end
        print("Successfully banned Perm ID: " .. permid)
    end
end
function XTRA.banAnticheat(permid,time,reason)
    local adminPermID = "XTRA"
    local getBannedPlayerSrc = XTRA.getUserSource(tonumber(permid))
    if getBannedPlayerSrc then 
        if tonumber(time) then 
            local banTime = os.time()
            banTime = banTime  + (60 * 60 * tonumber(time))  
            XTRA.setBanned(permid,true,banTime,reason, adminPermID)
            Citizen.Wait(20000)
            XTRA.kick(getBannedPlayerSrc,"[XTRA] Ban expires in "..calculateTimeRemaining(banTime).."\nYour ID is: "..permid.."\nReason: " .. reason .. "\nBanned by XTRA \nAppeal @ discord.gg/xtra") 
        else 
            XTRA.setBanned(permid,true,"perm",reason, adminPermID)
            Citizen.Wait(20000)
            XTRA.kick(getBannedPlayerSrc,"[XTRA] Permanent Ban\nYour ID is: "..permid.."\nReason: " .. reason .. "\nBanned by XTRA \nAppeal @ discord.gg/xtra") 
        end
    else 
        if tonumber(time) then 
            local banTime = os.time()
            banTime = banTime  + (60 * 60 * tonumber(time))  
            XTRA.setBanned(permid,true,banTime,reason, adminPermID)
        else 
            XTRA.setBanned(permid,true,"perm",reason, adminPermID)
        end
    end
end

function XTRA.banDiscord(permid,time,reason,adminPermID,baninfo)
    local getBannedPlayerSrc = XTRA.getUserSource(tonumber(permid))
    if tonumber(time) then 
        local banTime = os.time()
        banTime = banTime  + (60 * 60 * tonumber(time))
        XTRA.setBanned(permid,true,banTime,reason, adminPermID, baninfo)
        if getBannedPlayerSrc then 
            XTRA.kick(getBannedPlayerSrc,"[XTRA] Ban expires in "..calculateTimeRemaining(banTime).."\nYour ID is: "..permid.."\nReason: " .. reason .. "\nAppeal @ discord.gg/xtra") 
        end
    else 
        XTRA.setBanned(permid,true,"perm",reason,  adminPermID)
        if getBannedPlayerSrc then
            XTRA.kick(getBannedPlayerSrc,"[XTRA] Permanent Ban\nYour ID is: "..permid.."\nReason: " .. reason .. "\nAppeal @ discord.gg/xtra") 
        end
    end
end

function XTRA.StoreTokens(source, user_id) 
    if GetNumPlayerTokens then 
        local numtokens = GetNumPlayerTokens(source)
        for i = 1, numtokens do
            local token = GetPlayerToken(source, i)
            MySQL.query("XTRA/check_token", {token = token}, function(rows)
                if token and rows and #rows <= 0 then 
                    MySQL.execute("XTRA/add_token", {token = token, user_id = user_id})
                end        
            end)
        end
    end
end


function XTRA.CheckTokens(source, user_id) 
    if GetNumPlayerTokens then 
        local banned = false;
        local numtokens = GetNumPlayerTokens(source)
        for i = 1, numtokens do
            local token = GetPlayerToken(source, i)
            local rows = MySQL.asyncQuery("XTRA/check_token", {token = token, user_id = user_id})
                if #rows > 0 then 
                if rows[1].banned then 
                    return rows[1].banned, rows[1].user_id
                end
            end
        end
    else 
        return false; 
    end
end

function XTRA.BanTokens(user_id, banned) 
    if GetNumPlayerTokens then 
        MySQL.query("XTRA/check_token_userid", {id = user_id}, function(id)
            sleep = banned and 50 or 0
            for i = 1, #id do
                if banned then
                    MySQL.execute("XTRA/ban_token", {token = id[i].token, banned = banned})

                else
                    MySQL.execute("XTRA/delete_token", {token = id[i].token})
                end
                Wait(sleep)
            end
        end)
    end
end

function XTRA.kick(source,reason)
    DropPlayer(source,reason)
end

-- tasks

function task_save_datatables()
    TriggerEvent("XTRA:save")
    Debug.pbegin("XTRA save datatables")
    for k,v in pairs(XTRA.user_tables) do
        XTRA.setUData(k,"XTRA:datatable",json.encode(v))
    end
    Debug.pend()
    SetTimeout(config.save_interval*1000, task_save_datatables)
end
task_save_datatables()
function XTRA.GetPlayerIdentifiers(source)
    local Identifiers = GetPlayerIdentifiers(source)
    local ids = {}
    for _,identifier in pairs(Identifiers) do
        local key,value = string.match(identifier, "([^:]+):(.+)")
        if key and value then
            ids[key] = ids[key] or key..":"..value
        end
    end
    return ids
end
local forbiddenNames = {
	"%^1",
	"%^2",
	"%^3",
	"%^4",
	"%^5",
	"%^6",
	"%^7",
	"%^8",
	"%^9",
	"%^%*",
	"%^_",
	"%^=",
	"%^%~",
	"admin",
    "nigger",
    "faggot",
    "*"
}

AddEventHandler("playerConnecting", function(name, setMessage, deferrals)
    deferrals.defer()
    local source = source
    local Identifiers = GetPlayerIdentifiers(source)
    local ids = {}
    for _,identifier in pairs(Identifiers) do
        local key,value = string.match(identifier, "([^:]+):(.+)")
        if key and value then
            ids[key] = ids[key] or key..":"..value
        end
    end
    if GetNumPlayerTokens(source) <= 0 then
        deferrals.done("[XTRA] Please restart your game and try again.")
        return
    end
    if ids.license then
        deferrals.update("[XTRA] Checking For User ID...")
        XTRA.getUserByLicense(ids.license, function(user_id)
            deferrals.update("[XTRA] Checking For  Identifiers...")
            XTRA.checkidentifiers(user_id, ids, function(banned, userid, reason, identifier)
                if banned and reason == "Ban Evading" then
                    deferrals.done("\n[XTRA] Permanently Banned\nUser ID: "..user_id.."\nReason: "..reason.."\nAppeal: https://discord.gg/xtra")
                    XTRA.setBanned(user_id,true,"perm","Ban Evading","XTRA","ID Banned: "..userid)
                    XTRA.sendWebhook('ban-evaders', 'XTRA Ban Evade Logs', "> Player Name: **"..GetPlayerName(source).."**\n> Player Current Perm ID: **"..user_id.."**\n> Player Banned PermID: **"..userid.."**\n> Banned Identifier: **"..identifier.."**")
                    return
                end
            end)
            if user_id ~= nil then
                deferrals.update("[XTRA] Checking If Verified...")
                local verified = exports["xtra"]:executeSync("SELECT * FROM xtra_verification WHERE user_id = @user_id", { user_id = user_id })
                if #verified == 0 then
                    exports["xtra"]:executeSync("INSERT IGNORE INTO xtra_verification(user_id,verified) VALUES(@user_id,false)", {user_id = user_id})
                end
                if #verified > 0 then
                    if verified[1].verified == 0 then
                        if code == nil then
                            code = string.upper(generateUUID("verifycode", 6, "alphanumeric"))
                            exports["xtra"]:executeSync("UPDATE xtra_verification SET code = @code WHERE user_id = @user_id", { user_id = user_id, code = code })
                        else
                            code = string.upper(generateUUID("verifycode", 6, "alphanumeric"))
                            exports["xtra"]:executeSync("UPDATE xtra_verification SET code = @code WHERE user_id = @user_id", { user_id = user_id, code = code })
                        end
                        show_auth_card(code, deferrals, function(data)
                            check_verified(deferrals, code, user_id)
                        end)
                        Wait(100000)
                    end
                    if #verified == 1 then
                        deferrals.update("[XTRA] Checking For Ban...")
                        XTRA.StoreTokens(source, user_id)
                        XTRA.GetDiscordName(user_id)
                        XTRA.isBanned(user_id, function(banned)
                            if not banned then
                                deferrals.update("[XTRA] Checking For Discord...")
                                if not XTRA.checkForRole(user_id, '1195851569472741441') then
                                    deferrals.done("[XTRA]: Your Perm ID Is [".. user_id .."] you are required to be in the discord to join (discord.gg/xtra)")
                                    return
                                end
                                deferrals.update("[XTRA] Getting User Name...")
                                Wait(3000)                         
                                if XTRA.CheckTokens(source, user_id) then 
                                    deferrals.done("[XTRA]: You are banned from this server, please do not try to evade your ban. If you believe this was an error quote your ID which is: " .. user_id)
                                    XTRA.banConsole(user_id, "perm", "1.11 Ban Evading")
                                    return
                                end

                                deferrals.update("[XTRA] Checking User Data...")
                                Citizen.Wait(1000)
                                XTRA.users[Identifiers[1]] = user_id
                                XTRA.rusers[user_id] = Identifiers[1]
                                XTRA.user_tables[user_id] = {}
                                XTRA.user_tmp_tables[user_id] = {}
                                XTRA.user_sources[user_id] = source
                                deferrals.update("[XTRA] Getting User Data...")
                                XTRA.getUData(user_id, "XTRA:datatable", function(sdata)
                                    local data = json.decode(sdata)
                                    if type(data) == "table" then 
                                        XTRA.user_tables[user_id] = data 
                                    end
                                    local tmpdata = XTRA.getUserTmpTable(user_id)
                                    XTRA.getLastLogin(user_id, function(last_login)
                                        tmpdata.last_login = last_login or ""
                                        tmpdata.spawns = 0
                                        local last_login_stamp = os.date("%H:%M:%S %d/%m/%Y")
                                        MySQL.execute("XTRA/set_last_login", {user_id = user_id, last_login = last_login_stamp})
                                        deferrals.update("[XTRA] Got User Data...")
                                        print("[XTRA] "..XTRA.GetPlayerName(user_id).." ^2Joined^0 | PermID: "..user_id)
                                        TriggerEvent("XTRA:playerJoin", user_id, source, XTRA.GetPlayerName(user_id), tmpdata.last_login)
                                        Wait(500)
                                        deferrals.done()
                                    end)
                                end)
                            else
                                XTRA.fetchBanReasonTime(user_id, function(bantime, banreason, banadmin)
                                    if tonumber(bantime) then 
                                        local timern = os.time()
                                        if timern > tonumber(bantime) then 
                                            XTRA.setBanned(user_id, false)
                                            if XTRA.rusers[user_id] == nil then
                                                XTRA.users[Identifiers[1]] = user_id
                                                XTRA.rusers[user_id] = Identifiers[1]
                                                XTRA.user_tables[user_id] = {}
                                                XTRA.user_tmp_tables[user_id] = {}
                                                XTRA.user_sources[user_id] = source
                                                XTRA.getUData(user_id, "XTRA:datatable", function(sdata)
                                                    local data = json.decode(sdata)
                                                    if type(data) == "table" then 
                                                        XTRA.user_tables[user_id] = data 
                                                    end
                                                    local tmpdata = XTRA.getUserTmpTable(user_id)
                                                    XTRA.getLastLogin(user_id, function(last_login)
                                                        tmpdata.last_login = last_login or ""
                                                        tmpdata.spawns = 0
                                                        local last_login_stamp = os.date("%H:%M:%S %d/%m/%Y")
                                                        MySQL.execute("XTRA/set_last_login", {user_id = user_id, last_login = last_login_stamp})
                                                        print("[XTRA] "..XTRA.GetPlayerName(user_id).." ^3Joined after their ban expired.^0 (Perm ID = "..user_id..")")
                                                        TriggerEvent("XTRA:playerJoin", user_id, source, XTRA.GetPlayerName(user_id), tmpdata.last_login)
                                                        deferrals.done()
                                                    end)
                                                end)
                                            else
                                                print("[XTRA] "..XTRA.GetPlayerName(user_id).." ^3Re-joined after their ban expired.^0 | Perm ID = "..user_id)
                                                TriggerEvent("XTRA:playerRejoin", user_id, source, XTRA.GetPlayerName(user_id))
                                                deferrals.done()
                                                local tmpdata = XTRA.getUserTmpTable(user_id)
                                                tmpdata.spawns = 0
                                            end
                                        end
                                        print("[XTRA] "..GetPlayerName(source).." ^1Rejected: "..banreason.."^0 | Perm ID = "..user_id)
                                        local baninfo = {}
                                        local calbantime = calculateTimeRemaining(bantime)
                                        baninfo[user_id] = {user_id = user_id, time = calbantime, reason = banreason}
                                        show_ban_card(baninfo[user_id], deferrals)
                                        --deferrals.done("\n[XTRA] Ban expires in "..calculateTimeRemaining(bantime).."\nYour ID: "..user_id.."\nReason: "..banreason.."\nAppeal @ discord.gg/xtra")
                                    else 
                                        print("[XTRA] "..GetPlayerName(source).." ^1Rejected: "..banreason.."^0 | Perm ID = "..user_id)
                                        local baninfo = {}
                                        baninfo[user_id] = {user_id = user_id, time = "perm", reason = banreason}
                                        show_ban_card(baninfo[user_id], deferrals)
                                        --deferrals.done("\n[XTRA] Permanent Ban\nYour ID: "..user_id.."\nReason: "..banreason.."\nAppeal @ discord.gg/xtra")
                                    end
                                end)
                            end
                        end)
                    end
                else
                    deferrals.done("[XTRA] Please restart your game and try again.")
                end
            end
        end)
    end
end)
local trys = {}
function show_auth_card(code, deferrals, callback)
    if trys[code] == nil then
        trys[code] = 0
    end
    verify_card["body"][2]["items"][4]["text"] = "!verify "..code
    verify_card["body"][2]["items"][4]["color"] = "Good"
    verify_card["body"][2]["items"][5]["text"] = "Your account has not been verified yet. (Attempt "..trys[code]..")"
    deferrals.presentCard(verify_card, callback)
end

function check_verified(deferrals, code, user_id, data)
    local data_verified = exports["xtra"]:executeSync("SELECT verified FROM xtra_verification WHERE user_id = @user_id", { user_id = user_id })
    if trys[code] == nil then
        trys[code] = 0
    end
    if trys[code] ~= 5 then
        verify_card["body"][2]["items"][4]["text"] = "Checking Verification..."
        verify_card["body"][2]["items"][4]["color"] = "Good"
        verify_card["body"][2]["items"][1]["text"] = ""
        verify_card["body"][2]["items"][2]["text"] = ""
        verify_card["body"][2]["items"][3]["text"] = ""
        verify_card["body"][2]["items"][5]["text"] = ""
        deferrals.presentCard(verify_card, callback)
        Wait(2000)
        verify_card["body"][2]["items"][1]["text"] = "In order to connect to XTRA you must be in our discord and verify your account"
        verify_card["body"][2]["items"][2]["text"] = "Join the XTRA discord (discord.gg/xtra)"
        verify_card["body"][2]["items"][3]["text"] = "In the #verify channel, type the following command"
        verify_card["body"][2]["items"][4]["text"] = "!verify "..code
    else
        verify_card["body"][2]["items"][1]["text"] = ""
        verify_card["body"][2]["items"][2]["text"] = ""
        verify_card["body"][2]["items"][3]["text"] = ""
        verify_card["body"][2]["items"][4]["text"] = ""
        verify_card["body"][2]["items"][5]["text"] = "You Have Reached The Maximum Amount Of Attempts"
        deferrals.presentCard(verify_card, callback)
        Wait(2000)
        deferrals.done("[XTRA]: Failed to verify your account, please try again.")
        return
    end
    if data_verified[1] and data_verified[1].verified == 1 then

        verify_card["body"][2]["items"][4]["text"] = "Verification Successful!"
        verify_card["body"][2]["items"][4]["color"] = "Good"
        verify_card["body"][2]["items"][1]["text"] = ""
        verify_card["body"][2]["items"][2]["text"] = ""
        verify_card["body"][2]["items"][3]["text"] = ""
        verify_card["body"][2]["items"][5]["text"] = ""
        verify_card["body"][3] = false
        deferrals.presentCard(verify_card, callback)
        Wait(3000)
        deferrals.update("[XTRA] Checking For Discord...")
        if not XTRA.checkForRole(user_id, '1195851569472741441') then
            deferrals.done("[XTRA]: Your Perm ID Is [".. user_id .."] you are required to be in the discord to join (discord.gg/xtra)")
            return
        end
        Wait(1000)
        deferrals.update("[XTRA] Getting User Name...")
        Wait(1000)
        deferrals.update("[XTRA] Checking User Data...")
        Wait(1000)
        deferrals.done()
        print("[XTRA] "..XTRA.GetPlayerName(user_id).." ^2Newly Verified^0 | PermID: "..user_id)
    end
    trys[code] = trys[code] + 1
    show_auth_card(code, deferrals, callback)
end
function show_ban_card(baninfo, deferrals, callback)
    if baninfo.time == "perm" then
        ban_card["body"][2]["items"][1]["text"] = "Permanent Ban"
        ban_card["body"][2]["items"][2]["text"] = "Your ID: "..baninfo.user_id
        ban_card["body"][2]["items"][3]["text"] = "Reason: "..baninfo.reason
    else
        ban_card["body"][2]["items"][1]["text"] = "Ban expires in ".. baninfo.time
        ban_card["body"][2]["items"][2]["text"] = "Your ID: "..baninfo.user_id
        ban_card["body"][2]["items"][3]["text"] = "Reason: "..baninfo.reason
    end
    deferrals.presentCard(ban_card, callback)
end






AddEventHandler("playerDropped", function(reason)
    local source = source
    local user_id = XTRA.getUserId(source)
    local name = XTRA.GetPlayerName(user_id)
    local Identifiers = GetPlayerIdentifiers(source)
    local ids = {}
    for _,identifier in pairs(Identifiers) do
        local key,value = string.match(identifier, "([^:]+):(.+)")
        if key and value then
            ids[key] = ids[key] or key..":"..value
        end
    end
    if user_id ~= nil then
        TriggerEvent("XTRA:playerLeave", user_id, source)
        XTRA.setUData(user_id, "XTRA:datatable", json.encode(XTRA.getUserDataTable(user_id)))
        print("[XTRA] " .. name .. " ^1Disconnected^0 | Perm ID: "..user_id)
        XTRA.users[XTRA.users[user_id]] = nil
        XTRA.rusers[user_id] = nil
        XTRA.user_tables[user_id] = nil
        XTRA.user_tmp_tables[user_id] = nil
        XTRA.user_sources[user_id] = nil
        XTRA.sendWebhook('leave', "XTRA Leave Logs", "> Name: **" .. name .. "**\n> PermID: **" .. user_id .. "**\n> Temp ID: **" .. source .. "**\n> Reason: **" .. reason .. "**\n```\n"..ids.license.."```")
    else
        print('[XTRA] SEVERE ERROR: Failed to save data for: ' .. name .. ' Rollback expected!')
    end
    XTRAclient.removeBasePlayer(-1, {source})
    XTRAclient.removePlayer(-1, {source})
end)

MySQL.createCommand("XTRA/setusername", "UPDATE xtra_users SET username = @username WHERE id = @user_id")

RegisterServerEvent("XTRACli:playerSpawned")
AddEventHandler("XTRACli:playerSpawned", function()
    local source = source
    local Identifiers = GetPlayerIdentifiers(source)
    local Tokens = GetNumPlayerTokens(source)
    local ids = {}
    for _,identifier in pairs(Identifiers) do
        local key,value = string.match(identifier, "([^:]+):(.+)")
        if key and value then
            ids[key] = ids[key] or key..":"..value
        end
    end
    local user_id = XTRA.getUserId(source)
    local name = XTRA.GetPlayerName(user_id)
    local player = source
    XTRAclient.addBasePlayer(-1, {player, user_id})
    if user_id ~= nil then
        XTRA.user_sources[user_id] = source
        local tmp = XTRA.getUserTmpTable(user_id)
        tmp.spawns = tmp.spawns + 1
        local first_spawn = (tmp.spawns == 1)
        local playertokens = {} 
        for i = 1, Tokens do
            local token = GetPlayerToken(source, i)
            if token then
                if not playertokens[source] then
                    playertokens[source] = {} 
                end
                table.insert(playertokens[source], token)
            end
        end   
        XTRA.sendWebhook('join', "XTRA Join Logs", "> Name : **" .. name .. "**\n> TempID: **" .. source .. "**\n> PermID: **" .. user_id .. "**\n```\n\n"..ids.license.."\n\n"..table.concat(playertokens[source], "\n\n").."```")
        if first_spawn then
            for k, v in pairs(XTRA.user_sources) do
                XTRAclient.addPlayer(source, {v})
            end
            XTRAclient.addPlayer(-1, {source})
            MySQL.execute("XTRA/setusername", {user_id = user_id, username = name})
        end
        TriggerEvent("XTRA:playerSpawn", user_id, player, first_spawn)
        TriggerClientEvent("XTRA:onClientSpawn", player, user_id, first_spawn)
    end
end)
RegisterServerEvent("XTRA:playerRespawned")
AddEventHandler("XTRA:playerRespawned", function()
    local source = source
    TriggerClientEvent('XTRA:ForceRefreshData', -1)
    TriggerClientEvent('XTRA:onClientSpawn', source)
end)

local Online = true
exports("getServerStatus", function(params, cb)
    if not Online then
        cb("❌ Offline")
    else
        cb("✅ Online")
    end
end)

exports("getConnected", function(params, cb)
    if XTRA.getUserSource(params[1]) then
        cb('connected')
    else
        cb('not connected')
    end
end)



function XTRA.NameCheck(name, cb)
    for v in pairs(forbiddenNames) do
        if(string.gsub(string.gsub(string.gsub(string.gsub(name:lower(), "-", ""), ",", ""), "%.", ""), " ", ""):find(forbiddenNames[v])) then
            cb(true)
            return
        end
    end
end


local devs = {
    [1] = true,
}


function XTRA.isDeveloper(user_id)
    if IsDuplicityVersion() then
        return devs[tonumber(user_id)]
    else
        return devs[tXTRA.getUserId()]
    end
end

