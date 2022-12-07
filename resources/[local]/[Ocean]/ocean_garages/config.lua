Impound = {}
CoOwner = {}
SellCar = {}
PoliceImpound = {}
Destroy = {}
Config = {
    Locale = 'pl',
	Sprite = 289,
	Colour = 38,
	Colour2 = 37,
	Colour3 = 47
}

Config.Garage = {
	-- Widoczne blipy
	{x = -776.92, y = -2569.67, z = -35.06, blip = false},
	{x = 491.19, y = -1335.91, z = 29.32, blip= true}, 
	{x = 854.8, y = -2123.53, z = 30.54, blip = true},
	{x = 2536.76, y = 2580.64, z = 37.94, blip = true},
	{x = -2528.02, y = 2341.23, z = 33.05, blip = true},
	{x = -595.3255, y = -124.0884, z = 33.8044, blip = false}, -- Komenda urząd
	{x = 75.7923, y = 6365.6025, z = 30.2805+0.9, blip = true},
	{x = 1161.71, y = -1494.22, z = 34.69, blip = true},
	{x = 1488.26, y = 3744.710, z = 33.80, blip = true},
	{x = -2195.02, y = 4267.44, z = 48.52, blip = true},
	{x = 703.91, y = -981.03, z = 24.132, blip = false}, -- Szfacz
	{x = 1422.44, y = -1504.34, z = 60.89, blip = false}, -- Marabunta
	{x = -613.20, y = 190.43, z = 70.00, blip = false},  -- Kawiarnia
	{x = 327.750, y = -204.980, z = 54.09, blip = true},
	{x = -1469.39, y = -657.17, z = 29.50, blip = true},
	{x = -1171.03, y = -880.31, z = 14.1, blip = false}, -- BurgerShot
	{x = -3146.09, y = 1084.69, z = 20.69, blip = true},
	{x = 76.31, y = -1549.52, z = 29.46, blip = true},
	{x = 40.07, y = -863.97, z = 30.55, blip = true},
	{x = 885.98, y = -38.22, z = 78.76, blip = true},
	{x = -926.0, y = -163.99, z = 41.88, blip = true},
	{x = -1194.04, y = -1490.86, z = 4.38, blip = true},
	{x = 1688.43, y = 4774.03, z = 41.92, blip = true},
	{x = 572.16, y = 2724.44, z = 42.06, blip = true},
	{x = -1879.58, y = -308.17, z = 49.23, blip = true},
	{x = 2769.66, y = 3467.82, z = 55.57, blip = true},
	{x = 333.21, y = -2038.74, z = 21.06, blip = true},
	{x = 1004.04, y = -2336.67, z = 30.51, blip = true},
	{x = -334.79, y = -751.01, z = 33.97, blip = true},
	{x = -1392.48, y = 80.49, z = 53.95, blip = true},
	{x = -2973.64, y = 70.09, z = 11.6, blip = true},
	{x = 2587.52, y = 419.76, z = 108.46, blip = true},
	{x = -1039.03, y = -2714.28, z = 13.81, blip = true},
	{x = 1366.88, y = -579.59, z = 74.38, blip = true},
	{x = -1093.5, y = -1047.61, z = 2.15, blip = true},  -- wysepka
	{x = 461.36, y = 239.93, z = 103.21, blip = true},  -- Clinton Avenu
	{x = -795.99, y = 319.41, z = 85.68, blip = true},  -- garaz
	{x = 162.8165, y = -3335.345, z = 4.9943+1.0, blip = true}, -- Doki 2
	{x = -410.7779, y = 1209.1434, z = 324.6917+0.9, blip = true}, -- Obserwatorium
	{x = 1188.7007, y = -3247.1418, z = 5.0788+0.9, blip = true}, -- Doki
	{x = -56.2495, y =  220.9092, z = 105.6039+0.9, blip = true}, -- GALAXY
	{x = 954.15, y = 22.6, z = 81.15, blip = false},  -- Kasyno
	{x = 889.6437, y = -876.0215, z = 25.1615+0.9, blip = true}, -- Mechanik
	{x = -1021.8325, y = -510.2822, z = 35.1448+0.9, blip = true}, -- Psycholog
	{x = -720.96, y = 507.73, z = 108.40, blip = false},  --Prywatny DOM
	{x = 2451.4944, y = 4997.7998, z = 46.0398, blip = false}, -- Bracia ONIL
	{x = -524.4675, y = -888.9473, z = 24.1331, blip = false}, -- Weazle News
	{x = -1918.89, y = 2056.68, z = 140.98, blip = false}, -- Winiarnia
	{x = -1531.33, y = 889.68, z = 181.87, blip = false}, --Prywatny DOM
	{x = -395.08, y = 6312.73, z = 28.97, blip = false}, -- DOM PALETO
	{x = -52.84, y = 6622.55, z = 29.95, blip = false}, -- DOM PALETO
	{x = -626.1, y = 56.4, z = 43.73, blip = false}, -- UKRYTY
	{x = 842.7112, y = -1317.491, z = 26.1, blip = false}, -- Komenda HP MIASTO
	{x = -893.9, y = -344.26, z = 34.53, blip = false},  -- ucieczki
	{x = -1790.13, y = 460.61, z = 127.35, blip = false}, --Prywatny DOM
	{x = 279.34, y = -611.91, z = 43.22, blip = false}, -- Philbopx
	{x = 323.23, y = -547.83, z = 28.74, blip = false}, -- Philbopx
	{x = -127.1867, y = 1006.7983, z = 235.7, blip = false}, --Prywatny DOM
	{x = 40.3908, y = 6353.4042, z = 21.6783, blip = false},  -- Organizacja
	{x = -673.4064, y = 908.9037, z = 229.5074+0.9, blip = false}, --Prywatny DOM
	{x = -187.3387, y = -1585.7897, z = 33.875+1.3, blip = false}, -- garaz zielonki
	{x = -1532.9789, y = 81.9971, z = 55.817+1.0, blip = false}, -- Dom playboy
	{x = 733.0592, y = -2989.5664, z = -39.9499+1.0, blip = false}, -- Organizacje jeden interior
	{x = -824.0345, y = 182.1567, z = 70.8006+1.2, blip = false}, -- Prywatny DOM Michael
	{x = 928.8199, y = -573.2177, z = 56.3764+1.2, blip = false}, --Prywatny DOM
	{x = 943.9417, y = -669.912, z = 57.061+1.2, blip = false}, --Prywatny DOM
	{x = 915.408, y = -492.3825, z = 58.0874+1.2, blip = false}, --Prywatny DOM
	{x = 1989.6538, y = 3032.6936, z = 45.696+1.7, blip = false}, --  Yellow Jack
	{x = -1061.8348, y = 302.9888, z = 65.0022+1.7, blip = false}, -- Organizacja/dom
	{x = 1393.88, y = 1117.17, z = 114.83, blip = false}, -- Organizacja
	{x = -709.7434, y = 651.3831, z = 154.2255+1.5, blip = false}, -- Organizacja/dom
	{x = -1749.7373, y = 365.9608, z = 88.7746+1.5, blip = false}, --Prywatny DOM
	{x = 1364.6576, y = -2085.7405, z = 51.0485+1.5, blip = false}, -- Organizacja
	{x = -1556.32, y = -389.72, z = 41.98+0.1, blip = false}, -- Organizacja BLODS-
	{x = -2604.8188, y = 1675.7346, z = 141.713, blip = false}, --Prywatny DOM
	{x = -13.6885, y = -1414.7452, z = 28.8617, blip = false}, -- Organizacja
	{x = -1098.7319, y = 359.5399, z = 68.0414, blip = false}, --Prywatny DOM
	{x = -1547.1282, y = 880.796, z = 180.3436, blip = false}, --Prywatny DOM
	{x = -948.3535, y = 575.1801, z = 100.2000, blip = false}, --Prywatny DOM
	{x = -84.3419, y = -822.5928, z = 35.078, blip = false}, 
	{x = 53.6596, y = 476.7289, z = 145.9882, blip = false},  --Prywatny DOM
	{x = 118.7484, y = 1210.8898, z = 207.2243, blip = false},-- Organizacja 
	{x = 13.3717, y = 548.4252, z = 176.1719, blip = false}, 
	{x = -108.9362, y = 833.3428, z = 234.7666, blip = false}, -- Dom prywatny  
	{x = 821.9487, y = -2333.6594, z = 30.5148, blip = false}, -- Organizacja 
	{x = 983.0217, y = -134.5364, z = 74.111, blip = false}, -- Losty org
	{x = 939.6608, y = -1472.2197, z = 30.1525, blip = false}, -- ORG
	{x = -1975.4038, y = 260.8438, z = 87.2691, blip = false}, -- Dom org
	{x = 379.7284, y = -6.0568, z = 82.0332+0.9, blip = false}, -- Hotel oRG
	{x = -1792.7058, y = 405.4841, z = 112.3389, blip = false}, -- Prywatny Dom
	{x = -1780.4541, y = 458.1206, z = 127.3591, blip = false}, -- Prywatny Dom
	{x = -1555.619, y = 21.7245, z = 57.6785+0.9, blip = false}, -- Prywatny Dom
	{x = -216.0012, y = -1496.121, z = 31.3001, blip = false}, -- 
	{x = -161.03, y = 2610.03, z = 32.51, blip = false}, -- 
	{x = -526.7471, y = 528.3375, z = 111.0193, blip = false}, -- Prywatny Dom
	{x = -2663.9511, y = 1307.2448, z = 146.16+1.5, blip = false}, -- Prywatny Dom
	{x = -2587.2087, y = 1931.1119, z = 166.3543+1.5, blip = false}, -- Prywatny Dom
	{x = -316.7922, y = -738.3469, z = 27.0797+1.5, blip = false}, -- Prywatny Dom
	{x = 462.3951, y = -1019.2857, z = 27.1511+0.9, role = "police"}, -- Komenda MR
	{x = 462.3951, y = -1019.2857, z = 27.1511+0.9, role = "sheriff"}, -- Komenda MR
	{x = -1116.07, y = -856.93, z = 13.52, role = "police"}, -- Komenda Vespucci
	{x = 1860.39, y = 3679.43, z = 33.68, role = "police"}, -- Komenda Sandy
	{x = -477.27, y = 6021.38, z = 31.34, role = "police"}, -- Komenda Paleto
	{x = -54.8941, y = -2543.9788, z = 5.06+0.9, role = "police"}, -- Komenda Doki
	{x = 1524.0947, y = 791.8511, z = 76.4973+1.5, role = "police"}, -- Komenda LS Freeway
	{x = -1116.07, y = -856.93, z = 13.52, role = "sheriff"}, -- Komenda Vespucci
	{x = 1860.39, y = 3679.43, z = 33.68, role = "sheriff"}, -- Komenda Sandy
	{x = -477.27, y = 6021.38, z = 31.34, role = "sheriff"}, -- Komenda Paleto
	{x = -54.8941, y = -2543.9788, z = 5.06+0.9, role = "sheriff"}, -- Komenda Doki
	{x = 1524.0947, y = 791.8511, z = 76.4973+1.5, role = "sheriff"}, -- Komenda LS Freeway
	{x = 902.42, y = -183.88, z = 73.89, role = "taxi"},
	{x = -464.1998, y = -2806.8694, z = 5.0503, role = "courier"},
	{x = 966.63, y = 44.88, z = 80.96, role = "casino"},
	{x = 691.7681, y = -960.2361, z = 22.7102, role = "krawiec"},
	{x = 409.2424, y = 6459.0923, z = 28.859, role = "grower"},
	{x = 238.37, y = -1067.40, z = 29.24, role = "doj"},
	{x = -49.56, y = -1844.45, z = 26.28,  blip = false},
	{x = -951.63, y = -1284.01, z = 5.03, blip = true},
}

Config.Harbors = {
	{x = -910.48, y = -1458.06, z = 1.2, h = 290.0, blip = true},
	{x = 3869.96, y = 4470.27, z = 1.2, h = 267.88, blip = true},
	{x = -500.67, y = 6482.47, z = 1.2, h = 31.31, blip = true},
	{x = -3336.4, y = 992.15, z = 1.2, h = 89.28, blip = true},
	{x = 5101.44, y = -4651.05, z = 1.2, h = 254.95, blip = true},
}

Config.Hangar = {
	{x = -724.58, y = -1444.26, z = 5.0, blip = true},
	{x = 1488.6021, y = 1067.1516, z = 113.8, blip = false},
	{x = 1717.7, y = 3253.4, z = 41.14, h = 103.0, blip = true},
	{x = -1274.51, y = -3386.33, z = 13.94, h = 330.0, blip = true},
	{x = 965.78, y = 42.24, z = 123.13, h = 146.57, blip = false},
	{x = 4432.33, y = -4515.55, z = 4.13, h = 108.73, blip = true},
	{x = 2112.5044, y = 4801.3027, z = 41.2103, h = 115.75, blip = true},
	{x = -2036.8712, y= 2875.2366, z = 33.0, h = 61.61, blip = true},
}

Config.Zones = {
	{x = -191.46, y = -1163.08, z = 22.71, marker = 1, blip = "Odholowywanie pojazdów", sprite = 289, color = 5, name = "impound", info = 'impound', label  = "Naciśnij ~INPUT_CONTEXT~ aby odebrać pojazd"},
	{x = 1530.0034, y = 3777.6526, z = 33.5615, marker = 1, blip = "Odholowywanie pojazdów", sprite = 289, color = 5, name = "impound", info = 'impound', label  = "Naciśnij ~INPUT_CONTEXT~ aby odebrać pojazd"},
	{x = 93.475, y = 6357.0801, z = 30.4259, marker = 1, blip = "Odholowywanie pojazdów", sprite = 289, color = 5, name = "impound", info = 'impound', label  = "Naciśnij ~INPUT_CONTEXT~ aby odebrać pojazd"},
	{x = -534.02, y = -190.39, z = 37.25, marker = 1, name = "coowner", label  = "Naciśnij ~INPUT_CONTEXT~ aby zarządzać pojazdem"},
	{x = -142.60, y = -1175.46, z = 23.76, marker = 2, blip = "Parking policyjny", sprite = 56, color = 3, name = "impoundpd", info = 'parkingpd', label  = "Naciśnij ~INPUT_CONTEXT~ wyciągnąć pojazd z parkingu policyjnego"},
	{x = 1881.3739, y = 3700.4404, z = 33.6, marker = 2, blip = "Parking policyjny", sprite = 56, color = 3, name = "impoundpd", info = 'parkingpd', label  = "Naciśnij ~INPUT_CONTEXT~ wyciągnąć pojazd z parkingu policyjnego"},
	{x = -451.27, y = 5990.52, z = 31.34, marker = 2, blip = "Parking policyjny", sprite = 56, color = 3, name = "impoundpd", info = 'parkingpd', label  = "Naciśnij ~INPUT_CONTEXT~ wyciągnąć pojazd z parkingu policyjnego"},
	{x = 269.88, y = -433.19, z = 45.24-0.95, marker = 1, blip = "Umowa sprzedaży", sprite = 525, color = 3, name = "contractT", info = "contractT", label = "Naciśnij ~INPUT_CONTEXT~ aby zakupić umowę kupna/sprzedaży pojazdu"},
}