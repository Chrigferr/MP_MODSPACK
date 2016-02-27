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
        (LeaderType,			 TraitOne,					 TraitTwo)
VALUES  ('LEADER_JFD_JOSEPH_II', 'POLICY_IMPERIALISTIC_X',	 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Joseph II [ICON_CITY_STATE][ICON_GREAT_PEOPLE]'
WHERE Type = 'LEADER_JFD_JOSEPH_II'
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
SET Help = 'TXT_KEY_BUILDING_JFD_STATE_SCHOOL_HELP_CBP'
WHERE Type = 'BUILDING_JFD_STATE_SCHOOL' 
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value = 1);
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_AUSTRIA'
WHERE Type = 'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_AUSTRIA');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,									X,	Y)
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	X,	Y
FROM Civilizations_YagemStartPosition WHERE Type = 'CIVILIZATION_AUSTRIA';
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,									X,	Y)
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	X,	Y
FROM Civilizations_YahemStartPosition WHERE Type = 'CIVILIZATION_AUSTRIA';
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,									X,	Y)
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	X,	Y
FROM Civilizations_CordiformStartPosition WHERE Type = 'CIVILIZATION_AUSTRIA';
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,									X,	Y)
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	X,	Y
FROM Civilizations_GreatestEarthStartPosition WHERE Type = 'CIVILIZATION_AUSTRIA';
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
		(Type,									X,	Y)
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	X,	Y
FROM Civilizations_EuroLargeStartPosition WHERE Type = 'CIVILIZATION_AUSTRIA';
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
		(Type,									X,	Y)
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	X,	Y
FROM Civilizations_EuroGiantStartPosition WHERE Type = 'CIVILIZATION_AUSTRIA';
------------------------------------------------------------	
-- Civilizations_MediterraneanStartPosition (Mediterranean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
		(Type,									X,	Y)
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	X,	Y
FROM Civilizations_YagemStartPosition WHERE Type = 'CIVILIZATION_AUSTRIA';
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeStartPosition (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthWestEuropeStartPosition
		(Type,									X,	Y)
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	X,	Y
FROM Civilizations_NorthWestEuropeStartPosition WHERE Type = 'CIVILIZATION_AUSTRIA';
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
		(Type,									X,	Y)
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	X,	Y
FROM Civilizations_NorthAtlanticStartPosition WHERE Type = 'CIVILIZATION_AUSTRIA';
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_AUSTRIA';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_AUSTRIA';
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_AUSTRIA';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
		(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_AUSTRIA';
------------------------------------------------------------	
-- Civilizations_EuroGiantRequestedResource (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
		(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_AUSTRIA';
------------------------------------------------------------	
-- Civilizations_MediterraneanRequestedResource (Mediterranean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MediterraneanRequestedResource
		(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_MediterraneanRequestedResource WHERE Type = 'CIVILIZATION_AUSTRIA';
------------------------------------------------------------	
-- Civilizations_NileValleyRequestedResource (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
		(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE Type = 'CIVILIZATION_AUSTRIA';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,								CultureType,	CultureEra)
VALUES	('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'GERMAN',		'ANY');
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
VALUES	('PROMOTION_JFD_GRENADIER_RANGE_INFO');
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
		(CivilizationType,						LinguisticType, ColonyName)
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	LinguisticType, ColonyName
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_AUSTRIA';
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
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_AUSTRIA';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Central'
WHERE Type = 'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Central')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
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
VALUES	('JFD_AustriaJosephII_DTP.lua');
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
		(CivilizationType,						YieldType,			 YieldSourcefunction,					YieldSourceToolTip)
VALUES	('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'YIELD_GOLDEN_AGE',	 'JFD_AustriaJosephII_GetGAPFromGPP',	'TXT_KEY_JFD_AUSTRIA_JOSEPH_II_GAP_FROM_GPP');
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
VALUES	('LEADER_JFD_JOSEPH_II',	'FLAVOR_JFD_MERCENARY',		4);
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
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	LegislatureName, OfficeTitle, GovernmentType, 80
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_AUSTRIA';
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
VALUES  ('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_AUSTRIA_JOSEPH_II_1'),
        ('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_AUSTRIA_JOSEPH_II_2'),
        ('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_AUSTRIA_JOSEPH_II_3'),
        ('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_AUSTRIA_JOSEPH_II_4'),
        ('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_AUSTRIA_JOSEPH_II_5'),
        ('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_AUSTRIA_JOSEPH_II_6'),
        ('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_AUSTRIA_JOSEPH_II_7'),
        ('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_AUSTRIA_JOSEPH_II_8'),
        ('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_AUSTRIA_JOSEPH_II_9'),
        ('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_AUSTRIA_JOSEPH_II_10'),
        ('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_AUSTRIA_JOSEPH_II_11'),
        ('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_AUSTRIA_JOSEPH_II_12'),
        ('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_AUSTRIA_JOSEPH_II_13'),
        ('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_AUSTRIA_JOSEPH_II_14'),
        ('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_AUSTRIA_JOSEPH_II_15'),
        ('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_AUSTRIA_JOSEPH_II_16'),
        ('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_AUSTRIA_JOSEPH_II_17'),
        ('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_AUSTRIA_JOSEPH_II_18'),
        ('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_AUSTRIA_JOSEPH_II_19'),
        ('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_AUSTRIA_JOSEPH_II_20'),
        ('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_AUSTRIA_JOSEPH_II_21'),
        ('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_AUSTRIA_JOSEPH_II_22'),
        ('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_AUSTRIA_JOSEPH_II_23'),
        ('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_AUSTRIA_JOSEPH_II_24'),
        ('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_AUSTRIA_JOSEPH_II_25');
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
		(CivilizationType,						DefaultTitle,											UniqueTitle,																UseAdjective)
VALUES	('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER_JFD_AUSTRIA_JOSEPH_II',		0),	
		('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_GOVERNMENT',		'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_GOVERNMENT_AUSTRIA',					0),
		('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_LEADER_JFD_AUSTRIA_JOSEPH_II',			0),	
		('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER_AUSTRIA',						0),	
		('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER_LATE',	'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER_AUSTRIA',						0),	
		('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_LEADER',		'TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_LEADER_AUSTRIA',					0),	
		('CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'TXT_KEY_GOVERNMENT_JFD_FEDERATION_TITLE_GOVERNMENT',	'TXT_KEY_GOVERNMENT_JFD_FEDERATION_TITLE_GOVERNMENT_AUSTRIA',				1);
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
SELECT	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	PoliticsType, UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_AUSTRIA';
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
VALUES	('LEADER_JFD_JOSEPH_II',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 9),
		('LEADER_JFD_JOSEPH_II',	'FLAVOR_JFD_REFORM_CULTURE',		 3),
		('LEADER_JFD_JOSEPH_II',	'FLAVOR_JFD_REFORM_ECONOMIC',		 5),
		('LEADER_JFD_JOSEPH_II',	'FLAVOR_JFD_REFORM_FOREIGN',		 7),
		('LEADER_JFD_JOSEPH_II',	'FLAVOR_JFD_REFORM_INDUSTRY',		 4),
		('LEADER_JFD_JOSEPH_II',	'FLAVOR_JFD_REFORM_RELIGION',		 2),
		('LEADER_JFD_JOSEPH_II',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	 0);
--==========================================================================================================================
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- Units
------------------------------	
INSERT OR REPLACE INTO Units 	
		(Type, 					Class, PrereqTech, Combat, Cost, FaithCost,	RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 						Strategy, 									Help, 									MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,					 PortraitIndex,  IconAtlas)
SELECT	'UNIT_JFD_GRENADIER',	Class, PrereqTech, Combat, Cost, FaithCost,	RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_GRENADIER',	'TXT_KEY_CIV5_JFD_GRENADIER_TEXT', 	'TXT_KEY_UNIT_JFD_GRENADIER_STRATEGY_EE', 	'TXT_KEY_UNIT_JFD_GRENADIER_HELP_EE',	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_JFD_GRENADIER',	0,					'JFD_GRENADIER_FLAG_ART_ATLAS',	 2, 			 'JFD_AUSTRIA_JOSEPH_II_ATLAS'
FROM Units WHERE Type = 'UNIT_EE_LINE_INFANTRY'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------	
DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_JFD_GRENADIER'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_GRENADIER',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_EE_LINE_INFANTRY'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
------------------------------	
-- UnitPromotions
------------------------------	
UPDATE UnitPromotions
SET Description = 'TXT_KEY_PROMOTION_JFD_GRENADIER_EE', Help = 'TXT_KEY_PROMOTION_JFD_GRENADIER_HELP_EE'
WHERE Type = 'PROMOTION_JFD_GRENADIER'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
------------------------------	
-- UnitPromotions_UnitClasses
------------------------------	
UPDATE UnitPromotions_UnitClasses
SET UnitClassType = 'UNITCLASS_EE_LINE_INFANTRY'
WHERE PromotionType = 'PROMOTION_JFD_GRENADIER'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
------------------------------	
-- Civilization_UnitClassOverrides
------------------------------
UPDATE Civilization_UnitClassOverrides
SET UnitClassType = 'UNITCLASS_EE_LINE_INFANTRY'
WHERE CivilizationType = 'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II' AND UnitType = 'UNIT_JFD_GRENADIER'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_AustriaJosephII_Decisions.lua');
------------------------------	
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 						DefaultBuilding, 							Description, 								MaxPlayerInstances)
VALUES	('BUILDINGCLASS_DECISIONS_JFD_VIENNA_HOSPITAL', 	'BUILDING_DECISIONS_JFD_VIENNA_HOSPITAL',	'TXT_KEY_DECISIONS_JFD_VIENNA_HOSPITAL',	1);
------------------------------
-- Buildings
------------------------------
INSERT INTO Buildings			
		(Type, 										BuildingClass, 			  						FreeBuildingThisCity,		Cost, 	FaithCost,	Help,											Description, 								Civilopedia,									IconAtlas,		PortraitIndex,	NukeImmune, ConquestProb)
VALUES	('BUILDING_DECISIONS_JFD_VIENNA_HOSPITAL',	'BUILDINGCLASS_DECISIONS_JFD_VIENNA_HOSPITAL',  'BUILDINGCLASS_HOSPITAL',	-1, 	-1,			'TXT_KEY_DECISIONS_JFD_VIENNA_HOSPITAL_HELP',	'TXT_KEY_DECISIONS_JFD_VIENNA_HOSPITAL', 	'TXT_KEY_DECISIONS_JFD_VIENNA_HOSPITAL_PEDIA',	'BW_ATLAS_1',	45,				1,			100);
------------------------------
-- Building_BuildingClassYieldChanges
------------------------------
INSERT INTO Building_BuildingClassYieldChanges
		(BuildingType,								BuildingClassType,			YieldType,			YieldChange)
VALUES	('BUILDING_DECISIONS_JFD_VIENNA_HOSPITAL', 'BUILDINGCLASS_HOSPITAL',	'YIELD_SCIENCE',	2);
------------------------------
-- Policies
------------------------------
INSERT INTO Policies
		(Type,														Description,												HappinessPerTradeRoute)
VALUES	('POLICY_DECISIONS_JFD_AUSTRIA_JOSEPH_II_CHANCELLERIES',	'TXT_KEY_DECISIONS_JFD_AUSTRIA_JOSEPH_II_CHANCELLERIES',	200);
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_AustriaJosephII_Events.lua');
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
VALUES	('TXT_KEY_EVENT_CULDEV_JFD_AUSTRIA_JOSEPH_II_01',	'CIVILIZATION_JFD_AUSTRIA_JOSEPH_II',	'JFD_Central');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies
		(Type,											Description,									GreatMusicianRateModifier)
VALUES	('POLICY_EVENTS_JFD_AUSTRIA_JOSEPH_II_MOZART',	'TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_MOZART',	10);
------------------------------
-- GreatWorks
------------------------------
INSERT INTO GreatWorks 
		(Type, 												GreatWorkClassType,		Description,												Audio,										Image)
VALUES	('GREAT_WORK_EVENTS_JFD_AUSTRIA_JOSEPH_II_MOZART', 	'GREAT_WORK_MUSIC',		'TXT_KEY_GREAT_WORK_EVENTS_JFD_AUSTRIA_JOSEPH_II_MOZART',	'AS2D_LEADER_MUSIC_JFD_JOSEPH_II_MOZART',	'GreatMusician_Background.dds');
------------------------------
-- Units
------------------------------
INSERT INTO Units 	
		(Type, 										Class, Cost, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, Description, ShowInPedia,	UnitArtInfoEraVariation, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas, PortraitIndex, IconAtlas, MoveRate)
SELECT	'UNIT_EVENTS_JFD_AUSTRIA_JOSEPH_II_MOZART',	Class, Cost, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, Description, 0,				UnitArtInfoEraVariation, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas, PortraitIndex, IconAtlas, MoveRate
FROM Units WHERE Type = 'UNIT_MUSICIAN';
------------------------------
-- UnitGameplay2DScripts
------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 									SelectionSound, FirstSelectionSound)
SELECT	'UNIT_EVENTS_JFD_AUSTRIA_JOSEPH_II_MOZART', SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MUSICIAN';
------------------------------
-- Unit_AITypes
------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 									UnitAIType)
SELECT	'UNIT_EVENTS_JFD_AUSTRIA_JOSEPH_II_MOZART', UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MUSICIAN';	
------------------------------
-- Unit_UniqueNames
------------------------------
INSERT INTO Unit_UniqueNames 
		(UnitType, 										UniqueName,													GreatWorkType)
VALUES	('UNIT_EVENTS_JFD_AUSTRIA_JOSEPH_II_MOZART', 	'TXT_KEY_GREAT_PERSON_JFD_AUSTRIA_JOSEPH_II_MOZART_DESC',	'GREAT_WORK_EVENTS_JFD_AUSTRIA_JOSEPH_II_MOZART');
--==========================================================================================================================
--==========================================================================================================================