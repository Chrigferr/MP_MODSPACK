--==========================================================================================================================
-- Civilizations
--==========================================================================================================================			
INSERT INTO Civilizations 	
			(Type, 							Description, 						ShortDescription, 						Adjective, 									Civilopedia, 						CivilopediaTag, 			DefaultPlayerColor, 		  ArtDefineTag,				ArtStyleType, ArtStyleSuffix,	ArtStylePrefix,	IconAtlas, 				AlphaIconAtlas, 				PortraitIndex,	SoundtrackTag, 		MapImage, 				DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_JFD_FLANDERS'), 	('TXT_KEY_CIV_JFD_FLANDERS_DESC'), 	('TXT_KEY_CIV_JFD_FLANDERS_SHORT_DESC'), ('TXT_KEY_CIV_JFD_FLANDERS_ADJECTIVE'), 	('TXT_KEY_CIV5_FLANDERS_TEXT_1'),	('TXT_KEY_CIV5_FLANDERS'), 	('PLAYERCOLOR_JFD_FLANDERS'), ('ART_DEF_JFD_FLANDERS'),	ArtStyleType, ArtStyleSuffix,	ArtStylePrefix,	('JFD_FLANDERS_ATLAS'),	('JFD_FLANDERS_ALPHA_ATLAS'), 	0, 				('Netherlands'), 	('FlandersMap512.dds'), ('TXT_KEY_CIV5_DOM_JFD_ROBRECHT_TEXT'),	('DOM_Robrecht.dds')
FROM Civilizations WHERE Type = 'CIVILIZATION_GERMANY';
--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================		
INSERT INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_01'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_02'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_03'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_04'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_05'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_06'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_07'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_08'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_09'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_10'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_11'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_12'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_13'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_14'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_15'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_16'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_17'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_18'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_19'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_20'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_21'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_22'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_23'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_24'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_25'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_26'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_27'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_28'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_29'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_CITY_NAME_JFD_FLANDERS_30');
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
SELECT		('CIVILIZATION_JFD_FLANDERS'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_GERMANY';
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================	
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_JFD_FLANDERS'), 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_GERMANY';
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================	
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_FLANDERS'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_GERMANY';
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_JFD_FLANDERS', 	'LEADER_JFD_ROBRECHT');
--==========================================================================================================================
-- Civilization_UnitClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_FLANDERS', 	'UNITCLASS_PIKEMAN',		'UNIT_JFD_GOEDENDAG');
--==========================================================================================================================
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 				BuildingClassType, 				BuildingType)
VALUES		('CIVILIZATION_JFD_FLANDERS', 	'BUILDINGCLASS_CASTLE',			'BUILDING_JFD_BELFORT'),
			('CIVILIZATION_JFD_FLANDERS', 	'BUILDINGCLASS_JFD_BELFORT_2',	'BUILDING_JFD_BELFORT_2'),
			('CIVILIZATION_JFD_FLANDERS', 	'BUILDINGCLASS_JFD_BELFORT_3',	'BUILDING_JFD_BELFORT_3');
--==========================================================================================================================
-- Civilization_Religions
--==========================================================================================================================	
INSERT INTO Civilization_Religions 
			(CivilizationType, 				ReligionType)
VALUES		('CIVILIZATION_JFD_FLANDERS', 	'RELIGION_CHRISTIANITY');			
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 				RegionType)
VALUES		('CIVILIZATION_JFD_FLANDERS', 	'REGION_HILLS');
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_SPY_NAME_JFD_FLANDERS_0'),	
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_SPY_NAME_JFD_FLANDERS_1'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_SPY_NAME_JFD_FLANDERS_2'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_SPY_NAME_JFD_FLANDERS_3'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_SPY_NAME_JFD_FLANDERS_4'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_SPY_NAME_JFD_FLANDERS_5'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_SPY_NAME_JFD_FLANDERS_6'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_SPY_NAME_JFD_FLANDERS_7'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_SPY_NAME_JFD_FLANDERS_8'),
			('CIVILIZATION_JFD_FLANDERS', 	'TXT_KEY_SPY_NAME_JFD_FLANDERS_9');
--==========================================================================================================================	
--==========================================================================================================================					
	
