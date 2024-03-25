const resourcePath = global.GetResourcePath ? global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname;
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
        i.substr(j).replace(new RegExp('(\\' + decSep + '{3})(?=\\' + decSep + ')', 'g'), "$1" + thouSep) +
        (decPlaces ? decSep + Math.abs(number - i).toFixed(decPlaces).slice(2) : "");
}

let userConnected = '';
let banned = false;
let discord = 'None';

exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0]) {
        const embed = {
            "title": "An Error Occurred",
            "description": "Incorrect Usage\n\nCorrect Usage: " + process.env.PREFIX + "\n`!profile [permid]`",
            "color": 0x57F288,
        };
        return message.channel.send({ embed });
    }

    fivemexports.xtra.getConnected([parseInt(params[0])], (connected) => {
        userConnected = connected || 'N/A';
    });

    fivemexports.xtra.execute("SELECT * FROM `xtra_user_vehicles` WHERE user_id = ?", [params[0]], (cars) => {
        fivemexports.xtra.execute("SELECT * FROM `xtra_user_data` WHERE user_id = ?", [params[0]], (userdata) => {
            fivemexports.xtra.execute("SELECT * FROM xtra_warnings WHERE user_id = ?", [params[0]], (warnings) => {
                fivemexports.xtra.execute("SELECT * FROM xtra_user_moneys WHERE user_id = ?", [params[0]], (money) => {
                    fivemexports.xtra.execute("SELECT * FROM xtra_casino_chips WHERE user_id = ?", [params[0]], (chips) => {
                        fivemexports.xtra.execute("SELECT * FROM `xtra_users` WHERE id = ?", [params[0]], (users) => {
                            fivemexports.xtra.execute("SELECT discord_id FROM `xtra_verification` WHERE user_id = ?", [params[0]], (discordid) => {
                                discord = discordid[0]?.discord_id ? `<@${discordid[0].discord_id}>` : 'None';
                                const hours = JSON.stringify(JSON.parse(userdata[0]?.dvalue || '{}').PlayerTime / 60);
                                const obj = JSON.parse(userdata[0]?.dvalue || '{}').groups;
                                const lastlogin = users[0]?.last_login?.split(" ") || ['N/A', 'N/A'];
                                const time = lastlogin[0];
                                const date = lastlogin[1];
                                
                                banned = users[0]?.banned === 1 ? 'Yes' : 'No';

                                const embed = {
                                    "title": `**User Profile**`,
                                    "description": `Perm ID: ***${params[0]}***`,
                                    "color": settingsjson.settings.botColour,
                                    "fields": [
                                        {
                                            name: '**Last Known Username:**',
                                            value: `${users[0]?.username || 'None'}`,
                                            inline: true,
                                        },
                                        {
                                            name: '**Associated Discord:**',
                                            value: discord,
                                            inline: true,
                                        },
                                        {
                                            name: '**Balance:**',
                                            value: `Wallet: £${money[0]?.wallet?.toLocaleString() || 'N/A'}\nBank: £${money[0]?.bank?.toLocaleString() || 'N/A'}\nChips: ${chips[0]?.chips?.toLocaleString() || 'N/A'}`,
                                            inline: true,
                                        },
                                        {
                                            name: '**Connected:**',
                                            value: `User is ${userConnected}.`,
                                            inline: true,
                                        },
                                        {
                                            name: '**Last Logged In:**',
                                            value: `${date} at ${time}`,
                                            inline: true,
                                        },
                                        {
                                            name: '**Hours:**',
                                            value: `User has a total of ${Math.round(hours)} hours.`,
                                            inline: true,
                                        },
                                        {
                                            name: '**Groups:**',
                                            value: `${(JSON.stringify(Object.keys(obj)).replace(/"/g, '').replace('[', '').replace(']', '')).replace(/,/g, ', ')}`,
                                            inline: true,
                                        },
                                        {
                                            name: '**Garage:**',
                                            value: `User has a total of ${cars.length || '0'} vehicles in their garage.`,
                                            inline: true,
                                        },
                                        {
                                            name: '**F10:**',
                                            value: `User has a total of ${warnings.length || '0'} warnings.`,
                                            inline: true,
                                        },
                                        {
                                            name: '**Banned:**',
                                            value: `${banned}`,
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
};

exports.conf = {
    name: "profile",
    perm: 1,
    guild: "1195851569472741437"
};
