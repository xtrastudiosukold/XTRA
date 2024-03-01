const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname;
const settingsjson = require(resourcePath + '/settings.js');
const { member } = require("discord.js");

exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0] || !parseInt(params[0])) {
        let embed = {
            "title": "An Error Occurred",
            "description": "Incorrect Usage\n\nCorrect Usage: " + process.env.PREFIX + '\n`!comban [permid]`',
            "color": 0x9c5cb4,
        };
        return message.channel.send({ embed });
    }

    const permID = params[0];

    fivemexports.xtra.execute("SELECT discord_id FROM `xtra_verification` WHERE user_id = ?", [permID], async (result) => {
        if (result.length > 0) {
            const discordID = result[0].discord_id;

            const confirmEmbed = {
                "title": "Confirm Community Ban",
                "description": `Are you sure you want to community ban <@${discordID}>?\n\nReact with ✅ to proceed or ❌ to cancel.`,
                "color": 0xffa500
            };

            message.channel.send({ embed: confirmEmbed }).then(confirmMessage => {
                confirmMessage.react('✅').then(() => confirmMessage.react('❌'));

                const filter = (reaction, user) => ['✅', '❌'].includes(reaction.emoji.name) && user.id === message.author.id;
                const collector = confirmMessage.createReactionCollector(filter, { time: 15000 });

                collector.on('collect', async (reaction) => {
                    if (reaction.emoji.name === '✅') {
                        // Existing ban logic here
                        let newval = fivemexports.xtra.xtra('banDiscord', [permID, 'perm', 'Community Ban', `XTRA`]);

                        // New member.ban logic
                        const guild = message.guild;
                        const userToBan = guild.members.cache.get(discordID);

                        if (userToBan) {
                            try {
                                await userToBan.ban({ reason: "Community Ban" });
                                message.channel.send(`User <@${discordID}> has been banned using member.ban.`);
                            } catch (error) {
                                console.error("Error banning user:", error);
                                message.reply("An error occurred while trying to ban the user.");
                            }
                        }
                        // End of new member.ban logic

                        // Send an embed message to the banned user
                        const bannedUser = client.users.cache.get(discordID);
                        if (bannedUser) {
                            let banEmbed = {
                                "title": "You Have Been Banned",
                                "description": `You have been banned from the community for the following reason:\nCommunity Ban`,
                                "color": settingsjson.settings.botColour,
                            };

                            bannedUser.send({ embed: banEmbed });

                            // Confirmation embed in the original channel
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
            message.reply('No Discord ID found for the provided Perm ID.');
        }
    });
};

exports.conf = {
    name: "comban",
    perm: 9,
    guild: "1195851569472741437"
};
