const { time } = require('console');
const Discord = require('discord.js');
const fs = require('fs');
const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

let prevbids = require(resourcePath + '/prevbid.json')

exports.runcmd = (fivemexports, client, message, params) => {
    message.delete()
    if (params[0] == 'end') {
        let embed = {
            "title": `Auction Ended`,
            "description": `${message.author} has ended the auction.\n\n<@${prevbids.prevbidder}> won the auction with a bid of £${prevbids.prevbid.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,')}.`,
            "color": settingsjson.settings.botColour,
            "timestamp": new Date()
        };      
        message.channel.send({embed})
        prevbids.prevbid = 0
        fs.writeFile(`${resourcePath}/prevbid.json`, JSON.stringify(prevbids), function(err) {});
        const role = message.guild.roles.find(r => r.name === "@everyone");

        message.channel.overwritePermissions(role, { SEND_MESSAGES: false })
    }
    else if (!params[0] || !params[1] || !params[2] || !params[3] || !params[4]) {
        let embed = {
            "title": "An Error Occurred",
            "description": "Incorrect Usage\n\nCorrect Usage" + process.env.PREFIX + '\n`!auction [spawncode] [imagelink] [ends-at] [maxSpeed] [carname]`',
            "color": 0x9c5cb4,
    }
    return message.channel.send({ embed })
    }
    else {
        spawncode = params[0]
        imagelink = params[1]
        endsat = params[2]
        maxSpeed = params[3]
        carName = `${params.join(' ').replace(params[0], '').replace(params[1], '').replace(params[2], '').replace(params[3], '')}`
        fivemexports.xtra.execute("SELECT * FROM xtra_user_vehicles WHERE vehicle = ?", [params[0].toLowerCase()], (result) => {
            if (result) {
                carcount = result.length
                message.guild.createChannel(`auction-${carName}`, 'text')
                .then(channel => {
                    let category = message.guild.channels.find(c => c.name == "🔨 [Auctions]" && c.type == "category");
                    channel.setParent(category.id);
                    let embed = {
                        "title": `XTRA Auction`,
                        "fields": [
                            {
                                "name": '**Item**',
                                "value": carName,
                                "inline": true,
                            },
                            {
                                "name": '**Info**',
                                "value": `1:${carcount} 🔒`,
                                "inline": true,
                            },
                            {
                                "name": '**Bidding Ends**',
                                "value": endsat,
                                "inline": true,
                            },
                        ],
                        "color": settingsjson.settings.botColour,
                        "footer": {
                            "text": "!bid [amount] to place a bid"
                        },
                        "image": {
                            "url": imagelink,
                        },
                    }
                    channel.send({embed})
                }).catch(console.error);
                //let channel = message.guild.channels.find(c => c.name == `auction-${spawncode}`);
                let embed = {
                    "title": `Created Auction`,
                    //"description": `Click to view ${channel}\n\n**Name:** ${carName}\n**Spawncode:** ${spawncode}\n**Max Speed:** ${maxSpeed}\n**Car Count:** 1:${carcount}\n\n**Created By:** ${message.author}`,
                    "description": `**Name:** ${carName}\n**Spawncode:** ${spawncode}\n**Max Speed:** ${maxSpeed}\n**Car Count:** 1:${carcount}\n**Ends At:** ${endsat}\n\n**Created By:** ${message.author}`,
                    "color": settingsjson.settings.botColour,
                    "image": {
                        "url": imagelink,
                    },
                }
                message.channel.send({embed})
            }
        })
    }
}

exports.conf = {
    name: "auction",
    perm: 6,
    guild: "1195851569472741437"
}