--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
			(Type, 						 	DefaultBuilding, 				Description)
VALUES		('BUILDINGCLASS_JFD_BAVARIA', 	'BUILDING_JFD_BAVARIAN_MUSIC', 	'TXT_KEY_BUILDING_JFD_BAVARIAN_CULTURE');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type, 						 				BuildingClass, 					GreatWorkSlotType,			GreatWorkCount, Cost, FaithCost, PrereqTech, Description, 											Help,													PortraitIndex,	IconAtlas)
VALUES		('BUILDING_JFD_BAVARIAN_CULTURE', 			'BUILDINGCLASS_JFD_BAVARIA', 	null,						-1, 			-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_BAVARIAN_CULTURE', 				'TXT_KEY_BUILDING_JFD_BAVARIAN_CULTURE_HELP',			0,				null),
			('BUILDING_JFD_BAVARIAN_MUSIC', 			'BUILDINGCLASS_JFD_BAVARIA', 	'GREAT_WORK_SLOT_MUSIC',	1, 				-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_BAVARIAN_MUSIC', 				null,													14,				'TECH_ATLAS_2');
--------------------------------	
-- Building_YieldChanges
--------------------------------	
INSERT INTO Building_YieldChanges 	
			(BuildingType, 						YieldType, 			Yield)
VALUES		('BUILDING_JFD_BAVARIAN_CULTURE', 	'YIELD_CULTURE', 	1);
--==========================================================================================================================	
-- BUILDS
--==========================================================================================================================	
-- Builds
------------------------------	
INSERT INTO Builds
			(Type,					PrereqTech,				ImprovementType, 			Time, Recommendation,					Description,			Help,								CtrlDown,	OrderPriority,	IconIndex,	IconAtlas,				HotKey, EntityEvent)
VALUES		('BUILD_JFD_SCHLOSS',	'TECH_ARCHITECTURE',	'IMPROVEMENT_JFD_SCHLOSS',	1000, 'TXT_KEY_BUILD_JFD_SCHLOSS_REC', 'TXT_KEY_JFD_SCHLOSS',	'TXT_KEY_BUILD_JFD_SCHLOSS_HELP',	1,			96,				1,			'JFD_SCHLOSS_ATLAS',	'KB_F',	'ENTITY_EVENT_BUILD');
------------------------------
-- BuildFeatures
------------------------------
INSERT INTO BuildFeatures
			(BuildType, 			FeatureType, PrereqTech, Time, Remove)
SELECT		('BUILD_JFD_SCHLOSS'),	FeatureType, PrereqTech, Time, 0
FROM BuildFeatures WHERE BuildType = 'BUILD_FORT';
--==========================================================================================================================	
-- IMPROVEMENTS
--==========================================================================================================================	
-- Improvements
------------------------------
INSERT INTO Improvements
			(Type,								SpecificCivRequired,	CivilizationType,			GoldMaintenance,	NoTwoAdjacent,	HillsMakesValid,	Description,						Civilopedia,									ArtDefineTag,					BuildableOnResources,	DestroyedWhenPillaged,	Permanent,	PillageGold,	DefenseModifier,	PortraitIndex,	IconAtlas)
VALUES		('IMPROVEMENT_JFD_SCHLOSS',			1,						'CIVILIZATION_JFD_BAVARIA',	0,					1,				1,					'TXT_KEY_IMPROVEMENT_JFD_SCHLOSS',	'TXT_KEY_CIV5_IMPROVEMENTS_JFD_SCHLOSS_TEXT',	'ART_DEF_IMPROVEMENT_SCHLOSS', 	0,						0,						1,			50,				0,					0,				'JFD_SCHLOSS_ATLAS'),
			('IMPROVEMENT_JFD_SCHLOSS_GOLD',	0,						null,						0,					1,				1,					'TXT_KEY_IMPROVEMENT_JFD_SCHLOSS',	'TXT_KEY_CIV5_IMPROVEMENTS_JFD_SCHLOSS_TEXT',	'ART_DEF_IMPROVEMENT_SCHLOSS', 	0,						0,						1,			50,				50,					0,				'JFD_SCHLOSS_ATLAS');
------------------------------
-- Improvement_ResourceTypes
------------------------------
INSERT INTO Improvement_ResourceTypes
			(ImprovementType,				ResourceType)
SELECT		('IMPROVEMENT_JFD_SCHLOSS'), 	ResourceType
FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_MINE';
------------------------------
-- Improvement_ValidTerrains
------------------------------
INSERT INTO Improvement_ValidTerrains
			(ImprovementType,				TerrainType)
VALUES		('IMPROVEMENT_JFD_SCHLOSS',		'TERRAIN_HILL');
------------------------------
-- Improvement_ValidTerrains
------------------------------
INSERT INTO Improvement_Yields
			(ImprovementType,					YieldType,			Yield)
VALUES		('IMPROVEMENT_JFD_SCHLOSS_GOLD',	'YIELD_GOLD',		2),
			('IMPROVEMENT_JFD_SCHLOSS_GOLD',	'YIELD_CULTURE',	1),
			('IMPROVEMENT_JFD_SCHLOSS',			'YIELD_CULTURE',	1);
------------------------------
-- Improvement_AdjacentMountainYieldChanges
------------------------------
INSERT INTO Improvement_AdjacentMountainYieldChanges
			(ImprovementType,					YieldType,			Yield)
VALUES		('IMPROVEMENT_JFD_SCHLOSS',			'YIELD_CULTURE',	1),	
			('IMPROVEMENT_JFD_SCHLOSS_GOLD',	'YIELD_CULTURE',	1);
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
			(Type, 					Description, 						Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_JFD_LUDWIG', 	'TXT_KEY_LEADER_JFD_LUDWIG', 		'TXT_KEY_LEADER_JFD_LUDWIG_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_LUDWIG', 	'Ludwig_Scene.xml',	4, 						10, 					4, 							6, 			5, 				2, 				2, 						3, 				3, 			4, 			4, 				4, 			3, 			'JFD_BAVARIA_ATLAS', 	1);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_LUDWIG', 	'MAJOR_CIV_APPROACH_WAR', 			2),
			('LEADER_JFD_LUDWIG', 	'MAJOR_CIV_APPROACH_HOSTILE', 		2),
			('LEADER_JFD_LUDWIG', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	2),
			('LEADER_JFD_LUDWIG', 	'MAJOR_CIV_APPROACH_GUARDED', 		2),
			('LEADER_JFD_LUDWIG', 	'MAJOR_CIV_APPROACH_AFRAID', 		2),
			('LEADER_JFD_LUDWIG', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
			('LEADER_JFD_LUDWIG', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_LUDWIG', 	'MINOR_CIV_APPROACH_IGNORE', 		6),
			('LEADER_JFD_LUDWIG', 	'MINOR_CIV_APPROACH_FRIENDLY', 		2),
			('LEADER_JFD_LUDWIG', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
			('LEADER_JFD_LUDWIG', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
			('LEADER_JFD_LUDWIG', 	'MINOR_CIV_APPROACH_BULLY', 		2);
--------------------------------	
-- Leader_Flavors
--------------------------------						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_JFD_LUDWIG', 	'FLAVOR_OFFENSE', 					2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_DEFENSE', 					6),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_CITY_DEFENSE', 				9),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_MILITARY_TRAINING', 		3),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_RECON', 					3),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_RANGED', 					2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_MOBILE', 					2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_NAVAL', 					2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_NAVAL_RECON', 				2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_NAVAL_GROWTH', 				2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_AIR', 						2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_EXPANSION', 				2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_GROWTH', 					6),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_INFRASTRUCTURE', 			9),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_PRODUCTION', 				9),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_GOLD', 						7),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_SCIENCE', 					3),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_CULTURE', 					9),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_HAPPINESS', 				3),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_GREAT_PEOPLE', 				8),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_WONDER', 					10),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_RELIGION', 					4),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_DIPLOMACY', 				2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_SPACESHIP', 				2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_WATER_CONNECTION', 			2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_ESPIONAGE', 				2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_JFD_LUDWIG', 	'TRAIT_JFD_BAVARIA');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
			(Type, 					Description, 					ShortDescription)
VALUES		('TRAIT_JFD_BAVARIA', 	'TXT_KEY_TRAIT_JFD_BAVARIA', 	'TXT_KEY_TRAIT_JFD_BAVARIA_SHORT');	
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
			(Type, 							RoughDefense,	Description, 							Help, 										Sound, 				CannotBeChosen, PortraitIndex,  IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_HUBERTUSODEN', 	20,				'TXT_KEY_PROMOTION_JFD_HUBERTUSODEN',	'TXT_KEY_PROMOTION_JFD_HUBERTUSODEN_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_HUBERTUSODEN'),
			('PROMOTION_JFD_HARTSCHIER', 	0,				'TXT_KEY_PROMOTION_JFD_HARTSCHIER',		'TXT_KEY_PROMOTION_JFD_HARTSCHIER_HELP', 	'AS2D_IF_LEVELUP', 	1, 				58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_HARTSCHIER');
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
			(Type, 						PrereqTech,				Class,					Combat, 	Cost,		Moves, FaithCost,		RequiresFaithPurchaseEnabled, CombatClass, Domain, 	DefaultUnitAI, 	Description, 						Civilopedia, 							Help, 									Strategy,									GoodyHutUpgradeUnitClass, 	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, UnitArtInfo,						UnitFlagIconOffset,	UnitFlagAtlas,						MoveRate,	PortraitIndex, 	IconAtlas)
SELECT		('UNIT_JFD_HARTSCHIER'),	('TECH_METALLURGY'),	('UNITCLASS_LANCER'),	Combat+6,	Cost+75,	Moves, FaithCost+170,	RequiresFaithPurchaseEnabled, CombatClass, Domain,	DefaultUnitAI, ('TXT_KEY_UNIT_JFD_HARTSCHIER'), 	('TXT_KEY_CIV5_JFD_HARTSCHIER_TEXT'), 	('TXT_KEY_UNIT_JFD_HARTSCHIER_HELP'), 	('TXT_KEY_UNIT_JFD_HARTSCHIER_STRATEGY'), 	GoodyHutUpgradeUnitClass,	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, ('ART_DEF_UNIT_JFD_HARTSCHIER'),	0,					('JFD_UNIT_FLAG_HARTSCHIER_ATLAS'),	MoveRate,	2, 				('JFD_BAVARIA_ATLAS')
FROM Units WHERE (Type = 'UNIT_PIKEMAN');	
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_HARTSCHIER'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_PIKEMAN');
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_JFD_HARTSCHIER'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_PIKEMAN');
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_HARTSCHIER'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_PIKEMAN');
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 
			(UnitType, 					PromotionType)
VALUES		('UNIT_JFD_HARTSCHIER', 	'PROMOTION_FORMATION_1'),
			('UNIT_JFD_HARTSCHIER', 	'PROMOTION_JFD_HUBERTUSODEN'),
			('UNIT_JFD_HARTSCHIER', 	'PROMOTION_JFD_HARTSCHIER');
--------------------------------
-- Unit_Builds
--------------------------------
INSERT INTO Unit_Builds 	
			(UnitType, 			BuildType)
VALUES		('UNIT_WORKER', 	'BUILD_JFD_SCHLOSS');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 		
			(Type, 							Description,						ShortDescription, 						Adjective, 								Civilopedia,							CivilopediaTag,					DefaultPlayerColor,				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 				DawnOfManQuote, 					DawnOfManImage)
SELECT		('CIVILIZATION_JFD_BAVARIA'), 	('TXT_KEY_CIV_JFD_BAVARIA_DESC'), 	('TXT_KEY_CIV_JFD_BAVARIA_SHORT_DESC'), ('TXT_KEY_CIV_JFD_BAVARIA_ADJECTIVE'), 	('TXT_KEY_CIV5_JFD_BAVARIA_TEXT_1'), 	('TXT_KEY_CIV5_JFD_BAVARIA'), 	 ('PLAYERCOLOR_JFD_BAVARIA'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_BAVARIA_ATLAS'), 	0, 				('JFD_BAVARIA_ALPHA_ATLAS'), 	('Germany'), 	('BavariaMap512.dds'),	('TXT_KEY_CIV5_DAWN_BAVARIA_TEXT'), ('DOM_Ludwig.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_GERMANY');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_01'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_02'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_03'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_04'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_05'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_06'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_07'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_08'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_09'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_10'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_11'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_12'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_13'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_14'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_15'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_16'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_17'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_18'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_19'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_20'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_21'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_22'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_23'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_24'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_25'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_26'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_27'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_28'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_29'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_30');			
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
SELECT		('CIVILIZATION_JFD_BAVARIA'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_JFD_BAVARIA'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_BAVARIA'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_JFD_BAVARIA', 	'LEADER_JFD_LUDWIG');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 		UnitType)
VALUES		('CIVILIZATION_JFD_BAVARIA', 	'UNITCLASS_LANCER',	'UNIT_JFD_HARTSCHIER');
--------------------------------	
-- Civilization_Religions
--------------------------------		
INSERT INTO Civilization_Religions 
			(CivilizationType, 				ReligionType)
VALUES		('CIVILIZATION_JFD_BAVARIA', 	'RELIGION_CHRISTIANITY');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_SPY_NAME_JFD_BAVARIA_0'),	
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_SPY_NAME_JFD_BAVARIA_1'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_SPY_NAME_JFD_BAVARIA_2'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_SPY_NAME_JFD_BAVARIA_3'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_SPY_NAME_JFD_BAVARIA_4'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_SPY_NAME_JFD_BAVARIA_5'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_SPY_NAME_JFD_BAVARIA_6'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_SPY_NAME_JFD_BAVARIA_7'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_SPY_NAME_JFD_BAVARIA_8'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_SPY_NAME_JFD_BAVARIA_9');
--------------------------------
-- Civilization_Start_Region_Priority
--------------------------------	
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 				RegionType)
VALUES		('CIVILIZATION_JFD_BAVARIA', 	'REGION_HILLS');
--==========================================================================================================================
--==========================================================================================================================