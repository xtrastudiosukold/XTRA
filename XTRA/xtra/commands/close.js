const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    if (!params || params.length < 2) {
        return message.reply('Invalid args! Correct term is: ' + process.env.PREFIX + 'close [reportid] [notes]');
    }
    
    const reportid = params[0];
    const notes = params.slice(1).join(' ');

    fivemexports.xtra.execute("SELECT * FROM cardevs WHERE userid = ?", [message.author.id], (user) => {
        if (user.length === 0) {
            return message.reply("You are not authorized to use this command.");
        }

        if (user[0].currentreport == reportid) {
            fivemexports.xtra.execute("SELECT * FROM cardev WHERE reportid = ?", [reportid], (result) => {
                if (result.length === 0) {
                    return message.reply("Report not found.");
                }

                fivemexports.xtra.execute("UPDATE cardev SET completed = 1, notes = ? WHERE reportid = ?", [notes, reportid]);
                fivemexports.xtra.execute("UPDATE cardevs SET reportscompleted = ?, currentreport = ? WHERE userid = ?", [user[0].reportscompleted + 1, 0, message.author.id]);

                const embed = {
                    "title": "Car Report Closed",
                    "description": `Car Report **${reportid}** Has Been Closed`,
                    "color": settingsjson.settings.botColour,
                    "footer": {
                        "text": ""
                    },
                    "timestamp": new Date()
                }
                message.channel.send({ embed });

                const dmClose = {
                    "title": "Car Report Closed",
                    "description": `Car Report **${reportid}** Has Been Closed\n\nChanges: **${notes}**\n\n*Feel Free To Submit Another Report If Needed*`,
                    "color": settingsjson.settings.botColour,
                    "footer": {
                        "text": "XTRA"
                    },
                    "timestamp": new Date()
                }
                message.client.fetchUser(result[0].reporter)
                .then(user => {
                  user.send({ embed: dmClose })
                    .catch(error => console.error(`Error sending DM: ${error}`));
                })
                .catch(error => console.error(`Error fetching user: ${error}`));                // Assuming 'message.send' is a typo and you meant 'client.users.cache.get(result[0].reporter).send'
                //client.author.send(result[0].reporter).send(`Car Report **ID ${reportid}** Has Been Closed\n\nChanges: **${notes}**\n\n*Feel Free To Submit Another Report If Needed*`);
            });
        } else {
            const embed = {
                "title": "Car Report",
                "description": `You Are Not Assigned To This Report`,
                "color": settingsjson.settings.botColour,
                "footer": {
                    "text": ""
                },
                "timestamp": new Date()
            }
            message.channel.send({ embed });
        }
    });
}


exports.conf = {
    name: "close",
    perm: 0,
    guild: "1195851569472741437"
}