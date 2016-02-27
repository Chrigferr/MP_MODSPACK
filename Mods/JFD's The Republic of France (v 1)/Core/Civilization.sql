--==========================================================================================================================
-- Civilizations
--==========================================================================================================================			
INSERT INTO Civilizations 	
			(Type, 									Description, 							ShortDescription, 							Adjective,								Civilopedia,									CivilopediaTag,							DefaultPlayerColor,						ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,						PortraitIndex, 	AlphaIconAtlas,							SoundtrackTag, 	MapImage,						DawnOfManQuote, 							DawnOfManImage)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'), 	('TXT_KEY_JFD_FRANCE_DEGAULLE_DESC'), 	('TXT_KEY_JFD_FRANCE_DEGAULLE_SHORT_DESC'),	('TXT_KEY_JFD_FRANCE_DEGAULLE_ADJ'), 	('TXT_KEY_CIV5_JFD_FRANCE_DEGAULLE_TEXT_1'), 	('TXT_KEY_CIV5_JFD_FRANCE_DEGAULLE'),	('PLAYERCOLOR_JFD_FRANCE_DEGAULLE'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_FRANCE_DEGAULLE_ATLAS'),	0, 				('JFD_FRANCE_DEGAULLE_ALPHA_ATLAS'),	('France'), 	('MapFranceDeGaulle512.dds'), 	('TXT_KEY_CIV5_DAWN_JFD_DEGAULLE_TEXT'), 	('DOM_DeGaulle.dds')
FROM Civilizations WHERE Type = 'CIVILIZATION_FRANCE';
--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================		
INSERT INTO Civilization_CityNames 
			(CivilizationType, 						CityName)
VALUES		('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_01'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_02'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_03'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_04'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_05'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_06'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_07'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_08'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_09'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_10'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_11'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_12'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_13'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_14'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_15'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_16'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_17'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_18'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_19'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_20'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_21'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_22'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_23'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_24'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_25'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_26'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_27'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_28'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_29'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_30'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_31'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_32'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_33'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_34'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_CITY_NAME_JFD_FRANCE_DEGAULLE_35');
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 						BuildingClassType)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================	
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 						TechType)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'), 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================	
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 						LeaderheadType)
VALUES		('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'LEADER_JFD_DEGAULLE');
--==========================================================================================================================
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 						BuildingClassType, 					BuildingType)
VALUES		('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'BUILDINGCLASS_BROADCAST_TOWER', 	'BUILDING_JFD_CAFE');
--==========================================================================================================================
-- Civilization_UnitClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 						UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'UNITCLASS_WWI_TANK', 		'UNIT_JFD_CHAR_B1');
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 						RegionType)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'), 	RegionType
FROM Civilization_Start_Region_Priority WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--==========================================================================================================================
-- Civilization_Religions
--==========================================================================================================================	
INSERT INTO Civilization_Religions 
			(CivilizationType, 						ReligionType)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'), 	ReligionType
FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames
			(CivilizationType, 						SpyName)
VALUES		('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_SPY_NAME_JFD_FRANCE_DEGAULLE_0'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_SPY_NAME_JFD_FRANCE_DEGAULLE_1'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_SPY_NAME_JFD_FRANCE_DEGAULLE_2'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_SPY_NAME_JFD_FRANCE_DEGAULLE_3'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_SPY_NAME_JFD_FRANCE_DEGAULLE_4'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_SPY_NAME_JFD_FRANCE_DEGAULLE_5'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_SPY_NAME_JFD_FRANCE_DEGAULLE_6'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_SPY_NAME_JFD_FRANCE_DEGAULLE_7'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_SPY_NAME_JFD_FRANCE_DEGAULLE_8'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_SPY_NAME_JFD_FRANCE_DEGAULLE_9');	
--==========================================================================================================================	
--==========================================================================================================================					
	
