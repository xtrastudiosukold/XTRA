var AsciiTable = require('ascii-table');
const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    fivemexports.xtra.execute("SELECT * FROM xtra_police_hours ORDER BY weekly_hours DESC", [], (result) => {
        var policeHoursLB = []
        if (result) {
            for (i = 0; i < result.length; i++) {
                if (i < 10) {
                    policeHoursLB.push(`\n${i+1}. ${result[i].username}(${result[i].user_id}) - ${result[i].weekly_hours.toFixed(2)} hours`)
                }
            }
            let embed = {
                "title": `Met Police Weekly Leaderboard`,
                "description": '```'+policeHoursLB.join('').replace(',', '')+'```',
                "color": 0x3498db,
            }
            message.channel.send({embed})
        }
    })
}

exports.conf = {
    name: "wlb",
    perm: 0,
    guild: "1162517121251692626"
}