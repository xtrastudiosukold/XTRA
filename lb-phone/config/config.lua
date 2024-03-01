Config = {}
Config.Debug = false -- Set to true to enable debug mode

--[[ FRAMEWORK OPTIONS ]] --
Config.Framework = "standalone"
--[[
    Supported frameworks:
        * esx: es_extended, https://github.com/esx-framework/esx-legacy
        * qb: qb-core, https://github.com/qbcore-framework/qb-core
        * ox: ox_core, https://github.com/overextended/ox_core
        * standalone: no framework, note that framework specific apps will not work unless you implement the functions
]]
Config.CustomFramework = true -- if set to true and you use standalone, you will be able to use framework specific apps
Config.QBMailEvent = false -- if you want this script to listen for qb email events, enable this. NOTE: This allows players to send emails from the client.

Config.Item = {}
Config.Item.Require = false -- require a phone item to use the phone
Config.Item.Name = "phone" -- name of the phone item

Config.Item.Unique = false -- should each phone be unique? https://docs.lbphone.com/phone/configuration#unique-phones
Config.Item.Inventory = "ox_inventory" --[[
    The inventory you use
    Supported:
        * ox_inventory - https://github.com/overextended/ox_inventory
        * qb-inventory - https://github.com/qbcore-framework/qb-inventory
        * lj-inventory - https://github.com/loljoshie/lj-inventory
        * core_inventory - https://www.c8re.store/package/5121548
        * mf-inventory - https://modit.store/products/mf-inventory?variant=39985142268087
        * qs-inventory - https://buy.quasar-store.com/package/4770732
]]

Config.DynamicIsland = true -- if enabled, the phone will have a Iphone 14 Pro inspired Dynamic Island.
Config.SetupScreen = true -- if enabled, the phone will have a setup screen when the player first uses the phone.

Config.WhitelistApps = {
    -- ["test-app"] = {"police", "ambulance"}
}

Config.BlacklistApps = {
    -- ["DarkChat"] = {"police"}
}

Config.Companies = {}
Config.Companies.Enabled = true -- allow players to call companies?
Config.Companies.MessageOffline = true -- if true, players can message companies even if no one in the company is online
Config.Companies.Services = {
    {
        job = "police",
        name = "Met Police",
        icon = "https://i.imgur.com/pDpuy6o.png",
        canCall = false, -- if true, players can call the company
        canMessage = false, -- if true, players can message the company
        bossRanks = {}, -- ranks that can manage the company
        location = {
            name = "Mission Row",
            coords = {
                x = 428.9,
                y = -984.5,
            }
        }
    },
    {
        job = "nhs",
        name = "NHS",
        icon = "https://www.pilgrimshospices.org/wp-content/uploads/2020/04/NHS-logo-square.jpg",
        canCall = false, -- if true, players can call the company
        canMessage = false, -- if true, players can message the company
        bossRanks = {}, -- ranks that can manage the company
        location = {
            name = "St Thomas Hospital",
            coords = {
                x = 298.49432373047,
                y = -584.48767089844,
            }
        }
    },
    {
        job = "lfb",
        name = "LFB",
        icon = "https://media.glassdoor.com/sqll/743850/london-fire-brigade-squarelogo-1393365487307.png",
        canCall = true, -- if true, players can call the company
        canMessage = false, -- if true, players can message the company
        bossRanks = {}, -- ranks that can manage the company
        location = {
            name = "Fire HQ",
            coords = {
                x = 1188.8081054688,
                y = -1466.8724365234,
            }
        }
    },
    {
        job = "aa",
        name = "AA Mechanic",
        icon = "https://www.chcdigital.com/wp-content/uploads/2017/03/aalogo.jpg",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {}, -- ranks that can manage the company
        location = {
            name = "AA Autoshop",
            coords = {
                x = 494.89334106445,
                y = -1327.9873046875,
            }
        }
    },
}

Config.Companies.Contacts = { -- not needed if you use the services app
    -- ["police"] = {
    --     name = "Police",
    --     photo = "https://cdn-icons-png.flaticon.com/512/7211/7211100.png"
    -- },
}

Config.Companies.Management = {
    Enabled = true, -- if true, employees & the boss can manage the company

    Duty = true, -- if true, employees can go on/off duty
    -- Boss actions
    Deposit = true, -- if true, the boss can deposit money into the company
    Withdraw = true, -- if true, the boss can withdraw money from the company
    Hire = true, -- if true, the boss can hire employees
    Fire = true, -- if true, the boss can fire employees
    Promote = true, -- if true, the boss can promote employees
}

Config.CustomApps = { -- https://docs.lbphone.com/phone/custom-apps

}

Config.Valet = {}
Config.Valet.Enabled = true -- allow players to get their vehicles from the phone
Config.Valet.Price = nil -- price to get your vehicle

Config.HouseScript = "loaf_housing" --[[
    The housing script you use on your server
    Supported:
        * loaf_housing - https://store.loaf-scripts.com/package/4310850
]]

--[[ VOICE OPTIONS ]] --
Config.Voice = {}
Config.Voice.CallEffects = true
Config.Voice.System = "pma"
--[[
    Supported voice systems:
        * pma: pma-voice - HIGHLY RECOMMENDED
        * mumble: mumble-voip - Not recommended, update to pma-voice
        * salty: saltychat - Not recommended, change to pma-voice
        * toko: tokovoip - Not recommended, change to pma-voice
]]

Config.Voice.HearNearby = true --[[
    Only works with pma-voice

    If true, players will be heard on instagram live if they are nearby
    If false, only the person who is live will be heard

    If true, allow nearby players to listen to phone calls if speaker is enabled
    If false, only the people in the call will be able to hear each other

    This feature is a work in progress and may not work as intended. It may have an impact on performance.
]]


Config.Voice.RecordNearby = true --[[
    Should video recordings include nearby players?
]]

--[[ PHONE OPTIONS ]] --
Config.Locations = { -- Locations that'll appear in the maps app.
    {
        name = "City Hall",
        position = vector2(-549.6, -196.3),
        description = "Find jobs or change your identity",
        icon = "https://cdn-icons-png.flaticon.com/128/1838/1838419.png",
    },
    {
        name = "St Thomas",
        position = vector2(359.0, -607.0),
        icon = "https://cdn-icons-png.flaticon.com/128/2749/2749678.png",
    },
    {
        name = "Legion",
        position = vector2(200.0, -1000.0),
        icon = "https://cdn-icons-png.flaticon.com/128/1828/1828884.png"
    },
    {
        name = "Simeons",
        position = vector2(-40.0, -1113.0),
        icon = "https://cdn-icons-png.flaticon.com/128/3097/3097180.png"
    },
    {
        name = "Job Centre",
        position = vector2(-258.0, -977.0),
        icon = "https://cdn-icons-png.flaticon.com/128/870/870124.png"
    },
    {
        name = "Arena",
        position = vector2(-250.0, -2031.0),
        icon = "https://cdn-icons-png.flaticon.com/128/6941/6941697.png"
    },
    {
        name = "Bennys",
        position = vector2(-204.0, -1307.0),
        icon = "https://cdn-icons-png.flaticon.com/128/1995/1995470.png"
    },
    {
        name = "Bank of England",
        position = vector2(228.0, 213.0),
        icon = "https://cdn-icons-png.flaticon.com/128/2830/2830284.png"
    },
    {
        name = "Santander",
        position = vector2(316.0, -274.0),
        icon = "https://cdn-icons-png.flaticon.com/128/2830/2830284.png"
    },
    {
        name = "Fleeca",
        position = vector2(-2968.0, 483.0),
        icon = "https://cdn-icons-png.flaticon.com/128/2830/2830284.png"
    },
    {
        name = "Ranch",
        position = vector2(1307.0, 1104.0),
        icon = "https://cdn-icons-png.flaticon.com/128/5445/5445001.png"
    },
    {
        name = "Casino",
        position = vector2(922.0, 520.0),
        icon = "https://cdn-icons-png.flaticon.com/128/1055/1055814.png"
    },
    {
        name = "Stage",
        position = vector2(677.0, 560.0),
        icon = "https://cdn-icons-png.flaticon.com/128/9104/9104968.png"
    },
    {
        name = "Pier",
        position = vector2(-1800.0, -1187.0),
        icon = "https://cdn-icons-png.flaticon.com/128/9096/9096011.png"
    },
    {
        name = "Sandy Airfield",
        position = vector2(1771.0, 3297.0),
        icon = "https://cdn-icons-png.flaticon.com/128/2084/2084175.png"
    },
    {
        name = "Trevor's Airfield",
        position = vector2(2105.0, 4795.0),
        icon = "https://cdn-icons-png.flaticon.com/128/2084/2084175.png"
    },
    {
        name = "Vespucci Police Station",
        position = vector2(-1069.0, -800.0),
        icon = "https://cdn-icons-png.flaticon.com/128/1138/1138048.png"
    },
    {
        name = "Mission Row Police Station",
        position = vector2(400.0, -1000.0),
        icon = "https://cdn-icons-png.flaticon.com/128/1138/1138048.png"
    },
    {
        name = "Sandy Police Station",
        position = vector2(1869.0, 3696.0),
        icon = "https://cdn-icons-png.flaticon.com/128/1138/1138048.png"
    },
    {
        name = "Sandy Hospital",
        position = vector2(1833.0, 3661.0),
        icon = "https://cdn-icons-png.flaticon.com/128/2895/2895071.png"
    },
    {
        name = "Paleto Police Station",
        position = vector2(-477.0, 6027.0),
        icon = "https://cdn-icons-png.flaticon.com/128/1138/1138048.png"
    },
    {
        name = "Paleto Hospital",
        position = vector2(-256.0, 6346.0),
        icon = "https://cdn-icons-png.flaticon.com/128/2895/2895071.png"
    },
    {
        name = "Knife Store",
        position = vector2(190.0, -1111.0),
        icon = "https://cdn-icons-png.flaticon.com/128/2872/2872617.png"
    },
    {
        name = "Small Arms",
        position = vector2(-1490,-199.0),
        icon = "https://cdn-icons-png.flaticon.com/128/3836/3836742.png"
    },
    {
        name = "Large Arms",
        position = vector2(-1100.0, 4960.0),
        icon = "https://cdn-icons-png.flaticon.com/128/886/886645.png"
    },
    {
        name = "Rebel",
        position = vector2(1474.0, 6359.0),
        icon = "https://cdn-icons-png.flaticon.com/128/3863/3863108.png"
    },
    {
        name = "Mineral Trader",
        position = vector2(1220.0, -2993.0),
        icon = "https://cdn-icons-png.flaticon.com/128/6774/6774980.png"
    },
    {
        name = "Gold Gather",
        position = vector2(-609.0, 2113.0),
        icon = "https://cdn-icons-png.flaticon.com/128/1473/1473504.png"
    },
    {
        name = "Gold Process",
        position = vector2(2711.0, 1520.0),
        icon = "https://cdn-icons-png.flaticon.com/128/1473/1473504.png"
    },
    {
        name = "Copper Gather",
        position = vector2(1918.0, 3289.0),
        icon = "https://cdn-icons-png.flaticon.com/128/9048/9048601.png"
    },
    {
        name = "Copper Process",
        position = vector2(864.0, 2167.0),
        icon = "https://cdn-icons-png.flaticon.com/128/9048/9048601.png"
    },
    {
        name = "Limestone Gather",
        position = vector2(2957.0, 2787.0),
        icon = "https://cdn-icons-png.flaticon.com/128/6224/6224567.png"
    },
    {
        name = "Limestone Process",
        position = vector2(2928.1, 4304.5),
        icon = "https://cdn-icons-png.flaticon.com/128/6224/6224567.png"
    },
    {
        name = "Weed Gather",
        position = vector2(2218.0, 5596.0),
        icon = "https://cdn-icons-png.flaticon.com/128/5433/5433954.png"
    },
    {
        name = "Weed Process",
        position = vector2(2844.0, 4489.0),
        icon = "https://cdn-icons-png.flaticon.com/128/5433/5433954.png"
    },
    {
        name = "Coke Gather",
        position = vector2(1543.0, 1724.0),
        icon = "https://cdn-icons-png.flaticon.com/128/4612/4612345.png"
    },
    {
        name = "Coke Process",
        position = vector2(345.0, 3409.0),
        icon = "https://cdn-icons-png.flaticon.com/128/4612/4612345.png"
    },
    {
        name = "Meth Gather",
        position = vector2(1551.0, 2151.0),
        icon = "https://cdn-icons-png.flaticon.com/128/2464/2464317.png"
    },
    {
        name = "Meth Process",
        position = vector2(1392.0, 3603.0),
        icon = "https://cdn-icons-png.flaticon.com/128/2464/2464317.png"
    },
    {
        name = "Weed Trader",
        position = vector2(106.0, -1937.0),
        icon = "https://cdn-icons-png.flaticon.com/128/2464/2464317.png"
    },
    {
        name = "Coke Trader",
        position = vector2(88.0, -1298.0),
        icon = "https://cdn-icons-png.flaticon.com/128/4612/4612345.png"
    },
    {
        name = "Meth Trader",
        position = vector2(-553.0, 5326.0),
        icon = "https://cdn-icons-png.flaticon.com/128/2464/2464317.png"
    },
    {
        name = "Heroin Trader",
        position = vector2(3580.0, 3662.0),
        icon = "https://cdn-icons-png.flaticon.com/128/1685/1685848.png"
    },
    {
        name = "Heroin Mine",
        position = vector2(2304.9, 5135.8),
        icon = "https://cdn-icons-png.flaticon.com/128/1685/1685848.png"
    },
    {
        name = "Heroin Processing",
        position = vector2(1580.9, 3581.8),
        icon = "https://cdn-icons-png.flaticon.com/128/1685/1685848.png"
    },
    {
        name = "Diamond Mine",
        position = vector2(382.5, 2893.7),
        icon = "https://cdn-icons-png.flaticon.com/128/408/408472.png"
    },
    {
        name = "Diamond Processing",
        position = vector2(2645.3, 2814.1),
        icon = "https://cdn-icons-png.flaticon.com/128/408/408472.png"
    },
    {
        name = "LSD Harvest",
        position = vector2(5382.7, -5251.4),
        icon = "https://cdn-icons-png.flaticon.com/128/4612/4612518.png"
    },
    {
        name = "LSD Processing",
        position = vector2(-2087.8, 2630.2),
        icon = "https://cdn-icons-png.flaticon.com/128/4612/4612518.png"
    },
    {
        name = "LSD Refinery",
        position = vector2(481.5, -3254.2),
        icon = "https://cdn-icons-png.flaticon.com/128/4612/4612518.png"
    },
}

Config.Locales = { -- languages that the player can choose from when setting up a phone [Check the docs to see which languages the phone supports]
    {
        locale = "en",
        name = "English"
    },
    {
        locale = "de",
        name = "Deutsch"
    },
    {
        locale = "fr",
        name = "Français"
    },
    {
        locale = "es",
        name = "Español"
    },
    {
        locale = "nl",
        name = "Nederlands"
    },
    {
        locale = "dk",
        name = "Dansk"
    },
    {
        locale = "no",
        name = "Norsk"
    },
    {
        locale = "th",
        name = "ไทย"
    },
    {
        locale = "ar",
        name = "عربي"
    },
    {
        locale = "ru",
        name = "Русский"
    },
    {
        locale = "cs",
        name = "Czech"
    },
    {
        locale = "sv",
        name = "Svenska"
    },
    {
        locale = "pl",
        name = "Polski"
    },
    {
        locale = "hu",
        name = "Magyar"
    },
    {
        locale = "tr",
        name = "Türkçe"
    },
    {
        locale = "pt-br",
        name = "Português (Brasil)"
    },
    {
        locale = "it",
        name = "Italiano"
    }
}


Config.DefaultLocale = "en"
Config.DateLocale = "en-GB" -- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat

Config.FrameColor = "#39334d" -- This is the color of the phone frame. Default (#39334d) is SILVER.
Config.AllowFrameColorChange = true -- Allow players to change the color of their phone frame?

Config.PhoneNumber = {}
Config.PhoneNumber.Format = "{13}" -- Don't touch unless you know what you're doing. IMPORTANT: The sum of the numbers needs to be equal to the phone number length
Config.PhoneNumber.Length = 11 -- This is the length of the phone number WITHOUT the prefix.
Config.PhoneNumber.Prefixes = { -- These are the first numbers of the phone number, usually the area code.
    "07"
}

Config.Battery = {} -- WITH THESE SETTINGS, A FULL CHARGE WILL LAST AROUND 2 HOURS.
Config.Battery.Enabled = false -- Enable battery on the phone, you'll need to use the exports to charge it.
Config.Battery.ChargeInterval = { 5, 10 } -- How much battery
Config.Battery.DischargeInterval = { 50, 60 } -- How many seconds for each percent to be removed from the battery
Config.Battery.DischargeWhenInactiveInterval = { 80, 120 } -- How many seconds for each percent to be removed from the battery when the phone is inactive
Config.Battery.DischargeWhenInactive = true -- Should the phone remove battery when the phone is closed?

Config.CurrencyFormat = "£%s" -- ($100) Choose the formatting of the currency. %s will be replaced with the amount.
Config.MaxTransferAmount = 500000000 -- The maximum amount of money that can be transferred at once via wallet / messages.

Config.EnableMessagePay = true -- Allow players to pay other players via messages?
Config.EnableVoiceMessages = true -- Allow players to send voice messages?

Config.CityName = "London" -- The name that's being used in the weather app etc.
Config.RealTime = true -- if true, the time will use real life time depending on where the user lives, if false, the time will be the ingame time.

Config.EmailDomain = "xtrastudios.net"

Config.DeleteMessages = false -- allow players to delete messages in the messages app?

Config.SyncFlash = true -- should flashlights be synced across all players? May have an impact on performance
Config.EndLiveClose = true -- should IG live end when you close the phone?
Config.AllowExternal = { -- allow people to upload external images? (note: this means they can upload nsfw / gore etc)
    Twitter = false, -- set to true to enable external images on that specific app, set to false to disable it.
    Instagram = false,
    Tinder = false,
    TikTok = false,
    YellowPages = false,
    MarketPlace = false,
    Mail = false,
    Messages = false,
    Other = false, -- other apps that don't have a specific setting (ex: setting a profile picture for a contact, backgrounds for the phone etc)
}

Config.AutoBackup = true -- should the phone automatically create a backup when you get a new phone?

Config.PhoneModel = `lb_phone_prop` -- the prop of the phone, if you want to use a custom phone model, you can change this here
Config.PhoneRotation = vector3(0.0, 0.0, 180.0) -- the rotation of the phone when attached to a player
Config.PhoneOffset = vector3(0.0, -0.005, 0.0) -- the offset of the phone when attached to a player

Config.Post = {} -- What apps should send posts to discord? You can set your webhooks in server/webhooks.lua
Config.Post.Twitter = true -- New tweets
Config.Post.Instagram = true -- New posts
Config.Post.Accounts = {
    Birdy = {
        Username = "Birdy",
        Avatar = "https://cdn.discordapp.com/attachments/1032954560844660756/1112361465438031882/Birdy.png"
    },
    InstaPic = {
        Username = "InstaPic",
        Avatar = "https://cdn.discordapp.com/attachments/1032954560844660756/1112361465219911730/InstaPic.png"
    }
}

Config.TwitterTrending = {}
Config.TwitterTrending.Enabled = true -- show trending hashtags?
Config.TwitterTrending.Reset = 7 * 24 -- How often should trending hashtags be reset on twitter? (in hours)

Config.TwitterNotifications = false -- should everyone get a notification when someone tweets?

Config.PromoteTwitter = {}
Config.PromoteTwitter.Enabled = false -- should you be able to promote tweets?
Config.PromoteTwitter.Cost = 2500 -- how much does it cost to promote a tweet?
Config.PromoteTwitter.Views = 100 -- how many views does a promoted tweet get?

Config.TikTok = {}
Config.TikTok.TTS = {
    {"English (US) - Female", "en_us_001"},
    {"English (US) - Male 1", "en_us_006"},
    {"English (US) - Male 2", "en_us_007"},
    {"English (US) - Male 3", "en_us_009"},
    {"English (US) - Male 4", "en_us_010"},

    {"English (UK) - Male 1", "en_uk_001"},
    {"English (UK) - Male 2", "en_uk_003"},

    {"English (AU) - Female", "en_au_001"},
    {"English (AU) - Male", "en_au_002"},

    {"French - Male 1", "fr_001"},
    {"French - Male 2", "fr_002"},

    {"German - Female", "de_001"},
    {"German - Male", "de_002"},

    {"Spanish - Male", "es_002"},

    {"Spanish (MX) - Male", "es_mx_002"},

    {"Portuguese (BR) - Female 2", "br_003"},
    {"Portuguese (BR) - Female 3", "br_004"},
    {"Portuguese (BR) - Male", "br_005"},

    {"Indonesian - Female", "id_001"},

    {"Japanese - Female 1", "jp_001"},
    {"Japanese - Female 2", "jp_003"},
    {"Japanese - Female 3", "jp_005"},
    {"Japanese - Male", "jp_006"},

    {"Korean - Male 1", "kr_002"},
    {"Korean - Male 2", "kr_004"},
    {"Korean - Female", "kr_003"},

    {"Ghostface (Scream)", "en_us_ghostface"},
    {"Chewbacca (Star Wars)", "en_us_chewbacca"},
    {"C3PO (Star Wars)", "en_us_c3po"},
    {"Stitch (Lilo & Stitch)", "en_us_stitch"},
    {"Stormtrooper (Star Wars)", "en_us_stormtrooper"},
    {"Rocket (Guardians of the Galaxy)", "en_us_rocket"},

    {"Singing - Alto", "en_female_f08_salut_damour"},
    {"Singing - Tenor", "en_male_m03_lobby"},
    {"Singing - Sunshine Soon", "en_male_m03_sunshine_soon"},
    {"Singing - Warmy Breeze", "en_female_f08_warmy_breeze"},
    {"Singing - Glorious", "en_female_ht_f08_glorious"},
    {"Singing - It Goes Up", "en_male_sing_funny_it_goes_up"},
    {"Singing - Chipmunk", "en_male_m2_xhxs_m03_silly"},
    {"Singing - Dramatic", "en_female_ht_f08_wonderful_world"}
}

Config.ICEServers = false -- ICE Servers for WebRTC (ig live, facetim). If you don't know what you're doing, leave this as false.

Config.Crypto = {}
Config.Crypto.Coins = {"bitcoin","ethereum","tether","binancecoin","usd-coin","ripple","binance-usd","cardano","dogecoin","solana","shiba-inu","polkadot","litecoin","bitcoin-cash"}
Config.Crypto.Currency = "usd" -- currency to use for crypto prices. https://api.coingecko.com/api/v3/simple/supported_vs_currencies
Config.Crypto.Refresh = 5 * 60 * 1000 -- how often should the crypto prices be refreshed (client cache)? (Default 5 minutes)
Config.Crypto.QBit = true -- support QBit? (requires qb-crypto & qb-core)

Config.KeyBinds = {
    -- Find keybinds here: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    Open = { -- toggle the phone
        Command = "phone",
        Bind = "K",
        Description = "Open your phone"
    },
    Focus = { -- keybind to toggle the mouse cursor.
        Command = "togglePhoneFocus",
        Bind = "LMENU",
        Description = "Toggle cursor on your phone"
    },
    StopSounds = { -- in case the sound would bug out, you can use this command to stop all sounds.
        Command = "stopSounds",
        Bind = false,
        Description = "Stop all phone sounds"
    },

    FlipCamera = {
        Command = "flipCam",
        Bind = "UP",
        Description = "Flip phone camera"
    },
    TakePhoto = {
        Command = "takePhoto",
        Bind = "RETURN",
        Description = "Take a photo / video"
    },
    ToggleFlash = {
        Command = "toggleCameraFlash",
        Bind = "E",
        Description = "Toggle flash"
    },
    LeftMode = {
        Command = "leftMode",
        Bind = "LEFT",
        Description = "Change mode"
    },
    RightMode = {
        Command = "rightMode",
        Bind = "RIGHT",
        Description = "Change mode"
    },

    AnswerCall = {
        Command = "answerCall",
        Bind = "RETURN",
        Description = "Answer incoming call"
    },
    DeclineCall = {
        Command = "declineCall",
        Bind = "BACK",
        Description = "Decline incoming call"
    },
    UnlockPhone = {
        Bind = "SPACE",
        Description = "Open your phone",
    },
}

Config.KeepInput = true -- keep input when nui is focused (meaning you can walk around etc)

--[[ PHOTO / VIDEO OPTIONS ]] --
-- Set your api keys in lb-phone/server/apiKeys.lua
Config.UploadMethod = {}
-- You can edit the upload methods in lb-phone/shared/upload.lua
Config.UploadMethod.Video = "Discord" -- or "Imgur" or "Custom"
Config.UploadMethod.Image = "Discord" -- or "Imgur" or "Custom
Config.UploadMethod.Audio = "Discord" -- or "Custom"

Config.Video = {}
Config.Video.Bitrate = 400 -- video bitrate (kbps)
Config.Video.FrameRate = 24 -- video framerate (fps)
Config.Video.MaxSize = 25 -- max video size (MB)
Config.Video.MaxDuration = 60 -- max video duration (seconds)