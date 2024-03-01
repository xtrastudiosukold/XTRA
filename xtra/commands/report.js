const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    message.channel.send('You can report a player on our forums over at: https://xtrastudios.com/forums/index.php?/forum/12-report-a-player/')
}

exports.conf = {
    name: "report",
    perm: 0,
    guild: "1195851569472741437"
}