const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0] || !parseInt(params[0]) || !params[1]) {
        let embed = {
            "title": "An Error Occurred",
            "description": "Incorrect Usage\n\nCorrect Usage" + process.env.PREFIX + "\n`!addbaninfo [user-id] [info]`",
            "color": 0x57F288,
        }
        return message.channel.send({ embed })
    }
    baninfo = params.join(' ').replace(params[0], '')
    fivemexports.xtra.execute("UPDATE `xtra_users` SET baninfo = ? WHERE id = ?", [baninfo, params[0]])
    let embed = {
        "title": "Added Baninfo",
        "description": `\nPerm ID: **${params[0]}**\nBan Info: **${baninfo}**\n\nAdmin: <@${message.author.id}>`,
        "color": settingsjson.settings.botColour,
        "footer": {
            "text": ""
        },
        "timestamp": new Date()
    }
    message.channel.send({ embed })
}

exports.conf = {
    name: "addbaninfo",
    perm: 1,
    guild: "1195851569472741437"
}