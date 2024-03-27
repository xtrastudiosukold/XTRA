const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0]) {
        let embed = {
            "title": "An Error Occurred",
            "description": "Incorrect Usage\n\nCorrect Usage" + process.env.PREFIX + '\n`!info [permid]`',
            "color": 0x57F288,
    }
    return message.channel.send({ embed })
    }
    fivemexports.xtra.execute("SELECT * FROM `xtra_police_hours` WHERE user_id = ?", [params[0]], (result) => {
        if (result.length > 0) {
            let embed = {
                "title": `**Met Police statistics for ${result[0].username}(${result[0].user_id})**`,
                "color": 0x3498db,
                "fields": [
                    {
                        name: '**Total hours:**',
                        value: `${result[0].total_hours.toFixed(2)}`,
                        inline: true,
                    },
                    {
                        name: '**Total hours this week:**',
                        value: `${result[0].weekly_hours.toFixed(2)}`,
                        inline: true,
                    },
                    {
                        name: '**Last clocked on as:**',
                        value: `${result[0].last_clocked_rank}`,
                        inline: true,
                    },
                    {
                        name: '**Last clocked on date:**',
                        value: `${result[0].last_clocked_date}`,
                        inline: true,
                    },
                    {
                        name: '**Total players jailed this week:**',
                        value: `${result[0].total_players_fined}`,
                        inline: true,
                    },
                    {
                        name: '**Total players fined this week:**',
                        value: `${result[0].total_players_jailed}`,
                        inline: true,
                    },
                ],
            }
            message.channel.send({ embed })
        } else {
            message.reply('No Met Police statistics for this user.')
        }
    })
}

exports.conf = {
    name: "info",
    perm: 0,
    guild: "1162517121251692626"
}