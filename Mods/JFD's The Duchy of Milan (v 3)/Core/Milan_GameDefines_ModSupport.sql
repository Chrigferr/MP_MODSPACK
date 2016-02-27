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
        (LeaderType,				TraitOne,               TraitTwo)
VALUES  ('LEADER_JFD_VISCONTI', 	'POLICY_CHARISMATIC_X',	'POLICY_CREATIVE_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Visconti [ICON_HAPPINESS_1][ICON_CULTURE]'
WHERE Type = 'LEADER_JFD_VISCONTI'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GAZEBO COMMUNITY PATCH
--==========================================================================================================================
-- COMMUNITY
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
------------------------------
-- Buildings
------------------------------	
UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_PALAZZO_HELP_CBP'
WHERE Type = 'BUILDING_JFD_PALAZZO' 
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value = 1);
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_VENICE'
WHERE Type = 'CIVILIZATION_JFD_MILAN'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_VENICE');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,						X,		Y)
VALUES	('CIVILIZATION_JFD_MILAN',	19,		62);

CREATE TABLE IF NOT EXISTS MinorCiv_YagemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_YagemStartPosition WHERE Type = 'MINOR_CIV_MILAN';
INSERT INTO MinorCiv_YagemStartPosition
		(Type,						X,		Y)
VALUES	('MINOR_CIV_MILAN',			21,		60); -- San Marino
------------------------------------------------------------
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,						X,		Y)
VALUES	('CIVILIZATION_JFD_MILAN',	61,		56);

CREATE TABLE IF NOT EXISTS MinorCiv_YahemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_YahemStartPosition WHERE Type = 'MINOR_CIV_MILAN';
INSERT INTO MinorCiv_YahemStartPosition
		(Type,						X,		Y)
VALUES	('MINOR_CIV_MILAN',			62,		55); -- San Marino
------------------------------------------------------------
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,						X,		Y)
VALUES	('CIVILIZATION_JFD_MILAN',	32,		26);

CREATE TABLE IF NOT EXISTS MinorCiv_CordiformStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_CordiformStartPosition WHERE Type = 'MINOR_CIV_MILAN';
INSERT INTO MinorCiv_CordiformStartPosition
		(Type,						X,		Y)
VALUES	('MINOR_CIV_MILAN',			37,		25); -- San Marino
------------------------------------------------------------
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,						X,		Y)
VALUES	('CIVILIZATION_JFD_MILAN',	48,		47);

CREATE TABLE IF NOT EXISTS MinorCiv_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_GreatestEarthStartPosition WHERE Type = 'MINOR_CIV_MILAN';
INSERT INTO MinorCiv_GreatestEarthStartPosition
		(Type,						X,		Y)
VALUES	('MINOR_CIV_MILAN',			51,		44); -- San Marino
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
		(Type,						X,		Y)
VALUES	('CIVILIZATION_JFD_MILAN',	57,		49);

CREATE TABLE IF NOT EXISTS MinorCiv_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_EuroGiantStartPosition WHERE Type = 'MINOR_CIV_MILAN';
INSERT INTO MinorCiv_EuroGiantStartPosition
		(Type,						X,		Y)
VALUES	('MINOR_CIV_MILAN',			63,		41); -- San Marino
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
		(Type,						X,		Y)
VALUES	('CIVILIZATION_JFD_MILAN',	33,		37);

CREATE TABLE IF NOT EXISTS MinorCiv_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_EuroLargeStartPosition WHERE Type = 'MINOR_CIV_MILAN';
INSERT INTO MinorCiv_EuroLargeStartPosition
		(Type,						X,		Y)
VALUES	('MINOR_CIV_MILAN',			37,		34); -- San Marino
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
		(Type,						X,		Y)
VALUES	('CIVILIZATION_JFD_MILAN',	93,		24);

CREATE TABLE IF NOT EXISTS MinorCiv_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_NorthAtlanticStartPosition WHERE Type = 'MINOR_CIV_MILAN';
INSERT INTO MinorCiv_NorthAtlanticStartPosition
		(Type,						X,		Y)
VALUES	('MINOR_CIV_MILAN',			97,		24); -- San Marino
------------------------------------------------------------	
-- Civilizations_ApennineStartPosition (Apennine)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_ApennineStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_ApennineStartPosition
		(Type,						X,		Y)
VALUES	('CIVILIZATION_JFD_MILAN',	16,		63);

CREATE TABLE IF NOT EXISTS MinorCiv_ApennineStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_ApennineStartPosition WHERE Type = 'MINOR_CIV_MILAN';
INSERT INTO MinorCiv_ApennineStartPosition
		(Type,						X,		Y)
VALUES	('MINOR_CIV_MILAN',			29,		45); -- San Marino
------------------------------------------------------------	
-- Civilizations_MediterraneanStartPosition (Mediterranean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
		(Type,						X,		Y)
VALUES	('CIVILIZATION_JFD_MILAN',	35,		52);

CREATE TABLE IF NOT EXISTS MinorCiv_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_MediterraneanStartPosition WHERE Type = 'MINOR_CIV_MILAN';
INSERT INTO MinorCiv_MediterraneanStartPosition
		(Type,						X,		Y)
VALUES	('MINOR_CIV_MILAN',			43,		48); -- San Marino
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_MILAN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_MILAN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_MILAN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_MILAN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_MILAN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_ApennineRequestedResource (Apennine)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_ApennineRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_ApennineRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_MILAN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_ApennineRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_NorthAtlanticRequestedResource (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_MILAN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_MediterraneanRequestedResource (Mediterranean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MediterraneanRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_MILAN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_MediterraneanRequestedResource WHERE Type = 'CIVILIZATION_ROME';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,					CultureType,		CultureEra)
VALUES	('CIVILIZATION_JFD_MILAN',	'MEDITERRANEAN',	'ANY');
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
SELECT	'CIVILIZATION_JFD_MILAN',	LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_VENICE';
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
SELECT	'CIVILIZATION_JFD_MILAN',	ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_VENICE';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Southern'
WHERE Type = 'CIVILIZATION_JFD_MILAN'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Southern')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
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
		(LeaderType,				FlavorType,					Flavor)
VALUES	('LEADER_JFD_VISCONTI',		'FLAVOR_JFD_MERCENARY',		10);
------------------------------------------------------------	
-- Building_JFD_ContractModifiers
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_JFD_ContractModifiers (
	BuildingType 					text 	REFERENCES Buildings(Type)			default null,
	CostModifier 					integer 									default 0,
	MaintenanceModifier 			integer 									default 0,
	TurnsModifier 					integer 									default 0);

INSERT INTO Building_JFD_ContractModifiers 	
		(BuildingType, 				CostModifier)
VALUES	('BUILDING_JFD_MILAN',		-5);
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
VALUES	('LEADER_JFD_VISCONTI',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	5);
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
SELECT	'CIVILIZATION_JFD_MILAN',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_VENICE';
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
		(CivilizationType,			LegislatureName, 									OfficeTitle,												GovernmentType,				Weight)
VALUES	('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_LEGISLATURE_NAME_CIVILIZATION_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MILAN',	'GOVERNMENT_JFD_MONARCHY',	90);
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
VALUES  ('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_MILAN_1'),
        ('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_MILAN_2'),
        ('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_MILAN_3'),
        ('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_MILAN_4'),
        ('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_MILAN_5'),
        ('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_MILAN_6'),
        ('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_MILAN_7'),
        ('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_MILAN_8'),
        ('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_MILAN_9'),
        ('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_MILAN_10'),
        ('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_MILAN_11'),
        ('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_MILAN_12'),
        ('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_MILAN_13'),
        ('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_MILAN_14'),
        ('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_MILAN_15'),
        ('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_MILAN_16'),
        ('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_MILAN_17'),
        ('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_MILAN_18'),
        ('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_MILAN_19'),
        ('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_MILAN_20'),
        ('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_MILAN_21'),
        ('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_MILAN_22'),
        ('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_MILAN_23'),
        ('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_MILAN_24'),
        ('CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_MILAN_25');
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 					default null,
	PoliticsType  						text 														default null,
	UniqueName							text														default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,			PoliticsType,				UniqueName)
VALUES	('CIVILIZATION_JFD_MILAN',	'PARTY_JFD_LIBERTARIAN',	'TXT_KEY_JFD_PARTY_JFD_LIBERTARIAN_MILAN'),
		('CIVILIZATION_JFD_MILAN',	'PARTY_JFD_NOBILITY',		'TXT_KEY_JFD_PARTY_JFD_NOBILITY_MILAN'),
		('CIVILIZATION_JFD_MILAN',	'PARTY_JFD_REVOLUTIONARY',	'TXT_KEY_JFD_PARTY_JFD_REVOLUTIONARY_MILAN');
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
		(CivilizationType,			DefaultTitle,											UniqueTitle)
VALUES	('CIVILIZATION_JFD_MILAN',	'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER_MILAN'),	
		('CIVILIZATION_JFD_MILAN',	'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER_LATE',	'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER_MILAN');
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
		(LeaderType,			FlavorType,							Flavor)
VALUES	('LEADER_JFD_VISCONTI',	'FLAVOR_JFD_REFORM_GOVERNMENT',		2),
		('LEADER_JFD_VISCONTI',	'FLAVOR_JFD_REFORM_CULTURE',		2),
		('LEADER_JFD_VISCONTI',	'FLAVOR_JFD_REFORM_ECONOMIC',		1),
		('LEADER_JFD_VISCONTI',	'FLAVOR_JFD_REFORM_FOREIGN',		2),
		('LEADER_JFD_VISCONTI',	'FLAVOR_JFD_REFORM_INDUSTRY',		3),
		('LEADER_JFD_VISCONTI',	'FLAVOR_JFD_REFORM_MILITARY',		2),
		('LEADER_JFD_VISCONTI',	'FLAVOR_JFD_REFORM_RELIGION',		2);
--==========================================================================================================================
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- Units
------------------------------
INSERT OR REPLACE INTO Units 	
		(Type, 					Class,	PrereqTech,		Range, RangedCombat,	Combat,		FaithCost,		RequiresFaithPurchaseEnabled, Cost,		Moves, 	CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 						Strategy, 								Help, 								MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 				UnitFlagAtlas, 					UnitFlagIconOffset, PortraitIndex,	IconAtlas)
SELECT	'UNIT_JFD_RIBAULT', 	Class,	'TECH_BANKING',	Range, RangedCombat-13, Combat-13,	FaithCost+40,	RequiresFaithPurchaseEnabled, Cost+20,	Moves, 	CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_RIBAULT', 	'TXT_KEY_CIV5_JFD_RIBAULT_TEXT',	'TXT_KEY_UNIT_JFD_RIBAULT_STRATEGY_EE',	'TXT_KEY_UNIT_JFD_RIBAULT_HELP',	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_JFD_RIBAULT', 	'JFD_UNIT_FLAG_RIBAULT_ATLAS',	0,					3, 				'JFD_MILAN_ATLAS'
FROM Units WHERE Type = 'UNIT_EE_SKIRMISHER'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');	
--------------------------------
-- Unit_ClassUpgrades
--------------------------------	
DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_JFD_RIBAULT' 
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_RIBAULT',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_EE_SKIRMISHER'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
------------------------------
-- Civilization_UnitClassOverrides
------------------------------	
UPDATE Civilization_UnitClassOverrides
SET UnitClassType = 'UNITCLASS_EE_SKIRMISHER'
WHERE CivilizationType = 'CIVILIZATION_JFD_MILAN'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');	
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_Milan_Decisions.lua');
------------------------------	
-- Buildings
------------------------------	
INSERT INTO Buildings 
		(Type, 										BuildingClass, 				GreatWorkCount, Cost, 	FaithCost,	GoldMaintenance,	PrereqTech, NeverCapture,	Description, 										Help)
VALUES	('BUILDING_DECISIONS_JFD_LOMBARD_LEAGUE', 	'BUILDINGCLASS_JFD_MILAN',	-1,				-1, 	-1,			0,					null, 		1,				'TXT_KEY_BUILDING_DECISIONS_JFD_LOMBARD_LEAGUE',	'TXT_KEY_BUILDING_DECISIONS_JFD_LOMBARD_LEAGUE_HELP');
------------------------------	
-- Policies
------------------------------	
INSERT INTO Policies 
		(Type, 												Description)
VALUES	('POLICY_DECISIONS_JFD_MILAN_AMBROSIAN_REPUBLIC', 	'TXT_KEY_JFD_MILAN_AMBROSIAN_REPUBLIC_DESC');
------------------------------------------------------------
-- Policy_JFD_CivilizationNames
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Policy_JFD_CivilizationNames (
	PolicyType								text 	REFERENCES Policies(Type) 				default null,
	CivilizationType						text 	REFERENCES Civilizations(Type) 			default null,
	Description								text 											default null,
	ShortDescription						text 											default null,
	Adjective								text 											default null);
	
INSERT INTO Policy_JFD_CivilizationNames 	
		(PolicyType, 										CivilizationType,			Description,									ShortDescription)
VALUES	('POLICY_DECISIONS_JFD_MILAN_AMBROSIAN_REPUBLIC',	'CIVILIZATION_JFD_MILAN',	'TXT_KEY_JFD_MILAN_AMBROSIAN_REPUBLIC_DESC',	'TXT_KEY_JFD_MILAN_AMBROSIAN_REPUBLIC_SHORT_DESC');
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_Milan_Events.lua');	
------------------------------
-- Events_CulturalDevelopments
------------------------------
CREATE TABLE IF NOT EXISTS 
Events_CulturalDevelopments(
	CivilizationType		text  REFERENCES Civilizations(Type)	default null,
	CultureType				text									default null,
	Description				text									default null);

INSERT INTO Events_CulturalDevelopments 
		(Description,							CivilizationType)
VALUES	('TXT_KEY_EVENT_CULDEV_JFD_MILAN_01',	'CIVILIZATION_JFD_MILAN');
--==========================================================================================================================
--==========================================================================================================================