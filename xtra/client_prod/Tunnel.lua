Tools = {}
local a = {}
function Tools.newIDGenerator()
    local b = setmetatable({}, {__index = a})
    b:construct()
    return b
end
function a:construct()
    self:clear()
end
function a:clear()
    self.max = 0
    self.ids = {}
end
function a:gen()
    if #self.ids > 0 then
        return table.remove(self.ids)
    else
        local b = self.max
        self.max = self.max + 1
        return b
    end
end
function a:free(c)
    table.insert(self.ids, c)
end
Tunnel = {}
local function d(e, f)
    local g = getmetatable(e)
    local h = g.name
    local i = g.tunnel_ids
    local j = g.tunnel_callbacks
    local k = g.identifier
    local l = function(m, n)
        if m == nil then
            m = {}
        end
        if type(n) == "function" then
            local o = i:gen()
            j[o] = n
            TriggerServerEvent(h .. ":tunnel_req", f, m, k, o)
        else
            TriggerServerEvent(h .. ":tunnel_req", f, m, "", -1)
        end
    end
    e[f] = l
    return l
end
function Tunnel.bindInterface(p, q)
    RegisterNetEvent(p .. ":tunnel_req")
    AddEventHandler(
        p .. ":tunnel_req",
        function(r, m, k, o)
            local s = q[r]
            local t = false
            local u = {}
            if type(s) == "function" then
                TUNNEL_DELAYED = function()
                    t = true
                    return function(u)
                        u = u or {}
                        if o >= 0 then
                            TriggerServerEvent(p .. ":" .. k .. ":tunnel_res", o, u)
                        end
                    end
                end
                u = {s(table.unpack(m))}
            end
            if not t and o >= 0 then
                TriggerServerEvent(p .. ":" .. k .. ":tunnel_res", o, u)
            end
        end
    )
end
function Tunnel.getInterface(p, k)
    local i = Tools.newIDGenerator()
    local j = {}
    local b = setmetatable({}, {__index = d, name = p, tunnel_ids = i, tunnel_callbacks = j, identifier = k})
    RegisterNetEvent(p .. ":" .. k .. ":tunnel_res")
    AddEventHandler(
        p .. ":" .. k .. ":tunnel_res",
        function(o, m)
            local n = j[o]
            if n ~= nil then
                i:free(o)
                j[o] = nil
                n(table.unpack(m))
            end
        end
    )
    return b
end
