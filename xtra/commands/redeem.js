const resourcePath = global.GetResourcePath ? global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname;
const settingsjson = require(resourcePath + '/settings.js');

const confirmationTimeout = 30000; // 30 seconds

const confirmations = new Map();

function formatItem(item) {
    return item.split('_').map(word => word.charAt(0).toUpperCase() + word.slice(1)).join(' ');
}

exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0]) {
        const embed = {
            "title": "An Error Occurred",
            "description": "Incorrect Usage\n\nCorrect Usage: " + process.env.PREFIX + "`redeem [code]`",
            "color": 0x9c5cb4,
        };
        return message.channel.send({ embed });
    }

    const code = params[0];

    fivemexports.xtra.execute("SELECT * FROM `xtra_stores` WHERE code = ?", [code], (infoArray) => {
        if (infoArray.length === 0) {
            const embed = {
                "title": "Code Not Found",
                "description": "The provided code was not found or has already been redeemed.",
                "color": settingsjson.settings.botColour,
                "footer": {
                    "text": ""
                },
                "timestamp": new Date()
            };
            message.channel.send({ embed });
            return;
        }

        const info = infoArray[0];
        const item = formatItem(info.item);
        const user_id = info.user_id;

        fivemexports.xtra.execute("SELECT discord_id FROM `xtra_verification` WHERE user_id = ?", [user_id], (discordIdArray) => {
            const discordIdInfo = discordIdArray[0];
            const discord_id = discordIdInfo.discord_id;

            const embed = {
                "title": "Redeem Confirmation",
                "color": settingsjson.settings.botColour,
                "fields": [
                    {
                        "name": "Owners Discord",
                        "value": `<@${discord_id}>`,
                        "inline": true
                    },
                    {
                        "name": "Owners Perm ID",
                        "value": user_id,
                        "inline": true
                    },
                    {
                        "name": "Item For The Code",
                        "value": item,
                        "inline": true
                    },
                    {
                        "name": "Code",
                        "value": code
                    },
                    {
                        "name": "Confirmation",
                        "value": "React with ✅ to confirm or ❌ to cancel.",
                    }
                ],
                "footer": {
                    "text": "This confirmation will time out in 30 seconds."
                },
                "timestamp": new Date()
            };

            message.channel.send({ embed }).then(sentEmbed => {
                sentEmbed.react("✅");
                sentEmbed.react("❌");

                const filter = (reaction, user) => user.id === message.author.id && (reaction.emoji.name === "✅" || reaction.emoji.name === "❌");
                const collector = sentEmbed.createReactionCollector(filter, { time: confirmationTimeout });

                collector.on('collect', reaction => {
                    collector.stop();
                    sentEmbed.delete();

                    if (reaction.emoji.name === "✅") {
                        // User confirmed
                        fivemexports.xtra.execute("DELETE FROM xtra_stores WHERE code = ?", [code], (result) => {
                            if (result.affectedRows > 0) {
                                const confirmedBy = reaction.users.filter(user => !user.bot).first();
                                const embed = {
                                    "title": "Code Redeemed",
                                    "description": `Code: **${code}**\nRedeemed by: <@${message.author.id}>`,
                                    "color": settingsjson.settings.botColour,
                                    "footer": {
                                        "text": ""
                                    },
                                    "timestamp": new Date()
                                };
                                message.channel.send({ embed });
                            } else {
                                const embed = {
                                    "title": "Code Not Found",
                                    "description": "The provided code was not found or has already been redeemed.",
                                    "color": settingsjson.settings.botColour,
                                    "footer": {
                                        "text": ""
                                    },
                                    "timestamp": new Date()
                                };
                                message.channel.send({ embed });
                            }
                        });
                    } else if (reaction.emoji.name === "❌") {
                        // User canceled
                        const embed = {
                            "title": "Redeem Canceled",
                            "description": `Redeeming the code: **${code}** was canceled.`,
                            "color": settingsjson.settings.botColour,
                            "footer": {
                                "text": ""
                            },
                            "timestamp": new Date()
                        };
                        message.channel.send({ embed });
                    }
                });

                collector.on('end', collected => {
                    if (collected.size === 0) {
                        const embed = {
                            "title": "Confirmation Timeout",
                            "description": `The confirmation request has timed out. Redeeming the code: **${code}** was canceled.`,
                            "color": settingsjson.settings.botColour,
                            "footer": {
                                "text": ""
                            },
                            "timestamp": new Date()
                        };
                        message.channel.send({ embed });
                    }
                });
            });
        });
    });
};

exports.conf = {
    name: "redeem",
    perm: 9,
    guild: "1195851569472741437",
    support: true
};
