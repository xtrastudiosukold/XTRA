const resourcePath = global.GetResourcePath ?
global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    message.delete();
    if (!params[0]) {
        let embed = {
            "title": "An Error Occurred",
            "description": "Incorrect Usage\n\nCorrect Usage" + process.env.PREFIX + '\n`!vote [vote contents]`',
            "color": 0x57F288,
        }; // <-- Add this closing brace
        return message.channel.send({ embed });
    }

    const vote = params.slice(0).join(' ');

    let embed = {
        "title": "Community Vote",
        "description": `\n${vote}`,
        "color": settingsjson.settings.botColour,
        "footer": {
            "text": `Please vote to make an impact on the server.`
        },
        "timestamp": new Date()
    };
    const channel = client.channels.find(channel => channel.name === settingsjson.settings.VoteChannel);
    channel.send({ embed });
    channel.send(`||@everyone||`)
    message.channel.send(`Started community vote in ${channel}`);
};

exports.conf = {
    name: "vote",
    perm: 7,
    guild: "1195851569472741437"
};
