--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================		
-- Buildings
------------------------------	
INSERT INTO Buildings 
		(Type, 					 BuildingClass, Cost, FaithCost, UnlockedByBelief, GoldMaintenance, FreeStartEra, PrereqTech,		 Help, 									Description,					Civilopedia, 					 Strategy, 								 ArtDefineTag, MinAreaSize, HurryCostModifier,	IconAtlas,				 ConquestProb, PortraitIndex)
SELECT	'BUILDING_JFD_KASERNE',  BuildingClass, Cost, FaithCost, UnlockedByBelief, GoldMaintenance, FreeStartEra, 'TECH_METALLURGY', 'TXT_KEY_BUILDING_HELP_JFD_KASERNE',	'TXT_KEY_BUILDING_JFD_KASERNE',	'TXT_KEY_CIV5_JFD_KASERNE_TEXT', 'TXT_KEY_BUILDING_JFD_KASERNE_STRATEGY', ArtDefineTag, MinAreaSize, HurryCostModifier, 'JFD_SWITZERLAND_ATLAS', ConquestProb, 2
FROM Buildings WHERE Type = 'BUILDING_MILITARY_ACADEMY';
------------------------------	
-- Building_ClassesNeededInCity
------------------------------				
INSERT INTO Building_ClassesNeededInCity 
		(BuildingType, 				BuildingClassType)
SELECT	'BUILDING_JFD_KASERNE', 	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_MILITARY_ACADEMY';	
------------------------------	
-- Building_PrereqBuildingClasses
------------------------------				
INSERT INTO Building_PrereqBuildingClasses 
		(BuildingType, 				BuildingClassType, NumBuildingNeeded)
SELECT	'BUILDING_JFD_KASERNE', 	BuildingClassType, NumBuildingNeeded
FROM Building_PrereqBuildingClasses WHERE BuildingType = 'BUILDING_MILITARY_ACADEMY';	
------------------------------	
-- Building_DomainFreeExperiences
------------------------------			
INSERT INTO Building_DomainFreeExperiences 
		(BuildingType, 				DomainType, Experience)
SELECT	('BUILDING_JFD_KASERNE'), 	DomainType, Experience
FROM Building_DomainFreeExperiences WHERE BuildingType = 'BUILDING_MILITARY_ACADEMY';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, Flavor)
SELECT	('BUILDING_JFD_KASERNE'), 	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_MILITARY_ACADEMY';	

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 	Flavor)
VALUES	('BUILDING_JFD_KASERNE', 	'FLAVOR_GOLD',  10);	
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 								Description, 								Help, 											Sound, 				CannotBeChosen, 	AdjacentTileHealChange, FriendlyLandsModifier,	IgnoreZOC,	PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_COMBAT_MEDIC', 		'TXT_KEY_PROMOTION_JFD_COMBAT_MEDIC',		'TXT_KEY_PROMOTION_JFD_COMBAT_MEDIC_HELP', 		'AS2D_IF_LEVELUP', 	1, 					10, 					0,						0,			59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_COMBAT_MEDIC'),
		('PROMOTION_JFD_COMBAT_MEDIC_ZOC', 	'TXT_KEY_PROMOTION_JFD_COMBAT_MEDIC_ZOC', 	'TXT_KEY_PROMOTION_JFD_COMBAT_MEDIC_ZOC_HELP', 	'AS2D_IF_LEVELUP', 	1, 					0, 						0,						1,			59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_COMBAT_MEDIC_ZOC'),
		('PROMOTION_JFD_KASERNE', 			'TXT_KEY_PROMOTION_JFD_KASERNE',			'TXT_KEY_PROMOTION_JFD_KASERNE_HELP', 			'AS2D_IF_LEVELUP', 	1, 					0, 						20,						0,			59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_KASERNE');
------------------------------
-- UnitPromotions_UnitCombats
------------------------------
INSERT INTO UnitPromotions_UnitCombats 
		(PromotionType,				UnitCombatType)
SELECT	'PROMOTION_JFD_KASERNE',	Type
FROM UnitCombatInfos;
--==========================================================================================================================	
-- UNIT CLASSES
--==========================================================================================================================	
-- UnitClasses
------------------------------
INSERT INTO UnitClasses 
		(Type)
VALUES	('UNITCLASS_JFD_MEDIC');
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================		
-- UnitClasses
------------------------------
INSERT INTO Units 	
		(Class, 					Type, 						PrereqTech,			Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Combat, Moves,	CombatClass,		Domain,			DefaultUnitAI,		Description, 						Help,									Civilopedia,							Strategy,									MilitarySupport,	MilitaryProduction, Conscription,	AdvancedStartCost,	UnitArtInfoEraVariation,	UnitArtInfo, 						UnitFlagIconOffset,		ShowInPedia, UnitFlagAtlas,							PortraitIndex,	IconAtlas, 					MoveRate)
VALUES	('UNITCLASS_JFD_MEDIC',		'UNIT_JFD_COMBAT_MEDIC', 	'TECH_BIOLOGY',		240,	480,		1,								28,		2,		'UNITCOMBAT_GUN',	'DOMAIN_LAND',	'UNITAI_GENERAL',	'TXT_KEY_UNIT_JFD_COMBAT_MEDIC',	'TXT_KEY_UNIT_JFD_COMBAT_MEDIC_HELP',	'TXT_KEY_CIV5_JFD_COMBAT_MEDIC_TEXT',	'TXT_KEY_UNIT_JFD_COMBAT_MEDIC_STRATEGY',	1,					1,					5,				-1,					1,							'ART_DEF_UNIT_JFD_COMBAT_MEDIC',	0,						1,			 'JFD_UNIT_FLAG_COMBAT_MEDIC_ATLAS',	3, 				'JFD_SWITZERLAND_ATLAS',	'GREAT_PERSON');
------------------------------	
-- UnitGameplay2DScripts
------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_COMBAT_MEDIC', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_RIFLEMAN');	
------------------------------	
-- Unit_AITypes
------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_COMBAT_MEDIC', 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GENERAL');	
------------------------------	
-- Unit_Flavors
------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_COMBAT_MEDIC', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GENERAL';	
------------------------------	
-- Unit_FreePromotions
------------------------------		
INSERT INTO Unit_FreePromotions 
		(UnitType, 					PromotionType)
VALUES	('UNIT_JFD_COMBAT_MEDIC', 	'PROMOTION_JFD_COMBAT_MEDIC'),
		('UNIT_JFD_COMBAT_MEDIC', 	'PROMOTION_JFD_COMBAT_MEDIC_ZOC'),
		('UNIT_JFD_COMBAT_MEDIC', 	'PROMOTION_MARCH'),
		('UNIT_JFD_COMBAT_MEDIC', 	'PROMOTION_ONLY_DEFENSIVE'),
		('UNIT_JFD_COMBAT_MEDIC', 	'PROMOTION_SIGHT_PENALTY');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 					Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES	('LEADER_JFD_DUFOUR', 	'TXT_KEY_LEADER_JFD_DUFOUR', 	'TXT_KEY_LEADER_JFD_DUFOUR_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_DUFOUR', 	'Dufour_Scene.xml', 2, 						3, 						2, 							5, 			8, 				0, 				0, 						0, 				6, 			4, 			4, 				1, 			1, 			'JFD_SWITZERLAND_ATLAS', 	1);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_DUFOUR', 	'MAJOR_CIV_APPROACH_WAR', 			2),
		('LEADER_JFD_DUFOUR', 	'MAJOR_CIV_APPROACH_HOSTILE', 		2),
		('LEADER_JFD_DUFOUR', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
		('LEADER_JFD_DUFOUR', 	'MAJOR_CIV_APPROACH_GUARDED', 		6),
		('LEADER_JFD_DUFOUR', 	'MAJOR_CIV_APPROACH_AFRAID', 		2),
		('LEADER_JFD_DUFOUR', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
		('LEADER_JFD_DUFOUR', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		10);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_DUFOUR', 	'MINOR_CIV_APPROACH_IGNORE', 		9),
		('LEADER_JFD_DUFOUR', 	'MINOR_CIV_APPROACH_FRIENDLY', 		0),
		('LEADER_JFD_DUFOUR', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	0),
		('LEADER_JFD_DUFOUR', 	'MINOR_CIV_APPROACH_CONQUEST', 		0),
		('LEADER_JFD_DUFOUR', 	'MINOR_CIV_APPROACH_BULLY', 		0);
--------------------------------	
-- Leader_Flavors
--------------------------------						
INSERT INTO Leader_Flavors 
		(LeaderType, 			FlavorType, 						Flavor)
VALUES	('LEADER_JFD_DUFOUR', 	'FLAVOR_OFFENSE', 					3),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_DEFENSE', 					4),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_MILITARY_TRAINING', 		7),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_RECON', 					7),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_RANGED', 					4),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_MOBILE', 					4),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_NAVAL', 					3),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_NAVAL_RECON', 				3),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_AIR', 						4),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_EXPANSION', 				5),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_GROWTH', 					6),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_TILE_IMPROVEMENT', 			6),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_PRODUCTION', 				4),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_GOLD', 						9),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_SCIENCE', 					7),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_CULTURE', 					6),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_HAPPINESS', 				7),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_GREAT_PEOPLE', 				7),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_WONDER', 					3),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_RELIGION', 					4),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_DIPLOMACY', 				3),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_SPACESHIP', 				3),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_WATER_CONNECTION', 			5),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_NUKE', 						1),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_USE_NUKE', 					1),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_ESPIONAGE', 				9),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_AIRLIFT', 					1),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_DUFOUR', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 			TraitType)
VALUES	('LEADER_JFD_DUFOUR', 	'TRAIT_JFD_SWITZERLAND');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 						Description, 						ShortDescription)
VALUES	('TRAIT_JFD_SWITZERLAND', 	'TXT_KEY_TRAIT_JFD_SWITZERLAND', 	'TXT_KEY_TRAIT_JFD_SWITZERLAND_SHORT');
--==========================================================================================================================	
-- MINOR CIVILIZATIONS
--==========================================================================================================================	
-- MinorCivilizations
--------------------------------			
UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_JFD_AVIGNON_DESC', ShortDescription = 'TXT_KEY_CITYSTATE_JFD_AVIGNON_SHORT_DESC', Adjective = 'TXT_KEY_CITYSTATE_JFD_AVIGNON_ADJECTIVE', Civilopedia = 'TXT_KEY_CIV5_JFD_AVIGNON_TEXT_1'
WHERE Type = 'MINOR_CIV_GENEVA';

UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_JFD_LUBECK_DESC', ShortDescription = 'TXT_KEY_CITYSTATE_JFD_LUBECK_SHORT_DESC', Adjective = 'TXT_KEY_CITYSTATE_JFD_LUBECK_ADJECTIVE', Civilopedia = 'TXT_KEY_CIV5_JFD_LUBECK_TEXT_1'
WHERE Type = 'MINOR_CIV_ZURICH';
--------------------------------	
-- MinorCivilization_CityNames
--------------------------------		
UPDATE MinorCivilization_CityNames
SET CityName = 'TXT_KEY_CITYSTATE_JFD_AVIGNON_DESC'
WHERE MinorCivType = 'MINOR_CIV_GENEVA';

UPDATE MinorCivilization_CityNames
SET CityName = 'TXT_KEY_CITYSTATE_JFD_LUBECK_DESC'
WHERE MinorCivType = 'MINOR_CIV_ZURICH';
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 							Description, 						ShortDescription, 							Adjective, 									Civilopedia, 							CivilopediaTag, 				 DefaultPlayerColor, 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 				  DawnOfManQuote, 						DawnOfManImage)
SELECT	'CIVILIZATION_JFD_SWITZERLAND', 'TXT_KEY_CIV_JFD_SWITZERLAND_DESC', 'TXT_KEY_CIV_JFD_SWITZERLAND_SHORT_DESC', 	'TXT_KEY_CIV_JFD_SWITZERLAND_ADJECTIVE', 	'TXT_KEY_CIV5_JFD_SWITZERLAND_TEXT_1', 	'TXT_KEY_CIV5_JFD_SWITZERLAND',  'PLAYERCOLOR_JFD_SWITZERLAND', ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_SWITZERLAND_ATLAS', 	0, 				'JFD_SWITZERLAND_ALPHA_ATLAS', 	'Germany', 		'SwitzerlandMap512.dds',  'TXT_KEY_CIV5_DOM_JFD_DUFOUR_TEXT',	'Dufour_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_GERMANY';
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 					CityName)
VALUES	('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_01'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_02'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_03'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_04'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_05'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_06'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_07'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_08'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_09'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_10'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_11'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_12'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_13'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_14'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_16'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_17'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_18'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_19'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_20'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_21'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_22'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_23'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_24'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_25'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_26'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_27'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_28'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_29'),
		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SWITZERLAND_30');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 				BuildingClassType)
SELECT	'CIVILIZATION_JFD_SWITZERLAND', BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_GERMANY';
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 				TechType)
SELECT	'CIVILIZATION_JFD_SWITZERLAND', TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_GERMANY';
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_SWITZERLAND', UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_GERMANY';
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_JFD_SWITZERLAND','LEADER_JFD_DUFOUR');	
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------	
INSERT INTO Civilization_BuildingClassOverrides		
		(CivilizationType, 				 BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_JFD_SWITZERLAND', 'BUILDINGCLASS_MILITARY_ACADEMY',	'BUILDING_JFD_KASERNE');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				 UnitClassType, 		 UnitType)
VALUES	('CIVILIZATION_JFD_SWITZERLAND', 'UNITCLASS_JFD_MEDIC',  'UNIT_JFD_COMBAT_MEDIC');
--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 				ReligionType)
SELECT	'CIVILIZATION_JFD_SWITZERLAND', ReligionType			
FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_FRANCE';	
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 				 SpyName)
VALUES	('CIVILIZATION_JFD_SWITZERLAND', 'TXT_KEY_SPY_NAME_JFD_SWITZERLAND_0'),	
		('CIVILIZATION_JFD_SWITZERLAND', 'TXT_KEY_SPY_NAME_JFD_SWITZERLAND_1'),
		('CIVILIZATION_JFD_SWITZERLAND', 'TXT_KEY_SPY_NAME_JFD_SWITZERLAND_2'),
		('CIVILIZATION_JFD_SWITZERLAND', 'TXT_KEY_SPY_NAME_JFD_SWITZERLAND_3'),
		('CIVILIZATION_JFD_SWITZERLAND', 'TXT_KEY_SPY_NAME_JFD_SWITZERLAND_4'),
		('CIVILIZATION_JFD_SWITZERLAND', 'TXT_KEY_SPY_NAME_JFD_SWITZERLAND_5'),
		('CIVILIZATION_JFD_SWITZERLAND', 'TXT_KEY_SPY_NAME_JFD_SWITZERLAND_6'),
		('CIVILIZATION_JFD_SWITZERLAND', 'TXT_KEY_SPY_NAME_JFD_SWITZERLAND_7'),
		('CIVILIZATION_JFD_SWITZERLAND', 'TXT_KEY_SPY_NAME_JFD_SWITZERLAND_8'),
		('CIVILIZATION_JFD_SWITZERLAND', 'TXT_KEY_SPY_NAME_JFD_SWITZERLAND_9');
--==========================================================================================================================
--==========================================================================================================================