local cfg = {}

cfg.positions = {
    { -- Sitting right hand side
        animDict = "amb@prop_human_seat_chair_food@male@base",
        animName = "base",
        offset = {
            x = 0.0,
            y = -0.2,
            z =0.55,
            heading = -90.0
        }
    },

    { -- Sitting left hand side
        animDict = "amb@prop_human_seat_chair_food@male@base",
        animName = "base",
        offset = {
            x = 0.0,
            y = -0.2,
            z =0.55,
            heading = 90.0
        }
    },

    { -- Laying on back
        animDict = "savecouch@",
        animName = "t_sleep_loop_couch",
        offset = {
            x = 0,
            y = 0.2,
            z = 1.1,
            heading = 180.0
        }
    },

    {
        animDict = "amb@world_human_stupor@male_looking_left@base",
        animName = "base",
        offset = {
            x = 0.0,
            y = 0.3,
            z = 1.5,
            heading = 180.0
        }
    },

}

cfg.stretcherModels = {
    [`trump-stretcher`] = true
}

cfg.ambulanceModels = {
    [`LAS1`] = true,
    [`LAS2`] = true,
    [`hems1`] = true,
    [`hems2`] = true,
    [`hems6`] = true,
}

return cfg