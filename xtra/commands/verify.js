const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname;
const settingsjson = require(resourcePath + '/settings.js');
const Discord = require('discord.js');
const hook = new Discord.WebhookClient(settingsjson.settings.verifyLogWebhook.id, settingsjson.settings.verifyLogWebhook.token);

function daysBetween(dateString) {
    const d1 = new Date(dateString);
    const d2 = new Date();
    return Math.round((d2 - d1) / (1000 * 3600 * 24));
}

const failedAttempts = new Map();

exports.runcmd = async (fivemexports, client, message, params) => {
    if (message.channel.name === "verify") {
        message.delete();
    }

    const code = params[0];

    if (!code || code.length === 0) {
        const embed = new Discord.RichEmbed()
            .setTitle("Verify")
            .setDescription(`:x: Invalid command usage \`${process.env.PREFIX}verify [code]\``)
            .setColor(settingsjson.settings.botErrorColour)
            .setFooter("");
        message.channel.send({ embed }).then(msg => {
            msg.delete(5000);
        });
    } else {
        fivemexports.xtra.execute("SELECT * FROM `xtra_verification` WHERE LOWER(code) = LOWER(?)", [code], (result) => {
            if (result && result.length > 0) {
                if (result[0].discord_id !== null) {
                    message.channel.send(`A discord account is already linked to this Perm ID, please contact Management to reverify.`).then(msg => {
                        msg.delete(5000);
                    }).catch(console.error);
                    return;
                }

                const verifyLog = new Discord.RichEmbed()
                    .setTitle('Verify Log')
                    .addField('Perm ID:', `${result[0].user_id}`)
                    .addField('Code:', `${code}`)
                    .addField('Discord:', `${message.author}`)
                    .addField('Discord ID:', `${message.author.id}`)
                    .addField('Created At:', `${message.author.createdAt}`)
                    .addField('Account Age:', `${daysBetween(message.author.createdAt)} days`)
                    .setColor(settingsjson.settings.botColour)
                    .setFooter('XTRA')
                    .setTimestamp();

                // Update only the necessary fields, considering existing values
                const updateValues = {
                    discord_id: result[0].discord_id || message.author.id,
                    verified: 1
                };

                fivemexports.xtra.execute("UPDATE `xtra_verification` SET ? WHERE code = ?", [updateValues, code], async (updateResult) => {
                    if (updateResult) {
                        const embed = new Discord.RichEmbed()
                            .setTitle("Verify")
                            .setDescription(`<a:verify:1216432015511916666> Great you're verified, head back in-game and press connect.`)
                            .setColor(settingsjson.settings.botColour);
                        hook.send(verifyLog);
                        message.channel.send({ embed }).then(msg => {
                            msg.delete(5000);
                        });
                        await message.member.addRole("1195851569472741441");
                    }
                });
            } else {
                message.channel.send(`code \`\`${params[0]}\`\` does not exist.`).then(msg => {
                    msg.delete(5000);
                }).catch(console.error);
                const userAttempts = failedAttempts.get(message.author.id) || 0;
                failedAttempts.set(message.author.id, userAttempts + 1);
                if (userAttempts + 1 === 3) {
                    const embed = new Discord.RichEmbed()
                        .setTitle("It seems you are struggling to verify")
                        .setDescription("When it's your first time connecting to **XTRA**, you will be prompted with a box telling you how to verify. \n If you are still struggling, enter the red text into https://discord.com/channels/1195851569472741437/1195851569938321423 \nMake sure you include `!verify`. Here's an example of how it's used")
                        .setImage("https://cdn.discordapp.com/attachments/1195851571150467097/1209909033067089981/XTRA_Banner.png?ex=65fb1798&is=65e8a298&hm=472665563bf5fdb4b4ffea3ebb6ada6883328f242a618f6c498067d4338c3f2e&")
                        .setColor(settingsjson.settings.botErrorColour);
                    message.author.send({ embed });
                    failedAttempts.delete(message.author.id);
                }
            }
        });
    }
};

exports.conf = {
    name: "verify",
    perm: 0,
    guild: "1195851569472741437"
};
