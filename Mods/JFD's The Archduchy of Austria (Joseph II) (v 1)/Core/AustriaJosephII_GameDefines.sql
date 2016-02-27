--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 				DefaultBuilding, 					Description)
VALUES	('BUILDINGCLASS_JFD_AUSTRIA_JOSEPH_II', 	'BUILDING_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_BUILDING_JFD_AUSTRIA_JOSEPH_II');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 							BuildingClass, Cost, FaithCost, UnlockedByBelief, GoldMaintenance, PrereqTech,		FreeStartEra, SpecialistType,	SpecialistCount, Description, 							Civilopedia, 							Help, 										Strategy,								 		ArtDefineTag, MinAreaSize, NeverCapture, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT	'BUILDING_JFD_STATE_SCHOOL',	BuildingClass, Cost, FaithCost, UnlockedByBelief, GoldMaintenance, 'TECH_ECONOMICS', FreeStartEra, SpecialistType,	SpecialistCount, 'TXT_KEY_BUILDING_JFD_STATE_SCHOOL', 	'TXT_KEY_CIV5_JFD_STATE_SCHOOL_TEXT',	'TXT_KEY_BUILDING_JFD_STATE_SCHOOL_HELP',	'TXT_KEY_BUILDING_JFD_STATE_SCHOOL_STRATEGY',	ArtDefineTag, MinAreaSize, NeverCapture, HurryCostModifier, 3, 				'JFD_AUSTRIA_JOSEPH_II_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_PUBLIC_SCHOOL';

INSERT INTO Buildings 	
		(Type, 									BuildingClass, 							SpecialistType,				SpecialistCount,	GoldenAgeModifier,	Cost,	FaithCost,	GreatWorkCount, PrereqTech, Description, 									Help,												PortraitIndex,	IconAtlas)
VALUES	('BUILDING_JFD_AUSTRIA_JOSEPH_II', 		'BUILDINGCLASS_JFD_AUSTRIA_JOSEPH_II',	null,						0,					10,					-1,		-1,			-1,				null,		'TXT_KEY_BUILDING_JFD_AUSTRIA_JOSEPH_II', 		'TXT_KEY_BUILDING_JFD_AUSTRIA_JOSEPH_II_HELP',		0,				null),
		('BUILDING_JFD_STATE_SCHOOL_ENGINEER', 	'BUILDINGCLASS_JFD_AUSTRIA_JOSEPH_II',	'SPECIALIST_ENGINEER',		1,					0,					-1,		-1,			0,				null,		'TXT_KEY_BUILDING_JFD_STATE_SCHOOL', 			'TXT_KEY_BUILDING_JFD_STATE_SCHOOL_HELP',			3,				'JFD_AUSTRIA_JOSEPH_II_ATLAS'),
		('BUILDING_JFD_STATE_SCHOOL_MERCHANT', 	'BUILDINGCLASS_JFD_AUSTRIA_JOSEPH_II',	'SPECIALIST_MERCHANT',		1,					0,					-1,		-1,			0,				null,		'TXT_KEY_BUILDING_JFD_STATE_SCHOOL', 			'TXT_KEY_BUILDING_JFD_STATE_SCHOOL_HELP',			3,				'JFD_AUSTRIA_JOSEPH_II_ATLAS');
------------------------------	                                                                                                                 				
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
SELECT	'BUILDING_JFD_STATE_SCHOOL',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_PUBLIC_SCHOOL';
------------------------------	                                                                                                                 				
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 					YieldType,		Yield)
SELECT	'BUILDING_JFD_STATE_SCHOOL',	YieldType,		Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_PUBLIC_SCHOOL';
------------------------------	
-- Building_YieldChangesPerPop
------------------------------	
INSERT INTO Building_YieldChangesPerPop 	
		(BuildingType, 					YieldType,		Yield)
SELECT	'BUILDING_JFD_STATE_SCHOOL',	YieldType,		Yield
FROM Building_YieldChangesPerPop WHERE BuildingType = 'BUILDING_PUBLIC_SCHOOL';
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType,		Flavor)
SELECT	'BUILDING_JFD_STATE_SCHOOL',	FlavorType,		Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_PUBLIC_SCHOOL';		
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 									RangedSupportFire,	Description, 									Help, 												Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_GRENADIER', 			0,					'TXT_KEY_PROMOTION_JFD_GRENADIER',				'TXT_KEY_PROMOTION_JFD_GRENADIER_HELP',				'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_GRENADIER'),
		('PROMOTION_JFD_GRENADIER_RANGE_INFO', 	0,					'TXT_KEY_PROMOTION_JFD_GRENADIER_RANGE_INFO',	'TXT_KEY_PROMOTION_JFD_GRENADIER_RANGE_INFO_HELP',	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_GRENADIER_RANGE_INFO'),
		('PROMOTION_JFD_GRENADIER_RANGE',		1,					'TXT_KEY_PROMOTION_JFD_GRENADIER_RANGE',		'TXT_KEY_PROMOTION_JFD_GRENADIER_RANGE_HELP', 		'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_GRENADIER_RANGE');
------------------------------
-- UnitPromotions_UnitClasses
------------------------------	
INSERT INTO UnitPromotions_UnitClasses
		(PromotionType, 			UnitClassType,		  Modifier)
VALUES	('PROMOTION_JFD_GRENADIER', 'UNITCLASS_RIFLEMAN', 15);	
---==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 					Class, PrereqTech, Combat, Cost, FaithCost,	RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 						Strategy, 								Help, 								MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,					 PortraitIndex,  IconAtlas)
SELECT	'UNIT_JFD_GRENADIER',	Class, PrereqTech, Combat, Cost, FaithCost,	RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_GRENADIER',	'TXT_KEY_CIV5_JFD_GRENADIER_TEXT', 	'TXT_KEY_UNIT_JFD_GRENADIER_STRATEGY', 	'TXT_KEY_UNIT_JFD_GRENADIER_HELP',	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_JFD_GRENADIER',	0,					'JFD_GRENADIER_FLAG_ART_ATLAS',	 2, 			 'JFD_AUSTRIA_JOSEPH_II_ATLAS'
FROM Units WHERE Type = 'UNIT_RIFLEMAN';
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_GRENADIER',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_RIFLEMAN';	
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_GRENADIER',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_RIFLEMAN';
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_GRENADIER',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_RIFLEMAN';	
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_GRENADIER',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_RIFLEMAN';
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_JFD_GRENADIER',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_RIFLEMAN';

INSERT INTO Unit_FreePromotions
		(UnitType, 				PromotionType)
VALUES	('UNIT_JFD_GRENADIER',  'PROMOTION_JFD_GRENADIER'),
		('UNIT_JFD_GRENADIER',  'PROMOTION_JFD_GRENADIER_RANGE_INFO');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 					Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES	('LEADER_JFD_JOSEPH_II', 	'TXT_KEY_LEADER_JFD_JOSEPH_II', 'TXT_KEY_LEADER_JFD_JOSEPH_II_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_JOSEPH_II', 	'JosephII_Scene.xml',	5, 						8, 						4, 							5, 			4, 				4, 				4, 						3, 				4, 			3, 			5, 				6, 			8, 			'JFD_AUSTRIA_JOSEPH_II_ATLAS', 	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_JOSEPH_II', 	'MAJOR_CIV_APPROACH_WAR', 			3),
		('LEADER_JFD_JOSEPH_II', 	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
		('LEADER_JFD_JOSEPH_II', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
		('LEADER_JFD_JOSEPH_II', 	'MAJOR_CIV_APPROACH_GUARDED', 		5),
		('LEADER_JFD_JOSEPH_II', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
		('LEADER_JFD_JOSEPH_II', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_JOSEPH_II', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_JOSEPH_II', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_JFD_JOSEPH_II', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_JOSEPH_II', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
		('LEADER_JFD_JOSEPH_II', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
		('LEADER_JFD_JOSEPH_II', 	'MINOR_CIV_APPROACH_BULLY', 		2);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 				FlavorType, 						Flavor)
VALUES	('LEADER_JFD_JOSEPH_II', 	'FLAVOR_OFFENSE', 					5),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_DEFENSE', 					4),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_CITY_DEFENSE', 				3),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_RECON', 					4),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_RANGED', 					4),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_MOBILE', 					3),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_NAVAL', 					3),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_NAVAL_RECON', 				3),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_AIR', 						2),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_EXPANSION', 				5),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_GROWTH', 					3),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_TILE_IMPROVEMENT', 			8),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_INFRASTRUCTURE', 			3),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_PRODUCTION', 				9),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_GOLD', 						4),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_SCIENCE', 					3),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_CULTURE', 					4),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_HAPPINESS', 				9),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_GREAT_PEOPLE', 				8),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_WONDER', 					8),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_RELIGION', 					4),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_DIPLOMACY', 				2),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_WATER_CONNECTION', 			5),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_NUKE', 						3),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_ESPIONAGE', 				2),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_AIRLIFT', 					2),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_JOSEPH_II', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 						TraitType)
VALUES	('LEADER_JFD_JOSEPH_II', 			'TRAIT_JFD_AUSTRIA_JOSEPH_II');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 								Description, 							ShortDescription)
VALUES	('TRAIT_JFD_AUSTRIA_JOSEPH_II', 	'TXT_KEY_TRAIT_JFD_AUSTRIA_JOSEPH_II', 	'TXT_KEY_TRAIT_JFD_AUSTRIA_JOSEPH_II_SHORT');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 									DerivativeCiv,			Description, ShortDescription,	Adjective,										Civilopedia, CivilopediaTag, DefaultPlayerColor,				  ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,						PortraitIndex,	AlphaIconAtlas,							SoundtrackTag,  MapImage, 						DawnOfManQuote, 							DawnOfManImage)
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'CIVILIZATION_AUSTRIA',	Description, ShortDescription,	'TXT_KEY_CIV_JFD_AUSTRIA_JOSEPH_II_ADJECTIVE',  Civilopedia, CivilopediaTag, 'PLAYERCOLOR_JFD_AUSTRIA_JOSEPH_II', ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_AUSTRIA_JOSEPH_II_ATLAS',	0,				'JFD_AUSTRIA_JOSEPH_II_ALPHA_ATLAS',	'Austria', 		'MapAustriaJosephII512.dds',	'TXT_KEY_CIV5_DAWN_AUSTRIA_JOSEPH_II_TEXT',	'DOM_JosephII.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_AUSTRIA';
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II', 	CityName
FROM Civilization_CityNames WHERE CivilizationType = 'CIVILIZATION_AUSTRIA';
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_AUSTRIA';
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_AUSTRIA';
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_AUSTRIA';
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'LEADER_JFD_JOSEPH_II');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 						BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II', 	'BUILDINGCLASS_PUBLIC_SCHOOL',	'BUILDING_JFD_STATE_SCHOOL');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II', 	'UNITCLASS_RIFLEMAN',	'UNIT_JFD_GRENADIER');
--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II', 	'RELIGION_CHRISTIANITY');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II', 	SpyName
FROM Civilization_SpyNames WHERE CivilizationType = 'CIVILIZATION_AUSTRIA';
--==========================================================================================================================
--==========================================================================================================================