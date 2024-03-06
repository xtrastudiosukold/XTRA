let bannedPlayers = 0
let totalBans = 0
let totalKicks = 0
let totalWarns = 0
let totalACBans = 0

exports.runcmd = (fivemexports, client, message, params) => {
    fivemexports.xtra.execute("SELECT * FROM xtra_users WHERE banned = 1", (bannedPlayers) => {
    fivemexports.xtra.execute("SELECT * FROM xtra_anticheat", (totalACBans) => {
    let embed = {
        "title": "Punishment Statistics",
        "description": `Currently Banned:\n - Anticheat Banned: **${totalACBans.length}** \n - Staff Banned: **${bannedPlayers.length-totalACBans.length}** \n - Total Banned: **${bannedPlayers.length}**\n\nAdmin: <@${message.author.id}>`,        
        "color": settingsjson.settings.botColour,
        "footer": {
            "text": ""
        },
        "timestamp": new Date()
    }
    message.channel.send({ embed })
    }) })
}

exports.conf = {
    name: "punishments",
    perm: 7,
    guild: "1195851569472741437"
}