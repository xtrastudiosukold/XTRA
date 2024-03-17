cfg = {
	Guild_ID = '1195851569472741437',
  	Multiguild = true,
  	Guilds = {
		['Main'] = '1195851569472741437', 
		['Police'] = '1162517121251692626', 
		['NHS'] = '1194433414099632178',
		-- ['HMP'] = '1193963745710440549',
		--['Border'] = '1134450458006654976',
		--['LFB'] = '1008206756226277477',
  	},
	RoleList = {},

	CacheDiscordRoles = true, -- true to cache player roles, false to make a new Discord Request every time
	CacheDiscordRolesTime = 60, -- if CacheDiscordRoles is true, how long to cache roles before clearing (in seconds)
}

cfg.Guild_Roles = {
	['Main'] = {
		['Founder'] = 1195851569472741441, -- 12
		['Lead Developer'] = 1195851569510490249, -- 11
		['Developer'] = 1195851569510490248, -- 10
		['Community Manager'] = 1195851569510490247, -- 9
		['Staff Manager'] = 1195851569510490246, -- 8
		['Head Administrator'] = 1195851569510490245, -- 7
		['Senior Administrator'] = 1195851569497911435, -- 6
		['Administrator'] = 1195851569497911434, -- 5
		['Senior Moderator'] = 1195851569497911433, -- 4
		['Moderator'] = 1195851569497911432, -- 3
		['Support Team'] = 1195851569497911431, -- 2
		['Trial Staff'] = 1195851569497911430, -- 1
		['cardev'] = 1195851569485336735,
		['Cinematic'] = 1195851569472741439,
	},

   	['Police'] = {
        ['Commissioner'] = 1162521204956086293,
        ['Deputy Commissioner'] = 1162521210014412810,
        ['Assistant Commissioner'] = 1162521219040546956,
        ['Dep. Asst. Commissioner'] = 1162521223406825503,
        ['Commander'] = 1162521228788121672,
        ['GC Advisor'] = 1162521246714572925,
        ['Chief Superintendent'] = 1162521303220236369,
        ['Superintendent'] = 1162521307955609610,
        ['Chief Inspector'] = 1162521350246776923,
        ['Inspector'] = 1162521355472867328,
        ['Sergeant'] = 1162521369582514236,
        ['Special Constable'] = 1162521420841099326,
        ['Senior Constable'] = 1162521383629242439,
        ['PC'] = 1162521388389765212,
        ['PCSO'] = 1162521407020871780,
        ['Large Arms Access'] = 1162522044685107272,
        ['Police Horse Trained'] = 1162522140172623972,
        ['Drone Trained'] = 1201278453618589737,
        ['NPAS'] = 1162521942553808937,
        ['K9 Trained'] = 1162522257621528596,
    },


    ['NHS'] = {
        ['NHS Head Chief'] = 1194433414418399276,
        ['NHS Assistant Chief'] = 1196523452182573108,
        ['NHS Deputy Chief'] = 1196523452182573109,
		['NHS Combat Medic'] = 1198421849986576444,
        ['NHS Captain'] = 1193960804245065860, -- Not in
        ['NHS Consultant'] = 1196523452098691129,
        ['NHS Specialist'] = 1196523452098691128,
        ['NHS Senior Doctor'] = 1196523452073521160,
        ['NHS Doctor'] = 1196523452073521159,
        ['NHS Experienced Paramedic'] = 1193960804194734200, -- Not in
        ['NHS Neurologist'] = 1193960804194734198, -- Not in
        ['NHS Physiotherapist'] = 1142435712382287962,  -- Not in
        ['NHS GP'] = 1193960804194734200, -- Not in
        ['NHS Field Trained Paramedic'] = 1196523452073521157,
        ['NHS Paramedic'] = 1196523452073521154,
        ['NHS Ambulance Technician'] = 1129257753140011009, -- not in
        ['Drone Trained'] = 1196523451981246549,
        ['HEMS'] = 1196523452010610782,
    },


	['HMP'] = {
        ['Governor'] = 1196740743658745886,
        ['Deputy Governor'] = 1196740744736686172,
        ['Divisional Commander'] = 1196740768367378462,
        ['Custodial Supervisor'] = 1196740770670051450,
        ['Custodial Officer'] = 1196740772012232734,
        ['Honourable Guard'] = 1196740780165972028,
        ['Supervising Officer'] = 1196740773283110963,
        ['Principal Officer'] = 1196740774671417425, 
        ['Specialist Officer'] = 1196740775896158230, 
        ['Senior Officer'] = 1196740776969895946,
        ['Prison Officer'] = 1196740777792000083,
        ['Trainee Prison Officer'] = 1196740779025121340, 
    },
}

for faction_name, faction_roles in pairs(cfg.Guild_Roles) do
	for role_name, role_id in pairs(faction_roles) do
		cfg.RoleList[role_name] = role_id
	end
end


cfg.Bot_Token = 'MTIwODQxMjAyMjgyMDA0NDg1MQ.G9rt__.5QPSCKoMO-3etODrzzcVZXx3vexhnluDFfRbkY'

return cfg