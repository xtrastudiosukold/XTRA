const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname;
const settingsjson = require(resourcePath + '/settings.js');

exports.runcmd = (fivemexports, client, message, params) => {
    let embed = {
        "title": "Require support?",
        "description": "**Please only open a ticket for the following reasons**",
        "color": settingsjson.settings.botColour,
        "fields": [
            {
                name: "",
                value: "You have donated Baller or a Custom Gun.",
                inline: false
            },
            {
                name: "",
                value: "You have encountered an issue with the store.",
                inline: false
            },
            {
                name: "",
                value: "You require support with your forum account.",
                inline: false
            },
            {
                name: "**If you open a ticket for another reason, your ticket will be closed.**",
                value: "",
                inline: false
            },
        ]
    };
    message.channel.send({ embed });
    message.channel.send("||                              https://discord.gg/VT6DQUd2N2                               ||");
};

exports.conf = {
    name: "supporttickets",
    perm: 11,
    guild: "1195851569472741437"
};
