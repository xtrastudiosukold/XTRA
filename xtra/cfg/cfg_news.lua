local cfg = {}

cfg.items = {
    ["camera"] = {
        formalName = "Camera",
        model = `prop_v_cam_01`,
        holding = false,
        using = false,
        netId = nil,
        boneId = 28422,
        animations = {
            dict = "missfinale_c2mcs_1",
            name = "fin_c2_mcs_1_camman",
        },
        position = {
            x = 0.0,
            y = 0.0,
            z = 0.0,
        },
        rotation = {
            x = 0.0,
            y = 0.0,
            z = 0.0,
        },
    },
    ["micA"] = {
        formalName = "Microphone",
        model = `p_ing_microphonel_01`,
        holding = false,
        using = false,
        netId = nil,
        boneId = 28422,
        animations = {
            dict = "cellphone@",
            name = "cellphone_text_read_base",
        },
        position = {
            x = 0.0,
            y = 0.0,
            z = 0.0,
        },
        rotation = {
            x = 0.0,
            y = 0.0,
            z = 0.0,
        },
    },
    ["micB"] = {
        formalName = "Boom Arm Microphone",
        model = `prop_v_bmike_01`,
        holding = false,
        using = false,
        netId = nil,
        boneId = 28422,
        animations = {
            dict = "missfra1",
            name = "mcs2_crew_idle_m_boom"
        },
        position = {
            x = -0.08,
            y = 0.0,
            z = 0.0,
        },
        rotation = {
            x = 0.0,
            y = 0.0,
            z = 0.0,
        }
    }
}

cfg.textures = {
    [1] = {name = "BBC News", textureName = "bbcnews"},
    [2] = {name = "BBC", textureName = "bbcmisc"},
    [3] = {name = "Camera", textureName = "camera"},
    [4] = {name = "XTRA TV", textureName = "frtv"},
    [5] = {name = "ITV GMB", textureName = "GMB"},
    [6] = {name = "ITV", textureName = "itvmisc"},
    [7] = {name = "SKY", textureName = "skymisc"},
    [8] = {name = "SKY News", textureName = "skynews"},
}

return cfg