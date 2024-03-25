const resourcePath = global.GetResourcePath ?
global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    message.delete();
    if (!params[0]) {
        let embed = {
            "title": "An Error Occurred",
            "description": "Incorrect Usage\n\nCorrect Usage" + process.env.PREFIX + '\n`!rulechange [Rule Change]`',
            "color": 0x57F288,
        }; // <-- Add this closing brace
        return message.channel.send({ embed });
    }

    const rule = params.slice(0).join(' ');

    let embed = {
        "title": "Rule Change",
        "description": `\n${rule}`,
        "color": settingsjson.settings.botColour,
        "footer": {
            "text": `XTRA Rules have been updated. Please read them.`
        },
        "timestamp": new Date()
    };
    const channel = client.channels.find(channel => channel.name === settingsjson.settings.RuleChangesChannel);
    channel.send({ embed });
    channel.send(`||@everyone||`)
    message.channel.send(`Rule Change Has Been Sent ${channel}`);
};

exports.conf = {
    name: "rulechange",
    perm: 7,
    guild: "1195851569472741437"
};
