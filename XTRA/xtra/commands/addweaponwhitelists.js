const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0] || !parseInt(params[0]) || !params[1] || !params[2] || !params[3] || !parseInt(params[4]) || !params[5] || !params[6] ) {
        let embed = {
            "title": "An Error Occurred",
            "description": "Incorrect Usage\n\nCorrect Usage" + process.env.PREFIX + '\n`!addweaponwhitelists [permid] [Weapon name] [Weapon Spawncode] [Weapon price] [Weapon Category] [Is weapon owner]`',
            "color": 0x9c5cb4,
        }
        return message.channel.send({ embed })
    }
    let name = (params[1] + " " + params[2])
    let owner = ''
    fivemexports.xtra.execute("INSERT INTO xtra_weapon_whitelists (user_id, name, gunhash, price, category, owner) VALUES(?, ?,?,?,?,?)", [params[0], name, params[3], params[4], params[5], params[6]], (result) => {
        if (result) {
            if (params[6] == 1) {
                owner = 'True'
            }
            else {
                owner = 'False'
            }
            let embed = {
                "title": "Added Whitelist",
                "description": `\n**Perm ID:** ${params[0]}\n**Weapon Name:** ${name} \n **Weapon hash:** ${params[3]} \n **Weapon Price:** ${params[4]} \n **Weapon Category: **${params[5]} \n **Weapon Owner:** ${owner} \n\n**Admin:** <@${message.author.id}>\n **This may be temermental if it dosnt work messag lv#5770**`,
                "color": settingsjson.settings.botColour,
                "footer": {
                    "text": ""
                },
                "timestamp": new Date()
            }
            message.channel.send({ embed })
        } else {
            let embed = {
                "title": "Failed to add whitelist ",
                "description": `PermID: **${params[0]}** already owns **${name}**`,
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

exports.conf = {
    name: "addweaponwhitelists",
    perm: 7,
    guild: "1195851569472741437",
    support: true
}