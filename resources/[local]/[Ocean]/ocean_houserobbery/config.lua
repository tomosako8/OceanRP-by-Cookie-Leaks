Config = {}
Config.NeededCops = 2
Config.Cooldown = 30 -- in min

Config.Webhook = ''

Config.stage_1 = {
    model = 's_m_y_dealer_01',
    pos = vector3(1221.41, -1661.08, 46.8203),
    h = 209.91,
    DrawDistance = 5.0,
}

Config.Houses = {
    --------------------------------------------------
    --------------------BIG HOUSES--------------------
    --------------------------------------------------
    {
        enter = vector3(-1371.02, -503.92, 32.2),
        type = 'Big',
    },
    {
        enter = vector3(-1442.49, -545.27, 33.0),
        type = 'Big',
    },
    {
        enter = vector3(-1539.34, -607.77, 30.34),
        type = 'Big',
    },
    {
        enter = vector3(-916.87, -450.92, 38.64),
        type = 'Big',
    },
    {
        enter = vector3(-79.48, -837.04, 39.6),
        type = 'Big',
    },
    --------------------------------------------------
    -------------------MEDIUM HOUSES------------------
    --------------------------------------------------
    {
        enter = vector3(-831.15, 114.79, 54.67),
        type = 'Medium',
    },
    {
        enter = vector3(-914.1, 108.34, 54.56),
        type = 'Medium',
    },
    {
        enter = vector3(-970.15, 122.63, 56.09),
        type = 'Medium',
    },
    {
        enter = vector3(-305.13, 431.78, 109.35),
        type = 'Medium',
    },
    {
        enter = vector3(-312.29, 474.73, 111.82),
        type = 'Medium',
    },
    --------------------------------------------------
    -------------------SMALL HOUSES-------------------
    --------------------------------------------------
    {
        enter = vector3(1052.23, -470.7, 62.94),
        type = 'Small',
    },
    {
        enter = vector3(1098.62, -464.87, 66.36),
        type = 'Small',
    },
    {
        enter = vector3(1056.02, -448.59, 65.30),
        type = 'Small',
    },
    {
        enter = vector3(1046.55, -497.77, 63.12),
        type = 'Small',
    },
    {
        enter = vector3(1090.45, -484.24, 64.71),
        type = 'Small',
    },
}

Config.Types = {
    {
        type = 'Big',
        exit = vector3(282.6, -991.45, -93.74),
        RobPlaces = {
            vector3(287.73, -989.73, -93.74),
            vector3(293.2, -990.21, -93.74),

            vector3(299.13, -1000.47, -95.14),
            vector3(309.41, -1001.2, -95.14),
            vector3(296.84, -986.16, -95.14),
            vector3(310.80, -985.45, -95.14),
            vector3(302.45, -992.71, -95.14),
            vector3(296.54, -989.69, -95.14),

            vector3(303.62, -995.58, -99.94),
            vector3(304.09, -990.96, -99.94),
            vector3(305.82, -999.51, -99.94),
        },
        Drop = {
            {item = 'coke_pooch', maxdrop = 5, chance = 8, type = 'item'},
            {item = 'blowpipe', maxdrop = 4, chance = 10, type = 'item'},
			{item = 'drill', maxdrop = 1, chance = 10, type = 'item'},
			{item = 'kawa', maxdrop = 5, chance = 8, type = 'item'},
			{item = 'clip', maxdrop = 10, chance = 10, type = 'item'},
			{item = 'jablko', maxdrop = 20, chance = 10, type = 'item'},
            {item = 'money', maxdrop = 35000, chance = 8, type = 'money'},
			{item = 'bizuteria', maxdrop = 1, chance = 8, type = 'item'},
			{item = 'obraczka', maxdrop = 1, chance = 8, type = 'item'},
			{item = 'drill2', maxdrop = 1, chance = 10, type = 'item'},
			{item = 'cola', maxdrop = 5, chance = 10, type = 'item'},
        }
    },
    {
        type = 'Medium',
        exit = vector3(346.5, -1012.6, -100.1),
        RobPlaces = {
            vector3(346.1, -1001.8, -100.1),
            vector3(351.6, -999.2, -100.1),
            vector3(350.5, -993.6, -100.1),
            vector3(345.2, -995.0, -100.1),
            vector3(338.2, -996.8, -100.1),
            vector3(340.8, -1003.3, -100.1),
            vector3(349.18, -994.9, -100.1),
            vector3(341.46, -997.31, -100.1),
            vector3(344.07, -1003.24, -100.1),
        },
        Drop = {
            {item = 'meth_pooch', maxdrop = 5, chance = 8, type = 'item'},
            {item = 'blowpipe', maxdrop = 3, chance = 10, type = 'item'},
			{item = 'drill', maxdrop = 1, chance = 10, type = 'item'},
			{item = 'kawa', maxdrop = 4, chance = 8, type = 'item'},
			{item = 'clip', maxdrop = 8, chance = 10, type = 'item'},
			{item = 'jablko', maxdrop = 15, chance = 10, type = 'item'},
            {item = 'money', maxdrop = 30000, chance = 8, type = 'money'},
			{item = 'bizuteria', maxdrop = 1, chance = 8, type = 'item'},
			{item = 'apteczka', maxdrop = 1, chance = 7, type = 'item'},
			{item = 'drill3', maxdrop = 1, chance = 5, type = 'item'},
			{item = 'cola', maxdrop = 5, chance = 10, type = 'item'},
        }
    },
    {
        type = 'Small',
        exit = vector3(266.04, -1007.25, -101.95),
        RobPlaces = {
            vector3(265.64, -999.53, -99.95),
            vector3(263.96, -995.60, -99.95),
            vector3(262.72, -999.9, -99.95),
            vector3(258.68, -997.37, -99.95),
            vector3(262.02, -1002.82, -99.95),
        },
        Drop = {
            {item = 'oghaze_pooch', maxdrop = 5, chance = 8, type = 'item'},
            {item = 'blowpipe', maxdrop = 2, chance = 10, type = 'item'},
			{item = 'drill', maxdrop = 1, chance = 10, type = 'item'},
			{item = 'kawa', maxdrop = 4, chance = 8, type = 'item'},
			{item = 'clip', maxdrop = 6, chance = 10, type = 'item'},
			{item = 'jablko', maxdrop = 15, chance = 10, type = 'item'},
            {item = 'money', maxdrop = 35000, chance = 8, type = 'money'},
			{item = 'bizuteria', maxdrop = 1, chance = 8, type = 'item'},
			{item = 'obraczka', maxdrop = 1, chance = 8, type = 'item'},
			{item = 'beer', maxdrop = 5, chance = 10, type = 'item'},
			{item = 'cola', maxdrop = 5, chance = 10, type = 'item'},
        }
    },
}