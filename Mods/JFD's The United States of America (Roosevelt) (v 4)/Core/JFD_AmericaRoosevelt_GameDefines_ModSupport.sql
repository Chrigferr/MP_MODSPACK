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
VALUES      ('LEADER_JFD_ROOSEVELT',	'POLICY_CHARISMATIC_X',		'POLICY_FINANCIAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Roosevelt [ICON_HAPPINESS_1][ICON_TRADE]'
	ELSE 'TXT_KEY_LEADER_JFD_ROOSEVELT' END) 
WHERE Type = 'LEADER_JFD_ROOSEVELT';

CREATE TRIGGER CivIVTraitsAmericaRoosevelt
AFTER INSERT ON Leaders WHEN 'ICON_CITY_STATE' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Roosevelt [ICON_HAPPINESS_1][ICON_TRADE]]'
		ELSE 'TXT_KEY_LEADER_JFD_ROOSEVELT' END) 
	WHERE Type = 'LEADER_JFD_ROOSEVELT';
END;		
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_AMERICA' )
	THEN '_AMERICA'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_AMERICA_ROOSEVELT';
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_AMERICA_ROOSEVELT'),	X,	Y
FROM Civilizations_YagemStartPosition WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_AMERICA_ROOSEVELT'),	X,	Y
FROM Civilizations_YahemStartPosition WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_AMERICA_ROOSEVELT'),	X,	Y
FROM Civilizations_CordiformStartPosition WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_AMERICA_ROOSEVELT'),	X,	Y
FROM Civilizations_GreatestEarthStartPosition WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_AMERICA_ROOSEVELT'),	X,	Y
FROM Civilizations_NorthAtlanticStartPosition WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_AmericasStartPosition (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_AMERICA_ROOSEVELT'),	X,	Y
FROM Civilizations_AmericasStartPosition WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_AMERICA_ROOSEVELT'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_AMERICA_ROOSEVELT'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_AMERICA_ROOSEVELT'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_AmericasRequestedResource (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AmericasRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_AMERICA_ROOSEVELT'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AmericasRequestedResource WHERE (Type = 'CIVILIZATION_AMERICA');
------------------------------------------------------------	
-- Civilizations_NorthAtlanticRequestedResource (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_AMERICA_ROOSEVELT'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE (Type = 'CIVILIZATION_AMERICA');
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,								CultureType,		CultureEra)
VALUES		('CIVILIZATION_JFD_AMERICA_ROOSEVELT',	'BRITISH',			'ANY'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT',	'FIRST_AMERICANS',	'ANY'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT',	'SPANISH',			'MODERN');
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
VALUES		('CIVILIZATION_JFD_AMERICA_ROOSEVELT',	'JFD_Colonial',		'JFD_Colonial',		'JFD_Colonial');
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Colonial' )
	THEN 'JFD_Colonial'
	ELSE 'America' END) 
WHERE Type = 'CIVILIZATION_JFD_AMERICA_ROOSEVELT';
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
			(CivilizationType, 						ColonyName,										LinguisticType)
VALUES		('CIVILIZATION_JFD_AMERICA_ROOSEVELT',	null,											'JFD_Germanic'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT',	null,											'JFD_Latinate'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT',	'TXT_KEY_COLONY_NAME_JFD_AMERICA_ROOSEVELT_01',	null),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT',	'TXT_KEY_COLONY_NAME_JFD_AMERICA_ROOSEVELT_02',	null),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT',	'TXT_KEY_COLONY_NAME_JFD_AMERICA_ROOSEVELT_03',	null),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT',	'TXT_KEY_COLONY_NAME_JFD_AMERICA_ROOSEVELT_04',	null),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT',	'TXT_KEY_COLONY_NAME_JFD_AMERICA_ROOSEVELT_05',	null),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT',	'TXT_KEY_COLONY_NAME_JFD_AMERICA_ROOSEVELT_06',	null),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT',	'TXT_KEY_COLONY_NAME_JFD_AMERICA_ROOSEVELT_07',	null),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT',	'TXT_KEY_COLONY_NAME_JFD_AMERICA_ROOSEVELT_08',	null),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT',	'TXT_KEY_COLONY_NAME_JFD_AMERICA_ROOSEVELT_09',	null),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT',	'TXT_KEY_COLONY_NAME_JFD_AMERICA_ROOSEVELT_10',	null),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT',	'TXT_KEY_COLONY_NAME_JFD_AMERICA_ROOSEVELT_11',	null),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT',	'TXT_KEY_COLONY_NAME_JFD_AMERICA_ROOSEVELT_12',	null);
------------------------------	
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_AMERICA',				'CIVILIZATION_JFD_AMERICA_ROOSEVELT'),
			('CIVILIZATION_ENGLAND',				'CIVILIZATION_JFD_AMERICA_ROOSEVELT'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT',	'CIVILIZATION_AMERICA');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_AMERICA_ROOSEVELT'),	('CIVILIZATION_JFD_AMERICA_LINCOLN')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_AMERICA_LINCOLN');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_GREAT_BRITAIN'),		('CIVILIZATION_JFD_AMERICA_ROOSEVELT')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_GREAT_BRITAIN');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_AMERICA_HENRY'),		('CIVILIZATION_JFD_AMERICA_ROOSEVELT')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_AMERICA_HENRY');
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
			(LeaderType,				FlavorType,								Flavor)
VALUES		('LEADER_JFD_ROOSEVELT',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		0);
--==========================================================================================================================
-- Sukritact's Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_AmericaRoosevelt_Decisions.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies 
			(Type,									Description) 
VALUES		('POLICY_JFD_EMERGENCY_RELIEF_ADMIN',	'TXT_KEY_DECISIONS_JFD_AMERICA_ROOSEVELT_EMERGENCY_RELIEF_ADMINISTRATION'),
			('POLICY_JFD_ARSENAL_OF_DEMOCRACY',		'TXT_KEY_DECISIONS_JFD_AMERICA_ROOSEVELT_ARSENAL_OF_DEMOCRACY');
------------------------------
-- Policy_CityYieldChanges
------------------------------
INSERT INTO Policy_YieldModifiers
			(PolicyType, 							YieldType, 		Yield)
VALUES		('POLICY_JFD_EMERGENCY_RELIEF_ADMIN', 	'YIELD_GOLD', 	10);
------------------------------
-- Policy_ImprovementYieldChanges
------------------------------
INSERT INTO Policy_ImprovementYieldChanges
			(PolicyType, 							ImprovementType, 				YieldType, 			Yield)
VALUES		('POLICY_JFD_ARSENAL_OF_DEMOCRACY', 	'IMPROVEMENT_MANUFACTORY', 		'YIELD_PRODUCTION', 1),
			('POLICY_JFD_EMERGENCY_RELIEF_ADMIN', 	'IMPROVEMENT_CUSTOMS_HOUSE', 	'YIELD_GOLD',		1);
--==========================================================================================================================
-- Sukritact's Events
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_AmericaRoosevelt_Events.lua');
--==========================================================================================================================
-- Tomatekh's Historical Religions
--==========================================================================================================================
-- Civilization_Religions
------------------------------
UPDATE Civilization_Religions 
SET ReligionType = 
( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_CHRISTIAN_ANGLICANISM' )
	THEN 'RELIGION_CHRISTIAN_ANGLICANISM'
	ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
	THEN 'RELIGION_PROTESTANTISM'
	ELSE 'RELIGION_CHRISTIANITY' END ) END
) WHERE CivilizationType = 'CIVILIZATION_JFD_AMERICA_ROOSEVELT';

CREATE TRIGGER ReligionRoosevelt
AFTER INSERT ON Religions WHEN 'RELIGION_CHRISTIAN_ANGLICANISM' = NEW.Type
BEGIN
	UPDATE Civilization_Religions 
	SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_CHRISTIAN_ANGLICANISM' )
		THEN 'RELIGION_CHRISTIAN_ANGLICANISM'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
		THEN 'RELIGION_PROTESTANTISM'
		ELSE 'RELIGION_CHRISTIANITY' END ) END
	) WHERE CivilizationType = 'CIVILIZATION_JFD_AMERICA_ROOSEVELT';
END;
--==========================================================================================================================
--==========================================================================================================================