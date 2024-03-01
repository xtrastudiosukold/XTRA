local cfg = {}

cfg.stores = {
	["JDSports"] = {
		_config = {130.56843566895,-1034.9497070313,28.555471420288,676,1,"JD Sports Bags","",true},
		["Green Hiking Backpack (+40kg)"] = {5, 106, 1,120000,40},
		["Tan Hiking Backpack (+40kg)"] = {5, 106, 0,120000,40},
		["Gucci Bag (+20kg)"] = {5, 105, 0,60000,20},
		["Off White Bag (+15kg)"] = {5, 103, 0,40000,15},
		["Nike Bag (+30kg)"] = {5, 101, 0,80000,30},
		["Hunting Backpack (+35kg)"] = {5, 102, 0,100000,35},
		["Primark Bag (+30kg)"] = {5, 35, 3,80000,30},
	},
	["Rebel"] = {
		_config = {1540.7928466797,6332.4702148438,23.071977615356,676,1,"Rebel Backpacks","rebellicense.whitelisted",true},
		["Rebel Backpack (+70kg)"] = {5, 109, 0,250000,70},
	},
	--?Don't add a second rebel, causes backpack dupe.
}

return cfg