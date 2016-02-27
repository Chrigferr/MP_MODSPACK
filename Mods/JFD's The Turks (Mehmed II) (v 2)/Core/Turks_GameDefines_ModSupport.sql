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
       (LeaderType,				TraitOne,				TraitTwo)
VALUES ('LEADER_JFD_MEHMED',	'POLICY_AGGRESSIVE_X',	'POLICY_SPIRITUAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Mehmed II [ICON_WAR][ICON_PEACE]'
WHERE Type = 'TXT_KEY_LEADER_JFD_MEHMED'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'LEADER_JFD_MEHMED');
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_OTTOMAN')
	THEN '_OTTOMAN'
	ELSE ArtStyleSuffix END) 
WHERE Type = 'CIVILIZATION_JFD_TURKS';
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,							X,		Y)
VALUES	('CIVILIZATION_JFD_TURKS',		32,		57);
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,							X,		Y)
VALUES	('CIVILIZATION_JFD_TURKS',		69,		52);
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,							X,		Y)
VALUES	('CIVILIZATION_JFD_TURKS',		60,		44);
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Cordiform)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,							X,		Y)
VALUES	('CIVILIZATION_JFD_TURKS',		45,		27);
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
		(Type,							X,		Y)
VALUES	('CIVILIZATION_JFD_TURKS',		109,	28);
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
		(Type,							X,		Y)
VALUES	('CIVILIZATION_JFD_TURKS',		54,		27);
------------------------------------------------------------	
-- Civilizations_MesopotamiaStartPosition (Mesopotamia)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MesopotamiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MesopotamiaStartPosition
		(Type,							X,		Y)
VALUES	('CIVILIZATION_JFD_TURKS',		15,		36);
------------------------------------------------------------	
-- Civilizations_AegeanStartPosition (Aegean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AegeanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AegeanStartPosition
		(Type,							X,		Y)
VALUES	('CIVILIZATION_JFD_TURKS',		34,		36);
------------------------------------------------------------	
-- Civilizations_MediterraneanStartPosition (Mediterranean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
		(Type,							X,		Y)
VALUES	('CIVILIZATION_JFD_TURKS',		74,		38);
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 							Req1, Yield1, Req2,	Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_TURKS',		Req1, Yield1, Req2,	Yield2,	Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_OTTOMAN';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 							Req1, Yield1, Req2,	Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_TURKS',		Req1, Yield1, Req2,	Yield2,	Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_OTTOMAN';
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 							Req1, Yield1, Req2,	Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_TURKS',		Req1, Yield1, Req2,	Yield2,	Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_OTTOMAN';
------------------------------------------------------------	
-- Civilizations_CordiformRequestedResource (Earth Cordiform)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CordiformRequestedResource
		(Type, 							Req1, Yield1, Req2,	Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_TURKS',		Req1, Yield1, Req2,	Yield2,	Req3, Yield3, Req4, Yield4
FROM Civilizations_CordiformRequestedResource WHERE Type = 'CIVILIZATION_OTTOMAN';
------------------------------------------------------------	
-- Civilizations_EuroGiantRequestedResource (Euro Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
		(Type, 							Req1, Yield1, Req2,	Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_TURKS',		Req1, Yield1, Req2,	Yield2,	Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_OTTOMAN';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Euro Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
		(Type, 							Req1, Yield1, Req2,	Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_TURKS',		Req1, Yield1, Req2,	Yield2,	Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_OTTOMAN';
------------------------------------------------------------	
-- Civilizations_AegeanRequestedResource (Aegean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AegeanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AegeanRequestedResource
		(Type, 							Req1, Yield1, Req2,	Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_TURKS',		Req1, Yield1, Req2,	Yield2,	Req3, Yield3, Req4, Yield4
FROM Civilizations_AegeanRequestedResource WHERE Type = 'CIVILIZATION_OTTOMAN';
------------------------------------------------------------	
-- Civilizations_MesopotamiaRequestedResource (Mesopotamia)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MesopotamiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MesopotamiaRequestedResource
		(Type, 							Req1, Yield1, Req2,	Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_TURKS',		Req1, Yield1, Req2,	Yield2,	Req3, Yield3, Req4, Yield4
FROM Civilizations_MesopotamiaRequestedResource WHERE Type = 'CIVILIZATION_OTTOMAN';
------------------------------------------------------------	
-- Civilizations__MediterraneanRequestedResource (Mediterranean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MediterraneanRequestedResource
		(Type, 							Req1, Yield1, Req2,	Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_TURKS',		Req1, Yield1, Req2,	Yield2,	Req3, Yield3, Req4, Yield4
FROM Civilizations_MediterraneanRequestedResource WHERE Type = 'CIVILIZATION_OTTOMAN';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,						CultureType,	CultureEra)
VALUES	('CIVILIZATION_JFD_TURKS',		'ARABIC',		'ANY');
--==========================================================================================================================
-- JFD CLAIMS & COLONIES
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
		(CivilizationType,			LinguisticType)
SELECT	'CIVILIZATION_JFD_TURKS',	LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_OTTOMAN';
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
	IdealsTag									text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_TURKS',	ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_OTTOMAN';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Islamic'
WHERE Type = 'CIVILIZATION_JFD_TURKS'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Islamic')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================	
-- JFD PIETY & SOVEREIGNTY
--==========================================================================================================================
-- Civilization_JFD_Governments
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Governments (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 			default null,
	CultureType	  					text 		 										default null,
	LegislatureName					text												default	null,
	OfficeTitle						text												default	null,
	GovernmentType					text												default	null,
	Weight							integer												default	0);

INSERT INTO Civilization_JFD_Governments
		(CivilizationType,			LegislatureName, OfficeTitle, GovernmentType, Weight)
SELECT	'CIVILIZATION_JFD_TURKS',	LegislatureName, OfficeTitle, GovernmentType, Weight
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_OTTOMAN';
------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	HeadOfGovernmentName			text 		 												default null);

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,      	HeadOfGovernmentName)
VALUES  ('CIVILIZATION_JFD_TURKS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_TURKS_1'),
        ('CIVILIZATION_JFD_TURKS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_TURKS_2'),
        ('CIVILIZATION_JFD_TURKS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_TURKS_3'),
        ('CIVILIZATION_JFD_TURKS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_TURKS_4'),
        ('CIVILIZATION_JFD_TURKS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_TURKS_5'),
        ('CIVILIZATION_JFD_TURKS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_TURKS_6'),
        ('CIVILIZATION_JFD_TURKS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_TURKS_7'),
        ('CIVILIZATION_JFD_TURKS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_TURKS_8'),
        ('CIVILIZATION_JFD_TURKS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_TURKS_9'),
        ('CIVILIZATION_JFD_TURKS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_TURKS_10'),
        ('CIVILIZATION_JFD_TURKS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_TURKS_11'),
        ('CIVILIZATION_JFD_TURKS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_TURKS_12'),
        ('CIVILIZATION_JFD_TURKS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_TURKS_13'),
        ('CIVILIZATION_JFD_TURKS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_TURKS_14'),
        ('CIVILIZATION_JFD_TURKS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_TURKS_15'),
        ('CIVILIZATION_JFD_TURKS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_TURKS_16'),
        ('CIVILIZATION_JFD_TURKS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_TURKS_17'),
        ('CIVILIZATION_JFD_TURKS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_TURKS_18'),
        ('CIVILIZATION_JFD_TURKS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_TURKS_19'),
        ('CIVILIZATION_JFD_TURKS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_TURKS_20'),
        ('CIVILIZATION_JFD_TURKS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_TURKS_21'),
        ('CIVILIZATION_JFD_TURKS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_TURKS_22'),
        ('CIVILIZATION_JFD_TURKS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_TURKS_23'),
        ('CIVILIZATION_JFD_TURKS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_TURKS_24'),
        ('CIVILIZATION_JFD_TURKS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_TURKS_25');
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 					default null,
	PoliticsType  						text 														default null,
	UniqueName							text														default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,			PoliticsType, UniqueName)
SELECT	'CIVILIZATION_JFD_TURKS',	PoliticsType, UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_OTTOMAN';
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
VALUES	('LEADER_JFD_MEHMED_II',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 6),
		('LEADER_JFD_MEHMED_II',	'FLAVOR_JFD_REFORM_CULTURE',		 4),
		('LEADER_JFD_MEHMED_II',	'FLAVOR_JFD_REFORM_ECONOMIC',		 5),
		('LEADER_JFD_MEHMED_II',	'FLAVOR_JFD_REFORM_FOREIGN',		 7),
		('LEADER_JFD_MEHMED_II',	'FLAVOR_JFD_REFORM_INDUSTRY',		 5),
		('LEADER_JFD_MEHMED_II',	'FLAVOR_JFD_REFORM_MILITARY',		 7),
		('LEADER_JFD_MEHMED_II',	'FLAVOR_JFD_REFORM_RELIGION',		 6),
		('LEADER_JFD_MEHMED_II',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	 5);
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_Turks_Decisions.lua');
------------------------------	
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 					DefaultBuilding, 							Description, 								MaxPlayerInstances)
VALUES	('BUILDINGCLASS_DECISIONS_JFD_ENDERUN_ACADEMY', 'BUILDING_DECISIONS_JFD_ENDERUN_ACADEMY',	'TXT_KEY_DECISIONS_JFD_ENDERUN_ACADEMY',	1);
------------------------------
-- Buildings
------------------------------
INSERT INTO Buildings			
		(Type, 										BuildingClass, 			  						GreatGeneralRateModifier,	Cost, 	FaithCost,	Help,											Description, 								Civilopedia,									IconAtlas,		PortraitIndex,	NukeImmune, ConquestProb)
VALUES	('BUILDING_DECISIONS_JFD_ENDERUN_ACADEMY',	'BUILDINGCLASS_DECISIONS_JFD_ENDERUN_ACADEMY',  20,							-1, 	-1,			'TXT_KEY_DECISIONS_JFD_ENDERUN_ACADEMY_HELP',	'TXT_KEY_DECISIONS_JFD_ENDERUN_ACADEMY', 	'TXT_KEY_DECISIONS_JFD_ENDERUN_ACADEMY_PEDIA',	'TECH_ATLAS_1',	28,				1,			100);
------------------------------
-- Building_UnitCombatFreeExperiences
------------------------------
INSERT INTO Building_UnitCombatFreeExperiences
		(BuildingType,								UnitCombatType,			Experience)
VALUES	('BUILDING_DECISIONS_JFD_ENDERUN_ACADEMY', 'UNITCOMBAT_GUN',		10),
		('BUILDING_DECISIONS_JFD_ENDERUN_ACADEMY', 'UNITCOMBAT_MOUNTED',	10);
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_Turks_Events.lua');
--==========================================================================================================================
--==========================================================================================================================