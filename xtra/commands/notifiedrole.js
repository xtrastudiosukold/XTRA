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
            url: "https://imgur.com/a/D2w4Ki7" 
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
