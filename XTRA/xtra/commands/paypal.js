const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    message.channel.send('https://paypal.me/Marshyboi420')
}

exports.conf = {
    name: "paypal",
    perm: 0,
    guild: "1195851569472741437",
    support: true,
}