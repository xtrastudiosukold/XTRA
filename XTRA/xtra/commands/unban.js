const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0]) {
        let embed = {
            "title": "An Error Occurred",
            "description": "Incorrect Usage\n\nCorrect Usage" + process.env.PREFIX + '\n`!unban [permid]`',
            "color": 0x9c5cb4,
    }
    return message.channel.send({ embed })
    }
    const reason = params.slice(1).join(' ');
    let newval = fivemexports.xtra.xtra('setBanned', [params[0], false])
    let embed = {
        "title": "Unbanned User",
        "description": `\nPerm ID: **${params[0]}**\n\nAdmin: <@${message.author.id}>`,
        "color": settingsjson.settings.botColour,
        "footer": {
            "text": ""
        },
        "timestamp": new Date()
    }
    message.channel.send({ embed })
}

exports.conf = {
    name: "unban",
    perm: 3,
    guild: "1195851569472741437",
    support: true,
}