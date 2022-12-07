Config = {}

Config.jobName = 'x-gamer'
Config.Marker = {
	ID = 27,
	sizeX = 1.0,
	sizeY = 1.0,
	sizeZ = 0.0
}
Config.MainItem = 'kawa'
Config.TransformItems = {
	{item = 'ziarnokawy'}
}
Config.ItemLimits = {
	['ziarnokawy'] = 100,
	['kawa'] = 10
}
Config.CollectTime = 10 -- w sekundach
Config.TransformTime = 15 -- rowniez w sekundach
Config.DistanceToShow = 40.0 -- Dystans w ktorym widac blipy

Config.ClothesCoords = {x = 2821.0637, y = 4573.5811, z = 45.4225}
Config.Clothes = {
	Male = {
		['tshirt_1'] = 15, ['tshirt_2'] = 0,
		['torso_1'] = 420, ['torso_2'] = 1,
		['decals_1'] = 0, ['decals_2'] = 0,
		['arms'] = 41,
		['pants_1'] = 186, ['pants_2'] = 1,
		['shoes_1'] = 25, ['shoes_2'] = 0,
		['helmet_1'] = -1, ['helmet_2'] = 0,
		['chain_1'] = 0, ['chain_2'] = 0,
		['ears_1'] = -1, ['ears_2'] = 0,
		['bproof_1'] = 0, ['bproof_2'] = 0,
		['mask_1'] = 0, ['mask_2'] = 0,
		['bags_1'] = 21, ['bags_2'] = 21
	},
	Female = {
		['tshirt_1'] = 14, ['tshirt_2'] = 0,
		['torso_1'] = 443, ['torso_2'] = 1,
		['decals_1'] = 0, ['decals_2'] = 0,
		['arms'] = 14,
		['pants_1'] = 173, ['pants_2'] = 21,
		['shoes_1'] = 162, ['shoes_2'] = 0,
		['helmet_1'] = -1, ['helmet_2'] = 0,
		['chain_1'] = 0, ['chain_2'] = 0,
		['ears_1'] = -1, ['ears_2'] = 0,
		['bproof_1'] = 0, ['bproof_2'] = 0,
		['mask_1'] = 0, ['mask_2'] = 0,
		['bags_1'] = 0, ['bags_2'] = 0
	}
}

Config.Blips = {
	{coords = {x = 0.0, y = 0.0, z = 0.0}, name = "", blipDisplay = 27, colour = 3}
}

Config.VehicleGarage = {}
Config.VehicleGarage.Enabled = true -- Wlaczyc garaz?

Config.VehicleGarage.Coords = { -- Koordynaty garazu (spawn to respienie, back to usuwanie)
	['spawn'] = {xMarker = 2826.57, yMarker = 4578.31, zMarker = 45.60, xSpawn = 2819.4976, ySpawn = 4577.8042, zSpawn = 45.3449},
	['back'] = {xMarker = 2857.57, yMarker = 4567.31, zMarker = 45.60, xSpawn = 0.0, ySpawn = 0.0, zSpawn = 0.0}
}

Config.VehicleGarage.Models = { -- Modele aut w garazu
	{model = 'gmcat4', name = 'Firmowe auto'}
}

Config.Boss = {}
Config.Boss.MenuEnabled = true -- Wlaczyc menu frakcyjne?  ESX = nil
Config.Boss.Menu = {x = -635.35, y = 234.93, z = 81.88-0.95} -- Koordynaty menu frakcyjnego

Config.Boss.SellEnabled = true -- Wlaczyc sprzedawanie glownego przedmiotu?
Config.Boss.SellCoords = {x = 0.0, y = 0.0, z = 0.0} -- Koordynaty sprzedawania
Config.Boss.SellAmount = 3 -- Ilosc sprzedawanego przedmiotu
Config.Boss.SellCash = 250 -- Hajs za sprzedana ilosc u gory przedmiotow

Config.Mission = {}
Config.Mission.Enabled = true -- Czy misje maja byc wlaczone?
Config.Mission.StartPos = {x = 2826.57, y = 4569.31, z = 45.60} -- Koordynaty rozpoczecia misji

--[[
Lista misji:
- driveToPoint - Dojedz do punktu
- collectItem - Zbierz przedmioty
- transformItem - Przerob przedmioty
- getInCar - Wsiadz do pojazdu
- getClothes - Ubierz ubrania robocze
]]--
Config.Mission.MissionList = {
	{missionType = 'getClothes', missionData = {isClothed = false, text = "Przebierz sie w stroj firmowy"}},
	{missionType = 'getInCar', missionData = {inCar = false, text = "Wsiadz do pojazdu firmowego", vehicleToGet = 'gmcat4'}},
	{missionType = 'driveToPoint', missionData = {point = {x = 2831.1719, y = 4581.2144, z = 45.7373}, text = "Udaj sie do"}},
	{missionType = 'collectItem', missionData = {item = 'paczka', amount = 3, text = "Zdobadz 3 paczki"}},
	{missionType = 'transformItem', missionData = {transformed = false, text = "Przerob paczki"}}
}

Config.Mission.CashMission = {from = 1000, to = 1990}

Config.Collect = {
	{x = 2848.24, y = 4578.14, z = 46.35, collectItem = {item = 'ziarnokawy', amount = 1}}
}

Config.Transform = {
	{x = -630.29, y = 224.85, z = 81.88-0.95}
}

Config.Messages = {
	CollectHelp = "Kliknij ~INPUT_CONTEXT~, aby zbierac",
	CollectCancel = "Kliknij ~INPUT_CONTEXT~, aby anulowac",
	TransformHelp = "Kliknij ~INPUT_CONTEXT~, aby przerobic",
	TransformCancel = "Kliknij ~INPUT_CONTEXT~, aby anulowac",
	NoTransformItems = "Nie posiadasz przy sobie wszystkich potrzebnych rzeczy",
	MissionHelp = "Kliknij ~INPUT_CONTEXT~, aby rozpoczac kurs",
	MissionEnd = "Misja wykonana",
	MissionCash = "Otrzymales {CASH}$ za wykonanie misji",
	Selled = "Sprzedales costam za {CASH}$",
	SellingHelp = "Kliknij ~INPUT_CONTEXT~, aby sprzedac",
	SellingNoItems = "Nie posiadasz przy sobie wszystkich potrzebnych rzeczy",
	BossMenu = "Kliknij ~INPUT_CONTEXT~, aby otworzyc menu",
	VehicleGarage = "Kliknij ~INPUT_CONTEXT~, aby otworzyc garaz",
	VehicleDeposit = "Kliknij ~INPUT_CONTEXT~, aby oddac auto",
	ClothesHelp = "Kliknij ~INPUT_CONTEXT~, aby otworzyc szafke"
}

Config.Animations = {
	Collecting = {anim = 'machinic_loop_mechandplayer', dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@'},
	Transforming = {anim = 'machinic_loop_mechandplayer', dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@'}
}

Config.check = function()
	print("Konfiguracja zaladowana")
end