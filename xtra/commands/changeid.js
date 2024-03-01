const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
  
    if (!params[0] || !(params[1])) {
        let embed = {
            "title": "An Error Occurred",
            "description": "Incorrect Usage\n\nCorrect Usage" + process.env.PREFIX + '\n`!changeid [old perm id] [new perm id]`',
            "color": 0x9c5cb4,
    }
    return message.channel.send({ embed })
    }
    fivemexports['xtra'].execute("SELECT * FROM xtra_user_ids WHERE user_id = ?", [parseInt(params[0])], (change) => {
        fivemexports['xtra'].execute("SELECT * FROM xtra_user_ids WHERE user_id = ?", [parseInt(params[1])], (changeto) => {
            for (i = 0; i < change.length; i++) {
                fivemexports['xtra'].execute('UPDATE xtra_user_ids SET user_id = ? WHERE identifier = ?', [parseInt(params[1]), change[i].identifier])
            }
            for (i = 0; i < changeto.length; i++) {
                fivemexports['xtra'].execute('UPDATE xtra_user_ids SET user_id = ? WHERE identifier = ?', [parseInt(params[0]), changeto[i].identifier])
            }
            fivemexports['xtra'].execute("SELECT * FROM xtra_user_data WHERE user_id = ?", [parseInt(params[0])], async(change) => {
                fivemexports['xtra'].execute("SELECT * FROM xtra_user_data WHERE user_id = ?", [parseInt(params[1])], async(changeto) => {
                    //Change USER DATA
                    await fivemexports['xtra'].execute("DELETE FROM xtra_user_data WHERE user_id = ?", [parseInt(params[0])])
                    await fivemexports['xtra'].execute("DELETE FROM xtra_user_data WHERE user_id = ?", [parseInt(params[1])])
                    for (i = 0; i < change.length; i++) {
                        fivemexports['xtra'].execute('INSERT INTO xtra_user_data (user_id, dkey, dvalue) VALUES(?,?,?)', [parseInt(params[1]), "XTRA:datatable", change[i].dvalue])
                        fivemexports['xtra'].execute('INSERT INTO xtra_user_data (user_id, dkey, dvalue) VALUES(?,?,?)', [parseInt(params[1]), "XTRA:Face:Data", change[i].dvalue])
                        fivemexports['xtra'].execute('INSERT INTO xtra_user_data (user_id, dkey, dvalue) VALUES(?,?,?)', [parseInt(params[1]), "XTRA:home:wardrobe", change[i].dvalue])
                        fivemexports['xtra'].execute('INSERT INTO xtra_user_data (user_id, dkey, dvalue) VALUES(?,?,?)', [parseInt(params[1]), "XTRA:police_records", change[i].dvalue])
                        fivemexports['xtra'].execute('INSERT INTO xtra_user_data (user_id, dkey, dvalue) VALUES(?,?,?)', [parseInt(params[1]), "XTRA:jail:time", change[i].dvalue])
                    }
                    for (i = 0; i < changeto.length; i++) {
                        fivemexports['xtra'].execute('INSERT INTO xtra_user_data (user_id, dkey, dvalue) VALUES(?,?,?)', [parseInt(params[0]), "XTRA:datatable", changeto[i].dvalue])
                        fivemexports['xtra'].execute('INSERT INTO xtra_user_data (user_id, dkey, dvalue) VALUES(?,?,?)', [parseInt(params[0]), "XTRA:Face:Data", changeto[i].dvalue])
                        fivemexports['xtra'].execute('INSERT INTO xtra_user_data (user_id, dkey, dvalue) VALUES(?,?,?)', [parseInt(params[0]), "XTRA:home:wardrobe", changeto[i].dvalue])
                        fivemexports['xtra'].execute('INSERT INTO xtra_user_data (user_id, dkey, dvalue) VALUES(?,?,?)', [parseInt(params[0]), "XTRA:police_records", changeto[i].dvalue])
                        fivemexports['xtra'].execute('INSERT INTO xtra_user_data (user_id, dkey, dvalue) VALUES(?,?,?)', [parseInt(params[0]), "XTRA:jail:time", changeto[i].dvalue])
                    }
                })
            })
            fivemexports['xtra'].execute("SELECT * FROM xtra_user_data WHERE user_id = ?", [parseInt(params[0])], (change) => {
                fivemexports['xtra'].execute("SELECT * FROM xtra_user_data WHERE user_id = ?", [parseInt(params[1])], (changeto) => {
                   // Change USER DATA
                    fivemexports['xtra'].execute("DELETE FROM xtra_user_data WHERE user_id = ?", [parseInt(params[0])])
                    fivemexports['xtra'].execute("DELETE FROM xtra_user_data WHERE user_id = ?", [parseInt(params[1])])
                    setTimeout(() => {

                        for (i = 0; i < change.length; i++) {
                            fivemexports['xtra'].execute('INSERT INTO xtra_user_data (user_id, dkey, dvalue) VALUES(?,?,?)', [parseInt(params[1]), "XTRA:datatable", change[i].dvalue])
                            fivemexports['xtra'].execute('INSERT INTO xtra_user_data (user_id, dkey, dvalue) VALUES(?,?,?)', [parseInt(params[1]), "XTRA:Face:Data", change[i].dvalue])
                            fivemexports['xtra'].execute('INSERT INTO xtra_user_data (user_id, dkey, dvalue) VALUES(?,?,?)', [parseInt(params[1]), "XTRA:home:wardrobe", change[i].dvalue])
                            fivemexports['xtra'].execute('INSERT INTO xtra_user_data (user_id, dkey, dvalue) VALUES(?,?,?)', [parseInt(params[1]), "XTRA:police_records", change[i].dvalue])
                            fivemexports['xtra'].execute('INSERT INTO xtra_user_data (user_id, dkey, dvalue) VALUES(?,?,?)', [parseInt(params[1]), "XTRA:jail:time", change[i].dvalue])
                        }
                        for (i = 0; i < changeto.length; i++) {
                            fivemexports['xtra'].execute('INSERT INTO xtra_user_data (user_id, dkey, dvalue) VALUES(?,?,?)', [parseInt(params[0]), "XTRA:datatable", changeto[i].dvalue])
                            fivemexports['xtra'].execute('INSERT INTO xtra_user_data (user_id, dkey, dvalue) VALUES(?,?,?)', [parseInt(params[0]), "XTRA:Face:Data", changeto[i].dvalue])
                            fivemexports['xtra'].execute('INSERT INTO xtra_user_data (user_id, dkey, dvalue) VALUES(?,?,?)', [parseInt(params[0]), "XTRA:home:wardrobe", changeto[i].dvalue])
                            fivemexports['xtra'].execute('INSERT INTO xtra_user_data (user_id, dkey, dvalue) VALUES(?,?,?)', [parseInt(params[0]), "XTRA:police_records", changeto[i].dvalue])
                            fivemexports['xtra'].execute('INSERT INTO xtra_user_data (user_id, dkey, dvalue) VALUES(?,?,?)', [parseInt(params[0]), "XTRA:jail:time", changeto[i].dvalue])
                        }
                    }, 500);
                })
            })
            fivemexports['xtra'].execute("SELECT * FROM xtra_user_moneys WHERE user_id = ?", [parseInt(params[0])], (change) => {
                fivemexports['xtra'].execute("SELECT * FROM xtra_user_moneys WHERE user_id = ?", [parseInt(params[1])], (changeto) => {
                    for (i = 0; i < change.length; i++) {
                        fivemexports['xtra'].execute('UPDATE xtra_user_moneys SET user_id = ? WHERE user_id = ?', [parseInt(params[1]), change[i].vehicle])
                    }
                    for (i = 0; i < changeto.length; i++) {
                        fivemexports['xtra'].execute('UPDATE xtra_user_moneyss SET user_id = ? WHERE user_id = ?', [parseInt(params[0]), changeto[i].vehicle])
                    }
                })
            })
            fivemexports['xtra'].execute("SELECT * FROM xtra_user_vehicles WHERE user_id = ?", [parseInt(params[0])], (change) => {
                fivemexports['xtra'].execute("SELECT * FROM xtra_user_vehicles WHERE user_id = ?", [parseInt(params[1])], (changeto) => {
                    for (i = 0; i < change.length; i++) {
                        setInterval(() => {
                            fivemexports['xtra'].execute('UPDATE xtra_user_vehicles SET user_id = ? WHERE vehicle = ?', [parseInt(params[1]), change[i].vehicle])
                        }, 2000);
                    }
                    for (i = 0; i < changeto.length; i++) {
                        setInterval(() => {
                            fivemexports['xtra'].execute('UPDATE xtra_user_vehicles SET user_id = ? WHERE vehicle = ?', [parseInt(params[0]), changeto[i].vehicle])
                        }, 2000);
                    }

                })
            })
            fivemexports['xtra'].execute("SELECT * FROM xtra_user_homes WHERE user_id = ?", [parseInt(params[0])], (change) => {
                fivemexports['xtra'].execute("SELECT * FROM xtra_user_homes WHERE user_id = ?", [parseInt(params[1])], (changeto) => {
                    for (i = 0; i < change.length; i++) {
                        fivemexports['xtra'].execute('UPDATE xtra_user_homes SET user_id = ? WHERE home = ?', [parseInt(params[1]), change[i].home])
                    }
                    for (i = 0; i < changeto.length; i++) {
                        fivemexports['xtra'].execute('UPDATE xtra_user_homes SET user_id = ? WHERE home = ?', [parseInt(params[0]), changeto[i].home])
                    }
                })
            })                
        })
    })
    let embed = {
        "title": "Change Perm ID",
        "description": `\nOld Perm ID: **${params[0]}**\nNew Perm ID: **${params[1]}**\n\nAdmin: <@${message.author.id}>`,
        "color": settingsjson.settings.botColour,
        "footer": {
            "text": ""
        },
        "timestamp": new Date()
    }
    message.channel.send({ embed })
}
exports.conf = {
    name: "changeid",
    perm: 11,
    guild: "1195851569472741437"
}