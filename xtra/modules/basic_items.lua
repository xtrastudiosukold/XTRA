-- load config items
local cfg = module("cfg/items")

for k,v in pairs(cfg.items) do
  XTRA.defInventoryItem(k,v[1],v[2],v[3],v[4])
end
