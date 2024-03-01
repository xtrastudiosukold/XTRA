
local cfg = {}


cfg.save_interval = 15 -- seconds
cfg.whitelist = false -- enable/disable whitelist
cfg.ignore_ip_identifier = false -- This will allow multiple same IP connections (for families etc)

-- delay the tunnel at loading (for weak connections)
cfg.load_duration = 6 -- seconds, player duration in loading mode at the first spawn
cfg.load_delay = 0 -- milliseconds, delay the tunnel communication when in loading mode
cfg.global_delay = 0 -- milliseconds, delay the tunnel communication when not in loading mode


				-- SET YOUR LANGUAGE HERE - MAKE SURE IT'S INSIDE THE ""
cfg.lang = "en" -- en / xtra / it / ger / pt / ru / lith / dan / ar / pl / es / swe / fin / cn / ro 
				-- English/Français/Italiano/Deutsche/Português/Pусский/Lietuvių/Dansk/العربية/Polskie/Español/Svenska/Suomalainen/中文/Română
cfg.debug = false


return cfg