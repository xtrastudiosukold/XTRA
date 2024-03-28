local a = {}
local b = false
local c = {
    [1] = {val1 = 0.4},
    [2] = {val1 = 0.4},
    [3] = {val1 = 0.4},
    [4] = {val1 = 0.4},
    [5] = {val1 = 0.4},
    [6] = {val1 = 0.4},
    [7] = {val1 = 0.4}
}
local d = {
    [1] = {val0 = 1, val1 = 0.02 * 0.55, val2 = 0, val3 = 1, val4 = true},
    [2] = {val0 = 1, val1 = 0.025 * 0.55, val2 = 0, val3 = 1, val4 = true},
    [3] = {val0 = 1, val1 = 0.03 * 0.55, val2 = 0, val3 = 1, val4 = true},
    [4] = {val0 = 1, val1 = 0.035 * 0.55, val2 = 0, val3 = 1, val4 = true},
    [5] = {val0 = 1, val1 = 0.04 * 0.55, val2 = 0, val3 = 1, val4 = true},
    [6] = {val0 = 1, val1 = 0.045 * 0.55, val2 = 0, val3 = 1, val4 = true},
    [7] = {val0 = 1, val1 = 0.05 * 0.55, val2 = 0, val3 = 1, val4 = true}
}
function F_02536(e)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(e)
    EndTextCommandDisplayHelp(0, false, true, -1)
end
function F_02539()
    DisableControlAction(0, 73, false)
    DisableControlAction(0, 24, true)
    DisableControlAction(0, 257, true)
    DisableControlAction(0, 25, true)
    DisableControlAction(0, 263, true)
    DisableControlAction(0, 32, true)
    DisableControlAction(0, 34, true)
    DisableControlAction(0, 31, true)
    DisableControlAction(0, 30, true)
    DisableControlAction(0, 45, true)
    DisableControlAction(0, 22, true)
    DisableControlAction(0, 44, true)
    DisableControlAction(0, 37, true)
    DisableControlAction(0, 23, true)
    DisableControlAction(0, 288, true)
    DisableControlAction(0, 289, true)
    DisableControlAction(0, 170, true)
    DisableControlAction(0, 167, true)
    DisableControlAction(0, 73, true)
    DisableControlAction(2, 199, true)
    DisableControlAction(0, 47, true)
    DisableControlAction(0, 264, true)
    DisableControlAction(0, 257, true)
    DisableControlAction(0, 140, true)
    DisableControlAction(0, 141, true)
    DisableControlAction(0, 142, true)
    DisableControlAction(0, 143, true)
end
function F_02540(e)
    if c[e].val1 >= 0.51 and c[e].val1 <= 0.62 then
        return true
    end
    return false
end
function F_02541(e, f, g)
    local h
    h = (1.0 - Cos(F_02542(g * 3.141593))) * 0.5
    return e * (1 - h) + f * h
end
function F_02542(e)
    return e * 57.29578
end
function startDataCrack(i, j)
    local e
    if i == nil then
        e = 25
    elseif i < 2 then
        e = 25
    elseif i > 5 then
        e = 25
    else
        e = i * 10
    end
    c = {
        [1] = {val1 = 0.4},
        [2] = {val1 = 0.4},
        [3] = {val1 = 0.4},
        [4] = {val1 = 0.4},
        [5] = {val1 = 0.4},
        [6] = {val1 = 0.4},
        [7] = {val1 = 0.4}
    }
    d = {
        [1] = {val0 = 1, val1 = 0.02 * 0.55, val2 = 0, val3 = 1, val4 = true},
        [2] = {val0 = 1, val1 = 0.025 * 0.55, val2 = 0, val3 = 1, val4 = true},
        [3] = {val0 = 1, val1 = 0.03 * 0.55, val2 = 0, val3 = 1, val4 = true},
        [4] = {val0 = 1, val1 = 0.035 * 0.55, val2 = 0, val3 = 1, val4 = true},
        [5] = {val0 = 1, val1 = 0.04 * 0.55, val2 = 0, val3 = 1, val4 = true},
        [6] = {val0 = 1, val1 = 0.045 * 0.55, val2 = 0, val3 = 1, val4 = true},
        [7] = {val0 = 1, val1 = 0.05 * 0.55, val2 = 0, val3 = 1, val4 = true}
    }
    b = false
    Citizen.CreateThread(
        function()
            local k = 1
            d[k].val0 = 0
            while true do
                F_02539()
                F_02536("Press ~INPUT_FRONTEND_CANCEL~ to abort hack")
                if IsControlJustReleased(2, 237) or IsControlJustReleased(2, 176) or IsControlJustReleased(2, 179) then
                    if F_02540(k) then
                        PlaySoundFrontend(-1, "Pin_Good", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true)
                        d[k].val0 = 1
                        d[k].val4 = false
                        c[k].val1 = 0.572
                        if k < 7 then
                            d[k + 1].val0 = 0
                        end
                        k = k + 1
                        if k > 7 then
                            return
                        end
                    else
                        PlaySoundFrontend(-1, "Pin_Bad", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true)
                        if k > 1 then
                            d[k].val0 = 1
                            k = k - 1
                            d[k].val0 = 0
                            c[k].val1 = 0.572
                            d[k].val4 = true
                        elseif k == 1 then
                            b = true
                            j(false)
                        end
                        if b then
                            return
                        end
                    end
                elseif IsControlJustReleased(2, 202) then
                    b = true
                    j(false)
                end
                if b then
                    return
                end
                Citizen.Wait(1)
            end
        end
    )
    Citizen.CreateThread(
        function()
            while true do
                for l = 1, #d, 1 do
                    if d[l].val3 == 1 then
                        if d[l].val2 < 1.0 then
                            d[l].val2 = d[l].val2 + d[l].val1 * Timestep() * e * 1.0
                        else
                            d[l].val3 = 0
                        end
                    elseif d[l].val2 > 0.0 then
                        d[l].val2 = d[l].val2 - d[l].val1 * Timestep() * e * 1.0
                    else
                        d[l].val3 = 1
                    end
                    if d[l].val0 == 0 or d[l].val4 then
                        c[l].val1 = F_02541(0.744, 0.4, d[l].val2)
                    end
                    if b then
                        return
                    end
                end
                Citizen.Wait(1)
            end
        end
    )
    Citizen.CreateThread(
        function()
            RequestStreamedTextureDict("HACKING_PC_desktop_0", false)
            RequestStreamedTextureDict("hackingNG", false)
            local m = RequestScaleformMovieInteractive("HACKING_PC")
            while not HasScaleformMovieLoaded(m) do
                Citizen.Wait(0)
            end
            BeginScaleformMovieMethod(m, "ADD_PROGRAM")
            ScaleformMovieMethodAddParamFloat(1.0)
            ScaleformMovieMethodAddParamFloat(4.0)
            ScaleformMovieMethodAddParamTextureNameString("My Computer")
            EndScaleformMovieMethod()
            BeginScaleformMovieMethod(m, "ADD_PROGRAM")
            ScaleformMovieMethodAddParamFloat(6.0)
            ScaleformMovieMethodAddParamFloat(6.0)
            ScaleformMovieMethodAddParamTextureNameString("Power Off")
            EndScaleformMovieMethod()
            BeginScaleformMovieMethod(m, "SET_BACKGROUND")
            ScaleformMovieMethodAddParamInt(1)
            EndScaleformMovieMethod()
            while not HasStreamedTextureDictLoaded("hackingNG") do
                Citizen.Wait(1)
            end
            while true do
                DrawScaleformMovieFullscreen(m, 255, 255, 255, 255, 0)
                DrawSprite("hackingNG", "DHMain", 0.50, 0.50, 0.731, 1.306, 0, 255, 255, 255, 255)
                if d[1].val0 == 1 then
                    DrawSprite("hackingNG", "DHComp", 0.35, c[1].val1, 0.4, 0.4, 0, 255, 255, 255, 255)
                elseif d[1].val0 == 0 then
                    DrawSprite("hackingNG", "DHCompHi", 0.35, c[1].val1, 0.4, 0.4, 0, 255, 255, 255, 255)
                end
                if d[2].val0 == 1 then
                    DrawSprite("hackingNG", "DHComp", 0.40, c[2].val1, 0.4, 0.4, 0, 255, 255, 255, 255)
                elseif d[2].val0 == 0 then
                    DrawSprite("hackingNG", "DHCompHi", 0.40, c[2].val1, 0.4, 0.4, 0, 255, 255, 255, 255)
                end
                if d[3].val0 == 1 then
                    DrawSprite("hackingNG", "DHComp", 0.45, c[3].val1, 0.4, 0.4, 0, 255, 255, 255, 255)
                elseif d[3].val0 == 0 then
                    DrawSprite("hackingNG", "DHCompHi", 0.45, c[3].val1, 0.4, 0.4, 0, 255, 255, 255, 255)
                end
                if d[4].val0 == 1 then
                    DrawSprite("hackingNG", "DHComp", 0.50, c[4].val1, 0.4, 0.4, 0, 255, 255, 255, 255)
                elseif d[4].val0 == 0 then
                    DrawSprite("hackingNG", "DHCompHi", 0.50, c[4].val1, 0.4, 0.4, 0, 255, 255, 255, 255)
                end
                if d[5].val0 == 1 then
                    DrawSprite("hackingNG", "DHComp", 0.55, c[5].val1, 0.4, 0.4, 0, 255, 255, 255, 255)
                elseif d[5].val0 == 0 then
                    DrawSprite("hackingNG", "DHCompHi", 0.55, c[5].val1, 0.4, 0.4, 0, 255, 255, 255, 255)
                end
                if d[6].val0 == 1 then
                    DrawSprite("hackingNG", "DHComp", 0.60, c[6].val1, 0.4, 0.4, 0, 255, 255, 255, 255)
                elseif d[6].val0 == 0 then
                    DrawSprite("hackingNG", "DHCompHi", 0.60, c[6].val1, 0.4, 0.4, 0, 255, 255, 255, 255)
                end
                if d[7].val0 == 1 then
                    DrawSprite("hackingNG", "DHComp", 0.65, c[7].val1, 0.4, 0.4, 0, 255, 255, 255, 255)
                elseif d[7].val0 == 0 then
                    DrawSprite("hackingNG", "DHCompHi", 0.65, c[7].val1, 0.4, 0.4, 0, 255, 255, 255, 255)
                end
                if b == true then
                    return
                end
                if
                    d[1].val4 == false and d[2].val4 == false and d[3].val4 == false and d[4].val4 == false and
                        d[5].val4 == false and
                        d[6].val4 == false and
                        d[7].val4 == false
                 then
                    PlaySoundFrontend(-1, "HACKING_SUCCESS", "", true)
                    Citizen.Wait(2500)
                    b = true
                    TriggerEvent("datacrack", true)
                    j(true)
                    return
                end
                Citizen.Wait(1)
            end
        end
    )
end
