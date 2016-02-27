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
VALUES ('LEADER_JFD_ALEXIOS',	'POLICY_PROTECTIVE_X',	'POLICY_SPIRITUAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Alexios I Komnenos [ICON_STRENGTH][ICON_PEACE]'
WHERE Type = 'LEADER_JFD_ALEXIOS'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_BYZANTIUM'
WHERE Type = 'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_BYZANTIUM');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,									X,	Y)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	X,	Y
FROM Civilizations_YagemStartPosition WHERE Type = 'CIVILIZATION_BYZANTIUM';
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,									X,	Y)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	X,	Y
FROM Civilizations_YahemStartPosition WHERE Type = 'CIVILIZATION_BYZANTIUM';
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,									X,	Y)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	X,	Y
FROM Civilizations_CordiformStartPosition WHERE Type = 'CIVILIZATION_BYZANTIUM';
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,									X,	Y)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	X,	Y
FROM Civilizations_GreatestEarthStartPosition WHERE Type = 'CIVILIZATION_BYZANTIUM';
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
		(Type,									X,	Y)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	X,	Y
FROM Civilizations_EuroGiantStartPosition WHERE Type = 'CIVILIZATION_BYZANTIUM';
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
		(Type,									X,	Y)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	X,	Y
FROM Civilizations_EuroLargeStartPosition WHERE Type = 'CIVILIZATION_BYZANTIUM';
------------------------------------------------------------	
-- Civilizations_MediterraneanStartPosition (Mediterranean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
		(Type,									X,	Y)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	X,	Y
FROM Civilizations_MediterraneanStartPosition WHERE Type = 'CIVILIZATION_BYZANTIUM';
------------------------------------------------------------	
-- Civilizations_MesopotamiaStartPosition (Mesopotamia)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MesopotamiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MesopotamiaStartPosition
		(Type,									X,	Y)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	X,	Y
FROM Civilizations_MesopotamiaStartPosition WHERE Type = 'CIVILIZATION_BYZANTIUM';
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_BYZANTIUM';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_BYZANTIUM';
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_BYZANTIUM';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
		(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_BYZANTIUM';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
		(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_BYZANTIUM';
------------------------------------------------------------	
-- Civilizations_MediterraneanRequestedResource (Mediterranean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MediterraneanRequestedResource
		(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_MediterraneanRequestedResource WHERE Type = 'CIVILIZATION_BYZANTIUM';
------------------------------------------------------------	
-- Civilizations_MesopotamiaRequestedResource (Mesopotamia)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MesopotamiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MesopotamiaRequestedResource
		(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_MesopotamiaRequestedResource WHERE Type = 'CIVILIZATION_BYZANTIUM';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,								CultureType,		CultureEra)
VALUES	('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'MEDITERRANEAN',	'ANY');
--==========================================================================================================================
-- JFD COLONIES
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
		(CivilizationType, 						ColonyName,								LinguisticType)
VALUES	('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	null,									'JFD_Hellenic'),
		('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_COLONY_NAME_JFD_BYZANTIUM_01', null);
------------------------------	
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 						text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 			text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
		(CivilizationType,							RevolutionaryCivilizationType)
VALUES	('CIVILIZATION_BYZANTIUM',					'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'),
		('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',		'CIVILIZATION_BYZANTIUM');
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
		(CivilizationType,						ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_BYZANTIUM';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Eastern'
WHERE Type = 'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Eastern');
--==========================================================================================================================	
-- JFD AND POUAKAI MERCENARIES
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
		(LeaderType,			FlavorType,				 Flavor)
VALUES	('LEADER_JFD_ALEXIOS',	'FLAVOR_JFD_MERCENARY',	 6);
--==========================================================================================================================	
-- JFD PIETY
--==========================================================================================================================	
-- JFD_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 											text 										default null,
	Value 											integer 									default 1);
------------------------------			
-- Flavors
------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------
-- Leader_Flavors
------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,								Flavor)
VALUES	('LEADER_JFD_ALEXIOS',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		7);
--==========================================================================================================================
-- JFD PROSPERITY
--==========================================================================================================================
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Currencies (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 	default null,
	CurrencyType	  				text 		  								default null);

INSERT INTO Civilization_JFD_Currencies	
		(CivilizationType,						CurrencyType)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_BYZANTIUM';
--==========================================================================================================================	
-- JFD SOVEREIGNTY
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
		(CivilizationType,					  LegislatureName,													OfficeTitle,															GovernmentType, 			Weight)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS', 'TXT_KEY_JFD_LEGISLATURE_NAME_CIVILIZATION_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_BYZANTIUM_ALEXIOS',	'GOVERNMENT_JFD_MONARCHy', 	80
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_BYZANTIUM';
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
VALUES  ('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_1'),
        ('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_2'),
        ('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_3'),
        ('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_4'),
        ('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_5'),
        ('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_6'),
        ('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_7'),
        ('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_8'),
        ('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_9'),
        ('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_10'),
        ('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_11'),
        ('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_12'),
        ('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_13'),
        ('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_14'),
        ('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_15'),
        ('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_16'),
        ('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_17'),
        ('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_18'),
        ('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_19'),
        ('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_20'),
        ('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_21'),
        ('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_22'),
        ('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_23'),
        ('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_24'),
        ('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_25');
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
SELECT	'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	DefaultTitle,	UniqueTitle
FROM Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_BYZANTIUM';
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 					default null,
	PoliticsType  						text 														default null,
	UniqueName							text														default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,						PoliticsType, UniqueName)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	PoliticsType, UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_BYZANTIUM';
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
		('FLAVOR_JFD_REFORM_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,							 Flavor)
VALUES	('LEADER_JFD_ALEXIOS',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 4),
		('LEADER_JFD_ALEXIOS',	'FLAVOR_JFD_REFORM_CULTURE',		 5),
		('LEADER_JFD_ALEXIOS',	'FLAVOR_JFD_REFORM_ECONOMIC',		 3),
		('LEADER_JFD_ALEXIOS',	'FLAVOR_JFD_REFORM_FOREIGN',		 2),
		('LEADER_JFD_ALEXIOS',	'FLAVOR_JFD_REFORM_INDUSTRY',		 5),
		('LEADER_JFD_ALEXIOS',	'FLAVOR_JFD_REFORM_MILITARY',		 5),
		('LEADER_JFD_ALEXIOS',	'FLAVOR_JFD_REFORM_RELIGION',		 5);
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_ByzantiumAlexios_Decisions.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies
		(Type,													Description,														HappinessPerGarrisonedUnit)
VALUES	('POLICY_DECISIONS_JFD_REFORM_THEMATIC_SYSTEM',			'TXT_KEY_DECISIONS_JFD_BYZANTIUM_ALEXIOS_REFORM_THEMATIC_SYSTEM',	2);
------------------------------
-- Policy_BuildingClassTourismModifiers
------------------------------
INSERT INTO Policy_BuildingClassTourismModifiers
		(PolicyType, 												BuildingClassType,			TourismModifier)
VALUES	('POLICY_DECISIONS_JFD_BYZANTIUM_RENOVATE_THE_CAPITAL', 	'BUILDINGCLASS_PALACE',		15);
------------------------------
-- Policy_BuildingClassYieldChanges
------------------------------
INSERT INTO Policy_BuildingClassYieldChanges
		(PolicyType, 												BuildingClassType,			YieldType,			YieldChange)
VALUES	('POLICY_DECISIONS_JFD_BYZANTIUM_RENOVATE_THE_CAPITAL', 	'BUILDINGCLASS_GARDEN',		'YIELD_CULTURE',	2);
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_ByzantiumAlexios_Events.lua');
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
VALUES	('TXT_KEY_EVENT_CULDEV_JFD_BYZANTIUM_ALEXIOS_01',	'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'JFD_Eastern');
--==========================================================================================================================
-- WHOWARD's DLL
--==========================================================================================================================
-- CustomModOptions
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name, Value);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_GOLDEN_AGE', 1);
--==========================================================================================================================
--==========================================================================================================================