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

// exports('ticketdm', (source, args) => {
//     let discordid = args[0].trim();
//     let permid = args[2];
//     const guild = client.guilds.get(settingsjson.settings.GuildID);
//     const member = guild.members.get(discordid);
//     if (user) {
//         fivemexports.xtra.execute("SELECT user_id FROM `xtra_verification` WHERE discord_id = ?", [user], (result) => {
//             if (result.length > 0) {
//                 const permID = result[0].user_id; 
//                 let embed = {
//                 "title": `Hey, sorry we couldn't get to your admin ticket in time.`,
//                 "description": `If you're facing a game issue post a message in https://discord.com/channels/1195851569472741437/1195851570500345873 or if you're reporting a player rule break, you can do so in our support discord: https://discord.com/channels/1195851569472741437/1195851569510490253`,
//                 "color": settingsjson.settings.botColour,
//                }
//             });
//         }
//         member.send({ embed });
//     });