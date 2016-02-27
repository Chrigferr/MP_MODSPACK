--==========================================================================================================================
-- Civilizations
--==========================================================================================================================			
INSERT INTO Civilizations 	
			(Type, 						Description, 					ShortDescription, 					Adjective, 							Civilopedia, 					CivilopediaTag, 		DefaultPlayerColor, 	 ArtDefineTag,			ArtStyleType,				ArtStyleSuffix,	ArtStylePrefix,	IconAtlas, 			AlphaIconAtlas, 			PortraitIndex,	SoundtrackTag, 	MapImage, 			DawnOfManQuote, 					DawnOfManImage)
SELECT		('CIVILIZATION_JFD_NRI'), 	('TXT_KEY_CIV_JFD_NRI_DESC'), 	('TXT_KEY_CIV_JFD_NRI_SHORT_DESC'), ('TXT_KEY_CIV_JFD_NRI_ADJECTIVE'), 	('TXT_KEY_CIV5_NRI_TEXT_1'),	('TXT_KEY_CIV5_NRI'), 	('PLAYERCOLOR_JFD_NRI'), ('ART_DEF_JFD_NRI'),	('ARTSTYLE_SOUTH_AMERICA'), ArtStyleSuffix,	ArtStylePrefix,	('JFD_NRI_ATLAS'),	('JFD_NRI_ALPHA_ATLAS'), 	0, 				('Songhai'), 	('NriMap512.dds'), 	('TXT_KEY_CIV5_DOM_JFD_ERI_TEXT'),	('Eri_DOM.dds')
FROM Civilizations WHERE Type = 'CIVILIZATION_SONGHAI';
--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================		
INSERT INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_01'),
			('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_02'),
			('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_03'),
			('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_04'),
			('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_05'),
			('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_06'),
			('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_07'),
			('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_08'),
			('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_09'),
			('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_10'),
			('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_11'),
			('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_12'),
			('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_13'),
			('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_14'),
			('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_15'),
			('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_16'),
			('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_17'),
			('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_18'),
			('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_19'),
			('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_20');
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 			BuildingClassType)
SELECT		('CIVILIZATION_JFD_NRI'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================	
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 			TechType)
SELECT		('CIVILIZATION_JFD_NRI'), 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================	
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 			UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_NRI'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 			LeaderheadType)
VALUES		('CIVILIZATION_JFD_NRI', 	'LEADER_JFD_ERI');
--==========================================================================================================================
-- Civilization_UnitClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 			UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_NRI', 	'UNITCLASS_MERCHANT',		'UNIT_JFD_MBURICHI');
--==========================================================================================================================
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 			BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_JFD_NRI', 	'BUILDINGCLASS_FORGE',		'BUILDING_JFD_BRONZE_CASTER');
--==========================================================================================================================
-- Civilization_Religions
--==========================================================================================================================	
INSERT INTO Civilization_Religions 
			(CivilizationType, 			ReligionType)
VALUES		('CIVILIZATION_JFD_NRI', 	'RELIGION_JFD_ODINANI');			
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 			RegionType)
VALUES		('CIVILIZATION_JFD_NRI', 	'REGION_HILLS');
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 			SpyName)
VALUES		('CIVILIZATION_JFD_NRI', 	'TXT_KEY_SPY_NAME_JFD_NRI_0'),	
			('CIVILIZATION_JFD_NRI', 	'TXT_KEY_SPY_NAME_JFD_NRI_1'),
			('CIVILIZATION_JFD_NRI', 	'TXT_KEY_SPY_NAME_JFD_NRI_2'),
			('CIVILIZATION_JFD_NRI', 	'TXT_KEY_SPY_NAME_JFD_NRI_3'),
			('CIVILIZATION_JFD_NRI', 	'TXT_KEY_SPY_NAME_JFD_NRI_4'),
			('CIVILIZATION_JFD_NRI', 	'TXT_KEY_SPY_NAME_JFD_NRI_5'),
			('CIVILIZATION_JFD_NRI', 	'TXT_KEY_SPY_NAME_JFD_NRI_6'),
			('CIVILIZATION_JFD_NRI', 	'TXT_KEY_SPY_NAME_JFD_NRI_7'),
			('CIVILIZATION_JFD_NRI', 	'TXT_KEY_SPY_NAME_JFD_NRI_8'),
			('CIVILIZATION_JFD_NRI', 	'TXT_KEY_SPY_NAME_JFD_NRI_9');
--==========================================================================================================================	
--==========================================================================================================================					
	
