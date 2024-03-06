const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname;
const settingsjson = require(resourcePath + '/settings.js');

exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0] || !parseInt(params[0])) {
        let embed = {
            "title": "Error",
            "description": "Incorrect Usage\n\nCorrect Usage: `" + process.env.PREFIX + "\n!comban [permid]`",
            "color": 0x9c5cb4,
        };
        return message.channel.send({ embed });
    }

    const permID = params[0];

    if (permID === '1' || permID === '2' || permID === '3') {
        let embed = {
            "title": "Cannot Ban",
            "description": "Can't ban this User ID: `" + permID + "`",
            "color": settingsjson.settings.botColour,
            "thumbnail": {
                "url": "https://cdn.discordapp.com/attachments/1195851571150467097/1209823333349072946/XTRA_logo.png?ex=65e852c8&is=65d5ddc8&hm=a969962d0a243906dd80323519699d01a6609b207259b1ee717b4e4be3563b8d&"
            }
        };
        return message.channel.send({ embed });
    }

    fivemexports.xtra.execute("SELECT discord_id FROM `xtra_verification` WHERE user_id = ?", [permID], (result) => {
        if (result.length > 0) {
            const discordID = result[0].discord_id;

            const confirmEmbed = {
                "title": "Confirm Community Ban",
                "description": "Are you sure you want to community ban <@" + discordID + ">?\n\nReact with ✅ to proceed or ❌ to cancel.",
                "color": settingsjson.settings.botColour,
                "thumbnail": {
                    "url": "https://cdn.discordapp.com/attachments/1195851571150467097/1209823333349072946/XTRA_logo.png?ex=65e852c8&is=65d5ddc8&hm=a969962d0a243906dd80323519699d01a6609b207259b1ee717b4e4be3563b8d&"
                }
            };

            message.channel.send({ embed: confirmEmbed }).then(confirmMessage => {
                confirmMessage.react('✅').then(() => confirmMessage.react('❌'));

                const filter = (reaction, user) => ['✅', '❌'].includes(reaction.emoji.name) && user.id === message.author.id;
                const collector = confirmMessage.createReactionCollector(filter, { time: 15000 });

                collector.on('collect', async (reaction) => {
                    if (reaction.emoji.name === '✅') {
                        // Ban logic here
                        let newval = fivemexports.xtra.xtra('banDiscord', [permID, 'perm', 'Community Ban', `XTRA`]);

                        // Send a professional ban notification to the banned user
                        const bannedUser = client.users.get(discordID);
                        if (bannedUser) {
                            let banEmbed = {
                                "title": "Community Ban",
                                "description": `You have been banned from the community.\nReason: Community Ban`,
                                "color": settingsjson.settings.botColour,
                                "thumbnail": {
                                    "url": ""
                                }
                            };
                            message.guild.ban(bannedUser, { days: 1, reason: "Community Ban" });
                            bannedUser.send({ embed: banEmbed });

                            // Notify in the original channel
                            let embed = {
                                "title": "User Banned",
                                "description": `User <@${discordID}> has been banned.`,
                                "color": settingsjson.settings.botColour,
                            };

                            message.channel.send({ embed });
                        }
                    } else if (reaction.emoji.name === '❌') {
                        confirmMessage.delete();
                        message.reply('Community ban has been canceled.');
                    }
                    collector.stop();
                });

                collector.on('end', () => {
                    confirmMessage.delete();
                });
            });

        } else {
            let embed = {
                "title": "Error",
                "description": "No Discord ID found for the provided Perm ID.",
                "color": 0x9c5cb4,
                "thumbnail": {
                    "url": ""
                }
            };
            message.channel.send({ embed });
        }
    });
};

exports.conf = {
    name: "comban",
    perm: 9,
    guild: "1195851569472741437"
};
