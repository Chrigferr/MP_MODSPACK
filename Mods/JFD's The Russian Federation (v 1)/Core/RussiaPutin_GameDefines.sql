--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 		 	DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_JFD_RUSSIA_PUTIN', 		'BUILDING_JFD_RUSSIA_PUTIN', 	'TXT_KEY_BUILDING_JFD_RUSSIA_PUTIN');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 						 				BuildingClass, 						Happiness,	GreatWorkCount, Cost, FaithCost, PrereqTech, Description, 										Help)
VALUES	('BUILDING_JFD_STATE_ASSEMBLY_HAPPINESS', 	'BUILDINGCLASS_JFD_RUSSIA_PUTIN', 	1,			-1, 			-1,   -1, 		 null, 		 'TXT_KEY_BUILDING_JFD_STATE_ASSEMBLY_HAPPINESS', 	'TXT_KEY_BUILDING_JFD_STATE_ASSEMBLY_HAPPINESS_HELP');

INSERT INTO Buildings 	
		(Type, 							Happiness,	BuildingClass, Cost, SpecialistType, SpecialistCount, GoldMaintenance, PrereqTech, Description, 							Civilopedia, 							Help, 										Strategy,								 		ArtDefineTag, MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT	'BUILDING_JFD_STATE_ASSEMBLY',	1,			BuildingClass, Cost, SpecialistType, SpecialistCount, GoldMaintenance, PrereqTech, 'TXT_KEY_BUILDING_JFD_STATE_ASSEMBLY', 	'TXT_KEY_CIV5_JFD_STATE_ASSEMBLY_TEXT', 'TXT_KEY_BUILDING_JFD_STATE_ASSEMBLY_HELP', 'TXT_KEY_BUILDING_JFD_STATE_ASSEMBLY_STRATEGY', ArtDefineTag, MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, 3, 				'JFD_RUSSIA_PUTIN_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_CONSTABLE';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType,	Flavor)
SELECT	'BUILDING_JFD_STATE_ASSEMBLY',	FlavorType,	Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_CONSTABLE';	

INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType,			Flavor)
VALUES	('BUILDING_JFD_STATE_ASSEMBLY',	'FLAVOR_HAPPINESS',	40);

INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType,			Flavor)
VALUES	('BUILDING_JFD_STATE_ASSEMBLY',	'FLAVOR_EXPANSION',	20);

INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType,			Flavor)
VALUES	('BUILDING_JFD_STATE_ASSEMBLY',	'FLAVOR_GROWTH',	15);
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 						CityAttack,	FriendlyLandsModifier,	Description, 						Help, 									Sound, 				CannotBeChosen, FriendlyLandsModifier, 	PortraitIndex,  IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_SPETSNAZ', 	20,			20,						'TXT_KEY_PROMOTION_JFD_SPETSNAZ',	'TXT_KEY_PROMOTION_JFD_SPETSNAZ_HELP', 	'AS2D_IF_LEVELUP', 	1, 				33, 				 	59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_SPETSNAZ');
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
		(Type, 				 PrereqTech, Class, Combat, Cost, Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain, 	DefaultUnitAI, 	Description, 					Civilopedia, 						Help, 								Strategy,								ObsoleteTech, 	GoodyHutUpgradeUnitClass, 	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, UnitArtInfo,					UnitFlagIconOffset,	UnitFlagAtlas,					MoveRate,	PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_SPETSNAZ', PrereqTech, Class, Combat, Cost, Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain,	DefaultUnitAI,  'TXT_KEY_UNIT_JFD_SPETSNAZ', 	'TXT_KEY_CIV5_JFD_SPETSNAZ_TEXT', 	'TXT_KEY_UNIT_JFD_SPETSNAZ_HELP', 	'TXT_KEY_UNIT_JFD_SPETSNAZ_STRATEGY', 	ObsoleteTech,	GoodyHutUpgradeUnitClass,	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, 'ART_DEF_UNIT_JFD_SPETSNAZ',	0,					'JFD_UNIT_FLAG_SPETSNAZ_ATLAS',	MoveRate,	2, 				'JFD_RUSSIA_PUTIN_ATLAS'
FROM Units WHERE Type = 'UNIT_MARINE';	
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_SPETSNAZ', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MARINE';
--------------------------------		
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_SPETSNAZ', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MARINE';
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_SPETSNAZ', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_MARINE';
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_SPETSNAZ', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MARINE';
--------------------------------	
-- Unit_FreePromotions
--------------------------------		
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_JFD_SPETSNAZ', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MARINE';

INSERT INTO Unit_FreePromotions
		(UnitType, 				PromotionType)
VALUES	('UNIT_JFD_SPETSNAZ', 	'PROMOTION_JFD_SPETSNAZ');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 					Description, 						Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES	('LEADER_JFD_PUTIN', 	'TXT_KEY_LEADER_JFD_PUTIN', 		'TXT_KEY_LEADER_JFD_PUTIN_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_PUTIN', 	'Putin_Scene.xml',	9, 						4, 						3, 							9, 			4, 				6, 				4, 						4, 				4, 			3, 			4, 				4, 			4, 			'JFD_RUSSIA_PUTIN_ATLAS', 	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_PUTIN', 	'MAJOR_CIV_APPROACH_WAR', 			5),
		('LEADER_JFD_PUTIN', 	'MAJOR_CIV_APPROACH_HOSTILE', 		5),
		('LEADER_JFD_PUTIN', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
		('LEADER_JFD_PUTIN', 	'MAJOR_CIV_APPROACH_GUARDED', 		8),
		('LEADER_JFD_PUTIN', 	'MAJOR_CIV_APPROACH_AFRAID', 		2),
		('LEADER_JFD_PUTIN', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
		('LEADER_JFD_PUTIN', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		7);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_PUTIN', 	'MINOR_CIV_APPROACH_IGNORE', 		3),
		('LEADER_JFD_PUTIN', 	'MINOR_CIV_APPROACH_FRIENDLY', 		2),
		('LEADER_JFD_PUTIN', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
		('LEADER_JFD_PUTIN', 	'MINOR_CIV_APPROACH_CONQUEST', 		8),
		('LEADER_JFD_PUTIN', 	'MINOR_CIV_APPROACH_BULLY', 		7);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 			FlavorType, 						Flavor)
VALUES	('LEADER_JFD_PUTIN', 	'FLAVOR_OFFENSE', 					7),
		('LEADER_JFD_PUTIN', 	'FLAVOR_DEFENSE', 					4),
		('LEADER_JFD_PUTIN', 	'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_JFD_PUTIN', 	'FLAVOR_MILITARY_TRAINING', 		7),
		('LEADER_JFD_PUTIN', 	'FLAVOR_RECON', 					6),
		('LEADER_JFD_PUTIN', 	'FLAVOR_RANGED', 					3),
		('LEADER_JFD_PUTIN', 	'FLAVOR_MOBILE', 					4),
		('LEADER_JFD_PUTIN', 	'FLAVOR_NAVAL', 					3),
		('LEADER_JFD_PUTIN', 	'FLAVOR_NAVAL_RECON', 				4),
		('LEADER_JFD_PUTIN', 	'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_JFD_PUTIN', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_JFD_PUTIN', 	'FLAVOR_AIR', 						6),
		('LEADER_JFD_PUTIN', 	'FLAVOR_EXPANSION', 				9),
		('LEADER_JFD_PUTIN', 	'FLAVOR_GROWTH', 					5),
		('LEADER_JFD_PUTIN', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
		('LEADER_JFD_PUTIN', 	'FLAVOR_INFRASTRUCTURE', 			6),
		('LEADER_JFD_PUTIN', 	'FLAVOR_PRODUCTION', 				6),
		('LEADER_JFD_PUTIN', 	'FLAVOR_GOLD', 						7),
		('LEADER_JFD_PUTIN', 	'FLAVOR_SCIENCE', 					5),
		('LEADER_JFD_PUTIN', 	'FLAVOR_CULTURE', 					4),
		('LEADER_JFD_PUTIN', 	'FLAVOR_HAPPINESS', 				4),
		('LEADER_JFD_PUTIN', 	'FLAVOR_GREAT_PEOPLE', 				3),
		('LEADER_JFD_PUTIN', 	'FLAVOR_WONDER', 					3),
		('LEADER_JFD_PUTIN', 	'FLAVOR_RELIGION', 					7),
		('LEADER_JFD_PUTIN', 	'FLAVOR_DIPLOMACY', 				2),
		('LEADER_JFD_PUTIN', 	'FLAVOR_SPACESHIP', 				4),
		('LEADER_JFD_PUTIN', 	'FLAVOR_WATER_CONNECTION', 			3),
		('LEADER_JFD_PUTIN', 	'FLAVOR_NUKE', 						3),
		('LEADER_JFD_PUTIN', 	'FLAVOR_USE_NUKE', 					3),
		('LEADER_JFD_PUTIN', 	'FLAVOR_ESPIONAGE', 				9),
		('LEADER_JFD_PUTIN', 	'FLAVOR_AIRLIFT', 					2),
		('LEADER_JFD_PUTIN', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_PUTIN', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_PUTIN', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_PUTIN', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_PUTIN', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_PUTIN', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 			TraitType)
VALUES	('LEADER_JFD_PUTIN', 	'TRAIT_JFD_RUSSIA_PUTIN');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 						Description, 						ShortDescription)
VALUES	('TRAIT_JFD_RUSSIA_PUTIN', 	'TXT_KEY_TRAIT_JFD_RUSSIA_PUTIN', 	'TXT_KEY_TRAIT_JFD_RUSSIA_PUTIN_SHORT');	
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 								DerivativeCiv,			Description, ShortDescription, 	Adjective, 									Civilopedia, CivilopediaTag, DefaultPlayerColor,			 ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 				 SoundtrackTag, 	MapImage, 					DawnOfManQuote, 						DawnOfManImage)
SELECT	'CIVILIZATION_JFD_RUSSIA_PUTIN', 	'CIVILIZATION_RUSSIA',	Description, ShortDescription, 	'TXT_KEY_CIV_JFD_RUSSIA_PUTIN_ADJECTIVE', 	Civilopedia, CivilopediaTag, 'PLAYERCOLOR_JFD_RUSSIA_PUTIN', ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_RUSSIA_PUTIN_ATLAS', 	0, 				'JFD_RUSSIA_PUTIN_ALPHA_ATLAS',  'Russia', 			'MapRussiaPutin512.dds',	'TXT_KEY_CIV5_DAWN_RUSSIA_PUTIN_TEXT',	'DOM_Putin.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_RUSSIA';
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_1'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_2'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_3'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_4'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_5'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_6'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_7'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_8'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_9'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_10'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_11'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_12'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_13'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_14'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_15'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_16'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_17'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_18'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_19'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_20'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_21'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_22'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_23'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_24'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_25'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_26'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_27'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_28'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_29'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_30'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_31'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_32'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_33'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_34'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_35'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_36'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_37'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_PUTIN_38');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_JFD_RUSSIA_PUTIN', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_JFD_RUSSIA_PUTIN', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_RUSSIA_PUTIN', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_JFD_RUSSIA_PUTIN', 	'LEADER_JFD_PUTIN');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 		UnitType)
VALUES	('CIVILIZATION_JFD_RUSSIA_PUTIN', 	'UNITCLASS_MARINE', 'UNIT_JFD_SPETSNAZ');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 					BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_JFD_RUSSIA_PUTIN', 	'BUILDINGCLASS_CONSTABLE', 	'BUILDING_JFD_STATE_ASSEMBLY');
--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 					ReligionType)
SELECT	'CIVILIZATION_JFD_RUSSIA_PUTIN', 	ReligionType
FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_JFD_RUSSIA_PUTIN', 	'TXT_KEY_SPY_NAME_JFD_RUSSIA_PUTIN_1'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 	'TXT_KEY_SPY_NAME_JFD_RUSSIA_PUTIN_2'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 	'TXT_KEY_SPY_NAME_JFD_RUSSIA_PUTIN_3'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 	'TXT_KEY_SPY_NAME_JFD_RUSSIA_PUTIN_4'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 	'TXT_KEY_SPY_NAME_JFD_RUSSIA_PUTIN_5'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 	'TXT_KEY_SPY_NAME_JFD_RUSSIA_PUTIN_6'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 	'TXT_KEY_SPY_NAME_JFD_RUSSIA_PUTIN_7'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 	'TXT_KEY_SPY_NAME_JFD_RUSSIA_PUTIN_8'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 	'TXT_KEY_SPY_NAME_JFD_RUSSIA_PUTIN_9'),
		('CIVILIZATION_JFD_RUSSIA_PUTIN', 	'TXT_KEY_SPY_NAME_JFD_RUSSIA_PUTIN_10');
--==========================================================================================================================
--==========================================================================================================================