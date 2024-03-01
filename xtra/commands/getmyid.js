const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname;
const settingsjson = require(resourcePath + '/settings.js');

exports.runcmd = (fivemexports, client, message, params) => {
    let user = message.author.id;
    if (user) {
        fivemexports.xtra.execute("SELECT user_id FROM `xtra_verification` WHERE discord_id = ?", [user], (result) => {
            if (result.length > 0) {
                const permID = result[0].user_id;
                message.channel.send(`Your Perm ID: ${permID}`);
            } else {
                message.channel.send('No account is linked for this user.');
            }
        });
    }
};

exports.conf = {
    name: "getmyid",
    perm: 0,
    guild: "1195851569472741437",
    support: true,
};
