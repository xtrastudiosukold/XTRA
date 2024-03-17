local cfg = {}

cfg.groups = {

--
--    ░██████╗████████╗░█████╗░███████╗███████╗
--    ██╔════╝╚══██╔══╝██╔══██╗██╔════╝██╔════╝
--    ╚█████╗░░░░██║░░░███████║█████╗░░█████╗░░
--    ░╚═══██╗░░░██║░░░██╔══██║██╔══╝░░██╔══╝░░
--    ██████╔╝░░░██║░░░██║░░██║██║░░░░░██║░░░░░
--    ╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░░░░╚═╝░░░░░     

    ["Founder"] = {
        "admin.ban",
        "admin.unban",
        "admin.kick",
        "admin.revive",
        "admin.tp2player",
        "admin.freeze",
        "admin.getgroups",
        "admin.spectate",
        "admin.screenshot",
        "admin.video",
        "admin.slap",
        "admin.tp2waypoint",
        "admin.tp2coords",
        "admin.removewarn",
        "admin.noclip",
        "admin.addcar",
        "admin.managecommunitypot",
        "admin.moneymenu",
        "group.add.vip",
        "admin.changename",
        "group.add.founder",
        "group.add.operationsmanager",
        "group.add.staffmanager",
        "group.add.commanager",
        "group.add.headadmin",
        "group.add.senioradmin",
        "group.add.administrator",
        "group.add.srmoderator",
        "group.add.moderator",
        "group.add.supportteam",
        "group.add.trial",
        "group.add.pov",
        "group.add",
        "group.remove.vip",
        "group.remove.founder",
        "group.remove.operationsmanager",
        "group.remove.staffmanager",
        "group.remove.commanager",
        "group.remove.headadmin",
        "group.remove.senioradmin",
        "group.remove.administrator",
        "group.remove.srmoderator",
        "group.remove.moderator",
        "group.remove.supportteam",
        "group.remove.trial",
        "group.remove.pov",
        "group.remove",
        "admin.tickets",
        "cardev.menu",
        "vip.gunstore",
        "vip.garage",
        "police.dev",
        "admin.dailyboot"
    },
    ["Lead Developer"] = {
        "admin.ban",
        "admin.unban",
        "admin.kick",
        "admin.revive",
        "admin.tp2player",
        "admin.changename",
        "admin.freeze",
        "admin.getgroups",
        "admin.spectate",
        "admin.screenshot",
        "admin.video",
        "admin.slap",
        "admin.tp2waypoint",
        "admin.tp2coords",
        "admin.removewarn",
        "admin.noclip",
        "admin.addcar",
        "admin.managecommunitypot",
        "admin.moneymenu",
        "group.add.vip",
        "group.add.founder",
        "group.add.operationsmanager",
        "group.add.staffmanager",
        "group.add.commanager",
        "group.add.headadmin",
        "group.add.senioradmin",
        "group.add.administrator",
        "group.add.srmoderator",
        "group.add.moderator",
        "group.add.supportteam",
        "group.add.trial",
        "group.add.pov",
        "group.add",
        "group.remove.vip",
        "group.remove.founder",
        "group.remove.operationsmanager",
        "group.remove.staffmanager",
        "group.remove.commanager",
        "group.remove.headadmin",
        "group.remove.senioradmin",
        "group.remove.administrator",
        "group.remove.srmoderator",
        "group.remove.moderator",
        "group.remove.supportteam",
        "group.remove.trial",
        "group.remove.pov",
        "group.remove",
        "admin.tickets",
        "cardev.menu",
        "vip.gunstore",
        "vip.garage",
        "police.dev",
        "admin.dailyboot"
    },
    ["Developer"] = {
        "admin.ban",
        "admin.unban",
        "admin.kick",
        "admin.revive",
        "admin.tp2player",
        "admin.freeze",
        "admin.getgroups",
        "admin.spectate",
        "admin.screenshot",
        "admin.video",
        "admin.slap",
        "admin.tp2waypoint",
        "admin.tp2coords",
        "admin.removewarn",
        "admin.noclip",
        "admin.addcar",
        "admin.managecommunitypot",
        "admin.moneymenu",
        "group.add.vip",
        "group.add.founder",
        "group.add.operationsmanager",
        "group.add.staffmanager",
        "group.add.commanager",
        "group.add.headadmin",
        "group.add.senioradmin",
        "group.add.administrator",
        "group.add.srmoderator",
        "group.add.moderator",
        "group.add.supportteam",
        "group.add.trial",
        "group.add.pov",
        "group.add",
        "group.remove.vip",
        "group.remove.founder",
        "group.remove.operationsmanager",
        "group.remove.staffmanager",
        "group.remove.commanager",
        "group.remove.headadmin",
        "group.remove.senioradmin",
        "group.remove.administrator",
        "group.remove.srmoderator",
        "group.remove.moderator",
        "group.remove.supportteam",
        "group.remove.trial",
        "group.remove.pov",
        "group.remove",
        "admin.tickets",
        "cardev.menu",
        "vip.gunstore",
        "vip.garage",
        "police.dev"
    },
    ["Staff Manager"] = {
        "admin.ban",
        "admin.unban",
        "admin.kick",
        "admin.revive",
        "admin.tp2player",
        "admin.freeze",
        "admin.getgroups",
        "admin.spectate",
        "admin.addcar",
        "admin.screenshot",
        "admin.video",
        "admin.slap",
        "admin.tp2waypoint",
        "admin.tp2coords",
        "admin.removewarn",
        "admin.noclip",
        "cardev.menu",
        "admin.changename",
        "group.add.vip",
        "group.add.commanager",
        "group.add.headadmin",
        "group.add.senioradmin",
        "group.add.administrator",
        "group.add.srmoderator",
        "group.add.moderator",
        "group.add.supportteam",
        "group.add.trial",
        "group.add.pov",
        "group.add",
        "group.remove.vip",
        "group.remove.commanager",
        "group.remove.headadmin",
        "group.remove.senioradmin",
        "group.remove.administrator",
        "group.remove.srmoderator",
        "group.remove.moderator",
        "group.remove.supportteam",
        "group.remove.trial",
        "group.remove.pov",
        "group.remove",
        "admin.tickets"
    },
    ["Community Manager"] = {
        "admin.ban",
        "admin.changename",
        "admin.unban",
        "admin.kick",
        "admin.revive",
        "admin.tp2player",
        "admin.addcar",
        "admin.freeze",
        "admin.getgroups",
        "admin.spectate",
        "admin.screenshot",
        "admin.video",
        "admin.slap",
        "admin.tp2waypoint",
        "admin.tp2coords",
        "admin.removewarn",
        "admin.noclip",
        "dev.menu",
        "admin.managecommunitypot",
        "admin.moneymenu",
        "group.add.headadmin",
        "group.add.senioradmin",
        "group.add.administrator",
        "group.add.srmoderator",
        "group.add.moderator",
        "group.add.supportteam",
        "group.add.trial",
        "group.add.pov",
        "group.add",
        "group.remove.headadmin",
        "group.remove.senioradmin",
        "group.remove.administrator",
        "group.remove.srmoderator",
        "group.remove.moderator",
        "group.remove.supportteam",
        "group.remove.trial",
        "group.remove.pov",
        "group.remove",
        "admin.tickets"
    },
    ["Head Administrator"] = {
        "admin.ban",
        "admin.changename",
        "admin.unban",
        "admin.kick",
        "admin.revive",
        "admin.tp2player",
        "admin.addcar",
        "admin.freeze",
        "admin.getgroups",
        "admin.spectate",
        "admin.screenshot",
        "admin.video",
        "admin.slap",
        "admin.tp2waypoint",
        "admin.tp2coords",
        "admin.removewarn",
        "admin.noclip",
        "dev.menu",
        "admin.managecommunitypot",
        "admin.moneymenu",
        "group.add.headadmin",
        "group.add.senioradmin",
        "group.add.administrator",
        "group.add.srmoderator",
        "group.add.moderator",
        "group.add.supportteam",
        "group.add.trial",
        "group.add.pov",
        "group.add",
        "group.remove.headadmin",
        "group.remove.senioradmin",
        "group.remove.administrator",
        "group.remove.srmoderator",
        "group.remove.moderator",
        "group.remove.supportteam",
        "group.remove.trial",
        "group.remove.pov",
        "group.remove",
        "admin.tickets"
    },
    ["Senior Administrator"] = {
        "admin.ban",
        "admin.unban",
        "admin.kick",
        "admin.revive",
        "admin.tp2player",
        "admin.freeze",
        "admin.spectate",
        "admin.screenshot",
        "admin.video",
        "admin.slap",
        "admin.tp2waypoint",
        "admin.tp2coords",
        "admin.removewarn",
        "admin.noclip",
        "admin.tickets"
    },
    ["Administrator"] = {
        "admin.ban",
        "admin.unban",
        "admin.kick",
        "admin.revive",
        "admin.tp2player",
        "admin.freeze",
        "admin.spectate",
        "admin.screenshot",
        "admin.video",
        "admin.slap",
        "admin.tp2waypoint",
        "admin.tp2coords",
        "admin.noclip",
        "admin.tickets"
    },
    ["Senior Moderator"] = {
        "admin.unban",
        "admin.ban",
        "admin.kick",
        "admin.revive",
        "admin.slap",
        "admin.tp2player",
        "admin.freeze",
        "admin.screenshot",
        "admin.video",
        "admin.spectate",
        "admin.tickets",
    },
    ["Moderator"] = {
        "admin.ban",
        "admin.kick",
        "admin.tp2player",
        "admin.freeze",
        "admin.screenshot",
        "admin.video",
        "admin.spectate",
        "admin.tickets",
        "admin.revive",
    },
    ["Support Team"] = {
        "admin.kick",
        "admin.spectate",
        "admin.tp2player",
        "admin.freeze",
        "admin.tickets",
        "admin.screenshot",
        "admin.video",
    },
    ["Trial Staff"] = {
        "admin.kick",
        "admin.tp2player",
        "admin.video",
        "admin.freeze",
        "admin.tickets",
    },
    ["cardev"] = {
        "cardev.menu",
        "admin.addcar"
    },
   

--  ███╗░░░███╗███████╗████████╗  ██████╗░░█████╗░██╗░░░░░██╗░█████╗░███████╗
--  ████╗░████║██╔════╝╚══██╔══╝  ██╔══██╗██╔══██╗██║░░░░░██║██╔══██╗██╔════╝
--  ██╔████╔██║█████╗░░░░░██║░░░  ██████╔╝██║░░██║██║░░░░░██║██║░░╚═╝█████╗░░
--  ██║╚██╔╝██║██╔══╝░░░░░██║░░░  ██╔═══╝░██║░░██║██║░░░░░██║██║░░██╗██╔══╝░░
--  ██║░╚═╝░██║███████╗░░░██║░░░  ██║░░░░░╚█████╔╝███████╗██║╚█████╔╝███████╗
--  ╚═╝░░░░░╚═╝╚══════╝░░░╚═╝░░░  ╚═╝░░░░░░╚════╝░╚══════╝╚═╝░╚════╝░╚══════╝
                                                              
    ["Large Arms Access"] = {
        "police.loadshop2",
        "police.maxarmour"
    }, 
    ["Police Horse Trained"] = {}, 
    ["K9 Trained"] = {}, 
    ["Drone Trained"] = {},
    ["NPAS Clocked"] = {
        "cop.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.npas",
    },
    ["NPAS"] = {
        "cop.whitelisted"
    },
    ["Trident Command Clocked"] = {
        "cop.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.undercover",
        "police.tridentcommand",
    },
    ["Trident Command"] = {
        "cop.whitelisted"
    },
    ["Trident Officer Clocked"] = {
        "cop.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.undercover",
        "police.tridentofficer",
    },
    ["Trident Officer"] = {
        "cop.whitelisted"
    },
    ["Commissioner Clocked"] = {
        "cop.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.announce",
        "police.commissioner",
        "police.maxarmour",
        "police.announce",
        "police.dev"
    },
    ["Commissioner"] = {
        "cop.whitelisted"
    },
    ["Deputy Commissioner Clocked"] = {
        "cop.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.announce",
        "police.deputycommissioner",
        "police.maxarmour",
        "police.announce"
    },
    ["Deputy Commissioner"] = {
        "cop.whitelisted"
    },
    ["Assistant Commissioner Clocked"] = {
        "cop.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.announce",
        "police.assistantcommissioner",
        "police.maxarmour",
        "police.announce"
    },
    ["Assistant Commissioner"] = {
        "cop.whitelisted"
    },
    ["Dep. Asst. Commissioner Clocked"] = {
        "cop.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.announce",
        "police.deputyassistantcommissioner",
        "police.maxarmour",
        "police.announce"
    },
    ["Dep. Asst. Commissioner"] = {
        "cop.whitelisted"
    },
    ["GC Advisor Clocked"] = {
        "cop.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.announce",
        "police.advisor",
        "police.maxarmour",
        "police.announce"
    },
    ["GC Advisor"] = {
        "cop.whitelisted"
    },
    ["Commander Clocked"] = {
        "cop.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.announce",
        "police.commander",
        "police.maxarmour",
        "police.announce"
    },
    ["Commander"] = {
        "cop.whitelisted",
        "police.announce"
    },
    ["Chief Superintendent Clocked"] = {
        "cop.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.chiefsuperintendent",
        "police.maxarmour",
    },
    ["Chief Superintendent"] = {
        "cop.whitelisted"
    },
    ["Superintendent Clocked"] = {
        "cop.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.superintendent",
        "police.maxarmour",
    },
    ["Superintendent"] = {
        "cop.whitelisted"
    },
    ["Special Constable Clocked"] = {
        "cop.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.specialconstable",
        "police.announce",
        "police.maxarmour",
    },
    ["Special Constable"] = {
        "cop.whitelisted"
    },
    ["Chief Inspector Clocked"] = {
        "cop.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.chiefinspector",
        "police.maxarmour",
    },
    ["Chief Inspector"] = {
        "cop.whitelisted"
    },
    ["Inspector Clocked"] = {
        "cop.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.inspector",
    },
    ["Inspector"] = {
        "cop.whitelisted"
    },
    ["Sergeant Clocked"] = {
        "cop.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.sergeant",
    },
    ["Sergeant"] = {
        "cop.whitelisted"
    },
    ["Senior Constable Clocked"] = {
        "cop.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.seniorconstable",
    },
    ["Senior Constable"] = {
        "cop.whitelisted"
    },
    ["PC Clocked"] = {
        "cop.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.constable",
    },
    ["PC"] = {
        "cop.whitelisted"
    },
    ["PCSO Clocked"] = {
        "cop.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.pcso",
    },
    ["PCSO"] = {
        "cop.whitelisted"
    },

    -- Border Force
    -- Border Force
    ["Director General Clocked"] = {
        "border.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.announce",
        "police.commissioner",
        "police.maxarmour",
        "police.announce"
    },
    ["Director General"] = {
        "border.whitelisted"
    },
    ["Regional Director Clocked"] = {
        "border.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.announce",
        "police.deputycommissioner",
        "police.maxarmour",
        "police.announce"
    },
    ["Regional Director Commissioner"] = {
        "border.whitelisted"
    },
    ["Assistant Director Clocked"] = {
        "border.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.announce",
        "police.assistantcommissioner",
        "police.maxarmour",
        "police.announce"
    },
    ["Assistant Director Commissioner"] = {
        "border.whitelisted"
    },
    ["Headquarters Clocked"] = {
        "border.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.announce",
        "police.deputyassistantcommissioner",
        "police.maxarmour",
        "police.announce"
    },
    ["Headquarters"] = {
        "border.whitelisted"
    },
    ["Advisor Clocked"] = {
        "border.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.announce",
        "police.advisor",
        "police.maxarmour",
        "police.announce"
    },
    ["Advisor"] = {
        "border.whitelisted"
    },
    ["Senior Immigration Officer Clocked"] = {
        "border.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.chiefsuperintendent",
        "police.maxarmour",
    },
    ["Senior Immigration Officer"] = {
        "border.whitelisted"
    },
    ["Higher Immigration Officer Clocked"] = {
        "border.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.superintendent",
        "police.maxarmour",
    },
    ["Higher Immigration Officer"] = {
        "border.whitelisted"
    },
    ["Immigration Officer Clocked"] = {
        "border.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.specialconstable",
        "police.announce",
        "police.maxarmour",
    },
    ["Immigration Officer"] = {
        "border.whitelisted"
    },
    ["Assistant Immigration Officer Clocked"] = {
        "border.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.chiefinspector",
        "police.maxarmour",
    },
    ["Assistant Immigration Officer"] = {
        "border.whitelisted"
    },
    ["Administrative Assistant Clocked"] = {
        "border.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.inspector",
    },
    ["Administrative Assistant"] = {
        "border.whitelisted"
    },
    ["Special Officer Clocked"] = {
        "border.whitelisted",
        "police.armoury",
        "police.armoury",
        "police.sergeant",
    },
    ["Special Officer"] = {
        "border.whitelisted"
    },


    -- HMP CBA TO MAKE A BIG THING LIKE THE OTHERS

      -- START HMP --



  ["Prison Officer"] = {
    "hmp.whitelisted",
	},

  ["Senior Officer"] = {
    "hmp.whitelisted",
	},

  ["Specialist Officer"] = {
    "hmp.whitelisted",
	},

  ["Principal Officer"] = {
    "hmp.whitelisted",
	},

  ["Supervising Officer"] = {
    "hmp.whitelisted",
	},

  ["Honourable Guard"] = {
    "hmp.whitelisted",
	},

  ["Custodial Officer"] = {
    "hmp.whitelisted",
	},

  ["Custodial Supervisor"] = {
    "hmp.whitelisted",
	},
  
  ["Divisional Commander"] = {
    "hmp.whitelisted",
	},

  ["Deputy Governor"] = {
    "hmp.whitelisted",
	},

  ["Governor"] = {
    "hmp.whitelisted",

	},

  ["Trainee Prison Officer Clocked"] = {
		"hmp.traineeprisonofficer.whitelisted",
    "hmp.menu",
	},

  ["Prison Officer Clocked"] = {
		"hmp.prisonofficer.whitelisted",
    "hmp.menu",
	},

  ["Senior Officer Clocked"] = {
		"hmp.seniorofficer.whitelisted",
    "hmp.menu",
	},

  ["Specialist Officer Clocked"] = {
		"hmp.specialistofficer.whitelisted",
    "hmp.menu",
	},

  ["Principal Officer Clocked"] = {
		"hmp.principalofficer.whitelisted",
    "hmp.menu",
	},

  ["Supervising Officer Clocked"] = {
		"hmp.supervisingofficer.whitelisted",
    "hmp.menu",
	},

  ["Honourable Guard Clocked"] = {
		"hmp.honourableguard.whitelisted",
    "hmp.menu",
	},

  ["Custodial Officer Clocked"] = {
		"hmp.custodialofficer.whitelisted",
    "hmp.menu",
	},

  ["Custodial Supervisor Clocked"] = {
		"hmp.custodialsupervisor.whitelisted",
    "hmp.menu",
	},
  
  ["Divisional Commander Clocked"] = {
		"hmp.divisionalcommander.whitelisted",
    "hmp.menu",
	},

  ["Deputy Governor Clocked"] = {
		"hmp.deputygovernor.whitelisted",
    "hmp.menu",
	},

  ["Governor Clocked"] = {
		"hmp.governor.whitelisted",
    "hmp.menu",
	},

  -- END OF HMP --


--  ███╗░░██╗██╗░░██╗░██████╗
--  ████╗░██║██║░░██║██╔════╝
--  ██╔██╗██║███████║╚█████╗░
--  ██║╚████║██╔══██║░╚═══██╗
--  ██║░╚███║██║░░██║██████╔╝
--  ╚═╝░░╚══╝╚═╝░░╚═╝╚═════╝░

    ["HEMS Clocked"] = {
        "nhs.whitelisted",
        "nhs.menu",
        "nhs.hems",
    },
    ["HEMS"] = {
        "nhs.whitelisted"
    },                                               
    ["NHS Head Chief Clocked"] = {
        "nhs.menu",
        "nhs.whitelisted",
        "nhs.headchief",
        "nhs.announce",
    },
    ["NHS Head Chief"] = {
        "nhs.whitelisted",
    },
    ["NHS Assistant Chief Clocked"] = {
        "nhs.menu",
        "nhs.whitelisted",
        "nhs.assistantchief",
        "nhs.announce",
    },
    ["NHS Assistant Chief"] = {
        "nhs.whitelisted",
    },
    ["NHS Deputy Chief Clocked"] = {
        "nhs.menu",
        "nhs.whitelisted",
        "nhs.deputychief",
        "nhs.announce",
    },
    ["NHS Deputy Chief"] = {
        "nhs.whitelisted",
    },
    ["NHS Combat Medic Clocked"] = {
        "nhs.menu",
        "nhs.whitelisted",
        "nhs.combatmedic",
        "nhs.announce",
    },
    ["NHS Combat Medic"] = {
        "nhs.whitelisted",
    },
    ["NHS Captain Clocked"] = {
        "nhs.menu",
        "nhs.whitelisted",
        "nhs.announce",
    },
    ["NHS Captain"] = {
        "nhs.whitelisted",
        "nhs.captain",
    },
    ["NHS Consultant Clocked"] = {
        "nhs.menu",
        "nhs.whitelisted",
        "nhs.consultant",
    },
    ["NHS Consultant"] = {
        "nhs.whitelisted",
    },
    ["NHS Specialist Clocked"] = {
        "nhs.menu",
        "nhs.whitelisted",
        "nhs.specialist",
    },
    ["NHS Specialist"] = {
        "nhs.whitelisted",
    },
    ["NHS Senior Doctor Clocked"] = {
        "nhs.menu",
        "nhs.whitelisted",
        "nhs.seniordoctor",
    },
    ["NHS Senior Doctor"] = {
        "nhs.whitelisted",
    },
    ["NHS Doctor Clocked"] = {
        "nhs.menu",
        "nhs.whitelisted",
        "nhs.doctor",
    },
    ["NHS Doctor"] = {
        "nhs.whitelisted",
    },
    ["NHS Physiotherapist Clocked"] = {
        "nhs.menu",
        "nhs.whitelisted",
        "nhs.rapist",
    },
    ["NHS Physiotherapist"] = {
        "nhs.whitelisted",
    },
    ["NHS Neurologist Clocked"] = {
        "nhs.menu",
        "nhs.whitelisted",
        "nhs.neurologist",
    },
    ["NHS Neurologist"] = {
        "nhs.whitelisted",
    },
    ["NHS Experienced Paramedic Clocked"] = {
        "nhs.menu",
        "nhs.whitelisted",
        "nhs.experiencedparamedic",
    },
    ["NHS Experienced Paramedic"] = {
        "nhs.whitelisted",
    },
    ["NHS GP Clocked"] = {
        "nhs.menu",
        "nhs.whitelisted",
        "nhs.juniordoctor",
    },
    ["NHS GP"] = {
        "nhs.whitelisted",
    },
    ["NHS Field Trained Paramedic Clocked"] = {
        "nhs.menu",
        "nhs.whitelisted",
        "nhs.criticalcare",
    },
    ["NHS Field Trained Paramedic"] = {
        "nhs.whitelisted",
    },
    ["NHS Paramedic Clocked"] = {
        "nhs.menu",
        "nhs.whitelisted",
        "nhs.paramedic",
    },
    ["NHS Paramedic"] = {
        "nhs.whitelisted",
    },
    ["NHS Ambulance Technician Clocked"] = {
        "nhs.menu",
        "nhs.whitelisted",
        "nhs.traineeparamedic",
    },
    ["NHS Ambulance Technician"] = {
        "nhs.whitelisted",
    },

--  ██╗░░░░░██╗░█████╗░███████╗███╗░░██╗░██████╗███████╗░██████╗
--  ██║░░░░░██║██╔══██╗██╔════╝████╗░██║██╔════╝██╔════╝██╔════╝
--  ██║░░░░░██║██║░░╚═╝█████╗░░██╔██╗██║╚█████╗░█████╗░░╚█████╗░
--  ██║░░░░░██║██║░░██╗██╔══╝░░██║╚████║░╚═══██╗██╔══╝░░░╚═══██╗
--  ███████╗██║╚█████╔╝███████╗██║░╚███║██████╔╝███████╗██████╔╝
--  ╚══════╝╚═╝░╚════╝░╚══════╝╚═╝░░╚══╝╚═════╝░╚══════╝╚═════╝░

    ["Weed"] = {},
    ["Cocaine"] = {},
    ["Meth"] = {},
    ["Heroin"] = {},
    ["LSD"] = {},
    ["Copper"] = {},
    ["Limestone"] = {},
    ["Gold"] = {},
    ["Diamond"] = {},
    ["Gang"] = {
        "gang.whitelisted"
    },
    ["Highroller"] = {
        "casino.highrollers"
    },
    ["Rebel"] = {
        "rebellicense.whitelisted"
    },
    ["AdvancedRebel"] = {
        "advancedrebel.license"
    },
    
--  ██████╗░░█████╗░███╗░░██╗░█████╗░████████╗░█████╗░██████╗░
--  ██╔══██╗██╔══██╗████╗░██║██╔══██╗╚══██╔══╝██╔══██╗██╔══██╗
--  ██║░░██║██║░░██║██╔██╗██║███████║░░░██║░░░██║░░██║██████╔╝
--  ██║░░██║██║░░██║██║╚████║██╔══██║░░░██║░░░██║░░██║██╔══██╗
--  ██████╔╝╚█████╔╝██║░╚███║██║░░██║░░░██║░░░╚█████╔╝██║░░██║
--  ╚═════╝░░╚════╝░╚═╝░░╚══╝╚═╝░░╚═╝░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝
                                                                         
    ["Supporter"] = {
        "vip.gunstore",
        "vip.garage",
    },
    ["Premium"] = {
        "vip.gunstore",
        "vip.garage",
        "vip.aircraft",
    },
    ["Supreme"] = {
        "vip.gunstore",
        "vip.garage",
        "vip.aircraft",
    },
    ["Kingpin"] = {
        "vip.gunstore",
        "vip.garage",
        "vip.aircraft",
    },
    ["Rainmaker"] = {
        "vip.gunstore",
        "vip.garage",
        "vip.aircraft",
    },
    ["Baller"] = {
        "vip.gunstore",
        "vip.garage",
        "vip.aircraft",
    },

--  ███╗░░░███╗██╗░██████╗░█████╗░███████╗██╗░░░░░██╗░░░░░░█████╗░███╗░░██╗███████╗░█████╗░██╗░░░██╗░██████╗
--  ████╗░████║██║██╔════╝██╔══██╗██╔════╝██║░░░░░██║░░░░░██╔══██╗████╗░██║██╔════╝██╔══██╗██║░░░██║██╔════╝
--  ██╔████╔██║██║╚█████╗░██║░░╚═╝█████╗░░██║░░░░░██║░░░░░███████║██╔██╗██║█████╗░░██║░░██║██║░░░██║╚█████╗░
--  ██║╚██╔╝██║██║░╚═══██╗██║░░██╗██╔══╝░░██║░░░░░██║░░░░░██╔══██║██║╚████║██╔══╝░░██║░░██║██║░░░██║░╚═══██╗
--  ██║░╚═╝░██║██║██████╔╝╚█████╔╝███████╗███████╗███████╗██║░░██║██║░╚███║███████╗╚█████╔╝╚██████╔╝██████╔╝
--  ╚═╝░░░░░╚═╝╚═╝╚═════╝░░╚════╝░╚══════╝╚══════╝╚══════╝╚═╝░░╚═╝╚═╝░░╚══╝╚══════╝░╚════╝░░╚═════╝░╚═════╝░   

    ["pov"] = {
        "pov.list"
    },

    ["DJ"] = {
        "dj.menu"
    },
    ["PilotLicense"] = {
        "air.whitelisted"
    },
    ["AA Mechanic"] = {
        "aa.menu"
    },
    ["Cinematic"] = {},
    ["TutorialDone"] = {},
    ["polblips"] = {},
    -- Default Jobs
    ["Royal Mail Driver"] = {},
    ["Bus Driver"] = {},
    ["Deliveroo"] = {},
    ["Scuba Diver"] = {},
    ["G4S Driver"] = {},
    ["Taco Seller"] = {},
    ["Burger Shot Cook"] = {},
}

return cfg
