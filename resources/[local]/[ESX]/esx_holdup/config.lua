Config = {}
Config.Locale = 'pl'
Config.MaxDistance = 20

Config.typeNapad = {
	['sejf'] = {
		drill = true,
		secondsRemaining = 400,
		cops = 3,
	},
	['muzeum'] = {
		drill = true,
		secondsRemaining = 400,
		cops = 5,
	},
	['bank'] = {
		drill = true,
		secondsRemaining = 500,
		cops = 4,
	},
	['yacht'] = {
		drill = true,
		secondsRemaining = 500,
		cops = 5,
	},
	['humanelabs'] = {
		drill = true,
		secondsRemaining = 600,
		cops = 8,
	},
	['zbrojownia'] = {
		drill = true,
		secondsRemaining = 600,
		cops = 8,
	},
	['bazawojskowa'] = {
		drill2 = true,
		secondsRemaining = 800,
		cops = 10,
	},
	['magazyn'] = {
		drill = true,
		secondsRemaining = 700,
		cops = 10,
	},
}

Stores = {
	["fleeca"] = {
		position = {x = 148.51, y = -1050.36, z = 29.46}, --- zrobione
		reward = math.random(80000, 140000),
		requiredItems = {
			{
				item = "dysk",
				label = "Dysk z danymi"
			}
		},
		secondChance = 100,
		secondRewards = {
			{
				chance = 100,
				item = 'laptop',
				label = "Zaszyfrowany laptop",
				count = 1
			},
			{
				chance = 100,
				item = 'kawa',
				label = "X-Gamer",
				count = 10
			},
		},
		name = "Fleeca Bank",
		blip = {
			id = 500,
			scale = 0.6,
			color = 49,
			label = 'Napad na Bank',
		},	
		type = 'bank',
		delay = {
			success = 1000,
			failure = 60,
		},
	},
	["fleeca2"] = {
		position = {x = -2953.01, y = 484.36, z = 15.79}, ----- Zrobione
		reward = math.random(80000, 140000),
		requiredItems = {
			{
				item = "dysk",
				label = "Dysk z danymi"
			}
		},
		secondChance = 100,
		secondRewards = {
			{
				chance = 100,
				item = 'laptop',
				label = "Zaszyfrowany laptop",
				count = 1
			},
			{
				chance = 100,
				item = 'kawa',
				label = "X-Gamer",
				count = 10
			},
		},
		name = "Fleeca Bank",
		blip = {
			id = 500,
			scale = 0.6,
			color = 49,
			label = 'Napad na Bank',
		},	
		type = 'bank',
		delay = {
			success = 1000,
			failure = 60,
		},
	},
	["blainecounty"] = {
		position = {x = -103.69, y = 6477.89, z = 31.72}, ---- zrobione
		reward = math.random(80000, 140000),
		requiredItems = {
			{
				item = "dysk",
				label = "Dysk z danymi"
			}
		},
		secondChance = 100,
		secondRewards = {
			{
				chance = 100,
				item = 'laptop',
				label = "Zaszyfrowany laptop",
				count = 1
			},
			{
				chance = 100,
				item = 'kawa',
				label = "X-Gamer",
				count = 10
			},
		},
		name = "Blaine County Savings Bank",
		blip = {
			id = 500,
			scale = 0.6,
			color = 49,
			label = 'Napad na Bank',
		},	
		type = 'bank',
		delay = {
			success = 1000,
			failure = 60,
		},
	},
	["Route68Bank"] = {
		position = {x = 1172.94, y = 2716.35, z = 38.19}, ---- zrobione
		reward = math.random(80000, 140000),
		requiredItems = {
			{
				item = "dysk",
				label = "Dysk z danymi"
			}
		},
		secondChance = 100,
		secondRewards = {
			{
				chance = 100,
				item = 'laptop',
				label = "Zaszyfrowany laptop",
				count = 1
			},
			{
				chance = 100,
				item = 'kawa',
				label = "X-Gamer",
				count = 10
			},
		},
		name = "Fleeca Bank",
		blip = {
			id = 500,
			scale = 0.6,
			color = 49,
			label = 'Napad na Bank',
		},		
		type = 'bank',
		delay = {
			success = 1000,
			failure = 60,
		},
	},
	["EVinewoodBank"] = {
		position = {x = 312.59, y = -288.75, z = 54.27}, ---- zroione
		reward = math.random(80000, 140000),
		requiredItems = {
			{
				item = "dysk",
				label = "Dysk z danymi"
			}
		},
		secondChance = 100,
		secondRewards = {
			{
				chance = 100,
				item = 'laptop',
				label = "Zaszyfrowany laptop",
				count = 1
			},
			{
				chance = 100,
				item = 'kawa',
				label = "X-Gamer",
				count = 10
			},
		},
		name = "Fleeca Bank",
		blip = {
			id = 500,
			scale = 0.6,
			color = 49,
			label = 'Napad na Bank',
		},	
		type = 'bank',
		delay = {
			success = 1000,
			failure = 60,
		},
	},
	["WVinewoodBank2"] = {
		position = { x = -354.32, y = -54.02, z = 49.14 },
		reward = math.random(80000, 140000),
		requiredItems = {
			{
				item = "dysk",
				label = "Dysk z danymi"
			}
		},
		secondChance = 100,
		secondRewards = {
			{
				chance = 100,
				item = 'laptop',
				label = "Zaszyfrowany laptop",
				count = 1
			},
			{
				chance = 100,
				item = 'kawa',
				label = "X-Gamer",
				count = 20
			},
		},
		name = "Fleeca Bank",
		blip = {
			id = 500,
			scale = 0.6,
			color = 49,
			label = 'Napad na Bank',
		},	
		type = 'bank',
		delay = {
			success = 1000,
			failure = 60,
		},
	},
	
	
	--SEJFY 50-80kk


	["jubiler"] = {
		position = { x = -619.72, y = -229.08, z = 38.05 },
		reward = math.random(90000, 150000),
		requiredItems = {
			{
				item = "pendrive",
				label = "Pendrive"
			}
		},
		secondChance = 100,
		secondRewards = {
			{
				chance = 100,
				item = 'dysk',
				label = "Dysk z danymi",
				count = 1
			},
			{
				chance = 100,
				item = 'kawa',
				label = "X-Gamer",
				count = 20
			},
		},
		name = "Jubiler",
		blip = {
			id = 615,
			scale = 0.6,
			color = 49,
			label = 'Napad na Jubilera',
		},	
		type = 'sejf',
		delay = {
			success = 1000,
			failure = 60,
		},
	},

	["jubiler2"] = {
		position = { x = -613.26, y = -604.53, z = -2.4 },
		reward = math.random(150000, 300000),
		requiredItems = {
			{
				item = "pendrive",
				label = "Pendrive"
			}
		},
		secondChance = 100,
		secondRewards = {
			{
				chance = 100,
				item = 'dysk',
				label = "Dysk z danymi",
				count = 1
			},
			{
				chance = 100,
				item = 'kawa',
				label = "X-Gamer",
				count = 20
			},
		},
		name = "Muzeum",
		blip = {
			id = 616,
			scale = 0.6,
			color = 49,
			label = 'Napad na Muzeum',
		},	
		type = 'muzeum',
		delay = {
			success = 1000,
			failure = 60,
		},
	},

	["yacht1"] = {
		position = { x = -2345.42, y = -655.24, z = 13.41 },
		reward = math.random(1600000, 2100000),
		requiredItems = {
			{
				item = "zlotakarta",
				label = "Złota Karta"
			}
		},
		secondChance = 100,
		secondRewards = {
			{
				chance = 50,
				item = 'nurek_3',
				label = "strój do nurkowania",
				count = 1
			},
			{
				chance = 100,
				item = 'diamentowakarta',
				label = "Diamentowa karta",
				count = 1
			},
			{
				chance = 100,
				item = 'kawa',
				label = "X-Gamer",
				count = 50
			},
			{
				chance = 40,
				item = "snspistol_mk2",
				label = "Pistolet",
				count = 1,
			},
			{
				chance = 40,
				item = "sns_pistol",
				label = "Pukawka",
				count = 1,
			},
			{
				chance = 100,
				item = "pistol_ammo",
				label = "Amunicja do Pistoletu",
				count = 100,
			}
		},
		name = "Yacht",
		blip = {
			id = 455,
			scale = 0.8,
			color = 49,
			label = 'Napad na Yacht',
		},	
		type = 'yacht',
		delay = {
			success = 2000,
			failure = 60,
		},
	},
	
	["yacht"] = {
		position = { x = -2084.4868, y = -1014.0796, z = 5.9341 },
		reward = math.random(1600000, 2100000),
		requiredItems = {
			{
				item = "zlotakarta",
				label = "Złota Karta"
			}
		},
		secondChance = 100,
		secondRewards = {
			{
				chance = 50,
				item = 'nurek_3',
				label = "strój do nurkowania",
				count = 1
			},
			{
				chance = 100,
				item = 'diamentowakarta',
				label = "Diamentowa karta",
				count = 1
			},
			{
				chance = 100,
				item = 'kawa',
				label = "X-Gamer",
				count = 50
			},
			{
				chance = 40,
				item = "pistol",
				label = "Pistolet",
				count = 1,
			},
			{
				chance = 40,
				item = "sns_pistol",
				label = "Pukawka",
				count = 1,
			},
			{
				chance = 100,
				item = "pistol_ammo",
				label = "Amunicja do Pistoletu",
				count = 100,
			}
		},
		name = "Yacht",
		blip = {
			id = 455,
			scale = 0.8,
			color = 49,
			label = 'Napad na Yacht',
		},	
		type = 'yacht',
		delay = {
			success = 2000,
			failure = 60,
		},
	},

	["bazawojskowa"] = {
		position = { x = -2422.16, y = 3274.71, z = 32.83 },
		reward = math.random(100000, 500000),
		requiredItems = {
			{
				item = "platynowakarta",
				label = "Platynowa karta"
			}
		},
		secondChance = 100,
		secondRewards = {
			{
				chance = 100,
				item = 'gwiazdki',
				label = "Jajko Wielkanoce",
				count = 1200
			},
			{
				chance = 100,
				item = 'kawa',
				label = "X-Gamer",
				count = 150
			},
			{
				chance = 60,
				item = 'clip_extended',
				label = "Powiększony magazynek",
				count = 3
			},
			{
				chance = 60,
				item = 'scope',
				label = "Celownik",
				count = 3
			},
			{
				chance = 60,
				item = 'suppressor',
				label = "Tłumik",
				count = 3
			},
			{
				chance = 60,
				item = 'grip',
				label = "Uchwyt",
				count = 3
			},
			{
				chance = 100,
				item = 'clip',
				label = "Magazynek",
				count = 250
			},
			{
				chance = 60,
				item = 'clipsmg',
				label = "Magazynek SMG",
				count = 8
			},
			{
				chance = 60,
				item = 'extendedclip',
				label = "Magazynek Długa",
				count = 8
			},
			{
				chance = 100,
				item = 'kamzaduza',
				label = "Duża kamizelka",
				count = 4
			},
			{
				chance = 40,
				item = 'kamzaduza',
				label = "Duża kamizelka",
				count = 4
			},
			{
				chance = 50,
				item = 'pendrive',
				label = "Pendrive",
				count = 1
			},
			{
				chance = 40,
				item = 'dysk',
				label = "Dysk z danymi",
				count = 1
			},
			{
				chance = 30,
				item = 'laptop',
				label = "Zaszyfrowany Laptop",
				count = 1
			},
			{
				chance = 15,
				item = 'combatpdw',
				label = "PDW",
				count = 1
			},
			{
				chance = 15,
				item = 'compactrifle',
				label = "Mini Kałach",
				count = 1
			},
			{
				chance = 10,
				item = 'carbinerifle',
				label = "M4",
				count = 1
			},
			{
				chance = 1,
				item = 'assaultrifle',
				label = "Kałach",
				count = 1
			},
			{
				chance = 100,
				item = 'doubleaction',
				label = "Złoty Rewolwer",
				count = 2
			},
			{
				chance = 40,
				item = 'appistol',
				label = "AP Pistol",
				count = 1
			},
			{
				chance = 15,
				item = 'assaultsmg',
				label = "Famas",
				count = 1
			},
			{
				chance = 100,
				item = "pistol_ammo",
				label = "Amunicja do Pistoletu",
				count = 50,
			},
			{
				chance = 100,
				item = "smg_ammo",
				label = "Amunicja do Pistoletu",
				count = 100,
			},
			{
				chance = 100,
				item = "rifle_ammo",
				label = "Amunicja do Pistoletu",
				count = 100,
			},
			{
				chance = 20,
				item = 'zlotakarta',
				label = "Złota karta",
				count = 1
			},
			{
				chance = 20,
				item = 'diamentowakarta',
				label = "Diamentowa karta",
				count = 1
			},
		},
		name = "Baza Wojskowa",
		blip = {
			id = 563,
			scale = 0.8,
			color = 49,
			label = 'Napad na Baze Wojskową',
		},	
		type = 'bazawojskowa',
		delay = {
			success = 2000,
			failure = 60,
		},
	},

	["magazyn"] = {
		position = { x = 34.01, y = -2656.29, z = 12.04 },
		reward = math.random(3700000, 4400000),
		requiredItems = {
			{
				item = "diamentowakarta",
				label = "Diamentowa karta"
			}
		},
		secondChance = 100,
		secondRewards = {
			{
				chance = 100,
				item = 'gwiazdki',
				label = "Jajko Wielkanoce",
				count = 1000
			},
			{
				chance = 100,
				item = 'kawa',
				label = "X-Gamer",
				count = 100
			},
			{
				chance = 50,
				item = 'clip_extended',
				label = "Powiększony magazynek",
				count = 2
			},
			{
				chance = 50,
				item = 'scope',
				label = "Celownik",
				count = 2
			},
			{
				chance = 50,
				item = 'suppressor',
				label = "Tłumik",
				count = 2
			},
			{
				chance = 50,
				item = 'grip',
				label = "Uchwyt",
				count = 2
			},
			{
				chance = 100,
				item = 'clip',
				label = "Magazynek",
				count = 180
			},
			{
				chance = 60,
				item = 'clipsmg',
				label = "Magazynek SMG",
				count = 5
			},
			{
				chance = 60,
				item = 'extendedclip',
				label = "Magazynek Długa",
				count = 5
			},
			{
				chance = 100,
				item = 'kamzaduza',
				label = "Duża kamizelka",
				count = 3
			},
			{
				chance = 40,
				item = 'kamzaduza',
				label = "Duża kamizelka",
				count = 3
			},
			{
				chance = 100,
				item = 'platynowakarta',
				label = "Platynowa karta",
				count = 1
			},
			{
				chance = 10,
				item = 'smg',
				label = "SMG",
				count = 1
			},
			{
				chance = 10,
				item = 'combatpdw',
				label = "PDW",
				count = 1
			},
			{
				chance = 10,
				item = 'compactrifle',
				label = "Mini Kałach",
				count = 1
			},
			{
				chance = 50,
				item = 'doubleaction',
				label = "Złoty Rewolwer",
				count = 1
			},
			{
				chance = 100,
				item = "pistol_ammo",
				label = "Amunicja do Pistoletu",
				count = 50,
			},
			{
				chance = 100,
				item = "smg_ammo",
				label = "Amunicja do Pistoletu",
				count = 100,
			},
			{
				chance = 100,
				item = "rifle_ammo",
				label = "Amunicja do Pistoletu",
				count = 100,
			},
			{
				chance = 100,
				item = 'drill2',
				label = "Wiertło Drugiej Generacji",
				count = 1
			}
		},
		name = "Magazyn",
		blip = {
			id = 549,
			scale = 1.0,
			color = 49,
			label = 'Napad na Magazyn',
		},	
		type = 'magazyn',
		delay = {
			success = 2000,
			failure = 60,
		},
	},
	
	--Human 1,4-2,1
	["HumaneLabs"] = {
		position = { x = 3537.7297, y = 3659.6885, z = 28.1719 },
		reward = math.random(2900000, 3500000),
		name = "Humane Labs",
		requiredItems = {
			{
				item = "zlotakarta",
				label = "Złota karta"
			}
		},
		secondChance = 100,
		secondRewards = {
			{
				chance = 100,
				item = 'gwiazdki',
				label = "Jajko Wielkanoce",
				count = 800
			},
			{
				chance = 100,
				item = 'diamentowakarta',
				label = "Diamentowa karta",
				count = 1
			},
			{
				chance = 100,
				item = 'kawa',
				label = "X-Gamer",
				count = 80
			},
			{
				chance = 35,
				item = 'clip_extended',
				label = "Powiększony magazynek",
				count = 1
			},
			{
				chance = 35,
				item = 'scope',
				label = "Celownik",
				count = 1
			},
			{
				chance = 35,
				item = 'suppressor',
				label = "Tłumik",
				count = 1
			},
			{
				chance = 35,
				item = 'grip',
				label = "Uchwyt",
				count = 1
			},
			{
				chance = 100,
				item = 'clip',
				label = "Magazynek",
				count = 140
			},
			{
				chance = 50,
				item = 'clipsmg',
				label = "Magazynek SMG",
				count = 3
			},
			{
				chance = 50,
				item = 'extendedclip',
				label = "Magazynek Długa",
				count = 3
			},
			{
				chance = 100,
				item = 'kamzaduza',
				label = "Duża kamizelka",
				count = 1
			},
			{
				chance = 50,
				item = 'machinepistol',
				label = "Pistolet Maszynowy",
				count = 1
			},
			{
				chance = 100,
				item = "pistol_ammo",
				label = "Amunicja do Pistoletu",
				count = 50,
			},
			{
				chance = 100,
				item = "smg_ammo",
				label = "Amunicja do Pistoletu",
				count = 100,
			},
		},
		blip = {
			id = 499,
			scale = 0.8,
			color = 49,
			label = 'Napad na Humane Labs',
		},	
		type = 'humanelabs',
		delay = {
			success = 2800,
			failure = 60,
		},
	},

	["ZbrojowniaSASP"] = {
		position = { x = 569.08, y = -3124.75, z = 18.76 },
		reward = math.random(2900000, 3500000),
		name = "Zbrojownia",
		requiredItems = {
			{
				item = "zlotakarta",
				label = "Złota Karta"
			}
		},
		secondChance = 100,
		secondRewards = {
			{
				chance = 100,
				item = 'gwiazdki',
				label = "Jajko Wielkanoce",
				count = 800
			},
			{
				chance = 100,
				item = 'diamentowakarta',
				label = "Diamentowa karta",
				count = 1
			},
			{
				chance = 100,
				item = 'kawa',
				label = "X-Gamer",
				count = 80
			},
			{
				chance = 35,
				item = 'clip_extended',
				label = "Powiększony magazynek",
				count = 1
			},
			{
				chance = 35,
				item = 'scope',
				label = "Celownik",
				count = 1
			},
			{
				chance = 35,
				item = 'suppressor',
				label = "Tłumik",
				count = 1
			},
			{
				chance = 35,
				item = 'grip',
				label = "Uchwyt",
				count = 1
			},
			{
				chance = 100,
				item = 'clip',
				label = "Magazynek",
				count = 140
			},
			{
				chance = 50,
				item = 'clipsmg',
				label = "Magazynek SMG",
				count = 3
			},
			{
				chance = 50,
				item = 'extendedclip',
				label = "Magazynek Długa",
				count = 3
			},
			{
				chance = 100,
				item = 'kamzaduza',
				label = "Duża kamizelka",
				count = 1
			},
			{
				chance = 50,
				item = 'machinepistol',
				label = "Pistolet Maszynowy",
				count = 1
			},
			{
				chance = 100,
				item = "pistol_ammo",
				label = "Amunicja do Pistoletu",
				count = 50,
			},
			{
				chance = 100,
				item = "smg_ammo",
				label = "Amunicja do Pistoletu",
				count = 100,
			},
		},
		blip = {
			id = 556,
			scale = 0.8,
			color = 49,
			label = 'Napad na Zbrojownie',
		},	
		type = 'zbrojownia',
		delay = {
			success = 2600,
			failure = 60,
		},
	},
	-- 50-75
	["Casino"] = {
		position = { x = 1000.7908, y = 66.3221, z = 59.87 },
		reward = math.random(700000, 1100000),
		requiredItems = {
            {
                item = "pendrive",
                label = "Pendrive"
            }
		},
		secondChance = 100,
		secondRewards = {
			{
				chance = 100,
				item = 'dysk',
				label = "Dysk z danymi",
				count = 1
			},
			{
				chance = 100,
				item = 'kawa',
				label = "X-Gamer",
				count = 20
			},
		},
		name = "Casino",
		blip = {
			id = 674,
			scale = 0.8,
			color = 49,
			label = 'Napad na Casino Royale',
		},	
		type = 'sejf',
		delay = {
			success = 1000,
			failure = 60,
		},
	},
	
	--Pacyfik 800-1,115
	["Pacyfik"] = {
		position = { x = 254.238, y = 225.5682, z = 101.8257 },
		reward = math.random(50000, 700000),
		requiredItems = {
			{
				item = "laptop",
				label = "Zaszyfrowany laptop"
			}
		},
		secondChance = 100,
		secondRewards = {
			{
				chance = 100,
				item = 'zlotakarta',
				label = "Złota karta",
				count = 1
			},
			{
				chance = 100,
				item = 'kawa',
				label = "X-Gamer",
				count = 40
			},
		},
		name = "Pacific Bank",
		blip = {
			id = 500,
			scale = 0.6,
			color = 49,
			label = 'Napad na Bank',
		},	
		type = 'yacht',
		delay = {
			success = 1000,
			failure = 60,
		},

	},
}
