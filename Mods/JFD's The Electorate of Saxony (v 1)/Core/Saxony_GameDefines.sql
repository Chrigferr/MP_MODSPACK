--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 						GreatWorkSlotType, GreatWorkCount, 	BuildingClass, Cost, FaithCost, UnlockedByBelief, GoldMaintenance, PrereqTech,			FreeStartEra, ThemingBonusHelp, Description, 						Civilopedia, 						Help, 									Strategy,								 	ArtDefineTag, MinAreaSize, NeverCapture, HurryCostModifier, PortraitIndex,	IconAtlas)
SELECT	'BUILDING_JFD_KUNSTHAUS',	GreatWorkSlotType, 3, 				BuildingClass, Cost, FaithCost, UnlockedByBelief, GoldMaintenance, 'TECH_ARCHITECTURE',	FreeStartEra, ThemingBonusHelp, 'TXT_KEY_BUILDING_JFD_KUNSTHAUS',	'TXT_KEY_CIV5_JFD_KUNSTHAUS_TEXT',	'TXT_KEY_BUILDING_JFD_KUNSTHAUS_HELP',	'TXT_KEY_BUILDING_JFD_KUNSTHAUS_STRATEGY',	ArtDefineTag, MinAreaSize, NeverCapture, HurryCostModifier, 3, 				'JFD_SAXONY_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_MUSEUM';

-- Building_ClassesNeededInCity
------------------------------	
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
SELECT	'BUILDING_JFD_KUNSTHAUS',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_MUSEUM';
------------------------------
-- Building_YieldChanges
------------------------------	
INSERT INTO Building_YieldChanges 	
		(BuildingType, 				YieldType,	Yield)
SELECT	'BUILDING_JFD_KUNSTHAUS',	YieldType,	Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_MUSEUM';

INSERT INTO Building_YieldChanges 	
		(BuildingType, 			YieldType,			Yield)
VALUES	('BUILDING_JFD_SAXONY',	'YIELD_PRODUCTION',	1);
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_YieldChangesPerPop 	
		(BuildingType, 				YieldType,	Yield)
SELECT	'BUILDING_JFD_KUNSTHAUS',	YieldType,	Yield
FROM Building_YieldChangesPerPop WHERE BuildingType = 'BUILDING_MUSEUM';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,	Flavor)
SELECT	'BUILDING_JFD_KUNSTHAUS',	FlavorType,	Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_MUSEUM';	
------------------------------
-- Building_ThemingBonuses
------------------------------	
INSERT INTO Building_ThemingBonuses 	
		(BuildingType, 				Description, Bonus,	SameEra, MustBeArt, RequiresOwner, AIPriority, RequiresAnyButOwner, MustBeArtifact)
SELECT	'BUILDING_JFD_KUNSTHAUS',	Description, Bonus,	SameEra, MustBeArt, RequiresOwner, AIPriority, RequiresAnyButOwner, MustBeArtifact
FROM Building_ThemingBonuses WHERE BuildingType = 'BUILDING_MUSEUM';
---==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 								Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_CARABINIER_GUARD', 	'TXT_KEY_PROMOTION_JFD_CARABINIER_GUARD',	'TXT_KEY_PROMOTION_JFD_CARABINIER_GUARD_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_CARABINIER_GUARD');
---==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 							Class,	PrereqTech,	Special, Combat, CombatLimit, WorkRate, BaseHurry, HurryMultiplier, CivilianAttackPriority, Cost, Moves, MoveRate, CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 								Strategy, 										Help, 										MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 						UnitFlagAtlas, 						   UnitFlagIconOffset,	PortraitIndex,	IconAtlas)
SELECT	'UNIT_JFD_CARABINIER_GUARD',	Class,	PrereqTech, Special, Combat, CombatLimit, WorkRate, BaseHurry, HurryMultiplier, CivilianAttackPriority, Cost, Moves, MoveRate, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_CARABINIER_GUARD', 'TXT_KEY_CIV5_JFD_CARABINIER_GUARD_TEXT',	'TXT_KEY_UNIT_JFD_CARABINIER_GUARD_STRATEGY',	'TXT_KEY_UNIT_JFD_CARABINIER_GUARD_HELP',	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_JFD_CARABINIER_GUARD',	'JFD_CARABINIER_GUARD_FLAG_ART_ATLAS', 0,					2,				'JFD_SAXONY_ATLAS'
FROM Units WHERE Type = 'UNIT_CAVALRY';
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_CARABINIER_GUARD',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CAVALRY';	
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	'UNIT_JFD_CARABINIER_GUARD',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_CAVALRY';
--------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 						ResourceType, Cost)
SELECT	'UNIT_JFD_CARABINIER_GUARD',	ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_CAVALRY';
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType, Flavor)
SELECT	'UNIT_JFD_CARABINIER_GUARD',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_CAVALRY';
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 						UnitClassType)
SELECT	'UNIT_JFD_CARABINIER_GUARD',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_CAVALRY';
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
SELECT	'UNIT_JFD_CARABINIER_GUARD',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CAVALRY';
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_JFD_CARABINIER_GUARD' AND PromotionType = 'PROMOTION_NO_DEFENSIVE_BONUSES';

INSERT INTO Unit_FreePromotions
		(UnitType,					  PromotionType)
VALUES	('UNIT_JFD_CARABINIER_GUARD', 'PROMOTION_JFD_CARABINIER_GUARD');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 									Description, 								Civilopedia, 										CivilopediaTag, 										ArtDefineTag, 					 VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES	('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'TXT_KEY_LEADER_JFD_FREDERICK_AUGUSTUS_I', 'TXT_KEY_LEADER_JFD_FREDERICK_AUGUSTUS_I_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_FREDERICK_AUGUSTUS_I', 'FrederickAugustus_Scene.xml',	 6, 					 9, 						5, 							6, 			5, 				3, 				3, 						4, 				3, 			3, 			3, 				4, 			4, 			'JFD_SAXONY_ATLAS', 	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 							MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'MAJOR_CIV_APPROACH_WAR', 			3),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'MAJOR_CIV_APPROACH_GUARDED', 		4),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 							MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'MINOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'MINOR_CIV_APPROACH_BULLY', 		3);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 							FlavorType, 						Flavor)
VALUES	('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_OFFENSE', 					4),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_DEFENSE', 					6),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_MILITARY_TRAINING', 		4),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_RECON', 					3),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_RANGED', 					3),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_MOBILE', 					6),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_NAVAL', 					2),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_NAVAL_RECON', 				2),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_NAVAL_GROWTH', 				2),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	2),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_AIR', 						2),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_EXPANSION', 				2),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_GROWTH', 					4),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_INFRASTRUCTURE', 			7),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_PRODUCTION', 				6),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_GOLD', 						6),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_SCIENCE', 					4),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_CULTURE', 					7),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_HAPPINESS', 				3),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_GREAT_PEOPLE', 				7),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_WONDER', 					9),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_RELIGION', 					3),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_DIPLOMACY', 				3),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_WATER_CONNECTION', 			4),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_AIRLIFT', 					2),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_FREDERICK_AUGUSTUS_I', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 							TraitType)
VALUES	('LEADER_JFD_FREDERICK_AUGUSTUS_I',		'TRAIT_JFD_SAXONY');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 					Description, 					ShortDescription)
VALUES	('TRAIT_JFD_SAXONY', 	'TXT_KEY_TRAIT_JFD_SAXONY', 	'TXT_KEY_TRAIT_JFD_SAXONY_SHORT');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 						DerivativeCiv,			Description,					ShortDescription,						Adjective,							Civilopedia,						CivilopediaTag,				DefaultPlayerColor,			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,			PortraitIndex,	AlphaIconAtlas,				SoundtrackTag,  MapImage, 			DawnOfManQuote, 					DawnOfManImage)
SELECT	'CIVILIZATION_JFD_SAXONY',	'CIVILIZATION_GERMANY',	'TXT_KEY_CIV_JFD_SAXONY_DESC', 	'TXT_KEY_CIV_JFD_SAXONY_SHORT_DESC',	'TXT_KEY_CIV_JFD_SAXONY_ADJECTIVE', 'TXT_KEY_CIV5_JFD_SAXONY_TEXT_1', 	'TXT_KEY_CIV5_JFD_SAXONY', 	'PLAYERCOLOR_JFD_SAXONY',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_SAXONY_ATLAS',	0,				'JFD_SAXONY_ALPHA_ATLAS',	'Germany', 		'SaxonyMap512.dds',	'TXT_KEY_CIV5_DAWN_SAXONY_TEXT',	'FrederickAugustusI_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_GERMANY';
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
		(CivilizationType,            CityName)
VALUES	('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_1'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_2'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_3'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_4'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_5'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_6'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_7'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_8'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_9'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_10'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_11'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_12'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_13'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_14'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_15'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_16'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_17'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_18'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_19'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_20'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_21'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_22'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_23'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_24'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_25'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_26'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_27'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_28'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_29'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_30'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_31'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_32'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_33'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_34'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_35'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_36'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_37'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_38'),
		('CIVILIZATION_JFD_SAXONY',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_SAXONY_39');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 			BuildingClassType)
SELECT	'CIVILIZATION_JFD_SAXONY', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_GERMANY';
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 			TechType)
SELECT	'CIVILIZATION_JFD_SAXONY', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_GERMANY';
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 			UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_SAXONY', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_GERMANY';
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 			LeaderheadType)
VALUES	('CIVILIZATION_JFD_SAXONY',	'LEADER_JFD_FREDERICK_AUGUSTUS_I');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 			BuildingClassType, 		BuildingType)
VALUES	('CIVILIZATION_JFD_SAXONY', 'BUILDINGCLASS_MUSEUM',	'BUILDING_JFD_KUNSTHAUS');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 			UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_JFD_SAXONY', 'UNITCLASS_CAVALRY',	'UNIT_JFD_CARABINIER_GUARD');
--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 			ReligionType)
VALUES	('CIVILIZATION_JFD_SAXONY', 'RELIGION_CHRISTIANITY');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 			SpyName)
VALUES	('CIVILIZATION_JFD_SAXONY', 'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_SAXONY_1'),
		('CIVILIZATION_JFD_SAXONY', 'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_SAXONY_2'),
		('CIVILIZATION_JFD_SAXONY', 'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_SAXONY_3'),
		('CIVILIZATION_JFD_SAXONY', 'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_SAXONY_4'),
		('CIVILIZATION_JFD_SAXONY', 'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_SAXONY_5'),
		('CIVILIZATION_JFD_SAXONY', 'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_SAXONY_6'),
		('CIVILIZATION_JFD_SAXONY', 'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_SAXONY_7'),
		('CIVILIZATION_JFD_SAXONY', 'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_SAXONY_8'),
		('CIVILIZATION_JFD_SAXONY', 'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_SAXONY_9'),
		('CIVILIZATION_JFD_SAXONY', 'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_SAXONY_10');
--==========================================================================================================================
--==========================================================================================================================