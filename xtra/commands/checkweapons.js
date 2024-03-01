const Discord = require('discord.js');
const fs = require('fs');

const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

let descriptionText = ''

exports.runcmd = (fivemexports, client, message, params) => {
  
    fivemexports.xtra.execute("SELECT * FROM `xtra_weapon_whitelists` WHERE gunhash = ?", [params[0]], (result) => {
        var owners = []
        for (i = 0; i < result.length; i++) {              
            owners.push(`(${result[i].permid})\n`)
        }
        if (!result.length == 0){
        let embed = {
            "title": `All Users that own ${params[0]}:`, // spawncode 
            "description": descriptionText+'\n```'+owners.join('').replace(',', '')+'```',
            "color": settingsjson.settings.botColour,
            "footer": {
                "text": `Requested by ${message.author.username}`
            },
            "timestamp": new Date()
        }
        message.channel.send({ embed }).catch(err => {
            message.channel.send(`${params[0]} has too many owners to display in an embed.`)
        })
    }
        if (result.length == 0){
            return message.reply(`No one owns this weapon.`)
        }
    });
}

exports.conf = {
    name: "checkweapons",
    perm: 2,
    guild: "1195851569472741437"
}