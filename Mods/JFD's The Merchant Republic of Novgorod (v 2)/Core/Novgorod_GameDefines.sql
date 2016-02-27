--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 	 DefaultBuilding, 					Description)
VALUES	('BUILDINGCLASS_JFD_NOVGOROD', 	'BUILDING_JFD_NOVGOROD_DEFENSE',	'TXT_KEY_BUILDING_JFD_NOVGOROD');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 						TradeRouteLandDistanceModifier, TradeRouteLandGoldBonus, BuildingClass, PrereqTech, Cost, GoldMaintenance, MinAreaSize, Description, 					Civilopedia, 					Help, 								Strategy,								ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_JFD_POGOST',		TradeRouteLandDistanceModifier, TradeRouteLandGoldBonus, BuildingClass, PrereqTech, Cost, GoldMaintenance, MinAreaSize, 'TXT_KEY_BUILDING_JFD_POGOST', 	'TXT_KEY_CIV5_JFD_POGOST_TEXT',	'TXT_KEY_BUILDING_JFD_POGOST_HELP', 'TXT_KEY_BUILDING_JFD_POGOST_STRATEGY',	ArtDefineTag, 3, 			 'JFD_NOVGOROD_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_CARAVANSARY';	

INSERT INTO Buildings 		
		(Type, 						 			BuildingClass, 					NumTradeRouteBonus, MilitaryProductionModifier, BuildingProductionModifier, Defense, 	TradeRouteTargetBonus,	GreatWorkCount, Cost, FaithCost, 	NeverCapture, 	PrereqTech, Description, 									Help)
VALUES	('BUILDING_JFD_BOYAR_PEACE', 			'BUILDINGCLASS_JFD_NOVGOROD',	0,					0,							15,							0, 			0,						-1, 			-1,   -1, 			1, 				null, 		 'TXT_KEY_BUILDING_JFD_BOYAR_PEACE', 			'TXT_KEY_BUILDING_JFD_BOYAR_PEACE_HELP'),
		('BUILDING_JFD_BOYAR_WAR', 				'BUILDINGCLASS_JFD_NOVGOROD',	0,					15,							0,							0, 			0,						-1, 			-1,   -1, 			1, 				null, 		 'TXT_KEY_BUILDING_JFD_BOYAR_WAR',				'TXT_KEY_BUILDING_JFD_BOYAR_WAR_HELP'),
		('BUILDING_JFD_NOVGOROD_DEFENSE', 		'BUILDINGCLASS_JFD_NOVGOROD',	0,					0,							0,							100, 		0,						-1, 			-1,   -1, 			1, 				null, 		 'TXT_KEY_BUILDING_JFD_NOVGOROD_DEFENSE', 		'TXT_KEY_BUILDING_JFD_NOVGOROD_DEFENSE_HELP'),
		('BUILDING_JFD_POGOST_CONNECTION', 		'BUILDINGCLASS_JFD_NOVGOROD',	0,					0,							0,							0, 			0,						-1, 			-1,   -1, 			1, 				null, 		 'TXT_KEY_BUILDING_JFD_POGOST_CONNECTION', 		'TXT_KEY_BUILDING_JFD_POGOST_CONNECTION_HELP');
------------------------------	
-- Building_YieldChanges
------------------------------	
INSERT INTO Building_YieldChanges 	
		(BuildingType, 				YieldType,		Yield)
SELECT	'BUILDING_JFD_POGOST',		YieldType,		Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_CARAVANSARY';

INSERT INTO Building_YieldChanges 	
		(BuildingType, 						YieldType,				Yield)
VALUES	('BUILDING_JFD_POGOST_CONNECTION',	'YIELD_GOLD',			2),
		('BUILDING_JFD_POGOST_CONNECTION',	'YIELD_PRODUCTION',		1);
------------------------------	
-- Building_Flavors
------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,		Flavor)
SELECT	'BUILDING_JFD_POGOST',		FlavorType,		Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_CARAVANSARY';

INSERT INTO Building_Flavors
		(BuildingType,				FlavorType,				Flavor)
VALUES	('BUILDING_JFD_POGOST',		'FLAVOR_PRODUCTION',	10);
------------------------------
-- Unit_ProductionModifierBuildings
------------------------------	
INSERT INTO Unit_ProductionModifierBuildings 	
		(BuildingType, 			UnitType,			ProductionModifier)
VALUES	('BUILDING_JFD_POGOST',	'UNIT_CARAVAN',		50),
		('BUILDING_JFD_POGOST',	'UNIT_CARGO_SHIP',	50);
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 					Description, 					Civilopedia, 										CivilopediaTag, 							ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES	('LEADER_JFD_NEVSKY', 	'TXT_KEY_LEADER_JFD_NEVSKY', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD__NEVSKY_TEXT_1',	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_NEVSKY',	'Nevsky_Scene.xml',		5, 						3, 						2, 							3, 			4, 				5, 				6, 						6, 				6, 			7, 			6, 				4, 			2, 			'JFD_NOVGOROD_ATLAS',	1);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------					
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_NEVSKY', 	'MAJOR_CIV_APPROACH_WAR', 			2),
		('LEADER_JFD_NEVSKY', 	'MAJOR_CIV_APPROACH_HOSTILE', 		2),
		('LEADER_JFD_NEVSKY', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	2),
		('LEADER_JFD_NEVSKY', 	'MAJOR_CIV_APPROACH_GUARDED', 		5),
		('LEADER_JFD_NEVSKY', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
		('LEADER_JFD_NEVSKY', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_JFD_NEVSKY', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------					
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_NEVSKY', 	'MINOR_CIV_APPROACH_IGNORE', 		6),
		('LEADER_JFD_NEVSKY', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_JFD_NEVSKY', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
		('LEADER_JFD_NEVSKY', 	'MINOR_CIV_APPROACH_CONQUEST', 		6),
		('LEADER_JFD_NEVSKY', 	'MINOR_CIV_APPROACH_BULLY', 		6);
--------------------------------
-- Leader_Flavors
--------------------------------					
INSERT INTO Leader_Flavors 
		(LeaderType, 			FlavorType, 						Flavor)
VALUES	('LEADER_JFD_NEVSKY', 	'FLAVOR_OFFENSE', 					4),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_DEFENSE', 					8),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_RECON', 					2),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_RANGED', 					2),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_MOBILE', 					6),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_NAVAL', 					4),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_NAVAL_RECON', 				2),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_AIR', 						3),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_EXPANSION', 				6),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_GROWTH', 					6),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_INFRASTRUCTURE', 			7),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_PRODUCTION', 				8),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_GOLD', 						8),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_SCIENCE', 					3),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_CULTURE', 					3),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_HAPPINESS', 				4),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_GREAT_PEOPLE', 				2),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_WONDER', 					2),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_RELIGION', 					5),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_DIPLOMACY', 				2),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_WATER_CONNECTION', 			3),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_ESPIONAGE', 				2),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_AIRLIFT', 					4),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_I_TRADE_DESTINATION', 		8),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_I_TRADE_ORIGIN', 			8),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		6),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		8),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_NEVSKY', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------
-- Leader_Traits
--------------------------------
INSERT INTO Leader_Traits 
		(LeaderType, 			TraitType)
VALUES	('LEADER_JFD_NEVSKY',	'TRAIT_JFD_NOVGOROD');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 					Description, 					ShortDescription)
VALUES	('TRAIT_JFD_NOVGOROD', 	'TXT_KEY_TRAIT_JFD_NOVGOROD', 	'TXT_KEY_TRAIT_JFD_NOVGOROD_SHORT');
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 						Description, 					Help, 									Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_BOYAR', 	'TXT_KEY_PROMOTION_JFD_BOYAR',	'TXT_KEY_PROMOTION_JFD_BOYAR_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_BOYAR');
--==========================================================================================================================	
-- Units
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 				Class, Cost, Moves, FaithCost, CivilianAttackPriority, Special, MoveAfterPurchase, Domain, DefaultUnitAI, Description, 				Civilopedia, 					Help, 							Strategy,							AdvancedStartCost,	WorkRate, CombatLimit, DontShowYields, UnitArtInfoEraVariation, UnitArtInfo, 				UnitFlagIconOffset,	UnitFlagAtlas,					MoveRate, PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_BOYAR',	Class, Cost, Moves, FaithCost, CivilianAttackPriority, Special, MoveAfterPurchase, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_BOYAR', 'TXT_KEY_CIV5_JFD_BOYAR_TEXT', 	'TXT_KEY_UNIT_JFD_BOYAR_HELP',	'TXT_KEY_UNIT_JFD_BOYAR_STRATEGY',	AdvancedStartCost, 	WorkRate, CombatLimit, DontShowYields, 0,						'ART_DEF_UNIT_JFD_BOYAR',	0,					'JFD_UNIT_FLAG_BOYAR_ATLAS',	MoveRate, 2, 				'JFD_NOVGOROD_ATLAS'
FROM Units WHERE Type = 'UNIT_GREAT_GENERAL';	
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 			SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_BOYAR', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GREAT_GENERAL';	
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 			UnitAIType)
SELECT	'UNIT_JFD_BOYAR', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 			FlavorType, Flavor)
SELECT	'UNIT_JFD_BOYAR', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------
-- Unit_Builds
--------------------------------
INSERT INTO Unit_Builds 	
		(UnitType, 			BuildType)
SELECT	'UNIT_JFD_BOYAR', 	BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_GREAT_GENERAL';

INSERT INTO Unit_Builds 	
		(UnitType, 			BuildType)
SELECT	'UNIT_JFD_BOYAR', 	BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_MERCHANT';
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 			PromotionType)
SELECT	'UNIT_JFD_BOYAR', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GREAT_GENERAL';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 			PromotionType)
VALUES	('UNIT_JFD_BOYAR', 	'PROMOTION_JFD_BOYAR');
--------------------------------
-- Unit_UniqueNames
--------------------------------
INSERT INTO Unit_UniqueNames 
		(UnitType, 			UniqueName)
VALUES	('UNIT_JFD_BOYAR', 	'TXT_KEY_GREAT_PERSON_JFD_BOYAR_1'),
		('UNIT_JFD_BOYAR', 	'TXT_KEY_GREAT_PERSON_JFD_BOYAR_2'),
		('UNIT_JFD_BOYAR', 	'TXT_KEY_GREAT_PERSON_JFD_BOYAR_3'),
		('UNIT_JFD_BOYAR', 	'TXT_KEY_GREAT_PERSON_JFD_BOYAR_4'),
		('UNIT_JFD_BOYAR', 	'TXT_KEY_GREAT_PERSON_JFD_BOYAR_5'),
		('UNIT_JFD_BOYAR', 	'TXT_KEY_GREAT_PERSON_JFD_BOYAR_6'),
		('UNIT_JFD_BOYAR', 	'TXT_KEY_GREAT_PERSON_JFD_BOYAR_7'),
		('UNIT_JFD_BOYAR', 	'TXT_KEY_GREAT_PERSON_JFD_BOYAR_8'),
		('UNIT_JFD_BOYAR', 	'TXT_KEY_GREAT_PERSON_JFD_BOYAR_9'),
		('UNIT_JFD_BOYAR', 	'TXT_KEY_GREAT_PERSON_JFD_BOYAR_10'),
		('UNIT_JFD_BOYAR', 	'TXT_KEY_GREAT_PERSON_JFD_BOYAR_11'),
		('UNIT_JFD_BOYAR', 	'TXT_KEY_GREAT_PERSON_JFD_BOYAR_12'),
		('UNIT_JFD_BOYAR', 	'TXT_KEY_GREAT_PERSON_JFD_BOYAR_13'),
		('UNIT_JFD_BOYAR', 	'TXT_KEY_GREAT_PERSON_JFD_BOYAR_14'),
		('UNIT_JFD_BOYAR', 	'TXT_KEY_GREAT_PERSON_JFD_BOYAR_15'),
		('UNIT_JFD_BOYAR', 	'TXT_KEY_GREAT_PERSON_JFD_BOYAR_16'),
		('UNIT_JFD_BOYAR', 	'TXT_KEY_GREAT_PERSON_JFD_BOYAR_17'),
		('UNIT_JFD_BOYAR', 	'TXT_KEY_GREAT_PERSON_JFD_BOYAR_18'),
		('UNIT_JFD_BOYAR', 	'TXT_KEY_GREAT_PERSON_JFD_BOYAR_19'),
		('UNIT_JFD_BOYAR', 	'TXT_KEY_GREAT_PERSON_JFD_BOYAR_20');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 							DerivativeCiv,			Description, 						ShortDescription, 						Adjective, 								Civilopedia, 					CivilopediaTag, 		 DefaultPlayerColor, 		 ArtDefineTag,			 ArtStyleType, ArtStyleSuffix,	ArtStylePrefix,	IconAtlas, 				AlphaIconAtlas, 				PortraitIndex,	SoundtrackTag, 	MapImage, 				DawnOfManQuote, 						DawnOfManImage)
SELECT	'CIVILIZATION_JFD_NOVGOROD', 	'CIVILIZATION_RUSSIA',	'TXT_KEY_CIV_JFD_NOVGOROD_DESC', 	'TXT_KEY_CIV_JFD_NOVGOROD_SHORT_DESC',	'TXT_KEY_CIV_JFD_NOVGOROD_ADJECTIVE', 	'TXT_KEY_CIV5_NOVGOROD_TEXT_1',	'TXT_KEY_CIV5_NOVGOROD', 'PLAYERCOLOR_JFD_NOVGOROD', 'ART_DEF_JFD_NOVGOROD', ArtStyleType, ArtStyleSuffix,	ArtStylePrefix,	'JFD_NOVGOROD_ATLAS',	'JFD_NOVGOROD_ALPHA_ATLAS', 	0, 				'Russia', 		'MapNovgorod512.dds',	'TXT_KEY_CIV5_DOM_JFD_NEVSKY_TEXT',		'DOM_Nevsky.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_RUSSIA';
--------------------------------
-- Civilization_CityNames
--------------------------------		
INSERT INTO Civilization_CityNames 
		(CivilizationType, 				CityName)
VALUES	('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_01'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_02'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_03'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_04'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_05'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_06'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_07'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_08'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_09'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_10'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_11'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_12'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_13'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_14'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_15'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_16'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_17'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_18'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_19'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_20'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_21'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_22'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_23'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_24'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_25'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_26'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_27'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_28'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_29'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_30'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_31'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_32'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_33'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_34'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_35'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_36'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_CITY_NAME_JFD_NOVGOROD_37');
--------------------------------
-- Civilization_FreeBuildingClasses
--------------------------------		
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 				BuildingClassType)
SELECT	'CIVILIZATION_JFD_NOVGOROD', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--------------------------------
-- Civilization_FreeTechs
--------------------------------	
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 				TechType)
SELECT	'CIVILIZATION_JFD_NOVGOROD', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--------------------------------
-- Civilization_FreeUnits
--------------------------------	
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_NOVGOROD', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--------------------------------
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_JFD_NOVGOROD', 	'LEADER_JFD_NEVSKY');
--------------------------------
-- Civilization_UnitClassOverrides 
--------------------------------	
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				UnitClassType, 					UnitType)
VALUES	('CIVILIZATION_JFD_NOVGOROD', 	'UNITCLASS_GREAT_GENERAL',		'UNIT_JFD_BOYAR');
--------------------------------
-- Civilization_BuildingClassOverrides 
--------------------------------	
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 				BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_JFD_NOVGOROD', 	'BUILDINGCLASS_CARAVANSARY',	'BUILDING_JFD_POGOST');
--------------------------------
-- Civilization_Religions
--------------------------------	
INSERT INTO Civilization_Religions 
		(CivilizationType, 				ReligionType)
VALUES	('CIVILIZATION_JFD_NOVGOROD', 	'RELIGION_ORTHODOXY');		
--------------------------------
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 				SpyName)
VALUES	('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_SPY_NAME_JFD_NOVGOROD_0'),	
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_SPY_NAME_JFD_NOVGOROD_1'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_SPY_NAME_JFD_NOVGOROD_2'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_SPY_NAME_JFD_NOVGOROD_3'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_SPY_NAME_JFD_NOVGOROD_4'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_SPY_NAME_JFD_NOVGOROD_5'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_SPY_NAME_JFD_NOVGOROD_6'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_SPY_NAME_JFD_NOVGOROD_7'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_SPY_NAME_JFD_NOVGOROD_8'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_SPY_NAME_JFD_NOVGOROD_9'),
		('CIVILIZATION_JFD_NOVGOROD', 	'TXT_KEY_SPY_NAME_JFD_NOVGOROD_10');
--==========================================================================================================================
--==========================================================================================================================