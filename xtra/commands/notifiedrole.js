const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname;
const settingsjson = require(resourcePath + '/settings.js');

exports.runcmd = async (fivemexports, client, message, params) => {
    let embed = {
        "title": "Stay Notified",
        "description": "React to this message to receive pings from the <@&1195851569472741438> role, if you'd like frequent pings regarding announcements, updates, and server status changes.",
        "color": settingsjson.settings.botColour,
        "author": {
            name: "XTRA", 
           // icon_url: "" 
        },
        "thumbnail": {
            url: "https://cdn.discordapp.com/attachments/1195851571150467097/1209823333349072946/XTRA_logo.png?ex=65fac7c8&is=65e852c8&hm=8792dc7f461306b148e667829cc473640f3ab31f41df547881c387c7221e81a8&" 
        }
    };
    const sentMessage = await message.channel.send({ embed });
    const bellEmoji = '🔔'; 
    await sentMessage.react(bellEmoji);
};

exports.conf = {
    name: "notified",
    perm: 11,
    guild: "1195851569472741437"
};
