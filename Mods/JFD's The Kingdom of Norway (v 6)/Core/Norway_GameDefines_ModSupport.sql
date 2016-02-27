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
        (LeaderType,			TraitOne,               TraitTwo)
VALUES  ('LEADER_JFD_HAAKON', 	'POLICY_SEAFARING_X',	'POLICY_FINANCIAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Haakon IV [ICON_GREAT_EXPLORER][ICON_TRADE]'
WHERE Type = 'LEADER_JFD_HAAKON'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GAZEBO COMMUNITY PATCH
--==========================================================================================================================
-- Trait_ResourceYieldChanges
--------------------------------	
CREATE TABLE IF NOT EXISTS Trait_ResourceYieldChanges (
	TraitType  				text 		REFERENCES Traits(Type) 					default null,
	ResourceType			text 		REFERENCES Resources(Type) 					default null,
	YieldType				text 		 											default null,
	Yield					text 		 											default null);	
	
INSERT INTO Trait_ResourceYieldChanges 
		(TraitType, 			ResourceType, 		YieldType,		Yield)
VALUES	('TRAIT_JFD_NORWAY', 	'RESOURCE_FISH', 	'YIELD_GOLD',	1);	
--==========================================================================================================================
-- GAZEBO COMMUNITY BALANCE PATCH
--==========================================================================================================================
-- COMMUNITY
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
------------------------------
-- Buildings
------------------------------	
UPDATE Buildings 
SET Help = 'TXT_KEY_BUILDING_JFD_STAVE_CHURCH_HELP_CBP'
WHERE Type = 'BUILDING_JFD_STAVE_CHURCH'
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value = 1);
------------------------------
-- Civilization_UnitClassOverrides
------------------------------	
DELETE FROM Civilization_UnitClassOverrides WHERE UnitType = 'UNIT_JFD_LONGBOAT'
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_LEADERS' AND Value = 1);
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_DENMARK'
WHERE Type = 'CIVILIZATION_JFD_NORWAY'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_DENMARK');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,								X,	Y)
VALUES	('CIVILIZATION_JFD_NORWAY',			20,	80);
------------------------------
-- Civilizations_YahemStartPosition 
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,								X,	Y)
VALUES	('CIVILIZATION_JFD_NORWAY',			63,	66);
------------------------------
-- Civilizations_CordiformStartPosition 
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,								X,	Y)
VALUES	('CIVILIZATION_JFD_NORWAY',			38,	38);
------------------------------
-- Civilizations_GreatestEarthStartPosition 
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,								X,	Y)
VALUES	('CIVILIZATION_JFD_NORWAY',			47,	63);
------------------------------
-- Civilizations_EuroGiantStartPosition
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
		(Type,								X,	Y)
VALUES	('CIVILIZATION_JFD_NORWAY',			70,	96);
------------------------------
-- Civilizations_EuroLargeStartPosition 
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
		(Type,								X,	Y)
VALUES	('CIVILIZATION_JFD_NORWAY',			35,	63);
------------------------------
-- Civilizations_NorthAtlanticStartPosition 
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
		(Type,								X,	Y)
VALUES	('CIVILIZATION_JFD_NORWAY',			84,	47);
------------------------------
-- Civilizations_AmericasStartPosition 
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasStartPosition
		(Type,								X,	Y)
VALUES	('CIVILIZATION_JFD_NORWAY',			53,	63);
------------------------------
-- Civilizations_BritishIslesStartPosition 
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_BritishIslesStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_BritishIslesStartPosition
		(Type,								X,	Y)
VALUES	('CIVILIZATION_JFD_NORWAY',			61,	62);
------------------------------
-- Civilizations_NorthWestEuropeStartPosition
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthWestEuropeStartPosition
		(Type,								X,	Y)
VALUES	('CIVILIZATION_JFD_NORWAY',			33,	40);
------------------------------
-- Civilizations_YagemRequestedResource 
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 						Req1,				Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_NORWAY',	'RESOURCE_FISH',	1,		Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------
-- Civilizations_YahemRequestedResource 
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 						Req1,				Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_NORWAY',	'RESOURCE_FISH',	1,		Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------
-- Civilizations_GreatestEarthRequestedResource 
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 						Req1,				Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_NORWAY',	'RESOURCE_FISH',	1,		Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------
-- Civilizations_EuroLargeRequestedResource
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
		(Type, 						Req1,				Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_NORWAY',	'RESOURCE_FISH',	1,		Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------
-- Civilizations_EuroLargeRequestedResource 
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
		(Type, 						Req1,				Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_NORWAY',	'RESOURCE_FISH',	1,		Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------
-- Civilizations_AmericasRequestedResource 
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AmericasRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AmericasRequestedResource
		(Type, 						Req1,				Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_NORWAY',	'RESOURCE_FISH',	1,		Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AmericasRequestedResource WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------
-- Civilizations_NorthAtlanticRequestedResource 
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
		(Type, 						Req1,				Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_NORWAY',	'RESOURCE_FISH',	1,		Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------
-- Civilizations_BritishIslesRequestedResource 
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_BritishIslesRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_BritishIslesRequestedResource
		(Type, 						Req1,				Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_NORWAY',	'RESOURCE_FISH',	1,		Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_BritishIslesRequestedResource WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------
-- Civilizations_NorthWestEuropeRequestedResource
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthWestEuropeRequestedResource
		(Type, 						Req1,				Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_NORWAY',	'RESOURCE_FISH',	1,		Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthWestEuropeRequestedResource WHERE Type = 'CIVILIZATION_DENMARK';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,					CultureType,	CultureEra)
VALUES	('CIVILIZATION_JFD_NORWAY',	'GERMANIC',		'ANY');
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
VALUES	('CIVILIZATION_JFD_NORWAY', 	null,									'JFD_Germanic'),
		('CIVILIZATION_JFD_NORWAY', 	null,									'JFD_Finno_Ugric'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_COLONY_NAME_JFD_NORWAY_01',	null),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_COLONY_NAME_JFD_NORWAY_02',	null),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_COLONY_NAME_JFD_NORWAY_03',	null),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_COLONY_NAME_JFD_NORWAY_04',	null),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_COLONY_NAME_JFD_NORWAY_05',	null),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_COLONY_NAME_JFD_NORWAY_06',	null),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_COLONY_NAME_JFD_NORWAY_07',	null),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_COLONY_NAME_JFD_NORWAY_08',	null),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_COLONY_NAME_JFD_NORWAY_09',	null),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_COLONY_NAME_JFD_NORWAY_10',	null),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_COLONY_NAME_JFD_NORWAY_11',	null),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_COLONY_NAME_JFD_NORWAY_12',	null),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_COLONY_NAME_JFD_NORWAY_13',	null),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_COLONY_NAME_JFD_NORWAY_14',	null),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_COLONY_NAME_JFD_NORWAY_15',	null),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_COLONY_NAME_JFD_NORWAY_16',	null),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_COLONY_NAME_JFD_NORWAY_17',	null),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_COLONY_NAME_JFD_NORWAY_18',	null),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_COLONY_NAME_JFD_NORWAY_19',	null),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_COLONY_NAME_JFD_NORWAY_20',	null),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_COLONY_NAME_JFD_NORWAY_21',	null);
------------------------------
-- Unit_FreePromotions
------------------------------
INSERT INTO Unit_FreePromotions
		(UnitType, 						PromotionType)
SELECT	'UNIT_JFD_BIRKEBEINER',			'PROMOTION_JFD_SNOW_IMMUNITY'
WHERE EXISTS (SELECT Type FROM UnitPromotions WHERE Type = 'PROMOTION_JFD_SNOW_IMMUNITY');

INSERT INTO Unit_FreePromotions
		(UnitType, 						PromotionType)
SELECT	'UNIT_JFD_LONGBOAT',			'PROMOTION_JFD_SCURVY_IMMUNITY'
WHERE EXISTS (SELECT Type FROM UnitPromotions WHERE Type = 'PROMOTION_JFD_SCURVY_IMMUNITY');
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
SELECT	'CIVILIZATION_JFD_NORWAY',	ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_DENMARK';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Northern'
WHERE Type = 'CIVILIZATION_JFD_NORWAY'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Northern')
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
		(LeaderType,			FlavorType,					Flavor)
VALUES	('LEADER_JFD_HAAKON',	'FLAVOR_JFD_MERCENARY',		7);
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
VALUES	('LEADER_JFD_HAAKON',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	 8);
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
SELECT	'CIVILIZATION_JFD_NORWAY',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_DENMARK';
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
		(CivilizationType,			LegislatureName, OfficeTitle, GovernmentType, Weight)
SELECT	'CIVILIZATION_JFD_NORWAY',	LegislatureName, OfficeTitle, GovernmentType, Weight
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_DENMARK';
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
VALUES  ('CIVILIZATION_JFD_NORWAY',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NORWAY_1'),
        ('CIVILIZATION_JFD_NORWAY',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NORWAY_2'),
        ('CIVILIZATION_JFD_NORWAY',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NORWAY_3'),
        ('CIVILIZATION_JFD_NORWAY',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NORWAY_4'),
        ('CIVILIZATION_JFD_NORWAY',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NORWAY_5'),
        ('CIVILIZATION_JFD_NORWAY',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NORWAY_6'),
        ('CIVILIZATION_JFD_NORWAY',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NORWAY_7'),
        ('CIVILIZATION_JFD_NORWAY',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NORWAY_8'),
        ('CIVILIZATION_JFD_NORWAY',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NORWAY_9'),
        ('CIVILIZATION_JFD_NORWAY',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NORWAY_10'),
        ('CIVILIZATION_JFD_NORWAY',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NORWAY_11'),
        ('CIVILIZATION_JFD_NORWAY',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NORWAY_12'),
        ('CIVILIZATION_JFD_NORWAY',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NORWAY_13'),
        ('CIVILIZATION_JFD_NORWAY',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NORWAY_14'),
        ('CIVILIZATION_JFD_NORWAY',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NORWAY_15'),
        ('CIVILIZATION_JFD_NORWAY',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NORWAY_16'),
        ('CIVILIZATION_JFD_NORWAY',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NORWAY_17'),
        ('CIVILIZATION_JFD_NORWAY',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NORWAY_18'),
        ('CIVILIZATION_JFD_NORWAY',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NORWAY_19'),
        ('CIVILIZATION_JFD_NORWAY',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NORWAY_20'),
        ('CIVILIZATION_JFD_NORWAY',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NORWAY_21'),
        ('CIVILIZATION_JFD_NORWAY',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NORWAY_22'),
        ('CIVILIZATION_JFD_NORWAY',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NORWAY_23'),
        ('CIVILIZATION_JFD_NORWAY',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NORWAY_24'),
        ('CIVILIZATION_JFD_NORWAY',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NORWAY_25');
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
		(CivilizationType,				DefaultTitle,											UniqueTitle)
VALUES	('CIVILIZATION_JFD_NORWAY',		'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER_NORWAY');	
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 					default null,
	PoliticsType  						text 														default null,
	UniqueName							text														default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,				UniqueName, 									PoliticsType)
VALUES	('CIVILIZATION_JFD_NORWAY',		'TXT_KEY_JFD_PARTY_JFD_CLERGY_NORWAY',			'PARTY_JFD_CLERGY'),
		('CIVILIZATION_JFD_NORWAY',		'TXT_KEY_JFD_PARTY_JFD_COMMUNIST_NORWAY',		'PARTY_JFD_COMMUNIST'),
		('CIVILIZATION_JFD_NORWAY',		'TXT_KEY_JFD_PARTY_JFD_CONSERVATIVE_NORWAY',	'PARTY_JFD_CONSERVATIVE'),
		('CIVILIZATION_JFD_NORWAY',		'TXT_KEY_JFD_PARTY_JFD_FASCIST_NORWAY',			'PARTY_JFD_FASCIST'),
		('CIVILIZATION_JFD_NORWAY',		'TXT_KEY_JFD_PARTY_JFD_LIBERAL_NORWAY',			'PARTY_JFD_LIBERAL'),
		('CIVILIZATION_JFD_NORWAY',		'TXT_KEY_JFD_PARTY_JFD_LIBERTARIAN_NORWAY',		'PARTY_JFD_LIBERTARIAN'),
		('CIVILIZATION_JFD_NORWAY',		'TXT_KEY_JFD_PARTY_JFD_NOBILITY_NORWAY',		'PARTY_JFD_NOBILITY'),
		('CIVILIZATION_JFD_NORWAY',		'TXT_KEY_JFD_PARTY_JFD_REVOLUTIONARY_NORWAY',	'PARTY_JFD_REVOLUTIONARY'),
		('CIVILIZATION_JFD_NORWAY',		'TXT_KEY_JFD_PARTY_JFD_SOCIALIST_NORWAY',		'PARTY_JFD_SOCIALIST');
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
VALUES	('LEADER_JFD_HAAKON',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 4),
		('LEADER_JFD_HAAKON',	'FLAVOR_JFD_REFORM_CULTURE',		 3),
		('LEADER_JFD_HAAKON',	'FLAVOR_JFD_REFORM_ECONOMIC',		 6),
		('LEADER_JFD_HAAKON',	'FLAVOR_JFD_REFORM_FOREIGN',		 6),
		('LEADER_JFD_HAAKON',	'FLAVOR_JFD_REFORM_INDUSTRY',		 4),
		('LEADER_JFD_HAAKON',	'FLAVOR_JFD_REFORM_MILITARY',		 7),
		('LEADER_JFD_HAAKON',	'FLAVOR_JFD_REFORM_RELIGION',		 8);
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_Norway_Decisions.lua');
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_Norway_Events.lua');
------------------------------
-- Policies
------------------------------	
INSERT INTO Policies 
		(Type, 									Description)
VALUES	('POLICY_EVENTS_JFD_ETERNAL_KING', 		'TXT_KEY_EVENT_JFD_NORWAY_ETERNAL_KING');
------------------------------------------------------------
-- Policy_JFD_LeaderName
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Policy_JFD_LeaderName (
	PolicyType								text 	REFERENCES Policies(Type) 		default null,
	LeaderType								text 	REFERENCES Leaders(Type) 		default null,
	Description								text									default null);
	
INSERT INTO Policy_JFD_LeaderName 	
		(PolicyType, 						LeaderType,				Description)
VALUES	('POLICY_EVENTS_JFD_ETERNAL_KING',	'LEADER_JFD_HAAKON',	'TXT_KEY_JFD_NORWAY_THE_HOLY_ENACTED');
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
VALUES	('TXT_KEY_EVENT_CULDEV_JFD_NORWAY_01',	'CIVILIZATION_JFD_NORWAY',	'JFD_Northern');
--==========================================================================================================================
--==========================================================================================================================