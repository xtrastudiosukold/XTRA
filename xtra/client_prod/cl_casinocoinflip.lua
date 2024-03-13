local a = -1
local b = 1000
local c = {}
local d = false
local e = false
local f = {}
local g = false
local h = {}
local i
local j
local k
local l = false
local m = false
c.coinflipTables = {
    [0] = {
        tablePos = vector3(1146.329, 261.2543, -52.84094),
        tableHeading = 130.0,
        distance = 1000.0,
        tableModel = "vw_prop_casino_blckjack_coinflip",
        textureVariant = 2,
        objectId = 0
    },
    [1] = {
        tablePos = vector3(1143.338, 264.2453, -52.84094),
        tableHeading = 130.0,
        distance = 1000.0,
        tableModel = "vw_prop_casino_blckjack_coinflip",
        textureVariant = 2,
        objectId = 0
    }
}
local function n(o)
    local p = -1
    for q = 0, o, 4 do
        p = p + 1
    end
    return p
end
local function r(o)
    if o == 0 then
        return 3
    end
    if o == 1 then
        return 2
    end
    if o == 2 then
        return 1
    end
    if o == 3 then
        return 0
    end
end
local function s(o)
    if o == 1 then
        return 1
    end
    if o == 2 then
        return 3
    end
    if o == 3 then
        return 5
    end
    if o == 4 then
        return 7
    end
end
local function t(u)
    if u ~= -1 then
        return u % 4
    else
        return 100
    end
end
local function v(o)
    local p = n(o)
    local w = c.coinflipTables[p].objectId
    if DoesEntityExist(w) then
        local x = t(o)
        local y = s(x)
        local z = "not found"
        if y then
            z = (y + 1) / 2
        end
        return GetEntityBonePosition_2(w, y), z
    else
        return vector3(0.0, 0.0, 0.0)
    end
end
local function A(B)
    local p = n(B)
    local w = c.coinflipTables[p].objectId
    if DoesEntityExist(w) then
        local x = t(B)
        x = r(x) + 1
        if x == 3 then
            return GetEntityBoneRotation(w, s(x)) + vector3(0.0, 0.0, 40.0)
        else
            return GetEntityBoneRotation(w, s(x))
        end
    else
        return vector3(0.0, 0.0, 0.0)
    end
end
RegisterNetEvent(
    "XTRA:sendCoinflipTableData",
    function(C)
        f = C
    end
)
Citizen.CreateThread(
    function()
        Wait(1000)
        TriggerServerEvent("XTRA:requestCoinflipTableData")
        for q = 0, #c.coinflipTables do
            local D = c.coinflipTables[q]
            local E = tXTRA.loadModel(D.tableModel)
            c.coinflipTables[q].objectId =
                CreateObjectNoOffset(D.tableModel, D.tablePos.x, D.tablePos.y, D.tablePos.z, false, false, false)
            SetModelAsNoLongerNeeded(E)
            SetEntityHeading(c.coinflipTables[q].objectId, D.tableHeading)
            FreezeEntityPosition(c.coinflipTables[q].objectId, true)
            SetObjectTextureVariation(c.coinflipTables[q].objectId, c.coinflipTables[q].textureVariant)
        end
        while true do
            b = 1000
            a = -1
            local F = GetEntityCoords(PlayerPedId())
            for o = 0, (#c.coinflipTables + 1) * 4 - 1, 1 do
                local G, H = v(o)
                if G ~= vector3(0.0, 0.0, 0.0) then
                    local I = #(F - G)
                    if I < b then
                        b = I
                        a = o
                    end
                end
            end
            Wait(100)
        end
    end
)
AddEventHandler(
    "onResourceStop",
    function(J)
        if J == GetCurrentResourceName() then
            for q, K in pairs(c.coinflipTables) do
                DeleteObject(c.coinflipTables[q].objectId)
            end
        end
    end
)
Citizen.CreateThread(
    function()
        while true do
            if d then
                if m then
                    TaskPlayAnim(
                        tXTRA.getPlayerPed(),
                        "anim_casino_b@amb@casino@games@shared@player@",
                        "idle_cardgames",
                        1.0,
                        1.0,
                        -1,
                        0,
                        0.0,
                        false,
                        false,
                        false
                    )
                end
                if
                    not l and IsControlJustPressed(0, 202) and not g and
                        not RageUI.Visible(RMenu:Get("mgcoinflip", "confirm"))
                 then
                    local L = tXTRA.loadAnimDict("anim_casino_b@amb@casino@games@shared@player@")
                    TaskPlayAnim(tXTRA.getPlayerPed(), L, "sit_exit_left", 1.0, 1.0, 2500, 0, 0.0, false, false, false)
                    RemoveAnimDict("anim_casino_b@amb@casino@games@shared@player@")
                    d = false
                    e = true
                    showHowToCoinflip(false)
                    TriggerServerEvent("XTRA:cancelCoinflip", true)
                    TriggerServerEvent("XTRA:leaveCoinflipTable")
                    h = {}
                    m = false
                    SetTimeout(
                        5000,
                        function()
                            e = false
                        end
                    )
                end
                if b > 5 then
                    ClearHelp(true)
                    showHowToCoinflip(false)
                    playedCasinoGuiSound = false
                    if d then
                        d = false
                        e = true
                        showHowToCoinflip(false)
                        TriggerServerEvent("XTRA:cancelCoinflip", true)
                        TriggerServerEvent("XTRA:leaveCoinflipTable")
                        m = false
                        h = {}
                    end
                end
            end
            if not d then
                if a ~= -1 and b < 2 then
                    if IsControlJustPressed(0, 38) then
                        if f[a] == false then
                            TriggerServerEvent("XTRA:requestSitAtCoinflipTable", a)
                        end
                    end
                end
            end
            if not d then
                if a ~= -1 and b < 2 then
                    if not e then
                        if f[a] == false then
                            drawNativeNotification("Press ~INPUT_PICKUP~ to play Coinflip")
                        else
                            drawNativeNotification("This seat is taken.")
                        end
                        showHowToCoinflip(true)
                        if not playedCasinoGuiSound then
                            playedCasinoGuiSound = true
                            PlaySoundFrontend(-1, "DLC_VW_RULES", "dlc_vw_table_games_frontend_sounds", 1)
                            PlaySoundFrontend(-1, "DLC_VW_WIN_CHIPS", "dlc_vw_table_games_frontend_sounds", 1)
                        end
                    end
                end
            end
            Wait(0)
        end
    end
)
RegisterNetEvent(
    "XTRA:sitAtCoinflipTable",
    function(o, M)
        if M then
            h[M.betId] = M
        end
        goToCoinflipSeat(o)
    end
)
local function N(x)
    if x == 0 then
        return "sit_enter_left"
    elseif x == 1 then
        return "sit_enter_left_side"
    elseif x == 2 then
        return "sit_enter_right_side"
    end
    return "sit_enter_left"
end
local function O(u)
    if u ~= -1 then
        return u % 4 + 1
    else
        return 100
    end
end
function goToCoinflipSeat(o)
    g = true
    d = true
    e = true
    SetTimeout(
        2500,
        function()
            e = false
            showHowToCoinflip(false)
            showCoinflipMenu(true)
            m = true
        end
    )
    drawNativeNotification("Waiting for next game to start...")
    local P = {
        "anim_casino_b@amb@casino@games@blackjack@dealer",
        "anim_casino_b@amb@casino@games@shared@dealer@",
        "anim_casino_b@amb@casino@games@blackjack@player",
        "anim_casino_b@amb@casino@games@shared@player@"
    }
    for K, Q in pairs(P) do
        tXTRA.loadAnimDict(Q)
    end
    local F = GetEntityCoords(PlayerPedId())
    local p = n(o)
    local w = c.coinflipTables[p].objectId
    local R = c.coinflipTables[p].tablePos
    local x = t(o)
    local S =
        GetAnimInitialOffsetPosition(
        "anim_casino_b@amb@casino@games@shared@player@",
        N(x),
        R.x,
        R.y,
        R.z,
        0.0,
        0.0,
        0.0,
        0.01,
        2
    )
    local T =
        GetAnimInitialOffsetRotation(
        "anim_casino_b@amb@casino@games@shared@player@",
        N(x),
        R.x,
        R.y,
        R.z,
        0.0,
        0.0,
        0.0,
        0.01,
        2
    )
    TaskGoStraightToCoord(tXTRA.getPlayerPed(), S.x, S.y, S.z, 1.0, 5000, T.z, 0.01)
    Wait(500)
    local U = v(o)
    local V = A(o)
    local W = NetworkCreateSynchronisedScene(U.x, U.y, U.z, V.x, V.y, V.z, 2, 1, 0, 1065353216, 0, 1065353216)
    NetworkAddPedToSynchronisedScene(
        tXTRA.getPlayerPed(),
        W,
        "anim_casino_b@amb@casino@games@shared@player@",
        N(x),
        2.0,
        -2.0,
        13,
        16,
        2.0,
        0
    )
    NetworkStartSynchronisedScene(W)
    Citizen.InvokeNative(0x79C0E43EB9B944E2, -2124244681)
    Wait(6000)
    Locali98f_55 = NetworkCreateSynchronisedScene(U.x, U.y, U.z, V.x, V.y, V.z, 2, 1, 1, 1065353216, 0, 1065353216)
    NetworkAddPedToSynchronisedScene(
        tXTRA.getPlayerPed(),
        Locali98f_55,
        "anim_casino_b@amb@casino@games@shared@player@",
        "idle_cardgames",
        2.0,
        -2.0,
        13,
        16,
        1148846080,
        0
    )
    NetworkStartSynchronisedScene(Locali98f_55)
    StartAudioScene("DLC_VW_Casino_Table_Games")
    Citizen.InvokeNative(0x79C0E43EB9B944E2, -2124244681)
    g = false
end
function showHowToCoinflip(X)
    RageUI.ActuallyCloseAll()
    RageUI.Visible(RMenu:Get("mgcoinflip", "instructions"), X)
end
function showCoinflipMenu(X)
    RageUI.ActuallyCloseAll()
    RageUI.Visible(RMenu:Get("mgcoinflip", "mainmenu"), X)
end
RMenu.Add(
    "xtracoinflip",
    "instructions",
    RageUI.CreateMenu(
        "",
        "~b~COINFLIP",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "xtra_coinflip",
        "xtra_coinflip"
    )
)
RMenu.Add(
    "xtracoinflip",
    "mainmenu",
    RageUI.CreateMenu(
        "",
        "~b~COINFLIP",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "xtra_coinflip",
        "xtra_coinflip"
    )
)
RMenu.Add(
    "xtracoinflip",
    "confirm",
    RageUI.CreateSubMenu(
        RMenu:Get("mgcoinflip", "mainmenu"),
        "",
        "~b~COINFLIP",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight(),
        "xtra_coinflip",
        "xtra_coinflip"
    )
)
RageUI.CreateWhile(
    1.0,
    true,
    function()
        RageUI.IsVisible(
            RMenu:Get("mgcoinflip", "instructions"),
            true,
            false,
            true,
            function()
                RageUI.Separator("Propose a bet, or accept a proposed bet.")
                RageUI.Separator("Flip a coin against your opponent, winner takes all!")
                RageUI.Separator("Minimum £100,000 per coinflip.")
            end,
            function()
            end
        )
        RageUI.IsVisible(
            RMenu:Get("mgcoinflip", "mainmenu"),
            true,
            false,
            true,
            function()
                RageUI.ButtonWithStyle(
                    "Propose Bet",
                    "",
                    {RightLabel = "→→→"},
                    true,
                    function(Y, Z, _)
                        if _ then
                            local a0 = tXTRA.KeyboardInput("Bet Amount", "", 30)
                            if tonumber(a0) then
                                a0 = tonumber(a0)
                                if a0 > 0 then
                                    TriggerServerEvent("XTRA:proposeCoinflip", a0)
                                end
                            end
                        end
                    end
                )
                RageUI.Separator("---")
                if table.count(h) > 0 then
                    for a1, M in pairs(h) do
                        RageUI.ButtonWithStyle(
                            "~y~£" .. getMoneyStringFormatted(M.betAmount),
                            "",
                            {RightBadge = RageUI.BadgeStyle.GoldMedal},
                            true,
                            function(Y, Z, _)
                                if _ then
                                    i = a1
                                    j = "£" .. getMoneyStringFormatted(M.betAmount)
                                    if M.user_id == tXTRA.getUserId() then
                                        k = true
                                    else
                                        k = false
                                    end
                                end
                            end,
                            RMenu:Get("mgcoinflip", "confirm")
                        )
                    end
                else
                    RageUI.Separator("~r~No pending bets.")
                end
            end,
            function()
            end
        )
        RageUI.IsVisible(
            RMenu:Get("mgcoinflip", "confirm"),
            true,
            false,
            true,
            function()
                if not h[i] then
                    RageUI.GoBack()
                    return
                end
                RageUI.Separator("Coinflip " .. j .. "?")
                if k then
                    RageUI.Separator("~y~This is your pending proposal.")
                    RageUI.ButtonWithStyle(
                        "Cancel Bet",
                        "",
                        {RightBadge = RageUI.BadgeStyle.Tick},
                        true,
                        function(Y, Z, _)
                            if _ then
                                TriggerServerEvent("XTRA:cancelCoinflip")
                            end
                        end,
                        RMenu:Get("mgcoinflip", "mainmenu")
                    )
                    RageUI.ButtonWithStyle(
                        "Return",
                        "",
                        {RightBadge = RageUI.BadgeStyle.Alert},
                        true,
                        function(Y, Z, _)
                            if _ then
                            end
                        end,
                        RMenu:Get("mgcoinflip", "mainmenu")
                    )
                else
                    RageUI.ButtonWithStyle(
                        "Accept",
                        "",
                        {RightBadge = RageUI.BadgeStyle.Tick},
                        true,
                        function(Y, Z, _)
                            if _ then
                                TriggerServerEvent("XTRA:acceptCoinflip", i)
                            end
                        end,
                        RMenu:Get("mgcoinflip", "mainmenu")
                    )
                    RageUI.ButtonWithStyle(
                        "Decline",
                        "",
                        {RightBadge = RageUI.BadgeStyle.Alert},
                        true,
                        function(Y, Z, _)
                            if _ then
                            end
                        end,
                        RMenu:Get("mgcoinflip", "mainmenu")
                    )
                end
            end,
            function()
            end
        )
    end
)
AddEventHandler(
    "XTRA:onClientSpawn",
    function(a2, a3)
        if a3 then
            TriggerServerEvent("XTRA:requestCoinflipTableData")
        end
    end
)
RegisterNetEvent(
    "XTRA:addCoinflipProposal",
    function(a1, M)
        h[a1] = M
    end
)
RegisterNetEvent(
    "XTRA:cancelCoinflipBet",
    function(a1)
        h[a1] = nil
    end
)
RegisterNetEvent(
    "XTRA:clearCoinflipBets",
    function(a1)
        h = {}
    end
)
RegisterNetEvent("XTRA:coinflipOutcome",function(a4, a5)
        l = true
        showCoinflipMenu(false)
        SendNUIMessage({transactionType = "jackpotroll"})
        local a6 = Scaleform("MP_BIG_MESSAGE_FREEMODE")
        local a7 = false
        local a8 = false
        SetTimeout(10000,function()
                a7 = true
                if a4 then
                    tXTRA.notify("~g~ You won £" .. getMoneyStringFormatted(a5.amount) .. "!")
                    SendNUIMessage({transactionType = "playCasinoWin"})
                else
                    tXTRA.notify("~r~ You lost £" .. getMoneyStringFormatted(a5.amount) .. "!")
                    SendNUIMessage({transactionType = "playCasinoLose"})
                end
            end
        )
        SetTimeout(
            15000,
            function()
                a8 = true
            end
        )
        local a9 = false
        local aa = 0.0
        local ab = 2.71828182846
        local ac = 0.00
        local F = tXTRA.getPlayerCoords()
        while not a8 do
            local ad = GetFrameTime()
            aa = aa + 0.01 * ad
            local ae = 1 - ab ^ (-80 * aa)
            if ae > ac + 0.005 then
                ac = ae
                a9 = not a9
                local af = GetSoundId()
                PlaySoundFromCoord(af, "Spin_Single_Ticks", F.x, F.y, F.z, "dlc_vw_casino_lucky_wheel_sounds", 0, 0, 0)
                SetTimeout(
                    100,
                    function()
                        ReleaseSoundId(af)
                    end
                )
            end
            if a9 then
                if not a7 then
                    a6.RunFunction("SHOW_SHARD_WASTED_MP_MESSAGE", {a5.winner, "Rolling...", 0, false, false})
                end
            else
                if not a7 then
                    a6.RunFunction("SHOW_SHARD_WASTED_MP_MESSAGE", {a5.loser, "Rolling...", 0, false, false})
                end
            end
            if a7 then
                if a4 then
                    a6.RunFunction("SHOW_SHARD_WASTED_MP_MESSAGE", {a5.winner, "~g~You WON!", 0, false, false})
                else
                    a6.RunFunction("SHOW_SHARD_WASTED_MP_MESSAGE", {a5.winner, "~r~You LOST!", 0, false, false})
                end
            end
            a6.Render2D()
            Wait(0)
        end
        h = {}
        showCoinflipMenu(true)
        l = false
    end
)
