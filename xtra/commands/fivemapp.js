const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    message.channel.send('You can find your FiveM Application Data Directory here `%localappdata%/FiveM/FiveM.app`')
}

exports.conf = {
    name: "fivemapp",
    perm: 0,
    guild: "1195851569472741437"
}