--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================		
INSERT INTO Civilizations 		
			(Type, 							Description,						ShortDescription, 						Adjective, 								Civilopedia,							CivilopediaTag,					DefaultPlayerColor,				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 				DawnOfManQuote, 					DawnOfManImage)
SELECT		('CIVILIZATION_JFD_GERMANS'), 	('TXT_KEY_CIV_JFD_GERMANS_DESC'), 	('TXT_KEY_CIV_JFD_GERMANS_SHORT_DESC'),	('TXT_KEY_CIV_JFD_GERMANS_ADJECTIVE'),	('TXT_KEY_CIV5_JFD_GERMANS_TEXT_1'), 	('TXT_KEY_CIV5_JFD_GERMANS'), 	 ('PLAYERCOLOR_JFD_GERMANS'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_GERMANS_ATLAS'), 	0, 				('JFD_GERMANS_ALPHA_ATLAS'), 	('Germany'), 	('GermansMap512.dds'),	('TXT_KEY_CIV5_DAWN_GERMANS_TEXT'), ('Arminius_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_GERMANY');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_GERMANY' )
	THEN '_GERMANY'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_GERMANS';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================	
INSERT INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_01'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_02'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_03'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_04'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_05'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_06'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_07'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_08'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_09'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_10'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_11'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_12'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_13'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_14'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_15'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_16'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_17'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_18'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_19'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_20'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_21'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_22'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_23'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_24'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_25'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_26'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_27'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_28'),	
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_29'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_30');	
--==========================================================================================================================	
-- JFD_Civilization_TribalNames
--==========================================================================================================================	
CREATE TABLE IF NOT EXISTS
	Civilization_JFD_TribalNames (
	CivilizationType  	text 	REFERENCES Civilizations(Type) 		default null,
	TribalName 			text 	 									default null);

INSERT INTO Civilization_JFD_TribalNames 
			(CivilizationType, 				TribalName)
VALUES		('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_01'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_02'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_03'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_04'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_05'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_06'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_07'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_08'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_09'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_10'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_11'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_12'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_13'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_14'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_15'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_16'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_17'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_18'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_19'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_20'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_21'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_22'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_23'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_24'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_25'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_26'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_CITY_NAME_JFD_GERMANS_TRIBE_27');	

CREATE TABLE Civilization_JFD_TribalNames1 AS SELECT * FROM Civilization_JFD_TribalNames;
DELETE FROM Civilization_JFD_TribalNames;
INSERT INTO Civilization_JFD_TribalNames SELECT * FROM Civilization_JFD_TribalNames1 ORDER BY RANDOM();
DROP TABLE Civilization_JFD_TribalNames1;
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
SELECT		('CIVILIZATION_JFD_GERMANS'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_JFD_GERMANS'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_GERMANS'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_JFD_GERMANS', 	'LEADER_JFD_ARMINIUS');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_JFD_GERMANS', 	'UNITCLASS_WARRIOR',	'UNIT_JFD_SLAGANZ');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 				ReligionType)
VALUES		('CIVILIZATION_JFD_GERMANS', 	'RELIGION_PROTESTANTISM');
--------------------------------	
-- Historical Religions Support
--------------------------------	
UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_FORN_SIDR' )
		THEN 'RELIGION_FORN_SIDR'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
		THEN 'RELIGION_PROTESTANTISM'
		ELSE 'RELIGION_CHRISTIANITY' END ) END
	) WHERE CivilizationType = 'CIVILIZATION_JFD_GERMANS';

CREATE TRIGGER ReligionGermans
AFTER INSERT ON Religions WHEN 'RELIGION_FORN_SIDR' = NEW.Type
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_FORN_SIDR' )
		THEN 'RELIGION_FORN_SIDR'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
		THEN 'RELIGION_PROTESTANTISM'
		ELSE 'RELIGION_CHRISTIANITY' END ) END
	) WHERE CivilizationType = 'CIVILIZATION_JFD_GERMANS';
END;		
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_SPY_NAME_JFD_GERMANS_0'),	
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_SPY_NAME_JFD_GERMANS_1'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_SPY_NAME_JFD_GERMANS_2'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_SPY_NAME_JFD_GERMANS_3'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_SPY_NAME_JFD_GERMANS_4'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_SPY_NAME_JFD_GERMANS_5'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_SPY_NAME_JFD_GERMANS_6'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_SPY_NAME_JFD_GERMANS_7'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_SPY_NAME_JFD_GERMANS_8'),
			('CIVILIZATION_JFD_GERMANS', 	'TXT_KEY_SPY_NAME_JFD_GERMANS_9');
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Region_Priority
			(CivilizationType, 				RegionType)
VALUES		('CIVILIZATION_JFD_GERMANS', 	'REGION_FOREST');
--==========================================================================================================================		
--==========================================================================================================================						
			
			

