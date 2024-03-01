mousedrw = 0
mousex, mousey = 0.0, 0.0
inGUIXTRA = false
function CursorInZone(a, b, c, d)
    if mousedrw == 1 and mousex > a and mousex < c and mousey > b and mousey < d then
        return true
    else
        return false
    end
end
function setCursor(e)
    mousedrw = e
end
function CursorInArea(f, g, h, i)
    if mousex > f and mousex < g and mousey > h and mousey < i then
        return true
    end
end
function CursorInAreaRect(f, h, j, k)
    local l = j / 2.0
    local m = k / 2.0
    return CursorInArea(f - l, f + l, h - m, h + m)
end
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            if mousedrw == 1 then
                mousex = GetControlNormal(2, 239)
                mousey = GetControlNormal(2, 240)
                mousex_d = GetDisabledControlNormal(2, 239)
                mousey_d = GetDisabledControlNormal(2, 240)
                SetMouseCursorActiveThisFrame()
            end
        end
    end
)
function func_disableGuiControls()
    if inGUIXTRA then
        DisableControlAction(0, 1, true)
        DisableControlAction(0, 2, true)
        DisableControlAction(0, 25, true)
        DisableControlAction(0, 106, true)
        DisableControlAction(0, 24, true)
        DisableControlAction(0, 140, true)
        DisableControlAction(0, 141, true)
        DisableControlAction(0, 142, true)
        DisableControlAction(0, 257, true)
        DisableControlAction(0, 263, true)
        DisableControlAction(0, 264, true)
        DisableControlAction(0, 12, true)
        DisableControlAction(0, 14, true)
        DisableControlAction(0, 15, true)
        DisableControlAction(0, 16, true)
        DisableControlAction(0, 17, true)
    end
end
function GetArea(f, h, j, k)
    local n = f - j / 2
    local g = f + j / 2
    local o = h - k / 2
    local i = h + k / 2
    return n, g, o, i
end
Citizen.CreateThread(
    function()
        while not tXTRA.createThreadOnTick do
            Wait(0)
        end
        tXTRA.createThreadOnTick(func_disableGuiControls)
    end
)
function GetArea(f, h, j, k)
    local n = f - j / 2
    local g = f + j / 2
    local o = h - k / 2
    local i = h + k / 2
    return n, g, o, i
end
function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end