--==========================================================================================================================	
-- RESOURCES
--==========================================================================================================================	
-- Resources
------------------------------	
INSERT INTO Resources 
		(Type,						Description,						Civilopedia, 								ResourceClassType, 		Happiness,  AITradeModifier, 	ResourceUsage,	AIObjective,	'Unique', 	IconString, 				PortraitIndex, 	IconAtlas)
VALUES	('RESOURCE_JFD_PRALINE',	'TXT_KEY_RESOURCE_JFD_PRALINE',		'TXT_KEY_CIV5_RESOURCE_JFD_PRALINE_TEXT',	'RESOURCECLASS_LUXURY',	4,			10,					2, 				0, 				2, 			'[ICON_RES_JFD_PRALINE]',	4, 				'JFD_BELGIUM_ATLAS');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 								BuildingClass, Cost, GoldMaintenance, SpecialistCount, SpecialistType, PrereqTech, Description, 							Civilopedia, 								Help, 											Strategy,											ArtDefineTag, 	MinAreaSize, ConquestProb, HurryCostModifier, PortraitIndex, IconAtlas)
SELECT	'BUILDING_JFD_CHOCOLATE_HOUSE',		BuildingClass, Cost, GoldMaintenance, SpecialistCount, SpecialistType, PrereqTech, 'TXT_KEY_BUILDING_JFD_CHOCOLATE_HOUSE', 'TXT_KEY_CIV5_JFD_CHOCOLATE_HOUSE_TEXT', 	'TXT_KEY_BUILDING_JFD_CHOCOLATE_HOUSE_HELP', 	'TXT_KEY_BUILDING_JFD_CHOCOLATE_HOUSE_STRATEGY',	ArtDefineTag,	MinAreaSize, ConquestProb, HurryCostModifier, 3, 			 'JFD_BELGIUM_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_THEATRE';	
------------------------------	
-- Building_ResourceQuantity
------------------------------	
INSERT INTO Building_ResourceQuantity 	
		(BuildingType, 						ResourceType, 			Quantity)
VALUES	('BUILDING_JFD_CHOCOLATE_HOUSE',	'RESOURCE_JFD_PRALINE', 1);	
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
SELECT	'BUILDING_JFD_CHOCOLATE_HOUSE',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_THEATRE';
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 						YieldType,	Yield)
SELECT	'BUILDING_JFD_CHOCOLATE_HOUSE',		YieldType,	Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_THEATRE';
------------------------------	
-- Building_ResourceYieldChanges
------------------------------		
INSERT INTO Building_ResourceYieldChanges 	
		(BuildingType, 						ResourceType,	YieldType,		Yield)
SELECT	'BUILDING_JFD_CHOCOLATE_HOUSE',		ResourceType,	'YIELD_GOLD',	1
FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_PLANTATION';
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 						FlavorType, Flavor)
SELECT	'BUILDING_JFD_CHOCOLATE_HOUSE',		FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_THEATRE';
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES	('LEADER_JFD_ALBERT', 		'TXT_KEY_LEADER_JFD_ALBERT', 		'TXT_KEY_LEADER_JFD_ALBERT_PEDIA', 		'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_ALBERT', 		'Albert_Scene.xml',	2, 						2, 						2, 							2, 			8, 				8, 				8, 						9, 				8, 			8, 			6, 				7, 			2, 			'JFD_BELGIUM_ATLAS', 	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_ALBERT', 		'MAJOR_CIV_APPROACH_WAR', 			0),
		('LEADER_JFD_ALBERT', 		'MAJOR_CIV_APPROACH_HOSTILE', 		1),
		('LEADER_JFD_ALBERT', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	1),
		('LEADER_JFD_ALBERT', 		'MAJOR_CIV_APPROACH_GUARDED', 		4),
		('LEADER_JFD_ALBERT', 		'MAJOR_CIV_APPROACH_AFRAID', 		5),
		('LEADER_JFD_ALBERT', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		9),
		('LEADER_JFD_ALBERT', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_ALBERT', 		'MINOR_CIV_APPROACH_IGNORE', 		6),
		('LEADER_JFD_ALBERT', 		'MINOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_JFD_ALBERT', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
		('LEADER_JFD_ALBERT', 		'MINOR_CIV_APPROACH_CONQUEST', 		1);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 				FlavorType, 						Flavor)
VALUES	('LEADER_JFD_ALBERT', 		'FLAVOR_OFFENSE', 					1),
		('LEADER_JFD_ALBERT', 		'FLAVOR_DEFENSE', 					6),
		('LEADER_JFD_ALBERT', 		'FLAVOR_CITY_DEFENSE', 				6),
		('LEADER_JFD_ALBERT', 		'FLAVOR_MILITARY_TRAINING', 		3),
		('LEADER_JFD_ALBERT', 		'FLAVOR_RECON', 					4),
		('LEADER_JFD_ALBERT', 		'FLAVOR_RANGED', 					3),
		('LEADER_JFD_ALBERT', 		'FLAVOR_MOBILE', 					2),
		('LEADER_JFD_ALBERT', 		'FLAVOR_NAVAL', 					4),
		('LEADER_JFD_ALBERT', 		'FLAVOR_NAVAL_RECON', 				4),
		('LEADER_JFD_ALBERT', 		'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_JFD_ALBERT', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
		('LEADER_JFD_ALBERT', 		'FLAVOR_AIR', 						3),
		('LEADER_JFD_ALBERT', 		'FLAVOR_EXPANSION', 				4),
		('LEADER_JFD_ALBERT', 		'FLAVOR_GROWTH', 					3),
		('LEADER_JFD_ALBERT', 		'FLAVOR_TILE_IMPROVEMENT', 			9),
		('LEADER_JFD_ALBERT', 		'FLAVOR_INFRASTRUCTURE', 			6),
		('LEADER_JFD_ALBERT', 		'FLAVOR_PRODUCTION', 				4),
		('LEADER_JFD_ALBERT', 		'FLAVOR_GOLD', 						8),
		('LEADER_JFD_ALBERT', 		'FLAVOR_SCIENCE', 					4),
		('LEADER_JFD_ALBERT', 		'FLAVOR_CULTURE', 					5),
		('LEADER_JFD_ALBERT', 		'FLAVOR_HAPPINESS', 				9),
		('LEADER_JFD_ALBERT', 		'FLAVOR_GREAT_PEOPLE', 				6),
		('LEADER_JFD_ALBERT', 		'FLAVOR_WONDER', 					2),
		('LEADER_JFD_ALBERT', 		'FLAVOR_RELIGION', 					4),
		('LEADER_JFD_ALBERT', 		'FLAVOR_DIPLOMACY', 				3),
		('LEADER_JFD_ALBERT', 		'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_ALBERT', 		'FLAVOR_WATER_CONNECTION', 			4),
		('LEADER_JFD_ALBERT', 		'FLAVOR_NUKE', 						2),
		('LEADER_JFD_ALBERT', 		'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_ALBERT', 		'FLAVOR_ESPIONAGE', 				3),
		('LEADER_JFD_ALBERT', 		'FLAVOR_AIRLIFT', 					2),
		('LEADER_JFD_ALBERT', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_ALBERT', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_ALBERT', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_ALBERT', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_ALBERT', 		'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_ALBERT', 		'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 				TraitType)
VALUES	('LEADER_JFD_ALBERT', 		'TRAIT_JFD_BELGIUM');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 						Description, 					ShortDescription)
VALUES	('TRAIT_JFD_BELGIUM', 		'TXT_KEY_TRAIT_JFD_BELGIUM', 	'TXT_KEY_TRAIT_JFD_BELGIUM_SHORT');
--==========================================================================================================================	
-- BUILDS
--==========================================================================================================================
-- Builds
--------------------------------	
INSERT INTO Builds
		(Type,							PrereqTech, ImprovementType, 						ShowInTechTree,	Time, Recommendation, Description,						Help, Kill, CtrlDown, OrderPriority, IconIndex, IconAtlas,	HotKey, EntityEvent)
SELECT	'BUILD_JFD_BELGIAN_PLANTATION',	PrereqTech, 'IMPROVEMENT_JFD_BELGIAN_PLANTATION',	0,				Time, Recommendation, 'TXT_KEY_JFD_BELGIAN_PLANTATION',	Help, Kill, CtrlDown, OrderPriority, IconIndex, IconAtlas,	HotKey,	EntityEvent
FROM Builds WHERE Type = 'BUILD_PLANTATION';
--------------------------------	
-- BuildFeatures
--------------------------------	
INSERT INTO BuildFeatures
		(BuildType, 					FeatureType, PrereqTech, Time, Remove)
SELECT	'BUILD_JFD_BELGIAN_PLANTATION',	FeatureType, PrereqTech, Time, Remove
FROM BuildFeatures WHERE BuildType = 'BUILD_PLANTATION';
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 									Description, 								Help, 												Sound, 				CannotBeChosen, LostWithUpgrade,	AlwaysHeal, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_CHASSEUR', 				'TXT_KEY_PROMOTION_JFD_CHASSEUR',			'TXT_KEY_PROMOTION_JFD_CHASSEUR_HELP', 				'AS2D_IF_LEVELUP', 	1, 				1, 					0, 			59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_CHASSEUR'),
		('PROMOTION_JFD_CHASSEUR_MARCH', 		'TXT_KEY_PROMOTION_JFD_CHASSEUR_MARCH',		'TXT_KEY_PROMOTION_JFD_CHASSEUR_MARCH_HELP', 		'AS2D_IF_LEVELUP', 	1, 				1, 					1, 			31, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_CHASSEUR_MARCH');
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
		(Type, 				 PrereqTech, Class, Combat,		RangedCombat,	Cost, Moves, 	Range, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain, DefaultUnitAI, Description, 				  Civilopedia, 						Help, 								Strategy,								ObsoleteTech, 	GoodyHutUpgradeUnitClass, 	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, UnitArtInfo,					UnitFlagIconOffset,	UnitFlagAtlas,					MoveRate,	PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_CHASSEUR', PrereqTech, Class, Combat-4,	RangedCombat-4, Cost, Moves+1,	Range, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_CHASSEUR',  'TXT_KEY_CIV5_JFD_CHASSEUR_TEXT', 'TXT_KEY_UNIT_JFD_CHASSEUR_HELP', 	'TXT_KEY_UNIT_JFD_CHASSEUR_STRATEGY',	ObsoleteTech,	GoodyHutUpgradeUnitClass,	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, 'ART_DEF_UNIT_JFD_CHASSEUR',  	0,					'JFD_UNIT_FLAG_CHASSEUR_ATLAS',	MoveRate,	2, 				'JFD_BELGIUM_ATLAS'
FROM Units WHERE Type = 'UNIT_GATLINGGUN';

INSERT INTO Units 	
		(Type, 							PrereqTech, Class, Capture, Cost, Moves, CivilianAttackPriority, Domain, ShowInPedia, 	DefaultUnitAI,	Description, Civilopedia, Help, Strategy, AdvancedStartCost, WorkRate, 	CombatLimit, UnitArtInfo, UnitArtInfoEraVariation, UnitFlagIconOffset, PortraitIndex, IconAtlas)
SELECT	'UNIT_JFD_BELGIAN_WORKER',		PrereqTech, Class, Capture, Cost, Moves, CivilianAttackPriority, Domain, 0,				DefaultUnitAI,	Description, Civilopedia, Help, Strategy, AdvancedStartCost, WorkRate,	CombatLimit, UnitArtInfo, UnitArtInfoEraVariation, UnitFlagIconOffset, PortraitIndex, IconAtlas
FROM Units WHERE Type = 'UNIT_WORKER';	
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_CHASSEUR', 			SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GREAT_WAR_INFANTRY';	

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_BELGIAN_WORKER',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_WORKER';	
--------------------------------		
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	'UNIT_JFD_CHASSEUR', 			UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GATLINGGUN';

INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	'UNIT_JFD_BELGIAN_WORKER',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_WORKER';
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 						UnitClassType)
SELECT	'UNIT_JFD_CHASSEUR', 			UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_GATLINGGUN';
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType, Flavor)
SELECT	'UNIT_JFD_CHASSEUR', 			FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GATLINGGUN';

INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType, Flavor)
SELECT	'UNIT_JFD_BELGIAN_WORKER',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_WORKER';
--------------------------------	
-- Unit_Builds
--------------------------------	
INSERT INTO Unit_Builds 	
		(UnitType, 						BuildType)
SELECT	'UNIT_JFD_BELGIAN_WORKER',		BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_WORKER';

DELETE FROM Unit_Builds WHERE UnitType = 'UNIT_JFD_BELGIAN_WORKER' AND BuildType = 'BUILD_PLANTATION';
INSERT INTO Unit_Builds 	
		(UnitType, 						BuildType)
VALUES	('UNIT_JFD_BELGIAN_WORKER', 	'BUILD_JFD_BELGIAN_PLANTATION');
--------------------------------	
-- Unit_FreePromotions
--------------------------------	
INSERT INTO Unit_FreePromotions
		(UnitType, 						PromotionType)
VALUES	('UNIT_JFD_CHASSEUR', 			'PROMOTION_JFD_CHASSEUR'),	
		('UNIT_JFD_CHASSEUR', 			'PROMOTION_ONLY_DEFENSIVE');
--==========================================================================================================================	
-- MINOR CIVILIZATIONS
--==========================================================================================================================	
-- MinorCivilizations
--------------------------------			
UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_JFD_ANDORRA_LA_VELLA_DESC', ShortDescription = 'TXT_KEY_CITYSTATE_JFD_ANDORRA_LA_VELLA_SHORT_DESC', Adjective = 'TXT_KEY_CITYSTATE_JFD_ANDORRA_LA_VELLA_ADJECTIVE', Civilopedia = 'TXT_KEY_CIV5_JFD_ANDORRA_LA_VELLA_TEXT_1'
WHERE Type = 'MINOR_CIV_BRUSSELS';

UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_JFD_VADUZ_DESC', ShortDescription = 'TXT_KEY_CITYSTATE_JFD_VADUZ_SHORT_DESC', Adjective = 'TXT_KEY_CITYSTATE_JFD_VADUZ_ADJECTIVE', Civilopedia = 'TXT_KEY_CIV5_JFD_VADUZ_TEXT_1'
WHERE Type = 'MINOR_CIV_ANTWERP';
--------------------------------		
-- MinorCivilization_CityNames
--------------------------------			
UPDATE MinorCivilization_CityNames
SET CityName = 'TXT_KEY_CITYSTATE_JFD_ANDORRA_LA_VELLA_DESC'
WHERE MinorCivType = 'MINOR_CIV_BRUSSELS';

UPDATE MinorCivilization_CityNames
SET CityName = 'TXT_KEY_CITYSTATE_JFD_VADUZ_DESC'
WHERE MinorCivType = 'MINOR_CIV_ANTWERP';
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 							Description,					ShortDescription, 					Adjective, 					Civilopedia, 						CivilopediaTag, 				DefaultPlayerColor, 		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 			SoundtrackTag, 	MapImage, 				DawnOfManQuote, 						DawnOfManImage)
SELECT	'CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_JFD_BELGIUM_DESC',		'TXT_KEY_JFD_BELGIUM_SHORT_DESC',	'TXT_KEY_JFD_BELGIUM_ADJ',	'TXT_KEY_CIV5_JFD_BELGIUM_TEXT_1', 	'TXT_KEY_CIV5_JFD_BELGIUM', 	'PLAYERCOLOR_JFD_BELGIUM', 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_BELGIUM_ATLAS', 	0, 				'JFD_BELGIUM_ALPHA_ATLAS', 	'France', 		'MapBelgium512.dds',	'TXT_KEY_CIV5_DOM_JFD_ALBERT_TEXT', 	'DOM_Albert.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_FRANCE';
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 				CityName)
VALUES	('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_CITY_NAME_JFD_BELGIUM_01'),
		('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_CITY_NAME_JFD_BELGIUM_02'),
		('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_CITY_NAME_JFD_BELGIUM_03'),
		('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_CITY_NAME_JFD_BELGIUM_04'),
		('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_CITY_NAME_JFD_BELGIUM_05'),
		('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_CITY_NAME_JFD_BELGIUM_06'),
		('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_CITY_NAME_JFD_BELGIUM_07'),
		('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_CITY_NAME_JFD_BELGIUM_08'),
		('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_CITY_NAME_JFD_BELGIUM_09'),
		('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_CITY_NAME_JFD_BELGIUM_10'),
		('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_CITY_NAME_JFD_BELGIUM_11'),
		('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_CITY_NAME_JFD_BELGIUM_12'),
		('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_CITY_NAME_JFD_BELGIUM_13'),
		('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_CITY_NAME_JFD_BELGIUM_14'),
		('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_CITY_NAME_JFD_BELGIUM_15'),
		('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_CITY_NAME_JFD_BELGIUM_16');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 				BuildingClassType)
SELECT	'CIVILIZATION_JFD_BELGIUM', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 				TechType)
SELECT	'CIVILIZATION_JFD_BELGIUM', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_BELGIUM', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_JFD_BELGIUM', 	'LEADER_JFD_ALBERT');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_JFD_BELGIUM', 	'UNITCLASS_GATLINGGUN', 	'UNIT_JFD_CHASSEUR');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 				BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_JFD_BELGIUM', 	'BUILDINGCLASS_THEATRE', 	'BUILDING_JFD_CHOCOLATE_HOUSE');
--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 				ReligionType)
SELECT	'CIVILIZATION_JFD_BELGIUM', 	ReligionType
FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 				SpyName)
VALUES	('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_SPY_NAME_JFD_BELGIUM_0'),
		('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_SPY_NAME_JFD_BELGIUM_1'),
		('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_SPY_NAME_JFD_BELGIUM_2'),
		('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_SPY_NAME_JFD_BELGIUM_3'),
		('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_SPY_NAME_JFD_BELGIUM_4'),
		('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_SPY_NAME_JFD_BELGIUM_5'),
		('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_SPY_NAME_JFD_BELGIUM_6'),
		('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_SPY_NAME_JFD_BELGIUM_7'),
		('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_SPY_NAME_JFD_BELGIUM_8'),
		('CIVILIZATION_JFD_BELGIUM', 	'TXT_KEY_SPY_NAME_JFD_BELGIUM_9');
--==========================================================================================================================	
-- IMPROVEMENTS
--==========================================================================================================================
-- Improvements
--------------------------------	
INSERT INTO Improvements
		(Type,									OutsideBorders, GraphicalOnly,	Description, Civilopedia, ArtDefineTag,	PillageGold, PortraitIndex,	IconAtlas)
SELECT	'IMPROVEMENT_JFD_BELGIAN_PLANTATION',	1,				1,				Description, Civilopedia, ArtDefineTag, PillageGold, PortraitIndex,	IconAtlas
FROM Improvements WHERE Type = 'IMPROVEMENT_PLANTATION';
--------------------------------
-- Improvement_ResourceTypes
--------------------------------
INSERT INTO Improvement_ResourceTypes
		(ImprovementType,						ResourceType)
SELECT	'IMPROVEMENT_JFD_BELGIAN_PLANTATION', 	ResourceType
FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_PLANTATION';
--------------------------------
-- Improvement_ResourceType_Yields
--------------------------------
INSERT INTO Improvement_ResourceType_Yields
		(ImprovementType,						ResourceType, YieldType, Yield)
SELECT	'IMPROVEMENT_JFD_BELGIAN_PLANTATION', 	ResourceType, YieldType, Yield
FROM Improvement_ResourceType_Yields WHERE ImprovementType = 'IMPROVEMENT_PLANTATION';
--------------------------------
-- Improvement_TechYieldChanges
--------------------------------
INSERT INTO Improvement_TechYieldChanges
		(ImprovementType,						TechType, YieldType, Yield)
SELECT	'IMPROVEMENT_JFD_BELGIAN_PLANTATION', 	TechType, YieldType, Yield
FROM Improvement_TechYieldChanges WHERE ImprovementType = 'IMPROVEMENT_PLANTATION';
--------------------------------
-- Belief_ImprovementYieldChanges
--------------------------------
INSERT INTO Belief_ImprovementYieldChanges
		(BeliefType,	ImprovementType,						YieldType, Yield)
SELECT	BeliefType,		'IMPROVEMENT_JFD_BELGIAN_PLANTATION',	YieldType, Yield
FROM Belief_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_PLANTATION';
--==========================================================================================================================
--==========================================================================================================================