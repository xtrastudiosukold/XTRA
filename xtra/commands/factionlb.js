var AsciiTable = require('ascii-table');
const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    fivemexports.xtra.execute("SELECT * FROM xtra_police_hours ORDER BY total_hours DESC", [], (result) => {
        var policeHoursLB = []
        if (result) {
            for (i = 0; i < result.length; i++) {
                if (i < 10) {
                    policeHoursLB.push(`\n${i+1}. ${result[i].username}(${result[i].user_id}) - ${result[i].total_hours.toFixed(2)} hours`)
                }
            }
            let embed = {
                "title": `MET Police Leaderboard`,
                "description": '```'+policeHoursLB.join('').replace(',', '')+'```',
                "color": 0x3498db,
            }
            message.channel.send({embed})
        }
    })
}

exports.conf = {
    name: "lb",
    perm: 0,
    guild: "1134592077808812105",
    guild: "1162523339085070497",
    guild: "1162523282801696910"
}