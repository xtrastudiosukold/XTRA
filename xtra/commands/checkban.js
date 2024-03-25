var AsciiTable = require('ascii-table');
const Discord = require('discord.js');
const fs = require('fs');

exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0] || !parseInt(params[0])) {
        let embed = {
            "title": "An Error Occurred",
            "description": "Incorrect Usage\n\nCorrect Usage" + process.env.PREFIX + '\n`!checkban [permid]`',
            "color": 0x57F288,
    }
    return message.channel.send({ embed })
    }
    fivemexports.xtra.execute("SELECT * FROM `xtra_users` WHERE id = ?", [params[0]], (result) => {
        if (result.length > 0) {
            if (result[0].banned) {
                let baninfo = result[0].baninfo
                if (baninfo == null) {
                    baninfo = "No ban info provided"
                }
                var banExpires = new Date(result[0].bantime * 1000)
                if (banExpires == "Invalid Date") {
                    banExpires = "Never"
                }
                var embed = {
                    "title": `Checking Ban Status for ${result[0].username}`,
                    "description": `Ban Status: **${result[0].banned}**\nPlayer Name: **${result[0].username}**\nPlayer PermID: **${result[0].id}**\nBan Reason: **${result[0].banreason}**\nBan Expires: **${banExpires}**\nBan Admin: **${result[0].banadmin}**\nBan Info: **${result[0].baninfo}**`,
                    "color": settingsjson.settings.botColour,
                    "footer": {
                        "text": ""
                    },
                    "timestamp": new Date()
                }
            }
            else{
                var embed = {
                    "title": `Checking Ban Status for ${result[0].username}`,
                    "description": `Ban Status: **${result[0].banned}**\nPlayer Name: **${result[0].username}**\nPlayer PermID: **${result[0].id}**`,
                    "color": settingsjson.settings.botColour,
                    "footer": {
                        "text": ""
                    },
                    "timestamp": new Date()
                }
            }
            message.channel.send({embed})
        }
    });
}

exports.conf = {
    name: "checkban",
    perm: 1,
    guild: "1195851569472741437",
    support: true,
}