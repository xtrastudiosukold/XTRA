local cfg = {}

cfg.standardChannels = {
    ["Police"] = {
        permissions = {
            "police.armoury",
            "nhs.menu",
            "hmp.menu",
            "lfb.onduty.permission"
        },
        deleteWhenEmpty = false,
        isDefault = true
    },
    ["NHS"] = {
        permissions = {
            "nhs.menu",
            "lfb.onduty.permission",
            "police.armoury",
            "hmp.menu"
        },
        deleteWhenEmpty = false,
        isDefault = true
    },
    ["HMP"] = {
        permissions = {
            "hmp.menu",
            "nhs.menu",
            "police.armoury",
            "lfb.onduty.permission"
        },
        deleteWhenEmpty = false,
        isDefault = true
    },
    ["LFB"] = {
        permissions = {
            "lfb.onduty.permission",
            "nhs.menu",
            "police.armoury",
            "hmp.menu"
        },
        deleteWhenEmpty = false,
        isDefault = true
    },
}

cfg.sortOrder = {
    ["Police"] = {
        "police.dev",
        "police.commissioner",
        "police.deputycommissioner",
        "police.assistantcommissioner",
        "police.deputyassistantcommissioner",
        "police.commander",
        "police.specialconstable",
        "police.chiefsuperintendent",
        "police.superintendent",
        "police.chiefinspector",
        "police.tridentcommand",
        "police.tridentofficer",
        "police.inspector",
        "police.npas",
        "police.sergeant",
        "police.seniorconstable",
        "police.constable",
        "police.pcso"
    },
    ["NHS"] = {
        "nhs.headchief",
        "nhs.assistantchief",
        "nhs.deputychief",
        "nhs.combatmedic",
        "nhs.captain",
        "nhs.consultant",
        "nhs.specialist",
        "nhs.seniordoctor",
        "nhs.doctor",
        "nhs.hems",
        "nhs.juniordoctor",
        "nhs.criticalcare",
        "nhs.paramedic",
        "nhs.traineeparamedic"
    },
    ["HMP"] = {
        "hmp.governor",
        "hmp.deputygovernor",
        "hmp.divisionalcommander",
        "hmp.custodialsupervisor",
        "hmp.custodialofficer",
        "hmp.honourableguard",
        "hmp.supervisingofficer",
        "hmp.principalofficer",
        "hmp.specialistofficer",
        "hmp.seniorofficer",
        "hmp.prisonofficer",
        "hmp.traineeprisonofficer"
    },
    ["lfb"] = {
        "lfb.chieffirecommand",
        "lfb.deputychieffireofficer",
        "lfb.assistantchieffireofficer",
        "lfb.firecommandadvisor",
        "lfb.honaryfirefighter",
        "lfb.divisionalofficer",
        "lfb.divisionalcommand",
        "lfb.sectorcommand",
        "lfb.leadingfirefighter",
        "lfb.specialistfirefighter",
        "lfb.advancedfirefighter",
        "lfb.seniorfirefighter",
        "lfb.firefighter",
        "lfb.juniorfirefighter",
        "lfb.provisionalfirefighter"
    }
}

cfg.advancedEffects = {
    ["freq_low"] = 389.0,
    ["freq_hi"] = 3248.0,
    ["fudge"] = 0.0,
    ["rm_mod_freq"] = 0.0,
    ["rm_mix"] = 0.16,
    ["o_freq_lo"] = 348.0,
    ["o_freq_hi"] = 4900.0
}

return cfg