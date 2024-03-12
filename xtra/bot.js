const Discord = require('discord.js');
const { Client } = require('discord.js');
const client = new Client();
const path = require('path');
const resourcePath = global.GetResourcePath
    ? global.GetResourcePath(global.GetCurrentResourceName())
    : global.__dirname;
require('dotenv').config({ path: path.join(resourcePath, './.env') });
const fs = require('fs');
const settingsjson = require(resourcePath + '/settings.js');
var statusLeaderboard = require(resourcePath + '/statusleaderboard.json');
module.exports = client;
client.path = resourcePath;
client.ip = settingsjson.settings.ip;

if (process.env.TOKEN == "" || process.env.TOKEN == "TOKEN") {
    console.log(`Error! No Token Provided you forgot to edit the .env`);
    throw new Error('Whoops!');
}

client.on('ready', () => {
    console.log(`Logged in as ${client.user.tag}! Players: ${GetNumPlayerIndices()}`);
    console.log(`Your Prefix Is ${process.env.PREFIX}`);
    client.user.setActivity(`${GetNumPlayerIndices()}/${GetConvarInt("sv_maxclients", 64)} players`, { type: 'WATCHING' });
    client.user.setStatus('dnd');
    init();
});
// Inside your message event listener



client.on("message", async message => {
    // Ignore messages from bots
    if (message.author.bot) return;

    // List of banned words
    const bannedWords = ["nigger", "nigga", "wog", "coon", "paki","faggot","anal","kys","homosexual","lesbian","suicide","negro","queef","queer","allahu akbar","terrorist","wanker","n1gger","f4ggot","n0nce","d1ck","h0m0","n1gg3r","h0m0s3xual","nazi","hitler"];

    // Check if the message contains any banned words
    const containsBannedWord = bannedWords.some(word => message.content.toLowerCase().includes(word));

    if (message.channel.id === '1196258177612783677 ') {
        // Delete the message
        message.delete().catch(err => {
            console.error('Error deleting message:', err);
        });
    }
    if (containsBannedWord) {
        // Delete the original message
        message.delete();

        // Notify the author
        try {
            const user = await message.author.send("You are not allowed to use banned words in this server.");
            // Optional: Add a reaction to the original message indicating deletion
            message.react("❌");
        } catch (err) {
            console.error("Failed to send a message to the user:", err);
        }
    }
});

client.on("guildMemberAdd", function (member) {
    if (member.guild.id === settingsjson.settings.GuildID){
        try {
            exports.xtra.execute("SELECT * FROM `xtra_verification` WHERE discord_id = ? AND verified = 1", [member.id], (result) => {
                if (result.length > 0){
                    let role = member.guild.roles.find(r => r.name === '[Verified]');
                    member.addRole(role);
                }
            });
        
        } catch (error) {}
    }
});

// client.on('message', async message => {
//     if (member.guild.id === settingsjson.settings.GuildID) return;

//     function deleteMessage() {
//         message.delete();
//         message.channel.send(`<@!${message.author.id}>, Please don't send links to other servers!`);
//     }

//     const links = ['discord.gg/', 'discord.com/invite/', 'discordapp.com/invite/'];

//     for (const link of links) {
//         if (!message.content.includes(link)) return;
//         const code = message.content.split(link)[1].split(" ")[0];
//         const isGuildInvite = client.guilds.get(message.guild.id).fetchInvites().then(invites => invites.has(code));

//         if (!message.member.hasPermission('ADMINISTRATOR')) {
//             if (!isGuildInvite) {
//                 deleteMessage();
//             }
//         }
//     }
// });


  

let onlinePD = 0
let onlineStaff = 0
let onlineNHS = 0
let serverStatus = ""
let memberCount = 0;
let currentFooterEmoji = '⚪';

setInterval(() => {
    if (currentFooterEmoji === "⚪") {
        currentFooterEmoji = "⚫";
    } else {
        currentFooterEmoji = "⚪";
    }
}, 300);


if (settingsjson.settings.StatusEnabled) {
    setInterval(() => {
        if (!client.guilds.get(settingsjson.settings.GuildID)) return console.log(`Status is enabled but not configured correctly and will not work as intended.`);

        let guild = client.guilds.get(settingsjson.settings.GuildID);
        memberCount = guild.memberCount;

        let channelid = client.guilds.get(settingsjson.settings.GuildID).channels.find(r => r.name === settingsjson.settings.StatusChannel);
        if (!channelid) return console.log(`Status channel is not available / cannot be found.`);

        let settingsjsons = require(resourcePath + '/params.json');
        let totalSeconds = (client.uptime / 1000);
        totalSeconds %= 5000;
        client.user.setActivity(`${GetNumPlayerIndices()}/${GetConvarInt("sv_maxclients", 64)} players`, { type: 'WATCHING' });

        exports.xtra.execute("SELECT * FROM `xtra_users`", (result) => {
            playersSinceRelease = result.length;
        });

        exports.xtra.xtra('getUsersByPermission', ['police.armoury'], function(result) {
            if (!result.length)
                onlinePD = 0;
            else
                onlinePD = result.length;
        });

        exports.xtra.xtra('getUsersByPermission', ['admin.tickets'], function(result) {
            if (!result.length)
                onlineStaff = 0;
            else
                onlineStaff = result.length;
        });

        exports.xtra.xtra('getUsersByPermission', ['nhs.menu'], function(result) {
            if (!result.length)
                onlineNHS = 0;
            else
                onlineNHS = result.length;
        });

        exports.xtra.execute("SELECT * FROM xtra_users WHERE banned = 1", (result) => {
            bannedPlayers = result.length;
        });
        exports.xtra.getServerStatus([], function(result) {
            serverStatus = result; // Assuming result is either 'online' or 'offline'
        });
        // Assuming you have the 'serverStatus' variable set to either '🛑 Offline' or '✅ Online'
        let embedColor;

        if (serverStatus === '❌ Offline') {
          embedColor = 0xff0001; // Red color
        } else if (serverStatus === '✅ Online') {
          embedColor = 0x9c5cb4; // Dark gray color
        } else {
         // Default color in case the status is something else
          embedColor = 0x9c5cb4; // Black color
        }

        let botPing = Math.round(client.ws.ping);


            let status = {
                "color": embedColor,
                "fields": [{
                    "name": "Server Status",
                    "value": `${serverStatus}`,
                    "inline": true
                },
                {
                    "name": "Average Player Ping",
                    "value": `${MathRandomised(8, 27)}ms`,
                    "inline": true
                },
                {
                    "name": "Ping",
                    "value": `${MathRandomised(8, 17)}ms`,
                    "inline": true
                },
                {
                    "name": "<:pd:1209805933597954078> Police", 
                    "value": `${onlinePD}`,
                    "inline": true
                },
                {
                    "name": "<:nhs:1209805932276482088> NHS",
                    "value": `${onlineNHS}`,
                    "inline": true
                },
                {
                    "name": "<:xtra:1209823755422142464> Staff",
                    "value": `${onlineStaff}`,
                    "inline": true
                },
                {
                    "name": "👫 Players",
                    "value": `${GetNumPlayerIndices()}/${GetConvarInt("sv_maxclients", 60)}`,
                    "inline": true
                },
                {
                    "name": "<:cord:1209805930502561832> Members",
                    "value": `${memberCount}`,
                    "inline": true
                },
                {
                    "name": "",
                    "value": ``,
                    "inline": true
                },
                {
                    "name": "How do I direct connect?",
                    "value": '``F8 -> Search XTRA on The FiveM Main Menu!``',
                    "inline": true
                },
                {
                    "name": "",
                    "value": ``,
                    "inline": true
                }
            ],
            "author": {
                "name": "XTRA Status",
                "icon_url": "https://cdn.discordapp.com/attachments/1195851571150467097/1209823333349072946/XTRA_logo.png?ex=65e852c8&is=65d5ddc8&hm=a969962d0a243906dd80323519699d01a6609b207259b1ee717b4e4be3563b8d&"
            },
            "footer": {
                "text": `${currentFooterEmoji} XTRA`
            },
            "timestamp": new Date()
        };

        channelid.fetchMessage(settingsjsons.messageid)
            .then(msg => {
                msg.edit({ embed: status});
            })
            .catch(err => {
                channelid.send('Status Starting..').then(id => {
                    settingsjsons.messageid = id.id;
                    fs.writeFile(`${resourcePath}/params.json`, JSON.stringify(settingsjsons), function(err) {});
                    return;
                });
            });
    }, 8000);
}

process.on('unhandledRejection', (reason, promise) => {
    console.log('Unhandled Rejection at:', promise, 'reason:', reason);
});

client.commands = new Discord.Collection();

const init = async() => {
  fs.readdir(resourcePath + '/commands/', (err, files) => {
    if (err) console.error(err);
    console.log(`Loading a total of ${files.length} commands.`);
    files.forEach(f => {
      let command = require(`${resourcePath}/commands/${f}`);
      client.commands.set(command.conf.name, command);
    });
    if (!statusLeaderboard['leaderboard']) {
      statusLeaderboard['leaderboard'] = {}
    }
    else {
      statusLeaderboard['leaderboard'] = statusLeaderboard['leaderboard']
    }
  });
}

setInterval(function(){
  promotionDetection();
}, 60*1000);

function promotionDetection(){
  client.users.forEach(user =>{ //iterate over each user
    if(user.presence.status == "online" || user.presence.status == 'dnd' || user.presence.status == 'idle' && !user.bot){ //check if user is online and is not a bot
      if(!statusLeaderboard['leaderboard'][user.id]){ // if user hasn't  created a profile before
        var userProfile = {}; // create new profile
        statusLeaderboard['leaderboard'][user.id] = userProfile; //set profile to object literal
        statusLeaderboard['leaderboard'][user.id] = 0; //set minutes to 0
      }
      if(Object.entries(user.presence.activities).length > 0 && typeof(user.presence.activities[0].state) === 'string' && user.presence.activities[0].state.includes('discord.gg/frrp') ){ //check if they have a status
        statusLeaderboard['leaderboard'][user.id] += 1;
        fs.writeFileSync(`${resourcePath}/statusleaderboard.json`, JSON.stringify(statusLeaderboard), function(err) {});
      }
      else {
        // remove user from leaderboard if their status no longer includes "12345"
        delete statusLeaderboard['leaderboard'][user.id];
        fs.writeFileSync(`${resourcePath}/statusleaderboard.json`, JSON.stringify(statusLeaderboard), function(err) {});
      }
    }
  })
}



client.getPerms = function(msg) {

    let settings = settingsjson.settings
    let lvl0 = msg.guild.roles.find(r => r.name === settings.Level1Perm);
    let lvl1 = msg.guild.roles.find(r => r.name === settings.Level1Perm);
    let lvl2 = msg.guild.roles.find(r => r.name === settings.Level2Perm);
    let lvl3 = msg.guild.roles.find(r => r.name === settings.Level3Perm);
    let lvl4 = msg.guild.roles.find(r => r.name === settings.Level4Perm);
    let lvl5 = msg.guild.roles.find(r => r.name === settings.Level5Perm);
    let lvl6 = msg.guild.roles.find(r => r.name === settings.Level6Perm);
    let lvl7 = msg.guild.roles.find(r => r.name === settings.Level7Perm);
    let lvl8 = msg.guild.roles.find(r => r.name === settings.Level8Perm);
    let lvl9 = msg.guild.roles.find(r => r.name === settings.Level9Perm);
    let lvl10 = msg.guild.roles.find(r => r.name === settings.Level10Perm);
    let lvl11 = msg.guild.roles.find(r => r.name === settings.Level11Perm);
    if (!lvl0 || !lvl1 || !lvl2 || !lvl3 || !lvl4 || !lvl5 || !lvl6 || !lvl7 || !lvl8 || !lvl9 || !lvl10 || !lvl11) {
        console.log(`Your permissions are not setup correctly and the bot will not function as intended.\nStatus: Please check permission levels are setup correctly.`)
    }

    // hot fix for Discord role caching 
    const guild = client.guilds.get(msg.guild.id);
    if (guild.members.has(msg.author.id)) {
        guild.members.delete(msg.author.id);
    }
    const member = guild.members.get(msg.author.id);
    // hot fix for Discord role caching 

    let level = 0;
    if (msg.member.roles.has(lvl11.id)) {
        level = 11;
    } else if (msg.member.roles.has(lvl10.id)) {
        level = 10;
    } else if (msg.member.roles.has(lvl9.id)) {
        level = 9;
    } else if (msg.member.roles.has(lvl8.id)) {
        level = 8;
    } else if (msg.member.roles.has(lvl7.id)) {
        level = 7;
    } else if (msg.member.roles.has(lvl6.id)) {
        level = 6;
    } else if (msg.member.roles.has(lvl5.id)) {
        level = 5;
    } else if (msg.member.roles.has(lvl4.id)) {
        level = 4;
    } else if (msg.member.roles.has(lvl3.id)) {
        level = 3;
    } else if (msg.member.roles.has(lvl2.id)) {
        level = 2;
    } else if (msg.member.roles.has(lvl1.id)) {
        level = 1;
    } else if (msg.member.roles.has(lvl0.id)) {
        level = 0;
    }
    return level
}
client.on('message', (message) => {
    if (!message.author.bot){
        if (message.channel.name.includes('auction-')){
            if (message.channel.name == '・auction-room'){
                return
            }
            else{
                if (!message.content.includes(`${process.env.PREFIX}bid`)){
                    if (!message.content.includes(`${process.env.PREFIX}auction`) && !message.content.includes(`${process.env.PREFIX}houseauction`) && !message.content.includes(`${process.env.PREFIX}embed`)){
                        message.delete()
                        return
                    }
                }
            }
        }else if (message.channel.name.includes('verify')){
            if (!message.content.includes(`${process.env.PREFIX}verify `)){
                message.delete()
                return
            }
        }
    }
    let client = message.client;
    if (message.author.bot) return;
    if (!message.content.startsWith(process.env.PREFIX)) return;
    let command = message.content.split(' ')[0].slice(process.env.PREFIX.length).toLowerCase();
    let params = message.content.split(' ').slice(1);
    let cmd;
    let permissions = 0
    if (message.guild.id === settingsjson.settings.GuildID) {
        permissions = client.getPerms(message)
    }
    if (client.commands.has(command)) {
        cmd = client.commands.get(command);
    }
    if (cmd) {
        if (message.guild.id === cmd.conf.guild) {
            if (!message.channel.name.includes('verify') && cmd.conf.name === 'verify'){
                message.delete()
                message.reply('Please use <#1195851569938321423> for this command.').then(msg => {
                    msg.delete(5000)
                })
                return
            }else if (!message.channel.name.includes('commands') && !message.channel.name.includes('verify') && !message.channel.name.includes('staff') && !message.member.roles.has("1195851569510490250")) {
                message.delete()
                message.reply('Please use <#1195851570189971551> for this command.').then(msg => {
                    msg.delete(5000)
                })
            }
            else {
                if (permissions < cmd.conf.perm) return;
                try {
                    cmd.runcmd(exports, client, message, params, permissions);
                    if (cmd.conf.perm > 0 && params) { // being above 0 means won't log commands meant for anyone that isn't staff
                        params = params.join('\n ');
                        if (params != '') {
                            let { Webhook, MessageBuilder } = require('discord-webhook-node');
                            let hook = new Webhook(settingsjson.settings.botLogWebhook);
                            let embed = new MessageBuilder()
                            .setTitle('Bot Command Log')
                            .addField('Command Used:', `${cmd.conf.name}`)
                            .addField('Parameters:', `${params}`)
                            .addField('Admin:', `${message.author.username} - <@${message.author.id}>`)
                            .setColor(settingsjson.settings.botColour)
                            .setFooter('XTRA')
                            .setTimestamp();
                            hook.send(embed);
                        }
                    }
                } catch (err) {
                    let embed = {
                        "title": "Error Occured!",
                        "description": "\nAn error occured. Contact <@1072976053456339105> about the issue:\n\n```" + err.message + "\n```",
                        "color": settingsjson.settings.botColour,
                    }
                    message.channel.send({ embed })
                }
            }
        } else {
            if (cmd.conf.support && message.guild.id === "1164937688034578473"){
                if (message.member.roles.has("1164940941526827018")){
                    cmd.runcmd(exports, client, message, params, permissions);
                }
            } else {
                message.reply('This command is expected to be used within another guild.').then(msg => {
                    msg.delete(5000)
                })
                return;
            }
        }
    }
});

function MathRandomised(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min) + min); //The maximum is exclusive and the minimum is inclusive
}

client.on("guildMemberAdd", function (member) {
    if (member.guilds.get(settingsjson.settings.GuildID)){
        try {
            fivemexports.xtra.execute("SELECT * FROM `xtra_verification` WHERE discord_id = ? AND verified = 1", [member], (result) => {
                if (result.length > 0){
                    member.addRole("1195851569472741441").then().catch(console.error);
                }
            });
        
        } catch (error) {}
    }
});

  client.on('guildMemberAdd', member => { // User join into the server
    const guild = client.guilds.get(config.SERVER_ID); // Getting the guild (server) by ID

    if (guild) { // Checking for the correct server
        const role = guild.roles.get(config.ROLE_ID); // Getting the role by ID
        if (role) { // Checking if the role exists in the guild
            member.addRole(role) // Issuing a role to the member
                .catch(console.error); // Handling any errors if the role cannot be added
        }
    }
});

  

function daysBetween(dateString) {
    var d1 = new Date(dateString);
    var d2 = new Date();
    return Math.round((d2 - d1) / (1000 * 3600 * 24));
}
let { Webhook, MessageBuilder } = require('discord-webhook-node');

exports('dmUser', (source, args) => {
    let discordid = args[0].trim();
    let verifycode = args[1].toUpperCase();
    let permid = args[2];
    const guild = client.guilds.get(settingsjson.settings.GuildID);
    const member = guild.members.get(discordid);

    let embed = {
        "title": `Discord Account Link Request`,
        "description": `User ID ${permid} has requested to link this Discord account.\n\nThe code to link is **${verifycode}**\nThis code will expire in 5 minutes.\n\nIf you have not requested this then you can safely ignore the message. Do **NOT** share this message or code with anyone else.`,
        "color": settingsjson.settings.botColour,
        "thumbnail": {
            "url": "https://cdn.discordapp.com/attachments/1195851571150467097/1209822407028641813/XTRA_Text.png?ex=65e851eb&is=65d5dceb&hm=6c525b84d4ddac57e74da4cc45ab9cdf1572ecd34ee87f36a12663aa2c7b9e47&",
        },
    };

    member.send({ embed }); // Sending the initial embed to the user
    let hook = new Webhook(settingsjson.settings.reverifyLogWebhook);
    let reverifyLog = new MessageBuilder()
        .setTitle('Reverify Log')
        .addField('Discord:', `${discordid} - <@${discordid}>`)
        .addField('User ID:', `${permid}`)
        .addField('Code:', `${verifycode}`)
        .setColor(settingsjson.settings.botColour)
        .setFooter('XTRA')
        .setTimestamp();


    hook.send(reverifyLog); // Sending the reverify log embed to the user
});

exports('ticketdm', (source, args) => {
    let discordid = args[0].trim();
    let permid = args[2];
    const guild = client.guilds.get(settingsjson.settings.GuildID);
    const member = guild.members.get(discordid);

    let embed = {
        "title": `Hey, sorry we couldn't get to your admin ticket in time.`,
        "description": `If you're facing a game issue post a message in https://discord.com/channels/1195851569472741437/1195851570500345873 or if you're reporting a player rule break, you can do so in our support discord: https://discord.com/channels/1195851569472741437/1195851569510490253`,
        "color": settingsjson.settings.botColour,
    };
    member.send({ embed });
});

exports('storedm', (source, args) => {
    let discordid = args[0].trim();
    let permid = args[1];
    let message = args[2];
    const guild = client.guilds.get(settingsjson.settings.GuildID);
    const member = guild.members.get(discordid);

    let embed = {
        "title": `XTRA Store Notification`,
        "description": `${message}`,
        "color": settingsjson.settings.botColour,
        "thumbnail": {
            "url": "https://cdn.discordapp.com/attachments/1195851571150467097/1209822407028641813/XTRA_Text.png?ex=65e851eb&is=65d5dceb&hm=6c525b84d4ddac57e74da4cc45ab9cdf1572ecd34ee87f36a12663aa2c7b9e47&",
        },
    };
    member.send({ embed }); // Sending the initial embed to the user
});


client.login(process.env.TOKEN)