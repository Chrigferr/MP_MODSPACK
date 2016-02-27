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
VALUES      ('LEADER_JFD_HENRY',	 'POLICY_AGGRESSIVE_X',		'POLICY_CHARISMATIC_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Henry VIII [ICON_WAR][ICON_HAPPINESS_1]'
	ELSE 'TXT_KEY_LEADER_JFD_HENRY' END) 
WHERE Type = 'LEADER_JFD_HENRY';

CREATE TRIGGER CivIVTraitsNicholas
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_HENRY' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Henry VIII [ICON_WAR][ICON_HAPPINESS_1]'
		ELSE 'TXT_KEY_LEADER_JFD_HENRY' END) 
	WHERE Type = 'LEADER_JFD_HENRY';
END;		
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_ENGLAND' )
	THEN '_ENGLAND'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_HENRY_ENGLAND';
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,								X,	Y)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'),	X,	Y
FROM Civilizations_YagemStartPosition WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,								X,	Y)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'),	X,	Y
FROM Civilizations_YahemStartPosition WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,								X,	Y)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'),	X,	Y
FROM Civilizations_CordiformStartPosition WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,								X,	Y)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'),	X,	Y
FROM Civilizations_GreatestEarthStartPosition WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
			(Type,								X,	Y)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'),	X,	Y
FROM Civilizations_EuroGiantStartPosition WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
			(Type,								X,	Y)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'),	X,	Y
FROM Civilizations_EuroLargeStartPosition WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
			(Type,								X,	Y)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'),	X,	Y
FROM Civilizations_NorthAtlanticStartPosition WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_AmericasStartPosition (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasStartPosition
			(Type,								X,	Y)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'),	X,	Y
FROM Civilizations_AmericasStartPosition WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeStartPosition (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthWestEuropeStartPosition
			(Type,								X,	Y)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'),	X,	Y
FROM Civilizations_NorthWestEuropeStartPosition WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_AmericasRequestedResource (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AmericasRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AmericasRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_NorthAtlanticRequestedResource (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeRequestedResource (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthWestEuropeRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthWestEuropeRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,							CultureType,	CultureEra)
VALUES		('CIVILIZATION_JFD_HENRY_ENGLAND',	'BRITISH',		'ANY');
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
			(CivilizationType,						CultureType,		SplashScreenTag,	SoundtrackTag)
VALUES		('CIVILIZATION_JFD_HENRY_ENGLAND',		'JFD_Western',		'JFD_Western',		'JFD_Western');
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Western' )
	THEN 'JFD_Western'
	ELSE 'England' END) 
WHERE Type = 'CIVILIZATION_JFD_HENRY_ENGLAND';
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
			(CivilizationType, 					ColonyName,									LinguisticType)
VALUES		('CIVILIZATION_JFD_HENRY_ENGLAND',	null,										'JFD_Germanic'),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_01',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_02',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_03',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_04',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_05',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_06',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_07',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_08',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_09',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_10',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_11',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_12',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_13',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_14',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_15',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_16',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_17',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_18',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_19',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_20',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_21',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_22',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_23',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_24',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_25',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_26',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_27',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_28',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_29',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_30',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_31',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_32',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_33',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_34',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_35',	null),
			('CIVILIZATION_JFD_HENRY_ENGLAND',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_36',	null);
------------------------------	
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_ENGLAND',				'CIVILIZATION_JFD_HENRY_ENGLAND'),
			('CIVILIZATION_JFD_HENRY_ENGLAND',		'CIVILIZATION_ENGLAND');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'),		('CIVILIZATION_JFD_GREAT_BRITAIN')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_GREAT_BRITAIN');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'),		('CIVILIZATION_JFD_UNITED_KINGDOM')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_UNITED_KINGDOM');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'),		('CIVILIZATION_JFD_SCOTLAND')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_SCOTLAND');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'),		('CIVILIZATION_MC_SCOTLAND')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_MC_SCOTLAND');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_HENRY_ENGLAND'),		('CIVILIZATION_JFD_ANGLO_SAXONS')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_ANGLO_SAXONS');
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
VALUES		('LEADER_JFD_HENRY',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		7);
------------------------------
-- Traits
------------------------------
UPDATE Traits 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Processes WHERE Type = 'PROCESS_JFD_PIETY' )
	THEN 'TXT_KEY_TRAIT_JFD_HENRY_ENGLAND_PIETY'
	ELSE 'TXT_KEY_TRAIT_JFD_HENRY_ENGLAND' END) 
WHERE Type = 'TRAIT_JFD_HENRY_ENGLAND';

CREATE TRIGGER JFD_Traits_HenryEngland
AFTER INSERT ON Traits WHEN 'TRAIT_JFD_HENRY_ENGLAND' = NEW.Type
BEGIN
	UPDATE Traits 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Processes WHERE Type = 'PROCESS_JFD_PIETY' )
		THEN 'TXT_KEY_TRAIT_JFD_HENRY_ENGLAND_PIETY'
		ELSE 'TXT_KEY_TRAIT_JFD_HENRY_ENGLAND' END) 
	WHERE Type = 'TRAIT_JFD_HENRY_ENGLAND';
END;			
--==========================================================================================================================
-- Sukritact's Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_EnglandHenryVIIIDecisions.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies
			(Type,							Description)
VALUES		('POLICY_JFD_HENRY_APPEALS',	'TXT_KEY_DECISIONS_JFD_ENGLAND_HENRY_RESTRAINT_OF_APPEALS');
--==========================================================================================================================
-- Sukritact's Events
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_EnglandHenryVIIIEvents.lua');
--==========================================================================================================================	
-- Tomatekh's Historical Religions
--==========================================================================================================================			
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_CHRISTIAN_ARIANISM' )
	THEN 'RELIGION_CHRISTIAN_ARIANISM'
	ELSE 'RELIGION_CHRISTIANITY' END) 
WHERE Type = 'CIVILIZATION_JFD_THE_VANDALS';

CREATE TRIGGER ReligionVandals
AFTER INSERT ON Religions WHEN 'RELIGION_CHRISTIAN_ARIANISM' = NEW.Type
BEGIN
	UPDATE Civilizations 
	SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_CHRISTIAN_ARIANISM' )
		THEN 'RELIGION_CHRISTIAN_ARIANISM'
		ELSE 'RELIGION_CHRISTIANITY' END) 
	WHERE Type = 'CIVILIZATION_JFD_THE_VANDALS';
END;	
--==========================================================================================================================
--==========================================================================================================================