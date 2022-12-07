Config                            = {}
Config.Locale                     = 'pl'

Config.DrawDistance               = 7.0
Config.MaxInService               = -1
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false

Config.NPCSpawnDistance           = 200.0
Config.NPCNextToDistance          = 25.0
Config.NPCJobEarnings             = { min = 7, max = 20 }
Config.Lokalny = {
	coords = {x=139.73, y=-3027.25, z=6.04},
	MechanikCount = 0
}

Config.Vehicles = {
	'rhapsody',
	'asea',
	'asterope',
	'banshee',
	'buffalo'
}

Config.Blips = {
	Mechanic = {
		Pos = vector3(808.03, -880.73, 29.25),
		Sprite = 446,
		Color = 5,
		Label = "LST"
	},
}

Config.Magazine = {
	vector3(853.86, -960.81, 26.28)
}

Config.Zones = {
	['mechanik'] = {
		DutyList = {
			Pos   = { x = 807.78, y = -884.09, z = 29.25-0.99 },
			Size  = { x = 1.5, y = 1.5, z = 1.0 },
			Color = { r = 0, g = 203, b = 214 },
			Type  = 27
		},

		MechanicActions = {
			Pos   = { x = 900.96, y = -901.95, z = 26.80 },
			Size  = { x = 1.5, y = 1.5, z = 1.0 },
			Color = { r = 0, g = 203, b = 214 },
			Type  = 27
		},
		
		PrivateStock = {
			Pos   = { x = 829.31, y = -881.08, z = 25.25-0.99 },
			Size  = { x = 1.5, y = 1.5, z = 1.0 },
			Color = { r = 0, g = 203, b = 214 },
			Type  = 27
		},
		
		BossMenu = {
			Pos   = { x = 808.03, y = -880.73, z = 29.25-0.99 },
			Size  = { x = 1.5, y = 1.5, z = 1.0 },
			Color = { r = 0, g = 203, b = 214 },
			Type  = 27
		},
	
		Craft = {
			Pos   = { x = 826.25, y = -881.17, z = 25.25-0.99 },
			Size  = { x = 1.5, y = 1.5, z = 1.0 },
			Color = { r = 0, g = 203, b = 214 },
			Type  = 27
		},
		
		VehicleSpawner = {
			Pos   = { x = 845.9, y = -901.46, z = 25.25-0.99 },
			Size  = { x = 3.0, y = 3.0, z = 1.0 },
			Color = { r = 0, g = 203, b = 214 },
			Type  = 27
		},
	
		VehicleSpawnPoint = {
			Pos   = { x = 863.05, y = -889.69, z = 26.1 },
			Size  = { x = 1.5, y = 1.5, z = 1.0 },
			Heading = 267.86,
			Type  = -1
		},
	
		VehicleDeleter = {
			Pos   = { x = 887.72, y = -920.51, z = 26.28-0.95 },
			Size  = { x = 3.5, y = 3.5, z = 3.5 },
			Color = { r = 0, g = 203, b = 214 },
			Type  = 28
		},
	
		VehicleDelivery = {
			Pos   = { x = 853.86, y = -960.81, z = 26.28-0.99 },
			Size  = { x = 20.0, y = 20.0, z = 3.0 },
			Color = { r = 204, g = 204, b = 0 },
			Type  = -1
		},
		VehicleExtras = {
			Pos = {x = 888.93, y = -929.44, z = 26.28-0.95},
			Size  = { x = 3.5, y = 3.5, z = 3.5 },
			Color = { r = 0, g = 203, b = 214 },
			Type = 28
		}
	},
}

Config.TowZones = {

}

Config.Towables = {
	vector3(-2480.9, -212.0, 17.4),
	vector3(-2723.4, 13.2, 15.1),
	vector3(-3169.6, 976.2, 15.0),
	vector3(-3139.8, 1078.7, 20.2),
	vector3(-1656.9, -246.2, 54.5),
	vector3(-1586.7, -647.6, 29.4),
	vector3(-1036.1, -491.1, 36.2),
	vector3(-1029.2, -475.5, 36.4),
	vector3(75.2, 164.9, 104.7),
	vector3(-534.6, -756.7, 31.6),
	vector3(487.2, -30.8, 88.9),
	vector3(-772.2, -1281.8, 4.6),
	vector3(-663.8, -1207.0, 10.2),
	vector3(719.1, -767.8, 24.9),
	vector3(-971.0, -2410.4, 13.3),
	vector3(-1067.5, -2571.4, 13.2),
	vector3(-619.2, -2207.3, 5.6),
	vector3(1192.1, -1336.9, 35.1),
	vector3(-432.8, -2166.1, 9.9),
	vector3(-451.8, -2269.3, 7.2),
	vector3(939.3, -2197.5, 30.5),
	vector3(-556.1, -1794.7, 22.0),
	vector3(591.7, -2628.2, 5.6),
	vector3(1654.5, -2535.8, 74.5),
	vector3(1642.6, -2413.3, 93.1),
	vector3(1371.3, -2549.5, 47.6),
	vector3(383.8, -1652.9, 37.3),
	vector3(27.2, -1030.9, 29.4),
	vector3(229.3, -365.9, 43.8),
	vector3(-85.8, -51.7, 61.1),
	vector3(-4.6, -670.3, 31.9),
	vector3(-111.9, 92.0, 71.1),
	vector3(-314.3, -698.2, 32.5),
	vector3(-366.9, 115.5, 65.6),
	vector3(-592.1, 138.2, 60.1),
	vector3(-1613.9, 18.8, 61.8),
	vector3(-1709.8, 55.1, 65.7),
	vector3(-521.9, -266.8, 34.9),
	vector3(-451.1, -333.5, 34.0),
	vector3(322.4, -1900.5, 25.8)
}

for k,v in ipairs(Config.Towables) do
	Config.TowZones['Towable' .. k] = {
		Pos   = v,
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = -1
	}
end

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 89,  ['tshirt_2'] = 0,
			['torso_1'] = 419,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 181,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 81,  ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 286,  ['tshirt_2'] = 1,
			['torso_1'] = 440,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 57,
			['pants_1'] = 168,   ['pants_2'] = 1,
			['shoes_1'] = 162,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 107,  ['bags_2'] = 9
		}
	},
	novice_wear = {
		male = {
			['tshirt_1'] = 89,  ['tshirt_2'] = 0,
			['torso_1'] = 419,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 181,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 81,  ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 286,  ['tshirt_2'] = 1,
			['torso_1'] = 440,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 57,
			['pants_1'] = 168,   ['pants_2'] = 1,
			['shoes_1'] = 162,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 107,  ['bags_2'] = 9
		}
	},
	master_wear = {
		male = {
			['tshirt_1'] = 89,  ['tshirt_2'] = 0,
			['torso_1'] = 419,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 181,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 81,  ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 286,  ['tshirt_2'] = 1,
			['torso_1'] = 440,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 57,
			['pants_1'] = 168,   ['pants_2'] = 1,
			['shoes_1'] = 162,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 107,  ['bags_2'] = 9
		}
	},
	expert_wear = {
		male = {
			['tshirt_1'] = 89,  ['tshirt_2'] = 0,
			['torso_1'] = 419,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 181,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 81,  ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 286,  ['tshirt_2'] = 1,
			['torso_1'] = 440,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 57,
			['pants_1'] = 168,   ['pants_2'] = 1,
			['shoes_1'] = 162,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 107,  ['bags_2'] = 9
		}
	},
	professionalist_wear = {
		male = {
			['tshirt_1'] = 90,  ['tshirt_2'] = 0,
			['torso_1'] = 419,   ['torso_2'] = 4,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 181,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 81,  ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 286,  ['tshirt_2'] = 1,
			['torso_1'] = 440,   ['torso_2'] = 4,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 57,
			['pants_1'] = 168,   ['pants_2'] = 1,
			['shoes_1'] = 162,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 107,  ['bags_2'] = 9
		}
	},
	specialist_wear = {
		male = {
			['tshirt_1'] = 90,  ['tshirt_2'] = 0,
			['torso_1'] = 419,   ['torso_2'] = 5,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 181,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 81,  ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 286,  ['tshirt_2'] = 1,
			['torso_1'] = 440,   ['torso_2'] = 5,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 57,
			['pants_1'] = 168,   ['pants_2'] = 1,
			['shoes_1'] = 162,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 107,  ['bags_2'] = 9
		}
	},
	coordinator_wear = {
		male = {
			['tshirt_1'] = 90,  ['tshirt_2'] = 0,
			['torso_1'] = 419,   ['torso_2'] = 6,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 181,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 81,  ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 286,  ['tshirt_2'] = 1,
			['torso_1'] = 440,   ['torso_2'] = 6,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 57,
			['pants_1'] = 168,   ['pants_2'] = 1,
			['shoes_1'] = 162,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 107,  ['bags_2'] = 9
		}
	},
	deputychief_wear = {
		male = {
			['tshirt_1'] = 90,  ['tshirt_2'] = 0,
			['torso_1'] = 419,   ['torso_2'] = 7,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 181,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 81,  ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 286,  ['tshirt_2'] = 1,
			['torso_1'] = 440,   ['torso_2'] = 7,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 57,
			['pants_1'] = 168,   ['pants_2'] = 1,
			['shoes_1'] = 162,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 107,  ['bags_2'] = 9
		}
	},
	chief_wear = {
		male = {
			['tshirt_1'] = 90,  ['tshirt_2'] = 0,
			['torso_1'] = 419,   ['torso_2'] = 8,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 181,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 81,  ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 286,  ['tshirt_2'] = 1,
			['torso_1'] = 440,   ['torso_2'] = 8,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 57,
			['pants_1'] = 168,   ['pants_2'] = 1,
			['shoes_1'] = 162,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 107,  ['bags_2'] = 9
		}
	},
	kombinezon_wear = {
		male = {
			['tshirt_1'] = 226,  ['tshirt_2'] = 0,
			['torso_1'] = 437,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 17,
			['pants_1'] = 44,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 81,  ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 286,  ['tshirt_2'] = 1,
			['torso_1'] = 442,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 53,
			['pants_1'] = 168,   ['pants_2'] = 1,
			['shoes_1'] = 162,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 107,  ['bags_2'] = 9
		}
	},
}