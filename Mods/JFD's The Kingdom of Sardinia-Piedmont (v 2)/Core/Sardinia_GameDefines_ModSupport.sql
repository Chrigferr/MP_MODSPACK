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
VALUES  ('LEADER_JFD_VICTOR_II', 	'POLICY_CHARISMATIC_X',	'POLICY_IMPERIALISTIC_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Victor Emmanuel II [ICON_HAPPINESS_1][ICON_CITY_STATE]'
WHERE Type = 'LEADER_JFD_VICTOR_II'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_VENICE'
WHERE Type = 'CIVILIZATION_JFD_SARDINIA'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_VENICE');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,							X,		Y)
VALUES	('CIVILIZATION_JFD_SARDINIA',	18,		61);
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,							X,		Y)
VALUES	('CIVILIZATION_JFD_SARDINIA',	60,		57);
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,							X,		Y)
VALUES	('CIVILIZATION_JFD_SARDINIA',	35,		26);
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,							X,		Y)
VALUES	('CIVILIZATION_JFD_SARDINIA',	46,		47);
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
		(Type,							X,		Y)
VALUES	('CIVILIZATION_JFD_SARDINIA',	56,		47);
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
		(Type,							X,		Y)
VALUES	('CIVILIZATION_JFD_SARDINIA',	31,		36);
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
		(Type,							X,		Y)
VALUES	('CIVILIZATION_JFD_SARDINIA',	94,		24);
------------------------------------------------------------	
-- Civilizations_ApennineStartPosition (Apennine)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_ApennineStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_ApennineStartPosition
		(Type,							X,		Y)
VALUES	('CIVILIZATION_JFD_SARDINIA',	14,		52);
------------------------------------------------------------	
-- Civilizations_MediterraneanStartPosition (Mediterranean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
		(Type,							X,		Y)
VALUES	('CIVILIZATION_JFD_SARDINIA',	37,		36);
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_SARDINIA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_VENICE';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_SARDINIA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_VENICE';
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_SARDINIA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_VENICE';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_SARDINIA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_VENICE';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_SARDINIA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_VENICE';
------------------------------------------------------------	
-- Civilizations_ApennineRequestedResource (Apennine)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_ApennineRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_ApennineRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_SARDINIA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_ApennineRequestedResource WHERE Type = 'CIVILIZATION_VENICE';
------------------------------------------------------------	
-- Civilizations_MediterraneanRequestedResource (Mediterranean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MediterraneanRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_SARDINIA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_MediterraneanRequestedResource WHERE Type = 'CIVILIZATION_VENICE';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,						CultureType,		CultureEra)
VALUES	('CIVILIZATION_JFD_SARDINIA',	'MEDITERRANEAN',	'ANY');
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
SELECT	'BUILDING_JFD_PIAZZA',			'AS2D_BUILDING_JFD_PIAZZA'
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
		(CivilizationType,				LinguisticType)
SELECT	'CIVILIZATION_JFD_SARDINIA',	LinguisticType
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
		(CivilizationType,			 ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_SARDINIA', ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_VENICE';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Southern'
WHERE Type = 'CIVILIZATION_JFD_SARDINIA'
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
VALUES	('LEADER_JFD_VICTOR_II',	'FLAVOR_JFD_MERCENARY',		6);
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
		(LeaderType,				FlavorType,							Flavor)
VALUES	('LEADER_JFD_VICTOR_II',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	6);
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
SELECT	'CIVILIZATION_JFD_SARDINIA',	CurrencyType
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
		(CivilizationType,				LegislatureName, 										OfficeTitle,													GovernmentType,				Weight)
VALUES	('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_LEGISLATURE_NAME_CIVILIZATION_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_SARDINIA',	'GOVERNMENT_JFD_MONARCHY',	90);
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
VALUES  ('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SARDINIA_1'),
        ('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SARDINIA_2'),
        ('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SARDINIA_3'),
        ('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SARDINIA_4'),
        ('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SARDINIA_5'),
        ('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SARDINIA_6'),
        ('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SARDINIA_7'),
        ('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SARDINIA_8'),
        ('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SARDINIA_9'),
        ('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SARDINIA_10'),
        ('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SARDINIA_11'),
        ('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SARDINIA_12'),
        ('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SARDINIA_13'),
        ('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SARDINIA_14'),
        ('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SARDINIA_15'),
        ('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SARDINIA_16'),
        ('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SARDINIA_17'),
        ('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SARDINIA_18'),
        ('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SARDINIA_19'),
        ('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SARDINIA_20'),
        ('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SARDINIA_21'),
        ('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SARDINIA_22'),
        ('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SARDINIA_23'),
        ('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SARDINIA_24'),
        ('CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_SARDINIA_25');
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
VALUES	('CIVILIZATION_JFD_SARDINIA',	'PARTY_JFD_LIBERTARIAN',	'TXT_KEY_JFD_PARTY_JFD_LIBERTARIAN_SARDINIA'),
		('CIVILIZATION_JFD_SARDINIA',	'PARTY_JFD_NOBILITY',		'TXT_KEY_JFD_PARTY_JFD_NOBILITY_SARDINIA'),
		('CIVILIZATION_JFD_SARDINIA',	'PARTY_JFD_REVOLUTIONARY',	'TXT_KEY_JFD_PARTY_JFD_REVOLUTIONARY_SARDINIA');
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
		(LeaderType,				FlavorType,							Flavor)
VALUES	('LEADER_JFD_VICTOR_II',	'FLAVOR_JFD_REFORM_GOVERNMENT',		7),
		('LEADER_JFD_VICTOR_II',	'FLAVOR_JFD_REFORM_CULTURE',		3),
		('LEADER_JFD_VICTOR_II',	'FLAVOR_JFD_REFORM_ECONOMIC',		2),
		('LEADER_JFD_VICTOR_II',	'FLAVOR_JFD_REFORM_FOREIGN',		8),
		('LEADER_JFD_VICTOR_II',	'FLAVOR_JFD_REFORM_INDUSTRY',		6),
		('LEADER_JFD_VICTOR_II',	'FLAVOR_JFD_REFORM_MILITARY',		7),
		('LEADER_JFD_VICTOR_II',	'FLAVOR_JFD_REFORM_RELIGION',		6);
--==========================================================================================================================
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- Buildings
------------------------------	
INSERT OR REPLACE INTO Buildings 	
		(Type, 					Happiness, EnhancedYieldTech,	TechEnhancedTourism, LandmarksTourismPercent,	BuildingClass, Cost, GoldMaintenance, PrereqTech, Description, 						Civilopedia, 						Help, 									Strategy,									ArtDefineTag, MinAreaSize, ConquestProb, HurryCostModifier, PortraitIndex, IconAtlas)
SELECT	'BUILDING_JFD_PIAZZA',	Happiness, PrereqTech,			2,					 15,						BuildingClass, Cost, GoldMaintenance, PrereqTech, 'TXT_KEY_BUILDING_JFD_PIAZZA',	'TXT_KEY_CIV5_JFD_PIAZZA_TEXT', 	'TXT_KEY_BUILDING_JFD_PIAZZA_HELP', 	'TXT_KEY_BUILDING_JFD_PIAZZA_STRATEGY_EE',	ArtDefineTag, MinAreaSize, ConquestProb, HurryCostModifier, 2, 			'JFD_SARDINIA_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_EE_MENAGERIE'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');	

UPDATE Buildings
SET TechEnhancedTourism = 0, EnhancedYieldTech = null
WHERE Type = 'BUILDING_JFD_PIAZZA'
AND EXISTS (SELECT * FROM Yields WHERE Type = 'YIELD_TOURISM');
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
DELETE FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_JFD_PIAZZA'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 			BuildingClassType)
SELECT	'BUILDING_JFD_PIAZZA',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_EE_MENAGERIE';
------------------------------
-- Civilization_BuildingClassOverrides
------------------------------	
UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_EE_MENAGERIE'
WHERE CivilizationType = 'CIVILIZATION_JFD_SARDINIA'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_Sardinia_Decisions.lua');
------------------------------
-- Policies
------------------------------	
INSERT INTO Policies 	
		(Type, 							Description)
VALUES	('POLICY_DECISIONS_JFD_ITALY',	'TXT_KEY_DECISIONS_JFD_SARDINIA_FORM_ITALY');
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
		(PolicyType, 					CivilizationType,				Adjective,									Description,							ShortDescription)
VALUES	('POLICY_DECISIONS_JFD_ITALY',	'CIVILIZATION_JFD_SARDINIA',	'TXT_KEY_CIV_JFD_ITALY_SARDINIA_ADJECTIVE', 'TXT_KEY_CIV_JFD_ITALY_SARDINIA_DESC',	'TXT_KEY_CIV_JFD_ITALY_SARDINIA_SHORT_DESC');
------------------------------------------------------------	
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 								DefaultBuilding, 									Description, 												MaxPlayerInstances)
VALUES	('BUILDINGCLASS_DECISIONS_JFD_ROYAL_VINEYARD', 				'BUILDING_DECISIONS_JFD_VE_ROYAL_VINEYARD', 		'TXT_KEY_DECISIONS_JFD_VE_ROYAL_VINEYARD',					1),
		('BUILDINGCLASS_DECISIONS_JFD_ROYAL_VINEYARD_HAPPINESS', 	'BUILDING_DECISIONS_JFD_ROYAL_VINEYARD_HAPPINESS', 	'TXT_KEY_BUILDING_DECISIONS_JFD_ROYAL_VINEYARD_HAPPINESS',	-1);
------------------------------
-- Buildings
------------------------------
INSERT INTO Buildings			
		(Type, 													BuildingClass, 			  						Cost, 	FaithCost,	GreatWorkCount, PrereqTech, Help,													Description, 										Civilopedia,											IconAtlas,				PortraitIndex,	NukeImmune, ConquestProb)
VALUES	('BUILDING_DECISIONS_JFD_ROYAL_VINEYARD',				'BUILDINGCLASS_DECISIONS_JFD_ROYAL_VINEYARD', 	-1, 	-1,			-1,				null, 		'TXT_KEY_BUILDING_DECISIONS_JFD_ROYAL_VINEYARD_HELP',	'TXT_KEY_BUILDING_DECISIONS_JFD_ROYAL_VINEYARD', 	'TXT_KEY_BUILDING_DECISIONS_JFD_ROYAL_VINEYARD_PEDIA',	'JFD_SARDINIA_ATLAS',	5,				1,			100);

INSERT INTO Buildings 	
		(Type, 						 							BuildingClass, 												GreatWorkCount, Cost, FaithCost, PrereqTech, UnmoddedHappiness,		NeverCapture,	Description, 												Help)
VALUES	('BUILDING_DECISIONS_JFD_ROYAL_VINEYARD_HAPPINESS',		'BUILDINGCLASS_DECISIONS_JFD_ROYAL_VINEYARD_HAPPINESS', 	-1, 			-1,   -1, 		 null, 		 1,						1,				'TXT_KEY_BUILDING_DECISIONS_JFD_ROYAL_VINEYARD_HAPPINESS', 	'TXT_KEY_BUILDING_DECISIONS_JFD_ROYAL_VINEYARD_HAPPINESS_HELP');
------------------------------
-- Building_ResourceQuantity
------------------------------	
INSERT INTO Building_ResourceQuantity 	
		(BuildingType, 								ResourceType,		Quantity)
VALUES	('BUILDING_DECISIONS_JFD_ROYAL_VINEYARD',	'RESOURCE_WINE',	2);
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_Sardinia_Events.lua');
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
VALUES	('TXT_KEY_EVENT_CULDEV_JFD_SARDINIA_01',	'CIVILIZATION_JFD_SARDINIA',	'JFD_Southern');
--==========================================================================================================================
--==========================================================================================================================