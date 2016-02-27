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
            (LeaderType,             TraitOne,                  TraitTwo)
VALUES      ('LEADER_JFD_STALIN',	 'POLICY_IMPERIALISTIC_X',	'POLICY_INDUSTRIOUS_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Stalin [ICON_CITY_STATE][ICON_PRODUCTION]'
	ELSE 'TXT_KEY_LEADER_JFD_STALIN' END) 
WHERE Type = 'LEADER_JFD_STALIN';

CREATE TRIGGER CivIVTraitsSovietUnionStalin
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_STALIN' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Stalin [ICON_CITY_STATE][ICON_PRODUCTION]]'
		ELSE 'TXT_KEY_LEADER_JFD_STALIN' END) 
	WHERE Type = 'LEADER_JFD_STALIN';
END;	
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_RUSSIA' )
	THEN '_RUSSIA'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_USSR_STALIN';
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_JFD_USSR_STALIN',		38,		72);
------------------------------------------------------------	
-- Civilizations_YahemStartPosition
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_JFD_USSR_STALIN',		75,		63);
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_JFD_USSR_STALIN',		45,		36);
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_JFD_USSR_STALIN',		63,		56);
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
		(Type,										X,		Y)
VALUES	('CIVILIZATION_JFD_USSR_STALIN',			122,	84);
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_JFD_USSR_STALIN',		60,		53);
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_JFD_USSR_STALIN',		103,	46);
------------------------------------------------------------	
-- Civilizations_AmericasStartPosition 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasStartPosition
			(Type,									X,		Y)
SELECT		('CIVILIZATION_JFD_USSR_STALIN'),		X,		Y
FROM Civilizations_AmericasStartPosition WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeStartPosition
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM Civilizations_NorthWestEuropeStartPosition WHERE Type = 'CIVILIZATION_RUSSIA';
INSERT INTO Civilizations_NorthWestEuropeStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_JFD_USSR_STALIN',		56,		27);
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_USSR_STALIN'),		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_USSR_STALIN'),		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_USSR_STALIN'),		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_USSR_STALIN'),		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_USSR_STALIN'),		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilizations_AmericasRequestedResource 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AmericasRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_USSR_STALIN'),		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AmericasRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilizations_NorthAtlanticRequestedResource
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_USSR_STALIN'),		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeRequestedResource 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthWestEuropeRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_USSR_STALIN'),		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthWestEuropeRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,							CultureType,	CultureEra)
VALUES		('CIVILIZATION_JFD_USSR_STALIN',	'SLAVIC',		'ANY');
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
			(CivilizationType,					CultureType,		SplashScreenTag,	SoundtrackTag)
VALUES		('CIVILIZATION_JFD_USSR_STALIN',	'JFD_Totalitarian',	'JFD_Totalitarian',	'JFD_Totalitarian');
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Totalitarian' )
	THEN 'JFD_Totalitarian'
	ELSE 'Russia' END) 
WHERE Type = 'CIVILIZATION_JFD_USSR_STALIN';
--==========================================================================================================================
-- JFD's Exploration Continued Expanded
--==========================================================================================================================
-- Buildings
------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 											text 									default null,
	Value 											integer 								default 0);

UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_STALIN_COMMISSARIAT_LOYALTY_HELP'
WHERE Type = 'BUILDING_JFD_STALIN_COMMISSARIAT' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_COLONY_LOYALTY' AND Value = 1);
------------------------------	
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
VALUES		('CIVILIZATION_JFD_USSR_STALIN',	'JFD_Slavic');
------------------------------		
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_RUSSIA',					'CIVILIZATION_JFD_USSR_STALIN'),
			('CIVILIZATION_JFD_USSR_STALIN',		'CIVILIZATION_RUSSIA');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_USSR_STALIN'),		('CIVILIZATION_JFD_PETRINE_RUSSIA')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_PETRINE_RUSSIA');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_USSR_STALIN'),		('CIVILIZATION_JFD_USSR_LENIN')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_USSR_LENIN');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_USSR_STALIN'),		('CIVILIZATION_JFD_NICHOLAS_RUSSIA')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_NICHOLAS_RUSSIA');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_USSR_STALIN'),		('CIVILIZATION_JFD_MUSCOVY')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_MUSCOVY');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_USSR_STALIN'),		('CIVILIZATION_JFD_NOVGOROD')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_NOVGOROD');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_USSR_STALIN'),		('CIVILIZATION_JFD_PUTIN_RUSSIA')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_PUTIN_RUSSIA');
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
VALUES		('LEADER_JFD_STALIN',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		0);
--==========================================================================================================================
-- Sukritact's Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_USSRStalinDecisions.lua');
------------------------------
-- GreatWorks
------------------------------
INSERT INTO GreatWorks 
			(Type, 									GreatWorkClassType,		Description,							Audio,							Image)
VALUES		('GREAT_WORK_JFD_STALIN_PROPOGANDA_1', 	'GREAT_WORK_ART',		'TXT_KEY_GREAT_WORK_SOVIET_PROPAGANDA',	'AS2D_GREAT_ARTIST_ARTWORK',	'StalinPropaganda1.dds'),
			('GREAT_WORK_JFD_STALIN_PROPOGANDA_2', 	'GREAT_WORK_ART',		'TXT_KEY_GREAT_WORK_SOVIET_PROPAGANDA',	'AS2D_GREAT_ARTIST_ARTWORK',	'StalinPropaganda2.dds'),
			('GREAT_WORK_JFD_STALIN_PROPOGANDA_3', 	'GREAT_WORK_ART',		'TXT_KEY_GREAT_WORK_SOVIET_PROPAGANDA',	'AS2D_GREAT_ARTIST_ARTWORK',	'StalinPropaganda3.dds');
------------------------------
-- Buildings
------------------------------
INSERT INTO Buildings 	
			(Type, 						 						BuildingClass, 							NeverCapture,	NukeImmune, GreatWorkCount, Cost, FaithCost, PrereqTech, Description, 												Help,															ExtraSpies,	PortraitIndex,	IconAtlas)
VALUES		('BUILDING_JFD_COMMISSARIAT_FOR_INTERNAL_AFFAIRS', 	'BUILDINGCLASS_JFD_STALIN_SATELLITES', 	1,				1,			-1,				-1,   -1, 		 null, 		 'TXT_KEY_BUILDING_JFD_COMMISSARIAT_FOR_INTERNAL_AFFAIRS', 	'TXT_KEY_BUILDING_JFD_COMMISSARIAT_FOR_INTERNAL_AFFAIRS_HELP',	1,			2,				'JFD_USSR_STALIN_ATLAS');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies 
			(Type,															Description,															RiggingElectionModifier,	CommonFoeTourismModifier) 
VALUES		('POLICY_JFD_SOVIET_STALIN_CULT_OF_PERSONALITY',				'TXT_KEY_DECISIONS_JFD_USSR_STALIN_CULT_OF_PERSONALITY',				0,							25),
			('POLICY_JFD_SOVIET_STALIN_COMMISSARIAT_FOR_INTERNAL_AFFAIRS',	'TXT_KEY_DECISIONS_JFD_USSR_STALIN_COMMISSARIAT_FOR_INTERNAL_AFFAIRS',	100,						0);
------------------------------
-- Units
------------------------------
INSERT INTO Units 	
			(Class, Type, 						PrereqTech, Cost, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, Description, 										ShowInPedia, 	UnitArtInfoEraVariation, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas, MoveRate)
SELECT		Class, 	('UNIT_JFD_STALIN_ARTIST'), PrereqTech, Cost, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, ('TXT_KEY_GREAT_PERSON_JFD_STALIN_ARTIST_1_DESC'),	0,				UnitArtInfoEraVariation, UnitArtInfo, 	UnitFlagIconOffset,	UnitFlagAtlas,	PortraitIndex, 	IconAtlas, MoveRate
FROM Units WHERE (Type = 'UNIT_ARTIST');
------------------------------
-- UnitGameplay2DScripts
------------------------------
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_STALIN_ARTIST'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_ARTIST');
------------------------------
-- Unit_AITypes
------------------------------
INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_STALIN_ARTIST'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_ARTIST');	
------------------------------
-- Unit_Flavors
------------------------------
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_STALIN_ARTIST'), FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_ARTIST');	
------------------------------
-- Unit_UniqueNames
------------------------------
INSERT INTO Unit_UniqueNames 
			(UnitType, 					UniqueName,											GreatWorkType)
VALUES		('UNIT_JFD_STALIN_ARTIST', 	'TXT_KEY_GREAT_PERSON_JFD_STALIN_ARTIST_1_DESC',	'GREAT_WORK_JFD_STALIN_PROPOGANDA_1'),
			('UNIT_JFD_STALIN_ARTIST', 	'TXT_KEY_GREAT_PERSON_JFD_STALIN_ARTIST_2_DESC',	'GREAT_WORK_JFD_STALIN_PROPOGANDA_2'),
			('UNIT_JFD_STALIN_ARTIST', 	'TXT_KEY_GREAT_PERSON_JFD_STALIN_ARTIST_3_DESC',	'GREAT_WORK_JFD_STALIN_PROPOGANDA_3');
--==========================================================================================================================
-- Sukritact's Events
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_USSRStalinEvents.lua');
--==========================================================================================================================
--==========================================================================================================================