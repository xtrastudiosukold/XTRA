const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')


exports.runcmd = (fivemexports, client, message, params) => {
    const currentDate = new Date().toLocaleDateString();

    let embed = {
        "title": "Support XTRA",
        "description": "If you love the frequent updates, original code, fantastic admin team, and the joy each time you click join, \n\nThen please consider supporting XTRA so that we can remain online bringing smiles across the globe ❤",
        "color": settingsjson.settings.botColour,
        "footer": {
            "text": `Last Updated: ${currentDate}`
        },
        "fields": [
            {
                name: "**Explore our Perks**",
                value: "More information posted on the [store](https://store.xtrastudios.com/)",
                inline: true
            },
        ]
    };

    message.channel.send({ embed }).then(sentMessage => {
        saveMessageID(sentMessage.id);
    });
};

function saveMessageID(messageID) {
    const filePath = path.join(__dirname, '..', 'storeMessageID.json');
    const data = JSON.stringify({ messageID }); 

    fs.writeFile(filePath, data, (err) => {
        if (err) {
            console.error('Error saving message ID:', err);
        } else {
            console.log('Message ID saved to storeMessageID.json');
        }
    });
}

exports.runcmd_editstore = (fivemexports, client, message, params) => {
    editstore.runcmd_editstore(fivemexports, client, message, params, storeMessageID);
};

exports.conf = {
    name: "storeembed",
    perm: 11,
    guild: "1195851569472741437"
};