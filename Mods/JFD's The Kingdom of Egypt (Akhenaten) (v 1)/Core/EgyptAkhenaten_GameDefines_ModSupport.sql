--=======================================================================================================================
-- BINGLES CIV IV TRAITS
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT INTO Leader_SharedTraits
        (LeaderType,             	TraitOne,               TraitTwo)
VALUES  ('LEADER_JFD_AKHENATEN', 	'POLICY_EXPANSIVE_X',	'POLICY_SPIRITUAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Akhenaten [ICON_FOOD][ICON_PEACE]'
WHERE Type = 'LEADER_JFD_AKHENATEN'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_EGYPT'
WHERE Type = 'CIVILIZATION_JFD_EGYPT_AKHENATEN'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_EGYPT');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,									X,	Y)
VALUES	('CIVILIZATION_JFD_EGYPT_AKHENATEN',	31, 45);
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,									X,	Y)
VALUES	('CIVILIZATION_JFD_EGYPT_AKHENATEN',	70, 43);
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,									X,	Y)
VALUES	('CIVILIZATION_JFD_EGYPT_AKHENATEN',	45, 16);
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,									X,	Y)
VALUES	('CIVILIZATION_JFD_EGYPT_AKHENATEN',	59, 32);
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
		(Type,									X,	Y)
VALUES	('CIVILIZATION_JFD_EGYPT_AKHENATEN',	57,	9);
------------------------------------------------------------	
-- Civilizations_AfricaLargeStartPosition (Africa Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfricaLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfricaLargeStartPosition
		(Type,									X,	Y)
VALUES	('CIVILIZATION_JFD_EGYPT_AKHENATEN',	43,	64);
------------------------------------------------------------	
-- Civilizations_MediterraneanStartPosition (Mediterranean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
		(Type,									X,	Y)
VALUES	('CIVILIZATION_JFD_EGYPT_AKHENATEN',	84, 2);
------------------------------------------------------------	
-- Civilizations_NileValleyStartPosition (Nile Valley)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NileValleyStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NileValleyStartPosition
		(Type,									X,	Y)
VALUES	('CIVILIZATION_JFD_EGYPT_AKHENATEN',	28, 35);
------------------------------------------------------------	
-- Civilizations_MesopotamiaStartPosition (Mesopotamia)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MesopotamiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MesopotamiaStartPosition
		(Type,									X,	Y)
VALUES	('CIVILIZATION_JFD_EGYPT_AKHENATEN',	28, 1);
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_EGYPT_AKHENATEN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_EGYPT_AKHENATEN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_EGYPT_AKHENATEN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_EGYPT_AKHENATEN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';
------------------------------------------------------------	
-- Civilizations_AfricaLargeRequestedResource (Africa Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfricaLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfricaLargeRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_EGYPT_AKHENATEN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AfricaLargeRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';
------------------------------------------------------------	
-- Civilizations_MediterraneanRequestedResource (Mediterranean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MediterraneanRequestedResource
		(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_EGYPT_AKHENATEN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_MediterraneanRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';
------------------------------------------------------------	
-- Civilizations_NileValleyRequestedResource (Nile Valley)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NileValleyRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NileValleyRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_EGYPT_AKHENATEN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NileValleyRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,								CultureType,		CultureEra)
VALUES	('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'MEDITERRANEAN',	'ANCIENT'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'ARABIAN',			'MODERN');
--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 											text 										default null,
	Value 											integer 									default 1);
--==========================================================================================================================
-- JFD CIVILOPEDIA
--==========================================================================================================================
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Civilopedia_HideFromPedia (Type text default null);

INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
VALUES	('RESOURCE_JFD_WHEAT');
--==========================================================================================================================
-- JFD CULTURAL DIVERSITY
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null,
	ArtDefineTag								text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,					ArtDefineTag, CultureType, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_EGYPT_AKHENATEN',	ArtDefineTag, CultureType, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_EGYPT';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_MesopotamicEgyptian'
WHERE Type = 'CIVILIZATION_JFD_EGYPT_AKHENATEN'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_MesopotamicEgyptian')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================
-- JFD EXPLORATION CONTINUED EXPANDED
--==========================================================================================================================
-- Civilization_JFD_ColonialCityNames
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);
		
INSERT INTO Civilization_JFD_ColonialCityNames
		(CivilizationType,					LinguisticType, ColonyName)
SELECT	'CIVILIZATION_JFD_EGYPT_AKHENATEN',	LinguisticType, ColonyName
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_EGYPT';
------------------------------	
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
		(CivilizationType,						RevolutionaryCivilizationType)
VALUES	('CIVILIZATION_EGYPT',					'CIVILIZATION_JFD_EGYPT_AKHENATEN'),
		('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'CIVILIZATION_EGYPT');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
		(CivilizationType,						RevolutionaryCivilizationType)
SELECT	'CIVILIZATION_JFD_EGYPT_AKHENATEN',		'CIVILIZATION_JFD_DJOSER_EGYPT'
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_DJOSER_EGYPT');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
		(CivilizationType,						RevolutionaryCivilizationType)
SELECT	'CIVILIZATION_JFD_EGYPT_AKHENATEN',		'CIVILIZATION_JFD_HATSHEPSUT_EGYPT'
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_HATSHEPSUT_EGYPT');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
		(CivilizationType,						RevolutionaryCivilizationType)
SELECT	'CIVILIZATION_JFD_EGYPT_AKHENATEN',		'CIVILIZATION_MC_NARMER'
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_MC_NARMER');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
		(CivilizationType,						RevolutionaryCivilizationType)
SELECT	'CIVILIZATION_JFD_EGYPT_AKHENATEN',		'CIVILIZATION_MC_LITE_NUBIA'
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_MC_LITE_NUBIA');
--==========================================================================================================================	
-- JFD's and Pouakai's MERCENARIES
--==========================================================================================================================
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_MERCENARY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,					Flavor)
VALUES	('LEADER_JFD_AKHENATEN',	'FLAVOR_JFD_MERCENARY',		5);
--==========================================================================================================================	
-- JFD PIETY & SOVEREIGNTY
--==========================================================================================================================	
-- Civilization_JFD_Governments
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Governments (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType	  					text 		 												default null,
	LegislatureName					text														default	null,
	OfficeTitle						text														default	null,
	GovernmentType					text														default	null,
	Weight							integer														default	0);

INSERT INTO Civilization_JFD_Governments
		(CivilizationType,						LegislatureName, OfficeTitle, GovernmentType, Weight)
SELECT	'CIVILIZATION_JFD_EGYPT_AKHENATEN',		LegislatureName, OfficeTitle, GovernmentType, Weight
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_EGYPT';
------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	HeadOfGovernmentName			text 		 												default null);

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,      				HeadOfGovernmentName)
VALUES  ('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_EGYPT_AKHENATEN_1'),
        ('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_EGYPT_AKHENATEN_2'),
        ('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_EGYPT_AKHENATEN_3'),
        ('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_EGYPT_AKHENATEN_4'),
        ('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_EGYPT_AKHENATEN_5'),
        ('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_EGYPT_AKHENATEN_6'),
        ('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_EGYPT_AKHENATEN_7'),
        ('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_EGYPT_AKHENATEN_8'),
        ('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_EGYPT_AKHENATEN_9'),
        ('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_EGYPT_AKHENATEN_10'),
        ('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_EGYPT_AKHENATEN_11'),
        ('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_EGYPT_AKHENATEN_12'),
        ('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_EGYPT_AKHENATEN_13'),
        ('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_EGYPT_AKHENATEN_14'),
        ('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_EGYPT_AKHENATEN_15'),
        ('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_EGYPT_AKHENATEN_16'),
        ('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_EGYPT_AKHENATEN_17'),
        ('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_EGYPT_AKHENATEN_18'),
        ('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_EGYPT_AKHENATEN_19'),
        ('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_EGYPT_AKHENATEN_20'),
        ('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_EGYPT_AKHENATEN_21'),
        ('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_EGYPT_AKHENATEN_22'),
        ('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_EGYPT_AKHENATEN_23'),
        ('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_EGYPT_AKHENATEN_24'),
        ('CIVILIZATION_JFD_EGYPT_AKHENATEN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_EGYPT_AKHENATEN_25');
------------------------------------------------------------
-- Civilization_JFD_Titles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Titles (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	ReligionType					text 		REFERENCES Religions(Type) 						default null,
	DefaultTitle					text 		 												default null,
	UniqueTitle						text 		 												default null,
	UseAdjective					boolean														default 0);	

INSERT INTO Civilization_JFD_Titles
		(CivilizationType,						DefaultTitle,	UniqueTitle)
SELECT	'CIVILIZATION_JFD_EGYPT_AKHENATEN',		DefaultTitle,	UniqueTitle
FROM Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_EGYPT';
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 					default null,
	PoliticsType  						text 														default null,
	UniqueName							text														default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,					PoliticsType, UniqueName)
SELECT	'CIVILIZATION_JFD_EGYPT_AKHENATEN',	PoliticsType, UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_EGYPT';
------------------------------------------------------------			
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_CULTURE'),
		('FLAVOR_JFD_REFORM_ECONOMIC'),
		('FLAVOR_JFD_REFORM_FOREIGN'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION'),
		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,							 Flavor)
VALUES	('LEADER_JFD_AKHENATEN',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 8),
		('LEADER_JFD_AKHENATEN',	'FLAVOR_JFD_REFORM_CULTURE',		 7),
		('LEADER_JFD_AKHENATEN',	'FLAVOR_JFD_REFORM_ECONOMIC',		 5),
		('LEADER_JFD_AKHENATEN',	'FLAVOR_JFD_REFORM_FOREIGN',		 7),
		('LEADER_JFD_AKHENATEN',	'FLAVOR_JFD_REFORM_INDUSTRY',		 5),
		('LEADER_JFD_AKHENATEN',	'FLAVOR_JFD_REFORM_MILITARY',		 5),
		('LEADER_JFD_AKHENATEN',	'FLAVOR_JFD_REFORM_RELIGION',		 9),
		('LEADER_JFD_AKHENATEN',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	 7);
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_EgyptAkhenaten_Decisions.lua');
------------------------------	
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 						DefaultBuilding, 								Description, 								MaxPlayerInstances)
VALUES	('BUILDINGCLASS_DECISIONS_JFD_GEMPAATEN_ART', 		'BUILDING_DECISIONS_JFD_GEMPAATEN_ART',			'TXT_KEY_DECISIONS_JFD_GEMPAATEN_ART',		1),
		('BUILDINGCLASS_DECISIONS_JFD_GEMPAATEN_WRITING', 	'BUILDING_DECISIONS_JFD_GEMPAATEN_WRITING',		'TXT_KEY_DECISIONS_JFD_GEMPAATEN_WRITING',	1),
		('BUILDINGCLASS_DECISIONS_JFD_GEMPAATEN_MUSIC', 	'BUILDING_DECISIONS_JFD_GEMPAATEN_MUSIC',		'TXT_KEY_DECISIONS_JFD_GEMPAATEN_MUSIC',	1);
------------------------------
-- Buildings
------------------------------
INSERT INTO Buildings			
		(Type, 											BuildingClass, 			  							FreeBuildingThisCity,								GreatWorkCount,	GreatWorkSlotType,					Cost, 	FaithCost,	Help,										Description, 								Civilopedia,								IconAtlas,		PortraitIndex,	NukeImmune, ConquestProb)
VALUES	('BUILDING_DECISIONS_JFD_GEMPAATEN_ART',		'BUILDINGCLASS_DECISIONS_JFD_GEMPAATEN_ART',		'BUILDINGCLASS_DECISIONS_JFD_GEMPAATEN_WRITING',	1,				'GREAT_WORK_SLOT_ART_ARTIFACT',		-1, 	-1,			'TXT_KEY_DECISIONS_JFD_GEMPAATEN_HELP',		'TXT_KEY_DECISIONS_JFD_GEMPAATEN_ART', 		'TXT_KEY_DECISIONS_JFD_GEMPAATEN_PEDIA',	'BW_ATLAS_1',	55,				1,			100),
		('BUILDING_DECISIONS_JFD_GEMPAATEN_WRITING',	'BUILDINGCLASS_DECISIONS_JFD_GEMPAATEN_WRITING',	'BUILDINGCLASS_DECISIONS_JFD_GEMPAATEN_MUSIC',		1,				'GREAT_WORK_SLOT_LITERATURE',		-1, 	-1,			'TXT_KEY_DECISIONS_JFD_GEMPAATEN_HELP',		'TXT_KEY_DECISIONS_JFD_GEMPAATEN_WRITING', 	'TXT_KEY_DECISIONS_JFD_GEMPAATEN_PEDIA',	'BW_ATLAS_1',	55,				1,			100),
		('BUILDING_DECISIONS_JFD_GEMPAATEN_MUSIC',		'BUILDINGCLASS_DECISIONS_JFD_GEMPAATEN_MUSIC',		null,												1,				'GREAT_WORK_SLOT_MUSIC',			-1, 	-1,			'TXT_KEY_DECISIONS_JFD_GEMPAATEN_HELP',		'TXT_KEY_DECISIONS_JFD_GEMPAATEN_MUSIC', 	'TXT_KEY_DECISIONS_JFD_GEMPAATEN_PEDIA',	'BW_ATLAS_1',	55,				1,			100);
------------------------------
-- Building_YieldChanges
------------------------------
INSERT INTO Building_YieldChanges			
		(BuildingType,									YieldType, 			Yield)
VALUES	('BUILDING_DECISIONS_JFD_GEMPAATEN_ART',		'YIELD_CULTURE',	1),
		('BUILDING_DECISIONS_JFD_GEMPAATEN_ART',		'YIELD_FAITH',		2),
		('BUILDING_DECISIONS_JFD_GEMPAATEN_WRITING',	'YIELD_CULTURE',	1),
		('BUILDING_DECISIONS_JFD_GEMPAATEN_WRITING',	'YIELD_FAITH',		2),
		('BUILDING_DECISIONS_JFD_GEMPAATEN_MUSIC',		'YIELD_CULTURE',	1),
		('BUILDING_DECISIONS_JFD_GEMPAATEN_MUSIC',		'YIELD_FAITH',		2);
------------------------------
-- Policies
------------------------------
INSERT INTO Policies
		(Type,									Description)
VALUES	('POLICY_DECISIONS_JFD_DECLARE_ATEN',	'TXT_KEY_DECISIONS_JFD_EGYPT_AKHENATEN_DECLARE_ATEN'),
		('POLICY_EVENTS_JFD_AMENHOTEP',			'TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELIGIOUS_DISSIDENTS');
------------------------------
-- Policy_BuildingClassProductionModifiers
------------------------------
INSERT INTO Policy_BuildingClassProductionModifiers	
		(PolicyType,							BuildingClassType,			ProductionModifier)
VALUES	('POLICY_DECISIONS_JFD_DECLARE_ATEN',	'BUILDINGCLASS_TEMPLE',		100);
------------------------------
-- Policy_ImprovementYieldChanges
------------------------------
INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType,							ImprovementType,			YieldType,		Yield)
VALUES	('POLICY_DECISIONS_JFD_DECLARE_ATEN',	'IMPROVEMENT_JFD_OBELISK',	'YIELD_FAITH',	1);
------------------------------
-- Policy_BuildingClassYieldChanges
------------------------------
INSERT INTO Policy_BuildingClassYieldChanges
		(PolicyType,							BuildingClassType,			YieldType,		YieldChange)
VALUES	('POLICY_DECISIONS_JFD_DECLARE_ATEN',	'BUILDINGCLASS_TEMPLE',		'YIELD_FAITH',	-1);
------------------------------
-- Policy_JFD_LeaderName
------------------------------
CREATE TABLE IF NOT EXISTS 
	Policy_JFD_LeaderName (
	PolicyType  						text 		REFERENCES Policies(Type) 					default null,
	LeaderType  						text 		REFERENCES Leaders(Type) 					default null,
	Description							text													default	null);

INSERT INTO Policy_JFD_LeaderName
		(PolicyType,							LeaderType,					Description)
VALUES	('POLICY_DECISIONS_JFD_DECLARE_ATEN',	'LEADER_JFD_AKHENATEN',		'TXT_KEY_LEADER_JFD_AMENHOTEP');
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_EgyptAkhenaten_Events.lua');
------------------------------
-- Events_CulturalDevelopments
------------------------------
CREATE TABLE IF NOT EXISTS 
Events_CulturalDevelopments(
	CivilizationType		text  REFERENCES Civilizations(Type)	default null,
	CultureType				text									default null,
	Description				text									default null);

INSERT INTO Events_CulturalDevelopments 
		(Description,										CivilizationType,						CultureType)
VALUES	('TXT_KEY_EVENT_CULDEV_JFD_EGYPT_AKHENATEN_01',		'CIVILIZATION_JFD_EGYPT_AKHENATEN',		'JFD_Mesopotamic');
--==========================================================================================================================
--==========================================================================================================================