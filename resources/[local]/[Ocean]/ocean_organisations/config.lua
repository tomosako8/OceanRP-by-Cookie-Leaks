Config                            = {}
Config.Locale                     = 'pl'

Config.DrawDistance               = 10.0

Config.AuthorizedWeapons = {
  { 
      name = 'clip',
      tableName = 'pistolmk2',
      price = 2000,
      ammo = 1000
  },
  { 
      name = 'WEAPON_SNSPISTOL',
      tableName = 'snspistol',
      price = 50000,
      ammo = 1000
  },
}

Config.InstanceOrgs = {
    Cloakroom = {
        coords = vector3(1011.46, -2390.27, 29.20),
    },
    Inventory = {
        from = 1
    },
    Licenses = {
        from = 3
    },
    MainMenu = {
        coords = vector3(1019.90, -2404.75, 29.20),
        from = 4
    },
    Barabasz = {},
}

Config.Blips = {
    -- ORGANIZACJE MAFIA
    ['org27'] = vector3(1399.516, 1139.5142, 113.3857),
    -- ORGANIZACJE GANGI
    ['org1'] = vector3(-155.41, -1603.87, 34.15),
    ['org2'] = vector3(1439.06, -1487.57, 65.66),
    ['org3'] = vector3(-720.14, -866.94, 26.77),
    ['org4'] = vector3(-1565.02, -405.84, 48.26),
    ['org5'] = vector3(-103.1082, -1788.5537, 0.0),
    ['org6'] = vector3(-1145.0708, -1514.5787, 9.6827),
    ['org7'] = vector3(350.9563, -2028.8875, 27.5493),
    ['org8'] = vector3(449.0246, -1893.5128, 25.7869),
    ['org9'] = vector3(989.8188, -136.2335, 73.1243),
    ['org10'] = vector3(1373.7263, -2095.7183, 47.6543),
    ['org11'] = vector3(898.8, -480.32, 62.81),
    ['org12'] = vector3(-1973.26, 244.37, 91.22),
    ['org13'] = vector3(812.03, -2311.6, 30.46),
    ['org14'] = vector3(735.92, -807.37, 16.28),
    -- ORGANIZACJE BOJÓWKI
    ['org16'] = vector3(-1400.2, -639.59, 28.67),
    ['org19'] = vector3(732.24, 2532.07, 73.21),
    ['org29'] = vector3(189.56, 2787.04, 45.59),
    ['org30'] = vector3(1362.71, 3618.62, 34.89),
    ['org72'] = vector3(2176.74, 3506.08, 44.64),
    ['org73'] = vector3(2465.48, 4101.64, 38.06),
    ['org74'] = vector3(2887.71, 4383.28, 50.3),
    ['org15'] = vector3(1949.08, 3824.05, 32.11),
    ['org17'] = vector3(2703.1, 3455.17, 55.63),
    ['org18'] = vector3(1720.68, 4670.11, 43.22),
    ['org21'] = vector3(1646.54, 4844.16, 42.01),
    ['org22'] = vector3(2109.73, 3325.99, 45.35),
    ['org23'] = vector3(-896.88, -985.09, 2.16),
    ['org24'] = vector3(-106.35, 2796.28, 53.34),
    ['org25'] = vector3(1710.79, 4758.21, 41.92),
    ['org26'] = vector3(919.43, 3658.91, 32.5),
    ['org28'] = vector3(557.34, 2661.16, 42.18),
    ['org31'] = vector3(2680.34, 3515.4, 52.71),
    ['org32'] = vector3(1409.12, 3620.06, 34.89),
    ['org33'] = vector3(2389.51, 3310.14, 47.64),
    ['org34'] = vector3(2934.44, 4631.88, 48.54),
    ['org35'] = vector3(2728.65, 4142.12, 44.28),
    ['org36'] = vector3(2488.51, 3441.74, 51.07),
    ['org37'] = vector3(2662.09, 3272.92, 55.24),
    ['org38'] = vector3(2592.44, 3161.17, 50.83),
    ['org39'] = vector3(1174.47, 2725.05, 38.0),
    ['org40'] = vector3(2041.27, 3183.13, 45.22),
    ['org41'] = vector3(2411.59, 3137.7, 48.2),
    ['org42'] = vector3(2549.3, 341.68, 108.46),
    ['org43'] = vector3(1706.6, -1555.51, 112.63),
    ['org44'] = vector3(2832.01, 2799.7, 57.51),
    ['org45'] = vector3(884.46, -2177.13, 30.51),
    ['org64'] = vector3(726.73, 4170.97, 40.7),
    ['org47'] = vector3(784.16, -1625.04, 31.02),
    ['org48'] = vector3(906.73, -1518.72, 30.43),
    ['org49'] = vector3(911.06, -1265.17, 25.58),
    ['org50'] = vector3(703.63, -1142.61, 23.59),
    ['org51'] = vector3(-388.91, 4340.74, 56.16),
    ['org52'] = vector3(-244.71, 6065.94, 32.34),
    ['org53'] = vector3(1551.95, 2154.23, 78),
    ['org54'] = vector3(-29.6681, 3045.1851, 39.99),
    ['org55'] = vector3(1242.99, -3155.83, 5.52),
    ['org56'] = vector3(841.95, -1162.71, 25.26),
    ['org57'] = vector3(-189.47, -1289.82, 31.29),
    ['org58'] = vector3(1551.36, 2194.76, 78.87),
    ['org59'] = vector3(-1485.11, -199.82, 50.39),
    ['org60'] = vector3(190.44, 2456.29, 55.72),
    ['org61'] = vector3(153.04, 2279.83, 94.01),
    ['org62'] = vector3(-42.1, 1884.59, 195.45),
    ['org63'] = vector3(-1805.18, 442.2, 128.5),
    ['org46'] = vector3(1192.15, -1267.83, 35.16),
    ['org65'] = vector3(-762.14, 5947.61, 20.15),
    ['org66'] = vector3(781.49, 1274.58, 361.28),
    ['org67'] = vector3(-5.72, 3333.31, 41.63),
    ['org68'] = vector3(-765.14, 650.72, 145.5),
    ['org69'] = vector3(1320.61, 4314.57, 38.14),
    ['org70'] = vector3(-55.42, 6393.42, 31.49),
    ['org71'] = vector3(315.91, 501.47, 153.17),
    ['org80'] = vector3(-36.27, 2870.2, 59.62),
    ['org81'] = vector3(825.77, 2191.51, 52.41),
    ['org82'] = vector3(217.67, 2602.98, 45.82),
    ['org83'] = vector3(1963.87, 5180.14, 47.94),
    ['org84'] = vector3(-481.42, 6265.58, 13.41),
    ['org85'] = vector3(-105.76, 6534.99, 29.8),
    ['org86'] = vector3(281.97, 6789.24, 15.69),
    ['org87'] = vector3(-1094.84, 4947.85, 218.35),
    ['org88'] = vector3(-1605.51, -827.14, 10.05),
    ['org89'] = vector3(614.91, 2786.11, 43.48),
    ['org90'] = vector3(743.72, -1906.3, 29.41),
    ['org91'] = vector3(306.14, 365.3, 105.27),
    ['org92'] = vector3(582.8, 131.28, 98.04),
    ['org93'] = vector3(2175.12, 3504.89, 45.36),
    ['org94'] = vector3(304.59, 2821.0, 43.43),
    ['org95'] = vector3(2988.45, 3481.6, 72.49),
    ['org96'] = vector3(2554.25, 4668.09, 34.03),
    ['org97'] = vector3(2581.08, 464.92, 108.62),
    ['org98'] = vector3(1967.16, 4634.29, 41.1),
    ['org99'] = vector3(216.65, 1191.92, 225.78),
    ['org100'] = vector3(318.55, 494.98, 152.74),
    ['org101'] = vector3(-3177.21, 1295.4, 14.48),
    ['org102'] = vector3(379.41, 3583.48, 33.29),
    ['org103'] = vector3(-264.05, 2196.42, 130.39),
    ['org104'] = vector3(-287.64, 2535.57, 75.69),
    ['org105'] = vector3(-326.62, -1295.48, 31.37),
    ['org106'] = vector3(1214.05, 333.64, 81.99),
    ['org107'] = vector3(207.38, -2016.24, 18.56),
    ['org108'] = vector3(918.56, 3567.64, 33.76),
    ['org109'] = vector3(-1309.97, -1317.68, 4.87),
    ['org110'] = vector3(1812.57, 3924.07, 33.74),
    ['org111'] = vector3(-52.55, 375.58, 114.08),
    ['org112'] = vector3(-3102.67, 247.4, 12.33),
    ['org113'] = vector3(-2543.77, 2316.56, 33.21),
    ['org114'] = vector3(48.69, 6305.07, 31.36),
    ['org115'] = vector3(-85.74, 6494.25, 31.49),
    ['org116'] = vector3(1471.21, 6551.58, 14.01),
    ['org117'] = vector3(-358.63, 6062.01, 31.5),
    ['org118'] = vector3(-290.03, 6302.59, 31.49),
    ['org119'] = vector3(-55.42, 6393.42, 31.49),
    ['org120'] = vector3(-688.64, -2454.41, 13.9),
}


Config.MaleTshirt = 423
Config.MaleTshirtdrugi = 422
Config.FemaleTshirt = 520

Config.MaleVest = 199
Config.FemaleVest = 272

Config.Organizacje = {
    org1 = {
		praca = 'org1',
    },
    org2 = {
		praca = 'org2',
    },
    org3 = {
		praca = 'org3',
    },
    org4 = {
		praca = 'org4',
    },
    org5 = {
		praca = 'org5',
        Tshirt = 1,
		Vest = 21,
    },
    org6 = {
		praca = 'org6',
    },
    org7 = {
		praca = 'org7',
    },
    org8 = {
		praca = 'org8',
    },
    org9 = {
		praca = 'org9',
    },
    org10 = {
		praca = 'org10',
    },
    org11 = {
		praca = 'org11',
    },
    org12 = {
		praca = 'org12',
    },
    org13 = {
		praca = 'org13',
        Tshirt = 8,
		Vest = 10,
    },
    org14 = {
		praca = 'org14',
        Tshirt = 13,
    },
    org15 = {
		praca = 'org15',
    },
    org16 = {
		praca = 'org16',
    },
    org17 = {
		praca = 'org17',
    },
    org18 = {
		praca = 'org18',
    },
    org19 = {
		praca = 'org19',
    },  
    org20 = {
		praca = 'org20',
    },
    org21 = {
		praca = 'org21',
    },
    org22 = {
		praca = 'org22',
        Tshirt = 10,
		Vest = 6,
    },
    org23 = {
		praca = 'org23',
    },
    org24 = {
		praca = 'org24',
    },
    org25 = {
		praca = 'org25',
        Tshirt = 4,
		Vest = 20,
    },
    org26 = {
		praca = 'org26',
    },
    org27 = {
		praca = 'org27',
    },
    org28 = {
		praca = 'org28',
        Tshirt = 2,
		Vest = 15,
    },
    org29 = {
		praca = 'org29',
    },
    org30 = {
		praca = 'org30',
    },
    org31 = {
		praca = 'org31',
        Tshirt = 1,
		Vest = 5,
    },
    org32 = {
		praca = 'org32',
        Tshirt = 5,
		Vest = 8,
    },
    org33 = {
		praca = 'org33',
    },
    org34 = {
		praca = 'org34',
    },
    org35 = {
		praca = 'org35',
    },
    org36 = {
		praca = 'org36',
    },
    org37 = {
		praca = 'org37',
    },
    org38 = {
		praca = 'org38',
    },
    org39 = {
		praca = 'org39',
    },
    org40 = {
		praca = 'org40',
    },
    org41 = {
		praca = 'org41',
        Tshirt = 12,
    },
    org42 = {
		praca = 'org42',
    },
    org43 = {
		praca = 'org43',
    },
    org44 = {
		praca = 'org44',
        Tshirt = 9,
		Vest = 12,
    },
    org45 = {
		praca = 'org45',
    },
    org46 = {
		praca = 'org46',
    },
    org47 = {
		praca = 'org47',
    },
    org48 = {
		praca = 'org48',
    },
    org49 = {
		praca = 'org49',
    },
    org50 = {
		praca = 'org50',
    },
    org51 = {
		praca = 'org51',
    },
    org52 = {
		praca = 'org52',
    },
    org53 = {
		praca = 'org53',
    },
    org54 = {
		praca = 'org54',
    },
    org55 = {
		praca = 'org55',
    },
    org56 = {
		praca = 'org56',
    },
    org57 = {
		praca = 'org57',
    },
    org58 = {
		praca = 'org58',
    },
    org59 = {
		praca = 'org59',
    },
    org60 = {
		praca = 'org60',
    },
    org61 = {
		praca = 'org61',
    },
    org62 = {
		praca = 'org62',
    },
    org63 = {
		praca = 'org63',
    },
    org64 = {
		praca = 'org64',
    },
    org65 = {
		praca = 'org65',
    },
    org66 = {
		praca = 'org66',
    },
    org67 = {
		praca = 'org67',
    },
    org68 = {
		praca = 'org68',
    },
    org69 = {
		praca = 'org69',
        Tshirt = 11,
		Vest = 14,
    },
    org70 = {
		praca = 'org70',
    },
    org71 = {
		praca = 'org71',
    },
    org72 = {
		praca = 'org72',
    },
    org73 = {
		praca = 'org73',
    },
    org74 = {
		praca = 'org74',
    },
    org80 = {
      praca = 'org80',
      },
      org81 = {
      praca = 'org81',
      },
      org82 = {
      praca = 'org82',
      },
      org83 = {
      praca = 'org83',
      },
      org84 = {
      praca = 'org84',
      },
      org85 = {
      praca = 'org85',
      },
      org86 = {
      praca = 'org86',
      },
      org87 = {
      praca = 'org87',
      },
      org88 = {
      praca = 'org88',
      },
      org89= {
      praca = 'org89',
      },
      org90 = {
      praca = 'org90',
      },
      org91 = {
      praca = 'org91',
      },
      org92 = {
      praca = 'org92',
      },
      org93 = {
      praca = 'org93',
      },
      org94 = {
      praca = 'org94',
      },
      org95 = {
      praca = 'org95',
      },
      org96 = {
      praca = 'org96',
      },
      org97 = {
      praca = 'org97',
      },
      org98 = {
        praca = 'org98',
      },
      org99 = {
      praca = 'org99',
      },
      org100 = {
      praca = 'org100',
      },
      org101 = {
      praca = 'org101',
      },
      org102 = {
      praca = 'org102',
      },
      org103 = {
      praca = 'org103',
      },
      org104 = {
      praca = 'org104',
      },
      org105 = {
      praca = 'org105',
      },
      org106 = {
      praca = 'org106',
      },
      org107 = {
      praca = 'org107',
      },
      org108 = {
      praca = 'org108',
      },
      org109 = {
      praca = 'org109',
      },
      org110 = {
      praca = 'org110',
      },
      org110 = {
      praca = 'org111',
      },
      org111 = {
        praca = 'org112',
      },
      org112 = {
      praca = 'org113',
      },
      org113 = {
      praca = 'org114',
      },
      org114 = {
      praca = 'org114',
      },
      org115 = {
      praca = 'org115',
      },
      org116 = {
      praca = 'org116',
      },
      org117 = {
      praca = 'org117',
      },
      org118 = {
      praca = 'org118',
      },
      org119 = {
      praca = 'org119',
      },
      org120 = {
        praca = 'org120',
      },       
}

Config.Zones = {
    --ORGANIZACJE MAFIA
    ['org27'] = {
        Cloakroom = {
            coords = vector3(1399.516, 1139.5142, 113.3857),
        },
        Inventory = {
            from = 1
        },
        Licenses = {
            from = 3
        },
        MainMenu = {
            coords = vector3(1394.9, 1149.82, 114.33-0.95),
            from = 4
        },
        Barabasz = {
 
        }
    },
    --ORGANIZACJE GANGI
    ['org1'] = {
        Cloakroom = {
            coords = vector3(-155.41, -1603.87, 34.15),
        },
        Inventory = {
            from = 1
        },
        Licenses = {
            from = 3
        },
        MainMenu = {
            coords = vector3(-136.81, -1609.26, 34.03),
            from = 4
        },
        Barabasz = {
 
        }
    },
    ['org2'] = {
      Cloakroom = {
          coords = vector3(1444.18, -1492.02, 62.8),
      },
      Inventory = {
          from = 1
      },
      Licenses = {
          from = 3
      },
      MainMenu = {
          coords = vector3(1435.48, -1489.32, 62.8),
          from = 4
      },
      Barabasz = {

      }
  },
  ['org3'] = {
    Cloakroom = {
        coords = vector3(-723.23, -871.39, 25.87),
    },
    Inventory = {
        from = 1
    },
    Licenses = {
        from = 3
    },
    MainMenu = {
        coords = vector3(-725.78, -870.53, 22.31),
        from = 4
    },
    Barabasz = {

    }
},
    ['org4'] = {
        Cloakroom = {
            coords = vector3(-1568.4, -405.35, 47.36),
        },
        Inventory = {
            from = 1
        },
        Licenses = {
            from = 3
        },
        MainMenu = {
            coords = vector3(-1574.6, -409.46, 47.36),
            from = 4
        },
        Barabasz = {
 
        }
    },
    ['org5'] = {
      Cloakroom = {
          coords = vector3(-80.48, -1808.87, 32.66),
      },
      Inventory = {
          from = 1
      },
      Licenses = {
          from = 3
      },
      MainMenu = {
          coords = vector3(-78.99, -1811.02, 19.89),
          from = 4
      },
      Barabasz = {

      }
  },
  ['org6'] = {
    Cloakroom = {
        coords = vector3(-1152.75, -1516.83, 9.73),
    },
    Inventory = {
        from = 1
    },
    Licenses = {
        from = 3
    },
    MainMenu = {
        coords = vector3(-1157.81, -1518.35, 9.73),
        from = 4
    },
    Barabasz = {

    }
},
    ['org7'] = {
      Cloakroom = {
        coords = vector3(344.7008, -2022.0562, 21.4449),
    },
    Inventory = {
        from = 1
    },
    Licenses = {
        from = 3
    },
    MainMenu = {
        coords = vector3(337.36, -2012.01, 21.49),
        from = 4
        },
        Barabasz = {
 
        }
    },
    ['org8'] = {
        Cloakroom = {
            coords = vector3(433.08, -1890.34, 30.83),
        },
        Inventory = {
            from = 1
        },
        Licenses = {
            from = 3
        },
        MainMenu = {
            coords = vector3(435.74, -1888.66, 30.83),
            from = 4
        },
        Barabasz = {
 
        }
    },
    ['org9'] = {
        Cloakroom = {
            coords = vector3(992.08, -135.62, 73.17),
        },
        Inventory = {
            from = 1
        },
        Licenses = {
            from = 3
        },
        MainMenu = {
            coords = vector3(986.15, -133.65, 77.99),
            from = 4
        },
        Barabasz = {
 
        }
    },
    ['org10'] = {
        Cloakroom = {
            coords = vector3(1376.18, -2097.63, 47.7),
        },
        Inventory = {
            from = 1
        },
        Licenses = {
            from = 3
        },
        MainMenu = {
            coords = vector3(1374.82, -2093.8, 47.7),
            from = 4
        },
        Barabasz = {
 
        }
    },
    ['org11'] = {
        Cloakroom = {
            coords = vector3(907.12, -484.22, 58.54),
        },
        Inventory = {
            from = 1
        },
        Licenses = {
            from = 3
        },
        MainMenu = {
            coords = vector3(905.66, -487.71, 58.54),
            from = 4
        },
        Barabasz = {
 
        }
    },
    ['org12'] = {
        Cloakroom = {
            coords = vector3(-1973.4, 244.32, 90.32),
        },
        Inventory = {
            from = 1
        },
        Licenses = {
            from = 3
        },
        MainMenu = {
            coords = vector3(-1975.2, 248.77, 86.91),
            from = 4
        },
        Barabasz = {
 
        }
    },
    ['org13'] = {
        Cloakroom = {
            coords = vector3(822.88, -2339.2, 29.43),
        },
        Inventory = {
            from = 1
        },
        Licenses = {
            from = 3
        },
        MainMenu = {
            coords = vector3(819.57, -2348.91, 29.43),
            from = 4
        },
        Barabasz = {
 
        }
    },
    ['org14'] = {
      Cloakroom = {
          coords = vector3(735.40, -807.28, 15.30),
      },
      Inventory = {
          from = 1
      },
      Licenses = {
          from = 3
      },
      MainMenu = {
          coords = vector3(725.00, -791.51, 15.50),
          from = 4
      },
      Barabasz = {

      }
  },
}


Config.OpiumMenu = {
	coords = vector3(727.03, -796.15, 15.30),
	owner = 'org14',
	from = 5
}

Config.ExctasyMenu = {
	coords = vector3(-59.21, -811.30, 242.43),
	owner = 'org14',
	from = 3
}

Config.NotGang = {
    'org14',
    'org15',
    'org16',
    'org17',
    'org18',
    'org19',
    'org20',
    'org21',
    'org22',
    'org23',
    'org24',
    'org25',
    'org26',
    'org27',
    'org28',
    'org29',
    'org30',
    'org31',
    'org32',
    'org33',
    'org34',
    'org35',
    'org36',
    'org37',
    'org38',
    'org39',
    'org40',
    'org41',
    'org42',
    'org43',
    'org44',
    'org45',
    'org46',
    'org47',
    'org48',
    'org49',
    'org50',
    'org51',
    'org52',
    'org53',
    'org54',
    'org55',
    'org56',
    'org57',
    'org58',
    'org59',
    'org60',
    'org61',
    'org62',
    'org63',
    'org64',
    'org65',
    'org66',
    'org67',
    'org68',
    'org69',
    'org70',
    'org71',
    'org72',
    'org73',
    'org74',
    'org80',
    'org81',
    'org82',
    'org83',
    'org84',
    'org85',
    'org86',
    'org87',
    'org88',
    'org89',
    'org90',
    'org91',
    'org92',
    'org93',
    'org94',
    'org95',
    'org96',
    'org97',
    'org98',
    'org99',
    'org100',
    'org101',
    'org102',
    'org103',
    'org104',
    'org105',
    'org106',
    'org107',
    'org108',
    'org109',
    'org110',
    'org111',
    'org112',
    'org113',
    'org114',
    'org115',
    'org116',
    'org117',
    'org118',
    'org119',
    'org120',
}

Config.DriveByList = {
  ['org1'] = true,
  ['org2'] = true,
  ['org3'] = true,
  ['org4'] = true,
  ['org5'] = true,
  ['org6'] = true,
  ['org7'] = true,
  ['org8'] = true,
  ['org9'] = true,
  ['org10'] = true,
  ['org11'] = true,
  ['org12'] = true,
  ['org13'] = true,
}
