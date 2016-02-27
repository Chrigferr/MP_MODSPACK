--==========================================================================================================================	
-- RESOURCES
--==========================================================================================================================	
-- Resources
------------------------------	
INSERT INTO Resources 
		(Type,						Description,						Civilopedia, 									ResourceClassType, 			AITradeModifier, 	ResourceUsage,	AIObjective,	WonderProductionMod,	ArtDefineTag,						IconString, 				PortraitIndex, 	IconAtlas)
VALUES	('RESOURCE_JFD_LIMESTONE',	'TXT_KEY_RESOURCE_JFD_LIMESTONE',	'TXT_KEY_CIV5_RESOURCE_JFD_LIMESTONE_TEXT',		'RESOURCECLASS_BONUS',		0,					0, 				0, 				10,						'ART_DEF_RESOURCE_JFD_LIMESTONE',	'[ICON_RES_JFD_LIMESTONE]',	0, 				'JFD_EGYPT_DJOSER_RESOURCE_ATLAS');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_YieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Resource_YieldChanges 	
		(ResourceType, 				YieldType, 				Yield)
VALUES	('RESOURCE_JFD_LIMESTONE',	'YIELD_PRODUCTION',		2);
---------------------------
-- Belief_ResourceYieldChanges
---------------------------
INSERT INTO Belief_ResourceYieldChanges 	
		(ResourceType, 				BeliefType,	YieldType,	Yield)
SELECT	'RESOURCE_JFD_LIMESTONE',	BeliefType,	YieldType,	Yield
FROM Belief_ResourceYieldChanges WHERE ResourceType = 'RESOURCE_STONE';
---------------------------
-- Buildings
---------------------------
UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_MAUSOLEM_HALICARNAUSS_HELP'
WHERE Type = 'BUILDING_MAUSOLEUM_HALICARNASSUS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CIVILIZATIONS_EGYPT_DJOSER_LIMESTONE_MAUSOLEUM' AND Value = 1);
---------------------------
-- Building_ResourceYieldChanges
---------------------------
INSERT INTO Building_ResourceYieldChanges 	
		(ResourceType, 				BuildingType,	YieldType,	Yield)
SELECT	'RESOURCE_JFD_LIMESTONE',	BuildingType,	YieldType,	Yield
FROM Building_ResourceYieldChanges WHERE ResourceType = 'RESOURCE_STONE' AND BuildingType = 'BUILDING_MAUSOLEUM_HALICARNASSUS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CIVILIZATIONS_EGYPT_DJOSER_LIMESTONE_MAUSOLEUM' AND Value = 1);
--==========================================================================================================================
-- IMPROVEMENT
--==========================================================================================================================
-- Improvements
------------------------------	
INSERT INTO Improvements
		(Type,									RequiresFlatlands,	GraphicalOnly,	Description,								Civilopedia,								BuildableOnResources,	PortraitIndex,	IconAtlas)
VALUES	('IMPROVEMENT_JFD_VIZIER_LIMESTONE',	1,					1,				'TXT_KEY_IMPROVEMENT_JFD_VIZIER_LIMESTONE',	'TXT_KEY_CIV5_IMPROVEMENTS_QUARRY_TEXT',	0,						31,				'TERRAIN_ATLAS');
------------------------------
-- Improvement_ResourceTypes
------------------------------
INSERT INTO Improvement_ResourceTypes
		(ImprovementType,		ResourceType)
VALUES	('IMPROVEMENT_QUARRY',	'RESOURCE_JFD_LIMESTONE');	
------------------------------
-- Improvement_ResourceType_Yields
------------------------------
INSERT INTO Improvement_ResourceType_Yields
		(ImprovementType,		ResourceType,				YieldType, Yield)
SELECT	'IMPROVEMENT_QUARRY',	'RESOURCE_JFD_LIMESTONE',	YieldType, Yield
FROM Improvement_ResourceType_Yields WHERE ImprovementType = 'IMPROVEMENT_QUARRY' AND ResourceType = 'RESOURCE_STONE';
------------------------------
-- Improvement_ValidTerrains
------------------------------
INSERT INTO Improvement_ValidTerrains
		(ImprovementType,					TerrainType)
SELECT	'IMPROVEMENT_JFD_VIZIER_LIMESTONE',	TerrainType
FROM Improvement_ValidTerrains WHERE ImprovementType = 'IMPROVEMENT_MANUFACTORY';
--==========================================================================================================================
-- BUILDS
--==========================================================================================================================
-- Builds
------------------------------	
INSERT INTO Builds
		(Type,							ImprovementType, 					PrereqTech,			ShowInTechTree, ShowInPedia, Description,							Help,										Kill,	CtrlDown,	OrderPriority,	IconIndex,	IconAtlas,							HotKey,		EntityEvent)
VALUES	('BUILD_JFD_VIZIER_LIMESTONE',	'IMPROVEMENT_JFD_VIZIER_LIMESTONE',	'TECH_MASONRY',		0,				0,			 'TXT_KEY_BUILD_JFD_VIZIER_LIMESTONE',	'TXT_KEY_BUILD_JFD_VIZIER_LIMESTONE_HELP',	1,		1,			96,				0,			'JFD_EGYPT_DJOSER_RESOURCE_ATLAS',	'KB_F',		'ENTITY_EVENT_MINE');
------------------------------
-- BuildFeatures
------------------------------
INSERT INTO BuildFeatures
		(BuildType,						FeatureType, 		PrereqTech,				Time,	Production,	Remove)
VALUES	('BUILD_JFD_VIZIER_LIMESTONE',	'FEATURE_JUNGLE',	'TECH_BRONZE_WORKING',	0,		0,			1),
		('BUILD_JFD_VIZIER_LIMESTONE',	'FEATURE_FOREST',	'TECH_MINING',			0,		20,			1),
		('BUILD_JFD_VIZIER_LIMESTONE',	'FEATURE_MARSH',	'TECH_MASONRY',			0,		0,			1);
--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses
		(Type, 												DefaultBuilding, 							 Description)
VALUES	('BUILDINGCLASS_JFD_EGYPT_DJOSER_LIMESTONE_BONUS', 	'BUILDING_JFD_EGYPT_DJOSER_LIMESTONE_BONUS', 'BUILDING_JFD_EGYPT_DJOSER_LIMESTONE_BONUS_DESC'),
		('BUILDINGCLASS_JFD_EGYPT_DJOSER_PRODUCTION_MOD', 	'BUILDING_JFD_EGYPT_DJOSER_PRODUCTION_MOD',	 'BUILDING_JFD_EGYPT_DJOSER_PRODUCTION_MOD_DESC');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 						SpecialistType,			SpecialistCount, BuildingClass, Cost, FaithCost, UnlockedByBelief, GoldMaintenance, PrereqTech,		FreeStartEra, Description, 							Civilopedia, 							Help, 									 Strategy,								 	  ArtDefineTag, MinAreaSize, NeverCapture, HurryCostModifier, PortraitIndex, IconAtlas)
SELECT	'BUILDING_JFD_BRICK_MASON',	'SPECIALIST_ENGINEER',	1,				 BuildingClass, Cost, FaithCost, UnlockedByBelief, GoldMaintenance, 'TECH_MASONRY',	FreeStartEra, 'TXT_KEY_BUILDING_JFD_BRICK_MASON',	'TXT_KEY_CIV5_JFD_BRICK_MASON_TEXT',    'TXT_KEY_BUILDING_JFD_BRICK_MASON_HELP', 'TXT_KEY_BUILDING_JFD_BRICK_MASON_STRATEGY', ArtDefineTag,	MinAreaSize, NeverCapture, HurryCostModifier, 3, 			 'JFD_EGYPT_DJOSER_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_STONE_WORKS';

INSERT INTO Buildings		
		(Type, 											BuildingClass, 			  							Cost, 	FaithCost,	GreatWorkCount,	BuildingProductionModifier, WonderProductionModifier,	Description, 										Help,												NeverCapture)
VALUES	('BUILDING_JFD_EGYPT_DJOSER_LIMESTONE_BONUS',	'BUILDINGCLASS_JFD_EGYPT_DJOSER_LIMESTONE_BONUS',	-1, 	-1,			-1,				0,							10,							'BUILDING_JFD_EGYPT_DJOSER_LIMESTONE_BONUS_DESC', 	'BUILDING_JFD_EGYPT_DJOSER_LIMESTONE_BONUS_HELP',	1),
		('BUILDING_JFD_EGYPT_DJOSER_PRODUCTION_MOD', 	'BUILDINGCLASS_JFD_EGYPT_DJOSER_PRODUCTION_MOD', 	-1, 	-1,			-1,				1,							0,							'BUILDING_JFD_EGYPT_DJOSER_PRODUCTION_MOD_DESC', 	'BUILDING_JFD_EGYPT_DJOSER_PRODUCTION_MOD_HELP',	1);
------------------------------
-- Building_ResourceYieldChanges
------------------------------	
INSERT INTO Building_ResourceYieldChanges 	
		(BuildingType, 				ResourceType,	YieldType,	Yield)
SELECT	'BUILDING_JFD_BRICK_MASON',	ResourceType,	YieldType,	Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_STONE_WORKS';

INSERT INTO Building_ResourceYieldChanges 	
		(BuildingType, 					ResourceType,				YieldType,			Yield)
VALUES	('BUILDING_JFD_BRICK_MASON',	'RESOURCE_JFD_LIMESTONE',	'YIELD_PRODUCTION', 1);
------------------------------
-- Building_YieldChanges
------------------------------	
INSERT INTO Building_YieldChanges 	
		(BuildingType, 				YieldType,	Yield)
SELECT	'BUILDING_JFD_BRICK_MASON',	YieldType,	Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_STONE_WORKS';
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,	Flavor)
SELECT	'BUILDING_JFD_BRICK_MASON',	FlavorType,	Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_STONE_WORKS';	
---==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 				Class,	PrereqTech,	Special, Combat, CombatLimit, WorkRate, BaseHurry, HurryMultiplier, CivilianAttackPriority, Cost, Moves, MoveRate, CombatClass, Domain, DefaultUnitAI, Description, 				Civilopedia, 					Strategy, 							Help, 							MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 				UnitFlagAtlas, 				 UnitFlagIconOffset, PortraitIndex,	IconAtlas)
SELECT	'UNIT_JFD_VIZIER',	Class,	PrereqTech, Special, Combat, CombatLimit, WorkRate, BaseHurry, HurryMultiplier, CivilianAttackPriority, Cost, Moves, MoveRate, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_VIZIER', 	'TXT_KEY_CIV5_JFD_VIZIER_TEXT',	'TXT_KEY_UNIT_JFD_VIZIER_STRATEGY', 'TXT_KEY_UNIT_JFD_VIZIER_HELP',	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_JFD_VIZIER',	'JFD_VIZIER_FLAG_ART_ATLAS', 0,					2,				'JFD_EGYPT_DJOSER_ATLAS'
FROM Units WHERE Type = 'UNIT_ENGINEER';
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 			SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_VIZIER',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_ENGINEER';	
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 			UnitAIType)
SELECT	'UNIT_JFD_VIZIER',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_ENGINEER';
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 			FlavorType, Flavor)
SELECT	'UNIT_JFD_VIZIER',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_ENGINEER';
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 			PromotionType)
SELECT	'UNIT_JFD_VIZIER',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_ENGINEER';
------------------------------
-- Unit_Builds
------------------------------
INSERT INTO Unit_Builds 	
		(UnitType, 			BuildType)
SELECT	'UNIT_JFD_VIZIER',	BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_ENGINEER';

INSERT INTO Unit_Builds 	
		(UnitType, 			BuildType)
VALUES	('UNIT_JFD_VIZIER',	'BUILD_JFD_VIZIER_LIMESTONE');
--------------------------------
-- Unit_UniqueNames
--------------------------------
INSERT INTO Unit_UniqueNames 
		(UnitType, 			UniqueName)
VALUES	('UNIT_JFD_VIZIER', 'TXT_KEY_GREAT_PERSON_JFD_VIZIER_1'),
		('UNIT_JFD_VIZIER', 'TXT_KEY_GREAT_PERSON_JFD_VIZIER_2'),
		('UNIT_JFD_VIZIER', 'TXT_KEY_GREAT_PERSON_JFD_VIZIER_3'),
		('UNIT_JFD_VIZIER', 'TXT_KEY_GREAT_PERSON_JFD_VIZIER_4'),
		('UNIT_JFD_VIZIER', 'TXT_KEY_GREAT_PERSON_JFD_VIZIER_5'),
		('UNIT_JFD_VIZIER', 'TXT_KEY_GREAT_PERSON_JFD_VIZIER_6'),
		('UNIT_JFD_VIZIER', 'TXT_KEY_GREAT_PERSON_JFD_VIZIER_7'),
		('UNIT_JFD_VIZIER', 'TXT_KEY_GREAT_PERSON_JFD_VIZIER_8'),
		('UNIT_JFD_VIZIER', 'TXT_KEY_GREAT_PERSON_JFD_VIZIER_9'),
		('UNIT_JFD_VIZIER', 'TXT_KEY_GREAT_PERSON_JFD_VIZIER_10'),
		('UNIT_JFD_VIZIER', 'TXT_KEY_GREAT_PERSON_JFD_VIZIER_11'),
		('UNIT_JFD_VIZIER', 'TXT_KEY_GREAT_PERSON_JFD_VIZIER_12'),
		('UNIT_JFD_VIZIER', 'TXT_KEY_GREAT_PERSON_JFD_VIZIER_13'),
		('UNIT_JFD_VIZIER', 'TXT_KEY_GREAT_PERSON_JFD_VIZIER_14'),
		('UNIT_JFD_VIZIER', 'TXT_KEY_GREAT_PERSON_JFD_VIZIER_15'),
		('UNIT_JFD_VIZIER', 'TXT_KEY_GREAT_PERSON_JFD_VIZIER_16'),
		('UNIT_JFD_VIZIER', 'TXT_KEY_GREAT_PERSON_JFD_VIZIER_17'),
		('UNIT_JFD_VIZIER', 'TXT_KEY_GREAT_PERSON_JFD_VIZIER_18'),
		('UNIT_JFD_VIZIER', 'TXT_KEY_GREAT_PERSON_JFD_VIZIER_19'),
		('UNIT_JFD_VIZIER', 'TXT_KEY_GREAT_PERSON_JFD_VIZIER_20'),
		('UNIT_JFD_VIZIER', 'TXT_KEY_GREAT_PERSON_JFD_VIZIER_21'),
		('UNIT_JFD_VIZIER', 'TXT_KEY_GREAT_PERSON_JFD_VIZIER_22'),
		('UNIT_JFD_VIZIER', 'TXT_KEY_GREAT_PERSON_JFD_VIZIER_23'),
		('UNIT_JFD_VIZIER', 'TXT_KEY_GREAT_PERSON_JFD_VIZIER_24'),
		('UNIT_JFD_VIZIER', 'TXT_KEY_GREAT_PERSON_JFD_VIZIER_25');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 					Description, 				Civilopedia, 							CivilopediaTag, 							ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES	('LEADER_JFD_DJOSER', 	'TXT_KEY_LEADER_JFD_DJOSER', 'TXT_KEY_LEADER_JFD_DJOSER_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_DJOSER', 	'Djoser_Scene.xml',		5, 						8, 						4, 							5, 			4, 				4, 				4, 						3, 				4, 			3, 			5, 				6, 			5, 			'JFD_EGYPT_DJOSER_ATLAS', 	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_DJOSER', 	'MAJOR_CIV_APPROACH_WAR', 			3),
		('LEADER_JFD_DJOSER', 	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
		('LEADER_JFD_DJOSER', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
		('LEADER_JFD_DJOSER', 	'MAJOR_CIV_APPROACH_GUARDED', 		5),
		('LEADER_JFD_DJOSER', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
		('LEADER_JFD_DJOSER', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_DJOSER', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_DJOSER', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_JFD_DJOSER', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_DJOSER', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
		('LEADER_JFD_DJOSER', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
		('LEADER_JFD_DJOSER', 	'MINOR_CIV_APPROACH_BULLY', 		2);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 			FlavorType, 						Flavor)
VALUES	('LEADER_JFD_DJOSER', 	'FLAVOR_OFFENSE', 					5),
		('LEADER_JFD_DJOSER', 	'FLAVOR_DEFENSE', 					4),
		('LEADER_JFD_DJOSER', 	'FLAVOR_CITY_DEFENSE', 				3),
		('LEADER_JFD_DJOSER', 	'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_JFD_DJOSER', 	'FLAVOR_RECON', 					4),
		('LEADER_JFD_DJOSER', 	'FLAVOR_RANGED', 					4),
		('LEADER_JFD_DJOSER', 	'FLAVOR_MOBILE', 					3),
		('LEADER_JFD_DJOSER', 	'FLAVOR_NAVAL', 					3),
		('LEADER_JFD_DJOSER', 	'FLAVOR_NAVAL_RECON', 				3),
		('LEADER_JFD_DJOSER', 	'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_JFD_DJOSER', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_JFD_DJOSER', 	'FLAVOR_AIR', 						2),
		('LEADER_JFD_DJOSER', 	'FLAVOR_EXPANSION', 				5),
		('LEADER_JFD_DJOSER', 	'FLAVOR_GROWTH', 					3),
		('LEADER_JFD_DJOSER', 	'FLAVOR_TILE_IMPROVEMENT', 			8),
		('LEADER_JFD_DJOSER', 	'FLAVOR_INFRASTRUCTURE', 			3),
		('LEADER_JFD_DJOSER', 	'FLAVOR_PRODUCTION', 				9),
		('LEADER_JFD_DJOSER', 	'FLAVOR_GOLD', 						4),
		('LEADER_JFD_DJOSER', 	'FLAVOR_SCIENCE', 					3),
		('LEADER_JFD_DJOSER', 	'FLAVOR_CULTURE', 					4),
		('LEADER_JFD_DJOSER', 	'FLAVOR_HAPPINESS', 				4),
		('LEADER_JFD_DJOSER', 	'FLAVOR_GREAT_PEOPLE', 				8),
		('LEADER_JFD_DJOSER', 	'FLAVOR_WONDER', 					8),
		('LEADER_JFD_DJOSER', 	'FLAVOR_RELIGION', 					4),
		('LEADER_JFD_DJOSER', 	'FLAVOR_DIPLOMACY', 				2),
		('LEADER_JFD_DJOSER', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_DJOSER', 	'FLAVOR_WATER_CONNECTION', 			5),
		('LEADER_JFD_DJOSER', 	'FLAVOR_NUKE', 						3),
		('LEADER_JFD_DJOSER', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_DJOSER', 	'FLAVOR_ESPIONAGE', 				2),
		('LEADER_JFD_DJOSER', 	'FLAVOR_AIRLIFT', 					2),
		('LEADER_JFD_DJOSER', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_DJOSER', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_DJOSER', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_DJOSER', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_DJOSER', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_DJOSER', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 			TraitType)
VALUES	('LEADER_JFD_DJOSER', 	'TRAIT_JFD_EGYPT_DJOSER');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 						Description, 						ShortDescription,						FreeUnit,				FreeUnitPrereqTech)
VALUES	('TRAIT_JFD_EGYPT_DJOSER', 	'TXT_KEY_TRAIT_JFD_EGYPT_DJOSER', 	'TXT_KEY_TRAIT_JFD_EGYPT_DJOSER_SHORT',	'UNITCLASS_ENGINEER',	'TECH_MASONRY');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 								DerivativeCiv,			Description, ShortDescription, Adjective,								 Civilopedia, CivilopediaTag, 	DefaultPlayerColor,				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,					PortraitIndex,	AlphaIconAtlas,					SoundtrackTag,  MapImage, 					DawnOfManQuote, 						DawnOfManImage)
SELECT	'CIVILIZATION_JFD_EGYPT_DJOSER',	'CIVILIZATION_EGYPT',	Description, ShortDescription, 'TXT_KEY_CIV_JFD_EGYPT_DJOSER_ADJECTIVE', Civilopedia, CivilopediaTag,   'PLAYERCOLOR_JFD_EGYPT_DJOSER', ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_EGYPT_DJOSER_ATLAS',	0,				'JFD_EGYPT_DJOSER_ALPHA_ATLAS',	'Egypt', 		'MapEgyptDjoser512.dds',	'TXT_KEY_CIV5_DAWN_EGYPT_DJOSER_TEXT',	'DOM_Djoser.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_EGYPT';
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 					CityName)
VALUES	('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_1'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_2'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_3'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_4'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_5'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_6'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_7'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_8'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_9'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_10'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_11'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_12'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_13'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_14'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_15'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_16'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_17'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_18'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_19'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_20'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_21'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_22'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_23'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_24'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_25'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_26');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_JFD_EGYPT_DJOSER', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_EGYPT';
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_JFD_EGYPT_DJOSER', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_EGYPT';
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_EGYPT_DJOSER', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_EGYPT';
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_JFD_EGYPT_DJOSER',	'LEADER_JFD_DJOSER');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 					BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_JFD_EGYPT_DJOSER', 	'BUILDINGCLASS_STONE_WORKS',	'BUILDING_JFD_BRICK_MASON');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_JFD_EGYPT_DJOSER', 	'UNITCLASS_ENGINEER',	'UNIT_JFD_VIZIER');
--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 					ReligionType)
VALUES	('CIVILIZATION_JFD_EGYPT_DJOSER', 	'RELIGION_ISLAM');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_1'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_2'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_3'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_4'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_5'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_6'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_7'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_8'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_9'),
		('CIVILIZATION_JFD_EGYPT_DJOSER', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_EGYPT_DJOSER_10');
--------------------------------
-- Civilization_Start_Region_Avoid
--------------------------------			
INSERT INTO Civilization_Start_Region_Avoid
		(CivilizationType, 					RegionType)
VALUES	('CIVILIZATION_JFD_EGYPT_DJOSER', 	'REGION_HILLS');
--==========================================================================================================================
--==========================================================================================================================