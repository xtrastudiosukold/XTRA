const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0]) {
        let embed = {
            "title": "An Error Occurred",
            "description": "Incorrect Usage\n\nCorrect Usage" + process.env.PREFIX + '\n`!clearvehicleowners [spawn code]`',
            "color": 0x57F288,
    }
    return message.channel.send({ embed })
    }
    fivemexports.xtra.execute("DELETE FROM `xtra_user_vehicles` WHERE vehicle = ?", [params[0]])
    let embed = {
        "title": `Database Update`,
        "description": `${params[0]} has been deleted from the database.`,
        "color": settingsjson.settings.botColour,
        "footer": {
            "text": ""
        },
        "timestamp": new Date()
    }
    message.channel.send({ embed })
}

exports.conf = {
    name: "clearvehicleowners",
    perm: 7,
    guild: "1195851569472741437"
}