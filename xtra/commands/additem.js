const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

function generateUUID(length) {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const charsLength = characters.length;

    let uuid = '';
    for (let i = 0; i < length; i++) {
        const randomIndex = Math.floor(Math.random() * charsLength);
        uuid += characters.charAt(randomIndex);
    }

    return uuid;
}

exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0] || isNaN(parseInt(params[0])) || !params[1]) {
        const embed = {
            "title": "An Error Occurred",
            "description": "Incorrect Usage\n\nCorrect Usage: " + process.env.PREFIX + "additem [user_id] [item]",
            "color": 0x9c5cb4,
        };
        return message.channel.send({ embed });
    }

    const user_id = params[0];
    const item = params[1];

    const code1 = generateUUID(4);
    const code2 = generateUUID(4);
    const code = (code1 + "-" + code2).toUpperCase();

    const xtra = fivemexports['xtra'];

    const insertQuery = "INSERT INTO xtra_stores (code, item, user_id) VALUES (?, ?, ?)";
    const queryParams = [code, item, user_id];

    // Creating the confirmation message
    const confirmationEmbed = {
        "title": "Confirm Item Addition",
        "description": `User ID: **${user_id}**\nItem: **${item}**\nCode: **||${code}||**\nAdmin: <@${message.author.id}>`,
        "color": settingsjson.settings.botColour,
        "footer": {
            "text": "React with ✅ to confirm or ❌ to cancel"
        },
        "timestamp": new Date()
    };

    // Send the confirmation message
    message.channel.send({ embed: confirmationEmbed })
        .then(confirmMsg => {
            // Add reactions to the confirmation message
            confirmMsg.react("✅");
            confirmMsg.react("❌");

            // Create a reaction collector to listen for user reactions
            const filter = (reaction, user) =>
                (reaction.emoji.name === "✅" || reaction.emoji.name === "❌") && user.id === message.author.id;
            const collector = confirmMsg.createReactionCollector(filter, { time: 60000 }); // Collector times out after 60 seconds

            collector.on("collect", (reaction) => {
                // Delete the confirmation message
                confirmMsg.delete();

                if (reaction.emoji.name === "✅") {
                    // Insert data into the database
                    xtra.execute(insertQuery, queryParams);

                    const successEmbed = {
                        "title": "Added Item",
                        "description": `User ID: **${user_id}**\nItem: **${item}**\nCode: **||${code}||**\nAdmin: <@${message.author.id}>`,
                        "color": settingsjson.settings.botColour,
                        "footer": {
                            "text": ""
                        },
                        "timestamp": new Date()
                    };
                    // Send success message and schedule deletion
                    message.channel.send({ embed: successEmbed }).then(successMsg => {
                        setTimeout(() => {
                            successMsg.delete();
                        }, 10000); // Delete after 10 seconds
                    });
                } else if (reaction.emoji.name === "❌") {
                    // Send cancel message and schedule deletion
                    const cancelEmbed = {
                        "title": "Action Canceled",
                        "description": "Item addition has been canceled.",
                        "color": 0x9c5cb4
                    };
                    message.channel.send({ embed: cancelEmbed }).then(cancelMsg => {
                        setTimeout(() => {
                            cancelMsg.delete();
                        }, 10000); // Delete after 10 seconds
                    });
                }

                // Stop the collector
                collector.stop();
            });

            collector.on("end", (collected, reason) => {
                if (reason === "time") {
                    // Send timeout message
                    const timeoutEmbed = {
                        "title": "Confirmation Timeout",
                        "description": "Confirmation has timed out. Item addition was not confirmed.",
                        "color": 0x9c5cb4
                    };
                    message.channel.send({ embed: timeoutEmbed }).then(timeoutMsg => {
                        setTimeout(() => {
                            timeoutMsg.delete();
                        }, 10000); // Delete after 10 seconds
                    });
                }
            });
        });
};




exports.conf = {
    name: "additem",
    perm: 9,
    guild: "1195851569472741437",
    support: true
};