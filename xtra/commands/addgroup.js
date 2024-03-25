const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0] || !parseInt(params[0]) || !params[1]) {
        let embed = {
            "title": "An Error Occurred",
            "description": "Incorrect Usage\n\nCorrect Usage" + process.env.PREFIX + '\n`!addgroup [permid] [group name]`',
           "color": 0x57F288,
        }
    return message.channel.send({ embed })
    }
    fivemexports.xtra.execute("SELECT * FROM `xtra_user_data` WHERE user_id = ?", [params[0]], (result) => {
        if (result.length > 0) {
            let dvalue = JSON.parse(result[0].dvalue)
            let groups = dvalue.groups
            groups[params[1]] = true;
            fivemexports.xtra.execute("UPDATE `xtra_user_data` SET dvalue = ? WHERE user_id = ?", [JSON.stringify(dvalue), params[0]])
        }
    })
    let embed = {
        "title": "Added Group",
        "description": `\nPerm ID: **${params[0]}**\nGroup Name: **${params[1]}**\n\nAdmin: <@${message.author.id}>`,
        "color": settingsjson.settings.botColour,
        "footer": {
            "text": ""
        },
        "timestamp": new Date()
    }
    message.channel.send({ embed })
}

exports.conf = {
    name: "addgroup",
    perm: 6,
    guild: "1195851569472741437"
}