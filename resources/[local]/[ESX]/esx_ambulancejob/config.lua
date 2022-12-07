Config                            = {}
Config.DrawDistance               = 15.0
Config.MarkerColor                = { r = 56, g = 197, b = 201 }
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.Sprite  = 489
Config.Display = 4
Config.Scale   = 1.0
Config.Colour  = 19
Config.ReviveReward               = 1500
Config.AntiCombatLog              = true
Config.LoadIpl                    = false
Config.Locale = 'en'
Config.RespawnToHospitalDelay		= 300000
 
Config.CenaNaprawki = 3500
 
local second = 1000
local minute = 60 * second
 
-- How much time before auto respawn at hospital
Config.RespawnDelayAfterRPDeath   = 5 * minute
 
Config.EnablePlayerManagement       = true
Config.EnableSocietyOwnedVehicles   = false
 
Config.RemoveWeaponsAfterRPDeath    = true
Config.RemoveCashAfterRPDeath       = true
Config.RemoveItemsAfterRPDeath      = true
 
-- Will display a timer that shows RespawnDelayAfterRPDeath as a countdown
Config.ShowDeathTimer               = false
 
-- Will allow respawn after half of RespawnDelayAfterRPDeath has elapsed.
Config.EarlyRespawn                 = false
-- The player will be fined for respawning early (on bank account)
Config.EarlyRespawnFine                  = false
Config.EarlyRespawnFineAmount            = 500
 
Config.RespawnPlaceLS = vector3(365.85, -610.97, 28.79)
Config.RespawnPlaceSANDY = vector3(1836.2681, 3671.073, 33.3267)
Config.RespawnPlacePALETO = vector3(-247.4772, 6330.8159, 31.4761)
 
Config.Blips = {
	{
		coords = vector3(1817.81 , 3671.48, 44.64)
	},
	{
		coords = vector3(1143.64 , -1542.54, 51.71)
	},
	{
		coords = vector3(318.04, -593.21, 43.29)
	}
}
 
Config.OnlySamsBlip = {
	{
		Pos     = { x = -718.77, y = -1326.51, z = 1.5 },
		Sprite  = 427,
		Display = 4,
		Scale   = 0.6,
		Colour  = 3
	},
	{
		Pos     = { x = 2836.1272, y = -732.8671, z = 0.416 },
		Sprite  = 427,
		Display = 4,
		Scale   = 0.6,
		Colour  = 3
	},
	{
		Pos     = { x = -3420.7292, y = 955.541, z = 7.3967 },
		Sprite  = 427,
		Display = 4,
		Scale   = 0.6,
		Colour  = 3
	},
	{
		Pos     = { x = 3373.7449, y = 5183.4521, z = 0.5102 },
		Sprite  = 427,
		Display = 4,
		Scale   = 0.6,
		Colour  = 3
	},
	{
		Pos     = { x = 1736.29, y = 3976.24, z = 31.98 },
		Sprite  = 427,
		Display = 4,
		Scale   = 0.6,
		Colour  = 3
	},
	{
		Pos	= { x = -285.01, y = 6627.6, z = 7.2 },
		Sprite  = 427,
		Display = 4,
		Scale   = 0.6,
		Colour  = 3
	},
}
 
Config.VehicleGroups = {
	'PATROL', -- 1
	'TRANSPORT', -- 2
	'DODATKOWE', -- 3
}
 
-- https://wiki.rage.mp/index.php?title=Vehicles
Config.AuthorizedVehicles = {
	{
		grade = 0,
		model = 'pd_dirtbike',
		label = 'Cross',
		groups = {3},
		livery = 2,
		extrason = {},
		extrasoff = {},
	},
	{
		grade = 0,
		model = 'ms_coach',
		label = 'Autobus',
		groups = {2},
		livery = 0,
		extrason = {1,3,4,5,6,7},
		extrasoff = {2},
		tint = 1,
	},
	{
		grade = 4,
		model = 'ms_explorer',
		label = 'Ford Explorer',
		groups = {1},
		livery = 0,
		extrason = {1,3,4,5,6,7},
		extrasoff = {2},
		tint = 1,
	},
	{
		grade = 2,
		model = 'ms_jeep',
		label = 'Jeep Cherokee',
		groups = {1},
		livery = 0,
		extrason = {1,3,4,5,6,7},
		extrasoff = {2},
		tint = 1,
	},
	{
		grade = 2,
		model = 'ms_impala',
		label = 'Chevrolet Imapala',
		groups = {1},
		livery = 0,
		extrason = {1,3,4,5,6,7},
		extrasoff = {2},
		tint = 1,
	},
	{
		grade = 6,
		model = 'ms_charger',
		label = 'Dodge Charger 2018',
		groups = {1},
		livery = 0,
		extrason = {1,3,4,5,6,7},
		extrasoff = {2},
		tint = 1,
	},
	{
		grade = 10,
		model = 'ms_m5',
		label = 'BMW M5',
		groups = {1},
		livery = 0,
		extrason = {1,3,4,5,6,7},
		extrasoff = {2},
		tint = 1,
	},
	{
		grade = 4,
		model = 'ms_raptor',
		label = 'Ford Raptor',
		groups = {1},
		livery = 0,
		extrason = {1,2,3},
		extrasoff = {4,5},
	},
	{
		grade = 4,
		model = 'ms_tahoe21',
		label = 'Chevrolet Tahoe 21',
		groups = {1},
		livery = 0,
		extrason = {1,2,3},
		extrasoff = {4,5},
	},
	{
		grade = 5,
		model = 'ms_tundra',
		label = 'Toyota Tundra',
		groups = {1},
		livery = 0,
		extrason = {1,2,3},
		extrasoff = {4,5},
	},
	{
		grade = 3,
		model = 'ms_ram19',
		label = 'Dodge Ram',
		groups = {1},
		livery = 0,
		extrason = {1,2,3},
		extrasoff = {4,5},
	},
	{
		grade = 1,
		model = 'ms_tahoe',
		label = 'Chevrolet Tahoe 19',
		groups = {1},
		livery = 0,
		extrason = {1,2,3},
		extrasoff = {4,5},
	},
	{
		grade = 0,
		model = 'ms_transformer',
		label = 'Ford F350',
		groups = {1},
		livery = 0,
		extrason = {1,2},
		extrasoff = {},
	},
	{
		grade = 1,
		model = 'ms_outlander',
		label = 'Quad',
		groups = {3},
		livery = 0,
		extrason = {1},
		extrasoff = {},
	},
	{
		grade = 0,
		model = 'ms_bike',
		label = 'Rower Medyczny',
		groups = {3},
		livery = 0,
		extrason = {1,2},
		extrasoff = {},
	},		
	{
		grade = 4,
		model = 'ms_Bronco',
		label = 'Ford Bronco',
		groups = {2},
		livery = 1,
		extrason = {1,3,4,5,6},
		extrasoff = {},
	},
	{
		grade = 0,
		model = 'ms_chair',
		label = 'Wózek Inwalidzki',
		groups = {2},
		livery = 0,
		extrason = {},
		extrasoff = {},
	},
	{
		grade = 4,
		model = 'ms_charger18',
		label = 'Dodge Charger 2018',
		groups = {2},
		livery = 2,
		extrason = {1,2,3,4,5,6,7},
		extrasoff = {},
	},
	{
		grade = 4,
		model = 'ms_colorado',
		label = 'Chevrolet Colorado',
		groups = {2},
		livery = 2,
		extrason = {1,2,3,4,5,6},
		extrasoff = {},
	},
	{
		grade = 1,
		model = 'ms_everest14',
		label = 'Ford Everest',
		groups = {1},
		livery = 1,
		extrason = {1,2,3,4,5,6},
		extrasoff = {},
	},
	{
		grade = 1,
		model = 'ms_f150',
		label = 'Ford F150',
		groups = {2},
		livery = 0,
		extrason = {1,2,3,4,5,6,7,8,9,10,12},
		extrasoff = {11},
	},
	{
		grade = 0,
		model = 'ms_fj',
		label = 'Toyota FJ',
		groups = {2},
		livery = 0,
		extrason = {1,2,3,4,5,6,7,10,11},
		extrasoff = {},
	},
	{
		grade = 5,
		model = 'ms_focus',
		label = 'Ford Focus',
		groups = {2},
		livery = 0,
		extrason = {1,2,3},
		extrasoff = {},
	},
	{
		grade = 4,
		model = 'ms_kawasaki',
		label = 'Kawasaki Medyczny',
		groups = {3},
		livery = 0,
		extrason = {1,2,3,4},
		extrasoff = {},
	},
	{
		grade = 4,
		model = 'ms_lexus',
		label = 'Lexus',
		groups = {2},
		livery = 1,
		extrason = {1,2},
		extrasoff = {},
	},
	{
		grade = 12,
		model = 'ms_mustang',
		label = 'Ford Mustang',
		groups = {2},
		livery = 0,
		extrason = {1,2,3,4,6,8,9},
		extrasoff = {5,7},
	},
	{
		grade = 0,
		model = 'ms_paka',
		label = 'Karetka',
		groups = {2},
		livery = 2,
		extrason = {5,8,10},
		extrasoff = {},
	},
	{
		grade = 1,
		model = 'ms_silv2020w',
		label = 'Chevrolet Silverado 2020',
		groups = {2},
		livery = 0,
		extrason = {1,2,3,4,5,6,7,8,9},
		extrasoff = {},
	},
	{
		grade = 1,
		model = 'ms_silvleo',
		label = 'Chevrolet Silverado',
		groups = {2},
		livery = 0,
		extrason = {1,2,4},
		extrasoff = {3},
	},
	{
		grade = 10,
		model = 'ms_tesla',
		label = 'Tesla',
		groups = {2},
		livery = 0,
		extrason = {1,2},
		extrasoff = {},
	},
	{
		grade = 2,
		model = 'ms_titan',
		label = 'Nissan Titan',
		groups = {2},
		livery = 1,
		extrason = {1,2,9},
		extrasoff = {},
	},
}

Config.AuthorizedHeli = {
	{
	   model = 'ms_heli',
	   label = 'Helikopter'
	},
}
Config.AuthorizedBoats = {
	{
		model = 'dinghy',
		label = 'Łódź'
	},
	{
		model = 'ms_boat1',
		label = 'Łódka Medyczna',
	},
}
 
Config.Ambulance = {
	LicensesMenu = {
		{
			coords = vector3(1132.88, -1580.12, 35.38-0.95),--LOS SANTOS
		},
		{
			coords = vector3(1839.83, 3679.58, 34.27-0.95),--SANDY
		}
	},

	Cloakrooms = {
		{
			coords = vector3(1132.47, -1560.64, 35.38-0.95),--LOS SANTOS
		},
		{
			coords = vector3(1831.03, 3677.56, 34.27-0.95),--SANDY
		},
		{
			coords = vector3(312.02, -602.62, 42.31),--Phillbox
		},
	},

	Vehicles = {
		{
			coords = vector3(1155.61, -1520.91, 33.85),--LOS SANTOS
			spawnPoint = vector3(1155.61, -1520.91, 34.69),
			heading = 6.76
		},
		{
			coords = vector3(1822.02, 3688.6, 34.22-0.95),--SANDY
			spawnPoint = vector3(1818.69, 3701.57, 33.87),
			heading = 294.34
		},
		{
			coords = vector3(330.61, -571.12, 27.88),--Phillbox
			spawnPoint = vector3(326.74, -568.46, 27.88),
			heading = 338.88
		},
	},

	Boats = {
		{
			coords = vector3(-718.77, -1326.51, 0.7),
			spawnPoint = vector3(-724.68, -1328.62, 0.12),
			heading = 229.75
		},
		{
			coords = vector3(1736.29, 3976.24, 31.08),
			spawnPoint = vector3(1736.63, 3986.54, 30.33),
			heading = 17.2
		},
		{
			coords = vector3(-285.01, 6627.6, 6.24),
			spawnPoint = vector3(-287.84, 6624.39, -0.2),
			heading = 47.37

		},
		{
			coords = vector3(-3420.4172, 955.6319, 7.3967),
			spawnPoint = vector3(-3434.8318, 945.8564, 0.5458),
			heading = 88.32

		},
		{
			coords = vector3(2836.5044, -732.4112, 0.3822),
			spawnPoint = vector3(2853.5557, -728.2502, 0.3811),
			heading = 261.94

		},
		{
			coords = vector3(3373.8213, 5183.4863, 0.5161),
			spawnPoint = vector3(3384.6956, 5181.6299, 0.5161),
			heading = 271.24

		},
	},

	Helicopters = {
		{
			coords = vector3(1141.07, -1620.86, 34.88-0.95),--LOS SANTOS
			spawnPoint = vector3(1140.39, -1611.39, 34.69),
			heading = 265.97
		},
	},
	
	SkinMenu = {
		{
			coords = vector3(1132.45, -1557.35, 35.38-0.95),--LOS SANTOS
		},
		{
			coords = vector3(1825.84, 3675.03, 34.27-0.95),--SANDY
		},
	},
 
	VehicleDeleters = {
		{
			coords = vector3(1155.72, -1513.31, 33.85),--LOS SANTOS
		},
		{
			coords = vector3(1843.49, 3703.8, 33.73-0.95),--SANDY
		},
		{
			coords = vector3(330.49, -542.89, 27.88),--Philbox
		},
	},

	Inventories2 = {
		{
			coords = vector3(1132.58, -1573.69, 35.38-0.95),--LOS SANTOS
		},
		{
			coords = vector3(1842.26, 3684.12, 34.27-0.95),--SANDY
		},
		{
			coords = vector3(303.90, -579.27, 42.31),--SANDY
		},
	},

	Inventories = {
		{
			coords = vector3(1142.12, -1573.03, 35.38-0.95),--LOS SANTOS
		},
		{
			coords = vector3(1844.9, 3679.79, 34.27-0.95),--SANDY
		},
		{
			coords = vector3(306.36, -579.28, 42.31),--SANDY
		},
	},

	Pharmacies = {
		{
			coords = vector3(1144.31, -1574.9, 35.38-0.95),--LOS SANTOS
		},
		{
			coords = vector3(1843.81, 3681.39, 34.27-0.95),--SANDY
		},
	},

	BossActions = {
		{
		 	coords = vector3(1132.86, -1583.89, 35.38-0.95),--LOS SANTOS  
		},
		{
			coords = vector3(1839.71, 3686.76, 34.27-0.95),--SANDY
		},
		{
			coords = vector3(360.93, -587.81, 46.38),--Phillbox
		},
	}
}

Config.Uniforms = {

	pielegniarz_wear = {
		male = {
			['tshirt_1'] = 189,  ['tshirt_2'] = 0,
			['torso_1'] = 411,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 90,
			['pants_1'] = 26,   ['pants_2'] = 0,
			['shoes_1'] = 14,   ['shoes_2'] = 1,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 30,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['mask_1'] = 0,   ['mask_2'] = 0,
			['bags_1'] = 122,  ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 30,  ['tshirt_2'] = 0,
			['torso_1'] = 432,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 109,
			['pants_1'] = 200,   ['pants_2'] = 8,
			['shoes_1'] = 11,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 117,  ['bags_2'] = 0
		}
	},
	ratownik_wear = {
		male = {
			['tshirt_1'] = 189,  ['tshirt_2'] = 0,
			['torso_1'] = 411,   ['torso_2'] = 9,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 90,
			['pants_1'] = 26,   ['pants_2'] = 0,
			['shoes_1'] = 14,   ['shoes_2'] = 1,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 30,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['mask_1'] = 0,   ['mask_2'] = 0,
			['bags_1'] = 122,  ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 30,  ['tshirt_2'] = 0,
			['torso_1'] = 432,   ['torso_2'] = 9,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 109,
			['pants_1'] = 200,   ['pants_2'] = 8,
			['shoes_1'] = 11,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 117,  ['bags_2'] = 0
		}
	},
	stratownik_wear = {
		male = {
			['tshirt_1'] = 189,  ['tshirt_2'] = 0,
			['torso_1'] = 414,   ['torso_2'] = 5,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 90,
			['pants_1'] = 26,   ['pants_2'] = 0,
			['shoes_1'] = 14,   ['shoes_2'] = 1,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 30,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['mask_1'] = 0,   ['mask_2'] = 0,
			['bags_1'] = 122,  ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 30,  ['tshirt_2'] = 0,
			['torso_1'] = 433,   ['torso_2'] = 5,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 101,
			['pants_1'] = 200,   ['pants_2'] = 8,
			['shoes_1'] = 11,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 117,  ['bags_2'] = 0
		}
	},
	lekarz_wear = {
		male = {
			['tshirt_1'] = 189,  ['tshirt_2'] = 0,
			['torso_1'] = 414,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 90,
			['pants_1'] = 26,   ['pants_2'] = 0,
			['shoes_1'] = 14,   ['shoes_2'] = 1,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 30,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['mask_1'] = 0,   ['mask_2'] = 0,
			['bags_1'] = 122,  ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 30,  ['tshirt_2'] = 0,
			['torso_1'] = 433,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 101,
			['pants_1'] = 200,   ['pants_2'] = 8,
			['shoes_1'] = 11,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 117,  ['bags_2'] = 0
		}
	},
	lekarzsoru_wear = {
		male = {
			['tshirt_1'] = 189,  ['tshirt_2'] = 0,
			['torso_1'] = 416,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 90,
			['pants_1'] = 26,   ['pants_2'] = 0,
			['shoes_1'] = 14,   ['shoes_2'] = 1,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 30,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['mask_1'] = 0,   ['mask_2'] = 0,
			['bags_1'] = 122,  ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 30,  ['tshirt_2'] = 0,
			['torso_1'] = 435,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 109,
			['pants_1'] = 200,   ['pants_2'] = 8,
			['shoes_1'] = 11,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 117,  ['bags_2'] = 0
		}
	},
	lekarzspecjalista_wear = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 415,   ['torso_2'] = 11,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 90,
            ['pants_1'] = 26,   ['pants_2'] = 0,
            ['shoes_1'] = 14,   ['shoes_2'] = 1,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 30,    ['chain_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['mask_1'] = 0,   ['mask_2'] = 0,
            ['bags_1'] = 122,  ['bags_2'] = 0
        },
		female = {
			['tshirt_1'] = 30,  ['tshirt_2'] = 0,
			['torso_1'] = 435,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 109,
			['pants_1'] = 200,   ['pants_2'] = 8,
			['shoes_1'] = 11,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 117,  ['bags_2'] = 0
		}
	},
	doktor_wear = {
		male = {
			['tshirt_1'] = 189,  ['tshirt_2'] = 0,
			['torso_1'] = 413,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 85,
			['pants_1'] = 26,   ['pants_2'] = 0,
			['shoes_1'] = 14,   ['shoes_2'] = 1,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 30,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['mask_1'] = 0,   ['mask_2'] = 0,
			['bags_1'] = 122,  ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 30,  ['tshirt_2'] = 0,
			['torso_1'] = 434,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 109,
			['pants_1'] = 200,   ['pants_2'] = 8,
			['shoes_1'] = 11,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 117,  ['bags_2'] = 0
		}
	},
	chirurg_wear = {
		male = {
			['tshirt_1'] = 189,  ['tshirt_2'] = 0,
			['torso_1'] = 413,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 85,
			['pants_1'] = 26,   ['pants_2'] = 0,
			['shoes_1'] = 14,   ['shoes_2'] = 1,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 30,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['mask_1'] = 0,   ['mask_2'] = 0,
			['bags_1'] = 122,  ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 30,  ['tshirt_2'] = 0,
			['torso_1'] = 434,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 109,
			['pants_1'] = 200,   ['pants_2'] = 8,
			['shoes_1'] = 11,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 117,  ['bags_2'] = 0
		}
	},
	neurochirurg_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 417,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 90,
			['pants_1'] = 26,   ['pants_2'] = 0,
			['shoes_1'] = 14,   ['shoes_2'] = 1,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 30,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['mask_1'] = 0,   ['mask_2'] = 0,
			['bags_1'] = 122,  ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 2,  ['tshirt_2'] = 0,
			['torso_1'] = 436,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 109,
			['pants_1'] = 200,   ['pants_2'] = 8,
			['shoes_1'] = 11,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 117,  ['bags_2'] = 0
		}
	},
	nurek_wear = { 
		male = {
			['tshirt_1'] = 123,  ['tshirt_2'] = 0,
			['torso_1'] = 243,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 90,
			['pants_1'] = 94,   ['pants_2'] = 1,
			['shoes_1'] = 67,   ['shoes_2'] = 1,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 122,    ['chain_2'] = 0
 
		},
		female = {
			['tshirt_1'] = 153,  ['tshirt_2'] = 0,
			['torso_1'] = 251,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 106,
			['pants_1'] = 97,   ['pants_2'] = 1,
			['shoes_1'] = 70,   ['shoes_2'] = 1,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 117,  ['bags_2'] = 0
 
		}
	},
}
