--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 					Happiness, EnhancedYieldTech,	TechEnhancedTourism, LandmarksTourismPercent,	BuildingClass, Cost, GoldMaintenance, PrereqTech, Description, 						Civilopedia, 						Help, 									Strategy,								 ArtDefineTag, MinAreaSize, ConquestProb, HurryCostModifier, PortraitIndex, IconAtlas)
SELECT	'BUILDING_JFD_PIAZZA',	Happiness, PrereqTech,			2,					 15,						BuildingClass, Cost, GoldMaintenance, PrereqTech, 'TXT_KEY_BUILDING_JFD_PIAZZA',	'TXT_KEY_CIV5_JFD_PIAZZA_TEXT', 	'TXT_KEY_BUILDING_JFD_PIAZZA_HELP', 	'TXT_KEY_BUILDING_JFD_PIAZZA_STRATEGY',	 ArtDefineTag, MinAreaSize, ConquestProb, HurryCostModifier, 2, 			'JFD_SARDINIA_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_THEATRE';	

UPDATE Buildings
SET TechEnhancedTourism = 0, EnhancedYieldTech = null
WHERE Type = 'BUILDING_JFD_PIAZZA'
AND EXISTS (SELECT * FROM Yields WHERE Type = 'YIELD_TOURISM');
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 			YieldType,			Yield)
VALUES	('BUILDING_JFD_PIAZZA',	'YIELD_CULTURE',	2);

INSERT INTO Building_YieldChanges 	
		(BuildingType, 			YieldType,			Yield)
SELECT	'BUILDING_JFD_PIAZZA',	'YIELD_TOURISM',	2
WHERE EXISTS (SELECT * FROM Yields WHERE Type = 'YIELD_TOURISM');
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 			FlavorType, Flavor)
SELECT	'BUILDING_JFD_PIAZZA',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_THEATRE';

INSERT INTO Building_Flavors 	
		(BuildingType, 			FlavorType,			Flavor)
VALUES	('BUILDING_JFD_PIAZZA',	'FLAVOR_CULTURE',	20);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 			BuildingClassType)
SELECT	'BUILDING_JFD_PIAZZA',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_THEATRE';
---==========================================================================================================================
-- PROMOTIONS
--==========================================================================================================================
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 									Description, 									Help, 												Sound, 				FriendlyLandsModifier,	TradeMissionInfluenceModifier,	TradeMissionGoldModifier,	UpgradeDiscount,	OrderPriority,  CannotBeChosen, PortraitIndex,  IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_BERSAGLIERI',			'TXT_KEY_PROMOTION_JFD_BERSAGLIERI',			'TXT_KEY_PROMOTION_JFD_BERSAGLIERI_HELP',			'AS2D_IF_LEVELUP',	15,						0,								0,							0,					1,				1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_BERSAGLIERI'),
		('PROMOTION_JFD_GARIBALDINO_UPGRADE',	'TXT_KEY_PROMOTION_JFD_GARIBALDINO_UPGRADE',	'TXT_KEY_PROMOTION_JFD_GARIBALDINO_UPGRADE_HELP',	'AS2D_IF_LEVELUP',	0,						0,								0,							0,					1,				0, 				16, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_GARIBALDINO_UPGRADE'),
		('PROMOTION_JFD_GARIBALDINO',			'TXT_KEY_PROMOTION_JFD_GARIBALDINO',			'TXT_KEY_PROMOTION_JFD_GARIBALDINO_HELP',			'AS2D_IF_LEVELUP',	0,						50,								-100,						-50,				0,				1, 				16, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_GARIBALDINO');
--------------------------------
-- UnitPromotions_UnitCombats
--------------------------------	
INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,							UnitCombatType)
VALUES	('PROMOTION_JFD_GARIBALDINO_UPGRADE',	'UNITCOMBAT_GUN');
--==========================================================================================================================
-- UNIT CLASSES
--==========================================================================================================================
-- UnitClasses
------------------------------
INSERT INTO UnitClasses	
		(Type,								Description,						DefaultUnit)
VALUES	('UNITCLASS_JFD_GARIBALDINO',		'TXT_KEY_UNIT_JFD_GARIBALDINO',		'UNIT_JFD_GARIBALDINO');
---==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 						Class, PrereqTech, Combat,	 Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves,	CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 							Strategy, 									Help, 									MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 						UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_BERSAGLIERI', 	Class, PrereqTech, Combat-4, Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_BERSAGLIERI', 'TXT_KEY_CIV5_JFD_BERSAGLIERI_TEXT', 	'TXT_KEY_UNIT_JFD_BERSAGLIERI_STRATEGY', 	'TXT_KEY_UNIT_HELP_JFD_BERSAGLIERI',    MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_JFD_BERSAGLIERI',	0,					'JFD_UNIT_FLAG_BERSAGLIERI_ATLAS',	3, 				'JFD_SARDINIA_ATLAS'
FROM Units WHERE Type = 'UNIT_RIFLEMAN';

INSERT INTO Units 	
		(Type, 					Class,							ShowInPedia, Combat, Cost,	BaseGold,	NumGoldPerEra,	OneShotTourism, OneShotTourismPercentOthers,	Moves, FaithCost,	CombatClass, Domain, 	DefaultUnitAI, 	Description, 						Civilopedia, 							Strategy,									ObsoleteTech, 	GoodyHutUpgradeUnitClass, 	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, UnitArtInfo,						UnitFlagIconOffset,	UnitFlagAtlas,						MoveRate,	PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_GARIBALDINO',	'UNITCLASS_JFD_GARIBALDINO',	0,			 Combat, -1,	150,		50,				5,				10,								Moves, -1,			CombatClass, Domain,	DefaultUnitAI,  'TXT_KEY_UNIT_JFD_GARIBALDINO', 	'TXT_KEY_CIV5_JFD_GARIBALDINO_TEXT', 	'TXT_KEY_UNIT_JFD_GARIBALDINO_STRATEGY', 	ObsoleteTech,	GoodyHutUpgradeUnitClass,	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, 'ART_DEF_UNIT_JFD_GARIBALDINO',    0,					'JFD_UNIT_FLAG_GARIBALDINO_ATLAS',	MoveRate,	4, 				'JFD_SARDINIA_ATLAS'
FROM Units WHERE Type = 'UNIT_JFD_BERSAGLIERI';	
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_BERSAGLIERI', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_RIFLEMAN';

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_GARIBALDINO', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_JFD_BERSAGLIERI';
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_BERSAGLIERI', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_RIFLEMAN';	

INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_GARIBALDINO', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_JFD_BERSAGLIERI';

INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_GARIBALDINO', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MUSICIAN';
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_BERSAGLIERI', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_RIFLEMAN';	

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_GARIBALDINO', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_JFD_BERSAGLIERI';

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_GARIBALDINO', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MUSICIAN';
--------------------------------
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_JFD_BERSAGLIERI',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_RIFLEMAN';	

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_JFD_GARIBALDINO', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_JFD_BERSAGLIERI';
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
VALUES	('UNIT_JFD_BERSAGLIERI', 	'PROMOTION_EXTRA_MOVES_I'),
		('UNIT_JFD_BERSAGLIERI', 	'PROMOTION_JFD_BERSAGLIERI'),
		('UNIT_JFD_GARIBALDINO', 	'PROMOTION_JFD_GARIBALDINO');
		
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_GARIBALDINO', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_JFD_BERSAGLIERI';
--------------------------------
-- Unit_UniqueNames
--------------------------------
INSERT INTO Unit_UniqueNames 
		(UnitType, 					UniqueName)
VALUES	('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_01'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_02'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_03'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_04'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_05'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_06'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_07'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_08'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_09'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_10'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_11'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_12'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_13'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_14'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_15'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_16'),	
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_17'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_18'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_19'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_20'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_21'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_22'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_23'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_24'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_25'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_26'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_27'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_28'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_29'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_30'),
		('UNIT_JFD_GARIBALDINO', 	'TXT_KEY_GREAT_PERSON_JFD_GARIBALDINO_31');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 					Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES	('LEADER_JFD_VICTOR_II', 	'TXT_KEY_LEADER_JFD_VICTOR_II', 'TXT_KEY_LEADER_JFD_VICTOR_II_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_VICTOR_II',	'VictorII_Scene.xml',	8, 						8, 						4, 							6, 			4, 				5, 				7, 						5, 				5, 			6, 			5, 				4, 			4, 			'JFD_SARDINIA_ATLAS', 	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_VICTOR_II', 	'MAJOR_CIV_APPROACH_WAR', 			2),
		('LEADER_JFD_VICTOR_II', 	'MAJOR_CIV_APPROACH_HOSTILE', 		2),
		('LEADER_JFD_VICTOR_II', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
		('LEADER_JFD_VICTOR_II', 	'MAJOR_CIV_APPROACH_GUARDED', 		5),
		('LEADER_JFD_VICTOR_II', 	'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_JFD_VICTOR_II', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_JFD_VICTOR_II', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_VICTOR_II', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
		('LEADER_JFD_VICTOR_II', 	'MINOR_CIV_APPROACH_FRIENDLY', 		3),
		('LEADER_JFD_VICTOR_II', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
		('LEADER_JFD_VICTOR_II', 	'MINOR_CIV_APPROACH_CONQUEST', 		9),
		('LEADER_JFD_VICTOR_II', 	'MINOR_CIV_APPROACH_BULLY', 		2);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 				FlavorType, 						Flavor)
VALUES	('LEADER_JFD_VICTOR_II', 	'FLAVOR_OFFENSE', 					8),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_DEFENSE', 					2),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_CITY_DEFENSE', 				3),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_MILITARY_TRAINING', 		6),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_RECON', 					4),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_RANGED', 					4),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_MOBILE', 					4),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_NAVAL', 					2),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_NAVAL_RECON', 				2),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_NAVAL_GROWTH', 				2),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	2),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_AIR', 						2),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_EXPANSION', 				8),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_GROWTH', 					4),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_INFRASTRUCTURE', 			3),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_PRODUCTION', 				4),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_GOLD', 						9),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_SCIENCE', 					5),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_CULTURE', 					9),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_HAPPINESS', 				6),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_GREAT_PEOPLE', 				8),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_WONDER', 					8),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_RELIGION', 					3),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_DIPLOMACY', 				3),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_WATER_CONNECTION', 			4),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_ESPIONAGE', 				3),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_AIRLIFT', 					2),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_VICTOR_II', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 				TraitType)
VALUES	('LEADER_JFD_VICTOR_II',	'TRAIT_JFD_SARDINIA');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 						Description, 					ShortDescription)
VALUES	('TRAIT_JFD_SARDINIA', 		'TXT_KEY_TRAIT_JFD_SARDINIA', 	'TXT_KEY_TRAIT_JFD_SARDINIA_SHORT');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 							DerivativeCiv,						Description,						ShortDescription,						Adjective,								Civilopedia,						CivilopediaTag,				  DefaultPlayerColor,			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,				PortraitIndex,	AlphaIconAtlas,				SoundtrackTag,  MapImage, 						DawnOfManQuote, 					DawnOfManImage)
SELECT	'CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_TAL_ITALIAN_STATES',	'TXT_KEY_CIV_JFD_SARDINIA_DESC', 	'TXT_KEY_CIV_JFD_SARDINIA_SHORT_DESC',	'TXT_KEY_CIV_JFD_SARDINIA_ADJECTIVE',	'TXT_KEY_CIV5_JFD_SARDINIA_TEXT_1', 'TXT_KEY_CIV5_JFD_SARDINIA',  'PLAYERCOLOR_JFD_SARDINIA',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_SARDINIA_ATLAS',	0,				'JFD_SARDINIA_ALPHA_ATLAS',	'Rome', 		'MapSardiniaPiedmont512.dds',	'TXT_KEY_CIV5_DAWN_SARDINIA_TEXT',	'DOM_VictorEmmanuelII.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_VENICE';

UPDATE Civilizations
SET DerivativeCiv = 'TXT_KEY_JFD_TAL_ITALIAN_STATES'
WHERE Type = 'CIVILIZATION_VENICE';
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
		(CivilizationType,				CityName)
VALUES	('CIVILIZATION_JFD_SARDINIA',   'TXT_KEY_CITY_NAME_JFD_SARDINIA_1'),
		('CIVILIZATION_JFD_SARDINIA',   'TXT_KEY_CITY_NAME_JFD_SARDINIA_2'),
		('CIVILIZATION_JFD_SARDINIA',   'TXT_KEY_CITY_NAME_JFD_SARDINIA_3'),
		('CIVILIZATION_JFD_SARDINIA',   'TXT_KEY_CITY_NAME_JFD_SARDINIA_4'),
		('CIVILIZATION_JFD_SARDINIA',   'TXT_KEY_CITY_NAME_JFD_SARDINIA_5'),
		('CIVILIZATION_JFD_SARDINIA',   'TXT_KEY_CITY_NAME_JFD_SARDINIA_6'),
		('CIVILIZATION_JFD_SARDINIA',   'TXT_KEY_CITY_NAME_JFD_SARDINIA_7'),
		('CIVILIZATION_JFD_SARDINIA',   'TXT_KEY_CITY_NAME_JFD_SARDINIA_8'),
		('CIVILIZATION_JFD_SARDINIA',   'TXT_KEY_CITY_NAME_JFD_SARDINIA_9'),
		('CIVILIZATION_JFD_SARDINIA',   'TXT_KEY_CITY_NAME_JFD_SARDINIA_10'),
		('CIVILIZATION_JFD_SARDINIA',   'TXT_KEY_CITY_NAME_JFD_SARDINIA_11'),
		('CIVILIZATION_JFD_SARDINIA',   'TXT_KEY_CITY_NAME_JFD_SARDINIA_12'),
		('CIVILIZATION_JFD_SARDINIA',   'TXT_KEY_CITY_NAME_JFD_SARDINIA_13'),
		('CIVILIZATION_JFD_SARDINIA',   'TXT_KEY_CITY_NAME_JFD_SARDINIA_14'),
		('CIVILIZATION_JFD_SARDINIA',   'TXT_KEY_CITY_NAME_JFD_SARDINIA_15'),
		('CIVILIZATION_JFD_SARDINIA',   'TXT_KEY_CITY_NAME_JFD_SARDINIA_16'),
		('CIVILIZATION_JFD_SARDINIA',   'TXT_KEY_CITY_NAME_JFD_SARDINIA_17'),
		('CIVILIZATION_JFD_SARDINIA',   'TXT_KEY_CITY_NAME_JFD_SARDINIA_18'),
		('CIVILIZATION_JFD_SARDINIA',   'TXT_KEY_CITY_NAME_JFD_SARDINIA_19'),
		('CIVILIZATION_JFD_SARDINIA',   'TXT_KEY_CITY_NAME_JFD_SARDINIA_20'),
		('CIVILIZATION_JFD_SARDINIA',   'TXT_KEY_CITY_NAME_JFD_SARDINIA_21'),
		('CIVILIZATION_JFD_SARDINIA',   'TXT_KEY_CITY_NAME_JFD_SARDINIA_22'),
		('CIVILIZATION_JFD_SARDINIA',   'TXT_KEY_CITY_NAME_JFD_SARDINIA_23');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 				BuildingClassType)
SELECT	'CIVILIZATION_JFD_SARDINIA', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_VENICE';
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 				TechType)
SELECT	'CIVILIZATION_JFD_SARDINIA', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_VENICE';
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_SARDINIA', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_VENICE';
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_JFD_SARDINIA',	'LEADER_JFD_VICTOR_II');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 				BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_JFD_SARDINIA',	'BUILDINGCLASS_THEATRE',	'BUILDING_JFD_PIAZZA');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_JFD_SARDINIA',	'UNITCLASS_RIFLEMAN',		'UNIT_JFD_BERSAGLIERI');
--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 				ReligionType)
VALUES	('CIVILIZATION_JFD_SARDINIA',	'RELIGION_CHRISTIANITY');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 				SpyName)
VALUES	('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_SPY_NAME_JFD_SARDINIA_0'),
		('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_SPY_NAME_JFD_SARDINIA_1'),
		('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_SPY_NAME_JFD_SARDINIA_2'),
		('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_SPY_NAME_JFD_SARDINIA_3'),
		('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_SPY_NAME_JFD_SARDINIA_4'),
		('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_SPY_NAME_JFD_SARDINIA_5'),
		('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_SPY_NAME_JFD_SARDINIA_6'),
		('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_SPY_NAME_JFD_SARDINIA_7'),
		('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_SPY_NAME_JFD_SARDINIA_8'),
		('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_SPY_NAME_JFD_SARDINIA_9');
--==========================================================================================================================
--==========================================================================================================================