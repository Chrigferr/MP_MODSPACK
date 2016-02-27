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
VALUES  ('LEADER_JFD_JAMES',	'POLICY_FINANCIAL_X',	'POLICY_SEAFARING_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'James VI [ICON_TRADE][ICON_GREAT_PEOPLE]'
WHERE Type = 'LEADER_JFD_JAMES'
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
SET Help = 'TXT_KEY_BUILDING_JFD_COLLEGE_HELP_CBP'
WHERE Type = 'BUILDING_JFD_COLLEGE' 
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value = 1);
------------------------------
-- Buildings
------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_GrowthExtraYield (
	BuildingType 							text 	REFERENCES Buildings(Type) 		default null,
	YieldType 								text	REFERENCES Yields(Type) 		default null,
	Yield									text									default	null);
	
INSERT INTO Building_GrowthExtraYield 	
		(BuildingType, 				YieldType, Yield)
SELECT	'BUILDING_JFD_COLLEGE',		YieldType, Yield
FROM Building_GrowthExtraYield WHERE BuildingType = 'BUILDING_UNIVERSITY';	
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_ENGLAND'
WHERE Type = 'CIVILIZATION_JFD_SCOTLAND'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_ENGLAND');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,									X,		Y)
VALUES	('CIVILIZATION_JFD_SCOTLAND',			9,		77);
--------------------------------	
-- The Celts
--------------------------------	
UPDATE Civilizations_YagemStartPosition
SET	X = 12, Y = 71
WHERE Type = 'CIVILIZATION_CELTS';
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,									X,		Y)
VALUES	('CIVILIZATION_JFD_SCOTLAND',			55,		66);
--------------------------------	
-- The Celts
--------------------------------	
UPDATE Civilizations_YahemStartPosition
SET	X = 56, Y = 63
WHERE Type = 'CIVILIZATION_CELTS';
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,									X,		Y)
VALUES	('CIVILIZATION_JFD_SCOTLAND',			33,		36);

UPDATE Civilizations_CordiformStartPosition
SET	X = 34, Y = 33
WHERE Type = 'CIVILIZATION_CELTS';
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,									X,		Y)
VALUES	('CIVILIZATION_JFD_SCOTLAND',			38,		58);

UPDATE Civilizations_GreatestEarthStartPosition
SET	X = 40, Y = 54
WHERE Type = 'CIVILIZATION_CELTS';
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_JFD_SCOTLAND',			39,		88);

UPDATE Civilizations_EuroGiantStartPosition
SET	X = 43, Y = 75
WHERE Type = 'CIVILIZATION_CELTS';
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
		(Type,									X,		Y)
VALUES	('CIVILIZATION_JFD_SCOTLAND',			22,		56);

UPDATE Civilizations_EuroLargeStartPosition
SET	X = 26, Y = 50
WHERE Type = 'CIVILIZATION_CELTS';
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
		(Type,									X,		Y)
VALUES	('CIVILIZATION_JFD_SCOTLAND',			79,		36);

UPDATE Civilizations_NorthAtlanticStartPosition
SET	X = 83, Y = 32
WHERE Type = 'CIVILIZATION_CELTS';
------------------------------------------------------------	
-- Civilizations_AmericasStartPosition (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasStartPosition
		(Type,									X,		Y)
VALUES	('CIVILIZATION_JFD_SCOTLAND',			44,		39);
------------------------------------------------------------	
-- Civilizations_BritishIslesStartPosition (British Isles)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_BritishIslesStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_BritishIslesStartPosition
		(Type,									X,		Y)
VALUES	('CIVILIZATION_JFD_SCOTLAND',			32,		51);
	
UPDATE Civilizations_BritishIslesStartPosition
SET	X = 49, Y = 26
WHERE Type = 'CIVILIZATION_CELTS';
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeStartPosition (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthWestEuropeStartPosition
		(Type,									X,		Y)
VALUES	('CIVILIZATION_JFD_SCOTLAND',			14,		31);
--------------------------------	
-- The Celts
--------------------------------	
UPDATE Civilizations_NorthWestEuropeStartPosition
SET	X = 19, Y = 20
WHERE Type = 'CIVILIZATION_CELTS';
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_SCOTLAND',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_ENGLAND';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_SCOTLAND',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_ENGLAND';
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_SCOTLAND',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_ENGLAND';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_SCOTLAND',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_ENGLAND';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_SCOTLAND',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_ENGLAND';
------------------------------------------------------------	
-- Civilizations_AmericasRequestedResource (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AmericasRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_SCOTLAND',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AmericasRequestedResource WHERE Type = 'CIVILIZATION_ENGLAND';
------------------------------------------------------------	
-- Civilizations_BritishIslesRequestedResource (British Isles)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_BritishIslesRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_BritishIslesRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_SCOTLAND',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_BritishIslesRequestedResource WHERE Type = 'CIVILIZATION_ENGLAND';
------------------------------------------------------------	
-- Civilizations_NorthAtlanticRequestedResource (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_SCOTLAND',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE Type = 'CIVILIZATION_ENGLAND';
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeRequestedResource (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthWestEuropeRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_SCOTLAND',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthWestEuropeRequestedResource WHERE Type = 'CIVILIZATION_ENGLAND';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,						CultureType,	CultureEra)
VALUES	('CIVILIZATION_JFD_SCOTLAND',	'BRITISH',		'ANY');
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
		(CivilizationType, 				ColonyName,								LinguisticType)
VALUES	('CIVILIZATION_JFD_SCOTLAND',	null,									'JFD_Germanic'),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_01',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_02',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_03',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_04',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_05',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_06',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_07',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_08',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_09',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_10',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_11',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_12',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_13',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_14',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_15',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_16',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_17',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_18',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_19',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_20',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_21',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_22',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_23',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_24',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_25',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_26',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_27',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_28',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_29',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_30',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_31',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_32',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_33',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_34',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_35',	null),
		('CIVILIZATION_JFD_SCOTLAND',	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_36',	null);
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
SELECT	'CIVILIZATION_JFD_SCOTLAND', ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Western'
WHERE Type = 'CIVILIZATION_JFD_SCOTLAND'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Western')
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
		(LeaderType,			FlavorType,				 Flavor)
VALUES	('LEADER_JFD_JAMES',	'FLAVOR_JFD_MERCENARY',	 6);
--==========================================================================================================================	
-- JFD PIETY
--==========================================================================================================================			
-- Flavors
------------------------------	
INSERT INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------
-- Leader_Flavors
------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,								Flavor)
VALUES	('LEADER_JFD_JAMES',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		8);
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
		(CivilizationType,				CurrencyType)
SELECT	'CIVILIZATION_JFD_SCOTLAND',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
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
		(CivilizationType,				LegislatureName, OfficeTitle, GovernmentType, Weight)
SELECT	'CIVILIZATION_JFD_SCOTLAND',	LegislatureName, OfficeTitle, GovernmentType, Weight
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	HeadOfGovernmentName			text 		 												default null);

INSERT INTO Civilization_JFD_HeadsOfGovernment
		(CivilizationType,				HeadOfGovernmentName)
SELECT	'CIVILIZATION_JFD_SCOTLAND',	HeadOfGovernmentName
FROM Civilization_JFD_HeadsOfGovernment WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 					default null,
	PoliticsType  						text 														default null,
	UniqueName							text														default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,				PoliticsType, UniqueName)
SELECT	'CIVILIZATION_JFD_SCOTLAND',	PoliticsType, UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
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
VALUES	('LEADER_JFD_JAMES',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 7),
		('LEADER_JFD_JAMES',	'FLAVOR_JFD_REFORM_CULTURE',		 6),
		('LEADER_JFD_JAMES',	'FLAVOR_JFD_REFORM_ECONOMIC',		 3),
		('LEADER_JFD_JAMES',	'FLAVOR_JFD_REFORM_FOREIGN',		 3),
		('LEADER_JFD_JAMES',	'FLAVOR_JFD_REFORM_INDUSTRY',		 5),
		('LEADER_JFD_JAMES',	'FLAVOR_JFD_REFORM_MILITARY',		 5),
		('LEADER_JFD_JAMES',	'FLAVOR_JFD_REFORM_RELIGION',		 7);
--==========================================================================================================================
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- Units
------------------------------	
INSERT OR REPLACE INTO Units 	
		(Type, 					Class, PrereqTech, Combat, Cost, FaithCost,	RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 						Strategy, 									Help, 									MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex,  IconAtlas)
SELECT	'UNIT_JFD_HIGHLANDER',	Class, PrereqTech, Combat, Cost, FaithCost,	RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_HIGHLANDER',	'TXT_KEY_CIV5_JFD_HIGHLANDER_TEXT', 'TXT_KEY_UNIT_JFD_HIGHLANDER_EE_STRATEGY', 	'TXT_KEY_UNIT_HELP_JFD_HIGHLANDER_EE',	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_JFD_HIGHLANDER',	0,					'JFD_UNIT_FLAG_HIGHLANDER_ATLAS',	2, 				 'JFD_SCOTLAND_ATLAS'
FROM Units WHERE Type = 'UNIT_EE_LINE_INFANTRY'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------	
DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_JFD_HIGHLANDER'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_HIGHLANDER',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_EE_LINE_INFANTRY'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
------------------------------	
-- Civilization_UnitClassOverrides
------------------------------
UPDATE Civilization_UnitClassOverrides
SET UnitClassType = 'UNITCLASS_EE_LINE_INFANTRY'
WHERE CivilizationType = 'CIVILIZATION_JFD_SCOTLAND' AND UnitType = 'UNIT_JFD_HIGHLANDER'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_Scotland_Decisions.lua');
------------------------------------------------------------	
-- Religion_ReligiousText
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Religion_ReligiousText (	
	ReligionType  				text 		REFERENCES Religions(Type) 					default null,
	Text						text 		 											default null);

INSERT INTO Religion_ReligiousText
		(ReligionType,				Text)
VALUES	('RELIGION_BUDDHISM',		'TXT_KEY_RELIGION_BUDDHISM_HOLY_BOOK_DESC'),
		('RELIGION_CONFUCIANISM',	'TXT_KEY_RELIGION_CONFUCIANISM_HOLY_BOOK_DESC'),
		('RELIGION_HINDUISM',		'TXT_KEY_RELIGION_HINDUISM_HOLY_BOOK_DESC'),
		('RELIGION_JUDAISM',		'TXT_KEY_RELIGION_JUDAISM_HOLY_BOOK_DESC'),
		('RELIGION_SHINTO',			'TXT_KEY_RELIGION_SHINTO_HOLY_BOOK_DESC'),
		('RELIGION_SIKHISM',		'TXT_KEY_RELIGION_SIKHISM_HOLY_BOOK_DESC'),
		('RELIGION_TAOISM',			'TXT_KEY_RELIGION_TAOISM_HOLY_BOOK_DESC'),
		('RELIGION_ZOROASTRIANISM',	'TXT_KEY_RELIGION_ZOROASTRIANISM_HOLY_BOOK_DESC');

INSERT INTO Religion_ReligiousText
		(ReligionType,		Text)
SELECT	Type,	'			TXT_KEY_RELIGION_ATENISM_HOLY_BOOK_DESC'
FROM Religions WHERE Type IN ('RELIGION_ATENISM', 'RELIGION_JFD_ATENISM');
		
INSERT INTO Religion_ReligiousText
		(ReligionType,		Text)
SELECT	Type,	'			TXT_KEY_RELIGION_CHRISTIANITY_HOLY_BOOK_DESC'
FROM Religions WHERE Type IN ('RELIGION_CHRISTIANITY', 'RELIGION_ORTHODOXY', 'RELIGION_PROTESTANTISM', 'RELIGION_CHRISTIAN_ANGLICANISM', 'RELIGION_PROTESTANT_CALVINISM', 'RELIGION_PROTESTANT_METHODISM', 'RELIGION_PROTESTANT_BAPTIST');
	
INSERT INTO Religion_ReligiousText
		(ReligionType,		Text)
SELECT	Type,	'			TXT_KEY_RELIGION_HERMETICISM_HOLY_BOOK_DESC'
FROM Religions WHERE Type IN ('RELIGION_HERMETICISM');

INSERT INTO Religion_ReligiousText
		(ReligionType,		Text)
SELECT	Type,	'			TXT_KEY_RELIGION_ISLAM_HOLY_BOOK_DESC'
FROM Religions WHERE Type IN ('RELIGION_ISLAM', 'RELIGION_ISLAM_SHIA', 'RELIGION_ISLAM_IBADI');
		
INSERT INTO Religion_ReligiousText
		(ReligionType,		Text)
SELECT	Type,	'			TXT_KEY_RELIGION_MORMONISM_HOLY_BOOK_DESC'
FROM Religions WHERE Type IN ('RELIGION_MORMONISM');
------------------------------	
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 					DefaultBuilding, 							Description, 								MaxGlobalInstances, MaxPlayerInstances)
VALUES	('BUILDINGCLASS_DECISIONS_JFD_ROYAL_SOCIETY', 	'BUILDING_DECISIONS_DECISIONS_JFD_ROYAL_SOCIETY', 	'TXT_KEY_DECISIONS_DECISIONS_JFD_ROYAL_SOCIETY',   -1,					1);
------------------------------
-- Buildings
------------------------------
INSERT INTO Buildings			
		(Type, 										BuildingClass, 			  						Cost, 	FaithCost,	GreatWorkCount,	GlobalGreatPeopleRateModifier,	PrereqTech, Help,													Description, 										Civilopedia,											IconAtlas,		PortraitIndex,	NeverCapture)
VALUES	('BUILDING_DECISIONS_JFD_ROYAL_SOCIETY', 	'BUILDINGCLASS_DECISIONS_JFD_ROYAL_SOCIETY', 	-1, 	-1,			0,				20,								NULL, 		'TXT_KEY_BUILDING_DECISIONS_JFD_ROYAL_SOCIETY_HELP',	'TXT_KEY_BUILDING_DECISIONS_JFD_ROYAL_SOCIETY', 	'TXT_KEY_BUILDING_DECISIONS_JFD_ROYAL_SOCIETY_PEDIA',	'TECH_ATLAS_1',	25,				1);
------------------------------
-- Building_YieldChanges
------------------------------
INSERT INTO Building_YieldChanges 
		(BuildingType,								YieldType,			Yield) 
VALUES	('BUILDING_DECISIONS_JFD_ROYAL_SOCIETY',	'YIELD_SCIENCE',	2),
		('BUILDING_DECISIONS_JFD_ROYAL_SOCIETY',	'YIELD_GOLD',		2),
		('BUILDING_DECISIONS_JFD_ROYAL_SOCIETY',	'YIELD_CULTURE',	2);
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_Scotland_Events.lua');
------------------------------
-- Events_CulturalDevelopments
------------------------------
CREATE TABLE IF NOT EXISTS 
Events_CulturalDevelopments(
	CivilizationType		text  REFERENCES Civilizations(Type)	default null,
	CultureType				text									default null,
	Description				text									default null);

INSERT INTO Events_CulturalDevelopments 
		(Description,								CivilizationType,				CultureType)
VALUES	('TXT_KEY_EVENT_CULDEV_JFD_SCOTLAND_01',	'CIVILIZATION_JFD_SCOTLAND',	'JFD_Western');
--==========================================================================================================================
-- TOMATEKH HISTORICAL RELIGIONS
--==========================================================================================================================
-- Civilization_Religions
------------------------------
UPDATE Civilization_Religions 
SET ReligionType = 'RELIGION_PROTESTANT_CALVINISM'
WHERE CivilizationType = 'CIVILIZATION_JFD_SCOTLAND'
AND EXISTS (SELECT * FROM Religions WHERE Type = 'RELIGION_PROTESTANT_CALVINISM');
--==========================================================================================================================
-- WHOWARD's DLL
--==========================================================================================================================
-- CustomModOptions
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name, Value);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_UNIT_CREATED', 1);
--==========================================================================================================================
--==========================================================================================================================