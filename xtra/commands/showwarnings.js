var AsciiTable = require('ascii-table');
const Discord = require('discord.js');
const fs = require('fs');
const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0] || !parseInt(params[0])) {
        let embed = {
            "title": "An Error Occurred",
            "description": "Incorrect Usage\n\nCorrect Usage" + process.env.PREFIX + '\n`!showf10 [permid]`',
            "color": 0x57F288,
    }
    return message.channel.send({ embed })
    }
    fivemexports.xtra.execute("SELECT * FROM `xtra_warnings` WHERE user_id = ?", [params[0]], (result) => {
        var table = new AsciiTable(`F10 Warnings for Perm ID ${[params[0]]}`)
        table.setHeading('Warning ID', 'Warning Type', 'Duration', 'Reason', 'Admin', 'Date')
        for (i = 0; i < result.length; i++) {
            var date = new Date(+result[i].warning_date)
            table.addRow(result[i].warning_id, result[i].warning_type, result[i].duration, result[i].reason, result[i].admin, date.toDateString())
        }
        if (result.length == 0){
            return message.reply(`Perm ID ${params[0]} has no warnings!`)
        }
        message.channel.send('```ascii\n' + table.toString() + '```').catch(err => {
            fs.writeFile(`${client.path}/warnings_${params[0]}.txt`, table.toString(), function(err) {
                message.channel.send(`This F10 is too large for Discord, ${message.author}`, { files: [`${client.path}/warnings_${params[0]}.txt`] }).then(ss => {
                    fs.unlinkSync(`${client.path}/warnings_${params[0]}.txt`)
                })
            });
        })
    });
}

exports.conf = {
    name: "sw",
    perm: 1,
    guild: "1195851569472741437",
    support: true,
}