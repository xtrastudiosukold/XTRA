const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0]) {
        return message.reply('Invalid args! Correct term is: ' + process.env.PREFIX + 'carreport [spawncode] [issue]')
    }
    let spawncode = params[0]
    let issue = params.slice(1).join(' ')
    let reporter = message.author.id
    fivemexports.xtra.execute("INSERT INTO cardev (spawncode, issue, reporter, claimed,completed,notes) VALUES(?, ?,?, ?, ?,?)", [spawncode, issue, reporter,false, false, ""], (result) => {
        fivemexports.xtra.execute("SELECT * FROM cardev WHERE reporter = ? AND spawncode = ? AND issue = ?", [message.author.id, spawncode, issue], (result) => {
            let embed = {
                "title": "Car Report Subbmited",
                "description": `Spawn Code: **${spawncode}**\n\nIssue: **${issue}**\n\nReporter: **<@${message.author.id}>**\n\nReport ID: **${result[0].reportid}**\n\n`,
                "color": settingsjson.settings.botColour,
                "footer": {
                    "text": ""
                },
                "timestamp": new Date()
            }
            message.channel.send({ embed })
        })
    });
}

exports.conf = {
    name: "carreport",
    perm: 0,
    guild: "1195851569472741437"
}
