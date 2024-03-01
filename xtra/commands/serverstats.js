const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname;
const settingsjson = require(resourcePath + '/settings.js');

function formatMoney(number, decPlaces, decSep, thouSep) {
    decPlaces = isNaN(decPlaces = Math.abs(decPlaces)) ? 2 : decPlaces;
    decSep = typeof decSep === "undefined" ? "." : decSep;
    thouSep = typeof thouSep === "undefined" ? "," : thouSep;
    const sign = number < 0 ? "-" : "";
    const i = String(parseInt(number = Math.abs(Number(number) || 0).toFixed(decPlaces)));
    const j = (j = i.length) > 3 ? j % 3 : 0;

    return sign +
        (j ? i.substr(0, j) + thouSep : "") +
        i.substr(j).replace(new RegExp('(\\' + decSep + '{3})(?=' + decSep + ')', 'g'), "$1" + thouSep) +
        (decPlaces ? decSep + Math.abs(number - i).toFixed(decPlaces).slice(2) : "");
}

exports.runcmd = (fivemexports, client, message, params) => {
    let totalCash = 0;
    let totalBank = 0;
    let totalChips = 0;
    fivemexports.xtra.execute("SELECT * FROM `xtra_user_vehicles`", [], (cars) => {
        fivemexports.xtra.execute("SELECT * FROM `xtra_user_vehicles` WHERE locked = 1", [], (lockedcars) => {
            fivemexports.xtra.execute("SELECT * FROM `xtra_user_data`", [], (userdata) => {
                fivemexports.xtra.execute("SELECT * FROM xtra_warnings", [], (warnings) => {
                    fivemexports.xtra.execute("SELECT * FROM xtra_user_moneys", [], (money) => {
                        fivemexports.xtra.execute("SELECT * FROM xtra_casino_chips", [], (chips) => {
                            fivemexports.xtra.execute("SELECT * FROM `xtra_users`", [], (users) => {
                                fivemexports.xtra.execute("SELECT * FROM xtra_users WHERE banned = 1", (bannedPlayers) => {
                                    fivemexports.xtra.execute("SELECT * FROM xtra_anticheat", (totalACBans) => {
                                        fivemexports.xtra.execute("SELECT MAX(id) as maxId FROM `xtra_users`", [], (totalperms) => {
                                            for (let i = 0; i < chips.length; i++) {
                                                totalChips = parseInt(totalChips) + parseInt(chips[i].chips);
                                            }
                                            for (let i = 0; i < money.length; i++) {
                                                totalCash = parseInt(totalCash) + parseInt(money[i].wallet);
                                                totalBank = parseInt(totalBank) + parseInt(money[i].bank);
                                            }
                                            const totalPermIds = totalperms[0].maxId;
                                            const embed = {
                                                "title": `**Server Stats**`,
                                                "color": settingsjson.settings.botColour,
                                                "fields": [
                                                    {
                                                        name: '**Players Online:**',
                                                        value: `${GetNumPlayerIndices()}`,
                                                        inline: true,
                                                    },
                                                    {
                                                        name: '**Discord Members:**',
                                                        value: `${message.guild.memberCount}`,
                                                        inline: true,
                                                    },
                                                    {
                                                        name: '**Total Perm IDs:**',
                                                        value: `${totalPermIds}`,
                                                        inline: true,
                                                    },
                                                    {
                                                        name: '**Total Bans:**',
                                                        value: `${bannedPlayers.length}`,
                                                        inline: true,
                                                    },
                                                    {
                                                        name: '**Total Anticheat Bans:**',
                                                        value: `${totalACBans.length}`,
                                                        inline: true,
                                                    },
                                                    {
                                                        name: '**Total F10 Warnings:**',
                                                        value: `${warnings.length}`,
                                                        inline: true,
                                                    },
                                                    {
                                                        name: '**Total Owned Vehicles:**',
                                                        value: `${cars.length}`,
                                                        inline: true,
                                                    },
                                                    {
                                                        name: '**Total Locked Vehicles:**',
                                                        value: `${lockedcars.length}`,
                                                        inline: true,
                                                    },
                                                    {
                                                        name: '**Total Cash:**',
                                                        value: `£${totalCash.toLocaleString()}`,
                                                        inline: true,
                                                    },
                                                    {
                                                        name: '**Total Bank:**',
                                                        value: `£${totalBank.toLocaleString()}`,
                                                        inline: true,
                                                    },
                                                    {
                                                        name: '**Total Casino Chips:**',
                                                        value: `${totalChips.toLocaleString()}`,
                                                        inline: true,
                                                    },
                                                ],
                                                "footer": {
                                                    "text": `Requested by ${message.author.username}`
                                                },
                                                "timestamp": new Date()
                                            };
                                            message.channel.send({ embed });
                                        });
                                    });
                                });
                            });
                        });
                    });
                });
            });
        });
    });
};

exports.conf = {
    name: "serverstats",
    perm: 6,
    guild: "1195851569472741437"
};
