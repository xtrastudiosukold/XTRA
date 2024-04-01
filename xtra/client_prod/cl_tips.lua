FRTips = {
    "Watch out, there is more recoil than usual in this city",
    "Support XTRA @ store.xtrastudios.com for some cool VIP perks!",
    "Support XTRA @ store.xtrastudios.com for some cool VIP perks!",
    "Support XTRA @ store.xtrastudios.com for some cool VIP perks!",
    "Support XTRA @ store.xtrastudios.com for some cool VIP perks!",
    "KOS is only allowed at redzones!",
    "You can perform CPR on your dead friends, with a small chance of resuscitation",
    "You sell all legal goods (Copper,Gold etc..) at the Trader which is south of the map near the docks",
    "You can get your GP to take a look at you and restore your health at any Hospital",
    "Check out our Website for whitelisted faction applications, https://discord.gg/xtra5m",
    "Want to join the PD? Apply at https://discord.gg/xtra5m",
    "Use /ooc or // to ask out of character questions",
    "To call an admin, type /calladmin",
    "To report a player you can create a player report at https://discord.gg/xtra5m",
    "You can lock your car with the comma key [,]",
    "If you are experiencing texture loss set your Texture Quality to Normal in graphics settings!",
    "Join our discord for discussion & development news https://discord.gg/xtra5m",
    "Join our discord for discussion & development news https://discord.gg/xtra5m",
    "Join our discord for discussion & development news https://discord.gg/xtra5m",
    "Join our discord for discussion & development news https://discord.gg/xtra5m",
    "Register on our website for discussion and whitelisting applications https://discord.gg/xtra5m",
    "Press F1 for help on getting started, controls & rules",
    "Press F1 for help on getting started, controls & rules",
    "Press F1 for help on getting started, controls & rules",
    "Press F1 for help on getting started, controls & rules",
    "Remember, selling or advertising the sale of anything in out of character chat is not allowed!",
    "Remember, selling or advertising the sale of anything in out of character chat is not allowed!",
    "Remember, selling or advertising the sale of anything in out of character chat is not allowed!",
    "Remember, selling or advertising the sale of anything in out of character chat is not allowed!",
    "Remember, selling or advertising the sale of anything in out of character chat is not allowed!",
    "If you are experiencing persistent texture loss, please use /reset to fix texture bugs",
    "If you are having trouble hearing other players, /vsync will reset your voice communications",
    "If you find yourself stuck in a certain area, as well as /calladmin please attempt the /unstuck command"
}
Citizen.CreateThread(
    function()
        Wait(100000)
        while true do
            math.randomseed(GetGameTimer())
            num = math.random(1, #FRTips)
            TriggerEvent("chatMessage", "", {255, 0, 0}, "^1[XTRA Tips]^1  " .. "^5" .. FRTips[num], "ooc")
            Wait(600000)
        end
    end
)
