const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0] || !parseInt(params[0]) || !params[1]) {
        return message.reply('Incorrect Usage! Correct Usage is: ' + process.env.PREFIX + '\n`!addcar [permid] [spawn code]`')
    }
    fivemexports.xtra.execute("INSERT INTO xtra_user_vehicles (user_id, vehicle) VALUES(?, ?)", [params[0], params[1]], (result) => {
        if (result) {
            let embed = {
                "title": "Added Car",
                "description": `\n**Perm ID: **${params[0]}**\nSpawn Code: **${params[1]}\n\n**Admin:** <@${message.author.id}>`,
                "color": settingsjson.settings.botColour,
                "footer": {
                    "text": ""
                },
                "timestamp": new Date()
            }
            message.channel.send({ embed })
        } else {
            let embed = {
                "title": "Failed to add Car",
                "description": `\n**Perm ID **${params[0]} already owns **${params[1]}**`,
                "color": settingsjson.settings.botColour,
                "footer": {
                    "text": ""
                },
                "timestamp": new Date()
            }
            message.channel.send({ embed })
        }
    })
}

exports.conf = {
    name: "addcar",
    perm: 6,
    guild: "1195851569472741437",
    support: true,
}