const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    let embed = {
        "title": "⚠️ Undergoing Development ⚠️",
        "description": `This server is currently undergoing active development and is not released as of yet. There is no date set for release,`,
        "color": settingsjson.settings.botColour,
        "footer": {
            "text": ""
        },
    }
    message.channel.send({ embed })
}

exports.conf = {
    name: "dev",
    perm: 8,
    guild: "1195851569472741437"
}
