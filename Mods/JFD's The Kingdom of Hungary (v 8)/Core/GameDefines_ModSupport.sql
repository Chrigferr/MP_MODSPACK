--=======================================================================================================================
-- Bingle's Civ IV Traits
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,				TraitOne,                  TraitTwo)
VALUES      ('LEADER_JFD_STEPHEN',	 'POLICY_PROTECTIVE_X',		'POLICY_SPIRITUAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Stephen [ICON_STRENGTH][ICON_PEACE]'
	ELSE 'TXT_KEY_LEADER_JFD_STEPHEN' END) 
WHERE Type = 'LEADER_JFD_STEPHEN';

CREATE TRIGGER CivIVTraitsHungary
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_STEPHEN' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Stephen [ICON_STRENGTH][ICON_PEACE]'
		ELSE 'TXT_KEY_LEADER_JFD_STEPHEN' END) 
	WHERE Type = 'LEADER_JFD_STEPHEN';
END;	
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_AUSTRIA' )
	THEN '_AUSTRIA'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_HUNGARY';
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,							X,		Y)
VALUES		('CIVILIZATION_JFD_HUNGARY',	25,		65);

CREATE TABLE IF NOT EXISTS MinorCiv_YagemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_YagemStartPosition WHERE Type IN ('MINOR_CIV_BUDAPEST');
INSERT INTO MinorCiv_YagemStartPosition
			(Type,							X,		Y)
VALUES		('MINOR_CIV_BUDAPEST',			33,		67); -- Lviv
------------------------------------------------------------
-- Civilizations_YahemStartPosition 
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,							X,		Y)
VALUES		('CIVILIZATION_JFD_HUNGARY',	66,		57);

CREATE TABLE IF NOT EXISTS MinorCiv_YahemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_YahemStartPosition WHERE Type IN ('MINOR_CIV_BUDAPEST');
INSERT INTO MinorCiv_YahemStartPosition
			(Type,							X,		Y)
VALUES		('MINOR_CIV_BUDAPEST',			43,		27); -- Lviv
------------------------------------------------------------
-- Civilizations_CordiformStartPosition
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,							X,		Y)
VALUES		('CIVILIZATION_JFD_HUNGARY',	41,		29);

CREATE TABLE IF NOT EXISTS MinorCiv_CordiformStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_CordiformStartPosition WHERE Type IN ('MINOR_CIV_BUDAPEST');
INSERT INTO MinorCiv_CordiformStartPosition
			(Type,							X,		Y)
VALUES		('MINOR_CIV_BUDAPEST',			69,		58); -- Lviv
------------------------------------------------------------
-- Civilizations_GreatestEarthStartPosition
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,							X,		Y)
VALUES		('CIVILIZATION_JFD_HUNGARY',	56,		48);

CREATE TABLE IF NOT EXISTS MinorCiv_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_GreatestEarthStartPosition WHERE Type IN ('MINOR_CIV_BUDAPEST');
INSERT INTO MinorCiv_GreatestEarthStartPosition
			(Type,							X,		Y)
VALUES		('MINOR_CIV_BUDAPEST',			50,		41); -- Lviv
------------------------------------------------------------
-- Civilizations_EuroGiantStartPosition
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
			(Type,							X,		Y)
VALUES		('CIVILIZATION_JFD_HUNGARY',	86,		55);

CREATE TABLE IF NOT EXISTS MinorCiv_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_EuroGiantStartPosition WHERE Type IN ('MINOR_CIV_BUDAPEST');
INSERT INTO MinorCiv_EuroGiantStartPosition
			(Type,							X,		Y)
VALUES		('MINOR_CIV_BUDAPEST',			106,	59); -- Lviv
------------------------------------------------------------
-- Civilizations_EuroLargeStartPosition
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
			(Type,							X,		Y)
VALUES		('CIVILIZATION_JFD_HUNGARY',	43,		41);

CREATE TABLE IF NOT EXISTS MinorCiv_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_EuroLargeStartPosition WHERE Type IN ('MINOR_CIV_BUDAPEST');
INSERT INTO MinorCiv_EuroLargeStartPosition
			(Type,							X,		Y)
VALUES		('MINOR_CIV_BUDAPEST',			59,		51); -- Lviv
------------------------------------------------------------
-- Civilizations_NorthWestEuropeStartPosition
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthWestEuropeStartPosition
			(Type,							X,		Y)
VALUES		('CIVILIZATION_JFD_HUNGARY',	50,		7);

CREATE TABLE IF NOT EXISTS MinorCiv_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_EuroLargeStartPosition WHERE Type IN ('MINOR_CIV_BUDAPEST');
------------------------------------------------------------
-- Civilizations_NorthAltanticStartPosition
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthAltanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAltanticStartPosition
			(Type,							X,		Y)
VALUES		('CIVILIZATION_JFD_HUNGARY',	99,		33);

CREATE TABLE IF NOT EXISTS MinorCiv_NorthAltanticStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_NorthAltanticStartPosition WHERE Type IN ('MINOR_CIV_BUDAPEST');
------------------------------------------------------------
-- Civilizations_YagemRequestedResource
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_HUNGARY'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_AUSTRIA';
------------------------------------------------------------
-- Civilizations_YahemRequestedResource
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_HUNGARY'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_AUSTRIA';
------------------------------------------------------------
-- Civilizations_GreatestEarthRequestedResource
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_HUNGARY'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_AUSTRIA';
------------------------------------------------------------
-- Civilizations_EuroLargeRequestedResource
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_HUNGARY'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_AUSTRIA';
------------------------------------------------------------
-- Civilizations_NorthWestEuropeRequestedResource
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthWestEuropeRequestedResource
			(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_HUNGARY'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthWestEuropeRequestedResource WHERE Type = 'CIVILIZATION_AUSTRIA';
------------------------------------------------------------
-- Civilizations_EuroLargeRequestedResource
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_HUNGARY'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE Type = 'CIVILIZATION_AUSTRIA';
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						CultureType,	CultureEra)
VALUES		('CIVILIZATION_JFD_HUNGARY',	'SLAVIC',		'ANY');
--==========================================================================================================================
-- JFD's Cultural Diversity
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	CultureType 								text										default null,
	SplashScreenTag								text										default	null,
	SoundtrackTag								text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_CultureTypes
			(CivilizationType,				CultureType,	SplashScreenTag,	SoundtrackTag)
VALUES		('CIVILIZATION_JFD_HUNGARY',	'JFD_Central',	'JFD_Central',		'JFD_Mediterranean');
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Mediterranean' )
	THEN 'JFD_Mediterranean'
	ELSE 'Hungary' END) 
WHERE Type = 'CIVILIZATION_JFD_HUNGARY';
--==========================================================================================================================	
-- JFD's Dynamic Top Panel Support
--==========================================================================================================================	
-- JFD_TopPanelIncludes
------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_TopPanelIncludes (
	FileName				text		default null);
	
INSERT OR REPLACE INTO JFD_TopPanelIncludes
		(FileName)
VALUES	('JFD_HungaryDynamicTopPanelSupport.lua');
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
	
INSERT OR REPLACE INTO JFD_TopPanelAdditions
		(CivilizationType,				YieldType,				YieldSourcefunction,		YieldSourceToolTip)
VALUES	('CIVILIZATION_JFD_HUNGARY',	'YIELD_GOLDEN_AGE',		'JFD_HungaryDTPSupport',	'TXT_KEY_JFD_GOLDEN_AGE_FROM_FAITH');
--==========================================================================================================================
-- JFD's Exploration Continued Expanded
--==========================================================================================================================
-- Civilization_JFD_ColonialCityNames
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 					LinguisticType)
VALUES		('CIVILIZATION_JFD_HUNGARY',		'JFD_Slavic'),
			('CIVILIZATION_JFD_HUNGARY',		'JFD_Finno_Ugric');
--==========================================================================================================================	
-- JFD's Piety & Prestige
--==========================================================================================================================			
-- Flavors
------------------------------	
INSERT OR REPLACE INTO Flavors 
			(Type)
VALUES		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------
-- Leader_Flavors
------------------------------
INSERT INTO Leader_Flavors
			(LeaderType,			FlavorType,								Flavor)
VALUES		('LEADER_JFD_STEPHEN',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		9);
------------------------------
-- Traits
------------------------------
UPDATE Traits 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Processes WHERE Type = 'PROCESS_JFD_PIETY' )
	THEN 'TXT_KEY_TRAIT_JFD_HUNGARY_PIETY'
	ELSE 'TXT_KEY_TRAIT_JFD_HUNGARY' END) 
WHERE Type = 'TRAIT_JFD_HUNGARY';

UPDATE Buildings 
SET Help = (CASE WHEN EXISTS(SELECT Type FROM Processes WHERE Type = 'PROCESS_JFD_PIETY' )
	THEN 'TXT_KEY_BUILDING_JFD_VEGVAR_PIETY_HELP'
	ELSE 'TXT_KEY_BUILDING_JFD_VEGVAR_HELP' END) 
WHERE Type = 'BUILDING_JFD_VEGVAR';

CREATE TRIGGER JFD_Traits_Hungary
AFTER INSERT ON Traits WHEN 'TRAIT_JFD_HUNGARY' = NEW.Type
BEGIN
	UPDATE Traits 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Processes WHERE Type = 'PROCESS_JFD_PIETY' )
		THEN 'TXT_KEY_TRAIT_JFD_HUNGARY_PIETY'
		ELSE 'TXT_KEY_TRAIT_JFD_HUNGARY' END) 
	WHERE Type = 'TRAIT_JFD_HUNGARY';

	UPDATE Buildings 
	SET Help = (CASE WHEN EXISTS(SELECT Type FROM Processes WHERE Type = 'PROCESS_JFD_PIETY' )
		THEN 'TXT_KEY_BUILDING_JFD_VEGVAR_PIETY_HELP'
		ELSE 'TXT_KEY_BUILDING_JFD_VEGVAR_HELP' END) 
	WHERE Type = 'BUILDING_JFD_VEGVAR';
END;			
--==========================================================================================================================
-- Sukritact's Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_HungaryDecisions.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies 
			(Type,									Description,									UnitPurchaseCostModifier) 
VALUES		('POLICY_JFD_HUNGARY_ARCHDIOCESE',		'TXT_KEY_DECISIONS_JFD_HUNGARY_ARCHDIOCESE',	0),
			('POLICY_JFD_HUNGARY_BLACK_ARMY',		'TXT_KEY_DECISIONS_JFD_HUNGARY_BLACK_ARMY',		-33);
------------------------------
-- Policy_CityYieldChanges
------------------------------
INSERT INTO Policy_BuildingClassYieldChanges
			(PolicyType, 						BuildingClassType, 			YieldType, 		YieldChange)
VALUES		('POLICY_JFD_HUNGARY_ARCHDIOCESE', 	'BUILDINGCLASS_CATHEDRAL', 	'YIELD_FAITH',	1);
--==========================================================================================================================
-- Sukritact's Events
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_HungaryEvents.lua');
------------------------------	
-- UnitPromotions
------------------------------		
INSERT OR REPLACE INTO UnitPromotions 
			(Type, 										Description, 										Help, 													Sound, 				CannotBeChosen, MovesChange,	IgnoreZOC,	VisibilityChange, 	PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_HUGNARY_FOREIGN_HERO', 		'TXT_KEY_PROMOTION_JFD_HUNGARY_FOREIGN_HERO', 		'TXT_KEY_PROMOTION_JFD_HUNGARY_FOREIGN_HERO_HELP', 		'AS2D_IF_LEVELUP', 	1, 				1,				1,			1, 					58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_HUNGARY_FOREIGN_HERO');
--==========================================================================================================================
--==========================================================================================================================