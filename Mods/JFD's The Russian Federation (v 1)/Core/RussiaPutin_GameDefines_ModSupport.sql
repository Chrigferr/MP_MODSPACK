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
        (LeaderType,            TraitOne,					TraitTwo)
VALUES  ('LEADER_JFD_PUTIN', 	'POLICY_CHARISMATIC_X',		'POLICY_FINANCIAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Putin [ICON_HAPPINESS_1][ICON_GOLD]'
WHERE Type = 'LEADER_JFD_PUTIN'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_RUSSIA'
WHERE Type = 'CIVILIZATION_JFD_RUSSIA_PUTIN'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_RUSSIA');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_RUSSIA_PUTIN',	34,		76);
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_RUSSIA_PUTIN',	70,		66);
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_RUSSIA_PUTIN',	43,		38);
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_RUSSIA_PUTIN',	60,		60);
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_RUSSIA_PUTIN',	108,	96);
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_RUSSIA_PUTIN',	52,		61);
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_RUSSIA_PUTIN',	94,		56);
------------------------------------------------------------	
-- Civilizations_AmericasStartPosition (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_RUSSIA_PUTIN',	20,		66);
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeStartPosition (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthWestEuropeStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_RUSSIA_PUTIN',	54,		43);
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_RUSSIA_PUTIN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_RUSSIA_PUTIN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_RUSSIA_PUTIN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_RUSSIA_PUTIN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_RUSSIA_PUTIN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilizations_AmericasRequestedResource (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AmericasRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_RUSSIA_PUTIN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AmericasRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilizations_NorthAtlanticRequestedResource (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_RUSSIA_PUTIN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeRequestedResource (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthWestEuropeRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_RUSSIA_PUTIN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthWestEuropeRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,							CultureType,	CultureEra)
VALUES	('CIVILIZATION_JFD_RUSSIA_PUTIN',	'SLAVIC',		'ANY');
--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 										text 											default null,
	Value 										integer 										default 1);
--==========================================================================================================================
-- JFD CLAIMS
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------	
INSERT OR REPLACE INTO Buildings 	
		(Type, 							BuildingProductionModifier, BuildingClass, Cost, GoldMaintenance, SpecialistType, SpecialistCount, PrereqTech, Description, 							Civilopedia, 							Help, 												Strategy,								 		ArtDefineTag, MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT	'BUILDING_JFD_STATE_ASSEMBLY',	BuildingProductionModifier, BuildingClass, Cost, GoldMaintenance, SpecialistType, SpecialistCount, PrereqTech, 'TXT_KEY_BUILDING_JFD_STATE_ASSEMBLY', 	'TXT_KEY_CIV5_JFD_STATE_ASSEMBLY_TEXT', 'TXT_KEY_BUILDING_JFD_STATE_ASSEMBLY_HELP_CLAIMS',	'TXT_KEY_BUILDING_JFD_STATE_ASSEMBLY_STRATEGY',	ArtDefineTag, MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, 3, 				'JFD_RUSSIA_PUTIN_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_JFD_HIGH_COURT'
AND EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_JFD_HIGH_COURT');

UPDATE Buildings
SET Cost = Cost+30, Strategy = 'TXT_KEY_BUILDING_JFD_STATE_ASSEMBLY_STRATEGY_LOYALTY'
WHERE Type = 'BUILDING_JFD_STATE_ASSEMBLY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_LOYALTY_CORE' AND Value = 1);	
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
DELETE FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_JFD_STATE_ASSEMBLY'
AND EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_JFD_HIGH_COURT');	
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
SELECT	'BUILDING_JFD_STATE_ASSEMBLY',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_JFD_HIGH_COURT';
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType,	Flavor)
SELECT	'BUILDING_JFD_STATE_ASSEMBLY',	FlavorType,	Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_JFD_HIGH_COURT'
AND EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_JFD_HIGH_COURT');	
------------------------------------------------------------
--Building_JFD_LoyaltyMods
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Building_JFD_LoyaltyMods (
	BuildingType  			text 		REFERENCES Buildings(Type) 		default null,
	GlobalLoyaltyMod		integer		default 0,	
	LoyaltyMod				integer		default 0);	
	
INSERT INTO Building_JFD_LoyaltyMods 	
		(BuildingType, 					LoyaltyMod)
SELECT	'BUILDING_JFD_STATE_ASSEMBLY',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_LOYALTY_CORE' AND Value = 1);
------------------------------
-- Civilization_BuildingClassOverrides
------------------------------	
UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_JFD_HIGH_COURT'
WHERE CivilizationType = 'CIVILIZATION_JFD_RUSSIA_PUTIN'
AND EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_JFD_HIGH_COURT');	
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
		(CivilizationType,					ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_RUSSIA_PUTIN',	ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Eastern'
WHERE Type = 'CIVILIZATION_JFD_RUSSIA_PUTIN'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Eastern')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
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
		(CivilizationType,					LinguisticType, ColonyName)
SELECT	'CIVILIZATION_JFD_RUSSIA_PUTIN',	LinguisticType, ColonyName
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--==========================================================================================================================	
-- JFD DYNAMIC TOP PANEL
--==========================================================================================================================			
-- JFD_TopPanelIncludes
------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_TopPanelIncludes (
	FileName				text		default null);
	
INSERT INTO JFD_TopPanelIncludes
		(FileName)
VALUES	('JFD_RussiaPutinDTP.lua');
------------------------------		
-- JFD_TopPanelAdditions
------------------------------		
CREATE TABLE IF NOT EXISTS 
	JFD_TopPanelAdditions (
	CivilizationType		text		REFERENCES Civilizations(Type) 	default null,
	YieldType  				text 										default null,
	YieldSourceFunction 	text										default null,
	YieldSourceToolTip		text										default	null,
	MiscToolTipFunction		text										default	null);
	
INSERT INTO JFD_TopPanelAdditions
		(CivilizationType,					YieldType,				YieldSourcefunction,								YieldSourceToolTip)
VALUES	('CIVILIZATION_JFD_RUSSIA_PUTIN',	'YIELD_GOLDEN_AGE',		'JFD_RussiaPutin_GoldenAgePointsFromHappiness',		'TXT_KEY_JFD_RUSSIA_PUTIN_GOLDEN_AGE_FROM_HAPPINESS');

INSERT INTO JFD_TopPanelAdditions
		(CivilizationType,					YieldType,				YieldSourcefunction,								YieldSourceToolTip)
VALUES	('CIVILIZATION_JFD_RUSSIA_PUTIN',	'YIELD_GOLDEN_AGE',		'JFD_RussiaPutin_GoldenAgePointsFromUnhappiness',	'TXT_KEY_JFD_RUSSIA_PUTIN_GOLDEN_AGE_FROM_UNHAPPINESS');
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
		(LeaderType,			FlavorType,					Flavor)
VALUES	('LEADER_JFD_PUTIN',	'FLAVOR_JFD_MERCENARY',		2);
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
		(LeaderType,			FlavorType,							Flavor)
VALUES	('LEADER_JFD_PUTIN',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	4);
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
SELECT	'CIVILIZATION_JFD_SAXONY',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_GERMANY';
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
		(CivilizationType,					LegislatureName, OfficeTitle, GovernmentType, Weight)
SELECT	'CIVILIZATION_JFD_RUSSIA_PUTIN',	LegislatureName, OfficeTitle, GovernmentType, Weight
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	HeadOfGovernmentName			text 		 												default null);

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,      			HeadOfGovernmentName)
VALUES  ('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_RUSSIA_PUTIN_1'),
        ('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_RUSSIA_PUTIN_1'),
        ('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_RUSSIA_PUTIN_1'),
        ('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_RUSSIA_PUTIN_1'),
        ('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_RUSSIA_PUTIN_1'),
        ('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_RUSSIA_PUTIN_1'),
        ('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_RUSSIA_PUTIN_1'),
        ('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_RUSSIA_PUTIN_1'),
        ('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_RUSSIA_PUTIN_1'),
        ('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_RUSSIA_PUTIN_1'),
        ('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_RUSSIA_PUTIN_1'),
        ('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_RUSSIA_PUTIN_1'),
        ('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_RUSSIA_PUTIN_1'),
        ('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_RUSSIA_PUTIN_1'),
        ('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_RUSSIA_PUTIN_1'),
        ('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_RUSSIA_PUTIN_1'),
        ('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_RUSSIA_PUTIN_1'),
        ('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_RUSSIA_PUTIN_1'),
        ('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_RUSSIA_PUTIN_1'),
        ('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_RUSSIA_PUTIN_1'),
        ('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_RUSSIA_PUTIN_1'),
        ('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_RUSSIA_PUTIN_1'),
        ('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_RUSSIA_PUTIN_1'),
        ('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_RUSSIA_PUTIN_1'),
        ('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_RUSSIA_PUTIN_1');
------------------------------------------------------------
-- Civilization_JFD_Titles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Titles (
	CivilizationType  				text 	REFERENCES Civilizations(Type) 							default null,
	CultureType						text 	 														default null,
	ReligionType					text 	REFERENCES Religions(Type) 								default null,
	DefaultTitle					text 		 													default null,
	UniqueTitle						text 		 													default null,
	UseAdjective					boolean															default 0);	

INSERT INTO Civilization_JFD_Titles
		(CivilizationType,					DefaultTitle,											UniqueTitle,														UseAdjective)
VALUES	('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_GOVERNMENT',		'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_GOVERNMENT_RUSSIA_PUTIN',	0),
		('CIVILIZATION_JFD_RUSSIA_PUTIN',	'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER_RUSSIA_PUTIN',		1);
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
SELECT	'CIVILIZATION_JFD_RUSSIA_PUTIN',	PoliticsType, UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
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
VALUES	('LEADER_JFD_PUTIN',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 7),
		('LEADER_JFD_PUTIN',	'FLAVOR_JFD_REFORM_CULTURE',		 8),
		('LEADER_JFD_PUTIN',	'FLAVOR_JFD_REFORM_ECONOMIC',		 2),
		('LEADER_JFD_PUTIN',	'FLAVOR_JFD_REFORM_FOREIGN',		 8),
		('LEADER_JFD_PUTIN',	'FLAVOR_JFD_REFORM_INDUSTRY',		 4),
		('LEADER_JFD_PUTIN',	'FLAVOR_JFD_REFORM_RELIGION',		 7);
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_RussiaPutin_Decisions.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies
		(Type, 													Description)
VALUES	('POLICY_DECISIONS_JFD_RUSSIA_PUTIN_BROADCASTING', 		'TXT_KEY_DECISIONS_JFD_RUSSIA_PUTIN_BROADCASTING'),
		('POLICY_DECISIONS_JFD_RUSSIA_PUTIN_IMPERIAL_THRONE',	'TXT_KEY_DECISIONS_JFD_RUSSIA_PUTIN_IMPERIAL_THRONE');
------------------------------
-- Policy_BuildingClassYieldChanges
------------------------------
INSERT INTO Policy_BuildingClassYieldChanges
		(PolicyType, 										BuildingClassType, 					YieldType, 			YieldChange)
VALUES	('POLICY_DECISIONS_JFD_RUSSIA_PUTIN_BROADCASTING', 	'BUILDINGCLASS_BROADCAST_TOWER', 	'YIELD_CULTURE',  	-1),
		('POLICY_DECISIONS_JFD_RUSSIA_PUTIN_BROADCASTING', 	'BUILDINGCLASS_BROADCAST_TOWER', 	'YIELD_FAITH', 		1),
		('POLICY_DECISIONS_JFD_RUSSIA_PUTIN_BROADCASTING', 	'BUILDINGCLASS_BROADCAST_TOWER', 	'YIELD_PRODUCTION', -1),
		('POLICY_DECISIONS_JFD_RUSSIA_PUTIN_BROADCASTING', 	'BUILDINGCLASS_BROADCAST_TOWER', 	'YIELD_SCIENCE',	1);
------------------------------
-- GreatWorks
------------------------------
INSERT INTO GreatWorks 
		(Type, 										GreatWorkClassType,		Description,									Image)
VALUES	('GREAT_WORK_EVENTS_JFD_RUSSIA_PUTIN', 		'GREAT_WORK_MUSIC',		'TXT_KEY_GREAT_WORK_EVENTS_JFD_RUSSIA_PUTIN',	'GreatMusician_Background.dds'),
		('GREAT_WORK_EVENTS_JFD_RUSSIA_PUTIN_ALT', 	'GREAT_WORK_MUSIC',		'TXT_KEY_GREAT_WORK_EVENTS_JFD_RUSSIA_PUTIN',	'GreatMusician_Background.dds');
------------------------------
-- Units
------------------------------
INSERT INTO Units 	
		(Type, 										Class, Cost, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, Description, ShowInPedia, UnitArtInfoEraVariation, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas, MoveRate)
SELECT	'UNIT_EVENTS_JFD_RUSSIA_PUTIN_MUSICIAN',	Class, Cost, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, Description,	0,			UnitArtInfoEraVariation, UnitArtInfo, 	UnitFlagIconOffset,	UnitFlagAtlas,	PortraitIndex, 	IconAtlas, MoveRate
FROM Units WHERE Type = 'UNIT_MUSICIAN';
------------------------------
-- UnitGameplay2DScripts
------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 									SelectionSound, FirstSelectionSound)
SELECT	'UNIT_EVENTS_JFD_RUSSIA_PUTIN_MUSICIAN', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MUSICIAN';
------------------------------
-- Unit_AITypes
------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 									UnitAIType)
SELECT	'UNIT_EVENTS_JFD_RUSSIA_PUTIN_MUSICIAN', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MUSICIAN';	
------------------------------
-- Unit_UniqueNames
------------------------------
INSERT INTO Unit_UniqueNames 
		(UnitType, 									UniqueName,										GreatWorkType)
VALUES	('UNIT_EVENTS_JFD_RUSSIA_PUTIN_MUSICIAN', 	'TXT_KEY_GREAT_PERSON_JFD_RUSSIA_PUTIN_DESC',	'GREAT_WORK_EVENTS_JFD_RUSSIA_PUTIN'),
		('UNIT_EVENTS_JFD_RUSSIA_PUTIN_MUSICIAN', 	'TXT_KEY_GREAT_PERSON_JFD_RUSSIA_PUTIN_DESC',	'GREAT_WORK_EVENTS_JFD_RUSSIA_PUTIN_ALT'),
		('UNIT_EVENTS_JFD_RUSSIA_PUTIN_MUSICIAN', 	'TXT_KEY_GREAT_PERSON_JFD_RUSSIA_PUTIN_DESC',	'GREAT_WORK_EVENTS_JFD_RUSSIA_PUTIN'),
		('UNIT_EVENTS_JFD_RUSSIA_PUTIN_MUSICIAN', 	'TXT_KEY_GREAT_PERSON_JFD_RUSSIA_PUTIN_DESC',	'GREAT_WORK_EVENTS_JFD_RUSSIA_PUTIN'),
		('UNIT_EVENTS_JFD_RUSSIA_PUTIN_MUSICIAN', 	'TXT_KEY_GREAT_PERSON_JFD_RUSSIA_PUTIN_DESC',	'GREAT_WORK_EVENTS_JFD_RUSSIA_PUTIN'),
		('UNIT_EVENTS_JFD_RUSSIA_PUTIN_MUSICIAN', 	'TXT_KEY_GREAT_PERSON_JFD_RUSSIA_PUTIN_DESC',	'GREAT_WORK_EVENTS_JFD_RUSSIA_PUTIN');
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_RussiaPutin_Events.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies
		(Type, 											Description)
VALUES	('POLICY_EVENTS_JFD_RUSSIA_PUTIN_EMO_PLAGUE', 	'TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_EMOS'),
		('POLICY_EVENTS_JFD_RUSSIA_PUTIN_OLIGARCH', 	'TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_OLIGARCHS');
------------------------------
-- Policy_BuildingClassYieldChanges
------------------------------
INSERT INTO Policy_BuildingClassYieldChanges
		(PolicyType, 									BuildingClassType, 			YieldType, 		YieldChange)
VALUES	('POLICY_EVENTS_JFD_RUSSIA_PUTIN_OLIGARCH', 	'BUILDINGCLASS_PALACE', 	'YIELD_GOLD',  	5);
------------------------------
-- Events_CulturalDevelopments
------------------------------
CREATE TABLE IF NOT EXISTS 
Events_CulturalDevelopments(
	CivilizationType		text  REFERENCES Civilizations(Type)	default null,
	CultureType				text									default null,
	Description				text									default null);

INSERT INTO Events_CulturalDevelopments 
		(Description,									CivilizationType)
VALUES	('TXT_KEY_EVENT_CULDEV_JFD_RUSSIA_PUTIN_01',	'CIVILIZATION_JFD_RUSSIA_PUTIN');
--==========================================================================================================================
--==========================================================================================================================