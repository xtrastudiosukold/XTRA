const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0] || !parseInt(params[0])) {
        let embed = {
            "title": "An Error Occurred",
            "description": "Incorrect Usage\n\nCorrect Usage" + process.env.PREFIX + '\n`!cleargarage [perm id]`',
            "color": 0x57F288,
    }
    return message.channel.send({ embed })
    }
    fivemexports['xtra'].execute("DELETE FROM xtra_user_vehicles WHERE user_id = ?", [parseInt(params[0])])
    
    let embed = {
        "title": "Cleared Garage",
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
    name: "cleargarage",
    perm: 7,
    guild: "1195851569472741437"
}