--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
-- BuildingClasses
--------------------------------
INSERT INTO BuildingClasses 	
			(Type, 									DefaultBuilding, 				Description)
VALUES		('BUILDINGCLASS_JFD_SHUL',				'BUILDING_JFD_SHUL_GOLD',		'TXT_KEY_BUILDING_JFD_SHUL_GOLD'),
			('BUILDINGCLASS_JFD_ISINGLASS_TRADE',	'BUILDING_JFD_ISINGLASS_TRADE',	'TXT_KEY_BUILDING_JFD_ISINGLASS_TRADE');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
-- Buildings
--------------------------------	
INSERT INTO Buildings 	
			(Type, 					BuildingClass, PrereqTech,			Cost, GoldMaintenance,  MinAreaSize, TradeRouteLandGoldBonus, 	ConquestProb, 	Description, 					Civilopedia, 						Help, 								Strategy,								ArtDefineTag, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_SHUL'),	BuildingClass, ('TECH_CURRENCY'),	Cost, 0,				MinAreaSize, 200, 						66, 			('TXT_KEY_BUILDING_JFD_SHUL'), 	('TXT_KEY_CIV5_JFD_SHUL_TEXT'),		('TXT_KEY_BUILDING_JFD_SHUL_HELP'), ('TXT_KEY_BUILDING_JFD_SHUL_STRATEGY'),	ArtDefineTag, 3, 				('JFD_KHAZARIA_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';		

INSERT INTO Buildings 	
			(Type, 						 		BuildingClass, 							NumTradeRouteBonus,	TradeRouteLandGoldBonus, 	Defense,	GreatWorkCount, Cost,	FaithCost,	PrereqTech,	NeverCapture,	 Description, 								Help)
VALUES		('BUILDING_JFD_ISINGLASS_TRADE', 	'BUILDINGCLASS_JFD_ISINGLASS_TRADE', 	2,					0, 							0,			-1, 			-1,		-1, 		null, 		1,				'TXT_KEY_BUILDING_JFD_ISINGLASS_TRADE', 	'TXT_KEY_BUILDING_JFD_ISINGLASS_TRADE_HELP'),
			('BUILDING_JFD_BEK_MOUNTED_XP', 	'BUILDINGCLASS_JFD_SHUL',				0,					0, 							0,			-1, 			-1,		-1, 		null, 		1,				'TXT_KEY_BUILDING_JFD_BEK_MOUNTED_XP', 		'TXT_KEY_BUILDING_JFD_BEK_MOUNTED_XP_HELP'),
			('BUILDING_JFD_SHUL_GOLD', 			'BUILDINGCLASS_JFD_SHUL',				0,					100, 						0,			-1, 			-1,		-1, 		null, 		1,				'TXT_KEY_BUILDING_JFD_SHUL_GOLD', 			'TXT_KEY_BUILDING_JFD_SHUL_GOLD_HELP'),
			('BUILDING_JFD_NEGATIVE_DEFENSE', 	'BUILDINGCLASS_JFD_SHUL',				0,					0, 							-100,		-1, 			-1,		-1, 		null, 		1,				'TXT_KEY_BUILDING_JFD_NEGATIVE_DEFENSE',	'TXT_KEY_BUILDING_JFD_NEGATIVE_DEFENSE_HELP');
--------------------------------	
-- Building_YieldChanges
--------------------------------	
INSERT INTO Building_YieldChanges 	
			(BuildingType, 			YieldType, Yield)
SELECT		('BUILDING_JFD_SHUL'),	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_TEMPLE';	
--------------------------------	
-- Building_UnitCombatFreeExperiences
--------------------------------	
INSERT INTO Building_UnitCombatFreeExperiences 	
			(BuildingType, 					UnitCombatType,			Experience)
VALUES		('BUILDING_JFD_BEK_MOUNTED_XP',	'UNITCOMBAT_MOUNTED',	10);
--------------------------------	
-- Building_ClassesNeededInCity
--------------------------------	
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 			BuildingClassType)
SELECT		('BUILDING_JFD_SHUL'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_TEMPLE';	
--------------------------------	
-- Building_Flavors
--------------------------------	
INSERT INTO Building_Flavors 	
			(BuildingType, 			FlavorType, Flavor)
SELECT		('BUILDING_JFD_SHUL'),	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_TEMPLE';

INSERT INTO Building_Flavors 	
			(BuildingType, 			FlavorType, 					Flavor)
VALUES		('BUILDING_JFD_SHUL',	'FLAVOR_I_LAND_TRADE_ROUTE', 	10),
			('BUILDING_JFD_SHUL',	'FLAVOR_I_TRADE_ORIGIN', 		10);
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
			(Type, 					Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_JFD_BULAN', 	'TXT_KEY_LEADER_JFD_BULAN', 	'TXT_KEY_LEADER_JFD_BULAN_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_BULAN', 	'Bulan_Scene.xml',	4, 						2, 						2, 							6, 			3, 				2, 				3, 						4, 				2, 			2, 			3, 				2, 			6, 			'JFD_KHAZARIA_ATLAS', 	1);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_BULAN', 	'MAJOR_CIV_APPROACH_WAR', 			6),
			('LEADER_JFD_BULAN', 	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
			('LEADER_JFD_BULAN', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
			('LEADER_JFD_BULAN', 	'MAJOR_CIV_APPROACH_GUARDED', 		5),
			('LEADER_JFD_BULAN', 	'MAJOR_CIV_APPROACH_AFRAID', 		4),
			('LEADER_JFD_BULAN', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
			('LEADER_JFD_BULAN', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_BULAN', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
			('LEADER_JFD_BULAN', 	'MINOR_CIV_APPROACH_FRIENDLY', 		2),
			('LEADER_JFD_BULAN', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
			('LEADER_JFD_BULAN', 	'MINOR_CIV_APPROACH_CONQUEST', 		7),
			('LEADER_JFD_BULAN', 	'MINOR_CIV_APPROACH_BULLY', 		8);
--------------------------------	
-- Leader_Flavors
--------------------------------						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_JFD_BULAN', 	'FLAVOR_OFFENSE', 					8),
			('LEADER_JFD_BULAN', 	'FLAVOR_DEFENSE', 					4),
			('LEADER_JFD_BULAN', 	'FLAVOR_CITY_DEFENSE', 				4),
			('LEADER_JFD_BULAN', 	'FLAVOR_MILITARY_TRAINING', 		8),
			('LEADER_JFD_BULAN', 	'FLAVOR_RECON', 					4),
			('LEADER_JFD_BULAN', 	'FLAVOR_RANGED', 					4),
			('LEADER_JFD_BULAN', 	'FLAVOR_MOBILE', 					8),
			('LEADER_JFD_BULAN', 	'FLAVOR_NAVAL', 					2),
			('LEADER_JFD_BULAN', 	'FLAVOR_NAVAL_RECON', 				2),
			('LEADER_JFD_BULAN', 	'FLAVOR_NAVAL_GROWTH', 				2),
			('LEADER_JFD_BULAN', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	2),
			('LEADER_JFD_BULAN', 	'FLAVOR_AIR', 						2),
			('LEADER_JFD_BULAN', 	'FLAVOR_EXPANSION', 				8),
			('LEADER_JFD_BULAN', 	'FLAVOR_GROWTH', 					6),
			('LEADER_JFD_BULAN', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
			('LEADER_JFD_BULAN', 	'FLAVOR_INFRASTRUCTURE', 			4),
			('LEADER_JFD_BULAN', 	'FLAVOR_PRODUCTION', 				3),
			('LEADER_JFD_BULAN', 	'FLAVOR_GOLD', 						8),
			('LEADER_JFD_BULAN', 	'FLAVOR_SCIENCE', 					4),
			('LEADER_JFD_BULAN', 	'FLAVOR_CULTURE', 					3),
			('LEADER_JFD_BULAN', 	'FLAVOR_HAPPINESS', 				3),
			('LEADER_JFD_BULAN', 	'FLAVOR_GREAT_PEOPLE', 				4),
			('LEADER_JFD_BULAN', 	'FLAVOR_WONDER', 					3),
			('LEADER_JFD_BULAN', 	'FLAVOR_RELIGION', 					8),
			('LEADER_JFD_BULAN', 	'FLAVOR_DIPLOMACY', 				2),
			('LEADER_JFD_BULAN', 	'FLAVOR_SPACESHIP', 				2),
			('LEADER_JFD_BULAN', 	'FLAVOR_WATER_CONNECTION', 			2),
			('LEADER_JFD_BULAN', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_BULAN', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_BULAN', 	'FLAVOR_ESPIONAGE', 				5),
			('LEADER_JFD_BULAN', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_BULAN', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_BULAN', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_BULAN', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_BULAN', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_BULAN', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_BULAN', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------						
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_JFD_BULAN', 	'TRAIT_JFD_KHAZARIA');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
			(Type, 					Description, 					ShortDescription)
VALUES		('TRAIT_JFD_KHAZARIA', 	'TXT_KEY_TRAIT_JFD_KHAZARIA', 	'TXT_KEY_TRAIT_JFD_KHAZARIA_SHORT');
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
			(Type, 							Description, 							Help, 										Sound, 				CannotBeChosen,PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_KHAGAN_BEK',	'TXT_KEY_PROMOTION_JFD_KHAGAN_BEK',		'TXT_KEY_PROMOTION_JFD_KHAGAN_BEK_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_KHAGAN_BEK'),
			('PROMOTION_JFD_KHAGAN_BEK_XP',	'TXT_KEY_PROMOTION_JFD_KHAGAN_BEK_XP',	'TXT_KEY_PROMOTION_JFD_KHAGAN_BEK_XP_HELP', 'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_KHAGAN_BEK_XP');
--==========================================================================================================================	
-- Units
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	
			(Type, 							 Class, Cost, Moves, FaithCost,	CivilianAttackPriority, Special, MoveAfterPurchase, Domain, DefaultUnitAI, Description, 						Civilopedia, 							Help, 									Strategy,									AdvancedStartCost,	WorkRate, CombatLimit, DontShowYields, UnitArtInfoEraVariation, UnitArtInfo, 					  UnitFlagIconOffset,	UnitFlagAtlas,						MoveRate, PortraitIndex, 	IconAtlas)
SELECT		('UNIT_JFD_KHAGAN_BEK'),		 Class, Cost, Moves, FaithCost, CivilianAttackPriority, Special, MoveAfterPurchase,	Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_KHAGAN_BEK'), 	('TXT_KEY_CIV5_JFD_KHAGAN_BEK_TEXT'), 	('TXT_KEY_UNIT_JFD_KHAGAN_BEK_HELP'), 	('TXT_KEY_UNIT_JFD_KHAGAN_BEK_STRATEGY'),	AdvancedStartCost, 	WorkRate, CombatLimit, DontShowYields, 0,						('ART_DEF_UNIT_JFD_KHAGAN_BEK'),  0,					('JFD_UNIT_FLAG_KHAGAN_BEK_ATLAS'),	MoveRate, 2, 				('JFD_KHAZARIA_ATLAS')
FROM Units WHERE (Type = 'UNIT_GREAT_GENERAL');	
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_KHAGAN_BEK'), 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_GENERAL');	
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_KHAGAN_BEK'), 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GREAT_GENERAL');
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_KHAGAN_BEK'), 		FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREAT_GENERAL');
--------------------------------
-- Unit_Builds
--------------------------------
INSERT INTO Unit_Builds 	
			(UnitType, 						BuildType)
SELECT		('UNIT_JFD_KHAGAN_BEK'), 		BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_GREAT_GENERAL');
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
			(UnitType, 						PromotionType)
SELECT		('UNIT_JFD_KHAGAN_BEK'), 		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_GREAT_GENERAL');

INSERT INTO Unit_FreePromotions 	
			(UnitType, 						PromotionType)
VALUES		('UNIT_JFD_KHAGAN_BEK', 		'PROMOTION_JFD_KHAGAN_BEK'),
			('UNIT_JFD_KHAGAN_BEK', 		'PROMOTION_JFD_KHAGAN_BEK_XP');
--------------------------------
-- Unit_UniqueNames
--------------------------------
INSERT INTO Unit_UniqueNames 
			(UnitType, 						UniqueName)
VALUES		('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_IBRIS'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_BUSIR'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_BIHAR'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_PARSBIT'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_ZACHARIAH'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_BULAN'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_BANJAMIN'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_AARON_II'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_JOSEPH_BEN_AARON'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_DAVID_OF_TAMAN'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_GEORGIUS_TZUL'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_BALGITZIN'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_BARJIK'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_LEBEDIAS'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_SERACH'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_OBADIAH');	
--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
-- Civilizations
--------------------------------	
INSERT INTO Civilizations 	
			(Type, 							Description, 						ShortDescription, 							Adjective, 								Civilopedia, 							CivilopediaTag, 				DefaultPlayerColor, 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 				DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_JFD_KHAZARIA'), 	('TXT_KEY_CIV_JFD_KHAZARIA_DESC'), 	('TXT_KEY_CIV_JFD_KHAZARIA_SHORT_DESC'), 	('TXT_KEY_CIV_JFD_KHAZARIA_ADJECTIVE'), ('TXT_KEY_CIV5_JFD_KHAZARIA_TEXT_1'), 	('TXT_KEY_CIV5_JFD_KHAZARIA'), 	('PLAYERCOLOR_JFD_KHAZARIA'), 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_KHAZARIA_ATLAS'), 0, 				('JFD_KHAZARIA_ALPHA_ATLAS'), 	('Persia'), 	('KhazariaMap512.dds'), ('TXT_KEY_CIV5_DOM_JFD_BULAN_TEXT'), 	('Bulan_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_PERSIA');
--------------------------------	
-- Civilization_CityNames
--------------------------------			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_ATIL'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_SARKEL'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_BALANJAR'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_SAMANDAR'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_TMUTARAKAN'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_DERBENT'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_ASTARKHAN'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_KIEV'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_SARYCHIN'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_SARATAU'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_KHARKA'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_ALBAT'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_KHORYSDAN'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_KHURSA'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_SIMBIR'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_GUZLIEV'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_SUDAK'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_KERCH'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_SAMIRAN'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_SAMBALUT'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_KAZARSKI');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
SELECT		('CIVILIZATION_JFD_KHAZARIA'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_MONGOL');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_JFD_KHAZARIA'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_MONGOL');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_KHAZARIA'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_MONGOL');
--------------------------------	
-- Civilization_Leaders
--------------------------------			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_JFD_KHAZARIA', 	'LEADER_JFD_BULAN');	
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_KHAZARIA', 	'UNITCLASS_GREAT_GENERAL', 	'UNIT_JFD_KHAGAN_BEK');
--------------------------------	
-- Civilization_BuildingClassOverrides
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 				BuildingClassType, 		BuildingType)
VALUES		('CIVILIZATION_JFD_KHAZARIA', 	'BUILDINGCLASS_TEMPLE', 'BUILDING_JFD_SHUL');
--------------------------------	
-- Civilization_Religions
--------------------------------		
INSERT INTO Civilization_Religions 
			(CivilizationType, 				ReligionType)
VALUES		('CIVILIZATION_JFD_KHAZARIA', 	'RELIGION_JUDAISM');
--------------------------------	
-- Civilization_SpyNames
--------------------------------		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_0'),	
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_1'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_2'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_3'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_4'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_5'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_6'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_7'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_8'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_9');
--==========================================================================================================================		
--==========================================================================================================================						
			