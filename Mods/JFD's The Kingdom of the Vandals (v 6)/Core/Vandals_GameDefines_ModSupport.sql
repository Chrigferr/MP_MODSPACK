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
VALUES  ('LEADER_JFD_GENSERIC', 'POLICY_AGGRESSIVE_X',	'POLICY_EXPANSIVE_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Genseric [ICON_STRENGTH][ICON_GOLD]'
WHERE Type = 'LEADER_JFD_GENSERIC'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_CARTHAGE'
WHERE Type = 'CIVILIZATION_JFD_THE_VANDALS'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_CARTHAGE');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,								X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_JFD_THE_VANDALS',	18,		52,		18,		50);
------------------------------
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_THE_VANDALS',	58,		50);
------------------------------
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_THE_VANDALS',	34,		26);
------------------------------
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_THE_VANDALS',	47,		35);
------------------------------
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_THE_VANDALS',	59,		14);
------------------------------
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
		(Type,								X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_JFD_THE_VANDALS',	32,		22,		33,		18);
------------------------------
-- Civilizations_ApennineStartPosition (Apennine)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_ApennineStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_ApennineStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_THE_VANDALS',	19,		7);
------------------------------
-- Civilizations_MediterraneanStartPosition (Mediterranean)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_THE_VANDALS',	38,		26);
------------------------------
-- Civilizations_NorthAtlanticStartPosition (North Atlantic)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_THE_VANDALS',	99,		10);
------------------------------
-- Civilizations_AfricaLargeStartPosition (Africa Large)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AfricaLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfricaLargeStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_THE_VANDALS',	26,		72);
------------------------------
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_THE_VANDALS',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_CARTHAGE';
------------------------------
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_THE_VANDALS',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_CARTHAGE';
------------------------------
-- Civilizations_GreatestEarthRequestedResource (Greatest Earth)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_THE_VANDALS',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_CARTHAGE';
------------------------------
-- Civilizations_EuroGiantRequestedResource (Europe Giant)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_THE_VANDALS',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_CARTHAGE';
------------------------------
-- Civilizations_EuroLargeRequestedResource (Europe Large)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_THE_VANDALS',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_CARTHAGE';
------------------------------
-- Civilizations_ApennineRequestedResource (Apennine)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_ApennineRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_ApennineRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_THE_VANDALS',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_ApennineRequestedResource WHERE Type = 'CIVILIZATION_CARTHAGE';
------------------------------
-- Civilizations_MediterraneanRequestedResource (Mediterranean)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MediterraneanRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_THE_VANDALS',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_ApennineRequestedResource WHERE Type = 'CIVILIZATION_CARTHAGE';
------------------------------
-- Civilizations_NorthAtlanticRequestedResource (North Atlantic)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_THE_VANDALS',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE Type = 'CIVILIZATION_CARTHAGE';
------------------------------
-- Civilizations_AfricaLargeRequestedResource (Africa Large)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AfricaLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfricaLargeRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_THE_VANDALS',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AfricaLargeRequestedResource WHERE Type = 'CIVILIZATION_CARTHAGE';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,							CultureType,		CultureEra)
VALUES	('CIVILIZATION_JFD_THE_VANDALS',	'GERMANIC',			'ANY'),
		('CIVILIZATION_JFD_THE_VANDALS',	'MEDITERRANEAN',	'ANY');
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
		(CivilizationType, 					LinguisticType)
VALUES	('CIVILIZATION_JFD_THE_VANDALS',	'JFD_Germanic');
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
SELECT	'CIVILIZATION_JFD_THE_VANDALS',	ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_DENMARK';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Northern'
WHERE Type = 'CIVILIZATION_JFD_THE_VANDALS'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Northern')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================
-- JFD EXPLORATION CONTINUED EXPANDED
--==========================================================================================================================
-- Unit_FreePromotions
------------------------------	
INSERT INTO Unit_FreePromotions
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_TRIHEMIOLIA',		'PROMOTION_JFD_SCURVY_IMMUNITY'
WHERE EXISTS (SELECT Type FROM UnitPromotions WHERE Type = 'PROMOTION_JFD_SCURVY_IMMUNITY');
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
VALUES	('LEADER_JFD_GENSERIC',		'FLAVOR_JFD_MERCENARY',		8);
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
VALUES	('LEADER_JFD_GENSERIC',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	7);
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
SELECT	'CIVILIZATION_JFD_THE_VANDALS',	CurrencyType
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
		(CivilizationType,					LegislatureName, 											OfficeTitle,														GovernmentType,				Weight)
VALUES	('CIVILIZATION_JFD_THE_VANDALS',	'TXT_KEY_JFD_LEGISLATURE_NAME_CIVILIZATION_THE_VANDALS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_THE_VANDALS',	'GOVERNMENT_JFD_MONARCHY',	60);
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
VALUES	('LEADER_JFD_GENSERIC',	'FLAVOR_JFD_REFORM_GOVERNMENT',		9),
		('LEADER_JFD_GENSERIC',	'FLAVOR_JFD_REFORM_CULTURE',		8),
		('LEADER_JFD_GENSERIC',	'FLAVOR_JFD_REFORM_ECONOMIC',		6),
		('LEADER_JFD_GENSERIC',	'FLAVOR_JFD_REFORM_FOREIGN',		8),
		('LEADER_JFD_GENSERIC',	'FLAVOR_JFD_REFORM_INDUSTRY',		7),
		('LEADER_JFD_GENSERIC',	'FLAVOR_JFD_REFORM_MILITARY',		9),
		('LEADER_JFD_GENSERIC',	'FLAVOR_JFD_REFORM_RELIGION',		6);
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_Vandals_Decisions.lua');
------------------------------
-- UnitPromotions
------------------------------	
INSERT INTO UnitPromotions 
		(Type, 								Description, 								Help, 											Sound, 				CannotBeChosen, CaptureDefeatedEnemy,	PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_DECISIONS_JFD_ALANS', 	'TXT_KEY_PROMOTION_DECISIONS_JFD_ALANS',	'TXT_KEY_PROMOTION_DECISIONS_JFD_ALANS_HELP', 	'AS2D_IF_LEVELUP', 	1, 				1,						59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DECISIONS_JFD_ALANS');
------------------------------
-- UnitPromotions_UnitCombats
------------------------------	
INSERT INTO UnitPromotions_UnitCombats 
		(PromotionType, 					UnitCombatType)
VALUES	('PROMOTION_DECISIONS_JFD_ALANS',	'UNITCOMBAT_MOUNTED');
------------------------------
-- Policies
------------------------------	
INSERT INTO Policies 	
		(Type, 							Description)
VALUES	('POLICY_DECISIONS_JFD_ALANS',	'TXT_KEY_DECISIONS_JFD_THE_VANDALS_ALANS');
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
		(PolicyType, 					CivilizationType,				Adjective,										Description,									ShortDescription)
VALUES	('POLICY_DECISIONS_JFD_ALANS',	'CIVILIZATION_JFD_THE_VANDALS',	'TXT_KEY_CIV_JFD_THE_VANDALS_AND_ALANS_ADJ',	'TXT_KEY_CIV_JFD_THE_VANDALS_AND_ALANS_DESC',	'TXT_KEY_CIV_JFD_THE_VANDALS_AND_ALANS_SHORT_DESC');
------------------------------
-- Policy_FreePromotions
------------------------------
INSERT INTO Policy_FreePromotions 	
		(PolicyType, 					PromotionType)
VALUES	('POLICY_DECISIONS_JFD_ALANS', 	'PROMOTION_DECISIONS_JFD_ALANS');
------------------------------	
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 											DefaultBuilding, 						Description)
VALUES	('BUILDINGCLASS_DECISIONS_JFD_VANDAL_TAXES', 	'BUILDING_DECISIONS_JFD_VANDAL_TAXES', 	'TXT_KEY_BUILDING_DECISIONS_JFD_VANDAL_TAXES');
------------------------------	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 									BuildingClass, 								GreatWorkCount,	Cost, FaithCost, NeverCapture,	Description, 									Help)
VALUES	('BUILDING_DECISIONS_JFD_VANDAL_TAXES',	'BUILDINGCLASS_DECISIONS_JFD_VANDAL_TAXES', -1,				-1,   -1, 		 1,				'TXT_KEY_BUILDING_DECISIONS_JFD_VANDAL_TAXES', 	'TXT_KEY_BUILDING_DECISIONS_JFD_VANDAL_TAXES_HELP');
------------------------------
-- Building_YieldChangesPerReligion
------------------------------
INSERT INTO Building_YieldChangesPerReligion 
		(BuildingType, 							YieldType,		Yield) 
VALUES 	('BUILDING_DECISIONS_JFD_VANDAL_TAXES',	'YIELD_GOLD',	200);
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_Vandals_Events.lua');
--==========================================================================================================================
-- TOMATEKH HISTORICAL RELIGIONS
--==========================================================================================================================
-- Civilization_Religions
------------------------------
UPDATE Civilization_Religions 
SET ReligionType = 'RELIGION_CHRISTIAN_ARIANISM'
WHERE CivilizationType = 'CIVILIZATION_JFD_THE_VANDALS'
AND EXISTS (SELECT * FROM Religions WHERE Type = 'RELIGION_CHRISTIAN_ARIANISM');
--==========================================================================================================================
--==========================================================================================================================