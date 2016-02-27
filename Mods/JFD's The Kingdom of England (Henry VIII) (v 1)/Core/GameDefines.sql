--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
			(Type, 						 		 	DefaultBuilding, 				Description)
VALUES		('BUILDINGCLASS_JFD_HENRY_ENGLAND', 	'BUILDING_JFD_HENRY_GPGEN', 	'TXT_KEY_BUILDING_JFD_HENRY_GPGEN');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type, 								BuildingClass, Cost, GoldMaintenance, PrereqTech,			FreeStartEra, Description, 									Civilopedia, 								Help, 											Strategy,								 			ArtDefineTag, 	MinAreaSize, NeverCapture, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_JOUSTING_GROUNDS'),	BuildingClass, Cost, GoldMaintenance, ('TECH_CHIVALRY'),	FreeStartEra, ('TXT_KEY_BUILDING_JFD_JOUSTING_GROUNDS'), 	('TXT_KEY_CIV5_JFD_JOUSTING_GROUNDS_TEXT'), ('TXT_KEY_BUILDING_JFD_JOUSTING_GROUNDS_HELP'), ('TXT_KEY_BUILDING_JFD_JOUSTING_GROUNDS_STRATEGY'), ArtDefineTag,	MinAreaSize, NeverCapture, HurryCostModifier, 2, 				('JFD_ENGLAND_HENRY_ATLAS')
FROM Buildings WHERE (Type = 'BUILDING_ARMORY');	

INSERT INTO Buildings 	
			(Type, 								BuildingClass, Cost,GoldMaintenance, Happiness, GreatWorkSlotType,				GreatWorkCount, PrereqTech, FreeStartEra, Description, 						Civilopedia, 						 Help, 										Strategy,								 		ArtDefineTag, 	MinAreaSize, NeverCapture, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_PLAYHOUSE'),			BuildingClass, Cost, 0,				 Happiness, ('GREAT_WORK_SLOT_LITERATURE'),	1,				PrereqTech, FreeStartEra, ('TXT_KEY_BUILDING_JFD_PLAYHOUSE'),  ('TXT_KEY_CIV5_JFD_PLAYHOUSE_TEXT'), ('TXT_KEY_BUILDING_JFD_PLAYHOUSE_HELP'),   ('TXT_KEY_BUILDING_JFD_PLAYHOUSE_STRATEGY'), ArtDefineTag,	MinAreaSize, NeverCapture, HurryCostModifier, 3, 				('JFD_ENGLAND_HENRY_ATLAS')
FROM Buildings WHERE (Type = 'BUILDING_THEATRE');

INSERT INTO Buildings 	
			(Type, 						 		BuildingClass, 						GreatPeopleRateModifier,	GreatWorkCount, Cost, FaithCost, Description, 											Help)
VALUES		('BUILDING_JFD_HENRY_GPGEN', 		'BUILDINGCLASS_JFD_HENRY_ENGLAND', 	20,							-1, 			-1,   -1, 		 'TXT_KEY_BUILDING_JFD_HENRY_GPGEN', 					'TXT_KEY_BUILDING_JFD_HENRY_GPGEN_HELP');
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 						BuildingClassType)
SELECT		('BUILDING_JFD_JOUSTING_GROUNDS'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE (BuildingType = 'BUILDING_ARMORY');

INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 						BuildingClassType)
SELECT		('BUILDING_JFD_PLAYHOUSE'),			BuildingClassType
FROM Building_ClassesNeededInCity WHERE (BuildingType = 'BUILDING_THEATRE');
------------------------------	
-- Building_DomainFreeExperiences
------------------------------	
INSERT INTO Building_DomainFreeExperiences 	
			(BuildingType, 						DomainType,		Experience)
SELECT		('BUILDING_JFD_JOUSTING_GROUNDS'),	DomainType,		Experience
FROM Building_DomainFreeExperiences WHERE (BuildingType = 'BUILDING_ARMORY');
------------------------------	
-- Building_UnitCombatFreeExperiences
------------------------------	
INSERT INTO Building_UnitCombatFreeExperiences 	
			(BuildingType, 						UnitCombatType,			Experience)
VALUES		('BUILDING_JFD_JOUSTING_GROUNDS',	'UNITCOMBAT_MOUNTED',	10);
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 						FlavorType,		Flavor)
SELECT		('BUILDING_JFD_JOUSTING_GROUNDS'),	FlavorType,		Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_ARMORY');	

INSERT INTO Building_Flavors 	
			(BuildingType, 						FlavorType,		Flavor)
SELECT		('BUILDING_JFD_PLAYHOUSE'),			FlavorType,		Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_THEATRE');	

INSERT INTO Building_Flavors 	
			(BuildingType, 						FlavorType,						Flavor)
VALUES		('BUILDING_JFD_PLAYHOUSE',			'FLAVOR_CULTURE',				30),
			('BUILDING_JFD_JOUSTING_GROUNDS',	'FLAVOR_CULTURE',				20),
			('BUILDING_JFD_JOUSTING_GROUNDS',	'FLAVOR_MOBILE',				20),
			('BUILDING_JFD_JOUSTING_GROUNDS',	'FLAVOR_MILITARY_TRAINING',		10);
--==========================================================================================================================	
-- GREAT WORKS
--==========================================================================================================================	
-- GreatWorks
--------------------------------	
INSERT INTO GreatWorks 
			(Type, 								GreatWorkClassType,			Description,								Quote,											Audio,							Image)
VALUES		('GREAT_WORK_JFD_ELIZABETHAN_1', 	'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_JFD_ELIZABETHAN_1', 	'TXT_KEY_GREAT_WORK_QUOTE_JFD_ELIZABETHAN_1', 	'AS2D_GREAT_ARTIST_ARTWORK',	'GreatWriter_Background.dds'),
			('GREAT_WORK_JFD_ELIZABETHAN_2', 	'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_JFD_ELIZABETHAN_2', 	'TXT_KEY_GREAT_WORK_QUOTE_JFD_ELIZABETHAN_2', 	'AS2D_GREAT_ARTIST_ARTWORK',	'GreatWriter_Background.dds'),
			('GREAT_WORK_JFD_ELIZABETHAN_3', 	'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_JFD_ELIZABETHAN_3', 	'TXT_KEY_GREAT_WORK_QUOTE_JFD_ELIZABETHAN_3', 	'AS2D_GREAT_ARTIST_ARTWORK',	'GreatWriter_Background.dds');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	
			(Class, 				Type, 							Cost,	Moves,	Domain,			DefaultUnitAI,		Description, 							ShowInPedia, 	AdvancedStartCost,	UnitArtInfo, 					UnitFlagIconOffset,		UnitFlagAtlas,					PortraitIndex,	IconAtlas, 					MoveRate)
VALUES		('UNITCLASS_WRITER',	'UNIT_JFD_ELIZABETHAN_WRITER', 	-1,		2,		'DOMAIN_LAND',	'UNITAI_WRITER',	'TXT_KEY_UNIT_JFD_ELIZABETHAN_WRITER',	0,				-1,					'ART_DEF_UNIT_GREAT_WRITER',	8,						'EXPANSION2_UNIT_FLAG_ATLAS',	8, 				'EXPANSION2_UNIT_ATLAS',	'GREAT_PERSON');
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_ELIZABETHAN_WRITER'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_WRITER');	
--------------------------------
-- Unit_UniqueNames
--------------------------------
INSERT INTO Unit_UniqueNames 
			(UnitType, 							UniqueName,												GreatWorkType)
VALUES		('UNIT_JFD_ELIZABETHAN_WRITER',		'TXT_KEY_GREAT_PERSON_JFD_WILLIAM_SHAKESPEARE_DESC',	'GREAT_WORK_JFD_ELIZABETHAN_1'),
			('UNIT_JFD_ELIZABETHAN_WRITER',		'TXT_KEY_GREAT_PERSON_JFD_CHRISTOPHER_MARLOWE_DESC',	'GREAT_WORK_JFD_ELIZABETHAN_2'),
			('UNIT_JFD_ELIZABETHAN_WRITER',		'TXT_KEY_GREAT_PERSON_JFD_BEN_JOHNSON_DESC',			'GREAT_WORK_JFD_ELIZABETHAN_3');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
			(Type, 						Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_JFD_HENRY', 		'TXT_KEY_LEADER_JFD_HENRY', 	'TXT_KEY_LEADER_JFD_HENRY_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_HENRY', 	'Henry_Scene.xml',	8, 						3, 						3, 							8, 			6, 				6, 				5, 						5, 				6, 			6, 			4, 				4, 			4, 			'JFD_ENGLAND_HENRY_ATLAS', 	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_HENRY', 		'MAJOR_CIV_APPROACH_WAR', 			7),
			('LEADER_JFD_HENRY', 		'MAJOR_CIV_APPROACH_HOSTILE', 		3),
			('LEADER_JFD_HENRY', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
			('LEADER_JFD_HENRY', 		'MAJOR_CIV_APPROACH_GUARDED', 		4),
			('LEADER_JFD_HENRY', 		'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_JFD_HENRY', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_JFD_HENRY', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_HENRY', 		'MINOR_CIV_APPROACH_IGNORE', 		3),
			('LEADER_JFD_HENRY', 		'MINOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_JFD_HENRY', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	3),
			('LEADER_JFD_HENRY', 		'MINOR_CIV_APPROACH_CONQUEST', 		7),
			('LEADER_JFD_HENRY', 		'MINOR_CIV_APPROACH_BULLY', 		4);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_HENRY', 		'FLAVOR_OFFENSE', 					6),
			('LEADER_JFD_HENRY', 		'FLAVOR_DEFENSE', 					4),
			('LEADER_JFD_HENRY', 		'FLAVOR_CITY_DEFENSE', 				4),
			('LEADER_JFD_HENRY', 		'FLAVOR_MILITARY_TRAINING', 		8),
			('LEADER_JFD_HENRY', 		'FLAVOR_RECON', 					4),
			('LEADER_JFD_HENRY', 		'FLAVOR_RANGED', 					7),
			('LEADER_JFD_HENRY', 		'FLAVOR_MOBILE', 					8),
			('LEADER_JFD_HENRY', 		'FLAVOR_NAVAL', 					4),
			('LEADER_JFD_HENRY', 		'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_JFD_HENRY', 		'FLAVOR_NAVAL_GROWTH', 				3),
			('LEADER_JFD_HENRY', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
			('LEADER_JFD_HENRY', 		'FLAVOR_AIR', 						4),
			('LEADER_JFD_HENRY', 		'FLAVOR_EXPANSION', 				6),
			('LEADER_JFD_HENRY', 		'FLAVOR_GROWTH', 					6),
			('LEADER_JFD_HENRY', 		'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_JFD_HENRY', 		'FLAVOR_INFRASTRUCTURE', 			5),
			('LEADER_JFD_HENRY', 		'FLAVOR_PRODUCTION', 				4),
			('LEADER_JFD_HENRY', 		'FLAVOR_GOLD', 						6),
			('LEADER_JFD_HENRY', 		'FLAVOR_SCIENCE', 					3),
			('LEADER_JFD_HENRY', 		'FLAVOR_CULTURE', 					4),
			('LEADER_JFD_HENRY', 		'FLAVOR_HAPPINESS', 				6),
			('LEADER_JFD_HENRY', 		'FLAVOR_GREAT_PEOPLE', 				6),
			('LEADER_JFD_HENRY', 		'FLAVOR_WONDER', 					4),
			('LEADER_JFD_HENRY', 		'FLAVOR_RELIGION', 					3),
			('LEADER_JFD_HENRY', 		'FLAVOR_DIPLOMACY', 				2),
			('LEADER_JFD_HENRY', 		'FLAVOR_SPACESHIP', 				2),
			('LEADER_JFD_HENRY', 		'FLAVOR_WATER_CONNECTION', 			2),
			('LEADER_JFD_HENRY', 		'FLAVOR_NUKE', 						2),
			('LEADER_JFD_HENRY', 		'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_HENRY', 		'FLAVOR_ESPIONAGE', 				4),
			('LEADER_JFD_HENRY', 		'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_HENRY', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_HENRY', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_HENRY', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_HENRY', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_HENRY', 		'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_HENRY', 		'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
			(LeaderType, 						TraitType)
VALUES		('LEADER_JFD_HENRY', 				'TRAIT_JFD_HENRY_ENGLAND');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
			(Type, 								Description, 							ShortDescription)
VALUES		('TRAIT_JFD_HENRY_ENGLAND', 		'TXT_KEY_TRAIT_JFD_HENRY_ENGLAND', 		'TXT_KEY_TRAIT_JFD_HENRY_ENGLAND_SHORT');	
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
			(Type, 								Description, ShortDescription, 	Adjective, 	Civilopedia, CivilopediaTag, DefaultPlayerColor,				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 						PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 						DawnOfManQuote, 							DawnOfManImage)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'), Description, ShortDescription, 	Adjective, 	Civilopedia, CivilopediaTag, ('PLAYERCOLOR_JFD_ENGLAND_HENRY'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_ENGLAND_HENRY_ATLAS'), 	0, 				('JFD_ENGLAND_HENRY_ALPHA_ATLAS'), 	('England'), 	('HenryEnglandMap512.dds'),		('TXT_KEY_CIV5_DAWN_HENRY_ENGLAND_TEXT'),	('Henry_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ENGLAND');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames 
			(CivilizationType, 					CityName)
VALUES		('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_01'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_02'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_03'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_04'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_05'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_06'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_07'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_08'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_09'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_10'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_11'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_12'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_13'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_14'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_15'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_16'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_17'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_18'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_19'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_20'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_21'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_22'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_23'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_24'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_25'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_26'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_27'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_28'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_29'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_30'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_31'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_32'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_33'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_34'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_35'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_36'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_37'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_38'),
			('CIVILIZATION_JFD_HENRY_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_HENRY_ENGLAND_39');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 						BuildingClassType)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 						TechType)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 						LeaderheadType)
VALUES		('CIVILIZATION_JFD_HENRY_ENGLAND',		'LEADER_JFD_HENRY');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_ENGLAND' AND UnitType = 'UNIT_ENGLISH_LONGBOWMAN';
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 						UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_HENRY_ENGLAND', 		'UNITCLASS_CROSSBOWMAN',	'UNIT_ENGLISH_LONGBOWMAN');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 						BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_JFD_HENRY_ENGLAND', 		'BUILDINGCLASS_ARMORY', 	'BUILDING_JFD_JOUSTING_GROUNDS'),
			('CIVILIZATION_ENGLAND', 				'BUILDINGCLASS_THEATRE', 	'BUILDING_JFD_PLAYHOUSE');
--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions 
			(CivilizationType, 						ReligionType)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'), 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 						SpyName)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'), 	SpyName
FROM Civilization_SpyNames WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================
--==========================================================================================================================