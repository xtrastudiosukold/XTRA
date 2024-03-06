local cfg = {}

cfg.garages = {
    {
        name = "John's Customs",
        type = "automobile",
        camera = {position = vector3(-330.945, -135.471, 39.01), heading = 102.213},
        driveOut = {position = vector3(-350.376, -136.76, 38.294), heading = 70.226},
		driveIn = {position = vector3(-350.655, -136.55, 38.295), heading = 249.532},
		outside = {position = vector3(-362.7962, -132.4005, 38.25239), heading = 71.187133},
		inside = {position = vector3(-337.3863, -136.9247, 38.5737), heading = 269.455}
    },
    {
        name = "Popular Customs",
        type = "automobile",
        camera = {position = vector3(737.09, -1085.721, 22.169), heading = 114.86},
		driveOut = {position = vector3(725.46, -1088.822, 21.455), heading = 89.395},
		driveIn = {position = vector3(726.157, -1088.768, 22.169), heading = 270.288},
		outside = {position = vector3(716.54, -1088.757, 21.651), heading = 89.248},
		inside = {position = vector3(733.69, -1088.74, 21.733), heading = 270.528}
    },
    {
        name = "Greenwich Customs",
        type = "automobile",
        camera = {position = vector3(-1154.902, -2011.438, 13.18), heading =95.49},
		driveOut = {position = vector3(-1150.379, -1995.845, 12.465), heading = 313.594},
		driveIn = {position = vector3(-1150.26, -1995.642, 12.466), heading = 136.859},
		outside = {position = vector3(-1140.352, -1985.89, 12.45), heading = 314.406},
		inside = {position = vector3(-1155.077, -2006.61, 12.465), heading = 162.58},
		interior = {key = 164353, room = 2044753180}
    },
	{
        name = "Route 68 Customs",
        type = "automobile",
		camera = {position = vector3(1177.98, 2636.059, 37.754), heading = 37.082},
		driveOut = {position = vector3(1175.003, 2642.175, 37.045), heading = 0.759},
		driveIn = {position = vector3(1174.701, 2643.764, 37.048), heading = 178.119},
		outside = {position = vector3(1175.565, 2652.819, 37.941), heading = 351.579},
		inside = {position = vector3(1174.823, 2637.807, 37.045), heading = 181.19}
	},
	{
        name = "Beeker's Customs",
        type = "automobile",
		camera = {position = vector3(105.825, 6627.562, 31.787), heading = 266.692},
		driveOut = {position = vector3(112.326, 6625.148, 31.073), heading = 224.641},
		driveIn = {position = vector3(112.738, 6624.644, 31.072), heading = 44.262},
		outside = {position = vector3(118.493, 6618.897, 31.13), heading = 224.701},
		inside = {position = vector3(108.842, 6628.447, 31.072), heading = 45.504}
	},
	{
        name = "Benny's Customs",
        type = "automobile",
		camera = {position = vector3(-215.518,-1329.135, 30.89), heading = 329.092},
		driveOut = {position = vector3(-205.935,-1316.642, 30.176), heading = 356.495},
		driveIn = {position = vector3(-205.626,-1314.99, 30.247), heading = 179.395},
		outside = {position = vector3(-205.594,-1304.085, 30.614), heading = 359.792},
		inside = {position = vector3(-212.368,-1325.486, 30.176), heading = 141.107}
	},
	{
        name = "Grove Customs",
        type = "automobile",
		camera = {position = vector3(-86.057243347168,-1819.9788818359,26.958625793457)},
		driveOut = {position = vector3(-82.01148223877,-1812.5144042969,26.812662124634), heading = 240.107},
		driveIn = {position = vector3(-72.518035888672,-1820.6060791016,26.941911697388), heading = 51.495},
		outside = {position = vector3(-72.518035888672,-1820.6060791016,26.941911697388)},
		inside = {position = vector3(-82.01148223877,-1812.5144042969,26.812662124634)}
	},
	{
        name = "Police Customs",
        type = "automobile",
		camera = {position = vector3(-1070.8831787109,-846.38702392578,4.8841347694397), heading = 63.092},
		driveOut = {position = vector3(-1075.5308837891,-847.00433349609,4.8841781616211), heading = 240.107},
		driveIn = {position = vector3(-1071.5559082031,-852.48406982422,4.8729567527771), heading = 42.495},
		outside = {position = vector3(-1071.5559082031,-852.48406982422,4.8729567527771), heading = 215.495},
		inside = {position = vector3(-1077.9399414063,-846.11657714844, 4.8841381072998), heading = 224.107}
	},
	{
        name = "AutoExotic Customs",
        type = "automobile",
		camera = {position = vector3(545.97668457031,-187.05009460449,55.878513336182), heading = 120.092},
		driveOut = {position = vector3(545.31378173828,-189.39358520508,54.493225097656), heading = 85.107},
		driveIn = {position = vector3(534.91668701172,-189.12139892578,53.944599151611), heading = 270.495},
		outside = {position = vector3(534.91668701172,-189.12139892578,53.944599151611), heading = 80.495},
		inside = {position = vector3(545.31378173828,-189.39358520508,54.493225097656), heading = 265.107}
	},
	{
        name = "Vinewood Customs",
        type = "automobile",
		camera = {position = vector3(135.45944213867,266.33685302734,112.62689971924)},
		driveOut = {position = vector3(129.97991943359,263.06198120117,109.86600494385), heading = 340.0},
		driveIn = {position = vector3(133.83386230469,273.98858642578,110.05864715576), heading = 160.0},
		outside = {position = vector3(133.83386230469,273.98858642578,110.05864715576)},
		inside = {position = vector3(129.97991943359,263.06198120117,109.86600494385)}
	},
	{
        name = "Airport Customs",
        type = "automobile",
		camera = {position = vector3(-1808.2432861328,-3130.1059570312,39.786182403564)},
		driveOut = {position = vector3(-1855.6387939453,-3144.4418945312,13.944370269775), heading = 240.0},
		driveIn = {position = vector3(-1855.6387939453,-3144.4418945312,13.944370269775), heading = 240.0},
		outside = {position = vector3(-1855.6387939453,-3144.4418945312,13.944370269775)},
		inside = {position = vector3(-1855.6387939453,-3144.4418945312,13.944370269775)}
	},
    {
        name = "Aircraft Customs",
        type = "plane",
        driveOut = {position = vector3(-1336.6478271484,-3044.0078125,13.944442749023), heading = 239.5},
        driveIn = {position = vector3(-1336.6478271484,-3044.0078125,13.944442749023), heading = 239.5},
        outside = {position = vector3(-1336.6478271484,-3044.0078125,13.944442749023), heading = 239.5},
		inside = {position = vector3(-1336.6478271484,-3044.0078125,13.944442749023), heading = 239.5}
    },
    {
        name = "Boat Customs",
        type = "boat",
        driveOut = {position = vector3(-1823.6389160156,-1855.7288818359,4.3902726173401), heading = 0.0},
        driveIn = {position = vector3(-1823.6389160156,-1855.7288818359,4.3902726173401), heading = 0.0},
        outside = {position = vector3(-1823.6389160156,-1855.7288818359,4.3902726173401), heading = 0.0},
        inside = {position = vector3(-1823.6389160156,-1855.7288818359,4.3902726173401), heading = 0.0},
    },
    {
        name = "Harrisons Hoopties",
        type = "automobile",
		camera = {position = vector3(72.75385, 6531.786, 33.45178)},
		driveOut = {position = vector3(79.38034, 6521.896, 31.25454), heading = 46.0},
		driveIn = {position = vector3(69.53005, 6523.229, 31.25474), heading = 226.0},
		outside = {position = vector3(69.53005, 6523.229, 31.25474)},
		inside = {position = vector3(79.38034, 6521.896, 31.25454)}
	},
}

local engineTunes = {
    {name = "Stock", index = -1, price = 0},
    {name = "EMS Upgrade, Level 2", index = 0, price = 100000},
    {name = "EMS Upgrade, Level 3", index = 1, price = 250000},
    {name = "EMS Upgrade, Level 4", index = 2, price = 500000}
}

local brakes = {
    {name = "Stock", index = -1, price = 0},
    {name = "Street Brakes", index = 0, price = 100000},
    {name = "Sport Brakes", index = 1, price = 250000},
    {name = "Race Brakes", index = 2, price = 500000}
}

local transmissions = {
    {name = "Stock", index = -1, price = 0},
    {name = "Street Transmission", index = 0, price = 100000},
    {name = "Sports Transmission", index = 1, price = 250000},
    {name = "Race Transmission", index = 2, price = 500000}
}

local horns = {
    {name = "Stock", index = -1, price = 0},
    {name = "Truck Horn", index = 0, price = 20000},
    {name = "Police Horn", index = 1, price = 20000},
    {name = "Clown Horn", index = 2, price = 20000},
    {name = "Musical Horn 1", index = 3, price = 20000},
    {name = "Musical Horn 2", index = 4, price = 20000},
    {name = "Musical Horn 3", index = 5, price = 20000},
    {name = "Musical Horn 4", index = 6, price = 20000},
    {name = "Musical Horn 5", index = 7, price = 20000},
    {name = "Sadtrombone Horn", index = 8, price = 20000},
    {name = "Classical Horn 1", index = 9, price = 20000},
    {name = "Classical Horn 2", index = 10, price = 20000},
    {name = "Classical Horn 3", index = 11, price = 20000},
    {name = "Classical Horn 4", index = 12, price = 20000},
    {name = "Classical Horn 5", index = 13, price = 20000},
    {name = "Classical Horn 6", index = 14, price = 20000},
    {name = "Classical Horn 7", index = 15, price = 20000},
    {name = "Scaledo Horn", index = 16, price = 20000},
    {name = "Scalere Horn", index = 17, price = 20000},
    {name = "Scalemi Horn", index = 18, price = 20000},
    {name = "Scalefa Horn", index = 19, price = 20000},
    {name = "Scalesol Horn", index = 20, price = 20000},
    {name = "Scalela Horn", index = 21, price = 20000},
    {name = "Scaleti Horn", index = 22, price = 20000},
    {name = "Scaledo Horn High", index = 23, price = 20000},
    {name = "Jazz Horn 1", index = 25, price = 20000},
    {name = "Jazz Horn 2", index = 26, price = 20000},
    {name = "Jazz Horn 3", index = 27, price = 20000},
    {name = "Jazzloop Horn", index = 28, price = 20000},
    {name = "Starspangban Horn 1", index = 29, price = 20000},
    {name = "Starspangban Horn 2", index = 30, price = 20000},
    {name = "Starspangban Horn 3", index = 31, price = 20000},
    {name = "Starspangban Horn 4", index = 32, price = 20000},
    {name = "Classicalloop Horn 1", index = 33, price = 20000},
    {name = "Classicalloop Horn 2", index = 34, price = 20000},
    {name = "Classicalloop Horn 3", index = 35, price = 20000}
}

local suspension = {
    {name = "Stock", index = -1, price = 0},
    {name = "Lowered Suspension", index = 0, price = 100000},
    {name = "Street Suspension", index = 1, price = 200000},
    {name = "Sport Suspension", index = 2, price = 350000},
    {name = "Competition Suspension", index = 3, price = 400000}
}

local armours = {
    {name = "Stock", index = -1, price = 0},
    {name = "Armor Upgrade 20%", index = 0, price = 100000},
    {name = "Armor Upgrade 40%", index = 1, price = 250000},
    {name = "Armor Upgrade 60%", index = 2, price = 500000},
    {name = "Armor Upgrade 80%", index = 3, price = 1000000},
    {name = "Armor Upgrade 100%", index = 4, price = 2000000}
}

local turbos = {
    {name = "None", index = 0, price = 0},
    {name = "Turbo Tuning", index = 1, price = 500000}
}

local headlights = {
    {name = "Stock Lights", index = 0, price = 0},
    {name = "Xenon Lights", index = 1, price = 100000}
}

local xenonColours = {
    {name = "None", index = -1, price = 0},
    {name = "White", index = 0, price = 10000},
    {name = "Blue", index = 1, price = 10000},
    {name = "Electric Blue", index = 2, price = 10000},
    {name = "Mint Green", index = 3, price = 10000},
    {name = "Lime Green", index = 4, price = 10000},
    {name = "Yellow", index = 5, price = 10000},
    {name = "Golden Shower", index = 6, price = 10000},
    {name = "Orange", index = 7, price = 10000},
    {name = "Red", index = 8, price = 10000},
    {name = "Pony Pink", index = 9, price = 10000},
    {name = "Hot Pink", index = 10, price = 10000},
    {name = "Purple", index = 11, price = 10000},
    {name = "Blacklight", index = 12, price = 10000},
}

local neonLayout = {
    {name = "None", mod = 0, price = 0},
    {name = "Front, Back and Sides", mod = 1, price = 150000},
    {name = "Front and Back", mod = 2, price = 150000},
    {name = "Front and Sides", mod = 3, price = 150000},
    {name = "Back and Sides", mod = 4, price = 150000},
}

local neonColours = {
    {name = "White", price = 15000},
    {name = "Blue", price = 15000},
    {name = "Electric Blue", price = 15000},
    {name = "Mint Green", price = 15000},
    {name = "Lime Green", price = 15000},
    {name = "Yellow", price = 15000},
    {name = "Golden Shower", price = 15000},
    {name = "Orange", price = 15000},
    {name = "Red", price = 15000},
    {name = "Pony Pink", price = 15000,},
    {name = "Hot Pink", price = 15000},
    {name = "Purple", price = 15000},
    {name = "Brown", price = 15000}
}

local remoteDashcams = {
    {name = "None", mod = 0, price = 0},
    {name = "Remote Dashcam", mod = 1, price = 2000000}
}

local remoteVehicleBlips = {
    {name = "None", mod = 10, price = 0},
    {name = "Remote Vehicle Blip", mod = 11, price = 5000000}
}

local biometricLocks = {
    {name = "None", mod = 20, price = 0},
    {name = "Biometric Lock", mod = 21, price = 10000000}
}

local chromeColours = {
    {name = "Chrome", index = 120}
}

local standardColours = {
    {name = "Black", index = 0},
    {name = "Carbon Black", index = 147},
    {name = "Graphite", index = 1},
    {name = "Anthracite Black", index = 11},
    {name = "Black Steel", index = 2},
    {name = "Dark Steel", index = 3},
    {name = "Silver", index = 4},
    {name = "Bluish Silver", index = 5},
    {name = "Rolled Steel", index = 6},
    {name = "Shadow Silver", index = 7},
    {name = "Stone Silver", index = 8},
    {name = "Midnight Silver", index = 9},
    {name = "Cast Iron Silver", index = 10},
    {name = "Red", index = 27},
    {name = "Torino Red", index = 28},
    {name = "Formula Red", index = 29},
    {name = "Lava Red", index = 150},
    {name = "Blaze Red", index = 30},
    {name = "Grace Red", index = 31},
    {name = "Garnet Red", index = 32},
    {name = "Sunset Red", index = 33},
    {name = "Cabernet Red", index = 34},
    {name = "Wine Red", index = 143},
    {name = "Candy Red", index = 35},
    {name = "Hot Pink", index = 135},
    {name = "Pfsiter Pink", index = 137},
    {name = "Salmon Pink", index = 136},
    {name = "Sunrise Orange", index = 36},
    {name = "Orange", index = 38},
    {name = "Bright Orange", index = 138},
    {name = "Gold", index = 99},
    {name = "Bronze", index = 90},
    {name = "Yellow", index = 88},
    {name = "Race Yellow", index = 89},
    {name = "Dew Yellow", index = 91},
    {name = "Dark Green", index = 49},
    {name = "Racing Green", index = 50},
    {name = "Sea Green", index = 51},
    {name = "Olive Green", index = 52},
    {name = "Bright Green", index = 53},
    {name = "Gasoline Green", index = 54},
    {name = "Lime Green", index = 92},
    {name = "Midnight Blue", index = 141},
    {name = "Galaxy Blue", index = 61},
    {name = "Dark Blue", index = 62},
    {name = "Saxon Blue", index = 63},
    {name = "Blue", index = 64},
    {name = "Mariner Blue", index = 65},
    {name = "Harbor Blue", index = 66},
    {name = "Diamond Blue", index = 67},
    {name = "Surf Blue", index = 68},
    {name = "Nautical Blue", index = 69},
    {name = "Racing Blue", index = 73},
    {name = "Ultra Blue", index = 70},
    {name = "Light Blue", index = 74},
    {name = "Chocolate Brown", index = 96},
    {name = "Bison Brown", index = 101},
    {name = "Creeen Brown", index = 95},
    {name = "Feltzer Brown", index = 94},
    {name = "Maple Brown", index = 97},
    {name = "Beechwood Brown", index = 103},
    {name = "Sienna Brown", index = 104},
    {name = "Saddle Brown", index = 98},
    {name = "Moss Brown", index = 100},
    {name = "Woodbeech Brown", index = 102},
    {name = "Straw Brown", index = 99},
    {name = "Sandy Brown", index = 105},
    {name = "Bleached Brown", index = 106},
    {name = "Schafter Purple", index = 71},
    {name = "Spinnaker Purple", index = 72},
    {name = "Midnight Purple", index = 142},
    {name = "Bright Purple", index = 145},
    {name = "Cream", index = 107},
    {name = "Ice White", index = 111},
    {name = "Frost White", index = 112}
}

local matteColours = {
    {name = "Black", index = 12},
    {name = "Gray", index = 13},
    {name = "Light Gray", index = 14},
    {name = "Ice White", index = 131},
    {name = "Blue", index = 83},
    {name = "Dark Blue", index = 82},
    {name = "Midnight Blue", index = 84},
    {name = "Midnight Purple", index = 149},
    {name = "Schafter Purple", index = 148},
    {name = "Red", index = 39},
    {name = "Dark Red", index = 40},
    {name = "Orange", index = 41},
    {name = "Yellow", index = 42},
    {name = "Lime Green", index = 55},
    {name = "Green", index = 128},
    {name = "Frost Green", index = 151},
    {name = "Foliage Green", index = 155},
    {name = "Olive Darb", index = 152},
    {name = "Dark Earth", index = 153},
    {name = "Desert Tan", index = 154}
}

local metalColours = {
    {name = "Black", index = 12},
    {name = "Gray", index = 13},
    {name = "Light Gray", index = 14},
    {name = "Ice White", index = 131},
    {name = "Blue", index = 83},
    {name = "Dark Blue", index = 82},
    {name = "Midnight Blue", index = 84},
    {name = "Midnight Purple", index = 149},
    {name = "Schafter Purple", index = 148},
    {name = "Red", index = 39},
    {name = "Dark Red", index = 40},
    {name = "Orange", index = 41},
    {name = "Yellow", index = 42},
    {name = "Lime Green", index = 55},
    {name = "Green", index = 128},
    {name = "Frost Green", index = 151},
    {name = "Foliage Green", index = 155},
    {name = "Olive Darb", index = 152},
    {name = "Dark Earth", index = 153},
    {name = "Desert Tan", index = 154}
}

local utilColours = {
    {name = "Black", index = 15},
    {name = "Black Poly", index = 16},
    {name = "Dark Steel", index = 17},
    {name = "Silver", index = 18},
    {name = "Black Steel", index = 19},
    {name = "Shadow Silver", index = 20},
    {name = "Dark Red", index = 43},
    {name = "Red", index = 44},
    {name = "Garnet Red", index = 45},
    {name = "Dark Green", index = 56},
    {name = "Green", index = 57},
    {name = "Dark Blue", index = 75},
    {name = "Midnight Blue", index = 76},
    {name = "Saxon Blue", index = 77},
    {name = "Nautical Blue", index = 78},
    {name = "Blue", index = 79},
    {name = "Blue Poly", index = 80},
    {name = "Bright Purple", index = 81},
    {name = "Straw Brown", index = 93},
    {name = "Feltzer Brown", index = 108},
    {name = "Moss Brown", index = 109},
    {name = "Sandy Brown", index = 110},
    {name = "Off White", index = 122},
    {name = "Bright Green", index = 125},
    {name = "Harbor Blue", index = 127},
    {name = "Frost White", index = 134},
    {name = "Lime Green", index = 139},
    {name = "Ultra Blue", index = 140},
    {name = "Gray", index = 144},
    {name = "Light Blue", index = 157},
    {name = "Yellow", index = 160},
}

local chameleonColours = {
    {name = "Monochrome", index = 161},
    {name = "Night & Day", index = 162},
    {name = "The Verlierer", index = 163},
    {name = "Sprunk Extreme", index = 164},
    {name = "Vice City", index = 165},
    {name = "Synthwave Nights", index = 166},
    {name = "Four Seasons", index = 167},
    {name = "Maisonette 9 Throwback", index = 168},
    {name = "Bubblegum", index = 169},
    {name = "Full Rainbow", index = 170},
    {name = "Sunset", index = 171},
    {name = "The Seven", index = 172},
    {name = "Kamen Rider", index = 173},
    {name = "Chromatic Aberration", index = 174},
    {name = "It's Christmas!", index = 175},
    {name = "Temperature", index = 176},
}

local frontWheels = {
    {name = "Stock", type = 6, index = -1, price = 0},
    {name = "Speedway", type = 6, index = 0, price = 10000},
    {name = "Streetspecial", type = 6, index = 1, price = 10000},
    {name = "Racer", type = 6, index = 2, price = 10000},
    {name = "Trackstar", type = 6, index = 3, price = 10000},
    {name = "Overlord", type = 6, index = 4, price = 10000},
    {name = "Trident", type = 6, index = 5, price = 10000},
    {name = "Triplethreat", type = 6, index = 6, price = 10000},
    {name = "Stilleto", type = 6, index = 7, price = 10000},
    {name = "Wires", type = 6, index = 8, price = 10000},
    {name = "Bobber", type = 6, index = 9, price = 10000},
    {name = "Solidus", type = 6, index = 10, price = 10000},
    {name = "Iceshield", type = 6, index = 11, price = 10000},
    {name = "Loops", type = 6, index = 12, price = 10000}
}

local backWheels = {
    {name = "Stock", type = 6, index = -1, price = 0},
    {name = "Speedway", type = 6, index = 0, price = 10000},
    {name = "Streetspecial", type = 6, index = 1, price = 10000},
    {name = "Racer", type = 6, index = 2, price = 10000},
    {name = "Trackstar", type = 6, index = 3, price = 10000},
    {name = "Overlord", type = 6, index = 4, price = 10000},
    {name = "Trident", type = 6, index = 5, price = 10000},
    {name = "Triplethreat", type = 6, index = 6, price = 10000},
    {name = "Stilleto", type = 6, index = 7, price = 10000},
    {name = "Wires", type = 6, index = 8, price = 10000},
    {name = "Bobber", type = 6, index = 9, price = 10000},
    {name = "Solidus", type = 6, index = 10, price = 10000},
    {name = "Iceshield", type = 6, index = 11, price = 10000},
    {name = "Loops", type = 6, index = 12, price = 10000}
}

local sportsWheels = {
    {name = "Stock", type = 0, index = -1, price = 0},
    {name = "Inferno", type = 0, index = 0, price = 10000},
    {name = "Deepfive", type = 0, index = 1, price = 10000},
    {name = "Lozspeed", type = 0, index = 2, price = 10000},
    {name = "Diamondcut", type = 0, index = 3, price = 10000},
    {name = "Chrono", type = 0, index = 4, price = 10000},
    {name = "Feroccirr", type = 0, index = 5, price = 10000},
    {name = "Fiftynine", type = 0, index = 6, price = 10000},
    {name = "Mercie", type = 0, index = 7, price = 10000},
    {name = "Syntheticz", type = 0, index = 8, price = 10000},
    {name = "Organictyped", type = 0, index = 9, price = 10000},
    {name = "Endov1", type = 0, index = 10, price = 10000},
    {name = "Duper7", type = 0, index = 11, price = 10000},
    {name = "Uzer", type = 0, index = 12, price = 10000},
    {name = "Groundride", type = 0, index = 13, price = 10000},
    {name = "Spacer", type = 0, index = 14, price = 10000},
    {name = "Venum", type = 0, index = 15, price = 10000},
    {name = "Cosmo", type = 0, index = 16, price = 10000},
    {name = "Dashvip", type = 0, index = 17, price = 10000},
    {name = "Icekid", type = 0, index = 18, price = 10000},
    {name = "Ruffeld", type = 0, index = 19, price = 10000},
    {name = "Wangenmaster", type = 0, index = 20, price = 10000},
    {name = "Superfive", type = 0, index = 21, price = 10000},
    {name = "Endov2", type = 0, index = 22, price = 10000},
    {name = "Slitsix", type = 0, index = 23, price = 10000},
    {name = "Wheel 24", type = 0, index = 24, price = 50000},
    {name = "Wheel 25", type = 0, index = 25, price = 50000},
    {name = "Wheel 26", type = 0, index = 26, price = 50000},
    {name = "Wheel 27", type = 0, index = 27, price = 50000},
    {name = "Wheel 28", type = 0, index = 28, price = 50000},
    {name = "Wheel 29", type = 0, index = 29, price = 50000},
    {name = "Wheel 30", type = 0, index = 30, price = 50000},
    {name = "Wheel 31", type = 0, index = 31, price = 50000},
    {name = "Wheel 32", type = 0, index = 32, price = 50000},
    {name = "Wheel 33", type = 0, index = 33, price = 50000},
    {name = "Wheel 34", type = 0, index = 34, price = 50000},
    {name = "Wheel 35", type = 0, index = 35, price = 50000},
    {name = "Wheel 36", type = 0, index = 36, price = 50000},
    {name = "Wheel 37", type = 0, index = 37, price = 50000},
    {name = "Wheel 38", type = 0, index = 38, price = 50000},
    {name = "Wheel 39", type = 0, index = 39, price = 50000},
    {name = "Wheel 40", type = 0, index = 40, price = 50000},
    {name = "Wheel 41", type = 0, index = 41, price = 50000},
    {name = "Wheel 42", type = 0, index = 42, price = 50000},
    {name = "Wheel 43", type = 0, index = 43, price = 50000},
    {name = "Wheel 44", type = 0, index = 44, price = 50000},
    {name = "Wheel 45", type = 0, index = 45, price = 50000},
    {name = "Wheel 46", type = 0, index = 46, price = 50000},
    {name = "Wheel 47", type = 0, index = 47, price = 50000},
    {name = "Wheel 48", type = 0, index = 48, price = 50000},
    {name = "Wheel 49", type = 0, index = 49, price = 50000},
    {name = "Wheel 50", type = 0, index = 50, price = 50000},
    {name = "Wheel 51", type = 0, index = 51, price = 50000},
    {name = "Wheel 52", type = 0, index = 52, price = 50000},
    {name = "Wheel 53", type = 0, index = 53, price = 50000},
    {name = "Wheel 54", type = 0, index = 54, price = 50000},
    {name = "Wheel 55", type = 0, index = 55, price = 50000},
    {name = "Wheel 56", type = 0, index = 56, price = 50000},
    {name = "Wheel 57", type = 0, index = 57, price = 50000},
    {name = "Wheel 58", type = 0, index = 58, price = 50000},
    {name = "Wheel 59", type = 0, index = 59, price = 50000},
    {name = "Wheel 60", type = 0, index = 60, price = 50000},
    {name = "Wheel 61", type = 0, index = 61, price = 50000},
    {name = "Wheel 62", type = 0, index = 62, price = 50000},
    {name = "Wheel 63", type = 0, index = 63, price = 50000},
    {name = "Wheel 64", type = 0, index = 64, price = 50000},
    {name = "Wheel 65", type = 0, index = 65, price = 50000},
    {name = "Wheel 66", type = 0, index = 66, price = 50000},
    {name = "Wheel 67", type = 0, index = 67, price = 50000},
    {name = "Wheel 68", type = 0, index = 68, price = 50000},
    {name = "Wheel 69", type = 0, index = 69, price = 50000},
    {name = "Wheel 70", type = 0, index = 70, price = 50000},
    {name = "Wheel 71", type = 0, index = 71, price = 50000},
    {name = "Wheel 72", type = 0, index = 72, price = 50000},
    {name = "Wheel 73", type = 0, index = 73, price = 50000},
    {name = "Wheel 74", type = 0, index = 74, price = 50000},
    {name = "Wheel 75", type = 0, index = 75, price = 50000},
    {name = "Wheel 76", type = 0, index = 76, price = 50000},
    {name = "Wheel 77", type = 0, index = 77, price = 50000},
    {name = "Wheel 78", type = 0, index = 78, price = 50000},
    {name = "Wheel 79", type = 0, index = 79, price = 50000},
    {name = "Wheel 80", type = 0, index = 80, price = 50000},
    {name = "Wheel 81", type = 0, index = 81, price = 50000},
    {name = "Wheel 82", type = 0, index = 82, price = 50000},
    {name = "Wheel 83", type = 0, index = 83, price = 50000},
    {name = "Wheel 84", type = 0, index = 84, price = 50000},
    {name = "Wheel 85", type = 0, index = 85, price = 50000},
    {name = "Wheel 86", type = 0, index = 86, price = 50000},
    {name = "Wheel 87", type = 0, index = 87, price = 50000},
    {name = "Wheel 88", type = 0, index = 88, price = 50000},
    {name = "Wheel 89", type = 0, index = 89, price = 50000},
    {name = "Wheel 90", type = 0, index = 90, price = 50000},
    {name = "Wheel 91", type = 0, index = 91, price = 50000},
    {name = "Wheel 92", type = 0, index = 92, price = 50000},
    {name = "Wheel 93", type = 0, index = 93, price = 50000},
    {name = "Wheel 94", type = 0, index = 94, price = 50000},
    {name = "Wheel 95", type = 0, index = 95, price = 50000},
    {name = "Wheel 96", type = 0, index = 96, price = 50000},
    {name = "Wheel 97", type = 0, index = 97, price = 50000},
    {name = "Wheel 98", type = 0, index = 98, price = 50000},
    {name = "Wheel 99", type = 0, index = 99, price = 50000},
    {name = "Wheel 100", type = 0, index = 100, price = 50000},
    {name = "Wheel 101", type = 0, index = 101, price = 50000},
    {name = "Wheel 102", type = 0, index = 102, price = 50000},
    {name = "Wheel 103", type = 0, index = 103, price = 50000},
    {name = "Wheel 104", type = 0, index = 104, price = 50000},
    {name = "Wheel 105", type = 0, index = 105, price = 50000},
    {name = "Wheel 106", type = 0, index = 106, price = 50000},
    {name = "Wheel 107", type = 0, index = 107, price = 50000},
    {name = "Wheel 108", type = 0, index = 108, price = 50000},
    {name = "Wheel 109", type = 0, index = 109, price = 50000},
    {name = "Wheel 110", type = 0, index = 110, price = 50000},
    {name = "Wheel 111", type = 0, index = 111, price = 50000},
    {name = "Wheel 112", type = 0, index = 112, price = 50000},
    {name = "Wheel 113", type = 0, index = 113, price = 50000},
    {name = "Wheel 114", type = 0, index = 114, price = 50000},
    {name = "Wheel 115", type = 0, index = 115, price = 50000},
    {name = "Wheel 116", type = 0, index = 116, price = 50000},
    {name = "Wheel 117", type = 0, index = 117, price = 50000},
    {name = "Wheel 118", type = 0, index = 118, price = 50000},
    {name = "Wheel 119", type = 0, index = 119, price = 50000},
    {name = "Wheel 120", type = 0, index = 120, price = 50000},
    {name = "Wheel 121", type = 0, index = 121, price = 50000},
    {name = "Wheel 122", type = 0, index = 122, price = 50000},
    {name = "Wheel 123", type = 0, index = 123, price = 50000},
    {name = "Wheel 124", type = 0, index = 124, price = 50000},
    {name = "Wheel 125", type = 0, index = 125, price = 50000},
    {name = "Wheel 126", type = 0, index = 126, price = 50000},
    {name = "Wheel 127", type = 0, index = 127, price = 50000},
    {name = "Wheel 128", type = 0, index = 128, price = 50000},
    {name = "Wheel 129", type = 0, index = 129, price = 50000},
    {name = "Wheel 130", type = 0, index = 130, price = 50000},
    {name = "Wheel 131", type = 0, index = 131, price = 50000},
    {name = "Wheel 132", type = 0, index = 132, price = 50000},
    {name = "Wheel 133", type = 0, index = 133, price = 50000},
    {name = "Wheel 134", type = 0, index = 134, price = 50000},
    {name = "Wheel 135", type = 0, index = 135, price = 50000},
    {name = "Wheel 136", type = 0, index = 136, price = 50000},
    {name = "Wheel 137", type = 0, index = 137, price = 50000},
    {name = "Wheel 138", type = 0, index = 138, price = 50000},
    {name = "Wheel 139", type = 0, index = 139, price = 50000},
    {name = "Wheel 140", type = 0, index = 140, price = 50000},
    {name = "Wheel 141", type = 0, index = 141, price = 50000},
    {name = "Wheel 142", type = 0, index = 142, price = 50000},
    {name = "Wheel 143", type = 0, index = 143, price = 50000},
    {name = "Wheel 144", type = 0, index = 144, price = 50000},
    {name = "Wheel 145", type = 0, index = 145, price = 50000},
    {name = "Wheel 146", type = 0, index = 146, price = 50000},
    {name = "Wheel 147", type = 0, index = 147, price = 50000},
    {name = "Wheel 148", type = 0, index = 148, price = 50000},
    {name = "Wheel 149", type = 0, index = 149, price = 50000},
    {name = "Wheel 150", type = 0, index = 150, price = 50000},
    {name = "Wheel 151", type = 0, index = 151, price = 50000},
    {name = "Wheel 152", type = 0, index = 152, price = 50000},
    {name = "Wheel 153", type = 0, index = 153, price = 50000},
    {name = "Wheel 154", type = 0, index = 154, price = 50000},
    {name = "Wheel 155", type = 0, index = 155, price = 50000},
    {name = "Wheel 156", type = 0, index = 156, price = 50000},
    {name = "Wheel 157", type = 0, index = 157, price = 50000},
    {name = "Wheel 158", type = 0, index = 158, price = 50000},
    {name = "Wheel 159", type = 0, index = 159, price = 50000},
    {name = "Wheel 160", type = 0, index = 160, price = 50000},
    {name = "Wheel 161", type = 0, index = 161, price = 50000},
    {name = "Wheel 162", type = 0, index = 162, price = 50000},
    {name = "Wheel 163", type = 0, index = 163, price = 50000},
    {name = "Wheel 164", type = 0, index = 164, price = 50000},
    {name = "Wheel 165", type = 0, index = 165, price = 50000},
    {name = "Wheel 166", type = 0, index = 166, price = 50000},
    {name = "Wheel 167", type = 0, index = 167, price = 50000},
    {name = "Wheel 168", type = 0, index = 168, price = 50000},
    {name = "Wheel 169", type = 0, index = 169, price = 50000},
    {name = "Wheel 170", type = 0, index = 170, price = 50000},
    {name = "Wheel 171", type = 0, index = 171, price = 50000},
    {name = "Wheel 172", type = 0, index = 172, price = 50000},
    {name = "Wheel 173", type = 0, index = 173, price = 50000},
    {name = "Wheel 174", type = 0, index = 174, price = 50000},
    {name = "Wheel 175", type = 0, index = 175, price = 50000},
    {name = "Wheel 176", type = 0, index = 176, price = 50000},
    {name = "Wheel 177", type = 0, index = 177, price = 50000},
    {name = "Wheel 178", type = 0, index = 178, price = 50000},
    {name = "Wheel 179", type = 0, index = 179, price = 50000},
    {name = "Wheel 180", type = 0, index = 180, price = 50000},
    {name = "Wheel 181", type = 0, index = 181, price = 50000},
    {name = "Wheel 182", type = 0, index = 182, price = 50000},
    {name = "Wheel 183", type = 0, index = 183, price = 50000},
    {name = "Wheel 184", type = 0, index = 184, price = 50000},
    {name = "Wheel 185", type = 0, index = 185, price = 50000},
    {name = "Wheel 186", type = 0, index = 186, price = 50000},
    {name = "Wheel 187", type = 0, index = 187, price = 50000},
    {name = "Wheel 188", type = 0, index = 188, price = 50000},
    {name = "Wheel 189", type = 0, index = 189, price = 50000},
    {name = "Wheel 190", type = 0, index = 190, price = 50000},
    {name = "Wheel 191", type = 0, index = 191, price = 50000},
    {name = "Wheel 192", type = 0, index = 192, price = 50000},
    {name = "Wheel 193", type = 0, index = 193, price = 50000},
    {name = "Wheel 194", type = 0, index = 194, price = 50000},
    {name = "Wheel 195", type = 0, index = 195, price = 50000},
    {name = "Wheel 196", type = 0, index = 196, price = 50000},
    {name = "Wheel 197", type = 0, index = 197, price = 50000},
    {name = "Wheel 198", type = 0, index = 198, price = 50000},
    {name = "Wheel 199", type = 0, index = 199, price = 50000},
    {name = "Wheel 200", type = 0, index = 200, price = 50000},
    {name = "Wheel 201", type = 0, index = 201, price = 50000},
    {name = "Wheel 202", type = 0, index = 202, price = 50000},
    {name = "Wheel 203", type = 0, index = 203, price = 50000},
    {name = "Wheel 204", type = 0, index = 204, price = 50000},
    {name = "Wheel 205", type = 0, index = 205, price = 50000},
    {name = "Wheel 206", type = 0, index = 206, price = 50000},
    {name = "Wheel 207", type = 0, index = 207, price = 50000},
    {name = "Wheel 208", type = 0, index = 208, price = 50000},
    {name = "Wheel 209", type = 0, index = 209, price = 50000},
    {name = "Wheel 210", type = 0, index = 210, price = 50000},
    {name = "Wheel 211", type = 0, index = 211, price = 50000},
    {name = "Wheel 212", type = 0, index = 212, price = 50000},
    {name = "Wheel 213", type = 0, index = 213, price = 50000},
    {name = "Wheel 214", type = 0, index = 214, price = 50000},
    {name = "Wheel 215", type = 0, index = 215, price = 50000},
    {name = "Wheel 216", type = 0, index = 216, price = 50000},
    {name = "Wheel 217", type = 0, index = 217, price = 50000},
    {name = "Wheel 218", type = 0, index = 218, price = 50000},
    {name = "Wheel 219", type = 0, index = 219, price = 50000},
    {name = "Wheel 220", type = 0, index = 220, price = 50000},
    {name = "Wheel 221", type = 0, index = 221, price = 50000},
    {name = "Wheel 222", type = 0, index = 222, price = 50000},
    {name = "Wheel 223", type = 0, index = 223, price = 50000},
    {name = "Wheel 224", type = 0, index = 224, price = 50000},
    {name = "Wheel 225", type = 0, index = 225, price = 50000},
    {name = "Wheel 226", type = 0, index = 226, price = 50000},
    {name = "Wheel 227", type = 0, index = 227, price = 50000},
    {name = "Wheel 228", type = 0, index = 228, price = 50000},
    {name = "Wheel 229", type = 0, index = 229, price = 50000},
    {name = "Wheel 230", type = 0, index = 230, price = 50000},
    {name = "Wheel 231", type = 0, index = 231, price = 50000},
    {name = "Wheel 232", type = 0, index = 232, price = 50000},
    {name = "Wheel 233", type = 0, index = 233, price = 50000},
    {name = "Wheel 234", type = 0, index = 234, price = 50000},
    {name = "Wheel 235", type = 0, index = 235, price = 50000},
    {name = "Wheel 236", type = 0, index = 236, price = 50000},
    {name = "Wheel 237", type = 0, index = 237, price = 50000},
    {name = "Wheel 238", type = 0, index = 238, price = 50000},
    {name = "Wheel 239", type = 0, index = 239, price = 50000},
    {name = "Wheel 240", type = 0, index = 240, price = 50000},
    {name = "Wheel 241", type = 0, index = 241, price = 50000},
    {name = "Wheel 242", type = 0, index = 242, price = 50000},
    {name = "Wheel 243", type = 0, index = 243, price = 50000},
    {name = "Wheel 244", type = 0, index = 244, price = 50000},
    {name = "Wheel 245", type = 0, index = 245, price = 50000},
    {name = "Wheel 246", type = 0, index = 246, price = 50000},
    {name = "Wheel 247", type = 0, index = 247, price = 50000},
    {name = "Wheel 248", type = 0, index = 248, price = 50000},
}

local muscleWheels = {
    {name = "Stock", type = 1, index = -1, price = 0},
    {name = "Classicfive", type = 1, index = 0, price = 10000},
    {name = "Dukes", type = 1, index = 1, price = 10000},
    {name = "Musclefreak", type = 1, index = 2, price = 10000},
    {name = "Kracka", type = 1, index = 3, price = 10000},
    {name = "Azrea", type = 1, index = 4, price = 10000},
    {name = "Mecha", type = 1, index = 5, price = 10000},
    {name = "Blacktop", type = 1, index = 6, price = 10000},
    {name = "Dragspl", type = 1, index = 7, price = 10000},
    {name = "Revolver", type = 1, index = 8, price = 10000},
    {name = "Classicrod", type = 1, index = 9, price = 10000},
    {name = "Spooner", type = 1, index = 10, price = 10000},
    {name = "Fivestar", type = 1, index = 11, price = 10000},
    {name = "Oldschool", type = 1, index = 12, price = 10000},
    {name = "Eljefe", type = 1, index = 13, price = 10000},
    {name = "Dodman", type = 1, index = 14, price = 10000},
    {name = "Sixgun", type = 1, index = 15, price = 10000},
    {name = "Mercenary", type = 1, index = 16, price = 10000},
    {name = "Wheel 17", type = 1, index = 17, price = 50000},
    {name = "Wheel 18", type = 1, index = 18, price = 50000},
    {name = "Wheel 19", type = 1, index = 19, price = 50000},
    {name = "Wheel 20", type = 1, index = 20, price = 50000},
    {name = "Wheel 21", type = 1, index = 21, price = 50000},
    {name = "Wheel 22", type = 1, index = 22, price = 50000},
    {name = "Wheel 23", type = 1, index = 23, price = 50000},
    {name = "Wheel 24", type = 1, index = 24, price = 50000},
    {name = "Wheel 25", type = 1, index = 25, price = 50000},
    {name = "Wheel 26", type = 1, index = 26, price = 50000},
    {name = "Wheel 27", type = 1, index = 27, price = 50000},
    {name = "Wheel 28", type = 1, index = 28, price = 50000},
    {name = "Wheel 29", type = 1, index = 29, price = 50000},
    {name = "Wheel 30", type = 1, index = 30, price = 50000},
    {name = "Wheel 31", type = 1, index = 31, price = 50000},
    {name = "Wheel 32", type = 1, index = 32, price = 50000},
    {name = "Wheel 33", type = 1, index = 33, price = 50000},
    {name = "Wheel 34", type = 1, index = 34, price = 50000},
    {name = "Wheel 35", type = 1, index = 35, price = 50000},
    {name = "Wheel 36", type = 1, index = 36, price = 50000},
    {name = "Wheel 37", type = 1, index = 37, price = 50000},
    {name = "Wheel 38", type = 1, index = 38, price = 50000},
    {name = "Wheel 39", type = 1, index = 39, price = 50000},
    {name = "Wheel 40", type = 1, index = 40, price = 50000},
    {name = "Wheel 41", type = 1, index = 41, price = 50000},
    {name = "Wheel 42", type = 1, index = 42, price = 50000},
    {name = "Wheel 43", type = 1, index = 43, price = 50000},
    {name = "Wheel 44", type = 1, index = 44, price = 50000},
    {name = "Wheel 45", type = 1, index = 45, price = 50000},
    {name = "Wheel 46", type = 1, index = 46, price = 50000},
    {name = "Wheel 47", type = 1, index = 47, price = 50000},
    {name = "Wheel 48", type = 1, index = 48, price = 50000},
    {name = "Wheel 49", type = 1, index = 49, price = 50000},
    {name = "Wheel 50", type = 1, index = 50, price = 50000},
    {name = "Wheel 51", type = 1, index = 51, price = 50000},
    {name = "Wheel 52", type = 1, index = 52, price = 50000},
    {name = "Wheel 53", type = 1, index = 53, price = 50000},
    {name = "Wheel 54", type = 1, index = 54, price = 50000},
    {name = "Wheel 55", type = 1, index = 55, price = 50000},
    {name = "Wheel 56", type = 1, index = 56, price = 50000},
    {name = "Wheel 57", type = 1, index = 57, price = 50000},
    {name = "Wheel 58", type = 1, index = 58, price = 50000},
    {name = "Wheel 59", type = 1, index = 59, price = 50000},
    {name = "Wheel 60", type = 1, index = 60, price = 50000},
    {name = "Wheel 61", type = 1, index = 61, price = 50000},
    {name = "Wheel 62", type = 1, index = 62, price = 50000},
    {name = "Wheel 63", type = 1, index = 63, price = 50000},
    {name = "Wheel 64", type = 1, index = 64, price = 50000},
    {name = "Wheel 65", type = 1, index = 65, price = 50000},
    {name = "Wheel 66", type = 1, index = 66, price = 50000},
    {name = "Wheel 67", type = 1, index = 67, price = 50000},
    {name = "Wheel 68", type = 1, index = 68, price = 50000},
    {name = "Wheel 69", type = 1, index = 69, price = 50000},
    {name = "Wheel 70", type = 1, index = 70, price = 50000},
    {name = "Wheel 71", type = 1, index = 71, price = 50000},
    {name = "Wheel 72", type = 1, index = 72, price = 50000},
    {name = "Wheel 73", type = 1, index = 73, price = 50000},
    {name = "Wheel 74", type = 1, index = 74, price = 50000},
    {name = "Wheel 75", type = 1, index = 75, price = 50000},
    {name = "Wheel 76", type = 1, index = 76, price = 50000},
    {name = "Wheel 77", type = 1, index = 77, price = 50000},
    {name = "Wheel 78", type = 1, index = 78, price = 50000},
    {name = "Wheel 79", type = 1, index = 79, price = 50000},
    {name = "Wheel 80", type = 1, index = 80, price = 50000},
    {name = "Wheel 81", type = 1, index = 81, price = 50000},
    {name = "Wheel 82", type = 1, index = 82, price = 50000},
    {name = "Wheel 83", type = 1, index = 83, price = 50000},
    {name = "Wheel 84", type = 1, index = 84, price = 50000},
    {name = "Wheel 85", type = 1, index = 85, price = 50000},
    {name = "Wheel 86", type = 1, index = 86, price = 50000},
    {name = "Wheel 87", type = 1, index = 87, price = 50000},
    {name = "Wheel 88", type = 1, index = 88, price = 50000},
    {name = "Wheel 89", type = 1, index = 89, price = 50000},
    {name = "Wheel 90", type = 1, index = 90, price = 50000},
    {name = "Wheel 91", type = 1, index = 91, price = 50000},
    {name = "Wheel 92", type = 1, index = 92, price = 50000},
    {name = "Wheel 93", type = 1, index = 93, price = 50000},
    {name = "Wheel 94", type = 1, index = 94, price = 50000},
    {name = "Wheel 95", type = 1, index = 95, price = 50000},
    {name = "Wheel 96", type = 1, index = 96, price = 50000},
    {name = "Wheel 97", type = 1, index = 97, price = 50000},
    {name = "Wheel 98", type = 1, index = 98, price = 50000},
    {name = "Wheel 99", type = 1, index = 99, price = 50000},
    {name = "Wheel 100", type = 1, index = 100, price = 50000}
}

local lowriderWheels = {
    {name = "Stock", type = 2, index = -1, price = 0},
    {name = "Flare", type = 2, index = 0, price = 10000},
    {name = "Wired", type = 2, index = 1, price = 10000},
    {name = "Triplegolds", type = 2, index = 2, price = 10000},
    {name = "Bigworm", type = 2, index = 3, price = 10000},
    {name = "Sevenfives", type = 2, index = 4, price = 10000},
    {name = "Splitsix", type = 2, index = 5, price = 10000},
    {name = "Freshmesh", type = 2, index = 6, price = 10000},
    {name = "Leadsled", type = 2, index = 7, price = 10000},
    {name = "Turbine", type = 2, index = 8, price = 10000},
    {name = "Superfin", type = 2, index = 9, price = 10000},
    {name = "Classicrod", type = 2, index = 10, price = 10000},
    {name = "Dollar", type = 2, index = 11, price = 10000},
    {name = "Dukes", type = 2, index = 12, price = 10000},
    {name = "Lowfive", type = 2, index = 13, price = 10000},
    {name = "Gooch", type = 2, index = 14, price = 10000},
    {name = "Gooch", type = 2, index = 15, price = 10000},
    {name = "Gooch", type = 2, index = 16, price = 10000},
    {name = "Wheel 17", type = 2, index = 17, price = 50000},
    {name = "Wheel 18", type = 2, index = 18, price = 50000},
    {name = "Wheel 19", type = 2, index = 19, price = 50000},
    {name = "Wheel 20", type = 2, index = 20, price = 50000},
    {name = "Wheel 21", type = 2, index = 21, price = 50000},
    {name = "Wheel 22", type = 2, index = 22, price = 50000},
    {name = "Wheel 23", type = 2, index = 23, price = 50000},
    {name = "Wheel 24", type = 2, index = 24, price = 50000},
    {name = "Wheel 25", type = 2, index = 25, price = 50000},
    {name = "Wheel 26", type = 2, index = 26, price = 50000},
    {name = "Wheel 27", type = 2, index = 27, price = 50000},
    {name = "Wheel 28", type = 2, index = 28, price = 50000},
    {name = "Wheel 29", type = 2, index = 29, price = 50000},
    {name = "Wheel 30", type = 2, index = 30, price = 50000},
    {name = "Wheel 31", type = 2, index = 31, price = 50000},
    {name = "Wheel 32", type = 2, index = 32, price = 50000},
    {name = "Wheel 33", type = 2, index = 33, price = 50000},
    {name = "Wheel 34", type = 2, index = 34, price = 50000},
    {name = "Wheel 35", type = 2, index = 35, price = 50000},
    {name = "Wheel 36", type = 2, index = 36, price = 50000},
    {name = "Wheel 37", type = 2, index = 37, price = 50000},
    {name = "Wheel 38", type = 2, index = 38, price = 50000},
    {name = "Wheel 39", type = 2, index = 39, price = 50000},
    {name = "Wheel 40", type = 2, index = 40, price = 50000},
    {name = "Wheel 41", type = 2, index = 41, price = 50000},
    {name = "Wheel 42", type = 2, index = 42, price = 50000},
    {name = "Wheel 43", type = 2, index = 43, price = 50000},
    {name = "Wheel 44", type = 2, index = 44, price = 50000},
    {name = "Wheel 45", type = 2, index = 45, price = 50000},
    {name = "Wheel 46", type = 2, index = 46, price = 50000},
    {name = "Wheel 47", type = 2, index = 47, price = 50000},
}

local suvWheels = {
    {name = "Stock", type = 3, index = -1, price = 0},
    {name = "Vip", type = 3, index = 0, price = 10000},
    {name = "Benefactor", type = 3, index = 1, price = 10000},
    {name = "Cosmo", type = 3, index = 2, price = 10000},
    {name = "Bippu", type = 3, index = 3, price = 10000},
    {name = "Royalsix", type = 3, index = 4, price = 10000},
    {name = "Fagorme", type = 3, index = 5, price = 10000},
    {name = "Deluxe", type = 3, index = 6, price = 10000},
    {name = "Icedout", type = 3, index = 7, price = 10000},
    {name = "Cognscenti", type = 3, index = 8, price = 10000},
    {name = "Lozspeedten", type = 3, index = 9, price = 10000},
    {name = "Supernova", type = 3, index = 10, price = 10000},
    {name = "Obeyrs", type = 3, index = 11, price = 10000},
    {name = "Lozspeedballer", type = 3, index = 12, price = 10000},
    {name = "Extra vaganzo", type = 3, index = 13, price = 10000},
    {name = "Splitsix", type = 3, index = 14, price = 10000},
    {name = "Empowered", type = 3, index = 15, price = 10000},
    {name = "Sunrise", type = 3, index = 16, price = 10000},
    {name = "Dashvip", type = 3, index = 17, price = 10000},
    {name = "Cutter", type = 3, index = 18, price = 10000},
    {name = "Wheel 19", type = 3, index = 19, price = 50000},
    {name = "Wheel 20", type = 3, index = 20, price = 50000},
    {name = "Wheel 21", type = 3, index = 21, price = 50000},
    {name = "Wheel 22", type = 3, index = 22, price = 50000},
    {name = "Wheel 23", type = 3, index = 23, price = 50000},
    {name = "Wheel 24", type = 3, index = 24, price = 50000},
    {name = "Wheel 25", type = 3, index = 25, price = 50000},
    {name = "Wheel 26", type = 3, index = 26, price = 50000},
    {name = "Wheel 27", type = 3, index = 27, price = 50000},
    {name = "Wheel 28", type = 3, index = 28, price = 50000},
    {name = "Wheel 29", type = 3, index = 29, price = 50000},
    {name = "Wheel 30", type = 3, index = 30, price = 50000},
    {name = "Wheel 31", type = 3, index = 31, price = 50000},
    {name = "Wheel 32", type = 3, index = 32, price = 50000},
    {name = "Wheel 33", type = 3, index = 33, price = 50000},
    {name = "Wheel 34", type = 3, index = 34, price = 50000},
    {name = "Wheel 35", type = 3, index = 35, price = 50000},
    {name = "Wheel 36", type = 3, index = 36, price = 50000},
    {name = "Wheel 37", type = 3, index = 37, price = 50000},
    {name = "Wheel 38", type = 3, index = 38, price = 50000},
    {name = "Wheel 39", type = 3, index = 39, price = 50000},
    {name = "Wheel 40", type = 3, index = 40, price = 50000},
    {name = "Wheel 41", type = 3, index = 41, price = 50000},
    {name = "Wheel 42", type = 3, index = 42, price = 50000},
}

local offroadWheels = {
    {name = "Stock", type = 4, index = -1, price = 0},
    {name = "Raider", type = 4, index = 0, price = 10000},
    {name = "Mudslinger", type = 4, index = 1, price = 10000},
    {name = "Nevis", type = 4, index = 2, price = 10000},
    {name = "Cairngorm", type = 4, index = 3, price = 10000},
    {name = "Amazon", type = 4, index = 4, price = 10000},
    {name = "Challenger", type = 4, index = 5, price = 10000},
    {name = "Dunebasher", type = 4, index = 6, price = 10000},
    {name = "Fivestar", type = 4, index = 7, price = 10000},
    {name = "Rockcrawler", type = 4, index = 8, price = 10000},
    {name = "Milspecsteelie", type = 4, index = 9, price = 10000},
    {name = "Wheel 10", type = 4, index = 10, price = 50000},
    {name = "Wheel 11", type = 4, index = 11, price = 50000},
    {name = "Wheel 12", type = 4, index = 12, price = 50000},
    {name = "Wheel 13", type = 4, index = 13, price = 50000},
    {name = "Wheel 14", type = 4, index = 14, price = 50000},
    {name = "Wheel 15", type = 4, index = 15, price = 50000},
    {name = "Wheel 16", type = 4, index = 16, price = 50000},
    {name = "Wheel 17", type = 4, index = 17, price = 50000},
    {name = "Wheel 18", type = 4, index = 18, price = 50000},
    {name = "Wheel 19", type = 4, index = 19, price = 50000},
    {name = "Wheel 20", type = 4, index = 20, price = 50000},
    {name = "Wheel 21", type = 4, index = 21, price = 50000},
    {name = "Wheel 22", type = 4, index = 22, price = 50000},
    {name = "Wheel 23", type = 4, index = 23, price = 50000},
    {name = "Wheel 24", type = 4, index = 24, price = 50000},
    {name = "Wheel 25", type = 4, index = 25, price = 50000},
    {name = "Wheel 26", type = 4, index = 26, price = 50000},
    {name = "Wheel 27", type = 4, index = 27, price = 50000},
    {name = "Wheel 28", type = 4, index = 28, price = 50000},
    {name = "Wheel 29", type = 4, index = 29, price = 50000},
    {name = "Wheel 30", type = 4, index = 30, price = 50000},
    {name = "Wheel 31", type = 4, index = 31, price = 50000},
    {name = "Wheel 32", type = 4, index = 32, price = 50000},
    {name = "Wheel 33", type = 4, index = 33, price = 50000},
    {name = "Wheel 34", type = 4, index = 34, price = 50000},
    {name = "Wheel 35", type = 4, index = 35, price = 50000},
    {name = "Wheel 36", type = 4, index = 36, price = 50000},
    {name = "Wheel 37", type = 4, index = 37, price = 50000},
    {name = "Wheel 38", type = 4, index = 38, price = 50000},
    {name = "Wheel 39", type = 4, index = 39, price = 50000},
    {name = "Wheel 40", type = 4, index = 40, price = 50000},
    {name = "Wheel 41", type = 4, index = 41, price = 50000},
    {name = "Wheel 42", type = 4, index = 42, price = 50000},
    {name = "Wheel 43", type = 4, index = 43, price = 50000},
    {name = "Wheel 44", type = 4, index = 44, price = 50000},
    {name = "Wheel 45", type = 4, index = 45, price = 50000},
    {name = "Wheel 46", type = 4, index = 46, price = 50000},
    {name = "Wheel 47", type = 4, index = 47, price = 50000},
    {name = "Wheel 48", type = 4, index = 48, price = 50000},
    {name = "Wheel 49", type = 4, index = 49, price = 50000},
    {name = "Wheel 50", type = 4, index = 50, price = 50000},
    {name = "Wheel 51", type = 4, index = 51, price = 50000},
}

local tunerWheels = {
    {name = "Stock", type = 5, index = -1, price = 0},
    {name = "Cosmo", type = 5, index = 0, price = 10000},
    {name = "Supermesh", type = 5, index = 1, price = 10000},
    {name = "Outsider", type = 5, index = 2, price = 10000},
    {name = "Rollas", type = 5, index = 3, price = 10000},
    {name = "Driffmeister", type = 5, index = 4, price = 10000},
    {name = "Slicer", type = 5, index = 5, price = 10000},
    {name = "Elquatro", type = 5, index = 6, price = 10000},
    {name = "Dubbed", type = 5, index = 7, price = 10000},
    {name = "Fivestar", type = 5, index = 8, price = 10000},
    {name = "Slideways", type = 5, index = 9, price = 10000},
    {name = "Apex", type = 5, index = 10, price = 10000},
    {name = "Stancedeg", type = 5, index = 11, price = 10000},
    {name = "Countersteer", type = 5, index = 12, price = 10000},
    {name = "Endov1", type = 5, index = 13, price = 10000},
    {name = "Endov2dish", type = 5, index = 14, price = 10000},
    {name = "Guppez", type = 5, index = 15, price = 10000},
    {name = "Chokadori", type = 5, index = 16, price = 10000},
    {name = "Chicane", type = 5, index = 17, price = 10000},
    {name = "Saisoku", type = 5, index = 18, price = 10000},
    {name = "Dishedeight", type = 5, index = 19, price = 10000},
    {name = "Fujiwara", type = 5, index = 20, price = 10000},
    {name = "Zokusha", type = 5, index = 21, price = 10000},
    {name = "Battlevill", type = 5, index = 22, price = 10000},
    {name = "Rallymaster", type = 5, index = 23, price = 10000},
    {name = "Wheel 24", type = 5, index = 24, price = 50000},
    {name = "Wheel 25", type = 5, index = 25, price = 50000},
    {name = "Wheel 26", type = 5, index = 26, price = 50000},
    {name = "Wheel 27", type = 5, index = 27, price = 50000},
    {name = "Wheel 28", type = 5, index = 28, price = 50000},
    {name = "Wheel 29", type = 5, index = 29, price = 50000},
    {name = "Wheel 30", type = 5, index = 30, price = 50000},
    {name = "Wheel 31", type = 5, index = 31, price = 50000},
    {name = "Wheel 32", type = 5, index = 32, price = 50000},
    {name = "Wheel 33", type = 5, index = 33, price = 50000},
    {name = "Wheel 34", type = 5, index = 34, price = 50000},
    {name = "Wheel 35", type = 5, index = 35, price = 50000},
    {name = "Wheel 36", type = 5, index = 36, price = 50000},
    {name = "Wheel 37", type = 5, index = 37, price = 50000},
    {name = "Wheel 38", type = 5, index = 38, price = 50000},
    {name = "Wheel 39", type = 5, index = 39, price = 50000},
    {name = "Wheel 40", type = 5, index = 40, price = 50000},
    {name = "Wheel 41", type = 5, index = 41, price = 50000},
    {name = "Wheel 42", type = 5, index = 42, price = 50000},
    {name = "Wheel 43", type = 5, index = 43, price = 50000},
    {name = "Wheel 44", type = 5, index = 44, price = 50000},
    {name = "Wheel 45", type = 5, index = 45, price = 50000},
    {name = "Wheel 46", type = 5, index = 46, price = 50000},
    {name = "Wheel 47", type = 5, index = 47, price = 50000},
    {name = "Wheel 48", type = 5, index = 48, price = 50000},
    {name = "Wheel 49", type = 5, index = 49, price = 50000},
    {name = "Wheel 50", type = 5, index = 50, price = 50000},
    {name = "Wheel 51", type = 5, index = 51, price = 50000},
    {name = "Wheel 52", type = 5, index = 52, price = 50000},
    {name = "Wheel 53", type = 5, index = 53, price = 50000},
    {name = "Wheel 54", type = 5, index = 54, price = 50000},
    {name = "Wheel 55", type = 5, index = 55, price = 50000},
    {name = "Wheel 56", type = 5, index = 56, price = 50000},
    {name = "Wheel 57", type = 5, index = 57, price = 50000},
    {name = "Wheel 58", type = 5, index = 58, price = 50000},
    {name = "Wheel 59", type = 5, index = 59, price = 50000},
    {name = "Wheel 60", type = 5, index = 60, price = 50000},
    {name = "Wheel 61", type = 5, index = 61, price = 50000},
    {name = "Wheel 62", type = 5, index = 62, price = 50000},
    {name = "Wheel 63", type = 5, index = 63, price = 50000},
    {name = "Wheel 64", type = 5, index = 64, price = 50000},
    {name = "Wheel 65", type = 5, index = 65, price = 50000},
    {name = "Wheel 66", type = 5, index = 66, price = 50000},
    {name = "Wheel 67", type = 5, index = 67, price = 50000},
    {name = "Wheel 68", type = 5, index = 68, price = 50000},
    {name = "Wheel 69", type = 5, index = 69, price = 50000},
    {name = "Wheel 70", type = 5, index = 70, price = 50000},
    {name = "Wheel 71", type = 5, index = 71, price = 50000},
    {name = "Wheel 72", type = 5, index = 72, price = 50000},
}

local highendWheels = {
    {name = "Stock", type = 7, index = -1, price = 0},
    {name = "Shadow", type = 7, index = 0, price = 10000},
    {name = "Hyper", type = 7, index = 1, price = 10000},
    {name = "Blade", type = 7, index = 2, price = 10000},
    {name = "Diamond", type = 7, index = 3, price = 10000},
    {name = "Supagee", type = 7, index = 4, price = 10000},
    {name = "Chromaticz", type = 7, index = 5, price = 10000},
    {name = "Merciechlip", type = 7, index = 6, price = 10000},
    {name = "Obeyrs", type = 7, index = 7, price = 10000},
    {name = "Gtchrome", type = 7, index = 8, price = 10000},
    {name = "Cheetahr", type = 7, index = 9, price = 10000},
    {name = "Solar", type = 7, index = 10, price = 10000},
    {name = "Splitten", type = 7, index = 11, price = 10000},
    {name = "Dashvip", type = 7, index = 12, price = 10000},
    {name = "Lozspeedten", type = 7, index = 13, price = 10000},
    {name = "Carboninferno", type = 7, index = 14, price = 10000},
    {name = "Carbonshadow", type = 7, index = 15, price = 10000},
    {name = "Carbonz", type = 7, index = 16, price = 10000},
    {name = "Carbonsolar", type = 7, index = 17, price = 10000},
    {name = "Carboncheetahr", type = 7, index = 18, price = 10000},
    {name = "Carbonsracer", type = 7, index = 19, price = 10000},
    {name = "Wheel 20", type = 7, index = 20, price = 50000},
    {name = "Wheel 21", type = 7, index = 21, price = 50000},
    {name = "Wheel 22", type = 7, index = 22, price = 50000},
    {name = "Wheel 23", type = 7, index = 23, price = 50000},
    {name = "Wheel 24", type = 7, index = 24, price = 50000},
    {name = "Wheel 25", type = 7, index = 25, price = 50000},
    {name = "Wheel 26", type = 7, index = 26, price = 50000},
    {name = "Wheel 27", type = 7, index = 27, price = 50000},
    {name = "Wheel 28", type = 7, index = 28, price = 50000},
    {name = "Wheel 29", type = 7, index = 29, price = 50000},
    {name = "Wheel 30", type = 7, index = 30, price = 50000},
    {name = "Wheel 31", type = 7, index = 31, price = 50000},
    {name = "Wheel 32", type = 7, index = 32, price = 50000},
    {name = "Wheel 33", type = 7, index = 33, price = 50000},
    {name = "Wheel 34", type = 7, index = 34, price = 50000},
    {name = "Wheel 35", type = 7, index = 35, price = 50000},
    {name = "Wheel 36", type = 7, index = 36, price = 50000},
    {name = "Wheel 37", type = 7, index = 37, price = 50000},
    {name = "Wheel 38", type = 7, index = 38, price = 50000},
    {name = "Wheel 39", type = 7, index = 39, price = 50000},
    {name = "Wheel 40", type = 7, index = 40, price = 50000},
    {name = "Wheel 41", type = 7, index = 41, price = 50000},
    {name = "Wheel 42", type = 7, index = 42, price = 50000},
    {name = "Wheel 43", type = 7, index = 43, price = 50000},
    {name = "Wheel 44", type = 7, index = 44, price = 50000},
    {name = "Wheel 45", type = 7, index = 45, price = 50000},
    {name = "Wheel 46", type = 7, index = 46, price = 50000},
    {name = "Wheel 47", type = 7, index = 47, price = 50000},
    {name = "Wheel 48", type = 7, index = 48, price = 50000},
    {name = "Wheel 49", type = 7, index = 49, price = 50000},
    {name = "Wheel 50", type = 7, index = 50, price = 50000},
    {name = "Wheel 51", type = 7, index = 51, price = 50000},
    {name = "Wheel 52", type = 7, index = 52, price = 50000},
    {name = "Wheel 53", type = 7, index = 53, price = 50000},
    {name = "Wheel 54", type = 7, index = 54, price = 50000},
    {name = "Wheel 55", type = 7, index = 55, price = 50000},
    {name = "Wheel 56", type = 7, index = 56, price = 50000},
    {name = "Wheel 57", type = 7, index = 57, price = 50000},
    {name = "Wheel 58", type = 7, index = 58, price = 50000},
    {name = "Wheel 59", type = 7, index = 59, price = 50000},
    {name = "Wheel 60", type = 7, index = 60, price = 50000},
    {name = "Wheel 61", type = 7, index = 61, price = 50000},
    {name = "Wheel 62", type = 7, index = 62, price = 50000},
    {name = "Wheel 63", type = 7, index = 63, price = 50000},
    {name = "Wheel 64", type = 7, index = 64, price = 50000},
    {name = "Wheel 65", type = 7, index = 65, price = 50000},
    {name = "Wheel 66", type = 7, index = 66, price = 50000},
    {name = "Wheel 67", type = 7, index = 67, price = 50000},
    {name = "Wheel 68", type = 7, index = 68, price = 50000},
    {name = "Wheel 69", type = 7, index = 69, price = 50000},
    {name = "Wheel 70", type = 7, index = 70, price = 50000},
    {name = "Wheel 71", type = 7, index = 71, price = 50000},
    {name = "Wheel 72", type = 7, index = 72, price = 50000},
    {name = "Wheel 73", type = 7, index = 73, price = 50000},
    {name = "Wheel 74", type = 7, index = 74, price = 50000},
    {name = "Wheel 75", type = 7, index = 75, price = 50000},
}

local wheelSmokes = {
    {name = "White Tire Smoke", colour = {254,254,254}, price = 125000},
    {name = "Black Tire Smoke", colour = {1,1,1}, price = 125000},
    {name = "Blue Tire Smoke", colour = {0,150,255}, price = 125000},
    {name = "Yellow Tire Smoke", colour = {255,255,50}, price = 125000},
    {name = "Orange Tire Smoke", colour = {255,153,51}, price = 125000},
    {name = "Red Tire Smoke", colour = {255,10,10}, price = 125000},
    {name = "Green Tire Smoke", colour = {10,255,10}, price = 125000},
    {name = "Purple Tire Smoke", colour = {153,10,153}, price = 125000},
    {name = "Pink Tire Smoke", colour = {255,102,178}, price = 125000},
    {name = "Gray Tire Smoke", colour = {128,128,128}, price = 125000}
}

local driftSuspensions = {
    {name = "None", mod = 0, price = 0},
    {name = "Lowered Suspension", mod = 1, price = 750000}
}

local driftSmokes = {
    {name = "None", mod = 0, price = 0},
    {name = "Standard Smoke", mod = 1, price = 250000},
    {name = "Red Smoke", mod = 2, price = 250000},
    {name = "Orange Smoke", mod = 3, price = 250000},
    {name = "Yellow Smoke", mod = 4, price = 250000},
    {name = "Green Smoke", mod = 5, price = 250000},
    {name = "Blue Smoke", mod = 6, price = 250000},
    {name = "Purple Smoke", mod = 7, price = 250000},
    {name = "Pink Smoke", mod = 8, price = 250000}
}

local windows = {
    {name = "Pure Black", tint = 1},
    {name = "Darksmoke", tint = 2},
    {name = "Lightsmoke", tint = 3},
    {name = "Stock", tint = 4},
    {name = "Green", tint = 5},
}

local nitros = {
    {name = "+25% Nitro", mod = 25, price = 25000},
    {name = "+50% Nitro", mod = 50, price = 50000},
    {name = "+75% Nitro", mod = 75, price = 75000},
    {name = "+100% Nitro", mod = 100, price = 100000},
}

local antilag = {
    {name = "None", mod = 0, price = 0},
    {name = "Anti-lag", mod = 1, price = 500000}
}

local bulletproofTires = {
    {name = "None", mod = 0, price = 0},
    {name = "Bulletproof Tires", mod = 1, price = 2500000}
}

local customExhausts = {
    {name = "Default", soundId = "", mod = 0, price = 0},
    {name = "Nissan Skyline", soundId = "bnr34ffeng",  mod = 6, price = 250000},
    {name = "Dodge Viper V10", soundId = "ta028viper",  mod = 7, price = 250000},
    {name = "Mazda Rotary 13B", soundId = "rotary7",  mod = 8, price = 250000},
    {name = "Ferrari F40", soundId = "lgcy12ferf40",  mod = 9, price = 250000},
    {name = "Audi EA839", soundId = "v6audiea839",  mod = 10, price = 250000},
    {name = "BMW N55", soundId = "n55b30t0",  mod = 11, price = 250000},
    {name = "Ford Voodoo", soundId = "fordvoodoo",  mod = 12, price = 250000},
    {name = "Kawasaki Ninja H2R", soundId = "ta103ninjah2r",  mod = 13, price = 250000},
}

local plates = {
    {name = "Blue on White 1", index=0, mod = 0, price = 10000},
    {name = "Yellow on Black", index=1, mod = 1, price = 10000},
    {name = "Yellow on Blue", index=2, mod = 2, price = 10000},
    {name = "Blue On White 2", index=3, mod = 3, price = 10000},
    {name = "Blue On White 3", index=4, mod = 4, price = 10000},
}

local vehicleSubwoofer = {
    {name = "None", mod = 0, price = 0},
    {name = "Vehicle Subwoofer", mod = 1, price = 10000000}
}

local planeSmokes = {
    {name = "None", mod = 0, price = 0},
    {name = "Red", mod = 1, price = 250000},
    {name = "Orange", mod = 2, price = 250000},
    {name = "Yellow", mod = 3, price = 250000},
    {name = "Green", mod = 4, price = 250000},
    {name = "Blue", mod = 5, price = 250000},
    {name = "Purple", mod = 6, price = 250000},
    {name = "Pink", mod = 7, price = 250000},
    {name = "White", mod = 8, price = 250000}
}

---@class categoryBase
---@field type string The type of the category.
---@field name string The name of the category.
---@field description string|nil The description of the category.
---@field requirements string|nil The requirements for this category to be displayed. Split by a comma.

---@class categoryList : categoryBase
---@field categories categoryBase[] A table of sub categories.

---@class categoryImpl : categoryBase
---@field unapply string All categories to be unapplied when this category is bought or set. Split by a comma.
---@field cameraPreset string|nil

---@class modList : categoryImpl
---@field saveKey string The name of the database column.
---@field price number The price of all of the contained mods.
---@field modType number The mod type.

---@class indexModList : categoryImpl
---@field saveKey string The name of the database column.
---@field price number The price of each index.
---@field generatorName string The index generator function name.
---@field prefix string The prefix before each index button.

---@class staticList : categoryImpl
---@field saveKey string The name of the database column.
---@field saveValue string The variable inside of the item used as the key for saving.
---@field price number|nil The price of the mods which do not have a specific item price set.
---@field items table A table of all the items to be displayed.

cfg.category = {
    type = "categoryList",
    name = "Main Menu",
    categories = {
        {
            type = "modList",
            name = "Spoiler",
            description = "Increase downforce.",
            cameraPreset = "spoiler",
            saveKey = "mod_0",
            price = 100000,
            modType = 0
        },
        {
            type = "modList",
            name = "Skirts",
            description = "Enhance your vehicle's look with custom side skirts.",
            cameraPreset = "skirts",
            saveKey = "mod_3",
            price = 100000,
            modType = 3
        },
        {
            type = "modList",
            name = "Exhausts",
            description = "Customized sports exhausts.",
            saveKey = "mod_4",
            price = 100000,
            modType = 4
        },
        {
            type = "modList",
            name = "Grille",
            description = "Improved engine cooling.",
            saveKey = "mod_6",
            price = 100000,
            modType = 6
        },
        {
            type = "modList",
            name = "Hood",
            description = "Enhance car engine cooling.",
            cameraPreset = "hood",
            saveKey = "mod_7",
            price = 100000,
            modType = 7
        },
        {
            type = "modList",
            name = "Fenders",
            description = "Enhance body paneling with custom fenders.",
            cameraPreset = "fenders",
            saveKey = "mod_8",
            price = 100000,
            modType = 8
        },
        {
            type = "modList",
            name = "Roof",
            description = "Lower your center of gravity with lightweight roof panels.",
            saveKey = "mod_10",
            price = 100000,
            modType = 10
        },
        {
            type = "staticList",
            name = "Brakes",
            description = "Increase stopping power and eliminate brake fade.",
            saveKey = "mod_12",
            saveValue = "index",
            items = brakes
        },
        {
            type = "staticList",
            name = "Transmission",
            description = "Improved acceleration with close ratio transmission.",
            saveKey = "mod_13",
            saveValue = "index",
            items = transmissions
        },
        {
            type = "staticList",
            name = "Horn",
            description = "Custom air horns.",
            requirements = "isCar",
            saveKey = "mod_14",
            saveValue = "index",
            helpText = "Press ~INPUT_VEH_HORN~ to preview",
            items = horns
        },
        {
            type = "staticList",
            name = "Suspension",
            description = "Upgrade to a sports oriented suspension setup.",
            requirements = "isCar",
            saveKey = "mod_15",
            saveValue = "index",
            items = suspension
        },
        {
            type = "staticList",
            name = "Armour",
            description = "Protect your car's occupants with military spec composite body panels.",
            saveKey = "mod_16",
            saveValue = "index",
            items = armours
        },
        {
            type = "staticList",
            name = "Turbo",
            description = "Reduced lag turbocharger.",
            saveKey = "mod_18",
            saveValue = "index",
            items = turbos
        },
        {
            type = "categoryList",
            name = "Chassis",
            requirements = "hasChassis",
            categories = {
                {
                    type = "modList",
                    name = "Arch cover",
                    saveKey = "mod_42",
                    price = 100000,
                    modType = 42
                },
                {
                    type = "modList",
                    name = "Aerials",
                    saveKey = "mod_43",
                    price = 100000,
                    modType = 43
                },
                {
                    type = "modList",
                    name = "Roof Scoops",
                    saveKey = "mod_44",
                    price = 100000,
                    modType = 44
                },
                {
                    type = "modList",
                    name = "Tank",
                    saveKey = "mod_45",
                    price = 100000,
                    modType = 45
                },
                {
                    type = "modList",
                    name = "Doors",
                    cameraPreset = "frontDoors",
                    saveKey = "mod_46",
                    price = 100000,
                    modType = 46
                },
                {
                    type = "modList",
                    name = "Roll cage",
                    description = "Stiffen your chassis with a rollcage.",
                    saveKey = "mod_5",
                    price = 100000,
                    modType = 5
                }
            }
        },
        {
            type = "categoryList",
            name = "Engine",
            categories = {
                {
                    type = "modList",
                    name = "Engine Block",
                    description = "Custom engine block casings.",
                    cameraPreset = "hoodandtrunk",
                    saveKey = "mod_39",
                    price = 100000,
                    modType = 39
                },
                {
                    type = "modList",
                    name = "Cam Cover",
                    description = "Optional cam covers.",
                    cameraPreset = "hoodandtrunk",
                    saveKey = "mod_40",
                    price = 100000,
                    modType = 40
                },
                {
                    type = "modList",
                    name = "Strut Brace",
                    description = "A selection of support struts.",
                    cameraPreset = "hoodandtrunk",
                    saveKey = "mod_41",
                    price = 100000,
                    modType = 41
                },
                {
                    type = "staticList",
                    name = "Engine Tunes",
                    description = "Increases horsepower.",
                    saveKey = "mod_11",
                    saveValue = "index",
                    items = engineTunes
                }
            }
        },
        {
            type = "categoryList",
            name = "Interior",
            requirements = "hasInterior",
            categories = {
                {
                    type = "modList",
                    name = "Trim Design",
                    cameraPreset = "dashboard",
                    saveKey = "mod_27",
                    price = 100000,
                    modType = 27
                },
                {
                    type = "modList",
                    name = "Ornaments",
                    description = "Add decorative items to your dash.",
                    cameraPreset = "dashboard",
                    saveKey = "mod_28",
                    price = 100000,
                    modType = 28
                },
                {
                    type = "modList",
                    name = "Dashboard",
                    description = "Custom control panel designs.",
                    cameraPreset = "dashboard",
                    saveKey = "mod_29",
                    price = 100000,
                    modType = 29
                },
                {
                    type = "modList",
                    name = "Dials",
                    description = "Customize the look of your dials.",
                    cameraPreset = "dashboard",
                    saveKey = "mod_30",
                    price = 100000,
                    modType = 30
                },
                {
                    type = "modList",
                    name = "Doors",
                    description = "Install door upgrades.",
                    saveKey = "mod_31",
                    price = 100000,
                    modType = 31
                },
                {
                    type = "modList",
                    name = "Seats",
                    description = "Options where style meets comfort.",
                    cameraPreset = "dashboard",
                    saveKey = "mod_32",
                    price = 100000,
                    modType = 32
                },
                {
                    type = "modList",
                    name = "Steering Wheels",
                    description = "Customize the link between you and your vehicle.",
                    cameraPreset = "dashboard",
                    saveKey = "mod_33",
                    price = 100000,
                    modType = 33
                },
                {
                    type = "modList",
                    name = "Shifter leavers",
                    cameraPreset = "dashboard",
                    saveKey = "mod_34",
                    price = 100000,
                    modType = 34
                },
                {
                    type = "modList",
                    name = "Plaques",
                    saveKey = "mod_35",
                    price = 100000,
                    modType = 35
                },
                {
                    type = "modList",
                    name = "Speakers",
                    cameraPreset = "hoodandtrunk",
                    saveKey = "mod_36",
                    price = 100000,
                    modType = 36
                },
                {
                    type = "modList",
                    name = "Trunk",
                    cameraPreset = "trunk",
                    saveKey = "mod_37",
                    price = 100000,
                    modType = 37
                }
            }
        },
        {
            type = "categoryList",
            name = "Plates",
            description = "Decorative identification.",
            requirements = "isCar, hasPlates",
            categories = {
                {
                    type = "modList",
                    name = "Plate holder",
                    cameraPreset = "licence",
                    saveKey = "mod_25",
                    price = 100000,
                    modType = 25
                },
                {
                    type = "modList",
                    name = "Vanity plates",
                    cameraPreset = "vanityPlates",
                    saveKey = "mod_26",
                    price = 100000,
                    modType = 26
                }
            }
        },
        {
            type = "modList",
            name = "Hydraulics",
            saveKey = "mod_38",
            price = 125000,
            modType = 38
        },
        {
            type = "modList",
            name = "Liveries",
            description = "A selection of decals for your vehicle.",
            saveKey = "mod_48",
            price = 100000,
            modType = 48
        },
        {
            type = "categoryList",
            name = "Bumpers",
            description = "Custom front and rear bumpers.",
            requirements = "hasAnyBumper",
            categories = {
                {
                    type = "modList",
                    name = "Front bumpers",
                    description = "Custom front bumpers.",
                    cameraPreset = "frontBumpers",
                    requirements = "hasFrontBumper",
                    saveKey = "mod_1",
                    price = 100000,
                    modType = 1
                },
                {
                    type = "modList",
                    name = "Rear bumpers",
                    description = "Custom rear bumpers.",
                    cameraPreset = "rearBumpers",
                    requirements = "hasRearBumper",
                    saveKey = "mod_2",
                    price = 100000,
                    modType = 2
                }
            }
        },
        {
            type = "categoryList",
            name = "Lights",
            description = "Improved night time visibility.",
            requirements = "isCar",
            categories = {
                {
                    type = "staticList",
                    name = "Headlights",
                    cameraPreset = "headlights",
                    saveKey = "mod_22",
                    saveValue = "index",
                    items = headlights
                },
                {
                    type = "staticList",
                    name = "Xenon Lights",
                    description = "You must have Xenon Lights purchased to apply this",
                    saveKey = "xenonlights",
                    saveValue = "index",
                    items = xenonColours
                },
                {
                    type = "categoryList",
                    name = "Neon Kits",
                    categories = {
                        {
                            type = "staticList",
                            name = "Neon Layout",
                            saveKey = "neonlayout",
                            saveValue = "mod",
                            items = neonLayout
                        },
                        {
                            type = "staticList",
                            name = "Neon Colour",
                            cameraPreset = "neonColour",
                            saveKey = "neoncolour",
                            saveValue = "name",
                            price = 10000,
                            items = neonColours
                        }
                    }
                }
            }
        },
        {
            type = "categoryList",
            name = "Vehicle Security",
            categories = {
                {
                    type = "staticList",
                    name = "Remote Dashcam",
                    description = "Remotely access the view of your vehicle dashcam at any garage.",
                    saveKey = "security_dashcam",
                    saveValue = "mod",
                    items = remoteDashcams,
                    disabled = false,
                },
                {
                    type = "staticList",
                    name = "Remote Vehicle Blip",
                    description = "To find your vehicle anywhere in the city with ease.",
                    saveKey = "security_blips",
                    saveValue = "mod",
                    items = remoteVehicleBlips,
                    disabled = false,
                },
                {
                    type = "staticList",
                    name = "Biometric Lock",
                    description = "Make yourself the exclusive driver of this vehicle. Other people will be unable to drive this vehicle.",
                    saveKey = "security",
                    saveValue = "mod",
                    items = biometricLocks
                },
                {
                    type = "valueInputList",
                    name = "Biometric Users",
                    description = "Add additional people to your biometric lock.",
                    requirements = "hasBiometricLock",
                    saveKey = "biometric_users",
                    price = 5000000,
                    valueType = "number",
                    indexPrefix = "User ",
                    helpSuffix = "Perm ID",
                    buyTitle = "~y~Purchase Additional Slot",
                    inputTitle = "Enter Perm ID"
                }
            }
        },
        {
            type = "categoryList",
            name = "Respray",
            description = "Transforms vehicle appearance.",
            categories = {
                {
                    type = "categoryList",
                    name = "Primary Colour",
                    categories = {
                        {
                            type = "staticList",
                            name = "Chrome",
                            saveKey = "chrome",
                            saveValue = "index",
                            price = 100000,
                            items = chromeColours,
                            unapply = "classic, matte, metallic, metals, util, chameleon"
                        },
                        {
                            type = "staticList",
                            name = "Classic",
                            saveKey = "classic",
                            saveValue = "index",
                            price = 25000,
                            items = standardColours,
                            unapply = "chrome, matte, metallic, metals, util, chameleon"
                        },
                        {
                            type = "staticList",
                            name = "Matte",
                            saveKey = "matte",
                            saveValue = "index",
                            price = 25000,
                            items = matteColours,
                            unapply = "chrome, classic, metallic, metals, util, chameleon"
                        },
                        {
                            type = "staticList",
                            name = "Metallic",
                            saveKey = "metallic",
                            saveValue = "index",
                            price = 25000,
                            items = standardColours,
                            unapply = "chrome, classic, matte, metals, util, chameleon"
                        },
                        {
                            type = "staticList",
                            name = "Metals",
                            saveKey = "metals",
                            saveValue = "index",
                            price = 25000,
                            items = metalColours,
                            unapply = "chrome, classic, matte, metallic, util, chameleon"
                        },
                        {
                            type = "staticList",
                            name = "Util",
                            saveKey = "util",
                            saveValue = "index",
                            price = 25000,
                            items = utilColours,
                            unapply = "chrome, classic, matte, metallic, metals, chameleon"
                        },
                        {
                            type = "staticList",
                            name = "Chameleon",
                            saveKey = "chameleon",
                            saveValue = "index",
                            price = 150000,
                            items = chameleonColours,
                            unapply = "chrome, classic, matte, metallic, metals, util"
                        },
                        {
                            type = "staticList",
                            name = "Pearlescent",
                            saveKey = "pearlescent",
                            saveValue = "index",
                            price = 50000,
                            items = standardColours
                        }
                    }
                },
                {
                    type = "categoryList",
                    name = "Secondary Colour",
                    categories = {
                        {
                            type = "staticList",
                            name = "Chrome",
                            saveKey = "chrome2",
                            saveValue = "index",
                            price = 100000,
                            items = chromeColours,
                            unapply = "classic2, matte2, metallic2, metal2"
                        },
                        {
                            type = "staticList",
                            name = "Classic",
                            saveKey = "classic2",
                            saveValue = "index",
                            price = 25000,
                            items = standardColours,
                            unapply = "chrome2, matte2, metallic2, metal2"
                        },
                        {
                            type = "staticList",
                            name = "Matte",
                            saveKey = "matte2",
                            saveValue = "index",
                            price = 25000,
                            items = matteColours,
                            unapply = "chrome2, classic2, metallic2, metal2"
                        },
                        {
                            type = "staticList",
                            name = "Metallic",
                            saveKey = "metallic2",
                            saveValue = "index",
                            price = 25000,
                            items = standardColours,
                            unapply = "chrome2, classic2, matte2, metal2"
                        },
                        {
                            type = "staticList",
                            name = "Metals",
                            saveKey = "metal2",
                            saveValue = "index",
                            price = 25000,
                            items = metalColours,
                            unapply = "chrome2, classic2, matte2, metallic2"
                        }
                    }
                },
                {
                    type = "staticList",
                    name = "Interior Colour",
                    cameraPreset = "dashboard",
                    saveKey = "interiorcolour",
                    saveValue = "index",
                    price = 25000,
                    items = standardColours
                },
                {
                    type = "staticList",
                    name = "Dashboard Colour",
                    saveKey = "dashboardcolour",
                    saveValue = "index",
                    price = 25000,
                    items = standardColours
                }
            }
        },
        {
            type = "categoryList",
            name = "Wheels",
            description = "Custom rims, tires and colors.",
            requirements = "isCarOrBikeOrHeli",
            categories = {
                {
                    type = "categoryList",
                    name = "Wheel Type",
                    description = "Custom rims in all styles and sizes.",
                    requirements = "isCarOrBike",
                    categories = {
                        {
                            type = "staticList",
                            name = "Front Wheel",
                            requirements = "isBike",
                            cameraPreset = "frontWheel",
                            saveKey = "frontwheel",
                            saveValue = "index",
                            items = frontWheels
                        },
                        {
                            type = "staticList",
                            name = "Back Wheel",
                            requirements = "isBike",
                            camerapreset = "backWheel",
                            saveKey = "backwheel",
                            saveValue = "index",
                            items = backWheels
                        },
                        {
                            type = "staticList",
                            name = "Sport",
                            requirements = "isCar",
                            cameraPreset = "frontWheel",
                            saveKey = "sportwheels",
                            saveValue = "index",
                            items = sportsWheels,
                            unapply = "musclewheels, lowriderwheels, suvwheels, offroadwheels, tunerwheels, highendwheels"
                        },
                        {
                            type = "staticList",
                            name = "Muscle",
                            requirements = "isCar",
                            cameraPreset = "frontWheel",
                            saveKey = "musclewheels",
                            saveValue = "index",
                            items = muscleWheels,
                            unapply = "sportwheels, lowriderwheels, suvwheels, offroadwheels, tunerwheels, highendwheels"
                        },
                        {
                            type = "staticList",
                            name = "Lowrider",
                            requirements = "isCar",
                            cameraPreset = "frontWheel",
                            saveKey = "lowriderwheels",
                            saveValue = "index",
                            items = lowriderWheels,
                            unapply = "sportwheels, musclewheels, suvwheels, offroadwheels, tunerwheels, highendwheels"
                        },
                        {
                            type = "staticList",
                            name = "Suv",
                            requirements = "isCar",
                            cameraPreset = "frontWheel",
                            saveKey = "suvwheels",
                            saveValue = "index",
                            items = suvWheels,
                            unapply = "sportwheels, musclewheels, lowriderwheels, offroadwheels, tunerwheels, highendwheels"
                        },
                        {
                            type = "staticList",
                            name = "Offroad",
                            requirements = "isCar",
                            cameraPreset = "frontWheel",
                            saveKey = "offroadwheels",
                            saveValue = "index",
                            items = offroadWheels,
                            unapply = "sportwheels, musclewheels, lowriderwheels, suvwheels, tunerwheels, highendwheels"
                        },
                        {
                            type = "staticList",
                            name = "Tuner",
                            requirements = "isCar",
                            cameraPreset = "frontWheel",
                            saveKey = "tunerwheels",
                            saveValue = "index",
                            items = tunerWheels,
                            unapply = "sportwheels, musclewheels, lowriderwheels, suvwheels, offroadwheels, highendwheels"
                        },
                        {
                            type = "staticList",
                            name = "Highend",
                            requirements = "isCar",
                            cameraPreset = "frontWheel",
                            saveKey = "highendwheels",
                            saveValue = "index",
                            items = highendWheels,
                            unapply = "sportwheels, musclewheels, lowriderwheels, suvwheels, offroadwheels, tunerwheels"
                        }
                    }
                },
                {
                    type = "staticList",
                    name = "Wheel Colour",
                    cameraPreset = "frontWheel",
                    saveKey = "wheelcolor",
                    saveValue = "index",
                    price = 25000,
                    items = standardColours
                },
                {
                    type = "staticList",
                    name = "Wheel Smoke",
                    requirements = "isCarOrBike",
                    cameraPreset = "frontWheel",
                    saveKey = "wheelaccessories",
                    saveValue = "colour",
                    price = 25000,
                    items = wheelSmokes
                },
                {
                    type = "externalMenu",
                    name = "Stancer",
                    requirements = "isCar",
                    menuType = "stancer",
                    menuName = "mainmenu",
                    disabled = true,
                }
            }
        },
        {
            type = "categoryList",
            name = "Drift",
            requirements = "isCar",
            disabled = true,
            categories = {
                {
                    type = "staticList",
                    name = "Suspension",
                    description = "Lower your vehicle suspension whilst drifting. Only works for vehicles which have been explictly modelled to support it.",
                    saveKey = "driftsuspension",
                    saveValue = "mod",
                    items = driftSuspensions
                },
                {
                    type = "staticList",
                    name = "Smoke",
                    description = "Increases amount of smoke from tyres whilst drifting",
                    saveKey = "driftsmoke",
                    saveValue = "mod",
                    items = driftSmokes
                }
            }
        },
        {
            type = "staticList",
            name = "Windows",
            description = "A selection of tinted windows.",
            saveKey = "windowtint",
            saveValue = "tint",
            price = 25000,
            items = windows
        },
        {
            type = "staticValueList",
            name = "Nitro",
            description = "Left Shift to Activate",
            requirements = "isCar",
            saveKey = "nitro",
            saveValue = "mod",
            ownedValue = 100,
            items = nitros
        },
        {
            type = "staticList",
            name = "Anti-lag",
            description = "Anti-lag is a system that is used to keep a turbo spooled when you lift off the throttle.",
            requirements = "isCar",
            saveKey = "antilag",
            saveValue = "mod",
            items = antilag
        },
        {
            type = "staticList",
            name = "Bulletproof Tires",
            description = "Bulletproof tires, the tires are yeah you guessed it, bulletproof.",
            requirements = "isCar",
            saveKey = "bulletproof_tires",
            saveValue = "mod",
            items = bulletproofTires
        },
        {
            type = "staticList",
            name = "License Plate",
            description = "A selection of license plate colours.",
            requirements = "isCar",
            saveKey = "plate_colour",
            saveValue = "mod",
            items = plates
        },
        {
            type = "staticList",
            name = "Custom Exhausts",
            description = "Get a custom exhaust to get a custom vehicle sound.",
            requirements = "isCarOrBike",
            saveKey = "sounds",
            saveValue = "mod",
            helpText = "Press ~INPUT_VEH_ACCELERATE~ to preview",
            items = customExhausts
        },
        -- {
        --     type = "staticList",
        --     name = "Vehicle Subwoofer",
        --     description = "Play your favourite music. This requires you to have the DJ License.",
        --     requirements = "isCar",
        --     saveKey = "misc",
        --     saveValue = "mod",
        --     items = vehicleSubwoofer
        -- },
        {
            type = "staticList",
            name = "Plane Smoke Trail",
            description = "Set the colour of smoke that is used in stunts. This can be toggled with the key G or /togglesmoke.",
            requirements = "isPlane",
            saveKey = "planesmokes",
            saveValue = "mod",
            items = planeSmokes
        },
        {
            type = "indexModList",
            name = "Default Liveries",
            description = "Set a default livery to apply on the car.",
            requirements = "isCar",
            saveKey = "liveries",
            saveValue = "liveries",
            price = 25000,
            generatorName = "livery",
            prefix = "Livery"
        },
    }
}

cfg.cameraPresets = {
    ["frontBumpers"] = {
        type = "moveVeh",
        position = "front",
        offset = vector3(-0.6, 1.5, 0.4)
    },
    ["rearBumpers"] = {
        type = "moveVeh",
        position = "back",
        offset = vector3(-0.5, -1.5, 0.2)
    },
    ["hood"] = {
        type = "moveVeh",
        position = "front-top",
        offset = vector3(-0.5, 1.3, 1.0)
    },
    ["headlights"] = {
        type = "moveVeh",
        position = "front",
        offset = vector3(-0.6, 1.3, 0.6)
    },
    ["licence"] = {
        type = "moveVeh",
        position = "back",
        offset = vector3(0.0, -1.0, 0.2)
    },
    ["vanityPlates"] = {
        type = "moveVeh",
        position = "front",
        offset = vector3(-0.3, 0.8, 0.3)
    },
    ["fenders"] = {
        type = "moveVeh",
        position = "left",
        offset = vector3(-1.8, -1.3, 0.7)
    },
    ["skirts"] = {
        type = "moveVeh",
        position = "left",
        offset = vector3(-1.8, -1.3, 0.7)
    },
    ["spoiler"] = {
        type = "moveVeh",
        position = "back",
        offset = vector3(0.5, -1.6, 1.3)
    },
    ["backWheel"] = {
        type = "pointBone",
        bone = "wheel_lr",
        offset = vector3(-1.4, 0.0 , 0.3)
    },
    ["frontWheel"] = {
        type = "pointBone",
        bone = "wheel_lf",
        offset = vector3(-1.4, 0.0, 0.3)
    },
    ["neonColour"] = {
        type = "pointBone",
        bone = "neon_l",
        offset = vector3(-2.0, 2.0, 0.4)
    },
    ["dashboard"] = {
        type = "viewMode",
        mode = 4
    },
    ["frontDoors"] = {
        type = "doors",
        doors = {0, 1}
    },
    ["trunk"] = {
        type = "doors",
        doors = {5}
    },
    ["hoodandtrunk"] = {
        type = "doors",
        doors = {4, 5}
    }
}

cfg.neonColours = {
    ["White"] = {255,255,255},
    ["Blue"] = {0,0,255},
    ["Electric Blue"] = {0,150,255},
    ["Mint Green"] = {50,255,155},
    ["Lime Green"] = {0,255,0},
    ["Yellow"] = {255,255,0},
    ["Golden Shower"] = {204,204,0},
    ["Orange"] = {255,128,0},
    ["Red"] = {255,0,0},
    ["Pony Pink"] = {255,102,255},
    ["Hot Pink"] = {255,0,255},
    ["Purple"] = {153,0,153},
    ["Brown"] = {139,69,19},
}

cfg.stancerPrices = {
    ["frontWidth"] = 150000,
    ["rearWidth"] = 150000,
    ["frontCamber"] = 150000,
    ["rearCamber"] = 150000
}

cfg.stancerLimits = {
    frontWidth = 0.25,
    rearWidth = 0.25,
    frontCamber = 0.20,
    rearCamber = 0.20
}

cfg.categoryToIndentifier = {}
cfg.identifierToCategory = {}
local identifier = 1

local function recurseBuildLookup(category)
    cfg.categoryToIndentifier[category] = identifier
    cfg.identifierToCategory[identifier] = category
    identifier = identifier + 1
    if category.type == "categoryList" then
        for _, subCategory in pairs(category.categories) do
            recurseBuildLookup(subCategory)
        end
    end
end
recurseBuildLookup(cfg.category)

return cfg