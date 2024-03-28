Proxy = {}
local a = {}
local function b(c)
    a = c
end
local function d(e, f)
    local g = getmetatable(e).name
    local h = function(i, j)
        if i == nil then
            i = {}
        end
        TriggerEvent(g .. ":proxy", f, i, b)
        return table.unpack(a)
    end
    e[f] = h
    return h
end
function Proxy.addInterface(k, e)
    AddEventHandler(
        k .. ":proxy",
        function(l, i, j)
            local m = e[l]
            if type(m) == "function" then
                j({m(table.unpack(i))})
            else
            end
        end
    )
end
function Proxy.getInterface(k)
    local n = setmetatable({}, {__index = d, name = k})
    return n
end
