local a = {
    crouchKeybindEnabled = true,
    crouchKeybind = "LCONTROL", -- Left Control is a common choice for crouching in PvP games.
    crouchOverride = true,
    crouchKeypressTimer = 300, -- Reduced timer for quicker response.
    crawlKeybindEnabled = true,
    crawlKeybind = "RCONTROL", -- Right Control for crawling.
    localization = {
        ["crouch_keymapping"] = "Crouch",
        ["crouch_chat_suggestion"] = "Crouch",
        ["crawl_keymapping"] = "Crawl",
        ["crawl_chat_suggestion"] = "Crawl"
    }
}
local b = {
    [-2146642687] = "move_m@alien",
    [1450392727] = "anim_group_move_ballistic",
    [1646588077] = "move_f@arrogant@a",
    [-1273245730] = "move_m@hurry_butch@a",
    [-1654611352] = "move_m@hurry_butch@b",
    [1135734536] = "move_m@hurry_butch@c",
    [-1768281232] = "move_m@brave",
    [1160259160] = "move_m@casual@a",
    [1249489219] = "move_m@casual@b",
    [1022236204] = "move_m@casual@c",
    [1730505370] = "move_m@casual@d",
    [1500565297] = "move_m@casual@e",
    [-742407223] = "move_m@casual@f",
    [-2125795638] = "move_f@chichi",
    [1130158996] = "move_m@confident",
    [1607161685] = "move_m@business@a",
    [1845818312] = "move_m@business@b",
    [-59928421] = "move_m@business@c",
    [-2055591238] = "move_chubby",
    [-108537538] = "move_f@chubby@a",
    [-1401903942] = "move_f@multiplayer",
    [1113513977] = "move_m@multiplayer",
    [-1287120285] = "move_m@depressed@a",
    [-502630425] = "move_m@depressed@b",
    [685317947] = "move_f@depressed@a",
    [-859042698] = "move_m@drunk@a",
    [2037534323] = "move_m@buzzed",
    [-1925018459] = "move_m@drunk@moderatedrunk",
    [-1201085968] = "move_m@drunk@moderatedrunk_head_up",
    [875753685] = "move_m@drunk@slightlydrunk",
    [-297078218] = "move_m@drunk@verydrunk",
    [1524082234] = "move_m@fat@a",
    [522820593] = "move_f@fat@a",
    [-1732630094] = "move_m@fat@bulky",
    [-669438934] = "move_f@femme@",
    [-1857789306] = "move_characters@franklin@fire",
    [-433101684] = "move_characters@michael@fire",
    [989819896] = "move_m@fire",
    [2077811903] = "move_f@flee@a",
    [864310395] = "move_f@flee@c",
    [-1960902366] = "move_m@flee@a",
    [1287652361] = "move_m@flee@b",
    [-796046076] = "move_p_m_one",
    [-1810566716] = "move_m@gangster@generic",
    [-2114609648] = "move_m@gangster@ng",
    [-875359244] = "move_m@gangster@var_e",
    [1203637196] = "move_m@gangster@var_f",
    [-1796495834] = "move_m@gangster@var_i",
    [132330440] = "move_m@generic",
    [642383383] = "move_f@generic",
    [696702737] = "anim@move_m@grooving@",
    [-705606766] = "anim@move_f@grooving@",
    [1013381506] = "move_m@prison_gaurd",
    [1500055922] = "move_m@prisoner_cuffed",
    [101970339] = "move_f@heels@c",
    [-1100881352] = "move_f@heels@d",
    [1712688432] = "move_m@hiking",
    [-1806913316] = "move_f@hiking",
    [-1261021058] = "move_m@hipster@a",
    [-1027640375] = "move_m@hobo@a",
    [-725870658] = "move_m@hobo@b",
    [-1694147212] = "move_m@hurry@a",
    [1605790647] = "move_f@hurry@a",
    [-32565260] = "move_f@injured",
    [868295932] = "move_m@intimidation@1h",
    [-749057629] = "move_m@intimidation@cop@unarmed",
    [584873396] = "move_m@intimidation@unarmed",
    [92422612] = "move_p_m_zero_janitor",
    [1864844954] = "move_p_m_zero_slow",
    [1103953188] = "move_m@jog@",
    [-708603839] = "move_characters@jimmy@nervous@",
    [1909742916] = "anim_group_move_lemar_alley",
    [1690913150] = "move_heist_lester",
    [549262148] = "move_lester_caneup",
    [186601483] = "move_f@maneater",
    [-578327514] = "move_ped_bucket",
    [-1269633907] = "move_m@money",
    [-207491758] = "move_m@muscle@a",
    [-1543095923] = "move_m@posh@",
    [-1868494245] = "move_f@posh@",
    [1023544707] = "move_m@quick",
    [636261340] = "female_fast_runner",
    [-1599479573] = "move_m@sad@a",
    [-1847704748] = "move_m@sad@b",
    [-2077448207] = "move_m@sad@c",
    [-566100771] = "move_f@sad@a",
    [-930295437] = "move_f@sad@b",
    [1207987305] = "move_m@sassy",
    [1235276737] = "move_f@sassy",
    [-1472832709] = "move_f@scared",
    [-1990894342] = "move_f@sexy@a",
    [-1818270454] = "move_m@shadyped@a",
    [-510722362] = "move_characters@jimmy@slow@",
    [-409852351] = "move_m@swagger",
    [1802187645] = "move_m@tough_guy@",
    [-1568317798] = "move_f@tough_guy@",
    [-500831769] = "move_m@tool_belt@a",
    [-976584416] = "move_f@tool_belt@a",
    [1844458253] = "clipset@move@trash_fast_turn",
    [-435990891] = "missfbi4prepp1_garbageman",
    [-895219889] = "move_p_m_two",
    [1258529727] = "move_m@bag",
    [-650503762] = "move_m@injured",
    [-1104677118] = "move_injured_generic",
    [-2129845123] = "MOVE_M@BAIL_BOND_NOT_TAZERED",
    [-70818445] = "MOVE_M@BAIL_BOND_TAZERED",
    [-618380859] = "MOVE_P_M_ONE_BRIEFCASE",
    [666904976] = "move_ped_mop",
    [-1312865774] = "move_m@femme@",
    [735579764] = "move_f@gangster@ng",
    [-1168427927] = "move_characters@orleans@core@",
    [-1164222247] = "move_m@coward",
    [279703740] = "move_characters@dave_n",
    [1539166312] = "move_characters@jimmy",
    [1899314058] = "move_characters@patricia",
    [1583990743] = "move_characters@ron",
    [1528838481] = "move_m@swagger@b",
    [148072839] = "move_m@leaf_blower",
    [-2018280977] = "move_m@flee@c",
    [-1960115337] = "move_characters@amanda@bag",
    [1701187980] = "move_f@film_reel",
    [-1163090857] = "move_f@flee@generic",
    [922192683] = "move_f@handbag",
    [-905417764] = "move_m@flee@generic",
    [-871949441] = "move_m@shocked@a",
    [1728327052] = "move_characters@floyd",
    [756811395] = "move_f@hurry@b",
    [-975292135] = "move_characters@lamar",
    [70692426] = "move_characters@tracey",
    [-582520880] = "move_m@brave@a",
    [-388968941] = "move_m@gangster@var_a",
    [-1874148793] = "move_f@stripper@a",
    [-2076638015] = "move_m@gangster@var_b",
    [-1366140557] = "move_m@gangster@var_c",
    [-535479176] = "move_m@gangster@var_d",
    [2038230857] = "move_m@gangster@var_g",
    [1664205491] = "move_m@gangster@var_h",
    [445985183] = "move_m@gangster@var_j",
    [-288695797] = "move_m@gangster@var_k",
    [862223719] = "move_m@clipboard",
    [-409207550] = "move_cop@action",
    [1259887674] = "move_gangster",
    [-795792088] = "move_casey",
    [-1938021834] = "move_dreyfuss",
    [202679515] = "move_paramedic",
    [-1345269979] = "move_f@fat@a_no_add",
    [-1267550608] = "move_f@depressed@c",
    [1720274816] = "anim@move_f@grooving@slow@",
    [148615797] = "anim@move_m@grooving@slow@",
    [422291091] = "AMBIENT_WALK_VARIATION_F_ARROGANT_A",
    [1510605100] = "AMBIENT_WALK_VARIATION_M_SAD_B",
    [-746382641] = "AMBIENT_WALK_VARIATION_M_BUSINESS_B",
    [1799136145] = "AMBIENT_WALK_VARIATION_M_SAD_A",
    [11564329] = "AMBIENT_WALK_VARIATION_M_BUSINESS_C",
    [471477248] = "AMBIENT_WALK_VARIATION_M_BUSINESS_A",
    [-1749517176] = "AMBIENT_WALK_VARIATION_M_SAD_C",
    [-1561136569] = "AMBIENT_WALK_VARIATION_F_SAD_A",
    [381019249] = "HUSKY@MOVE",
    [-289665739] = "RETRIEVER@MOVE"
}
local function c(d)
    local e = GetPedMovementClipset(d)
    if b[e] then
        return b[e]
    else
        return nil
    end
end
local f = false
local g = false
local h = false
local i = false
local j = "onfront"
local k = 0
local l = nil
local m = 0
local function n(o)
    if
        not IsPedOnFoot(o) or IsPedJumping(o) or IsPedFalling(o) or IsPedInjured(o) or IsPedInMeleeCombat(o) or
            IsPedRagdoll(o) or
            IsPedCuffed(o)
     then
        return false
    end
    return true
end
function SetPlayerClipset(e)
    tXTRA.loadClipSet(e)
    SetPedMovementClipset(PlayerPedId(), e, 0.5)
    RemoveClipSet(e)
end
local function p(d)
    return GetPedConfigFlag(d, 78, true) == 1 and true or false
end
local function q(d, r, s, t, u, v, w)
    tXTRA.loadAnimDict(r)
    TaskPlayAnim(d, r, s, t or 2.0, u or 2.0, v or -1, 0, w or 0.0, false, false, false)
    RemoveAnimDict(r)
end
local function x(d, y, z)
    local A = math.abs(y)
    local B = y / A
    local C = z / A
    for D = 1, A do
        Wait(C)
        SetEntityHeading(d, GetEntityHeading(d) + B)
    end
end
local function E()
    local o = PlayerPedId()
    ResetPedStrafeClipset(o)
    ResetPedWeaponMovementClipset(o)
    SetPedMaxMoveBlendRatio(o, 1.0)
    SetPedCanPlayAmbientAnims(o, true)
    if l ~= nil then
        SetPlayerClipset(l)
    else
        ResetPedMovementClipset(o, 0.5)
    end
    RemoveAnimSet("move_ped_crouched")
end
local function F()
    CreateThread(
        function()
            while g do
                local o = PlayerPedId()
                if not n(o) then
                    g = false
                    break
                end
                SetPedCanPlayAmbientAnims(o, false)
                DisableControlAction(0, 36, true)
                if IsPedUsingActionMode(o) == 1 then
                    SetPedUsingActionMode(o, false, -1, "DEFAULT_ACTION")
                end
                DisableFirstPersonCamThisFrame()
                Wait(0)
            end
            E()
        end
    )
end
local function G()
    g = true
    tXTRA.loadClipSet("move_ped_crouched")
    local o = PlayerPedId()
    if GetPedStealthMovement(o) == 1 then
        SetPedStealthMovement(o, false, "DEFAULT_ACTION")
        Wait(100)
    end
    if GetFollowPedCamViewMode() == 4 then
        SetFollowPedCamViewMode(0)
    end
    l = c(o) or l
    SetPedMovementClipset(o, "move_ped_crouched", 0.6)
    SetPedStrafeClipset(o, "move_ped_crouched_strafing")
    F()
end
local function H(o)
    if n(o) then
        G()
        return true
    else
        return false
    end
end
local function I()
    if GetFrameCount() == m then
        return
    end
    m = GetFrameCount()
    if i then
        return
    end
    if g then
        g = false
        return
    end
    local o = PlayerPedId()
    if a.crouchOverride then
        DisableControlAction(0, 36, true)
    else
        local J = GetControlInstructionalButton(0, 0xD2D0BEBA, false)
        local K = GetControlInstructionalButton(0, 36, false)
        if J == K and not f then
            local L = GetGameTimer()
            if GetPedStealthMovement(o) == 1 and L - k < 1000 then
                DisableControlAction(0, 36, true)
                k = 0
                H(o)
                return
            end
            k = L
            return
        end
    end
    if H(o) and f then
        i = true
        f = false
        q(o, "get_up@directional@transition@prone_to_knees@crawl", "front", nil, nil, 780)
        Wait(780)
        i = false
    end
end
local function M(o)
    if IsPedRunning(o) or IsPedSprinting(o) then
        return true
    end
    return false
end
local function N(o, O, t)
    local P = GetEntityCoords(o)
    TaskPlayAnimAdvanced(
        o,
        "move_crawl",
        j .. "_fwd",
        P.x,
        P.y,
        P.z,
        0.0,
        0.0,
        O or GetEntityHeading(o),
        t or 2.0,
        2.0,
        -1,
        2,
        1.0,
        false,
        false
    )
end
local function Q(R)
    if not R then
        i = true
        local o = PlayerPedId()
        if j == "onfront" then
            q(o, "get_up@directional@transition@prone_to_knees@crawl", "front", nil, nil, 780)
            if not g then
                Wait(780)
                q(o, "get_up@directional@movement@from_knees@standard", "getup_l_0", nil, nil, 1300)
            end
        else
            q(o, "get_up@directional@transition@prone_to_seated@crawl", "back", 16.0, nil, 950)
            if not g then
                Wait(950)
                q(o, "get_up@directional@movement@from_seated@standard", "get_up_l_0", nil, nil, 1300)
            end
        end
    end
end
local function S(o, T, U)
    h = true
    TaskPlayAnim(o, "move_crawl", T .. "_" .. U, 8.0, -8.0, -1, 2, 0.0, false, false, false)
    local z = {["onfront"] = {["fwd"] = 820, ["bwd"] = 990}, ["onback"] = {["fwd"] = 1200, ["bwd"] = 1200}}
    SetTimeout(
        z[T][U],
        function()
            h = false
        end
    )
end
local function V(o)
    i = true
    local O = GetEntityHeading(o)
    if j == "onfront" then
        j = "onback"
        q(o, "get_up@directional_sweep@combat@pistol@front", "front_to_prone", 2.0)
        x(o, -18.0, 3600)
    else
        j = "onfront"
        q(o, "move_crawlprone2crawlfront", "back", 2.0, nil, -1)
        x(o, 12.0, 1700)
    end
    N(o, O + 180.0)
    Wait(400)
    i = false
end
local function W()
    CreateThread(
        function()
            Wait(400)
            local R = false
            while f do
                local o = PlayerPedId()
                if not n(o) or IsEntityInWater(o) then
                    ClearPedTasks(o)
                    f = false
                    R = true
                    break
                end
                local X, Y = IsControlPressed(0, 32), IsControlPressed(0, 33)
                if not h then
                    if X then
                        S(o, j, "fwd")
                    elseif Y then
                        S(o, j, "bwd")
                    end
                end
                if IsControlPressed(0, 34) then
                    if h then
                        local Z = X and 1.0 or -1.0
                        SetEntityHeading(o, GetEntityHeading(o) + Z)
                    else
                        i = true
                        if j == "onfront" then
                            local P = GetEntityCoords(o)
                            TaskPlayAnimAdvanced(
                                o,
                                "move_crawlprone2crawlfront",
                                "left",
                                P.x,
                                P.y,
                                P.z,
                                0.0,
                                0.0,
                                GetEntityHeading(o),
                                2.0,
                                2.0,
                                -1,
                                2,
                                0.1,
                                false,
                                false
                            )
                            x(o, -10.0, 300)
                            Wait(700)
                        else
                            q(o, "get_up@directional_sweep@combat@pistol@left", "left_to_prone")
                            x(o, 25.0, 400)
                            N(o)
                            Wait(600)
                        end
                        i = false
                    end
                elseif IsControlPressed(0, 35) then
                    if h then
                        local Z = Y and 1.0 or -1.0
                        SetEntityHeading(o, GetEntityHeading(o) + Z)
                    else
                        i = true
                        if j == "onfront" then
                            local P = GetEntityCoords(o)
                            TaskPlayAnimAdvanced(
                                o,
                                "move_crawlprone2crawlfront",
                                "right",
                                P.x,
                                P.y,
                                P.z,
                                0.0,
                                0.0,
                                GetEntityHeading(o),
                                2.0,
                                2.0,
                                -1,
                                2,
                                0.1,
                                false,
                                false
                            )
                            x(o, 10.0, 300)
                            Wait(700)
                        else
                            q(o, "get_up@directional_sweep@combat@pistol@right", "right_to_prone")
                            x(o, -25.0, 400)
                            N(o)
                            Wait(600)
                        end
                        i = false
                    end
                end
                if not h then
                    if IsControlPressed(0, 22) then
                        V(o)
                    end
                end
                Wait(0)
            end
            Q(R)
            h = false
            i = false
            j = "onfront"
            SetPedConfigFlag(PlayerPedId(), 48, false)
            RemoveAnimDict("move_crawl")
            RemoveAnimDict("move_crawlprone2crawlfront")
        end
    )
end
local function _()
    if i then
        return
    end
    if IsPauseMenuActive() then
        return
    end
    if f then
        f = false
        return
    end
    local a0 = false
    if g then
        g = false
        a0 = true
    end
    local o = PlayerPedId()
    if not n(o) or IsEntityInWater(o) then
        return
    end
    i = true
    if Pointing then
        Pointing = false
    end
    f = true
    SetPedConfigFlag(o, 48, true)
    if GetPedStealthMovement(o) == 1 then
        SetPedStealthMovement(o, false, "DEFAULT_ACTION")
        Wait(100)
    end
    tXTRA.loadAnimDict("move_crawl")
    tXTRA.loadAnimDict("move_crawlprone2crawlfront")
    if M(o) then
        q(o, "explosions", "react_blown_forwards", nil, 3.0)
        Wait(1100)
    elseif a0 then
        q(o, "amb@world_human_sunbathe@male@front@enter", "enter", nil, nil, -1, 0.3)
        Wait(1500)
    else
        q(o, "amb@world_human_sunbathe@male@front@enter", "enter")
        Wait(3000)
    end
    if n(o) and not IsEntityInWater(o) then
        N(o, nil, 3.0)
    end
    i = false
    W()
end
CreateThread(
    function()
        if a.crouchKeybindEnabled then
            RegisterKeyMapping("+crouch", a.localization["crouch_keymapping"], "keyboard", a.crouchKeybind)
            RegisterCommand(
                "+crouch",
                function()
                    I()
                end,
                false
            )
            RegisterCommand(
                "-crouch",
                function()
                end,
                false
            )
        end
        RegisterCommand(
            "crouch",
            function()
                if GetFrameCount() == m then
                    return
                end
                m = GetFrameCount()
                if g then
                    g = false
                    return
                end
                H(PlayerPedId())
            end,
            false
        )
        TriggerEvent("chat:addSuggestion", "/crouch", a.localization["crouch_chat_suggestion"])
        if a.crawlKeybindEnabled then
            RegisterKeyMapping("+crawl", a.localization["crawl_keymapping"], "keyboard", a.crawlKeybind)
            RegisterCommand(
                "+crawl",
                function()
                    _()
                end,
                false
            )
            RegisterCommand(
                "-crawl",
                function()
                end,
                false
            )
        end
        RegisterCommand(
            "crawl",
            function()
                _()
            end,
            false
        )
        TriggerEvent("chat:addSuggestion", "/crouch", a.localization["crawl_chat_suggestion"])
    end
)
