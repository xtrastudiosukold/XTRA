var AsciiTable = require('ascii-table');
const Discord = require('discord.js');
const fs = require('fs');
const { default: axios } = require('axios');

const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname;

exports.runcmd = async (fivemexports, client, message, params) => {
    if (!params[0]) {
        let embed = {
            "title": "An Error Occurred",
            "description": "Incorrect Usage\n\nCorrect Usage: " + process.env.PREFIX + '\n`!gengiftcard [amount]`',
            "color": 0x57F288,
        };
        return message.channel.send({ embed });
    } else {
        try {
            const res = await axios({
                method: 'post',
                url: `https://plugin.tebex.io/gift-cards`,
                data: {
                    amount: params[0],
                },
                headers: { 'X-Tebex-Secret': '4abcc49deaa444d0873080061653a46ca4d21fb0' },
            });

            if (!res.data) {
                return message.reply("Currently unable to fetch from tebex api");
            } else {
                let dmembed = {
                    "title": `**Tebex Gift Card**`,
                    "description": `> Gift Card Amount **£${params[0]}**\n > Gift Card Code **${res.data.data.code}**`,
                    "color": settingsjson.settings.botColour,
                    "footer": {
                        "text": `Requested by ${message.author.username}`
                    },
                    "timestamp": new Date()
                };
                message.author.send({ embed: dmembed });
                let embed = {
                    "title": `**Tebex Gift Card**`,
                    "description": `Gift Card Has Been Sent To Your DM's`,
                    "color": settingsjson.settings.botColour,
                    "footer": {
                        "text": `Requested by ${message.author.username}`
                    },
                    "timestamp": new Date()
                };
                message.channel.send({ embed });
            }
        } catch (err) {
            console.log(err);
            let embed = {
                "title": `**Error**`,
                "description": `> No purchase found with that ID.`,
                "color": settingsjson.settings.botColour,
                "footer": {
                    "text": `Requested by ${message.author.username}`
                },
                "timestamp": new Date()
            };
            message.channel.send({embed});
        }
    }
};

exports.conf = {
    name: "gengiftcard",
    perm: 9,
    guild: "1195851569472741437",
    support: true,
};
