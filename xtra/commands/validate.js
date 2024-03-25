var AsciiTable = require('ascii-table');
const Discord = require('discord.js');
const fs = require('fs');
const { default: axios } = require('axios');

const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0]) {
        let embed = {
            "title": "An Error Occurred",
            "description": "Incorrect Usage\n\nCorrect Usage" + process.env.PREFIX + '\n`!validate [tbx-id]`',
            "color": 0x57F288,
    }
    return message.channel.send({ embed })
    }
    else {
        axios.get(`https://plugin.tebex.io/payments/${params[0]}`, {
            method: 'GET',
            headers: { 'X-Tebex-Secret': "4abcc49deaa444d0873080061653a46ca4d21fb0"},
        }).then((res) => {
            //console.log(res.data)
            if (!res.data) {
                return message.reply("Currently unable to fetch from tebex api, use the online store to validate the ID")
            }else{
                const packages = res.data.packages.map(package => package.name)
                let embed = {
                    "title": `**Tebex Purchase Profile**`,
                    "description": `> Purchase is currently marked as ${res.data.status}`,
                    "color": settingsjson.settings.botColour,
                    "fields": [
                        {
                            name: '> Player Name',
                            value: res.data.player.name,
                        },
                        {
                            name: '> Price Paid',
                            value: `${res.data.currency.symbol}${res.data.amount}`,
                        },
                        {
                            name: '> Date Purchased',
                            value: res.data.date.slice(0,10),
                        },
                        {
                            name: '> Item(s) Purchased',
                            value: packages.join(', \n'),
                        },
                    ],
                    "footer": {
                        "text": `Requested by ${message.author.username}`
                    },
                    "timestamp": new Date()
                }
                message.channel.send({embed})
            }
        }).catch(err => {
            console.log(err)
            let embed = {
                "title": `**Error**`,
                "description": `> No purchase found with that ID.`,
                "color": settingsjson.settings.botColour,
                "footer": {
                    "text": `Requested by ${message.author.username}`
                },
                "timestamp": new Date()
            }
            message.channel.send({embed})
        })
    }
}

exports.conf = {
    name: "validate",
    perm: 7,
    guild: "1094033938378399797",
    support: true,
}