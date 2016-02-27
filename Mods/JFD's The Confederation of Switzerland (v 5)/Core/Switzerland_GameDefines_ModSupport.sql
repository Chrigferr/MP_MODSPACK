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
VALUES  ('LEADER_JFD_DUFOUR',	'POLICY_CHARISMATIC_X',	'POLICY_PROTECTIVE_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Dufour [ICON_HAPPINESS_1][ICON_STRENGTH]'
WHERE Type = 'LEADER_JFD_DUFOUR'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
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
SET Help = 'TXT_KEY_BUILDINGS_JFD_KASERNE_HELP_CBP'
WHERE Type = 'BUILDING_JFD_KASERNE' 
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value = 1);
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_GERMANY'
WHERE Type = 'CIVILIZATION_JFD_SWITZERLAND'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_GERMANY');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,								X,	 Y)
VALUES	('CIVILIZATION_JFD_SWITZERLAND',	17, 64);

CREATE TABLE IF NOT EXISTS MinorCiv_YagemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_YagemStartPosition WHERE Type IN ('MINOR_CIV_ZURICH', 'MINOR_CIV_GENEVA');
INSERT INTO MinorCiv_YagemStartPosition
		(Type,				 X,	 Y)
VALUES	('MINOR_CIV_ZURICH', 19, 71), -- Lubeck
		('MINOR_CIV_GENEVA', 15, 62); -- Avignon
------------------------------------------------------------
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,								X,	 Y)
VALUES	('CIVILIZATION_JFD_SWITZERLAND',	61, 58);

CREATE TABLE IF NOT EXISTS MinorCiv_YahemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_YahemStartPosition WHERE Type IN ('MINOR_CIV_ZURICH', 'MINOR_CIV_GENEVA');
INSERT INTO MinorCiv_YahemStartPosition
		(Type,				 X,	 Y)
VALUES	('MINOR_CIV_ZURICH', 63, 62), -- Lubeck
		('MINOR_CIV_GENEVA', 60, 56); -- Avignon
------------------------------------------------------------
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,								 X,	 Y)
VALUES	('CIVILIZATION_JFD_SWITZERLAND',	 36, 28);

CREATE TABLE IF NOT EXISTS MinorCiv_CordiformStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_CordiformStartPosition WHERE Type IN ('MINOR_CIV_ZURICH', 'MINOR_CIV_GENEVA');
INSERT INTO MinorCiv_CordiformStartPosition
		(Type,				 X,	 Y)
VALUES	('MINOR_CIV_ZURICH', 38, 34), -- Lubeck
		('MINOR_CIV_GENEVA', 34, 26); -- Avignon
------------------------------------------------------------
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,								X,	Y)
VALUES	('CIVILIZATION_JFD_SWITZERLAND',	46, 49);

CREATE TABLE IF NOT EXISTS MinorCiv_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_GreatestEarthStartPosition WHERE Type IN ('MINOR_CIV_ZURICH', 'MINOR_CIV_GENEVA');
INSERT INTO MinorCiv_GreatestEarthStartPosition
		(Type,				 X,	 Y)
VALUES	('MINOR_CIV_ZURICH', 47, 55), -- Lubeck
		('MINOR_CIV_GENEVA', 44, 45); -- Avignon
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
		(Type,								X,	Y)
VALUES	('CIVILIZATION_JFD_SWITZERLAND',	53,	53);

CREATE TABLE IF NOT EXISTS MinorCiv_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_EuroGiantStartPosition WHERE Type IN ('MINOR_CIV_ZURICH', 'MINOR_CIV_GENEVA');
INSERT INTO MinorCiv_EuroGiantStartPosition
		(Type,				 X,	 Y)
VALUES	('MINOR_CIV_ZURICH', 69, 74), -- Lubeck
		('MINOR_CIV_GENEVA', 50, 50); -- Avignon
------------------------------------------------------------
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
		(Type,								X,	Y)
VALUES	('CIVILIZATION_JFD_SWITZERLAND',	31, 39);

CREATE TABLE IF NOT EXISTS MinorCiv_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_EuroLargeStartPosition WHERE Type IN ('MINOR_CIV_ZURICH', 'MINOR_CIV_GENEVA');
INSERT INTO MinorCiv_EuroLargeStartPosition
		(Type,				 X,	 Y)
VALUES	('MINOR_CIV_ZURICH', 35, 52), -- Lubeck
		('MINOR_CIV_GENEVA', 28, 36); -- Avignon
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeStartPosition (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthWestEuropeStartPosition
		(Type,								X,	Y)
VALUES	('CIVILIZATION_JFD_SWITZERLAND',	28,	1);

CREATE TABLE IF NOT EXISTS MinorCiv_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_NorthWestEuropeStartPosition WHERE Type IN ('MINOR_CIV_ZURICH', 'MINOR_CIV_GENEVA');
INSERT INTO MinorCiv_NorthWestEuropeStartPosition
		(Type,				 X,	 Y)
VALUES	('MINOR_CIV_ZURICH', 35, 23); -- Lubeck
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
		(Type,								X,	Y)
VALUES	('CIVILIZATION_JFD_SWITZERLAND',	91,	26);

CREATE TABLE IF NOT EXISTS MinorCiv_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_NorthAtlanticStartPosition WHERE Type IN ('MINOR_CIV_ZURICH', 'MINOR_CIV_GENEVA');
INSERT INTO MinorCiv_NorthAtlanticStartPosition
		(Type,				 X,	 Y)
VALUES	('MINOR_CIV_ZURICH', 89, 39), -- Lubeck
		('MINOR_CIV_GENEVA', 91, 21); -- Avignon
------------------------------------------------------------	
-- Civilizations_MediterraneanStartPosition (Mediterranean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
		(Type,								X,	Y)
VALUES	('CIVILIZATION_JFD_SWITZERLAND',	32,	55);

CREATE TABLE IF NOT EXISTS MinorCiv_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_MediterraneanStartPosition WHERE Type IN ('MINOR_CIV_ZURICH', 'MINOR_CIV_GENEVA');
INSERT INTO MinorCiv_MediterraneanStartPosition
		(Type,				 X,	 Y)
VALUES	('MINOR_CIV_GENEVA', 30, 51); -- Avignon
------------------------------------------------------------	
-- MinorCiv_ApennineStartPosition (Apennine)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS MinorCiv_ApennineStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_ApennineStartPosition WHERE Type IN ('MINOR_CIV_ZURICH', 'MINOR_CIV_GENEVA');
INSERT INTO MinorCiv_ApennineStartPosition
		(Type,				 X,	 Y)
VALUES	('MINOR_CIV_GENEVA', 5,  50); -- Avignon
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_SWITZERLAND',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_SWITZERLAND',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_SWITZERLAND',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------	
-- Civilizations_EuroGiantRequestedResource (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_SWITZERLAND',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Euro Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_SWITZERLAND',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeRequestedResource (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthWestEuropeRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_SWITZERLAND',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthWestEuropeRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------	
-- Civilizations_NorthAtlanticRequestedResource (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_SWITZERLAND',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,							CultureType,	CultureEra)
VALUES	('CIVILIZATION_JFD_SWITZERLAND',	'FRENCH',		'ANY'),
		('CIVILIZATION_JFD_SWITZERLAND',	'GERMANIC',		'ANY');
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
		(CivilizationType, 					LinguisticType)
VALUES	('CIVILIZATION_JFD_SWITZERLAND',	'JFD_Germanic');
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
		(CivilizationType,				ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_SWITZERLAND',	ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_GERMANY';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Central'
WHERE Type = 'CIVILIZATION_JFD_SWITZERLAND'
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
SET CultureType = 'JFD_Western'
WHERE MinorCivilizationType IN ('MINOR_CIV_GENEVA', 'MINOR_CIV_ZURICH');
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
VALUES	('JFD_Switzerland_DTP.lua');
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
		(CivilizationType,					YieldType,		YieldSourcefunction,						YieldSourceToolTip)
VALUES	('CIVILIZATION_JFD_SWITZERLAND',	'YIELD_GOLD',	'JFD_Switzerland_GetGoldFromNeutrality',	'TXT_KEY_JFD_SWITZERLAND_GOLD_FROM_NEUTRALITY');
--==========================================================================================================================	
-- JFD AND POUAKAI MERCENARIES
--==========================================================================================================================
-- Buildings
------------------------------------------------------------	
UPDATE Buildings
SET TrainedFreePromotion = 'PROMOTION_JFD_KASERNE', Help = 'TXT_KEY_BUILDING_HELP_JFD_KASERNE_MERC', Strategy = 'TXT_KEY_BUILDING_JFD_KASERNE_STRATEGY_MERC'
WHERE Type = 'BUILDING_JFD_KASERNE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_NO_GOLD_PURCHASING' AND Value = 1);

UPDATE Buildings
SET Help = 'TXT_KEY_BUILDINGS_JFD_KASERNE_HELP_CBP_MERC'
WHERE Type = 'BUILDING_JFD_KASERNE' 
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_NO_GOLD_PURCHASING' AND Value = 1);

UPDATE Buildings
SET Strategy = 'TXT_KEY_BUILDING_JFD_KASERNE_STRATEGY_EE_MERC'
WHERE Type = 'BUILDING_JFD_KASERNE'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_MERCENARIES_NO_GOLD_PURCHASING' AND Value = 1);
------------------------------------------------------------
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
VALUES	('LEADER_JFD_DUFOUR',	'FLAVOR_JFD_MERCENARY',	 9);
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
		(CivilizationType,					LegislatureName,										 OfficeTitle,														GovernmentType,				Weight)
VALUES	('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_LEGISLATURE_NAME_CIVILIZATION_SWITZERLAND', 'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_SWITZERLAND',	'GOVERNMENT_JFD_REPUBLIC',	100);
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
VALUES  ('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SWITZERLAND_1'),
        ('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SWITZERLAND_2'),
        ('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SWITZERLAND_3'),
        ('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SWITZERLAND_4'),
        ('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SWITZERLAND_5'),
        ('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SWITZERLAND_6'),
        ('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SWITZERLAND_7'),
        ('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SWITZERLAND_8'),
        ('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SWITZERLAND_9'),
        ('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SWITZERLAND_10'),
        ('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SWITZERLAND_11'),
        ('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SWITZERLAND_12'),
        ('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SWITZERLAND_13'),
        ('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SWITZERLAND_14'),
        ('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SWITZERLAND_15'),
        ('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SWITZERLAND_16'),
        ('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SWITZERLAND_17'),
        ('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SWITZERLAND_18'),
        ('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SWITZERLAND_19'),
        ('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SWITZERLAND_20'),
        ('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SWITZERLAND_21'),
        ('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SWITZERLAND_22'),
        ('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SWITZERLAND_23'),
        ('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SWITZERLAND_24'),
		('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SWITZERLAND_25');
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 		default null,
	PoliticsType  						text 											default null,
	UniqueName							text											default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,					UniqueName,											PoliticsType)
VALUES	('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_PARTY_JFD_COMMUNIST_SWITZERLAND',		'PARTY_JFD_COMMUNIST'),
		('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_PARTY_JFD_CONSERVATIVE_SWITZERLAND',	'PARTY_JFD_CONSERVATIVE'),
		('CIVILIZATION_JFD_SWITZERLAND',	'TXT_KEY_JFD_PARTY_JFD_FASCIST_SWITZERLAND',		'PARTY_JFD_FASCIST');
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
VALUES	('LEADER_JFD_DUFOUR',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 1),
		('LEADER_JFD_DUFOUR',	'FLAVOR_JFD_REFORM_CULTURE',		 3),
		('LEADER_JFD_DUFOUR',	'FLAVOR_JFD_REFORM_ECONOMIC',		 1),
		('LEADER_JFD_DUFOUR',	'FLAVOR_JFD_REFORM_FOREIGN',		 2),
		('LEADER_JFD_DUFOUR',	'FLAVOR_JFD_REFORM_INDUSTRY',		 2),
		('LEADER_JFD_DUFOUR',	'FLAVOR_JFD_REFORM_MILITARY',		 2),
		('LEADER_JFD_DUFOUR',	'FLAVOR_JFD_REFORM_RELIGION',		 2),
		('LEADER_JFD_DUFOUR',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	 0);
--==========================================================================================================================	
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- Buildings
------------------------------------------------------------
UPDATE Buildings
SET PrereqTech = 'TECH_EE_FLINTLOCK', Strategy = 'TXT_KEY_BUILDING_JFD_KASERNE_STRATEGY_EE'
WHERE Type = 'BUILDING_JFD_KASERNE'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');	
------------------------------------------------------------
-- Units
------------------------------------------------------------	
UPDATE Units
SET PrereqTech = 'TECH_EE_HUMANISM', Combat = 22, Cost = 150, FaithCost = 300, Strategy = 'TXT_KEY_UNIT_JFD_COMBAT_MEDIC_STRATEGY_EE'
WHERE Type = 'UNIT_JFD_COMBAT_MEDIC'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_Switzerland_Decisions.lua');
------------------------------
-- Policies
------------------------------	
INSERT INTO Policies
		(Type,											Description,												MedianTechPercentChange)
VALUES	('POLICY_DECISIONS_JFD_SWITZERLAND_BANKS',		'TXT_KEY_DECISIONS_JFD_SWITZERLAND_BANK_SECRECY',			0),
		('POLICY_DECISIONS_JFD_SWITZERLAND_RESEARCH',	'TXT_KEY_DECISIONS_JFD_SWITZERLAND_FOREIGN_RESEARCHERS',	50);
------------------------------
-- Policy_BuildingClassYieldModifiers
------------------------------	
INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType,								BuildingClassType,		YieldType,		YieldMod)
VALUES	('POLICY_DECISIONS_JFD_SWITZERLAND_BANKS',	'BUILDINGCLASS_BANK',	'YIELD_GOLD',	15);
------------------------------
-- Policy_BuildingClassYieldModifiers
------------------------------	
INSERT INTO Policy_BuildingClassHappiness
		(PolicyType,								BuildingClassType,		Happiness)
VALUES	('POLICY_DECISIONS_JFD_SWITZERLAND_BANKS',	'BUILDINGCLASS_BANK',	1);
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_Switzerland_Events.lua');
------------------------------
-- Events_CulturalDevelopments
------------------------------
CREATE TABLE IF NOT EXISTS 
Events_CulturalDevelopments(
	CivilizationType		text  REFERENCES Civilizations(Type)	default null,
	CultureType				text									default null,
	Description				text									default null);

INSERT INTO Events_CulturalDevelopments 
		(Description,								CivilizationType)
VALUES	('TXT_KEY_EVENT_CULDEV_JFD_SWITZERLAND_01',	'CIVILIZATION_JFD_SWITZERLAND');
--==========================================================================================================================
--==========================================================================================================================