--=======================================================================================================================
-- BUILDING CLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 		 DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_JFD_GREAT_BRITAIN', 'BUILDING_JFD_GREAT_BRITAIN',	'TXT_KEY_BUILDING_JFD_GREAT_BRITAIN');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------		
INSERT INTO Buildings 	
		(Type, 						 		BuildingClass, 						GreatWorkCount, Cost,	FaithCost,	PrereqTech,	NeverCapture,	Description, 								Help,											IconAtlas,					PortraitIndex)
VALUES	('BUILDING_JFD_GREAT_BRITAIN', 		'BUILDINGCLASS_JFD_GREAT_BRITAIN', -1, 				-1,		-1, 		null,		1,				'TXT_KEY_BUILDING_JFD_GREAT_BRITAIN', 		'TXT_KEY_BUILDING_JFD_GREAT_BRITAIN_HELP',		null,						0),
		('BUILDING_JFD_REDCOAT', 			'BUILDINGCLASS_JFD_GREAT_BRITAIN', -1, 				-1,		-1, 		null,		1,				'TXT_KEY_BUILDING_JFD_REDCOAT', 			'TXT_KEY_BUILDING_JFD_REDCOAT_HELP',			'JFD_GREAT_BRITAIN_ATLAS',  3);
------------------------------								
-- Building_YieldModifiers																																	
------------------------------		
INSERT INTO Building_YieldModifiers
		(BuildingType, 						YieldType, 			Yield)
VALUES	('BUILDING_JFD_GREAT_BRITAIN', 		'YIELD_SCIENCE',	1),
		('BUILDING_JFD_REDCOAT', 			'YIELD_PRODUCTION',	1);
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 									DefenseMod,	LostWithUpgrade,	Description, 								Help, 												Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_REDCOAT', 				0,			1,					'TXT_KEY_PROMOTION_JFD_REDCOAT',			'TXT_KEY_PROMOTION_JFD_REDCOAT_HELP',				'AS2D_IF_LEVELUP', 	1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_REDCOAT'),
		('PROMOTION_JFD_FIRST_RATE', 			0,			0,					'TXT_KEY_PROMOTION_JFD_FIRST_RATE',			'TXT_KEY_PROMOTION_JFD_FIRST_RATE_HELP',			'AS2D_IF_LEVELUP', 	1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_FIRST_RATE'),
		('PROMOTION_JFD_FIRST_RATE_DEFENSE', 	20,			0,					'TXT_KEY_PROMOTION_JFD_FIRST_RATE_DEFENSE',	'TXT_KEY_PROMOTION_JFD_FIRST_RATE_DEFENSE_HELP',	'AS2D_IF_LEVELUP', 	1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_FIRST_RATE_DEFENSE');
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
		(Type, 					Class, PrereqTech, RangedCombat,	Range, Special, Combat,		Cost,	 Moves,		CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 						Strategy, 								Help, 								 Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 								UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,					MoveRate)
SELECT	'UNIT_JFD_FIRST_RATE',	Class, PrereqTech, RangedCombat+5,	Range, Special, Combat+3,	Cost+30, Moves-1,	CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_FIRST_RATE',	'TXT_KEY_CIV5_JFD_FIRST_RATE_TEXT', 'TXT_KEY_UNIT_JFD_FIRST_RATE_STRATEGY',	'TXT_KEY_UNIT_HELP_JFD_FIRST_RATE',  Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_U_ENGLISH_SHIPOFTHELINE',	52,					UnitFlagAtlas,	4, 				'JFD_GREAT_BRITAIN_ATLAS',	MoveRate
FROM Units WHERE Type = 'UNIT_FRIGATE';

INSERT INTO Units 	
		(Type, 					Class, PrereqTech, Combat, Cost, FaithCost,	RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 				Civilopedia, 						Strategy, 								Help, 								MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_REDCOAT', 	Class, PrereqTech, Combat, Cost, FaithCost,	RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_REDCOAT', 'TXT_KEY_CIV5_JFD_REDCOAT_TEXT', 	'TXT_KEY_UNIT_JFD_REDCOAT_STRATEGY', 	'TXT_KEY_UNIT_HELP_JFD_REDCOAT',	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_JFD_REDCOAT',	0,					'JFD_UNIT_FLAG_REDCOAT_ATLAS',	3, 				'JFD_GREAT_BRITAIN_ATLAS'
FROM Units WHERE Type = 'UNIT_RIFLEMAN';
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_FIRST_RATE', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_FRIGATE';	

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_REDCOAT', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_RIFLEMAN';
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_FIRST_RATE',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_FRIGATE';

INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_REDCOAT', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_RIFLEMAN';	
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_FIRST_RATE',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_FRIGATE';	
	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_REDCOAT',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_RIFLEMAN';	
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_FIRST_RATE', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_FRIGATE';

INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_REDCOAT', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_RIFLEMAN';	
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_JFD_FIRST_RATE', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_FRIGATE';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_JFD_REDCOAT', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_RIFLEMAN';

INSERT INTO Unit_FreePromotions
		(UnitType, 					PromotionType)
VALUES	('UNIT_JFD_FIRST_RATE', 	'PROMOTION_EXTRA_SIGHT_I'),
		('UNIT_JFD_FIRST_RATE', 	'PROMOTION_JFD_FIRST_RATE'),
		('UNIT_JFD_REDCOAT', 		'PROMOTION_JFD_REDCOAT'),
		('UNIT_JFD_REDCOAT', 		'PROMOTION_IGNORE_TERRAIN_COST'),
		('UNIT_JFD_REDCOAT', 		'PROMOTION_RIVAL_TERRITORY');
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------	
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 				ResourceType, Cost)
SELECT	'UNIT_JFD_FIRST_RATE', 	ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_FRIGATE';
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 					Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES	('LEADER_JFD_VICTORIA', 	'TXT_KEY_LEADER_JFD_VICTORIA',	'TXT_KEY_LEADER_JFD_VICTORIA_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_VICTORIA', 	'Victoria_Scene.xml',	8, 						3, 						4, 							7, 			7, 				8, 				5, 						5, 				4, 			6, 			4, 				2, 			1, 			'JFD_GREAT_BRITAIN_ATLAS', 1);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_VICTORIA', 	'MAJOR_CIV_APPROACH_WAR', 			5),
		('LEADER_JFD_VICTORIA', 	'MAJOR_CIV_APPROACH_HOSTILE', 		2),
		('LEADER_JFD_VICTORIA', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
		('LEADER_JFD_VICTORIA', 	'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_JFD_VICTORIA', 	'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_JFD_VICTORIA', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
		('LEADER_JFD_VICTORIA', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		8);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------		
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_VICTORIA', 	'MINOR_CIV_APPROACH_IGNORE', 		6),
		('LEADER_JFD_VICTORIA', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_JFD_VICTORIA', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	3),
		('LEADER_JFD_VICTORIA', 	'MINOR_CIV_APPROACH_CONQUEST', 		3),
		('LEADER_JFD_VICTORIA', 	'MINOR_CIV_APPROACH_BULLY', 		2);
--------------------------------	
-- Leader_Flavors
--------------------------------						
UPDATE Leader_Flavors
SET Flavor = 8
WHERE LeaderType = 'LEADER_ELIZABETH' AND FlavorType IN ('FLAVOR_HAPPINESS');

INSERT INTO Leader_Flavors 
		(LeaderType, 				FlavorType, 						Flavor)
VALUES	('LEADER_JFD_VICTORIA', 	'FLAVOR_OFFENSE', 					3),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_DEFENSE', 					6),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_CITY_DEFENSE', 				6),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_MILITARY_TRAINING', 		6),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_RECON', 					8),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_RANGED', 					6),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_MOBILE', 					6),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_NAVAL', 					9),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_NAVAL_RECON', 				8),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_NAVAL_GROWTH', 				8),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	8),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_AIR', 						4),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_EXPANSION', 				10),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_GROWTH', 					6),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_INFRASTRUCTURE', 			8),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_PRODUCTION', 				8),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_GOLD', 						9),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_SCIENCE', 					8),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_CULTURE', 					4),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_HAPPINESS', 				2),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_GREAT_PEOPLE', 				3),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_WONDER', 					3),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_RELIGION', 					4),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_DIPLOMACY', 				3),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_WATER_CONNECTION', 			2),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_AIRLIFT', 					2),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_VICTORIA', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 				TraitType)
VALUES	('LEADER_JFD_VICTORIA', 	'TRAIT_JFD_GREAT_BRITAIN');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 						Description, 						ShortDescription)
VALUES	('TRAIT_JFD_GREAT_BRITAIN', 'TXT_KEY_TRAIT_JFD_GREAT_BRITAIN',	'TXT_KEY_TRAIT_JFD_GREAT_BRITAIN_SHORT');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations
		(Type, 								Description, 							ShortDescription, 								Adjective, 									Civilopedia, CivilopediaTag, DefaultPlayerColor, 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 			PortraitIndex, 	AlphaIconAtlas,		SoundtrackTag, 	MapImage, 					DawnOfManQuote, 					DawnOfManImage)
SELECT	'CIVILIZATION_JFD_GREAT_BRITAIN',	'TXT_KEY_CIV_JFD_GREAT_BRITAIN_DESC',	'TXT_KEY_CIV_JFD_GREAT_BRITAIN_SHORT_DESC',		'TXT_KEY_CIV_JFD_GREAT_BRITAIN_ADJECTIVE',	Civilopedia, CivilopediaTag, 'PLAYERCOLOR_ENGLAND',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'CIV_COLOR_ATLAS', 	6, 				'CIV_ALPHA_ATLAS',	'England', 		'MapGreatBritain512.dds', 	'TXT_KEY_CIV_JFD_VICTORIA_DAWN', 	'DOM_Victoria.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_ENGLAND';

UPDATE Civilizations
SET	DefaultPlayerColor = 'PLAYERCOLOR_JFD_ENGLAND',	IconAtlas = 'JFD_GREAT_BRITAIN_ATLAS', PortraitIndex = 0, AlphaIconAtlas = 'JFD_GREAT_BRITAIN_ALPHA_ATLAS' 
WHERE Type = 'CIVILIZATION_ENGLAND';
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
		(CivilizationType, 					CityName)
VALUES	('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_LONDON'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_1'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_2'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_3'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_4'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_5'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_6'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_7'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_8'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_9'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_10'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_11'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_12'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_13'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_14'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_15'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_16'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_17'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_18'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_19'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_20'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_21'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_22'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_23'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_24'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_25'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_26'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_27'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_28'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_29'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_30'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_31'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_GREAT_BRITAIN_32');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------	
INSERT INTO Civilization_FreeBuildingClasses
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_JFD_GREAT_BRITAIN',	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
--------------------------------	
-- Civilization_FreeTechs
--------------------------------	
INSERT INTO Civilization_FreeTechs
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_JFD_GREAT_BRITAIN',	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
--------------------------------	
-- Civilization_FreeUnits
--------------------------------	
INSERT INTO Civilization_FreeUnits
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_GREAT_BRITAIN',	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
--------------------------------	
-- Civilization_Religions
--------------------------------	
INSERT INTO Civilization_Religions
		(CivilizationType, 					ReligionType)
SELECT	'CIVILIZATION_JFD_GREAT_BRITAIN',	ReligionType
FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
--------------------------------	
-- Civilization_Leaders
--------------------------------	
INSERT INTO Civilization_Leaders
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_JFD_GREAT_BRITAIN',	'LEADER_JFD_VICTORIA');
--------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------	
INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, 					UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_JFD_GREAT_BRITAIN', 	'UNITCLASS_FRIGATE', 	'UNIT_JFD_FIRST_RATE'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 	'UNITCLASS_RIFLEMAN', 	'UNIT_JFD_REDCOAT');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_JFD_GREAT_BRITAIN', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_GREAT_BRITAIN_0'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_GREAT_BRITAIN_1'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_GREAT_BRITAIN_2'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_GREAT_BRITAIN_3'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_GREAT_BRITAIN_4'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_GREAT_BRITAIN_5'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_GREAT_BRITAIN_6'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_GREAT_BRITAIN_7'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_GREAT_BRITAIN_8'),
		('CIVILIZATION_JFD_GREAT_BRITAIN', 	'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_GREAT_BRITAIN_9');
--------------------------------	
-- Civilization_Start_Along_Ocean
--------------------------------		
INSERT INTO Civilization_Start_Along_Ocean 
		(CivilizationType, 					StartAlongOcean)
SELECT	'CIVILIZATION_JFD_GREAT_BRITAIN',	StartAlongOcean
FROM Civilization_Start_Along_Ocean WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
--==========================================================================================================================
--==========================================================================================================================