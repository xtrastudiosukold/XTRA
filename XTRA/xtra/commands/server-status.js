const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    message.channel.send('Please check out our status page for the latest information regarding the status of all of our services.\n\nhttps://status.xtrastudios.com/')
}

exports.conf = {
    name: "server-status",
    perm: 0,
    guild: "1195851569472741437"
}