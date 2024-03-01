const resourcePath = global.GetResourcePath
  ? global.GetResourcePath(global.GetCurrentResourceName())
  : global.__dirname;
const settingsjson = require(resourcePath + '/settings.js');

let groups = ['Supporter', 'Premium', 'Supreme', 'Kingpin', 'Rainmaker', 'Baller'];
let hoursRoles = ['1000', '2000', '3000', '4000', '5000'];

exports.runcmd = async (fivemexports, client, message, params) => {
  let rolesCount = 0;
  let rolesOwned = [];
  let descriptionText = ':white_check_mark: You have received your discord roles:';
  let rolesToAdd = []; // Store roles to be added

  fivemexports.xtra.execute(
    "SELECT user_id FROM `xtra_verification` WHERE discord_id = ?",
    [message.author.id],
    (result) => {
      let user_id = result[0].user_id;
      fivemexports.xtra.execute(
        "SELECT * FROM `xtra_user_data` WHERE user_id = ? AND dkey = 'XTRA:datatable'",
        [user_id],
        async (data) => {
          if (data.length > 0 && data[0].dvalue) {
            const userData = JSON.parse(data[0].dvalue);
            let userGroups = Object.keys(userData.groups || {});
            const memberRoles = message.member.roles;

            for (const key of userGroups) {
              if (groups.includes(key)) {
                let role = message.guild.roles.find(r => r.name === `${key}`);
                if (role && !memberRoles.has(role.id)) {
                  rolesCount += 1;
                  rolesOwned.push(`\n${key}`);
                  rolesToAdd.push(role); // Add role to the list
                }
              }
            }

            if (rolesCount > 0) {
              let embed = {
                title: 'Roles',
                description: descriptionText + '```\n' + rolesOwned.join('').replace(',', '') + '```',
                color: settingsjson.settings.botColour,
                footer: {
                  text: '',
                },
                timestamp: new Date(),
              };
              const sentEmbed = await message.channel.send({ embed });

              // Add roles after embed is sent
              for (const roleToAdd of rolesToAdd) {
                await message.member.addRole(roleToAdd).catch(console.error);
              }
            } else {
              let noRolesEmbed = {
                title: 'No Roles Found',
                description: "You have no missing roles that need adding.",
                color: settingsjson.settings.botColour,
                footer: {
                  text: '',
                },
                timestamp: new Date(),
              };
              message.channel.send({ embed: noRolesEmbed });
            }
          } else {
            console.log("Data not found or dvalue missing.");
          }
        }
      );
    }
  );
};

exports.conf = {
  name: 'getroles',
  perm: 0,
  guild: '1195851569472741437',
};
