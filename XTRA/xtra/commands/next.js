const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    if (!params) {
        return message.reply('Invalid args! Correct term is: ' + process.env.PREFIX + 'addcar [spawncode] [issue]')
    }
    let spawncode = params[0]
    let issue = params.slice(1).join(' ')
    fivemexports.xtra.execute("SELECT * FROM cardevs WHERE userid = ?", [message.author.id], (user) => {   
        if (user[0].userid == message.author.id) {
            if (!user[0].currentreport == 0) {
                let embed = {
                    "title": "Next Car Report",
                    "description": `Please Complete Or Close Report: **${user[0].currentreport}**\n\n`,
                    "color": settingsjson.settings.botColour,
                    "footer": {
                        "text": ""
                    },
                    "timestamp": new Date()
                }
                message.channel.send({ embed })
            } else {
                fivemexports.xtra.execute("SELECT * FROM cardev WHERE completed = ? AND claimed = ? ORDER BY reportid", [false, false], (report) => {
                    if (report) {
                        fivemexports.xtra.execute("UPDATE cardevs SET currentreport = ? WHERE userid = ?", [report[0].reportid ,message.author.id])
                        fivemexports.xtra.execute("UPDATE cardev SET claimed = ? WHERE reportid = ?", [message.author.id,report[0].reportid])
                        let embed = {
                            "title": "Next Car Report",
                            "description": `Spawn Code: **${report[0].spawncode}**\n\nIssue: **${report[0].issue}**\n\nReporter: **<@${report[0].reporter}>**\n\nReport ID: **${report[0].reportid}**\n\n*When Completed /close [reportid] [changes]*\n\n`,
                            "color": settingsjson.settings.botColour,
                            "footer": {
                                "text": ""
                            },
                            "timestamp": new Date()
                        }
                        message.channel.send({ embed })
                    } else {
                        let embed = {
                            "title": "Next Car Report",
                            "description": `No Reports Available! You Are All Up To Date!`,
                            "color": settingsjson.settings.botColour,
                            "footer": {
                                "text": ""
                            },
                            "timestamp": new Date()
                        }
                        message.channel.send({ embed })
                    }
                })
            }
        } else {
            fivemexports.xtra.execute("INSERT INTO cardevs (userid, reportscompleted, currentreport) VALUES(?, ?, ?)", [message.author.id, 0, 0]);
            fivemexports.xtra.execute("SELECT * FROM cardev WHERE completed = ? AND claimed = ? ORDER BY reportid", [false, false], (report) => {
                if (report) {
                    fivemexports.xtra.execute("UPDATE cardevs SET currentreport = ? WHERE userid = ?", [report[0].reportid ,message.author.id])
                    fivemexports.xtra.execute("UPDATE cardev SET claimed = ? WHERE reportid = ?", [message.author.id,report[0].reportid])
                    let embed = {
                        "title": "Next Car Report",
                        "description": `Spawn Code: **${report[0].spawncode}**\n\nIssue: **${report[0].issue}**\n\nReporter: **<@${report[0].reporter}>**\n\nReport ID: **${report[0].reportid}**\n\n*When Completed /close [reportid] [changes]*\n\n`,
                        "color": settingsjson.settings.botColour,
                        "footer": {
                            "text": ""
                        },
                        "timestamp": new Date()
                    }
                    message.channel.send({ embed })
                } else {
                    let embed = {
                        "title": "Next Car Report",
                        "description": `No Reports Available! You Are All Up To Date!`,
                        "color": settingsjson.settings.botColour,
                        "footer": {
                            "text": ""
                        },
                        "timestamp": new Date()
                    }
                    message.channel.send({ embed })
                }
            })
        }
    })
}


exports.conf = {
    name: "next",
    perm: 0,
    guild: "1195851569472741437"
}