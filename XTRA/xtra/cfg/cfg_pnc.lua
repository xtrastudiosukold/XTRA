local cfg = {}

cfg.offences = {
    ["common_assault"] = {
        name = "Common Assault",
        punishments = {
            {fine = 5000, months = 5, points = 0},
            {fine = 15000, months = 10, points = 0},
            {fine = 25000, months = 20, points = 0}
        }
    },
    ["manslaughter"] = {
        name = "Manslaughter",
        punishments = {
            {fine = 25000, months = 20, points = 0},
            {fine = 75000, months = 30, points = 0},
            {fine = 150000, months = 40, points = 0}
        }
    },
    ["abh"] = {
        name = "Actual Bodily Harm (ABH)",
        punishments = {
            {fine = 15000, months = 10, points = 0},
            {fine = 30000, months = 20, points = 0},
            {fine = 450000, months = 30, points = 0}
        }
    },
    ["murder"] = {
        name = "Murder",
        punishments = {
            {fine = 50000, months = 40, points = 0},
            {fine = 150000, months = 50, points = 0},
            {fine = 250000, months = 60, points = 0}
        }
    },
    ["gbh"] = {
        name = "Grievous Bodily Harm (GBH)",
        punishments = {
            {fine = 25000, months = 20, points = 0},
            {fine = 40000, months = 30, points = 0},
            {fine = 70000, months = 40, points = 0}
        }
    },
    ["assault_emergency"] = {
        name = "Assault of an emergency worker",
        punishments = {
            {fine = 25000, months = 25, points = 0},
            {fine = 75000, months = 30, points = 0},
            {fine = 100000, months = 40, points = 0}
        }
    },
    ["murder_conspiracy"] = {
        name = "Conspiracy to commit Murder",
        punishments = {
            {fine = 25000, months = 20, points = 0},
            {fine = 75000, months = 30, points = 0},
            {fine = 100000, months = 40, points = 0}
        }
    },
    ["attempted_murder"] = {
        name = "Attempted Murder",
        punishments = {
            {fine = 25000, months = 20, points = 0},
            {fine = 75000, months = 30, points = 0},
            {fine = 100000, months = 40, points = 0}
        }
    },
    ["theft"] = {
        name = "Theft",
        punishments = {
            {fine = 10000, months = 0, points = 0},
            {fine = 25000, months = 10, points = 0},
            {fine = 40000, months = 20, points = 0}
        }
    },
    ["vehicle_theft"] = {
        name = "Theft of a vehicle",
        punishments = {
            {fine = 25000, months = 0, points = 0},
            {fine = 50000, months = 5, points = 0},
            {fine = 100000, months = 10, points = 0}
        }
    },
    ["burglary"] = {
        name = "Burglary",
        punishments = {
            {fine = 25000, months = 5, points = 0},
            {fine = 45000, months = 10, points = 0},
            {fine = 60000, months = 20, points = 0}
        }
    },
    ["emergency_vehicle_theft"] = {
        name = "Theft of an emergency vehicle",
        punishments = {
            {fine = 50000, months = 15, points = 0},
            {fine = 100000, months = 20, points = 0},
            {fine = 150000, months = 30, points = 0}
        }
    },
    ["aggravated_burglary"] = {
        name = "Aggravated Burglary",
        punishments = {
            {fine = 25000, months = 10, points = 0},
            {fine = 50000, months = 15, points = 0},
            {fine = 100000, months = 25, points = 0}
        }
    },
    ["robbery"] = {
        name = "Robbery",
        punishments = {
            {fine = 25000, months = 10, points = 0},
            {fine = 100000, months = 15, points = 0},
            {fine = 200000, months = 20, points = 0}
        }
    },
    ["possession_firearm"] = {
        name = "Possession of Firearm",
        punishments = {
            {fine = 50000, months = 20, points = 0},
            {fine = 150000, months = 30, points = 0},
            {fine = 200000, months = 40, points = 0}
        }
    },
    ["possession_bladed"] = {
        name = "Possession of a Bladed Article",
        punishments = {
            {fine = 15000, months = 5, points = 0},
            {fine = 30000, months = 10, points = 0},
            {fine = 50000, months = 15, points = 0}
        }
    },
    ["possession_offensive"] = {
        name = "Possession of Offensive Weapon",
        punishments = {
            {fine = 15000, months = 0, points = 0},
            {fine = 30000, months = 10, points = 0},
            {fine = 50000, months = 15, points = 0}
        }
    },
    ["criminal_damage"] = {
        name = "Criminal Damage",
        punishments = {
            {fine = 5000, months = 0, points = 0},
            {fine = 15000, months = 5, points = 0},
            {fine = 25000, months = 10, points = 0}
        }
    },
    ["damage_government"] = {
        name = "Damage to Government Property",
        punishments = {
            {fine = 15000, months = 0, points = 0},
            {fine = 25000, months = 15, points = 0},
            {fine = 40000, months = 20, points = 0}
        }
    },
    ["death_dangerous_driving"] = {
        name = "Death by Dangerous Driving",
        punishments = {
            {fine = 50000, months = 20, points = 0},
            {fine = 75000, months = 30, points = 0},
            {fine = 150000, months = 40, points = 0}
        }
    },
    ["drink_driving"] = {
        name = "Drink Driving",
        punishments = {
            {fine = 20000, months = 0, points = 0},
            {fine = 40000, months = 10, points = 0},
            {fine = 80000, months = 20, points = 0}
        }
    },
    ["careless_driving"] = {
        name = "Careless Driving",
        punishments = {
            {fine = 5000, months = 0, points = 0},
            {fine = 15000, months = 5, points = 0},
            {fine = 25000, months = 10, points = 0}
        }
    },
    ["dangerous_driving"] = {
        name = "Dangerous Driving",
        punishments = {
            {fine = 15000, months = 0, points = 0},
            {fine = 25000, months = 10, points = 0},
            {fine = 50000, months = 20, points = 0}
        }
    },
    ["drug_driving"] = {
        name = "Drug Driving",
        punishments = {
            {fine = 15000, months = 5, points = 0},
            {fine = 40000, months = 10, points = 0},
            {fine = 60000, months = 20, points = 0}
        }
    },
    ["fail_stop_police"] = {
        name = "Failing to stop for Police",
        punishments = {
            {fine = 20000, months = 0, points = 0},
            {fine = 35000, months = 10, points = 0},
            {fine = 50000, months = 20, points = 0}
        }
    },
    ["motorbike_helmet"] = {
        name = "Not wearing a helmet on a motorbike",
        punishments = {
            {fine = 10000, months = 0, points = 0},
            {fine = 10000, months = 0, points = 0},
            {fine = 10000, months = 0, points = 0}
        }
    },
    ["vehicle_interference"] = {
        name = "Vehicle Interference",
        punishments = {
            {fine = 5000, months = 0, points = 0},
            {fine = 10000, months = 5, points = 0},
            {fine = 20000, months = 10, points = 0}
        }
    },
    ["speeding"] = {
        name = "Speeding",
        punishments = {
            {fine = 10000, months = 0, points = 1},
            {fine = 20000, months = 0, points = 2},
            {fine = 40000, months = 0, points = 3}
        }
    },
    ["road_racing"] = {
        name = "Road Racing",
        punishments = {
            {fine = 15000, months = 0, points = 0},
            {fine = 20000, months = 10, points = 0},
            {fine = 40000, months = 20, points = 0}
        }
    },
    ["illegal_parking"] = {
        name = "Illegal Parking",
        punishments = {
            {fine = 1000, months = 0, points = 0},
            {fine = 1000, months = 0, points = 0},
            {fine = 1000, months = 0, points = 0}
        }
    },
    ["fail_comply_sign"] = {
        name = "Failure to comply with a traffic sign/light",
        punishments = {
            {fine = 5000, months = 0, points = 0},
            {fine = 10000, months = 0, points = 0},
            {fine = 20000, months = 0, points = 0}
        }
    },
    ["posession_classb"] = {
        name = "Possession of a Class B Drug",
        punishments = {
            {fine = 15000, months = 0, points = 0},
            {fine = 25000, months = 5, points = 0},
            {fine = 40000, months = 10, points = 0}
        }
    },
    ["posession_classb_supply"] = {
        name = "Possession with intent to supply a Class B Drug",
        punishments = {
            {fine = 25000, months = 5, points = 0},
            {fine = 50000, months = 10, points = 0},
            {fine = 70000, months = 20, points = 0}
        }
    },
    ["posession_classa"] = {
        name = "Possession of a Class A Drug",
        punishments = {
            {fine = 15000, months = 5, points = 0},
            {fine = 30000, months = 10, points = 0},
            {fine = 50000, months = 20, points = 0}
        }
    },
    ["posession_classa_supply"] = {
        name = "Possession with intent to supply a Class A Drug",
        punishments = {
            {fine = 40000, months = 10, points = 0},
            {fine = 60000, months = 20, points = 0},
            {fine = 80000, months = 30, points = 0}
        }
    },
    ["concerned_illegal_drug"] = {
        name = "Possession with intent to supply a Class A Drug",
        punishments = {
            {fine = 10000, months = 0, points = 0},
            {fine = 20000, months = 10, points = 0},
            {fine = 3000, months = 20, points = 0}
        }
    },
    ["sexual_assault"] = {
        name = "Sexual Assault",
        punishments = {
            {fine = 30000, months = 10, points = 0},
            {fine = 50000, months = 20, points = 0},
            {fine = 70000, months = 30, points = 0}
        }
    },
    ["indecent_exposure"] = {
        name = "Indecent Exposure",
        punishments = {
            {fine = 5000, months = 0, points = 0},
            {fine = 20000, months = 5, points = 0},
            {fine = 30000, months = 10, points = 0}
        }
    },
    ["solicitation"] = {
        name = "Solicitation",
        punishments = {
            {fine = 5000, months = 0, points = 0},
            {fine = 20000, months = 5, points = 0},
            {fine = 30000, months = 10, points = 0}
        }
    },
    ["fraud_false_representation"] = {
        name = "Fraud by False Representation",
        punishments = {
            {fine = 15000, months = 0, points = 0},
            {fine = 30000, months = 10, points = 0},
            {fine = 40000, months = 20, points = 0}
        }
    },
    ["posession_articles_fraud"] = {
        name = "Possession of articles related to Fraud",
        punishments = {
            {fine = 5000, months = 0, points = 0},
            {fine = 20000, months = 10, points = 0},
            {fine = 30000, months = 20, points = 0}
        }
    },
    ["causing_harassment"] = {
        name = "Causing Harassment, Alarm or Distress",
        punishments = {
            {fine = 25000, months = 5, points = 0},
            {fine = 25000, months = 10, points = 0},
            {fine = 30000, months = 20, points = 0}
        }
    },
    ["intentionally_causing_harassment"] = {
        name = "Intentionally causing Harassment, Alarm or Distress",
        punishments = {
            {fine = 15000, months = 0, points = 0},
            {fine = 25000, months = 5, points = 0},
            {fine = 40000, months = 10, points = 0}
        }
    },
    ["harassment"] = {
        name = "Harassment",
        punishments = {
            {fine = 20000, months = 5, points = 0},
            {fine = 30000, months = 10, points = 0},
            {fine = 50000, months = 20, points = 0}
        }
    },
    ["bribery"] = {
        name = "Bribery",
        punishments = {
            {fine = 15000, months = 5, points = 0},
            {fine = 30000, months = 10, points = 0},
            {fine = 50000, months = 20, points = 0}
        }
    },
    ["false_imprisonment"] = {
        name = "False imprisonment",
        punishments = {
            {fine = 30000, months = 15, points = 0},
            {fine = 60000, months = 30, points = 0},
            {fine = 80000, months = 40, points = 0}
        }
    },
    ["kidnapping"] = {
        name = "Kidnapping",
        punishments = {
            {fine = 25000, months = 5, points = 0},
            {fine = 35000, months = 15, points = 0},
            {fine = 50000, months = 20, points = 0}
        }
    },
    ["prison_break"] = {
        name = "Prison Break",
        punishments = {
            {fine = 100000, months = 20, points = 0},
            {fine = 200000, months = 30, points = 0},
            {fine = 250000, months = 40, points = 0}
        }
    },
    ["escaping_custody"] = {
        name = "Escaping lawful custody",
        punishments = {
            {fine = 60000, months = 20, points = 0},
            {fine = 60000, months = 20, points = 0},
            {fine = 60000, months = 20, points = 0}
        }
    },
    ["gang_affiliation"] = {
        name = "Gang Affiliation",
        punishments = {
            {fine = 50000, months = 10, points = 0},
            {fine = 100000, months = 20, points = 0},
            {fine = 150000, months = 30, points = 0}
        }
    },
    ["impersonation_officer"] = {
        name = "Impersonation of a Police Officer",
        punishments = {
            {fine = 15000, months = 5, points = 0},
            {fine = 25000, months = 10, points = 0},
            {fine = 40000, months = 15, points = 0}
        }
    },
    ["impeding_investigation"] = {
        name = "Impeding an Active Police Investigation",
        punishments = {
            {fine = 5000, months = 0, points = 0},
            {fine = 10000, months = 0, points = 0},
            {fine = 20000, months = 0, points = 0}
        }
    },
    ["wasting_time"] = {
        name = "Wasting Police Time",
        punishments = {
            {fine = 10000, months = 5, points = 0},
            {fine = 15000, months = 10, points = 0},
            {fine = 20000, months = 15, points = 0}
        }
    },
    ["drunk_disorderly"] = {
        name = "Drunk and Disorderly",
        punishments = {
            {fine = 5000, months = 0, points = 0},
            {fine = 10000, months = 0, points = 0},
            {fine = 20000, months = 0, points = 0}
        }
    },
    ["trespassing"] = {
        name = "Trespassing",
        punishments = {
            {fine = 10000, months = 0, points = 0},
            {fine = 15000, months = 5, points = 0},
            {fine = 20000, months = 10, points = 0}
        }
    },
    ["fail_provide_id"] = {
        name = "Failure to provide Identification",
        punishments = {
            {fine = 2500, months = 0, points = 0},
            {fine = 5000, months = 0, points = 0},
            {fine = 10000, months = 0, points = 0}
        }
    }
}

cfg.categories = {
    ["Offences against a person"] = {
        "common_assault",
        "manslaughter",
        "abh",
        "murder",
        "gbh",
        "assault_emergency",
        "murder_conspiracy",
        "attempted_murder"
    },
    ["Theft Offences"] = {
        "theft",
        "vehicle_theft",
        "burglary",
        "emergency_vehicle_theft",
        "aggravated_burglary",
        "robbery"
    },
    ["Firearms and other Weapons Offences"] = {
        "possession_firearm",
        "possession_bladed",
        "possession_offensive"
    },
    ["Criminal Damage Offences"] = {
        "criminal_damage",
        "damage_government",
        "death_dangerous_driving"
    },
    ["Road Traffic Offences"] = {
        "death_dangerous_driving",
        "drink_driving",
        "careless_driving",
        "dangerous_driving",
        "drug_driving",
        "fail_stop_police",
        "motorbike_helmet",
        "vehicle_interference",
        "speeding",
        "road_racing",
        "illegal_parking",
        "fail_comply_sign"
    },
    ["Drugs Offences"] = {
        "posession_classb",
        "posession_classb_supply",
        "posession_classa",
        "posession_classa_supply",
        "concerned_illegal_drug"
    },
    ["Sexual Offences"] = {
        "sexual_assault",
        "indecent_exposure",
        "solicitation"
    },
    ["Fraud Offences"] = {
        "fraud_false_representation",
        "posession_articles_fraud"
    },
    ["Miscellaneous Offences"] = {
        "causing_harassment",
        "intentionally_causing_harassment",
        "harassment",
        "bribery",
        "false_imprisonment",
        "kidnapping",
        "prison_break",
        "escaping_custody",
        "gang_affiliation",
        "impersonation_officer",
        "impeding_investigation",
        "wasting_time",
        "drunk_disorderly",
        "trespassing",
        "fail_provide_id"
    }
}

cfg.points = {
    {name = "Driving without due care or attention", points = 1},
    {name = "Driving without reasonable consideration for other road users", points = 1},
    {name = "Dangerous driving", points = 1},
    {name = "Causing death by driving dangerously", points = 6},
    {name = "Causing serious injury by dangerous driving", points = 2},
    {name = "Using a vehicle with defective tyre(s)", points = 1},
    {name = "Using a mobile phone while driving", points = 1},
    {name = "Driving an unsuitable vehicle, creating danger", points = 1},
    {name = "Driving whilst above the alcohol limit", points = 1},
    {name = "Failed to provide a specimen of breath", points = 1},
    {name = "Leaving a vehicle in a dangerous position", points = 1},
    {name = "Speeding", points = 1},
    {name = "Aggravated taking of a vehicle", points = 1},
}

return cfg