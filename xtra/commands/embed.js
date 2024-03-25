const resourcePath = global.GetResourcePath ?
global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
message.delete()
if (!params[0] || !params[1]) {
    let embed = {
            "title": "An Error Occurred",
            "description": "Incorrect Usage\n\nCorrect Usage" + process.env.PREFIX + '\n`!embed [title] [description]`',
            "color": 0x57F288,
    }
    return message.channel.send({ embed })
}
else {
    let embed = {
        "title": `${params[0]}`,
        "description": `${params.join(' ').replace(params[0], '')}`,
        "color": settingsjson.settings.botColour,
        "footer": {
            "text": "XTRA"
        },
        "timestamp": new Date()
    }
    message.channel.send( { embed })
}
}

exports.conf = {
name: "embed",
perm: 1,
guild: "1195851569472741437"
}
