const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')
exports.runcmd = (fivemexports, client, message, params) => {
    let embed = {
        "title": "XTRA His Majesty's Prison Service",
        "description": "**Command Structure**\n- N/A: Governor\n- N/A: Deputy Governor\n- N/A: Divisional Commander",
        "color": settingsjson.settings.botColour,
        // "image": {
        //     "url": "https://i.imgur.com/nhDR4CI.png",
        // },
        "fields": [
            {
                "name": "What we do as Prison Guards:",
                "value": "As HMPS, we keep those sentenced to prison in custody, helping them lead law-abiding and useful lives, both while they are in prison and after they are released. We also ensure the prison is safe for both our guards and the prisoners inside. Additionally, we make sure prisoners are transported safely to and from the prison, working closely with the Metropolitan Police Service to ensure correct safety standards are met.",
            },
            {
                "name": "How to Join the Prison Service:",
                "value": "To join the Prison Service, you need to create an account on xtrastudios.net and use the [application](https://soon). Make sure to be in the XTRA HMPS Official [Discord](https://discord.gg/aXGMqVQs5d) server.",
            },
            {
                "name": "Requirements to Join the Prison Service:",
                "value": "- If 14 years of age, you must have 75 hours minimum playtime & a maturity test.\n- If you are 15 years or older, you must have 50 hours minimum playtime.\n- Less than 5 Points on your F10.\n- Do not plagiarize any applications or you will be at serious risk of waiting longer than a usual denial would take.\n- Have read the HMPS rules & procedures, which are found on our E-Library [here](https://soon)",
            },
            {
                "name": "How to make a complaint about a misbehaving Prison Guard:",
                "value": "To make a complaint about a misbehaving Prison Guard, please join the HMPS Official Discord Server and locate the channel '#hmp-complaints'. Open a report ticket by reacting to the embedded message.",
            },
        ],
    };

    message.channel.send({embed});
    message.channel.send("||                                                  https://discord.gg/aXGMqVQs5d                                     ||");
};

exports.conf = {
    name: "hmpsembed",
    perm: 11,
    guild: "1195851569472741437",
};
