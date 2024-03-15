Menu = setmetatable({}, Menu)
Menu.__index = Menu
function Menu.new(a, b, c, d, e, f, g)
    local h = {
        visible = false,
        currentmenu = "main",
        lastmenu = {},
        selected = 1,
        from = 1,
        to = 10,
        maxbuttons = 10,
        title = a,
        title_sprite = nil,
        header = b,
        name = "main",
        buttons = {},
        config = {
            position = {x = c, y = d},
            size = {width = 0.45, height = 0.35},
            font = g,
            pcontrol = false,
            text_color = {r = 0, g = 255, b = 255, a = 255},
            bg_color = {r = 0, g = 0, b = 0, a = 155},
            stext_color = {r = 0, g = 0, b = 0, a = 255},
            sbg_color = {r = 255, g = 255, b = 255, a = 200},
            menu_name = true,
            controls = {
                menu_up = 27,
                menu_down = 173,
                menu_left = 174,
                menu_right = 175,
                menu_select = 201,
                menu_back = 177
            }
        }
    }
    return setmetatable(h, Menu)
end
function Menu:showNotification(i)
    self.notification = nil
    Citizen.CreateThread(
        function()
            while self.notification ~= nil do
                Citizen.Wait(10)
            end
            self.notification = i
            Citizen.Wait(1250)
            self.notification = nil
        end
    )
end
function Menu:setMaxButtons(j)
    self.to = j
    self.maxbuttons = j
end
function Menu:setColors(k, m, n, o)
    self.config.text_color = k
    self.config.bg_color = n
    self.config.stext_color = m
    self.config.sbg_color = o
end
function Menu:isVisible()
    return self.visible
end
function drawMenuText(p, g, q, c, d, r, s, t, u, v)
    SetTextFont(g)
    SetTextProportional(0)
    SetTextScale(r, r)
    SetTextColour(s, t, u, v)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextCentre(q)
    SetTextEntry("STRING")
    AddTextComponentString(p)
    DrawText(c, d)
end
function drawInfo(p, g, c, d, e, f, r, s, t, u, v)
    SetTextFont(g)
    SetTextProportional(0)
    SetTextScale(r, r)
    SetTextWrap(c - e / 2.2, c + e / 2.2)
    l = GetLineCount(p, c - e / 2.2, d - f / 2.8)
    local w, x = c, d
    DrawRect(w, x + 0.0025, e, f, 0, 0, 0, 180)
    x = x + r / 10 / 2 + 0.011
    if l > 1 then
        for y = 1, l do
            DrawRect(w, x, e, r / 10 / 2, 0, 0, 0, 180)
            x = x + r / 10 / 2
        end
    end
    SetTextColour(s, t, u, v)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextEntry("STRING")
    AddTextComponentString(p)
    DrawText(c - e / 2.2, d - f / 2.8)
end
function drawRightMenuText(p, g, q, c, d, r, s, t, u, v)
    SetTextFont(g)
    SetTextProportional(0)
    SetTextScale(r, r)
    SetTextRightJustify(1)
    SetTextWrap(0.0, c)
    SetTextColour(s, t, u, v)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextCentre(q)
    SetTextEntry("STRING")
    AddTextComponentString(p)
    DrawText(c, d)
end
function Menu:config(z)
    if z then
        if z.pcontrol then
            self.config.pcontrol = z.pcontrol
        end
    end
end
function Menu:Open(A)
    if A ~= nil then
        if self.name ~= A then
            self.currentmenu = self[A]
        else
            self.currentmenu = A
        end
    end
    if self.OnMenuOpen ~= nil then
        self:OnMenuOpen(self)
    end
    self.visible = true
    self:draw()
    if not self.config.pcontrol then
        SetPlayerControl(PlayerId(), false, 260)
    end
    Citizen.CreateThread(
        function()
            if not HasStreamedTextureDictLoaded("commonmenu") then
                RequestStreamedTextureDict("commonmenu")
                while not HasStreamedTextureDictLoaded("commonmenu") do
                    Citizen.Wait(0)
                end
            end
            if not HasStreamedTextureDictLoaded("commonmenutu") then
                RequestStreamedTextureDict("commonmenutu")
                while not HasStreamedTextureDictLoaded("commonmenutu") do
                    Citizen.Wait(0)
                end
            end
            if self.title_sprite then
                if not HasStreamedTextureDictLoaded(self.title_sprite) then
                    RequestStreamedTextureDict(self.title_sprite)
                    while not HasStreamedTextureDictLoaded(self.title_sprite) do
                        Citizen.Wait(0)
                    end
                end
            end
        end
    )
end
function Menu:ChangeMenu(A)
    if A ~= self.name then
        A = self[A]
    else
        A = self
    end
    if self.OnMenuChange ~= nil then
        self:OnMenuChange(self.currentmenu, A)
    end
    self.lastmenu[#self.lastmenu + 1] = self.currentmenu
    self.currentmenu = A
end
function Menu:Close()
    if self.OnMenuClose ~= nil then
        self:OnMenuClose(self)
    end
    self.visible = false
    self.currentmenu = "main"
    self.selected = 1
    self.lastmenu = {}
    self.from = 1
    self.to = self.maxbuttons
    if not self.config.pcontrol then
        SetPlayerControl(PlayerId(), true)
    end
    if HasStreamedTextureDictLoaded("commonmenu") then
        SetStreamedTextureDictAsNoLongerNeeded("commonmenu")
    end
    if HasStreamedTextureDictLoaded("commonmenutu") then
        SetStreamedTextureDictAsNoLongerNeeded("commonmenutu")
    end
end
function Menu:addButton(A, B)
    local C = {}
    C.name = A
    C.selected = false
    C.sprite = nil
    if B ~= nil then
        if not type(B) == "table" then
            B = {B}
        end
        C.args = B
    end
    table.insert(self.buttons, C)
    return self.buttons[#self.buttons]
end
function Menu:addPurchase(A, D, E, B)
    local C = {}
    C.name = A
    C.selected = false
    if B ~= nil then
        if not type(B) == "table" then
            B = {B}
        end
        C.args = B
    end
    C.price = D or 0
    C.purchased = false
    C.sprite = nil
    C.info = E
    table.insert(self.buttons, C)
    return self.buttons[#self.buttons]
end
function Menu:addList(A, F)
    local C = {}
    C.name = A
    C.selected = false
    C.list = F
    C.sprite = nil
    C.listindex = 1
    table.insert(self.buttons, C)
    return self.buttons[#self.buttons]
end
function Menu:addCheckbox(A, u)
    local C = {}
    C.name = A
    C.selected = false
    C.sprite = nil
    C.checkbox = u
    table.insert(self.buttons, C)
    return self.buttons[#self.buttons]
end
function Menu:removeButton(C)
    for y, G in pairs(self.buttons) do
        if G == C then
            buttons[y] = nil
            break
        end
    end
end
function Menu:OnButtonListChange(C)
    if C then
    end
end
function Menu:addSubMenu(b, A, E, H)
    if self[A] ~= nil then
        setmetatable(getmetatable(self[A]), nil)
        self[A] = nil
    end
    local I = {
        buttons = {},
        header = b,
        name = A,
        parent = self.name,
        selected = 1,
        from = 1,
        to = self.maxbuttons,
        maxbuttons = self.maxbuttons
    }
    if E then
        I.info = E
    end
    self[A] = I
    for y, G in pairs(self.buttons) do
        if G.menu and G.menu.name == A then
            H = false
        end
    end
    if H then
        table.insert(self.buttons, {name = A, selected = false, menu = self[A], info = E})
    end
    return setmetatable(self[A], Menu)
end
function tablelength(J)
    local K = 0
    for L in pairs(J) do
        K = K + 1
    end
    return K
end
function Menu:draw()
    Citizen.CreateThread(
        function()
            local M
            local buttons
            local N = nil
            while self.visible do
                Citizen.Wait(0)
                local O = self.config
                local P = O.size
                local e = P.width
                local f = P.height
                f = f / self.maxbuttons
                local r = O.scale
                r = f / 0.1
                local c = O.position.x
                local d = O.position.y
                local Q = c
                local R = d
                if self.title_sprite then
                    DrawSprite(
                        self.title_sprite,
                        self.title_sprite,
                        c,
                        d - 0.039,
                        e,
                        f + 0.08,
                        0.00,
                        255,
                        255,
                        255,
                        255
                    )
                else
                    drawMenuText(
                        self.title,
                        1,
                        1,
                        Q,
                        R - f - 0.009,
                        r * 2.4,
                        O.stext_color.r,
                        O.stext_color.g,
                        O.stext_color.b,
                        O.stext_color.a
                    )
                    DrawRect(c, d - 0.019, e, f + 0.04, O.sbg_color.r, O.sbg_color.g, O.sbg_color.b, O.sbg_color.a)
                end
                d = d + f
                R = d - f / 2.8
                Q = Q - e / 2.2
                if self.currentmenu == "main" then
                    M = self
                else
                    M = self.currentmenu
                end
                if M == nil then
                    return
                end
                buttons = M.buttons
                if self.header then
                    drawMenuText(
                        M.header:upper(),
                        O.font,
                        0,
                        Q,
                        R,
                        r,
                        O.text_color.r,
                        O.text_color.g,
                        O.text_color.b,
                        O.text_color.a
                    )
                end
                drawRightMenuText(
                    M.selected .. "/" .. tablelength(M.buttons),
                    O.font,
                    0,
                    c + e / 2.1,
                    R,
                    r,
                    O.text_color.r,
                    O.text_color.g,
                    O.text_color.b,
                    O.text_color.a
                )
                DrawRect(c, d, e, f, O.bg_color.r, O.bg_color.g, O.bg_color.b, 255)
                d = d + f
                R = d - f / 2.8
                for y, G in pairs(buttons) do
                    if y >= M.from and y <= M.to then
                        if M.selected == y then
                            if N ~= M.selected then
                                N = M.selected
                                if self.onSelectedIndexChanged ~= nil then
                                    self:onSelectedIndexChanged(G.name, G)
                                end
                            end
                            drawMenuText(
                                G.name,
                                O.font,
                                0,
                                Q,
                                R,
                                r,
                                O.stext_color.r,
                                O.stext_color.g,
                                O.stext_color.b,
                                O.stext_color.a
                            )
                            DrawRect(c, d, e, f, O.sbg_color.r, O.sbg_color.g, O.sbg_color.b, O.sbg_color.a)
                            if G.sprite ~= nil then
                                if G.sprite == "garage" then
                                    DrawSprite(
                                        "commonmenu",
                                        "shop_garage_icon_b",
                                        c + e / 2.4,
                                        d,
                                        r / 10 - 0.01,
                                        r / 10 + 0.01,
                                        0.00,
                                        O.text_color.r,
                                        O.text_color.g,
                                        O.text_color.b,
                                        O.text_color.a
                                    )
                                end
                            elseif G.price ~= nil then
                                if G.price == 0 then
                                    drawRightMenuText(
                                        "",
                                        O.font,
                                        0,
                                        c + e / 2.1,
                                        R,
                                        r,
                                        O.stext_color.r,
                                        O.stext_color.g,
                                        O.stext_color.b,
                                        O.stext_color.a
                                    )
                                else
                                    if not G.purchased then
                                        drawRightMenuText(
                                            "£" .. G.price,
                                            O.font,
                                            0,
                                            c + e / 2.1,
                                            R,
                                            r,
                                            O.stext_color.r,
                                            O.stext_color.g,
                                            O.stext_color.b,
                                            O.stext_color.a
                                        )
                                    else
                                        drawRightMenuText(
                                            "OWNED",
                                            O.font,
                                            0,
                                            c + e / 2.1,
                                            R,
                                            r,
                                            O.stext_color.r,
                                            O.stext_color.g,
                                            O.stext_color.b,
                                            O.stext_color.a
                                        )
                                    end
                                end
                            elseif G.menu ~= nil then
                                DrawSprite(
                                    "commonmenutu",
                                    "arrowright",
                                    c + e / 2.2,
                                    d,
                                    r / 14 - 0.01,
                                    r / 19 + 0.01,
                                    0.00,
                                    O.stext_color.r,
                                    O.stext_color.g,
                                    O.stext_color.b,
                                    O.stext_color.a
                                )
                            end
                            if
                                IsControlJustReleased(1, self.config.controls.menu_select) or
                                    IsDisabledControlJustReleased(1, self.config.controls.menu_select)
                             then
                                if self.onButtonSelected ~= nil then
                                    self:onButtonSelected(G.name, G)
                                end
                                if G.menu ~= nil then
                                    if self.OnMenuChange ~= nil then
                                        self:OnMenuChange(M, G.menu)
                                    end
                                    self.lastmenu[#self.lastmenu + 1] = self.currentmenu
                                    self.currentmenu = G.menu
                                    N = nil
                                end
                                if G.checkbox ~= nil then
                                    G.checkbox = not G.checkbox
                                    if self.onCheckboxChange ~= nil then
                                        self:onCheckboxChange(G.name, G.checkbox)
                                    end
                                end
                            end
                            if G.checkbox ~= nil then
                                if G.checkbox then
                                    DrawSprite(
                                        "commonmenu",
                                        "shop_box_tickb",
                                        c + e / 2.3,
                                        d,
                                        r / 10,
                                        r / 10,
                                        0.00,
                                        O.stext_color.r,
                                        O.stext_color.g,
                                        O.stext_color.b,
                                        O.stext_color.a
                                    )
                                else
                                    DrawSprite(
                                        "commonmenu",
                                        "shop_box_blankb",
                                        c + e / 2.3,
                                        d,
                                        r / 10,
                                        r / 10,
                                        0.00,
                                        O.stext_color.r,
                                        O.stext_color.g,
                                        O.stext_color.b,
                                        O.stext_color.a
                                    )
                                end
                            end
                            if G.list then
                                drawRightMenuText(
                                    "< " .. G.list[G.listindex] .. " >",
                                    O.font,
                                    0,
                                    c + e / 2.1,
                                    R,
                                    r,
                                    O.stext_color.r,
                                    O.stext_color.g,
                                    O.stext_color.b,
                                    O.stext_color.a
                                )
                                if
                                    IsControlJustPressed(1, self.config.controls.menu_left) or
                                        IsDisabledControlJustPressed(1, self.config.controls.menu_left)
                                 then
                                    if G.listindex > 1 then
                                        G.listindex = G.listindex - 1
                                    else
                                        G.listindex = #G.list
                                    end
                                    if self.OnButtonListChange ~= nil then
                                        self:OnButtonListChange(G)
                                    end
                                end
                                if
                                    IsControlJustPressed(1, self.config.controls.menu_right) or
                                        IsDisabledControlJustPressed(1, self.config.controls.menu_right)
                                 then
                                    if G.listindex < #G.list then
                                        G.listindex = G.listindex + 1
                                    else
                                        G.listindex = 1
                                    end
                                    if self.OnButtonListChange ~= nil then
                                        self:OnButtonListChange(G)
                                    end
                                end
                            end
                        else
                            drawMenuText(
                                G.name,
                                O.font,
                                0,
                                Q,
                                R,
                                r,
                                O.text_color.r,
                                O.text_color.g,
                                O.text_color.b,
                                O.text_color.a
                            )
                            if G.list then
                                drawRightMenuText(
                                    "< " .. G.list[G.listindex] .. " >",
                                    O.font,
                                    0,
                                    c + e / 2.1,
                                    R,
                                    r,
                                    O.text_color.r,
                                    O.text_color.g,
                                    O.text_color.b,
                                    O.text_color.a
                                )
                            end
                            DrawRect(c, d, e, f, O.bg_color.r, O.bg_color.g, O.bg_color.b, O.bg_color.a)
                            if G.sprite ~= nil then
                                if G.sprite == "garage" then
                                    DrawSprite(
                                        "commonmenu",
                                        "shop_garage_icon_a",
                                        c + e / 2.4,
                                        d,
                                        r / 10 - 0.01,
                                        r / 10 + 0.01,
                                        0.00,
                                        O.text_color.r,
                                        O.text_color.g,
                                        O.text_color.b,
                                        O.text_color.a
                                    )
                                end
                            elseif G.price ~= nil then
                                if G.price ~= 0 then
                                    if not G.purchased then
                                        drawRightMenuText(
                                            "£" .. G.price,
                                            O.font,
                                            0,
                                            c + e / 2.1,
                                            R,
                                            r,
                                            O.text_color.r,
                                            O.text_color.g,
                                            O.text_color.b,
                                            O.text_color.a
                                        )
                                    else
                                        drawRightMenuText(
                                            "OWNED",
                                            O.font,
                                            0,
                                            c + e / 2.1,
                                            R,
                                            r,
                                            O.text_color.r,
                                            O.text_color.g,
                                            O.text_color.b,
                                            O.text_color.a
                                        )
                                    end
                                end
                            elseif G.menu ~= nil then
                                DrawSprite(
                                    "commonmenu",
                                    "arrowright",
                                    c + e / 2.2,
                                    d,
                                    r / 14 - 0.01,
                                    r / 19 + 0.01,
                                    0.00,
                                    O.text_color.r,
                                    O.text_color.g,
                                    O.text_color.b,
                                    O.text_color.a
                                )
                            end
                            if G.checkbox ~= nil then
                                if G.checkbox then
                                    DrawSprite(
                                        "commonmenu",
                                        "shop_box_tick",
                                        c + e / 2.3,
                                        d,
                                        r / 10,
                                        r / 10,
                                        0.00,
                                        O.text_color.r,
                                        O.text_color.g,
                                        O.text_color.b,
                                        O.text_color.a
                                    )
                                else
                                    DrawSprite(
                                        "commonmenu",
                                        "shop_box_blank",
                                        c + e / 2.3,
                                        d,
                                        r / 10,
                                        r / 10,
                                        0.00,
                                        O.text_color.r,
                                        O.text_color.g,
                                        O.text_color.b,
                                        O.text_color.a
                                    )
                                end
                            end
                        end
                        d = d + f
                        R = d - f / 2.8
                    end
                end
                if tablelength(buttons) > M.maxbuttons then
                    DrawRect(c, d, e, f, O.bg_color.r, O.bg_color.g, O.bg_color.b, 255)
                    DrawSprite(
                        "commonmenu",
                        "shop_arrows_upanddown",
                        c,
                        d,
                        r / 13,
                        r / 9,
                        0.00,
                        O.text_color.r,
                        O.text_color.g,
                        O.text_color.b,
                        O.text_color.a
                    )
                    d = d + f
                    R = d - f / 2.8
                end
                if self.notification ~= nil then
                    DrawRect(c, d - f + d - R + 0.0055, e, 0.0035, O.sbg_color.r, O.sbg_color.g, O.sbg_color.b, 255)
                    drawInfo(
                        self.notification,
                        O.font,
                        c,
                        d,
                        e,
                        f,
                        r,
                        O.text_color.r,
                        O.text_color.g,
                        O.text_color.b,
                        O.text_color.a
                    )
                elseif M.buttons[M.selected] and M.buttons[M.selected].info ~= nil then
                    DrawRect(c, d - f + d - R + 0.0055, e, 0.0035, O.sbg_color.r, O.sbg_color.g, O.sbg_color.b, 255)
                    drawInfo(
                        M.buttons[M.selected].info,
                        O.font,
                        c,
                        d,
                        e,
                        f,
                        r,
                        O.text_color.r,
                        O.text_color.g,
                        O.text_color.b,
                        O.text_color.a
                    )
                end
                if
                    IsControlJustPressed(1, self.config.controls.menu_up) or
                        IsDisabledControlJustPressed(1, self.config.controls.menu_up)
                 then
                    if M.selected > 1 then
                        M.selected = M.selected - 1
                    else
                        M.selected = #buttons
                        M.from = #buttons - M.maxbuttons + 1
                        M.to = #buttons
                    end
                    if tablelength(buttons) > M.maxbuttons and M.selected < M.from then
                        M.from = M.from - 1
                        M.to = M.to - 1
                    end
                end
                if
                    IsControlJustPressed(1, self.config.controls.menu_down) or
                        IsDisabledControlJustPressed(1, self.config.controls.menu_down)
                 then
                    if M.selected < #buttons then
                        M.selected = M.selected + 1
                    else
                        M.selected = 1
                        M.from = 1
                        M.to = M.maxbuttons
                    end
                    if tablelength(buttons) > M.maxbuttons and M.selected > M.to then
                        M.from = M.from + 1
                        M.to = M.to + 1
                    end
                end
                if
                    IsControlJustReleased(1, self.config.controls.menu_back) or
                        IsDisabledControlJustReleased(1, self.config.controls.menu_back)
                 then
                    if #self.lastmenu < 1 or self.currentmenu == self.lastmenu[1] then
                        self:Close()
                    else
                        if self.OnMenuChange ~= nil then
                            if self.lastmenu[#self.lastmenu] == "main" then
                                self:OnMenuChange(M, self)
                            else
                                self:OnMenuChange(M, self.lastmenu[#self.lastmenu])
                            end
                        end
                        self.currentmenu = self.lastmenu[#self.lastmenu]
                        self.lastmenu[#self.lastmenu] = nil
                    end
                end
            end
        end
    )
end
function GetLineCount(p, c, d)
    BeginTextCommandLineCount("STRING")
    AddTextComponentString(p)
    return EndTextCommandGetLineCount(c, d)
end
function Menu:getTitle()
    return self.title
end
function Menu:setTitle(i)
    self.title = i
end
function Menu:getName()
    return self.name
end
function Menu:getHeader()
    return self.header
end
function SetMenu()
    return Menu
end
