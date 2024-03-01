const resourcePath = global.GetResourcePath ? global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname;
const settingsjson = require(resourcePath + '/settings.js');

const confirmationTimeout = 30000; // 30 seconds

const confirmations = new Map();

function formatItem(item) {
    return item.split('_').map(word => word.charAt(0).toUpperCase() + word.slice(1)).join(' ');
}

exports.runcmd = (fivemexports, client, message, params) => {
    // Retrieve the user_id based on the Discord ID of the message author
    fivemexports.xtra.execute(
        "SELECT user_id FROM `xtra_verification` WHERE discord_id = ?",
        [message.author.id],
        (result) => {
            if (result.length === 0) {
                const embed = {
                    "title": "User Not Found",
                    "description": "Your Discord ID is not associated with any user.",
                    "color": settingsjson.settings.botColour,
                    "footer": {
                        "text": ""
                    },
                    "timestamp": new Date()
                };
                return message.author.send({ embed }); // Send the embed to the author's DM
            }

            const user_id = result[0].user_id;

            if (!user_id) {
                const embed = {
                    "title": "An Error Occurred",
                    "description": "User ID not found for your Discord ID.",
                    "color": 0x9c5cb4,
                };
                return message.author.send({ embed }); // Send the embed to the author's DM
            }

            fivemexports.xtra.execute("SELECT * FROM `xtra_stores` WHERE user_id = ?", [user_id], (itemsArray) => {
                const itemCount = itemsArray.length;
                if (itemCount === 0) {
                    const embed = {
                        "title": "No Items Found",
                        "description": "No store items found for the provided user ID.",
                        "color": settingsjson.settings.botColour,
                        "footer": {
                            "text": ""
                        },
                        "timestamp": new Date()
                    };
                    message.author.send({ embed }); // Send the embed to the author's DM
                    return;
                }

                const itemsList = itemsArray.map((info, index) => {
                    const item = formatItem(info.item);
                    const code = info.code;
                    return `**Code:** ||${code}||   **Item:** ${item} \n`;
                });

                const maxFieldLength = 1024;
                const fields = [];

                // Split items into fields if needed
                let currentField = "";
                for (const item of itemsList) {
                    if (currentField.length + item.length > maxFieldLength) {
                        fields.push({
                            "name": `Items (Contd.)`,
                            "value": currentField,
                        });
                        currentField = item;
                    } else {
                        currentField += item + '\n';
                    }
                }

                if (currentField.length > 0) {
                    fields.push({
                        "name": ``,
                        "value": currentField,
                    });
                }
                const sentembed = {
                    "title": "Your Store Items",
                    "description": "Your store items have been sent to you in a DM.",
                    "color": settingsjson.settings.botColour,
                    "footer": {
                        "text": ""
                    },
                    "timestamp": new Date()
                };

                const embed = {
                    "title": "Your Store Items",
                    "color": settingsjson.settings.botColour,
                    "fields": fields,
                    "footer": {
                        "text": ""
                    },
                    "timestamp": new Date()
                };
                message.channel.send({ embed: sentembed }); // Send the embed to the channel
                message.author.send({ embed }); // Send the embed to the author's DM
            });
        }
    );
};

exports.conf = {
    name: "storeitems",
    perm: 0,
    guild: "1195851569472741437",
    support: true
};
