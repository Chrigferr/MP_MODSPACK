--==========================================================================================================================	
-- BUILDING CLASSES
--==========================================================================================================================	
-- BuildingClasses
--------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 		DefaultBuilding, 					Description)
VALUES	('BUILDINGCLASS_JFD_BOHEMIA', 		'BUILDING_JFD_BOHEMIAN_DELEGATES', 	'TXT_KEY_BUILDING_JFD_BOHEMIAN_DELEGATES');
--==========================================================================================================================	
-- BUILDINGs
--==========================================================================================================================			
-- Buildings
--------------------------------	
INSERT INTO Buildings
		(Type, 					BuildingClass, Cost, GoldMaintenance, PrereqTech, ExtraCityHitPoints,	Defense, ArtInfoCulturalVariation,	AllowsRangeStrike,	Description,					 Help,								Civilopedia,					Strategy,								ArtDefineTag, MinAreaSize, 	HurryCostModifier, 	IconAtlas,				ConquestProb, 	PortraitIndex)
SELECT	'BUILDING_JFD_HRAD',	BuildingClass, Cost, GoldMaintenance, PrereqTech, ExtraCityHitPoints,	Defense, ArtInfoCulturalVariation,	AllowsRangeStrike,	'TXT_KEY_BUILDING_JFD_HRAD',	'TXT_KEY_BUILDING_JFD_HRAD_HELP',	'TXT_KEY_CIV5_JFD_HRAD_TEXT',	'TXT_KEY_BUILDING_JFD_HRAD_STRATEGY',	ArtDefineTag, MinAreaSize, 	HurryCostModifier, 	'JFD_BOHEMIA_ATLAS',	66, 			2
FROM Buildings WHERE Type = 'BUILDING_CASTLE';	

INSERT INTO Buildings 	
		(Type, 						 			BuildingClass, 					Defense,	ReligiousPressureModifier,	ExtraLeagueVotes,	GreatWorkCount, Cost, FaithCost, PrereqTech, Description, 									Help)
VALUES	('BUILDING_JFD_BOHEMIAN_DEFENSE', 		'BUILDINGCLASS_JFD_BOHEMIA', 	100,		0,							1,					-1, 			-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_BOHEMIAN_DEFENSE', 		'TXT_KEY_BUILDING_JFD_BOHEMIAN_DEFENSE_HELP'),
		('BUILDING_JFD_BOHEMIAN_DELEGATES', 	'BUILDINGCLASS_JFD_BOHEMIA', 	0,			0,							1,					-1, 			-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_BOHEMIAN_DELEGATES', 	'TXT_KEY_BUILDING_JFD_BOHEMIAN_DELEGATES_HELP'),
		('BUILDING_JFD_BOHEMIAN_PRESSURE', 		'BUILDINGCLASS_JFD_BOHEMIA', 	0,			100,						0,					-1, 			-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_BOHEMIAN_PRESSURE', 		'TXT_KEY_BUILDING_JFD_BOHEMIAN_PRESSURE_HELP');
--------------------------------	
-- Building_ClassesNeededInCity
--------------------------------					
INSERT INTO Building_ClassesNeededInCity
		(BuildingType, 			BuildingClassType)
SELECT	'BUILDING_JFD_HRAD',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_CASTLE';	
--------------------------------	
-- Building_Flavors
--------------------------------					
INSERT INTO Building_Flavors 
		(BuildingType, 			FlavorType,					Flavor)
VALUES	('BUILDING_JFD_HRAD', 	'FLAVOR_CITY_DEFENSE',		50),
		('BUILDING_JFD_HRAD', 	'FLAVOR_TILE_IMPROVEMENT',	10),
		('BUILDING_JFD_HRAD', 	'FLAVOR_GOLD',				50);
--------------------------------	
-- Building_ResourceYieldModifiers
--------------------------------					
INSERT INTO Building_ResourceYieldModifiers 
		(BuildingType, 			ResourceType,		YieldType,		Yield)
VALUES	('BUILDING_JFD_HRAD',	'RESOURCE_COW',		'YIELD_GOLD',	5),
		('BUILDING_JFD_HRAD',	'RESOURCE_SHEEP',	'YIELD_GOLD',	5),
		('BUILDING_JFD_HRAD',	'RESOURCE_WHEAT',	'YIELD_GOLD',	5),
		('BUILDING_JFD_HRAD',	'RESOURCE_STONE',	'YIELD_GOLD',	5);
--------------------------------	
-- Building_ResourceYieldChanges
--------------------------------					
INSERT INTO Building_ResourceYieldChanges 
		(BuildingType, 			ResourceType,		YieldType,		Yield)
VALUES	('BUILDING_JFD_HRAD',	'RESOURCE_COW',		'YIELD_GOLD',	1),
		('BUILDING_JFD_HRAD',	'RESOURCE_SHEEP',	'YIELD_GOLD',	1),
		('BUILDING_JFD_HRAD',	'RESOURCE_WHEAT',	'YIELD_GOLD',	1),
		('BUILDING_JFD_HRAD',	'RESOURCE_STONE',	'YIELD_GOLD',	1);
--==========================================================================================================================
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
--------------------------------	
INSERT INTO UnitPromotions 
		(Type, 									Description, 									Help, 													Sound, 				CannotBeChosen, ExtraAttacks,	CanMoveAfterAttacking,  DefenseMod,	PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_TABOR_RANGED', 			'TXT_KEY_PROMOTION_JFD_TABOR_RANGED', 			'TXT_KEY_PROMOTION_JFD_TABOR_RANGED_HELP', 				'AS2D_IF_LEVELUP', 	1, 				1,				1,						0, 			59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_TABOR_RANGED'),
		('PROMOTION_JFD_TABOR_DEFENSE_OTHER', 	'TXT_KEY_PROMOTION_JFD_TABOR_DEFENSE_OTHER', 	'TXT_KEY_PROMOTION_JFD_TABOR_DEFENSE_OTHER_HELP', 		'AS2D_IF_LEVELUP', 	1, 				0,				0,						100, 		59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_TABOR_DEFENSE_OTHER'),
		('PROMOTION_JFD_TABOR_DEFENSE', 		'TXT_KEY_PROMOTION_JFD_TABOR_DEFENSE', 			'TXT_KEY_PROMOTION_JFD_TABOR_DEFENSE_HELP',				'AS2D_IF_LEVELUP', 	1, 				0,				0,						0, 			59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_TABOR_DEFENSE');
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
		(Type, 				 ExtraMaintenanceCost,	Class, PurchaseOnly,	Cost,	Moves,	PrereqTech,				FaithCost,	CivilianAttackPriority, Special, MoveAfterPurchase, Domain, DefaultUnitAI, Description, 				Civilopedia, 									Help, 							Strategy,							AdvancedStartCost,	WorkRate, CombatLimit, DontShowYields, UnitArtInfoEraVariation,	UnitArtInfo, 						UnitFlagIconOffset,	UnitFlagAtlas,					MoveRate, PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_TABOR',	 1,						Class, 1,				320,	Moves,	'TECH_METAL_CASTING',	FaithCost,	CivilianAttackPriority, Special, MoveAfterPurchase,	Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_TABOR', 	'TXT_KEY_CIVILOPEDIA_UNITS_JFD_TABOR_TEXT', 	'TXT_KEY_UNIT_JFD_TABOR_HELP', 	'TXT_KEY_UNIT_JFD_TABOR_STRATEGY',	AdvancedStartCost, 	WorkRate, CombatLimit, DontShowYields, 0,						'ART_DEF_UNIT_JFD_BOHEMIAN_TABOR',	0,					'JFD_UNIT_FLAG_TABOR_ATLAS',	MoveRate, 3, 				'JFD_BOHEMIA_ATLAS'
FROM Units WHERE Type = 'UNIT_GREAT_GENERAL';	
--------------------------------
-- UnitGameplay2DScripts
--------------------------------	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 			SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_TABOR', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_TREBUCHET';	
--------------------------------
-- Unit_AITypes
--------------------------------	
INSERT INTO Unit_AITypes 	
		(UnitType, 			UnitAIType)
SELECT	'UNIT_JFD_TABOR', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 			FlavorType, Flavor)
SELECT	'UNIT_JFD_TABOR', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 			PromotionType)
VALUES	('UNIT_JFD_TABOR',	'PROMOTION_GREAT_GENERAL'),
		('UNIT_JFD_TABOR',	'PROMOTION_JFD_TABOR_DEFENSE');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 					Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES	('LEADER_JFD_VACLAV', 	'TXT_KEY_LEADER_JFD_VACLAV', 	'TXT_KEY_LEADER_JFD_VACLAV_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_VACLAV', 	'Vaclav_Scene.xml', 4, 						5, 						9, 							8, 			5, 				6, 				6, 						5, 				5, 			5, 			4, 				4, 			3, 			'JFD_BOHEMIA_ATLAS',	1);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------					
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_VACLAV', 	'MAJOR_CIV_APPROACH_WAR', 			5),
		('LEADER_JFD_VACLAV', 	'MAJOR_CIV_APPROACH_HOSTILE', 		5),
		('LEADER_JFD_VACLAV', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
		('LEADER_JFD_VACLAV', 	'MAJOR_CIV_APPROACH_GUARDED', 		8),
		('LEADER_JFD_VACLAV', 	'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_JFD_VACLAV', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_VACLAV', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		7);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------					
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_VACLAV', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
		('LEADER_JFD_VACLAV', 	'MINOR_CIV_APPROACH_FRIENDLY', 		9),
		('LEADER_JFD_VACLAV', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	8),
		('LEADER_JFD_VACLAV', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
		('LEADER_JFD_VACLAV', 	'MINOR_CIV_APPROACH_BULLY', 		2);
--------------------------------
-- Leader_Flavors
--------------------------------					
INSERT INTO Leader_Flavors 
		(LeaderType, 			FlavorType, 						Flavor)
VALUES	('LEADER_JFD_VACLAV', 	'FLAVOR_OFFENSE', 					4),
		('LEADER_JFD_VACLAV', 	'FLAVOR_DEFENSE', 					8),
		('LEADER_JFD_VACLAV', 	'FLAVOR_CITY_DEFENSE', 				9),
		('LEADER_JFD_VACLAV', 	'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_JFD_VACLAV', 	'FLAVOR_RECON', 					4),
		('LEADER_JFD_VACLAV', 	'FLAVOR_RANGED', 					7),
		('LEADER_JFD_VACLAV', 	'FLAVOR_MOBILE', 					5),
		('LEADER_JFD_VACLAV', 	'FLAVOR_NAVAL', 					3),
		('LEADER_JFD_VACLAV', 	'FLAVOR_NAVAL_RECON', 				3),
		('LEADER_JFD_VACLAV', 	'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_JFD_VACLAV', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_JFD_VACLAV', 	'FLAVOR_AIR', 						3),
		('LEADER_JFD_VACLAV', 	'FLAVOR_EXPANSION', 				5),
		('LEADER_JFD_VACLAV', 	'FLAVOR_GROWTH', 					8),
		('LEADER_JFD_VACLAV', 	'FLAVOR_TILE_IMPROVEMENT', 			7),
		('LEADER_JFD_VACLAV', 	'FLAVOR_INFRASTRUCTURE', 			6),
		('LEADER_JFD_VACLAV', 	'FLAVOR_PRODUCTION', 				5),
		('LEADER_JFD_VACLAV', 	'FLAVOR_GOLD', 						7),
		('LEADER_JFD_VACLAV', 	'FLAVOR_SCIENCE', 					4),
		('LEADER_JFD_VACLAV', 	'FLAVOR_CULTURE', 					5),
		('LEADER_JFD_VACLAV', 	'FLAVOR_HAPPINESS', 				5),
		('LEADER_JFD_VACLAV', 	'FLAVOR_GREAT_PEOPLE', 				3),
		('LEADER_JFD_VACLAV', 	'FLAVOR_WONDER', 					3),
		('LEADER_JFD_VACLAV', 	'FLAVOR_RELIGION', 					4),
		('LEADER_JFD_VACLAV', 	'FLAVOR_DIPLOMACY', 				9),
		('LEADER_JFD_VACLAV', 	'FLAVOR_SPACESHIP', 				4),
		('LEADER_JFD_VACLAV', 	'FLAVOR_WATER_CONNECTION', 			6),
		('LEADER_JFD_VACLAV', 	'FLAVOR_NUKE', 						3),
		('LEADER_JFD_VACLAV', 	'FLAVOR_USE_NUKE', 					3),
		('LEADER_JFD_VACLAV', 	'FLAVOR_ESPIONAGE', 				4),
		('LEADER_JFD_VACLAV', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_JFD_VACLAV', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_VACLAV', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_VACLAV', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		8),
		('LEADER_JFD_VACLAV', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_VACLAV', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_VACLAV', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------
-- Leader_Traits
--------------------------------					
INSERT INTO Leader_Traits 
		(LeaderType, 			TraitType)
VALUES	('LEADER_JFD_VACLAV', 	'TRAIT_JFD_BOHEMIA');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 					Description, 					ShortDescription)
VALUES	('TRAIT_JFD_BOHEMIA', 	'TXT_KEY_TRAIT_JFD_BOHEMIA', 	'TXT_KEY_TRAIT_JFD_BOHEMIA_SHORT');	
--==========================================================================================================================	
-- MINOR CIVILIZATIONS
--==========================================================================================================================			
-- MinorCivilizations
--------------------------------
UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_JFD_PADUA_DESC', ShortDescription = 'TXT_KEY_CITYSTATE_JFD_PADUA_SHORT_DESC', Adjective = 'TXT_KEY_CITYSTATE_JFD_PADUA_ADJECTIVE', Civilopedia = 'TXT_KEY_CIV5_JFD_PADUA_TEXT_1'
WHERE Type = 'MINOR_CIV_PRAGUE';
--------------------------------	
-- MinorCivilization_CityNames
--------------------------------		
UPDATE MinorCivilization_CityNames
SET CityName = 'TXT_KEY_CITYSTATE_JFD_PADUA_DESC'
WHERE MinorCivType = 'MINOR_CIV_PRAGUE';
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------			
INSERT INTO Civilizations 	
		(Type, 							Description, 						ShortDescription, 						Adjective, 								Civilopedia, 						CivilopediaTag, 				DefaultPlayerColor, 		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				AlphaIconAtlas, 			PortraitIndex,	SoundtrackTag, 	MapImage, 				DawnOfManQuote, 						DawnOfManImage)
SELECT	'CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CIV_JFD_BOHEMIA_DESC', 	'TXT_KEY_CIV_JFD_BOHEMIA_SHORT_DESC', 	'TXT_KEY_CIV_JFD_BOHEMIA_ADJECTIVE', 	'TXT_KEY_CIV5_JFD_BOHEMIA_TEXT_1',	'TXT_KEY_CIV5_JFD_BOHEMIA', 	'PLAYERCOLOR_JFD_BOHEMIA',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_BOHEMIA_ATLAS',	'JFD_BOHEMIA_ALPHA_ATLAS',	0, 				'Germany',		'MapBohemia512.dds',	'TXT_KEY_CIV5_DOM_JFD_VACLAV_TEXT', 	'DOM_Vaclav.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_GERMANY';
--------------------------------
-- Civilization_CityNames
--------------------------------		
INSERT INTO Civilization_CityNames 
		(CivilizationType, 				CityName)
VALUES	('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_01'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_02'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_03'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_04'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_05'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_06'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_07'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_08'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_09'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_10'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_11'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_12'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_13'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_14'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_15'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_16'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_17'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_18'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_19'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_20'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_21'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_22'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_23'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_24'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_25'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_26'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_27'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_28'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_29'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_30');	
--------------------------------
-- Civilization_FreeBuildingClasses
--------------------------------		
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 				BuildingClassType)
SELECT	'CIVILIZATION_JFD_BOHEMIA', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_GERMANY';
--------------------------------
-- Civilization_FreeTechs
--------------------------------	
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 				TechType)
SELECT	'CIVILIZATION_JFD_BOHEMIA', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_GERMANY';
--------------------------------
-- Civilization_FreeUnits
--------------------------------	
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_BOHEMIA', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_GERMANY';
--------------------------------
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_JFD_BOHEMIA', 	'LEADER_JFD_VACLAV');
--------------------------------
-- Civilization_BuildingClassOverrides 
--------------------------------	
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 				BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_JFD_BOHEMIA', 	'BUILDINGCLASS_CASTLE', 	'BUILDING_JFD_HRAD');
--------------------------------
-- Civilization_UnitClassOverrides 
--------------------------------	
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_JFD_BOHEMIA', 	'UNITCLASS_GREAT_GENERAL', 	'UNIT_JFD_TABOR');
--------------------------------
-- Civilization_Religions
--------------------------------	
INSERT INTO Civilization_Religions 
		(CivilizationType, 				ReligionType)
VALUES	('CIVILIZATION_JFD_BOHEMIA',	'RELIGION_CHRISTIANITY');
--------------------------------
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 				SpyName)
VALUES	('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_SPY_NAME_JFD_BOHEMIA_0'),	
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_SPY_NAME_JFD_BOHEMIA_1'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_SPY_NAME_JFD_BOHEMIA_2'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_SPY_NAME_JFD_BOHEMIA_3'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_SPY_NAME_JFD_BOHEMIA_4'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_SPY_NAME_JFD_BOHEMIA_5'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_SPY_NAME_JFD_BOHEMIA_6'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_SPY_NAME_JFD_BOHEMIA_7'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_SPY_NAME_JFD_BOHEMIA_8'),
		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_SPY_NAME_JFD_BOHEMIA_9');
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Region_Avoid
		(CivilizationType, 				RegionType)
VALUES	('CIVILIZATION_JFD_BOHEMIA', 	'REGION_TUNDRA'),
		('CIVILIZATION_JFD_BOHEMIA', 	'REGION_JUNGLE');
--==========================================================================================================================
--==========================================================================================================================