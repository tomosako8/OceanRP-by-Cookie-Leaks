Config              = {}
Config.DrawDistance = 5
Config.Size   		= {x = 2.0, y = 2.0, z = 1.0}
Config.Color  		= {r = 15, g = 163, b = 255}
Config.Type   		= 27

Config.LombardItems = {
	{
		label = "Telefon",
		price = '250',
		item = "phone",
	},
	{
		label = "Biżuteria",
		price = '5000',
		item = "bizuteria",
	},
	{
		label = "Kajdanki",
		price = '1000',
		item = "handcuff",
	},
	{
		label = "Krótkofalówka",
		price = '1000',
		item = "krotkofalowka",
	},
	{
		label = "Zestaw Naprawczy",
		price = '500',
		item = "fixkit2",
	},
	{
		label = "GoPro",
		price = '250',
		item = "gopro",
	},
	{
		label = "Zmiana rejestracji w pojeździe",
		price = '40000',
		item = "bon1",
	},
}

Config.Zones = {

	Spozywczy = {
		Blips = true,
		Blip = {
			Sprite = 52,
			Color = 11,
			Name = "24/7 Sklep",
		},
		info = 'shop247',
		Items = {
			{title = 'X-Gamer', item = 'kawa', price = 500, limit = 100},
			{title = 'Chleb', item = 'bread', price = 25, limit = 30},
			{title = 'Chipsy', item = 'chipsy', price = 30, limit = 30},
			{title = 'Ciasteczka', item = 'cupcake', price = 35, limit = 30},
			{title = 'Hamburger', item = 'hamburger', price = 40, limit = 30},
			{title = 'Czekolada', item = 'chocolate', price = 30, limit = 30},
			{title = 'Woda', item = 'water', price = 20, limit = 30},
			{title = 'CocaCola', item = 'cola', price = 30, limit = 30},
			{title = 'IceTea', item = 'icetea', price = 25, limit = 30},
			{title = 'Mleko', item = 'milk', price = 25, limit = 30},
			{title = 'Zapalniczka', item = 'zapalniczka', price = 250, limit = 5},
			{title = 'Papieros', item = 'papieros', price = 50, limit = 30},
			{title = 'Crusher', item = 'crusher', price = 200, limit = 30},
			{title = 'Bletka', item = 'bletka', price = 20, limit = 30},
			{title = 'Róża', item = 'roza', price = 300, limit = 5},
			{title = 'Kocyk', item = 'kocyk', price = 700, limit = 5},
		},
		Name = "24/7 Sklep",	
		Pos = {
			{x = 373.875,   y = 325.896,  z = 102.566},--
			{x = 2557.458,  y = 382.282,  z = 107.622},--
			{x = -3038.939, y = 585.954,  z = 6.908},--
			{x = -3241.927, y = 1001.462, z = 11.830},--
			{x = 547.431,   y = 2671.710, z = 41.156},--
			{x = 1961.464,  y = 3740.672, z = 31.343},--
			{x = 2678.916,  y = 3280.671, z = 54.241},--
			{x = 1729.216,  y = 6414.131, z = 34.037},--
			{x = 1135.808,  y = -982.281,  z = 45.415},--
			{x = -1222.915, y = -906.983,  z = 11.326},--
			{x = -1487.553, y = -379.107,  z = 39.163},--
			{x = -2968.243, y = 390.910,   z = 14.043},--
			{x = 1166.024,  y = 2708.930,  z = 37.157},--
			{x = 1392.562,  y = 3604.684,  z = 33.980},--
			{x = 25.723,   y = -1346.966, z = 28.497}, --
			{x = -48.519,   y = -1757.514, z = 28.421},--
			{x = -1076.792,   y = -2785.769, z = 28.471},--
			{x = 1163.373,  y = -323.801,  z = 68.205},--
			{x = -707.501,  y = -914.260,  z = 18.215},---
			{x = -1820.523, y = 792.518,   z = 137.118},---
			{x = 1698.388,  y = 4924.404,  z = 41.063}, -- 
			{x = 4467.88,  y = -4465.3218,  z = 3.34},--
			{x = 24.36, y = -1344.91, z = 29.48},
		}
	},

	Klub = {
		Blips = true,
		Blip = {
			Sprite = 93,
			Color = 27,
			Name = "Klub Nocny",
		},
		info = 'klub',
		Items = {
			{title = 'Piwo', item = 'beer', price = 200, limit = 30},
			{title = 'Vodka', item = 'vodka', price = 300, limit = 30},
			{title = 'Whisky', item = 'whisky', price = 500, limit = 30},
		},
		Pos = {
			{x = 129.21, y = -1283.56, z = 29.26},
			{x = -560.05,  y = 287.01,  z = 81.20},
			{x = -15.55, y = 220.35, z = 99.7}
		}
	},

	AlkoholowyDeluxe = {
		Blips = true,
		Blip = {
			Sprite = 93,
			Color = 4,
			Name = "Sklep z alkoholami",
		},
		info = 'exilerp_alkoholowykox',
		Items = {
			{title = 'Harnaś 0.5L', item = 'beer', price = 150, limit = 100},
			{title = 'Soplica 0.7L', item = 'vodka', price = 300, limit = 100},
			{title = 'Tequila 0.7L', item = 'tequila', price = 400, limit = 100},
			{title = 'Jack Daniels 0.7L', item = 'whisky', price = 600, limit = 100},
			{title = 'Shot czystej wódki 30ml', item = 'shot', price = 300, limit = 10},
			{title = 'Drink Północno-Amerykański', item = 'drink', price = 350, limit = 10},
			{title = 'Szklanka Burbonu', item = 'burbon', price = 400, limit = 10},
			{title = 'Butelka Cydru', item = 'cydr', price = 450, limit = 10},
			{title = 'Koniak 200ml', item = 'koniak', price = 500, limit = 10},
		},
		Pos = {
			{x = -818.78646,  y = -575.2828,  z = 29.3263},
			{x = 287.0104,  y = 137.1539,  z = 103.3489},
			{x = -1040.4861, y = -1475.2366,  z = 4.6266}

		}
	},

	Stragan = {
		Blips = true,
		Blip = {
			Sprite = 514,
			Color = 25,
			Name = "Stragan",
		},
		info = 'stragan',
		Items = {
			{title = 'Jabłko', item = 'jablko', price = 20, limit = 150},
			{title = 'Pomarańcza', item = 'pomarancza', price = 20, limit = 150},
			{title = 'Mandarynka', item = 'mandarynka', price = 15, limit = 150},
			{title = 'Winogrono', item = 'winogrono', price = 5, limit = 150},
			{title = 'Brzoskwinia', item = 'brzoskwinia', price = 25, limit = 150},
			{title = 'Cytryna', item = 'cytryna', price = 18, limit = 150},
		},
		Pos = {
			{x = 1476.4946,  y = 2724.4111,  z = 36.6284},
			{x = -1043.9531,  y = 5327.4683,  z = 43.6239},
			{x = 1087.72, y = 6509.83, z = 21.06},
			{x = 1168.7771, y = -426.2951, z = 66.1457},
			{x = -1194.39, y = -1543.94, z = 4.37}
		}
	},


	Techniczny = {
		Blips = true,
		Blip = {
			Sprite = 52,
			Color = 6,
			Name = "Hurtownia",
		},
		info = 'hurtownia',
		Items = {
			{title = 'Kajdanki', item = 'handcuff', price = 10000, limit = 5},
			{title = 'Zestaw naprawczy', item = 'fixkit2', price = 3000, limit = 5},
			{title = 'Wytrych', item = 'blowpipe', price = 7500, limit = 5},
			{title = 'Lornetka', item = 'lornetka', price = 5000, limit = 5},
			{title = 'Worek', item = 'worek', price = 2000, limit = 5},
			{title = 'Krótkofalówka', item = 'krotkofalowka', price = 10000, limit = 5},
			{title = 'Skarpeta na głowe', item = 'skarpetka', price = 2000, limit = 5},
			{title = 'Worek', item = 'worek', price = 2000, limit = 5},
		},
		Pos = {
			{x = 46.44,   y = -1749.56, z = 28.68},
			{x = 2747.74,   y = 3473.0, z = 54.70},
			{x = -57.3203,   y = 6523.5781, z = 30.54086523}
		}
	},

	Magazynki = {
		Blips = false,
		Blip = {
			Sprite = 93,
			Color = 26,
			Name = "",
		},
		Items = {
			{title = 'Magazynek do Pistoletu', item = 'clip', price = 5000, limit = 100},
		},
		Pos = {
			{x = 12.08, y = -1106.96, z = 29.79},
			{x = -331.17, y = 6079.22, z = 31.45},
			{x = 1692.92, y = 3755.21, z = 34.7},
		}
	},

	Multimedialny = {
		Blips = true,
		Blip = {
			Sprite = 459,
			Color = 30,
			Name = "Operator komórkowy",			
		},
		info = 'phone',
		Items = {
			{title = 'iPhone 14 Pro Max Grafitowy', item = 'classic_phone', price = 1500, limit = 5},
			{title = 'Karta SIM', item = 'sim_card', price = 1000, limit = 5},
		},
		Pos = {
			{x = 148.71, y = -234.75, z = 53.45},
		}
	},

	Wiezienie = {
		Blips = false,
		Blip = {},
		Items = {
			{title = 'Woda', item = 'water', price = 30, limit = 30},
			{title = 'Chleb', item = 'bread', price = 30, limit = 30},
		},
		Pos = {
			{x = 1653.75,   y = 2543.41, z = 44.60}
		}
	},

	Lombard = {
		Blips = true,
		Blip = {
			Sprite = 617,
			Color = 3,
			Name = "Lombard",
		},
		Items = {},
		Pos = {
			{x = -624.63,  y = -231.77,  z = 37.26}
		}
	},

	darkshop = {
		Blips = false,
		Blip = {},
		Items = {
			{title = 'Urządzenie hakerskie', item = 'urzadzenie', price = 30000, limit = 5},
			{title = 'Magazynek do broni', item = 'clip', price = 5000, limit = 100},
			{title = 'Powiększony magazynek', item = 'clip_extended', price = 40000, limit = 5},
			{title = 'Tłumik', item = 'suppressor', price = 90000, limit = 5},
			{title = 'Wiertło', item = 'drill', price = 12000, limit = 5},
			{title = 'Wiertło II Generacji', item = 'drill2', price = 50000, limit = 5},
			{title = 'Kamizelka 25%', item = 'kamzasmall', price = 20000, limit = 10},
			{title = 'Kamizelka 50%', item = 'kamzaduza', price = 40000, limit = 10},
		},
		Pos = {
			{x = -1106.64, y = -1639.78, z = 3.7}
		}
	},

 }