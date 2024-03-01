const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    message.channel.send("To find your FiveM log files navigate to this directory:\n`%localappdata%/FiveM/FiveM.app/logs`")
}

exports.conf = {
    name: "logs",
    perm: 0,
    guild: "1195851569472741437"
}