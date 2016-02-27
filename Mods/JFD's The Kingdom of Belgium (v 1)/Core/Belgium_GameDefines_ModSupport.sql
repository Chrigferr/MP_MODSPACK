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
VALUES  ('LEADER_JFD_ALBERT', 	'POLICY_PROTECTIVE_X',	'POLICY_MERCANTILE_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Albert I [ICON_STRENGTH][ICON_GOLD]'
WHERE Type = 'LEADER_JFD_ALBERT'
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
SET Help = 'TXT_KEY_BUILDING_JFD_CHOCOLATE_HOUSE_HELP_CBP', Strategy = 'TXT_KEY_BUILDING_JFD_CHOCOLATE_HOUSE_STRATEGY_CBP'
WHERE Type = 'BUILDING_JFD_CHOCOLATE_HOUSE' 
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value = 1);
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_FRANCE'
WHERE Type = 'CIVILIZATION_JFD_BELGIUM'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_FRANCE');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_JFD_BELGIUM',	15,		69,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_YagemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_YagemStartPosition WHERE Type IN ('MINOR_CIV_ANTWERP', 'MINOR_CIV_BRUSSELS');
INSERT INTO MinorCiv_YagemStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_ANTWERP',			18,		65,		null,	null), -- Vaduz
		('MINOR_CIV_BRUSSELS',			12,		61,		null,	null); -- Andorra la Velle
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_JFD_BELGIUM',	60,		62,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_YahemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_YahemStartPosition WHERE Type IN ('MINOR_CIV_ANTWERP', 'MINOR_CIV_BRUSSELS');
INSERT INTO MinorCiv_YahemStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_ANTWERP',			62,		57,		null,	null), -- Vaduz
		('MINOR_CIV_BRUSSELS',			56,		55,		null,	null); -- Andorra la Velle
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_JFD_BELGIUM',	36,		26,		null,	null);
	
CREATE TABLE IF NOT EXISTS MinorCiv_CordiformStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_CordiformStartPosition WHERE Type IN ('MINOR_CIV_ANTWERP', 'MINOR_CIV_BRUSSELS');
INSERT INTO MinorCiv_CordiformStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_ANTWERP',			37,		29,		null,	null), -- Vaduz
		('MINOR_CIV_BRUSSELS',			33,		25,		null,	null); -- Andorra la Velle
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Greatest Earth)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_JFD_BELGIUM',	43,		50,		null,	null);
	
CREATE TABLE IF NOT EXISTS MinorCiv_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_GreatestEarthStartPosition WHERE Type IN ('MINOR_CIV_ANTWERP', 'MINOR_CIV_BRUSSELS');
INSERT INTO MinorCiv_GreatestEarthStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_ANTWERP',			47,		50,		null,	null), -- Vaduz
		('MINOR_CIV_BRUSSELS',			41,		42,		null,	null); -- Andorra la Velle
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_JFD_BELGIUM',	53,		68,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_EuroGiantStartPosition WHERE Type IN ('MINOR_CIV_ANTWERP', 'MINOR_CIV_BRUSSELS');
INSERT INTO MinorCiv_EuroGiantStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_ANTWERP',			55,		55,		null,	null), -- Vaduz
		('MINOR_CIV_BRUSSELS',			35,		41,		null,	null); -- Andorra la Velle
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------		
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_JFD_BELGIUM',	29,		46,		null,	null);
	
CREATE TABLE IF NOT EXISTS MinorCiv_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_EuroLargeStartPosition WHERE Type IN ('MINOR_CIV_ANTWERP', 'MINOR_CIV_BRUSSELS');
INSERT INTO MinorCiv_EuroLargeStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_ANTWERP',			25,		34,		null,	null), -- Vaduz
		('MINOR_CIV_BRUSSELS',			26,		36,		null,	null); -- Andorra la Velle
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeStartPosition (North-West Europe)
------------------------------------------------------------		
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthWestEuropeStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_JFD_BELGIUM',	29,		15,		null,	null);
	
CREATE TABLE IF NOT EXISTS MinorCiv_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_NorthWestEuropeStartPosition WHERE Type IN ('MINOR_CIV_ANTWERP', 'MINOR_CIV_BRUSSELS');
INSERT INTO MinorCiv_NorthWestEuropeStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_ANTWERP',			32,		1,		null,	null); -- Vaduz
------------------------------------------------------------	
-- Civilizations_NorthAltanticStartPosition (North Atlantic)
------------------------------------------------------------		
CREATE TABLE IF NOT EXISTS Civilizations_NorthAltanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAltanticStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_JFD_BELGIUM',	89,		32,		null,	null);
	
CREATE TABLE IF NOT EXISTS MinorCiv_NorthAltantiStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_NorthAltantiStartPosition WHERE Type IN ('MINOR_CIV_ANTWERP', 'MINOR_CIV_BRUSSELS');
INSERT INTO MinorCiv_NorthAltantiStartPosition
		(Type,							X,		Y,		AltX,	AltY)
VALUES	('MINOR_CIV_ANTWERP',			92,		29,		null,	null), -- Vaduz
		('MINOR_CIV_BRUSSELS',			89,		17,		null,	null); -- Andorra la Velle
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_BELGIUM',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_NETHERLANDS';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_BELGIUM',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_NETHERLANDS';
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Greatest Earth)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_BELGIUM',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_NETHERLANDS';
------------------------------------------------------------	
-- Civilizations_EuroGiantRequestedResource (Europe Giant)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_BELGIUM',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_NETHERLANDS';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Large)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_BELGIUM',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_NETHERLANDS';
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeRequestedResource (North-West Europe)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthWestEuropeRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_BELGIUM',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthWestEuropeRequestedResource WHERE Type = 'CIVILIZATION_NETHERLANDS';
------------------------------------------------------------	
-- Civilizations_NorthAltanticRequestedResource (North Atlantic)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthAltanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAltanticRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_BELGIUM',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAltanticRequestedResource WHERE Type = 'CIVILIZATION_NETHERLANDS';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,						CultureType,	CultureEra)
VALUES	('CIVILIZATION_JFD_BELGIUM',	'GERMANIC',		'ANY');
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
VALUES	('IMPROVEMENT_JFD_BELGIAN_PLANTATION'),
		('PROMOTION_JFD_CHASSEUR');
--==========================================================================================================================
-- JFD CITIES IN DEVELOPMENT
--==========================================================================================================================
--Building_ConstructionAudio
----------------------
CREATE TABLE IF NOT EXISTS
Building_ConstructionAudio (
    BuildingType                                text    REFERENCES Buildings(Type)              default null,
    ConstructionAudio                           text											default null);
	
INSERT INTO Building_ConstructionAudio
		(BuildingType, 					ConstructionAudio)
SELECT	'BUILDING_JFD_CHOCOLATE_HOUSE',	'AS2D_BUILDING_JFD_COFFEE_HOUSE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);
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
		(CivilizationType, 					ColonyName,									LinguisticType)
VALUES	('CIVILIZATION_JFD_BELGIUM',		null,										'JFD_Germanic'),
		('CIVILIZATION_JFD_BELGIUM',		null,										'JFD_Latinate'),
		('CIVILIZATION_JFD_BELGIUM',		'TXT_KEY_COLONY_NAME_JFD_BELGIUM_01',		null),
		('CIVILIZATION_JFD_BELGIUM',		'TXT_KEY_COLONY_NAME_JFD_BELGIUM_02',		null),
		('CIVILIZATION_JFD_BELGIUM',		'TXT_KEY_COLONY_NAME_JFD_BELGIUM_03',		null),
		('CIVILIZATION_JFD_BELGIUM',		'TXT_KEY_COLONY_NAME_JFD_BELGIUM_04',		null),
		('CIVILIZATION_JFD_BELGIUM',		'TXT_KEY_COLONY_NAME_JFD_BELGIUM_05',		null),
		('CIVILIZATION_JFD_BELGIUM',		'TXT_KEY_COLONY_NAME_JFD_BELGIUM_06',		null),
		('CIVILIZATION_JFD_BELGIUM',		'TXT_KEY_COLONY_NAME_JFD_BELGIUM_07',		null),
		('CIVILIZATION_JFD_BELGIUM',		'TXT_KEY_COLONY_NAME_JFD_BELGIUM_08',		null),
		('CIVILIZATION_JFD_BELGIUM',		'TXT_KEY_COLONY_NAME_JFD_BELGIUM_09',		null),
		('CIVILIZATION_JFD_BELGIUM',		'TXT_KEY_COLONY_NAME_JFD_BELGIUM_10',		null),
		('CIVILIZATION_JFD_BELGIUM',		'TXT_KEY_COLONY_NAME_JFD_BELGIUM_11',		null),
		('CIVILIZATION_JFD_BELGIUM',		'TXT_KEY_COLONY_NAME_JFD_BELGIUM_12',		null),
		('CIVILIZATION_JFD_BELGIUM',		'TXT_KEY_COLONY_NAME_JFD_BELGIUM_13',		null),
		('CIVILIZATION_JFD_BELGIUM',		'TXT_KEY_COLONY_NAME_JFD_BELGIUM_14',		null),
		('CIVILIZATION_JFD_BELGIUM',		'TXT_KEY_COLONY_NAME_JFD_BELGIUM_15',		null);
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
SELECT	'CIVILIZATION_JFD_BELGIUM',	ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_FRANCE';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Western'
WHERE Type = 'CIVILIZATION_JFD_BELGIUM'
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
		(LeaderType,				FlavorType,					Flavor)
VALUES	('LEADER_JFD_ALBERT',		'FLAVOR_JFD_MERCENARY',		7);
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
VALUES	('LEADER_JFD_ALBERT',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	0);
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
SELECT	'CIVILIZATION_JFD_BELGIUM',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_FRANCE';
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
		(CivilizationType,				LegislatureName, 										OfficeTitle,													GovernmentType,				Weight)
VALUES	('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_LEGISLATURE_NAME_CIVILIZATION_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_BELGIUM',	'GOVERNMENT_JFD_MONARCHY',	70);
------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	HeadOfGovernmentName			text 		 												default null);

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,      		HeadOfGovernmentName)
VALUES  ('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BELGIUM_1'),
        ('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BELGIUM_2'),
        ('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BELGIUM_3'),
        ('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BELGIUM_4'),
        ('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BELGIUM_5'),
        ('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BELGIUM_6'),
        ('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BELGIUM_7'),
        ('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BELGIUM_8'),
        ('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BELGIUM_9'),
        ('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BELGIUM_10'),
        ('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BELGIUM_11'),
        ('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BELGIUM_12'),
        ('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BELGIUM_13'),
        ('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BELGIUM_14'),
        ('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BELGIUM_15'),
        ('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BELGIUM_16'),
        ('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BELGIUM_17'),
        ('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BELGIUM_18'),
        ('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BELGIUM_19'),
        ('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BELGIUM_20'),
        ('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BELGIUM_21'),
        ('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BELGIUM_22'),
        ('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BELGIUM_23'),
        ('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BELGIUM_24'),
        ('CIVILIZATION_JFD_BELGIUM',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BELGIUM_25');
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 					default null,
	PoliticsType  						text 														default null,
	UniqueName							text														default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,				PoliticsType,				UniqueName)
VALUES	('CIVILIZATION_JFD_BELGIUM',	'PARTY_JFD_LIBERAL',		'TXT_KEY_JFD_PARTY_JFD_LIBERAL_BELGIUM'),
		('CIVILIZATION_JFD_BELGIUM',	'PARTY_JFD_REVOLUTIONARY',	'TXT_KEY_JFD_PARTY_JFD_REVOLUTIONARY_BELGIUM');
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
VALUES	('LEADER_JFD_ALBERT',	'FLAVOR_JFD_REFORM_GOVERNMENT',		2),
		('LEADER_JFD_ALBERT',	'FLAVOR_JFD_REFORM_CULTURE',		6),
		('LEADER_JFD_ALBERT',	'FLAVOR_JFD_REFORM_ECONOMIC',		8),
		('LEADER_JFD_ALBERT',	'FLAVOR_JFD_REFORM_FOREIGN',		4),
		('LEADER_JFD_ALBERT',	'FLAVOR_JFD_REFORM_INDUSTRY',		7),
		('LEADER_JFD_ALBERT',	'FLAVOR_JFD_REFORM_MILITARY',		2),
		('LEADER_JFD_ALBERT',	'FLAVOR_JFD_REFORM_RELIGION',		5);
--==========================================================================================================================
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- Buildings
------------------------------	
INSERT OR REPLACE INTO Buildings 	
		(Type, 								BuildingClass, Cost, GoldMaintenance, PrereqTech, Description, 							Civilopedia, 								Help, 											Strategy,											ArtDefineTag, 	MinAreaSize, ConquestProb, HurryCostModifier, PortraitIndex, IconAtlas)
SELECT	'BUILDING_JFD_CHOCOLATE_HOUSE',		BuildingClass, Cost, GoldMaintenance, PrereqTech, 'TXT_KEY_BUILDING_JFD_CHOCOLATE_HOUSE', 'TXT_KEY_CIV5_JFD_CHOCOLATE_HOUSE_TEXT', 	'TXT_KEY_BUILDING_JFD_CHOCOLATE_HOUSE_HELP_EE', 'TXT_KEY_BUILDING_JFD_CHOCOLATE_HOUSE_STRATEGY_EE',	ArtDefineTag,	MinAreaSize, ConquestProb, HurryCostModifier, 3, 			 'JFD_BELGIUM_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_EE_MENAGERIE'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');	
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
DELETE FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_JFD_CHOCOLATE_HOUSE'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
SELECT	'BUILDING_JFD_CHOCOLATE_HOUSE',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_EE_MENAGERIE';
------------------------------	
-- Building_YieldChanges
------------------------------		
DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_JFD_CHOCOLATE_HOUSE'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
------------------------------
-- Civilization_BuildingClassOverrides
------------------------------	
UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_EE_MENAGERIE'
WHERE CivilizationType = 'CIVILIZATION_JFD_BELGIUM'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_Belgium_Decisions.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies 
		(Type,											Description) 
VALUES	('POLICY_DECISIONS_JFD_FORCE_PUBLIQUE',			'TXT_KEY_DECISIONS_JFD_BELGIUM_FORCE_PUBLIQUE'),
		('POLICY_DECISIONS_JFD_GEOGRAPHIC_CONFERENCE',	'TXT_KEY_DECISIONS_JFD_BELGIUM_GEOGRAPHIC_CONFERENCE');
------------------------------
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions
		(Type, 											Description, 												Help, 														Sound, 				VisibilityChange, 	IgnoreTerrainCost, 	CannotBeChosen, OutsideFriendlyLandsModifier, 	PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_BELGIAN_GEOGRAPHIC_CONFERENCE', 'TXT_KEY_PROMOTION_JFD_BELGIAN_GEOGRAPHIC_CONFERENCE_DESC', 'TXT_KEY_PROMOTION_JFD_BELGIAN_GEOGRAPHIC_CONFERENCE_HELP', 'AS2D_IF_LEVELUP', 	1, 					1, 					1,				0, 								59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_BELGIAN_GEOGRAPHIC_CONFERENCE_DESC');
------------------------------
-- UnitPromotions_CivilianUnitType
------------------------------
INSERT INTO UnitPromotions_CivilianUnitType
		(PromotionType, 								UnitType)
VALUES	('PROMOTION_JFD_BELGIAN_GEOGRAPHIC_CONFERENCE', 'UNIT_SETTLER'),
		('PROMOTION_JFD_BELGIAN_GEOGRAPHIC_CONFERENCE', 'UNIT_JFD_BELGIAN_WORKER'),
		('PROMOTION_JFD_BELGIAN_GEOGRAPHIC_CONFERENCE', 'UNIT_WORKER');
------------------------------
-- Policy_FreePromotions
------------------------------
INSERT INTO Policy_FreePromotions 
		(PolicyType, 									PromotionType) 
VALUES 	('POLICY_DECISIONS_JFD_GEOGRAPHIC_CONFERENCE',	'PROMOTION_JFD_BELGIAN_GEOGRAPHIC_CONFERENCE');
------------------------------
-- Policy_ImprovementYieldChanges
------------------------------
INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType, 								ImprovementType, 						YieldType, 			Yield)
VALUES	('POLICY_DECISIONS_JFD_FORCE_PUBLIQUE', 	'IMPROVEMENT_PLANTATION', 				'YIELD_PRODUCTION', 1),
		('POLICY_DECISIONS_JFD_FORCE_PUBLIQUE', 	'IMPROVEMENT_JFD_BELGIAN_PLANTATION', 	'YIELD_PRODUCTION', 1);
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_Belgium_Events.lua');
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
VALUES	('TXT_KEY_EVENT_CULDEV_JFD_BELGIUM_01',	'CIVILIZATION_JFD_BELGIUM',	'JFD_Western');
--==========================================================================================================================
--==========================================================================================================================