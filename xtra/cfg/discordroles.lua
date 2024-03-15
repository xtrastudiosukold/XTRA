cfg = {
	Guild_ID = '1195851569472741437',
  	Multiguild = false,
  	Guilds = {
		['Main'] = '1195851569472741437', 
		-- ['Police'] = '1130156614956101682', 
		-- ['NHS'] = '1196523451704422401',
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

--    ['Police'] = {
--         ['Commissioner'] = 1201278295233278043,
--         ['Deputy Commissioner'] = 1201278296885821460,
--         ['Assistant Commissioner'] = 1201278298240602172,
--         ['Dep. Asst. Commissioner'] = 1201278299679240192,
--         ['Commander'] = 1201278305886806170,
--         ['GC Advisor'] = 1201278308806053960,
--         ['Chief Superintendent'] = 1201278316917817504,
--         ['Superintendent'] = 1201278318067064952,
--         ['Chief Inspector'] = 1201008200539963432,
--         ['Inspector'] = 1201278328464744558,
--         ['Sergeant'] = 1201278334244499599,
--         ['Special Constable'] = 1201278310676697108,
--         ['Senior Constable'] = 1201346316211601430,
--         ['PC'] = 1201008207800311900,
--         ['PCSO'] = 1201278338371694673,
--         ['Large Arms Access'] = 1201008208643358791,
--         ['Police Horse Trained'] = 1201278452268028025,
--         ['Drone Trained'] = 1201278453618589737,
--         ['NPAS'] = 1201278418868777110,
--         ['K9 Trained'] = 1201278454985932891,
--     },


--     ['NHS'] = {
--         ['NHS Head Chief'] = 1196523452182573110,
--         ['NHS Assistant Chief'] = 1196523452182573108,
--         ['NHS Deputy Chief'] = 1196523452182573109,
-- 		['NHS Combat Medic'] = 1198421849986576444,
--        -- ['NHS Captain'] = 1193960804245065860, -- Not in
--         ['NHS Consultant'] = 1196523452098691129,
--         ['NHS Specialist'] = 1196523452098691128,
--         ['NHS Senior Doctor'] = 1196523452073521160,
--         ['NHS Doctor'] = 1196523452073521159,
--        -- ['NHS Experienced Paramedic'] = 1193960804194734200, -- Not in
--        -- ['NHS Neurologist'] = 1193960804194734198, -- Not in
--        -- ['NHS Physiotherapist'] = 1142435712382287962,  -- Not in
--        -- ['NHS GP'] = 1193960804194734200, -- Not in
--         ['NHS Field Trained Paramedic'] = 1196523452073521157,
--         ['NHS Paramedic'] = 1196523452073521154,
--       --  ['NHS Ambulance Technician'] = 1129257753140011009, -- not in
--         ['Drone Trained'] = 1196523451981246549,
--         ['HEMS'] = 1196523452010610782,
--     },


-- 	['HMP'] = {
--         ['Governor'] = 1130156157495951361,
--         ['Deputy Governor'] = 1130156158825529468,
--         ['Divisional Commander'] = 1130156159756681296,
--         ['Custodial Supervisor'] = 1130156171865632808,
--         ['Custodial Officer'] = 1130156172482203679,
--         ['Honourable Guard'] = 1130156183991373884,
--         ['Supervising Officer'] = 1130156178555551755,
--         ['Principal Officer'] = 1130156179776094278, 
--         ['Specialist Officer'] = 1130156180547833896, 
--         ['Senior Officer'] = 1130156181319598120,
--         ['Prison Officer'] = 1130156182343000074,
--         ['Trainee Prison Officer'] = 1130156182716285082, 
-- 	},

-- 	['Border'] = {
--         ['Director General'] = 1134450645341065366,
--         ['Regional Director'] = 1134450651510870086,
--         ['Assistant Director'] = 1134450656871190549,
--         ['Headquarters'] = 1134450662353154058,
--         ['Advisor'] = 1134450673942003752,
--         ['Senior Immigration Officer'] = 1134450785065906176,
--         ['Higher Immigration Officer'] = 1134450795237089381, 
--         ['Immigration Officer'] = 1134450800836485210, 
--         ['Assistant Immigration Officer'] = 1134450810454032424,
--         ['Administrative Assistant'] = 1134450820545511464,
--         ['Special Officer'] = 1134450825759035392, 
-- 	},

	-- ['LFB'] = {
	-- 	['Chief Fire Command'] = 1008206875923324988,
	-- 	['Divisional Command'] = 1008206879731757157,
	-- 	['Sector Command'] = 1008206880738390016,
	-- 	['Honourable Firefighter'] = 1008206885251469353,
	-- 	['Leading Firefighter'] = 1008206886002237571,
	-- 	['Specialist Firefighter'] = 1008206886761418762,
	-- 	['Advanced Firefighter'] = 1008206887558324246,
	-- 	['Senior Firefighter'] = 1008206888778862733,
	-- 	['Firefighter'] = 1008206889768730695,
	-- 	['Junior Firefighter'] = 1008206890775359590,
	-- 	['Provisional Firefighter'] = 1008206891157028927,	
	-- },	
}

for faction_name, faction_roles in pairs(cfg.Guild_Roles) do
	for role_name, role_id in pairs(faction_roles) do
		cfg.RoleList[role_name] = role_id
	end
end


cfg.Bot_Token = 'MTIwODQxMjAyMjgyMDA0NDg1MQ.G5Q8Vw.2YE_t6zuWJ0KPhK-s-Rb5Ss968Yvpdn8yqdaUk'

return cfg