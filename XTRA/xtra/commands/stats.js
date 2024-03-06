const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message) => {
    fivemexports.xtra.execute("SELECT * FROM cardevs WHERE userid = ?", [message.author.id], (user) => {
        if (user) {
           let tickets = user[0].reportscompleted
           let currentreport = user[0].currentreport
           fivemexports.xtra.execute("SELECT * FROM cardevs ORDER BY reportscompleted", [], (lb) => {
                for (i = 0; i < lb.length; i++) {
                    if (lb[i].userid == message.author.id) {
                        var rank = i + 1
                    }
                }
                if (currentreport == 0) {
                    currentreport = "None"
                }
                let embed = {
                    "title": "Car Dev Stats",
                    "description": `Tickets Completed: **${tickets}**\n\nCurrent Report: **${currentreport}**\n\nRank On Leaderboard: **${rank}**\n\n`,
                    "color": settingsjson.settings.botColour,
                    "footer": {
                        "text": ""
                    },
                    "timestamp": new Date()
                }
                message.channel.send({ embed })
           });
        }
    })
}

exports.conf = {
    name: "stats",
    perm: 0,
    guild: "1195851569472741437"
}