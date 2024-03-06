local cfg = {}

cfg.pieceToArchetypeMap = {
    ["r"] = `ch_b_rook`,
    ["n"] = `ch_b_knight`,
    ["b"] = `ch_b_bishop`,
    ["q"] = `ch_b_queen`,
    ["k"] = `ch_b_king`,
    ["p"] = `ch_b_pawn`,
    ["R"] = `ch_w_rook`,
    ["N"] = `ch_w_knight`,
    ["B"] = `ch_w_bishop`,
    ["Q"] = `ch_w_queen`,
    ["K"] = `ch_w_king`,
    ["P"] = `ch_w_pawn`
}

cfg.archetypeToOffsetMap = {
    [`ch_b_rook`] = vector3(-0.022694767, -8.940697e-08, 0.98),
    [`ch_b_knight`] = vector3(-0.0056754947, 0.004611373, -0.45),
    [`ch_b_bishop`] = vector3(0.08403134, 0.6555201, 0.73),
    [`ch_b_queen`] = vector3(-0.062370807, 0.045907557, -0.93),
    [`ch_b_king`] = vector3(0.0028924346, 0.00024586916, -1.31),
    [`ch_b_pawn`] = vector3(-3.874302e-07, -4.4703484e-07, 0.04),
    [`ch_w_rook`] = vector3(-0.022694767, -8.940697e-08, 0.98),
    [`ch_w_knight`] = vector3(-0.0056754947, 0.004611373, -0.45),
    [`ch_w_bishop`] = vector3(0.0, -0.6555201, 0.73),
    [`ch_w_queen`] = vector3(-0.062370807, 0.045907557, -0.93),
    [`ch_w_king`] = vector3(0.0028924346, 0.00024586916, -1.31),
    [`ch_w_pawn`] = vector3(-3.874302e-07, -4.4703484e-07, 0.04)
}

cfg.archetypeToHeadingsMap = {
    [`ch_b_rook`] = 0.0,
    [`ch_b_knight`] = 160.0,
    [`ch_b_bishop`] = 0.0,
    [`ch_b_queen`] = 0.0,
    [`ch_b_king`] = -90.0,
    [`ch_b_pawn`] = 0.0,
    [`ch_w_rook`] = 0.0,
    [`ch_w_knight`] = -20.0,
    [`ch_w_bishop`] = 180.0,
    [`ch_w_queen`] = 0.0,
    [`ch_w_king`] = 90.0,
    [`ch_w_pawn`] = 0.0
}

cfg.originPosition = vector3(1122.1206054688, 111.34351348877, 81.542315673828)
cfg.whitePosition = vector3(1135.8620605469, 110.3430557251, 79.786485290527)
cfg.blackPosition = vector3(1128.9699707031, 110.17691040039, 79.952195739746)
cfg.spectatePosition = vector3(1132.3977050781, 105.91315460205, 79.959916687012)
cfg.squareSize = 2.265

return cfg