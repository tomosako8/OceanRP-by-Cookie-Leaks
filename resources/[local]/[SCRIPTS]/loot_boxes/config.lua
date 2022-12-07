Config = {}

-- [[ MARKERY/BLIPY ]] --
Config.DrawDistance = 5
Config.Size         = { x = 2, y = 2, z = 0.5 }
Config.Color        = {r = 0, g = 128, b = 255}
Config.Type         = 27
Config.Zones = {}
Config.Blips = {}

-- [[ WYMAGANA ILOSC ]] --
Config.RequiredLegalCase1 = 200
Config.RequiredLegalCase2 = 400
Config.RequiredLegalCase3 = 800
Config.RequiredLegalCase4 = 1500
Config.RequiredIllLegalCase1 = 200
Config.RequiredIllLegalCase2 = 400
Config.RequiredIllLegalCase3 = 800
Config.RequiredIllLegalCase4 = 1500

-- [[ SKRZYNKI ]] --
Config["image_source"] = "nui://loot_boxes/img/items/"

Config["chance"] = {
	[1] = { name = "Zwykła", rate = 52 },
	[2] = { name = "Rzadka", rate = 28 },
	[3] = { name = "Epicka", rate = 13 },
	[4] = { name = "Wyjątkowa", rate = 6 },
	[5] = { name = "Legendarna", rate = 1 },
}

Config["exilecases"] = {
	["legalna"] = { 
        name = "Legal Chest",
        list = {
			{ money = 1000000, tier = 1 },
			{ item = "bon1", amount= 2, tier = 1 }, ---Zmiana rejestracji w pojeździe---
			{ item = "bon17", amount= 1, tier = 1 }, ---Zniżka 25% na tuning do auta---
			{ money = 300000, tier = 2 },
			{ item = "bon2", amount= 1, tier = 2 }, ---Zniżka 50% na tuning do auta---
			{ item = "bon4", amount= 1, tier = 2 }, ---Zniżka do brokera 20%---
			{ item = "bon1", amount= 5, tier = 2 }, ---Zmiana rejestracji w pojeździe---
			{ item = "legalna", amount= 1, tier = 2 },
			{ item = "crimowa", amount= 1, tier = 2 },
			{ money = 700000, tier = 3 },
			{ item = "bon6", amount= 1, tier = 3 }, ---Zniżka 40% do brokera---
			{ item = "bon7", amount= 1, tier = 3 }, ---Bon na darmowy tuning do auta---
			{ item = "legalna", amount= 2, tier = 3 },
			{ item = "crimowa", amount= 2, tier = 3 },
			{ item = "legalna", amount= 2, tier = 3 },
			{ money = 150000, tier = 4 },
			{ item = "bon9", amount= 1, tier = 4 }, ---Zniżka 50% do brokera---
			{ item = "bon10", amount= 1, tier = 4 }, ---Skrócenie bana o 24h---
			{ money = 200000, tier = 5 },
			{ item = "bon15", amount= 1, tier = 4 }, ---Skrócenie bana o 72h---			
        }
    },
	["crimowa"] = { 
        name = "Illegal Chest",
        list = {
			{ black_money = 150000, tier = 1 },
			{ black_money = 150000, tier = 1 },
			{ item = "clip", amount= 100, tier = 1 },
			{ item = "clipsmg", amount= 20, tier = 1 },
			{ item = "extendedclip", amount= 15, tier = 1 },
			{ item = "kawa", amount= 100, tier = 1 },
			{ item = "krotkofalowka", amount= 50, tier = 1 },
			{ weapon = "WEAPON_SNSPISTOL_MK2", amount= 5, tier = 1 },
			{ weapon = "WEAPON_VINTAGEPISTOL", amount= 5, tier = 1 },
			{ item = "kamzasmall", amount= 10, tier = 1 },
			{ item = "kamzaduza", amount= 5, tier = 1 },
			{ item = "meth_pooch", amount= 200, tier = 1 },
			{ black_money = 350000, tier = 2 },
			{ weapon = "WEAPON_SNSPISTOL_MK2", amount= 10, tier = 2 },
			{ weapon = "WEAPON_VINTAGEPISTOL", amount= 15, tier = 2 },
			{ item = "opium_pooch", amount= 200, tier = 2 },
			{ item = "kamzaduza", amount= 10, tier = 2 },
			{ item = "kamzasmall", amount= 20, tier = 2 },
			{ item = "clip_extended", amount= 14, tier = 2 },
			{ item = "crimowa", amount= 1, tier = 2 },
			{ item = "legalna", amount= 1, tier = 2 },
			{ black_money = 800000, tier = 3 },
			{ weapon = "WEAPON_MICROSMG", amount= 1, tier = 3 },
			{ weapon = "WEAPON_MINISMG", amount= 1, tier = 3 },
			{ item = "crimowa", amount= 2, tier = 3 },
			{ item = "legalna", amount= 2, tier = 3 },
			{ black_money = 1500000, tier = 4 },
			{ item = "bon10", amount= 1, tier = 4 }, ---Skrócenie bana o 24h---
			{ black_money = 2500000, tier = 5 },
			{ item = "bon15", amount= 1, tier = 5 }, ---Skrócenie bana o 72h---
        }
    },
	["weaponchest"] = { 
        name = "Weapon Chest",
        list = {
		{ weapon = "WEAPON_PISTOL_MK2", amount= 20, tier = 1 },
		{ weapon = "WEAPON_SNSPISTOL_MK2", amount= 20, tier = 1 },
		{ weapon = "WEAPON_CERAMICPISTOL", amount= 20, tier = 1 },
		{ weapon = "WEAPON_DOUBLEACTION", amount= 5, tier = 1 },
		{ weapon = "WEAPON_SMG_MK2", amount= 1, tier = 2 },
		{ weapon = "WEAPON_MICROSMG", amount= 2, tier = 2 },
		{ weapon = "WEAPON_MACHINEPISTOL", amount= 2, tier = 2 },
		{ weapon = "WEAPON_GUSENBERG", amount= 2, tier = 3 },
		{ weapon = "WEAPON_COMPACTRIFLE", amount= 2, tier = 3 },
		{ weapon = "WEAPON_ASSAULTSMG", amount= 1, tier = 3 },
		{ weapon = "WEAPON_APPISTOL", amount= 3, tier = 3 },
		{ weapon = "WEAPON_CARBINERIFLE", amount= 1, tier = 4 },
		{ weapon = "WEAPON_ASSAULTRIFLE", amount= 1, tier = 4 },
		{ weapon = "WEAPON_HEAVYSNIPER", amount= 1, tier = 5 },
		{ weapon = "WEAPON_PUMPSHOTGUN", amount= 1, tier = 5 },
		{ weapon = "WEAPON_DBSHOTGUN", amount= 1, tier = 5 },
		{ weapon = "WEAPON_SAWNOFFSHOTGUN", amount= 1, tier = 5 },
        }
    },
	["carchest"] = { 
        name = "Car Chest",
        list = {
		{ money = 100000, tier = 1 },
		{ item = "bon17", amount= 1, tier = 1 }, ---Zniżka 25% na tuning do auta---	
		{ item = "bon1", amount= 2, tier = 1 }, ---Zmiana rejestracji w aucie---	
		{ item = "bon4", amount= 1, tier = 2 }, ---Zniżka do brokera 20%---	
		{ item = "bon1", amount= 4, tier = 2 }, ---Zmiana rejestracji w aucie---
		{ item = "bon2", amount= 1, tier = 2 }, ---Zniżka 50% na tuning do auta---
		{ money = 300000, tier = 2 },
		{ money = 700000, tier = 3 },
		{ item = "bon19", amount= 1, tier = 3 }, ---Ubranie z wybraną przez ciebie grafiką---	
		{ item = "bon6", amount= 1, tier = 3 }, ---Zniżka 40% do brokera---
		{ item = "bon7", amount= 2, tier = 3 }, ---Bon na darmowy tuning do auta---
		{ item = "bon10", amount= 1, tier = 3 }, ---Skrócenie bana o 24h---
		{ item = "bon15", amount= 1, tier = 4 }, ---Skrócenie bana o 72h---	
		{ item = "bon7", amount= 3, tier = 4 }, ---Darmowy Full Tune do auta---	
		{ item = "bon21", amount= 1, tier = 4 }, ---Dowolne auto car dealera---
		{ money = 1200000, tier = 4 },
		}
	},
}