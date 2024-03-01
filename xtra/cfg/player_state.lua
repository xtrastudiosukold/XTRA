
local cfg = {}

-- define the first spawn position/radius of the player (very first spawn on the server, or after death)
cfg.spawn_enabled = true -- set to false to disable the feature
cfg.spawn_position = {-913.19909667969,-2040.3936767578,9.4047718048096}
cfg.spawn_death = {340.44674682617,-1388.2272949219,32.509239196777} -- x,y,z for death location
cfg.spawn_radius = 1

-- customization set when spawning for the first time
-- see https://wiki.fivem.net/wiki/Peds
-- mp_m_freemode_01 (male)
-- mp_f_freemode_01 (female)
cfg.default_customization = {
  model = "mp_m_freemode_01" 
}
for p=0,19 do 
  cfg.default_customization[p]={0,0}
end
cfg.default_customization[0]={0,0}
cfg.default_customization[1]={0,0}
cfg.default_customization[2]={47,0}
cfg.default_customization[3]={5,0}
cfg.default_customization[4]={4,0}
cfg.default_customization[5]={0,0}
cfg.default_customization[6]={7,0}
cfg.default_customization[7]={51,0}
cfg.default_customization[8]={0,240}
cfg.default_customization[9]={0,1}
cfg.default_customization[10]={0,0}
cfg.default_customization[11]={5,0}
cfg.default_customization[12]={4,0}
cfg.default_customization[15]={0,2}


cfg.clear_phone_directory_on_death = false
cfg.lose_aptitudes_on_death = false

return cfg
 -- {1151.2432861328,-1526.7790527344,34.843448638916}