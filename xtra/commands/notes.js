
exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0]) {
        let embed = {
            "title": "An Error Occurred",
            "description": "Incorrect Usage\n\nCorrect Usage" + process.env.PREFIX + '\n`!notes [permid]`',
            "color": 0x57F288,
    }
    return message.channel.send({ embed })
    }
    fivemexports.xtra.execute("SELECT * FROM `xtra_user_notes` WHERE user_id = ?", [params[0]], (result) => {
        let notes = ''
        if (result[0].info > 0) {
            let noteInfo = JSON.parse(result[0].info)
            for (i = 0; i < noteInfo.length; i++) { 
                notes = notes + `\nID: ${noteInfo[i].id} ${noteInfo[i].note} (${noteInfo[i].author})`
            }
            let embed = {
                "title": `**Player Notes**`,
                "description": `**Success**! Notes have been fetched for User ID: ***${params[0]}***`,
                "color": settingsjson.settings.botColour,
                "fields": [
                    {
                        name: '**Notes:**',
                        value: notes,
                    }
                ],
                "footer": {
                    "text": ""
                },
                "timestamp": new Date()
            }
            message.channel.send({ embed })
        } else {
            message.reply('User has no notes.')
        }
    });
}

exports.conf = {
    name: "notes",
    perm: 1,
    guild: "1195851569472741437"
}