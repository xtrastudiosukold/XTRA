const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = async(fivemexports, client, message, params) => {
    message.delete()
    if (!params[0] && !parseInt(params[0])) {
        let embed = {
            "title": "An Error Occurred",
            "description": "Incorrect Usage\n\nCorrect Usage" + process.env.PREFIX + '\n`!userinfo [permid]`',
            "color": 0x57F288,
    }
    return message.channel.send({ embed })
    }
    
    let bank = undefined;
    let bandata = "";
    let discord = "";
    let povlisttrue = "";
    var lastlogin = [];
    let time = "";
    let date = "";

    fivemexports.xtra.execute("SELECT * FROM `xtra_user_ids` WHERE user_id = ?", [params[0]], (discordid) => {
        if (discordid.length > 0) {
            for (i = 0; i < discordid.length; i++) {
                if (discordid[i].identifier.includes('discord')) {
                    discord = `<@${discordid[i].identifier.split(":")[1]}>`;
                }
            }
        }
        fivemexports.xtra.execute("SELECT * FROM xtra_user_moneys WHERE user_id = ?", [params[0]], (result) => {
            if (result) {
                bank = result[0].bank
                wallet = result[0].wallet
                fivemexports.xtra.execute("SELECT * FROM `xtra_users` WHERE id = ?", [params[0]], (userdata) => {
                    if (userdata) {
                        if (userdata[0].banned == 1) {
                            if (userdata[0].bantime == "perm"){
                                bandata = `Banned: True\n\nReason(s): ${userdata[0].banreason}\n\nAdmin: ${userdata[0].banadmin}\n\nBan Expires: Never`
                            }
                            else {
                                bandata = `Banned: True\n\nReason(s): ${userdata[0].banreason}\n\nAdmin: ${userdata[0].banadmin}\n\nBan Expires: ${new Date(userdata[0].bantime * 1000)}`
                            }
                        }
                        fivemexports.xtra.execute("SELECT * FROM `xtra_user_data` WHERE user_id = ?", [params[0]], (result) => {
                            if (result.length > 0) {
                                obj = JSON.parse(result[0].dvalue).groups
                                groups = (JSON.stringify(Object.keys(obj)).replace(/"/g, '').replace('[', '').replace(']', '')).replace(/,/g, ', ')
                                hours = JSON.stringify(JSON.parse(result[0].dvalue).PlayerTime/60) 
                                if (groups.includes('pov')) {
                                    povlisttrue = '**User is on POV List.**'
                                }
                            } 
                        fivemexports.xtra.execute("SELECT * FROM `xtra_users` WHERE id = ?", [params[0]], (result) => {
                            if (result) {
                                lastlogin = result[0].last_login.split(" ")
                                time = lastlogin[0]
                                date = lastlogin[1]
                            }
                        let embed = {
                            "title": "User Info",
                            "description": `${povlisttrue}\n\n**Perm ID: **${params[0]}**\nBank Balance: **${bank}**\nDiscord:** ${discord}\n**Last Login: **${date} at ${time}\n**Hours:** ${Math.round(hours)}\n\n${bandata}`,
                            "color": settingsjson.settings.botColour,
                            "footer": {
                                "text": ""
                            },
                            "timestamp": new Date()
                        }
                        message.channel.send({ embed })
                        })
                    })
                    }
                })
            }
        })
    })
}

exports.conf = {
    name: "userinfo",
    perm: 1,
    guild: "1195851569472741437"
}