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
        (LeaderType,			TraitOne,				TraitTwo)
VALUES  ('LEADER_JFD_VACLAV',	'POLICY_PHILOSOPHICAL_X',	'POLICY_PROTECTIVE_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Vaclav II [ICON_GREAT_PEOPLE][ICON_STRENGTH]'
WHERE Type = 'LEADER_JFD_VACLAV'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_AUSTRIA'
WHERE Type = 'CIVILIZATION_JFD_BOHEMIA'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_AUSTRIA');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
CREATE TABLE IF NOT EXISTS MinorCiv_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,							X,		Y)
SELECT	'CIVILIZATION_JFD_BOHEMIA',		X,		Y
FROM MinorCiv_YagemStartPosition WHERE Type = 'MINOR_CIV_PRAGUE';

DELETE FROM MinorCiv_YagemStartPosition WHERE Type IN ('MINOR_CIV_PRAGUE');
INSERT INTO MinorCiv_YagemStartPosition
		(Type,							X,		Y)
VALUES	('MINOR_CIV_PRAGUE',			20,		61); -- Padua
------------------------------
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
CREATE TABLE IF NOT EXISTS MinorCiv_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,							X,		Y)
SELECT	'CIVILIZATION_JFD_BOHEMIA',		X,		Y
FROM MinorCiv_YagemStartPosition WHERE Type = 'MINOR_CIV_PRAGUE';

DELETE FROM MinorCiv_YahemStartPosition WHERE Type IN ('MINOR_CIV_PRAGUE');
INSERT INTO MinorCiv_YahemStartPosition
		(Type,							X,		Y)
VALUES	('MINOR_CIV_PRAGUE',			62,		66); -- Padua
------------------------------
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
CREATE TABLE IF NOT EXISTS MinorCiv_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,							X,		Y)
SELECT	'CIVILIZATION_JFD_BOHEMIA',		X,		Y
FROM MinorCiv_YagemStartPosition WHERE Type = 'MINOR_CIV_PRAGUE';

DELETE FROM MinorCiv_CordiformStartPosition WHERE Type IN ('MINOR_CIV_PRAGUE');
INSERT INTO MinorCiv_CordiformStartPosition
		(Type,							X,		Y)
VALUES	('MINOR_CIV_PRAGUE',			37,		26); -- Padua
------------------------------
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
CREATE TABLE IF NOT EXISTS MinorCiv_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,							X,		Y)
SELECT	'CIVILIZATION_JFD_BOHEMIA',		X,		Y
FROM MinorCiv_YagemStartPosition WHERE Type = 'MINOR_CIV_PRAGUE';

DELETE FROM MinorCiv_GreatestEarthStartPosition WHERE Type IN ('MINOR_CIV_PRAGUE');
INSERT INTO MinorCiv_GreatestEarthStartPosition
		(Type,							X,		Y)
VALUES	('MINOR_CIV_PRAGUE',			51,		46); -- Padua
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
CREATE TABLE IF NOT EXISTS MinorCiv_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
		(Type,							X,		Y)
SELECT	'CIVILIZATION_JFD_BOHEMIA',		X,		Y
FROM MinorCiv_YagemStartPosition WHERE Type = 'MINOR_CIV_PRAGUE';

DELETE FROM MinorCiv_EuroGiantStartPosition WHERE Type IN ('MINOR_CIV_PRAGUE');
INSERT INTO MinorCiv_EuroGiantStartPosition
		(Type,							X,		Y)
VALUES	('MINOR_CIV_PRAGUE',			62,		44);
------------------------------
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
CREATE TABLE IF NOT EXISTS MinorCiv_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
		(Type,							X,		Y)
SELECT	'CIVILIZATION_JFD_BOHEMIA',		X,		Y
FROM MinorCiv_YagemStartPosition WHERE Type = 'MINOR_CIV_PRAGUE';

DELETE FROM MinorCiv_EuroLargeStartPosition WHERE Type IN ('MINOR_CIV_PRAGUE');
INSERT INTO MinorCiv_EuroLargeStartPosition
		(Type,							X,		Y)
VALUES	('MINOR_CIV_PRAGUE',			35,		36);
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
CREATE TABLE IF NOT EXISTS MinorCiv_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthWestEuropeStartPosition
		(Type,							X,		Y)
SELECT	'CIVILIZATION_JFD_BOHEMIA',		X,		Y
FROM MinorCiv_NorthWestEuropeStartPosition WHERE Type = 'MINOR_CIV_PRAGUE';
DELETE FROM MinorCiv_NorthWestEuropeStartPosition WHERE Type IN ('MINOR_CIV_PRAGUE');
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
CREATE TABLE IF NOT EXISTS MinorCiv_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
		(Type,							X,		Y)
SELECT	'CIVILIZATION_JFD_BOHEMIA',		X,		Y
FROM MinorCiv_YagemStartPosition WHERE Type = 'MINOR_CIV_PRAGUE';

DELETE FROM MinorCiv_NorthAtlanticStartPosition WHERE Type IN ('MINOR_CIV_PRAGUE');
INSERT INTO MinorCiv_NorthAtlanticStartPosition
		(Type,							X,		Y)
VALUES	('MINOR_CIV_PRAGUE',			96,		24);
------------------------------------------------------------	
-- Civilizations_ApennineStartPosition (Apennine)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_ApennineStartPosition(Type, X, Y, AltX, AltY);
CREATE TABLE IF NOT EXISTS MinorCiv_ApennineStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_ApennineStartPosition
		(Type,							X,		Y)
SELECT	'CIVILIZATION_JFD_BOHEMIA',		X,		Y
FROM MinorCiv_YagemStartPosition WHERE Type = 'MINOR_CIV_PRAGUE';

DELETE FROM MinorCiv_ApennineStartPosition WHERE Type IN ('MINOR_CIV_PRAGUE');
INSERT INTO MinorCiv_ApennineStartPosition
		(Type,							X,		Y)
VALUES	('MINOR_CIV_PRAGUE',			27,		51);
------------------------------------------------------------	
-- Civilizations_MediterraneanStartPosition (Mediterranean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
CREATE TABLE IF NOT EXISTS MinorCiv_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
		(Type,							X,		Y)
SELECT	'CIVILIZATION_JFD_BOHEMIA',		X,		Y
FROM MinorCiv_YagemStartPosition WHERE Type = 'MINOR_CIV_PRAGUE';

DELETE FROM MinorCiv_MediterraneanStartPosition WHERE Type IN ('MINOR_CIV_PRAGUE');
INSERT INTO MinorCiv_MediterraneanStartPosition
		(Type,							X,		Y)
VALUES	('MINOR_CIV_PRAGUE',			41,		50);
------------------------------
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_BOHEMIA',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_BOHEMIA',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_BOHEMIA',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------
-- Civilizations_EuroLargeRequestedResource (Europe Large)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_BOHEMIA',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------	
-- Civilizations_ApennineRequestedResource (Apennine)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_ApennineRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_ApennineRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_BOHEMIA',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_ApennineRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------	
-- Civilizations_MediterraneanRequestedResource (Mediterranean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MediterraneanRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_BOHEMIA',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_MediterraneanRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,						CultureType,	CultureEra)
VALUES	('CIVILIZATION_JFD_BOHEMIA',	'GERMANIC',		'ANY');
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
		(CivilizationType,			 ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_BOHEMIA',  ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_AUSTRIA';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Central'
WHERE Type = 'CIVILIZATION_JFD_BOHEMIA'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Central')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
------------------------------
-- MinorCivilization_JFD_CultureTypes
------------------------------	
CREATE TABLE IF NOT EXISTS 
MinorCivilization_JFD_CultureTypes(
	MinorCivilizationType 						text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null);

UPDATE MinorCivilization_JFD_CultureTypes 
SET CultureType = 'JFD_Southern'
WHERE MinorCivilizationType = 'MINOR_CIV_PRAGUE';
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
		(CivilizationType,			LinguisticType)
SELECT	'CIVILIZATION_JFD_BOHEMIA',	LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_AUSTRIA';
--==========================================================================================================================	
-- JFD PIETY
--==========================================================================================================================
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,							 Flavor)
VALUES	('LEADER_JFD_VACLAV',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	 0);
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
		(CivilizationType,			CurrencyType)
SELECT	'CIVILIZATION_JFD_BOHEMIA',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_AUSTRIA';
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
VALUES	('LEADER_JFD_VACLAV',	'FLAVOR_JFD_MERCENARY',	 5);
--==========================================================================================================================	
-- JFD SOVEREIGNTY
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
		(CivilizationType,				GovernmentType,				Weight)
VALUES	('CIVILIZATION_JFD_BOHEMIA',	'GOVERNMENT_JFD_MONARCHY',	70);
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
		(LeaderType,			FlavorType,							 Flavor)
VALUES	('LEADER_JFD_VACLAV',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 3),
		('LEADER_JFD_VACLAV',	'FLAVOR_JFD_REFORM_CULTURE',		 4),
		('LEADER_JFD_VACLAV',	'FLAVOR_JFD_REFORM_ECONOMIC',		 5),
		('LEADER_JFD_VACLAV',	'FLAVOR_JFD_REFORM_FOREIGN',		 5),
		('LEADER_JFD_VACLAV',	'FLAVOR_JFD_REFORM_INDUSTRY',		 5),
		('LEADER_JFD_VACLAV',	'FLAVOR_JFD_REFORM_MILITARY',		 5),
		('LEADER_JFD_VACLAV',	'FLAVOR_JFD_REFORM_RELIGION',		 2);
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_Bohemia_Decisions.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies 
		(Type,										Description) 
VALUES	('POLICY_DECISIONS_JFD_BOHEMIA_SILVER',		'TXT_KEY_DECISIONS_JFD_BOHEMIA_GROSCHEN');
------------------------------
-- Policy_BuildingClassYieldModifiers
------------------------------
INSERT INTO Policy_BuildingClassYieldModifiers 
		(PolicyType,								BuildingClassType,		YieldType,		YieldMod) 
VALUES	('POLICY_DECISIONS_JFD_BOHEMIA_SILVER',		'BUILDINGCLASS_MINT',	'YIELD_GOLD',	10);
------------------------------	
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 												DefaultBuilding, 								Description)
VALUES	('BUILDINGCLASS_DECISIONS_JFD_PRAGUE_RENOVATION', 	'BUILDING_DECISIONS_JFD_PRAGUE_RENOVATION', 	'TXT_KEY_DECISIONS_JFD_BOHEMIA_RENOVATIONS');
------------------------------	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 											BuildingClass, 										GreatWorkSlotType,					GreatWorkCount,	Cost, FaithCost,  NukeImmune,	ConquestProb,	Description, 							Help,										IconAtlas,				PortraitIndex)
VALUES	('BUILDING_DECISIONS_JFD_PRAGUE_RENOVATION',	'BUILDINGCLASS_DECISIONS_JFD_PRAGUE_RENOVATION', 	'GREAT_WORK_SLOT_ART_ARTIFACT',		1,				-1,   -1, 		  1,			100,			'TXT_KEY_BUILDING_JFD_RENOVATIONS', 	'TXT_KEY_BUILDING_JFD_RENOVATIONS_HELP',	'JFD_BOHEMIA_ATLAS',	2);
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_Bohemia_Events.lua');
------------------------------
-- Events_CulturalDevelopments
------------------------------
CREATE TABLE IF NOT EXISTS 
Events_CulturalDevelopments(
	CivilizationType		text  REFERENCES Civilizations(Type)	default null,
	CultureType				text									default null,
	Description				text									default null);

INSERT INTO Events_CulturalDevelopments 
		(Description,							CivilizationType,			CultureType)
VALUES	('TXT_KEY_EVENT_CULDEV_JFD_BOHEMIA_01',	'CIVILIZATION_JFD_BOHEMIA',	'JFD_Central');
--==========================================================================================================================
-- TOMATEKH HISTORICAL RELIGIONS
--==========================================================================================================================
-- Civilization_Religions
------------------------------
UPDATE Civilization_Religions 
SET ReligionType = 'RELIGION_HUSSITISM'
WHERE CivilizationType = 'CIVILIZATION_JFD_BOHEMIA'
AND EXISTS (SELECT * FROM Religions WHERE Type = 'RELIGION_HUSSITISM');
--==========================================================================================================================
--==========================================================================================================================