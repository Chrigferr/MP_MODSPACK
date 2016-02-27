--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 		DefaultBuilding, 			Description)
VALUES	('BUILDINGCLASS_JFD_ATEN_VERSE', 	'BUILDING_JFD_ATEN_VERSE_1', 'TXT_KEY_BUILDING_JFD_ATEN_VERSE');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 							BuildingClass, 					ReligiousPressureModifier,	GreatWorkCount,	Cost,	FaithCost,	PrereqTech,	 NeverCapture,	Description, 							Help)
VALUES	('BUILDING_JFD_ATEN_VERSE_1', 	'BUILDINGCLASS_JFD_ATEN_VERSE',	10,							-1, 			-1,		-1, 		null, 		 1,				'TXT_KEY_BUILDING_JFD_ATEN_VERSE_1', 	'TXT_KEY_BUILDING_JFD_ATEN_VERSE_HELP'),
		('BUILDING_JFD_ATEN_VERSE_2', 	'BUILDINGCLASS_JFD_ATEN_VERSE',	10,							-1, 			-1,		-1, 		null, 		 1,				'TXT_KEY_BUILDING_JFD_ATEN_VERSE_2', 	'TXT_KEY_BUILDING_JFD_ATEN_VERSE_HELP'),
		('BUILDING_JFD_ATEN_VERSE_3', 	'BUILDINGCLASS_JFD_ATEN_VERSE',	10,							-1, 			-1,		-1, 		null, 		 1,				'TXT_KEY_BUILDING_JFD_ATEN_VERSE_3', 	'TXT_KEY_BUILDING_JFD_ATEN_VERSE_HELP'),
		('BUILDING_JFD_ATEN_VERSE_4', 	'BUILDINGCLASS_JFD_ATEN_VERSE',	10,							-1, 			-1,		-1, 		null, 		 1,				'TXT_KEY_BUILDING_JFD_ATEN_VERSE_4', 	'TXT_KEY_BUILDING_JFD_ATEN_VERSE_HELP');
------------------------------
-- Building_YieldModifiers
------------------------------
INSERT INTO Building_YieldModifiers
		(BuildingType,					YieldType,			Yield)
VALUES	('BUILDING_JFD_ATEN_VERSE_1',	'YIELD_FOOD',		10),
		('BUILDING_JFD_ATEN_VERSE_2',	'YIELD_FOOD',		10),
		('BUILDING_JFD_ATEN_VERSE_3',	'YIELD_FOOD',		10),
		('BUILDING_JFD_ATEN_VERSE_4',	'YIELD_FOOD',		10);
--==========================================================================================================================	
-- BUILDS
--==========================================================================================================================	
-- Builds
------------------------------	
INSERT INTO Builds
		(Type,					PrereqTech,			ImprovementType, 			Time, Recommendation,					Description,			Help,								CtrlDown,	OrderPriority,	IconIndex,	IconAtlas,								HotKey, EntityEvent)
VALUES	('BUILD_JFD_OBELISK',	'TECH_CALENDAR',	'IMPROVEMENT_JFD_OBELISK',	700,  'TXT_KEY_BUILD_JFD_OBELISK_REC', 'TXT_KEY_JFD_OBELISK',	'TXT_KEY_BUILD_JFD_OBELISK_HELP',	1,			96,				1,			'JFD_EGYPT_AKHENATEN_OBELISK_ATLAS',	'KB_F',	'ENTITY_EVENT_BUILD');
--==========================================================================================================================	
-- RESOURCES
--==========================================================================================================================	
-- Resources
------------------------------	
INSERT INTO Resources 
		(Type,					Description, Civilopedia, IconString, PortraitIndex,  IconAtlas)
SELECT	'RESOURCE_JFD_WHEAT',	Description, Civilopedia, IconString, PortraitIndex,	IconAtlas
FROM Resources WHERE Type = 'RESOURCE_WHEAT';
------------------------------	
-- Resource_YieldChanges
------------------------------	
INSERT INTO Resource_YieldChanges
		(ResourceType,		  YieldType, Yield)
SELECT	'RESOURCE_JFD_WHEAT', YieldType, Yield
FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_WHEAT';
------------------------------	
-- Belief_ResourceYieldChanges
------------------------------	
INSERT INTO Belief_ResourceYieldChanges
		(BeliefType, ResourceType,		   YieldType, Yield)
SELECT	 BeliefType, 'RESOURCE_JFD_WHEAT', YieldType, Yield
FROM Belief_ResourceYieldChanges WHERE ResourceType = 'RESOURCE_WHEAT';
------------------------------	
-- Building_ResourceYieldChanges
------------------------------	
INSERT INTO Building_ResourceYieldChanges
		(BuildingType, ResourceType,		   YieldType, Yield)
SELECT	 BuildingType, 'RESOURCE_JFD_WHEAT', YieldType, Yield
FROM Building_ResourceYieldChanges WHERE ResourceType = 'RESOURCE_WHEAT';
--==========================================================================================================================	
-- IMPROVEMENTS
--==========================================================================================================================	
-- Improvements
------------------------------
INSERT INTO Improvements
		(Type,							SpecificCivRequired,	CivilizationType,					Permanent,	NoTwoAdjacent,	RequiresFlatlands,	Description,						Help,									 Civilopedia,									ArtDefineTag,							PortraitIndex,	IconAtlas)
VALUES	('IMPROVEMENT_JFD_OBELISK',		1,						'CIVILIZATION_JFD_EGYPT_AKHENATEN',	1,			1,				1,					'TXT_KEY_IMPROVEMENT_JFD_OBELISK',	'TXT_KEY_IMPROVEMENT_JFD_OBELISK_HELP',	 'TXT_KEY_CIV5_IMPROVEMENTS_JFD_OBELISK_TEXT',	'ART_DEF_IMPROVEMENT_MONOLITH_AFRI', 	0,				'JFD_EGYPT_AKHENATEN_OBELISK_ATLAS');
------------------------------
-- Improvement_ValidTerrains
------------------------------
INSERT INTO Improvement_ValidTerrains
		(ImprovementType,				TerrainType)
VALUES	('IMPROVEMENT_JFD_OBELISK',		'TERRAIN_DESERT'),
		('IMPROVEMENT_JFD_OBELISK',		'TERRAIN_PLAINS');
------------------------------
-- Improvement_AdjacentCityYields
------------------------------
INSERT INTO Improvement_AdjacentCityYields
		(ImprovementType,				YieldType,			Yield)
VALUES	('IMPROVEMENT_JFD_OBELISK',		'YIELD_FAITH',		1);
------------------------------
-- Improvement_Yields
------------------------------
INSERT INTO Improvement_Yields
		(ImprovementType,				YieldType,			Yield)
VALUES	('IMPROVEMENT_JFD_OBELISK',		'YIELD_FAITH',		2);
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 								AttackWoundedMod,	Description, 							Help, 											Sound, 				CannotBeChosen, LostWithUpgrade,	PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_ATEN',				0,					'TXT_KEY_PROMOTION_JFD_ATEN',			'TXT_KEY_PROMOTION_JFD_ATEN_HELP', 				'AS2D_IF_LEVELUP', 	1, 				1, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_ATEN'),
		('PROMOTION_JFD_KHOPESH', 			25,					'TXT_KEY_PROMOTION_JFD_KHOPESH',		'TXT_KEY_PROMOTION_JFD_KHOPESH_HELP', 			'AS2D_IF_LEVELUP', 	1, 				1, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_KHOPESH'),
		('PROMOTION_JFD_KHOPESH_DOUBLE', 	50,					'TXT_KEY_PROMOTION_JFD_KHOPESH_DOUBLE',	'TXT_KEY_PROMOTION_JFD_KHOPESH_DOUBLE_HELP', 	'AS2D_IF_LEVELUP', 	1, 				1, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_KHOPESH_DOUBLE');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 						Class,	PrereqTech,	Combat, FaithCost, RequiresFaithPurchaseEnabled, Cost,	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, 				Civilopedia, 						Strategy, 								Help, 								MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 				UnitFlagAtlas, 					UnitFlagIconOffset, PortraitIndex,	IconAtlas)
SELECT	'UNIT_JFD_KHOPESH', 		Class,	PrereqTech, Combat, FaithCost, RequiresFaithPurchaseEnabled, Cost, 	Moves, 	CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_KHOPESH', 'TXT_KEY_CIV5_JFD_KHOPESH_TEXT',	'TXT_KEY_UNIT_JFD_KHOPESH_STRATEGY', 	'TXT_KEY_UNIT_JFD_KHOPESH_HELP',	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_JFD_KHOPESH', 	'JFD_KHOPESH_FLAG_ART_ATLAS',	0,					2,				'JFD_EGYPT_AKHENATEN_ATLAS'
FROM Units WHERE Type = 'UNIT_SPEARMAN';
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_KHOPESH', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_SPEARMAN';	
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_KHOPESH', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SPEARMAN';
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_KHOPESH', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SPEARMAN';
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_JFD_KHOPESH', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SPEARMAN';

INSERT INTO Unit_FreePromotions
		(UnitType,				PromotionType)
VALUES	('UNIT_JFD_KHOPESH',	'PROMOTION_JFD_KHOPESH');
--------------------------------
-- Unit_ClassUpgrades
--------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_KHOPESH',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_JFD_KHOPESH';
------------------------------
-- Unit_Builds
------------------------------
INSERT INTO Unit_Builds
		(UnitType,				BuildType)
VALUES	('UNIT_WORKER',			'BUILD_JFD_OBELISK');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 					Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES	('LEADER_JFD_AKHENATEN', 	'TXT_KEY_LEADER_JFD_AKHENATEN', 'TXT_KEY_LEADER_JFD_AKHENATEN_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_AKHENATEN', 	'Akhenaten_Scene.xml',	5, 						5, 						2, 							2, 			5, 				5, 				6, 						3, 				2, 			4, 			2, 				4, 			5, 			'JFD_EGYPT_AKHENATEN_ATLAS', 	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_AKHENATEN', 	'MAJOR_CIV_APPROACH_WAR', 			2),
		('LEADER_JFD_AKHENATEN', 	'MAJOR_CIV_APPROACH_HOSTILE', 		2),
		('LEADER_JFD_AKHENATEN', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
		('LEADER_JFD_AKHENATEN', 	'MAJOR_CIV_APPROACH_GUARDED', 		6),
		('LEADER_JFD_AKHENATEN', 	'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_JFD_AKHENATEN', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
		('LEADER_JFD_AKHENATEN', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_AKHENATEN', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_JFD_AKHENATEN', 	'MINOR_CIV_APPROACH_FRIENDLY', 		2),
		('LEADER_JFD_AKHENATEN', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
		('LEADER_JFD_AKHENATEN', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
		('LEADER_JFD_AKHENATEN', 	'MINOR_CIV_APPROACH_BULLY', 		6);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 				FlavorType, 						Flavor)
VALUES	('LEADER_JFD_AKHENATEN', 	'FLAVOR_OFFENSE', 					5),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_DEFENSE', 					5),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_CITY_DEFENSE', 				3),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_MILITARY_TRAINING', 		6),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_RECON', 					4),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_RANGED', 					4),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_MOBILE', 					3),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_NAVAL', 					3),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_NAVAL_RECON', 				3),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_AIR', 						2),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_EXPANSION', 				2),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_GROWTH', 					9),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_TILE_IMPROVEMENT', 			8),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_INFRASTRUCTURE', 			3),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_PRODUCTION', 				3),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_GOLD', 						5),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_SCIENCE', 					3),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_CULTURE', 					4),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_HAPPINESS', 				7),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_GREAT_PEOPLE', 				4),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_WONDER', 					4),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_RELIGION', 					12),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_DIPLOMACY', 				2),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_WATER_CONNECTION', 			6),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_NUKE', 						3),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_ESPIONAGE', 				3),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_AIRLIFT', 					2),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_AKHENATEN', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 				TraitType)
VALUES	('LEADER_JFD_AKHENATEN', 	'TRAIT_JFD_EGYPT_AKHENATEN');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 							Description, 							ShortDescription)
VALUES	('TRAIT_JFD_EGYPT_AKHENATEN', 	'TXT_KEY_TRAIT_JFD_EGYPT_AKHENATEN', 	'TXT_KEY_TRAIT_JFD_EGYPT_AKHENATEN_SHORT');
--==========================================================================================================================
-- RELIGIONS
--==========================================================================================================================	
-- Religions
--------------------------------		
INSERT INTO Religions 
		(Type, 						Description, 					Civilopedia,							IconAtlas,								PortraitIndex,	IconString)
VALUES	('RELIGION_JFD_ATENISM', 	'TXT_KEY_RELIGION_JFD_ATENISM', 'TXT_KEY_RELIGION_JFD_ATENISM_PEDIA',	'JFD_EGYPT_AKHENATEN_RELIGION_ATLAS',	0,				'[ICON_RELIGION_JFD_ATENISM]');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 								Description, ShortDescription, Adjective,											 Civilopedia, 								CivilopediaTag, 					DefaultPlayerColor,				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,						PortraitIndex,	AlphaIconAtlas,						SoundtrackTag,  MapImage, 					DawnOfManQuote, 							DawnOfManImage)
SELECT	'CIVILIZATION_JFD_EGYPT_AKHENATEN', Description, ShortDescription, 'TXT_KEY_CIVILIZATION_JFD_EGYPT_AKHENATEN_ADJECTIVE', 'TXT_KEY_CIV5_JFD_EGYPT_AKHENATEN_TEXT_1',	'TXT_KEY_CIV5_JFD_EGYPT_AKHENATEN', 'PLAYERCOLOR_JFD_EGYPT_AKHENATEN', ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_EGYPT_AKHENATEN_ATLAS',	0,				'JFD_EGYPT_AKHENATEN_ALPHA_ATLAS',	'Egypt', 		'MapEgyptAkhenaten512.dds',	'TXT_KEY_CIV5_DAWN_EGYPT_AKHENATEN_TEXT',	'DOM_Akhenaten.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_EGYPT';
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
		(CivilizationType,						CityName)
VALUES	('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_1'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_2'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_3'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_4'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_5'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_6'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_7'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_8'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_9'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_10'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_11'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_12'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_13'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_14'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_15'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_16'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_17'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_18'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_19'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_20'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_21');

INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
SELECT	'CIVILIZATION_JFD_EGYPT_AKHENATEN', 	CityName
FROM Civilization_CityNames WHERE CivilizationType = 'CIVILIZATION_EGYPT';
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_JFD_EGYPT_AKHENATEN', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_EGYPT';
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_JFD_EGYPT_AKHENATEN', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_EGYPT';
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_EGYPT_AKHENATEN', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_EGYPT';
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'LEADER_JFD_AKHENATEN');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_JFD_EGYPT_AKHENATEN', 	'UNITCLASS_SPEARMAN',	'UNIT_JFD_KHOPESH');
--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_JFD_EGYPT_AKHENATEN', 	'RELIGION_JFD_ATENISM');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
VALUES	('CIVILIZATION_JFD_EGYPT_AKHENATEN', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_1'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_2'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_3'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_4'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_5'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_6'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_7'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_8'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_9'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_EGYPT_AKHENATEN_10');
--------------------------------	
-- Civilization_Start_Region_Priority
--------------------------------			
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 						RegionType)
VALUES	('CIVILIZATION_JFD_EGYPT_AKHENATEN', 	'REGION_DESERT');
--==========================================================================================================================
--==========================================================================================================================