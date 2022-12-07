Config = {}

Config.Key = 38 -- [E] Key to open the interaction, check here the keys ID: https://docs.fivem.net/docs/game-references/controls/#controls

Config.AutoCamPosition = true -- If true it'll set the camera position automatically

Config.AutoCamRotation = true -- If true it'll set the camera rotation automatically

Config.HideMinimap = false -- If true it'll hide the minimap when interacting with an NPC

Config.UseOkokTextUI = true -- If true it'll use okokTextUI 

Config.CameraAnimationTime = 1000 -- Camera animation time: 1000 = 1 second

-- Website too see peds name: https://wiki.rage.mp/index.php?title=Peds

Config.TalkToNPC = {
	-- Banki
	{
		npc = 'csb_tomcasino', -- ID 1
		active = true,		
		extended = false,								
		header = 'Pracownik banku', 							
		name = 'Fleeca', 									
		uiText = "pracownikiem banku",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(-2960.8, 483.305, 14.7), 				
		heading = 340.04,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.5, 									
		options = {													
			{'Chcę uzyskać dostęp do konta', 'open_banking', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 277,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Bank',
		},
	},
	{
		npc = 'csb_tomcasino', -- ID 1
		active = true,		
		extended = false,								
		header = 'Pracownik banku', 							
		name = 'Fleeca', 									
		uiText = "pracownikiem banku",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(-112.14, 6471.25, 31.62-0.99), 				
		heading = 133.04,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.5, 									
		options = {													
			{'Chcę uzyskać dostęp do konta', 'open_banking', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 277,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Bank',
		},
	},
	{
		npc = 'csb_tomcasino',  -- ID 2
		active = true,		
		extended = false,								
		header = 'Pracownik banku', 							
		name = 'Fleeca', 									
		uiText = "pracownikiem banku",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(-1211.4, -331.84, 36.78), 				
		heading = 340.04,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.5, 									
		options = {													
			{'Chcę uzyskać dostęp do konta', 'open_banking', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 277,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Bank',
		},
	},
	{
		npc = 'csb_tomcasino',  -- ID 3
		active = true,		
		extended = false,								
		header = 'Pracownik banku', 							
		name = 'Fleeca', 									
		uiText = "pracownikiem banku",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(-351.34, -51.356, 48.05), 				
		heading = 340.04,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.5, 									
		options = {													
			{'Chcę uzyskać dostęp do konta', 'open_banking', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 277,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Bank',
		},
	},
	{
		npc = 'csb_tomcasino', -- ID 4
		active = true,		
		extended = false,								
		header = 'Pracownik banku', 							
		name = 'Fleeca', 									
		uiText = "pracownikiem banku",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(313.973, -280.63, 53.16), 				
		heading = 340.04,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.5, 									
		options = {													
			{'Chcę uzyskać dostęp do konta', 'open_banking', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 277,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Bank',
		},
	},
	{
		npc = 'csb_tomcasino', -- ID 5 
		active = true,		
		extended = false,								
		header = 'Pracownik banku', 							
		name = 'Fleeca', 									
		uiText = "pracownikiem banku",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(1174.88, 2708.24, 37.09), 				
		heading = 340.04,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.5, 									
		options = {													
			{'Chcę uzyskać dostęp do konta', 'open_banking', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 277,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Bank',
		},
	},
	{
		npc = 'csb_tomcasino', -- ID 6 
		active = true,		
		extended = false,								
		header = 'Pracownik banku', 							
		name = 'Fleeca', 									
		uiText = "pracownikiem banku",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(149.663, -1042.3, 28.37), 				
		heading = 340.04,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.5, 									
		options = {													
			{'Chcę uzyskać dostęp do konta', 'open_banking', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 277,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Bank',
		},
	},
	{
		npc = 'cs_solomon', -- ID 7 		
		active = true,								
		header = 'Pracownik banku', 							
		name = 'Pacific Standard', 									
		uiText = "pracownikiem banku",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(254.17, 222.8, 105.3), 				
		heading = 160.0,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 3, 									
		options = {													
			{'Chcę uzyskać dostęp do konta', 'open_banking', 'c'},		
			-- {'Chciałbym założyć konto', 'crew:ustawKontoBankowe', 's'},		
			-- {"Chcę usunąć konto", 'crew:usunKontoBankowe', 's'}, 
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 106,
			['scale'] = 0.7,
			['colour'] = 5,
			['text'] = 'Doradca bankowy',
		},
	},
	{
		npc = 'cs_solomon', -- ID 7 		
		active = true,								
		header = 'Pracownik banku', 							
		name = 'Maze Bank', 									
		uiText = "pracownikiem banku",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(-1310.22, -821.97, 17.14-0.99), 				
		heading = 216.0,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 3.5, 									
		options = {													
			{'Chcę uzyskać dostęp do konta', 'open_banking', 'c'},		
			-- {'Chciałbym założyć konto', 'crew:ustawKontoBankowe', 's'},		
			-- {"Chcę usunąć konto", 'crew:usunKontoBankowe', 's'}, 
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 106,
			['scale'] = 0.7,
			['colour'] = 5,
			['text'] = 'Doradca bankowy',
		},
	},
	{
		npc = 'a_f_y_business_01', -- ID 8 	
		active = true,									
		header = 'Pracownik', 							
		name = 'Operatora komórkowego', 									
		uiText = "pracownikiem operatora komórkowego",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(148.71, -234.75, 53.45), 				
		heading = 341.81,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 3.0, 									
		options = {													
			{'Oferta CookieLTE', 'shop:open:cookie', 'c'},
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 459,
			['scale'] = 0.7,
			['colour'] = 3,
			['text'] = 'Operator komórkowy',
		},
	},



	-- Sklepy
	{
		npc = 'mp_m_shopkeep_01', -- ID 10 
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(372.54, 326.51, 102.57), 				
		heading = 247.0,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 1.5, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 52,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Sklep - Supermarket',
		},
	},
	{
		npc = 'mp_m_shopkeep_01', -- ID 11 
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(2557.1, 380.83, 107.662), 				
		heading = 3.55,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 1.5, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 52,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Sklep - Supermarket',
		},
	},
	{
		npc = 'mp_m_shopkeep_01', -- ID 12 
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(-3038.939, 584.64, 6.908), 				
		heading = 3.55,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 1.5, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 52,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Sklep - Supermarket',
		},
	},
	{
		npc = 'mp_m_shopkeep_01', -- ID 13 
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(-3242.197, 999.98, 11.830), 				
		heading = 3.55,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 1.5, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 52,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Sklep - Supermarket',
		},
	},
	{
		npc = 'mp_m_shopkeep_01', -- ID 14 
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(549.07, 2671.87, 41.16), 				
		heading = 94.55,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 1.5, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 52,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Sklep - Supermarket',
		},
	},
	{
		npc = 'mp_m_shopkeep_01', -- ID 15 
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(1960.24, 3739.6, 31.343), 				
		heading = 300.55,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 1.5, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 52,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Sklep - Supermarket',
		},
	},
	{
		npc = 'mp_m_shopkeep_01', -- ID 16 
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(2678.28, 3279.28, 54.241), 				
		heading = 332.55,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 1.5, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 52,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Sklep - Supermarket',
		},
	},
	{
		npc = 'mp_m_shopkeep_01',  -- ID 17
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(1727.56, 6414.72, 34.04), 				
		heading = 247.55,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 1.5, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 52,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Sklep - Supermarket',
		},
	},
	{
		npc = 'mp_m_shopkeep_01',  -- ID 17
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(24.36, -1344.91, 29.48-0.99), 				
		heading = 269.55,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 1.5, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 52,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Sklep - Supermarket',
		},
	},

	--techniczny
	{
		npc = 'mp_m_shopkeep_01',  -- ID 18
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(46.57, -1749.66, 29.63-0.99), 				
		heading = 55.13,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 52,
			['scale'] = 0.7,
			['colour'] = 6,
			['text'] = 'Sklep - Techniczny',
		},
	},
	{
		npc = 'mp_m_shopkeep_01',  -- ID 18
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(2747.72, 3472.83, 55.67-0.99), 				
		heading = 248.13,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 52,
			['scale'] = 0.7,
			['colour'] = 6,
			['text'] = 'Sklep - Techniczny',
		},
	},
	{
		npc = 'mp_m_shopkeep_01',  -- ID 18
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(-57.8, 6523.21, 31.49-0.99), 				
		heading = 320.53,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 52,
			['scale'] = 0.7,
			['colour'] = 6,
			['text'] = 'Sklep - Techniczny',
		},
	},

	-- Sklepy - monopolowe
	{
		npc = 'mp_m_shopkeep_01',  -- ID 18
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(1134.17, -983.08, 45.42), 				
		heading = 282.55,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 52,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Sklep - Monopolowy',
		},
	},
	{
		npc = 'mp_m_shopkeep_01',  -- ID 19
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(-1221.27, -908.19, 11.326), 				
		heading = 35.55,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 52,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Sklep - Monopolowy',
		},
	},
	{
		npc = 'mp_m_shopkeep_01',  -- ID 20
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(-1486.67, -377.6, 39.163), 				
		heading = 136.55,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 52,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Sklep - Monopolowy',
		},
	},
	{
		npc = 'mp_m_shopkeep_01',-- ID 21 
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(-2966.29, 391.43, 14.04), 				
		heading = 86.55,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 52,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Sklep - Monopolowy',
		},
	},
	{
		npc = 'mp_m_shopkeep_01',-- ID 22 
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(1165.17, 2710.91, 37.167), 				
		heading = 180.55,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 52,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Sklep - Monopolowy',
		},
	},
	{
		npc = 'mp_m_shopkeep_01', -- ID 23
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(1392.19, 3606.29, 33.98), 				
		heading = 180.55,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 52,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Sklep - Monopolowy',
		},
	},
	


	-- Stacje benzynowe
	{
		npc = 'mp_m_shopkeep_01', -- ID 25
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(-47.3, -1758.73, 28.42), 				
		heading = 44.55,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 52,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Sklep - Stacja benzynowa',
		},
	},
	{
		npc = 'mp_m_shopkeep_01', -- ID 26
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(1164.95, -323.64, 68.21), 				
		heading = 97.55,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 52,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Sklep - Stacja benzynowa',
		},
	},
	{
		npc = 'mp_m_shopkeep_01', -- ID 27
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(-706.07, -914.52, 18.225), 				
		heading = 89.55,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 52,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Sklep - Stacja benzynowa',
		},
	},
	{
		npc = 'mp_m_shopkeep_01', -- ID 28
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(-1819.54, 793.55, 137.09), 				
		heading = 132.55,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 52,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Sklep - Stacja benzynowa',
		},
	},
	{
		npc = 'mp_m_shopkeep_01', -- ID 29
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(1697.23, 4923.33, 41.063), 				
		heading = 324.55,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 52,
			['scale'] = 0.7,
			['colour'] = 2,
			['text'] = 'Sklep - Stacja benzynowa',
		},
	},
	--wiezienie
	{
		npc = 's_m_y_pilot_01', -- ID 29
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(1653.18, 2542.79, 45.56-0.99), 				
		heading = 230.97,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {},
	},

	--kasyno
	{
		npc = 's_m_y_casino_01', -- ID 29
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(933.69, 41.5, 81.08-0.99), 				
		heading = 57.71,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {},
	},

	--STRAGAN
	{
		npc = 's_m_o_busker_01', -- ID 30
		active = true,										
		header = 'Pracownik', 							
		name = 'Straganu', 									
		uiText = "pracownikiem straganu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(1477.68, 2723.15, 37.58-0.99), 				
		heading = 32.58,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 514,
			['scale'] = 0.7,
			['colour'] = 25,
			['text'] = 'Sklep - Stragan',
		},
	},

	{
		npc = 's_m_o_busker_01', -- ID 30
		active = true,										
		header = 'Pracownik', 							
		name = 'Straganu', 									
		uiText = "pracownikiem straganu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(-1043.5, 5326.96, 44.56-0.99), 				
		heading = 42.58,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 514,
			['scale'] = 0.7,
			['colour'] = 25,
			['text'] = 'Sklep - Stragan',
		},
	},
	{
		npc = 's_m_o_busker_01', -- ID 30
		active = true,										
		header = 'Pracownik', 							
		name = 'Straganu', 									
		uiText = "pracownikiem straganu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(1087.72, 6509.83, 21.06-0.99), 				
		heading = 191.58,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 514,
			['scale'] = 0.7,
			['colour'] = 25,
			['text'] = 'Sklep - Stragan',
		},
	},
	{
		npc = 's_m_o_busker_01', -- ID 30
		active = true,										
		header = 'Pracownik', 							
		name = 'Straganu', 									
		uiText = "pracownikiem straganu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(1168.53, -426.52, 67.09-0.99), 				
		heading = 264.58,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 514,
			['scale'] = 0.7,
			['colour'] = 25,
			['text'] = 'Sklep - Stragan',
		},
	},
	{
		npc = 's_m_o_busker_01', -- ID 30
		active = true,										
		header = 'Pracownik', 							
		name = 'Straganu', 									
		uiText = "pracownikiem straganu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(-1194.39, -1543.94, 4.37-0.99), 				
		heading = 129.58,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 514,
			['scale'] = 0.7,
			['colour'] = 25,
			['text'] = 'Sklep - Stragan',
		},
	},

	--klub
	{
		npc = 's_m_y_barman_01', -- ID 30
		active = true,										
		header = 'Pracownik', 							
		name = 'Klubu', 									
		uiText = "pracownikiem klubu",					
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(129.21, -1283.56, 29.26-0.99), 				
		heading = 118.58,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 93,
			['scale'] = 0.7,
			['colour'] = 27,
			['text'] = 'Sklep - Klub Nocny',
		},
	},
	{
		npc = 's_m_y_barman_01', -- ID 30
		active = true,										
		header = 'Pracownik', 							
		name = 'Klubu', 									
		uiText = "pracownikiem klubu",					
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(-561.78, 287.19, 81.186), 				
		heading = 267.55,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 93,
			['scale'] = 0.7,
			['colour'] = 27,
			['text'] = 'Sklep - Klub Nocny',
		},
	},
	{
		npc = 's_m_y_barman_01', -- ID 30
		active = true,										
		header = 'Pracownik', 							
		name = 'Klubu', 									
		uiText = "pracownikiem klubu",					
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(-15.55, 220.35, 99.7-0.99), 				
		heading = 261.58,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 93,
			['scale'] = 0.7,
			['colour'] = 27,
			['text'] = 'Sklep - Klub Nocny',
		},
	},

	--alko
	{
		npc = 'a_m_y_business_02', -- ID 30
		active = true,										
		header = 'Pracownik', 							
		name = 'sklepu z alkoholami', 									
		uiText = "pracownikiem sklepu z alkoholami",					
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(-818.78, -575.22, 30.27-0.99), 				
		heading = 307.58,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 93,
			['scale'] = 0.7,
			['colour'] = 4,
			['text'] = 'Sklep - Alkoholowy',
		},
	},
	{
		npc = 'a_m_y_business_02', -- ID 30
		active = true,										
		header = 'Pracownik', 							
		name = 'sklepu z alkoholami', 									
		uiText = "pracownikiem sklepu z alkoholami",					
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(287.03, 137.17, 104.29-0.99), 				
		heading = 344.58,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 93,
			['scale'] = 0.7,
			['colour'] = 4,
			['text'] = 'Sklep - Alkoholowy',
		},
	},
	{
		npc = 'a_m_y_business_02', -- ID 30
		active = true,										
		header = 'Pracownik', 							
		name = 'sklepu z alkoholami', 									
		uiText = "pracownikiem sklepu z alkoholami",					
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(-1040.55, -1475.13, 5.57-0.99), 				
		heading = 35.75,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {
			['sprite'] = 93,
			['scale'] = 0.7,
			['colour'] = 4,
			['text'] = 'Sklep - Alkoholowy',
		},
	},

	--MAGAZYNKI
	{
		npc = 's_m_y_ammucity_01', -- ID 30
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu z bronią', 									
		uiText = "pracownikiem sklepu z bronią",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(12.08, -1106.96, 29.79-0.99), 				
		heading = 340.97,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {},
	},
	{
		npc = 's_m_y_ammucity_01', -- ID 30
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu z bronią', 									
		uiText = "pracownikiem sklepu z bronią",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(-331.17, 6079.22, 31.45-0.99), 				
		heading = 313.97,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {},
	},
	{
		npc = 's_m_y_ammucity_01', -- ID 30
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu z bronią', 									
		uiText = "pracownikiem sklepu z bronią",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(1692.92, 3755.21, 34.7-0.99), 				
		heading = 316.97,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {													
			
		},
		blip = {},
	},
	-- Weapon shop
	{
		npc = 'ig_casey', -- ID 30
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu z bronią', 									
		uiText = "pracownikiem sklepu z bronią",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(-662.14, -933.32, 20.83), 				
		heading = 180.55,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'weaponshop:openShop', 'c'},		
		},
		jobs = {													
			
		},
		blip = {},
	},
	{
		npc = 'ig_casey', -- ID 31
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu z bronią', 									
		uiText = "pracownikiem sklepu z bronią",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(810.0, -2159.16, 28.63), 				
		heading = 357.55,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'weaponshop:openShop', 'c'},		
		},
		jobs = {													
			
		},
		blip = {},
	},
	{
		npc = 'ig_casey', -- ID 32
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu z bronią', 									
		uiText = "pracownikiem sklepu z bronią",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(1692.03, 3761.03, 33.71), 				
		heading = 226.55,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'weaponshop:openShop', 'c'},		
		},
		jobs = {													
			
		},
		blip = {},
	},
	{
		npc = 'ig_casey', -- ID 33
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu z bronią', 									
		uiText = "pracownikiem sklepu z bronią",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(-331.72, 6085.12, 30.45), 				
		heading = 226.55,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'weaponshop:openShop', 'c'},		
		},
		jobs = {													
			
		},
		blip = {},
	},
	{
		npc = 'ig_casey', -- ID 34
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu z bronią', 									
		uiText = "pracownikiem sklepu z bronią",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(253.84, -50.55, 68.94), 				
		heading = 72.55,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'weaponshop:openShop', 'c'},		
		},
		jobs = {													
			
		},
		blip = {},
	},
	{
		npc = 'ig_casey', -- ID 35
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu z bronią', 									
		uiText = "pracownikiem sklepu z bronią",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(22.67, -1105.53, 28.8), 				
		heading = 156.99,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'weaponshop:openShop', 'c'},		
		},
		jobs = {													
			
		},
		blip = {},
	},
	{
		npc = 'ig_casey', -- ID 36
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu z bronią', 									
		uiText = "pracownikiem sklepu z bronią",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(2567.7, 292.31, 107.73), 				
		heading = 0.0,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'weaponshop:openShop', 'c'},		
		},
		jobs = {													
			
		},
		blip = {},
	},
	{
		npc = 'ig_casey', -- ID 37
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu z bronią', 									
		uiText = "pracownikiem sklepu z bronią",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(-1119.17, 2699.8, 17.55), 				
		heading = 217.0,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'weaponshop:openShop', 'c'},		
		},
		jobs = {													
			
		},
		blip = {},
	},
	{
		npc = 'ig_casey', -- ID 38
		active = true,										
		header = 'Pracownik', 							
		name = 'Sklepu z bronią', 									
		uiText = "pracownikiem sklepu z bronią",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(842.3, -1035.46, 27.19), 				
		heading = 357.0,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'weaponshop:openShop', 'c'},		
		},
		jobs = {													
			
		},
		blip = {},
	},

	--lombard 
	{
		npc = 's_m_m_strpreach_01', -- ID 46
		active = true,										
		header = 'Biznesman', 							
		name = 'Sklepu', 									
		uiText = "pracownikiem sklepu",						
		dialog = 'W czym mogę pomóc?',					
		coordinates = vector3(-623.42, -230.46, 38.05-0.99), 				
		heading = 146.36,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż mi asortyment', 'shop:open:cookie', 'c'},		
		},
		jobs = {},
		blip = {},
	},

	--apteka

	-- Dark markety
	{
		npc = 'u_m_m_streetart_01', -- ID 47
		active = true,										
		header = 'Handlarz', 							
		name = 'Bronią', 									
		uiText = "handlarzem bronią",						
		dialog = 'Co chcesz kupić?',					
		coordinates = vector3(1469.65, 6550.10, 14.00), 				
		heading = 351.97,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż co masz', 'weaponshop:openDarkShop', 'c'},		
		},
		jobs = {},
		blip = {},
	},

	{
		npc = 'u_m_m_streetart_01', -- ID 47
		active = true,										
		header = 'Handlarz', 							
		name = 'Bronią', 									
		uiText = "handlarzem bronią",						
		dialog = 'Co chcesz kupić?',					
		coordinates = vector3(-1106.64, -1639.78, 3.7), 				
		heading = 300.97,											
		camOffset = vector3(0.0, 0.0, 0.0), 						
		camRotation = vector3(0.0, 0.0, 0.0),						
		interactionRange = 2.0, 									
		options = {													
			{'Pokaż co masz', 'shop:open:cookie', 'c'},		
		},
		jobs = {},
		blip = {},
	},
}