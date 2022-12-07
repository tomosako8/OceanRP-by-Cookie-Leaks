Config               = {}

Config.DrawDistance  = 5
Config.Size          = { x = 2.0, y = 2.0, z = 0.5 }
Config.Color         = { r = 0, g = 0, b = 0 }
Config.Type          = 23
Config.Locale        = 'en'

Config.LicenseEnable = true
Config.LicensePrice  = 5000

Config.RealWeapons = {

	{name = 'WEAPON_KNIFE', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'melee', 		model = 'prop_w_me_knife_01'},
	{name = 'WEAPON_NIGHTSTICK', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'melee', 		model = 'w_me_nightstick'},
	{name = 'WEAPON_HAMMER', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'melee', 		model = 'prop_tool_hammer'},
	{name = 'WEAPON_BAT', 				bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'melee', 		model = 'w_me_bat'},
	{name = 'WEAPON_GOLFCLUB', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'melee', 		model = 'w_me_gclub'},
	{name = 'WEAPON_CROWBAR', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'melee', 		model = 'w_me_crowbar'},
	{name = 'WEAPON_BOTTLE', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'melee', 		model = 'prop_w_me_bottle'},
	{name = 'WEAPON_KNUCKLE', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'melee', 		model = 'prop_w_me_dagger'},
	{name = 'WEAPON_HATCHET', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'melee', 		model = 'w_me_hatchet'},
	{name = 'WEAPON_MACHETE', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'melee', 		model = 'prop_ld_w_me_machette'},
	{name = 'WEAPON_SWITCHBLADE', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'melee', 		model = 'prop_w_me_dagger'},
	{name = 'WEAPON_FLASHLIGHT', 		bone = 24818, x = 0.0, y = 0.0, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'melee', 		model = 'w_me_flashlight'},

	{name = 'WEAPON_PISTOL', 			bone = 51826, x = -0.01, y = 0.10, z = 0.07,  xRot = -115.0, yRot = 0.0,  zRot = 0.0, category = 'handguns', 	model = 'w_pi_pistol'},
	{name = 'WEAPON_COMBATPISTOL', 		bone = 51826, x = -0.01, y = 0.10, z = 0.07,  xRot = -115.0, yRot = 0.0,  zRot = 0.0, category = 'handguns', 	model = 'w_pi_combatpistol'},
	{name = 'WEAPON_APPISTOL', 			bone = 51826, x = -0.01, y = 0.10, z = 0.07,  xRot = -115.0, yRot = 0.0,  zRot = 0.0, category = 'handguns', 	model = 'w_pi_appistol'},
	{name = 'WEAPON_PISTOL50', 			bone = 51826, x = -0.01, y = 0.10, z = 0.07,  xRot = -115.0, yRot = 0.0,  zRot = 0.0, category = 'handguns', 	model = 'w_pi_pistol50'},
	{name = 'WEAPON_VINTAGEPISTOL', 	bone = 51826, x = -0.01, y = 0.10, z = 0.07,  xRot = -115.0, yRot = 0.0,  zRot = 0.0, category = 'handguns', 	model = 'w_pi_vintage_pistol'},
	{name = 'WEAPON_HEAVYPISTOL', 		bone = 51826, x = -0.01, y = 0.10, z = 0.07,  xRot = -115.0, yRot = 0.0,  zRot = 0.0, category = 'handguns', 	model = 'w_pi_heavypistol'},
	{name = 'WEAPON_SNSPISTOL', 		bone = 58271, x = -0.01, y = 0.1,  z = -0.07, xRot = -55.0,  yRot = 0.10, zRot = 0.0, category = 'handguns', 	model = 'w_pi_sns_pistol'},
	{name = 'WEAPON_FLAREGUN', 			bone = 58271, x = -0.01, y = 0.1,  z = -0.07, xRot = -55.0,  yRot = 0.10, zRot = 0.0, category = 'handguns', 	model = 'w_pi_flaregun'},
	{name = 'WEAPON_MARKSMANPISTOL', 	bone = 58271, x = -0.01, y = 0.1,  z = -0.07, xRot = -55.0,  yRot = 0.10, zRot = 0.0, category = 'handguns', 	model = ''},
	{name = 'WEAPON_REVOLVER', 			bone = 58271, x = -0.01, y = 0.1,  z = -0.07, xRot = -55.0,  yRot = 0.10, zRot = 0.0, category = 'handguns', 	model = ''},
	{name = 'WEAPON_STUNGUN', 			bone = 58271, x = -0.01, y = 0.1,  z = -0.07, xRot = -55.0,  yRot = 0.10, zRot = 0.0, category = 'handguns', 	model = 'w_pi_stungun'},

	{name = 'WEAPON_MICROSMG', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'machine', 	model = 'w_sb_microsmg'},
	{name = 'WEAPON_SMG', 				bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 155.0, zRot = 0.0, category = 'machine', 	model = 'w_sb_smg'},
	{name = 'WEAPON_MG', 				bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 155.0, zRot = 0.0, category = 'machine', 	model = 'w_mg_mg'},
	{name = 'WEAPON_COMBATMG', 			bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 155.0, zRot = 0.0, category = 'machine', 	model = 'w_mg_combatmg'},
	{name = 'WEAPON_GUSENBERG', 		bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 155.0, zRot = 0.0, category = 'machine', 	model = 'w_sb_gusenberg'},
	{name = 'WEAPON_COMBATPDW', 		bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 155.0, zRot = 0.0, category = 'machine', 	model = ''},
	{name = 'WEAPON_MACHINEPISTOL', 	bone = 24818, x = -0.01, y = 0.10, z = 0.07,  xRot = -115.0, yRot = 0.0,  zRot = 0.0, category = 'machine', 	model = ''},
	{name = 'WEAPON_ASSAULTSMG', 		bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 155.0, zRot = 0.0, category = 'machine', 	model = 'w_sb_assaultsmg'},
	{name = 'WEAPON_MINISMG', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'machine', 	model = ''},
	
	{name = 'WEAPON_ASSAULTRIFLE', 		bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 155.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_assaultrifle'},
	{name = 'WEAPON_CARBINERIFLE', 		bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 155.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_carbinerifle'},
	{name = 'WEAPON_ADVANCEDRIFLE', 	bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 155.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_advancedrifle'},
	{name = 'WEAPON_SPECIALCARBINE', 	bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 155.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_specialcarbine'},
	{name = 'WEAPON_BULLPUPRIFLE', 		bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 155.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_bullpuprifle'},
	{name = 'WEAPON_COMPACTRIFLE', 		bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 155.0, zRot = 0.0, category = 'assault', 	model = ''},

	{name = 'WEAPON_PUMPSHOTGUN', 		bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 135.0, zRot = 0.0, category = 'shotgun', 	model = 'w_sg_pumpshotgun'},
	{name = 'WEAPON_SAWNOFFSHOTGUN', 	bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'shotgun', 	model = ''},
	{name = 'WEAPON_BULLPUPSHOTGUN', 	bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 135.0, zRot = 0.0, category = 'shotgun', 	model = 'w_sg_bullpupshotgun'},
	{name = 'WEAPON_ASSAULTSHOTGUN', 	bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'shotgun', 	model = 'w_sg_assaultshotgun'},
	{name = 'WEAPON_MUSKET', 			bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 135.0, zRot = 0.0, category = 'shotgun', 	model = 'w_ar_musket'},
	{name = 'WEAPON_HEAVYSHOTGUN', 		bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 225.0, zRot = 0.0, category = 'shotgun', 	model = 'w_sg_heavyshotgun'},
	{name = 'WEAPON_DBSHOTGUN', 		bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'shotgun', 	model = ''},
	{name = 'WEAPON_AUTOSHOTGUN', 		bone = 24818, x = 0.1, y = 0.15, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'shotgun', 	model = ''},

	{name = 'WEAPON_SNIPERRIFLE', 		bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 135.0, zRot = 0.0, category = 'sniper', 	model = 'w_sr_sniperrifle'},
	{name = 'WEAPON_HEAVYSNIPER', 		bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 135.0, zRot = 0.0, category = 'sniper', 	model = 'w_sr_heavysniper'},
	{name = 'WEAPON_MARKSMANRIFLE', 	bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 135.0, zRot = 0.0, category = 'sniper', 	model = 'w_sr_marksmanrifle'},

	{name = 'WEAPON_REMOTESNIPER', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'none', 		model = ''},
	{name = 'WEAPON_STINGER', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'none', 		model = ''},

	{name = 'WEAPON_GRENADELAUNCHER', 	bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'heavy', 		model = 'w_lr_grenadelauncher'},
	{name = 'WEAPON_RPG', 				bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'heavy', 		model = 'w_lr_rpg'},
	{name = 'WEAPON_MINIGUN', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'heavy', 		model = 'w_mg_minigun'},
	{name = 'WEAPON_FIREWORK', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'heavy', 		model = 'w_lr_firework'},
	{name = 'WEAPON_RAILGUN', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'heavy', 		model = 'w_ar_railgun'},
	{name = 'WEAPON_HOMINGLAUNCHER', 	bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'heavy', 		model = 'w_lr_homing'},
	{name = 'WEAPON_COMPACTLAUNCHER', 	bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'heavy', 		model = ''},

	{name = 'WEAPON_STICKYBOMB', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'thrown', 	model = 'prop_bomb_01_s'},
	{name = 'WEAPON_MOLOTOV', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'thrown', 	model = 'w_ex_molotov'},
	{name = 'WEAPON_FIREEXTINGUISHER', 	bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'thrown', 	model = 'w_am_fire_exting'},
	{name = 'WEAPON_PETROLCAN', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'thrown', 	model = 'w_am_jerrycan'},
	{name = 'WEAPON_PROXMINE', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'thrown', 	model = ''},
	{name = 'WEAPON_SNOWBALL', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'thrown', 	model = 'w_ex_snowball'},
	{name = 'WEAPON_BALL', 				bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'thrown', 	model = 'w_am_baseball'},
	{name = 'WEAPON_GRENADE', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'thrown', 	model = 'w_ex_grenadefrag'},
	{name = 'WEAPON_SMOKEGRENADE', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'thrown', 	model = 'w_ex_grenadesmoke'},
	{name = 'WEAPON_BZGAS', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'thrown', 	model = 'w_ex_grenadesmoke'},

	{name = 'WEAPON_DIGISCANNER', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'others', 	model = 'w_am_digiscanner'},
	{name = 'WEAPON_DAGGER', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'others', 	model = 'prop_w_me_dagger'},
	{name = 'WEAPON_GARBAGEBAG', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'others', 	model = ''},
	{name = 'WEAPON_HANDCUFFS', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'others', 	model = ''},
	{name = 'WEAPON_BATTLEAXE', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'others', 	model = 'prop_tool_fireaxe'},
	{name = 'WEAPON_PIPEBOMB', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'others', 	model = ''},
	{name = 'WEAPON_POOLCUE', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'others', 	model = 'prop_pool_cue'},
	{name = 'WEAPON_WRENCH', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'others', 	model = 'w_me_hammer'},
	{name = 'GADGET_NIGHTVISION', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'others', 	model = ''},
	{name = 'GADGET_PARACHUTE', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'others', 	model = 'p_parachute_s'}
}

Config.Zones = {
	GunShop = {
		Legal = true,
		Items = {
			{ weapon = 'WEAPON_PISTOL', label = 'Pistolet', price = 80000, ammoPrice = 200, AmmoToGive = 48 },
			{ weapon = 'WEAPON_KNIFE', label = 'Nóż', price = 15000 }
		},
		Locations = {
			vector3(-662.1, -935.3, 20.8),
			vector3(810.2, -2157.3, 28.6),
			vector3(1693.4, 3759.5, 33.7),
			vector3(-330.2, 6083.8, 30.4),
			vector3(252.3, -50.0, 68.9),
			vector3(22.0, -1107.2, 28.8),
			vector3(2567.6, 294.3, 107.7),
			vector3(-1117.5, 2698.6, 17.5),
			vector3(842.4, -1033.4, 27.1)
		}
	},

	GunShopDS = {
		Legal = false,
		Items = {
			{ weapon = 'WEAPON_SNSPISTOL', label = 'SNS Pistol', price = 65000, ammoPrice = 200, AmmoToGive = 100 },
			{ weapon = 'WEAPON_SNSPISTOL_MK2', label = 'SNS Pistol MK2', price = 80000, ammoPrice = 200, AmmoToGive = 100 },
			{ weapon = 'WEAPON_PISTOL_MK2', label = 'Pistolet MK2', price = 75000, ammoPrice = 200, AmmoToGive = 100 },
			{ weapon = 'WEAPON_VINTAGEPISTOL', label = 'Vintage Pistol', price = 85000, ammoPrice = 200, AmmoToGive = 100 },
			{ weapon = 'WEAPON_CERAMICPISTOL', label = 'Ceramic Pistol', price = 85000, ammoPrice = 200, AmmoToGive = 100 },

		},
		Locations = {
			vector3(1469.65, 6550.10, 14.00),
		}
	},
}

Config.Weapons = {
	WEAPON_KNIFE = { item = 'WEAPON_KNIFE', label = _U('weapon_knife') },
	WEAPON_NIGHTSTICK = { item = 'WEAPON_NIGHTSTICK', label = _U('weapon_nightstick') },
	WEAPON_HAMMER = { item = 'WEAPON_HAMMER', label = _U('weapon_hammer') },
	WEAPON_BAT = { item = 'WEAPON_BAT', label = _U('weapon_bat') },
	WEAPON_GOLFCLUB = { item = 'WEAPON_GOLFCLUB', label = _U('weapon_golfclub') },
	WEAPON_CROWBAR = { item = 'WEAPON_CROWBAR', label = _U('weapon_crowbar') },
	WEAPON_PISTOL = { item = 'WEAPON_PISTOL', label = _U('weapon_pistol') },
	WEAPON_COMBATPISTOL = { item = 'WEAPON_COMBATPISTOL', label = _U('weapon_combatpistol') },
	WEAPON_APPISTOL = { item = 'WEAPON_APPISTOL', label = _U('weapon_appistol') },
	WEAPON_PISTOL50 = { item = 'WEAPON_PISTOL50', label = _U('weapon_pistol50') },
	WEAPON_MICROSMG = { item = 'WEAPON_MICROSMG', label = _U('weapon_microsmg') },
	WEAPON_SMG = { item = 'WEAPON_SMG', label = _U('weapon_smg') },
	WEAPON_ASSAULTSMG = { item = 'WEAPON_ASSAULTSMG', label = _U('weapon_assaultsmg') },
	WEAPON_ASSAULTRIFLE = { item = 'WEAPON_ASSAULTRIFLE', label = _U('weapon_assaultrifle') },
	WEAPON_CARBINERIFLE = { item = 'WEAPON_CARBINERIFLE', label = _U('weapon_carbinerifle') },
	WEAPON_ADVANCEDRIFLE = { item = 'WEAPON_ADVANCEDRIFLE', label = _U('weapon_advancedrifle') },
	WEAPON_MG = { item = 'WEAPON_MG', label = _U('weapon_mg') },
	WEAPON_COMBATMG = { item = 'WEAPON_COMBATMG', label = _U('weapon_combatmg') },
	WEAPON_PUMPSHOTGUN = { item = 'WEAPON_PUMPSHOTGUN', label = _U('weapon_pumpshotgun') },
	WEAPON_SAWNOFFSHOTGUN = { item = 'WEAPON_SAWNOFFSHOTGUN', label = _U('weapon_sawnoffshotgun') },
	WEAPON_ASSAULTSHOTGUN = { item = 'WEAPON_ASSAULTSHOTGUN', label = _U('weapon_assaultshotgun') },
	WEAPON_BULLPUPSHOTGUN = { item = 'WEAPON_BULLPUPSHOTGUN', label = _U('weapon_bullpupshotgun') },
	WEAPON_STUNGUN = { item = 'WEAPON_STUNGUN', label = _U('weapon_stungun') },
	WEAPON_SNIPERRIFLE = { item = 'WEAPON_SNIPERRIFLE', label = _U('weapon_sniperrifle') },
	WEAPON_HEAVYSNIPER = { item = 'WEAPON_HEAVYSNIPER', label = _U('weapon_heavysniper') },
	WEAPON_REMOTESNIPER = { item = 'WEAPON_REMOTESNIPER', label = _U('weapon_remotesniper') },
	WEAPON_GRENADELAUNCHER = { item = 'WEAPON_GRENADELAUNCHER', label = _U('weapon_grenadelauncher') },
	WEAPON_RPG = { item = 'WEAPON_RPG', label = _U('weapon_rpg') },
	WEAPON_STINGER = { item = 'WEAPON_STINGER', label = _U('weapon_stinger') },
	WEAPON_MINIGUN = { item = 'WEAPON_MINIGUN', label = _U('weapon_minigun') },
	WEAPON_GRENADE = { item = 'WEAPON_GRENADE', label = _U('weapon_grenade') },
	WEAPON_STICKYBOMB = { item = 'WEAPON_STICKYBOMB', label = _U('weapon_stickybomb') },
	WEAPON_SMOKEGRENADE = { item = 'WEAPON_SMOKEGRENADE', label = _U('weapon_smokegrenade') },
	WEAPON_BZGAS = { item = 'WEAPON_BZGAS', label = _U('weapon_bzgas') },
	WEAPON_MOLOTOV = { item = 'WEAPON_MOLOTOV', label = _U('weapon_molotov') },
	WEAPON_FIREEXTINGUISHER = { item = 'WEAPON_FIREEXTINGUISHER', label = _U('weapon_fireextinguisher') },
	WEAPON_PETROLCAN = { item = 'WEAPON_PETROLCAN', label = _U('weapon_petrolcan') },
	WEAPON_DIGISCANNER = { item = 'WEAPON_DIGISCANNER', label = _U('weapon_digiscanner') },
	WEAPON_BALL = { item = 'WEAPON_BALL', label = _U('weapon_ball') },
	WEAPON_SNSPISTOL = { item = 'WEAPON_SNSPISTOL', label = _U('weapon_snspistol') },
	WEAPON_BOTTLE = { item = 'WEAPON_BOTTLE', label = _U('weapon_bottle') },
	WEAPON_GUSENBERG = { item = 'WEAPON_GUSENBERG', label = _U('weapon_gusenberg') },
	WEAPON_SPECIALCARBINE = { item = 'WEAPON_SPECIALCARBINE', label = _U('weapon_specialcarbine') },
	WEAPON_HEAVYPISTOL = { item = 'WEAPON_HEAVYPISTOL', label = _U('weapon_heavypistol') },
	WEAPON_BULLPUPRIFLE = { item = 'WEAPON_BULLPUPRIFLE', label = _U('weapon_bullpuprifle') },
	WEAPON_DAGGER = { item = 'WEAPON_DAGGER', label = _U('weapon_dagger') },
	WEAPON_VINTAGEPISTOL = { item = 'WEAPON_VINTAGEPISTOL', label = _U('weapon_vintagepistol') },
	WEAPON_FIREWORK = { item = 'WEAPON_FIREWORK', label = _U('weapon_firework') },
	WEAPON_MUSKET = { item = 'WEAPON_MUSKET', label = _U('weapon_musket') },
	WEAPON_HEAVYSHOTGUN = { item = 'WEAPON_HEAVYSHOTGUN', label = _U('weapon_heavyshotgun') },
	WEAPON_MARKSMANRIFLE = { item = 'WEAPON_MARKSMANRIFLE', label = _U('weapon_marksmanrifle') },
	WEAPON_HOMINGLAUNCHER = { item = 'WEAPON_HOMINGLAUNCHER', label = _U('weapon_hominglauncher') },
	WEAPON_PROXMINE = { item = 'WEAPON_PROXMINE', label = _U('weapon_proxmine') },
	WEAPON_SNOWBALL = { item = 'WEAPON_SNOWBALL', label = _U('weapon_snowball') },
	WEAPON_FLAREGUN = { item = 'WEAPON_FLAREGUN', label = _U('weapon_flaregun') },
	WEAPON_GARBAGEBAG = { item = 'WEAPON_GARBAGEBAG', label = _U('weapon_garbagebag') },
	WEAPON_COMBATPDW = { item = 'WEAPON_COMBATPDW', label = _U('weapon_combatpdw') },
	WEAPON_MARKSMANPISTOL = { item = 'WEAPON_MARKSMANPISTOL', label = _U('weapon_marksmanpistol') },
	WEAPON_KNUCKLE = { item = 'WEAPON_KNUCKLE', label = _U('weapon_knuckle') },
	WEAPON_HATCHET = { item = 'WEAPON_HATCHET', label = _U('weapon_hatchet') },
	WEAPON_RAILGUN = { item = 'WEAPON_RAILGUN', label = _U('weapon_railgun') },
	WEAPON_MACHETE = { item = 'WEAPON_MACHETE', label = _U('weapon_machete') },
	WEAPON_MACHINEPISTOL = { item = 'WEAPON_MACHINEPISTOL', label = _U('weapon_machinepistol') },
	WEAPON_SWITCHBLADE = { item = 'WEAPON_SWITCHBLADE', label = _U('weapon_switchblade') },
	WEAPON_REVOLVER = { item = 'WEAPON_REVOLVER', label = _U('weapon_revolver') },
	WEAPON_DBSHOTGUN = { item = 'WEAPON_DBSHOTGUN', label = _U('weapon_dbshotgun') },
	WEAPON_COMPACTRIFLE = { item = 'WEAPON_COMPACTRIFLE', label = _U('weapon_compactrifle') },
	WEAPON_AUTOSHOTGUN = { item = 'WEAPON_AUTOSHOTGUN', label = _U('weapon_autoshotgun') },
	WEAPON_BATTLEAXE = { item = 'WEAPON_BATTLEAXE', label = _U('weapon_battleaxe') },
	WEAPON_COMPACTLAUNCHER = { item = 'WEAPON_COMPACTLAUNCHER', label = _U('weapon_compactlauncher') },
	WEAPON_MINISMG = { item = 'WEAPON_MINISMG', label = _U('weapon_minismg') },
	WEAPON_PIPEBOMB = { item = 'WEAPON_PIPEBOMB', label = _U('weapon_pipebomb') },
	WEAPON_POOLCUE = { item = 'WEAPON_POOLCUE', label = _U('weapon_poolcue') },
	WEAPON_WRENCH = { item = 'WEAPON_WRENCH', label = _U('weapon_wrench') },
	WEAPON_FLASHLIGHT = { item = 'WEAPON_FLASHLIGHT', label = _U('weapon_flashlight') },
	GADGET_NIGHTVISION = { item = 'GADGET_NIGHTVISION', label = _U('gadget_nightvision') },
	GADGET_PARACHUTE = { item = 'GADGET_PARACHUTE', label = _U('gadget_parachute') },
	WEAPON_FLARE = { item = 'WEAPON_FLARE', label = _U('weapon_flare') }, 
	WEAPON_SNSPISTOL_MK2 = { item = 'WEAPON_SNSPISTOL_MK2', label = _U('weapon_snspistol_mk2') }, 
	WEAPON_REVOLVER_MK2 = { item = 'WEAPON_REVOLVER_MK2', label = _U('weapon_revolver_mk2') },  
	WEAPON_DOUBLEACTION = { item = 'WEAPON_DOUBLEACTION', label = _U('weapon_doubleaction') },    
	WEAPON_SPECIALCARBINE_MK2 = { item = 'WEAPON_SPECIALCARBINE_MK2', label = _U('weapon_specialcarabine_mk2') },  
	WEAPON_BULLPUPRIFLE_MK2 = { item = 'WEAPON_BULLPUPRIFLE_MK2', label = _U('weapon_bullpruprifle_mk2') },   
	WEAPON_PUMPSHOTGUN_MK2 = { item = 'WEAPON_PUMPSHOTGUN_MK2', label = _U('weapon_pumpshotgun_mk2') },
	WEAPON_MARKSMANRIFLE_MK2 = { item = 'WEAPON_MARKSMANRIFLE_MK2', label = _U('weapon_marksmanrifle_mk2') },  
	WEAPON_ASSAULTRIFLE_MK2 = { item = 'WEAPON_ASSAULTRIFLE_MK2', label = _U('weapon_assaultrifle_mk2') },
	WEAPON_CARBINERIFLE_MK2 = { item = 'WEAPON_CARBINERIFLE_MK2', label = _U('weapon_carbinerifle_mk2') },  
	WEAPON_COMBATMG_MK2 = { item = 'WEAPON_COMBATMG_MK2', label = _U('weapon_combatmg_mk2') },   
	WEAPON_HEAVYSNIPER_MK2 = { item = 'WEAPON_HEAVYSNIPER_MK2', label = _U('weapon_heavysniper_mk2') },   
	WEAPON_PISTOL_MK2 = { item = 'WEAPON_PISTOL_MK2', label = _U('weapon_pistol_mk2') },   
	WEAPON_SMG_MK2 = { item = 'WEAPON_SMG_MK2', label = _U('weapon_smg_mk2') }
  }
  
  Config.AmmoTypes = {
	AMMO_PISTOL = { item = 'pistol_ammo' },
	AMMO_SMG = { item = 'smg_ammo' },
	AMMO_FIREWORK = { item = 'firework_ammo' },
	AMMO_RIFLE = { item = 'rifle_ammo' },
	AMMO_MG = { item = 'mg_ammo' },
	AMMO_SHOTGUN = { item = 'shotgun_ammo' },
	AMMO_STUNGUN = { item = 'stungun_ammo' },
	AMMO_SNIPER = { item = 'sniper_ammo' },
	AMMO_SNIPER_REMOTE = { item = 'sniper_remote_ammo' },
	AMMO_MINIGUN = { item = 'minigun_ammo' },
	AMMO_GRENADELAUNCHER = { item = 'grenadelauncher_ammo' },
	AMMO_GRENADELAUNCHER_SMOKE = { item = 'grenadelauncher_smoke_ammo' },
	AMMO_RPG = { item = 'rpg_ammo' },
	AMMO_STINGER = { item = 'stinger_ammo' },
	AMMO_BALL = { item = 'WEAPON_BALL' },
	AMMO_STICKYBOMB = { item = 'WEAPON_STICKYBOMB' },
	AMMO_SMOKEGRENADE = { item = 'WEAPON_SMOKEGRENADE' },
	AMMO_BZGAS = { item = 'gzgas_ammo' },
	AMMO_FLARE = { item = 'flare_ammo' },
	AMMO_MOLOTOV = { item = 'WEAPON_MOLOTOV' },
	AMMO_TANK = { item = 'tank_ammo' },
	AMMO_SPACE_ROCKET = { item = 'space_rocket_ammo' },
	AMMO_PLANE_ROCKET = { item = 'plane_rocket_ammo' },
	AMMO_PLAYER_LASER = { item = 'player_laser_ammo' },
	AMMO_ENEMY_LASER = { item = 'enemy_laser_ammo' },
	AMMO_BIRD_CRAP = { item = 'bird_crap_ammo' }
  }

  --[[
	  
pistol_ammo
smg_ammo
rifle_ammo
shotgun_ammo
sniper_ammo
minigun_ammo
grenadelauncher_ammo
rpg_ammo
  ]]