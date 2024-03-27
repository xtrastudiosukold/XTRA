const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    message.channel.send('https://docs.google.com/spreadsheets/d/16_ZTrLHuGxzYdDQpIThnIIg5E8YDvT_iD5sGly5Eeas/edit?usp=sharing')
}

exports.conf = {
    name: "locklist",
    perm: 0,
    guild: "1195851569472741437"
}