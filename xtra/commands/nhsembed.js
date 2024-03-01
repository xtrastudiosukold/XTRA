const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')
exports.runcmd = (fivemexports, client, message, params) => {
    let embed = {
        "title": "XTRA National Health Service",
        "description": "**Command Structure**\n- N/A: Chief Medical Director\n- N/A: Deputy Medical Director\n- N/A_Mystic: Assistant Medical Director",
        "color": settingsjson.settings.botColour,
        "image": {
            "url": "https://i.imgur.com/nhDR4CI.png",
        },
        "fields": [
            {
                "name": "How to become part of the NHS?",
                "value": "To become part of the NHS, you must have an account on xtrastudios.net and use this [link](https://soon). Make sure to fill out everything on the form correctly; failure to do so will result in denial of the application. Also, make sure to be in the XTRA NHS [Discord](https://discord.gg/qGWVtSa26K) Server",
            },
            {
                "name": "Requirements to Join the NHS:",
                "value": "- If you are 12 to 14 years of age, you must have 100 hours minimum.\n- If you are 15 years or older, you must have 50 hours minimum.\n- Less than 4 Points on your F10\n- Maximum of 3 bans in the past 2 weeks on your F10\n- Be familiar with the NHS rules and procedures, which can be found [here](https://nhs.xtrastudios.net/)",
            },
            {
                "name": "How to make a complaint about a NHS Worker",
                "value": "To make a complaint about a NHS Worker, please join the NHS Discord Server and head to the channel called #nhs-complaints. Open a report ticket using -report in the channels.",
            },
        ],
    };

    message.channel.send({embed});
    message.channel.send("||                              https://discord.gg/tKsyaEdGqn                             ||");
};

exports.conf = {
    name: "nhsembed",
    perm: 11,
    guild: "1195851569472741437",
};
