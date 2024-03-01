function tXTRA.add3DTextForCoord(a, b, c, d, e)
    local function f(g)
        tXTRA.DrawText3D(g.coords, g.text, 0.2)
    end
    local h = tXTRA.generateUUID("3dtext", 8, "alphanumeric")
    tXTRA.createArea("3dtext_" .. h,vector3(b, c, d),e,6.0,function()end,function()end,f,{coords = vector3(b, c, d), text = a})
end
function tXTRA.drawFloatingHelpText(a, i)
    AddTextEntry("instructionalText", a)
    SetFloatingHelpTextWorldPosition(1, i.x, i.y, i.z)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp("instructionalText")
    AddTextComponentSubstringPlayerName(a)
    EndTextCommandDisplayHelp(2, false, false, -1)
end
function tXTRA.DrawText3D(i, a, j, k, l, m)
    local n, b, c = GetScreenCoordFromWorldCoord(i.x, i.y, i.z, 0.0, 0.0)
    if not n then
        return
    end
    SetTextScale(j, j)
    SetTextFont(k or 0)
    if m then
        SetTextColour(m[1], m[2], m[3], m[4])
    else
        SetTextColour(255, 255, 255, 255)
    end
    SetTextCentre(true)
    SetTextDropshadow(0, 0, 0, 0, 55)
    SetTextDropShadow()
    SetTextOutline()
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(a)
    EndTextCommandDisplayText(b, c)
    if l then
        local o = #a / 370
        DrawRect(b, c + 0.0125, 0.015 + o, 0.03, 41, 41, 41, 125)
    end
end
function tXTRA.DrawSprite3d(data)
    local dist = #(GetGameplayCamCoords().xy - data.pos.xy)
    local fov = (1 / GetGameplayCamFov()) * 250
    local scale = 0.3
    SetDrawOrigin(data.pos.x, data.pos.y, data.pos.z, 0)
    if not HasStreamedTextureDictLoaded(data.textureDict) then
        local timer = 1000
        RequestStreamedTextureDict(data.textureDict, true)
        while not HasStreamedTextureDictLoaded(data.textureDict) and timer > 0 do
            timer = timer-1
            Citizen.Wait(100)
        end
    end
    DrawSprite(data.textureDict,data.textureName,(data.x or 0) * scale,(data.y or 0) * scale,data.width * scale,data.height * scale,data.heading or 0,data.r or 0,data.g or 0,data.b or 0,data.a or 255)
    ClearDrawOrigin()
end
function tXTRA.DrawText(b, c, a, j, k, p, m, q)
    SetTextScale(j, j)
    SetTextFont(k or 0)
    if p then
        SetTextJustification(p)
    end
    if m then
        SetTextColour(m[1], m[2], m[3], m[4])
    else
        SetTextColour(255, 255, 255, 255)
    end
    if q then
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextDropShadow()
        SetTextOutline()
    end
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(a)
    EndTextCommandDisplayText(b, c)
end
function DrawAdvancedText(b, c, r, s, t, a, u, v, w, x, k, y)
    SetTextFont(k)
    SetTextScale(t, t)
    SetTextJustification(y)
    SetTextColour(u, v, w, x)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(a)
    EndTextCommandDisplayText(b - 0.1 + r, c - 0.02 + s)
end
function DrawAdvancedTextNoOutline(b, c, r, s, t, a, u, v, w, x, k, y)
    SetTextFont(k)
    SetTextScale(t, t)
    SetTextJustification(y)
    SetTextColour(u, v, w, x)
    SetTextDropShadow()
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(a)
    EndTextCommandDisplayText(b - 0.1 + r, c - 0.02 + s)
end
function DrawGTAText(a, b, c, j, z, A)
    SetTextFont(0)
    SetTextScale(j, j)
    SetTextColour(254, 254, 254, 255)
    if z then
        SetTextWrap(b - A, b)
        SetTextRightJustify(true)
    end
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(a)
    EndTextCommandDisplayText(b, c)
end
