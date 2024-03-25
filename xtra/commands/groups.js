const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0]) {
        let embed = {
            "title": "An Error Occurred",
            "description": "Incorrect Usage\n\nCorrect Usage" + process.env.PREFIX + '\n`!groups [permid]`',
            "color": 0x57F288,
    }
    return message.channel.send({ embed })
    }
    fivemexports.xtra.execute("SELECT * FROM `xtra_user_data` WHERE user_id = ?", [params[0]], (result) => {
        if (result.length > 0) {
            obj = JSON.parse(result[0].dvalue).groups
            if (Object.entries(obj).length > 0) {
                let embed = {
                    "title": `**User Groups** ${params[0]}`,
                    "description": `**Success**! Groups have been fetched for User ID: ***${params[0]}***`,
                    "color": settingsjson.settings.botColour,
                    "fields": [
                        {
                            name: '**Perm ID:**',
                            value: `${params[0]}`,
                        },
                        {
                            name: '**Groups:**',
                            value: `${(JSON.stringify(Object.keys(obj)).replace(/"/g, '').replace('[', '').replace(']', '')).replace(/,/g, ', ')}`,
                        }
                    ],
                    "footer": {
                        "text": ""
                    },
                    "timestamp": new Date()
                }
                message.channel.send({ embed })
            } else {
                message.reply('No groups for this user.')
            }
        } else {
            message.reply('No groups for this user.')
        }
    });
}

exports.conf = {
    name: "groups",
    perm: 5,
    guild: "1195851569472741437"
}