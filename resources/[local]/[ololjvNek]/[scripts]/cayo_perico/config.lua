Config = {}

Config.Prom = {
	SA = {x = 516.686, y = -2931.7512, z = 5.2, h = 180.0},
	CP = {x = 5076.1108, y = -4633.2891, z = 1.3524, h = 70.0}
}

Config.Gates = {
	{model = 1215477734},
	{model = -1574151574}
}

Config.BossMenu = {
	coords = {x = 5010.3506, y = -5756.9912, z = 14.53}
}

Config.Teleports = {
	{enter = {x = 4991.5205, y = -5732.7842, z = 14.95}, exit = {x = -11.0423, y = -762.9766, z = -101.6272}}
}

Config.VehiclesGarage = {
	{coords = {x = 4970.3989, y =  -5746.2803, z = 18.9302}, spawnCoords = {x = 4970.3989, y =  -5746.2803, z = 18.9302+0.9}, deleteCoords = {x = 4970.3989, y =  -5746.2803, z = 18.9302}, type = 'land'},
	{coords = {x = 4976.3989, y =  -5178.2803, z = 1.5231}, spawnCoords = {x = 4933.5555, y =  -5156.3525, z = 0.0}, deleteCoords = {x = 4932.3989, y =  -5154.2803, z = 0.5231}, type = 'port'}
}

Config.HeliGarage = {
	{coords = {x = 0.0, y = 0.0, z = 0.0}}
}

Config.Schowki = {
	["Przerobka"] = {
		coords = {x = -3.8834, y = -759.1333, z = -103.6172},
		items = {}
	},
	["Skarbiec"] = {
		coords = {x = 5004.5503, y = -5753.8574, z = 14.5},
		items = {}
	},
	["Zbrojownia"] = {
		coords = {x = 4999.0532, y = -5751.1333, z = 14.1},
		items = {}
	},
	["Port"] = {
		coords = {x = 5000.0532, y = -5166.1333, z = 1.81},
		items = {}
	},
	["Lotnisko"] = {
		coords = {x = 4522.0532, y = -4511.1333, z = 3.5},
		items = {}
	}
}

Config.CocaineLeaves = {
	model = -1482322185
}

Config.CocaineTransform = {
	coords = {x = -7.1545, y = -758.3218, z = -103.60}
}

Config.StatuePacking = {
	coords = {x = -10.648, y = -759.0227, z = -103.6172}
}

Config.check = function()
	print("Konfiguracja zaladowana")
end