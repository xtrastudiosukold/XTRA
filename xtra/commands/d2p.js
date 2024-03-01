const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    if (message.mentions.members.first()) {
        let user = message.mentions.members.first()
        fivemexports.xtra.execute("SELECT user_id FROM `xtra_verification` WHERE discord_id = ?", [user.id], (result) => {
            if (result.length > 0) {
                let embed = {
                    "title": "Discord to Perm ID",
                    "description": `\n**Perm ID: **${result[0].user_id}**\nDiscord: **${[params[0]]}`,
                    "color": settingsjson.settings.botColour,
                    "footer": {
                        "text": ""
                    },
                    "timestamp": new Date()
                }
                message.channel.send({ embed })
            } else {
                message.channel.send('No account is linked for this user.')
            }
        });
    } else {
        message.channel.send('You need to mention someone!')
    }
}

exports.conf = {
    name: "d2p",
    perm: 1,
    guild: "1195851569472741437",
    support: true,
}