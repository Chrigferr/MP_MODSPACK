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
            (LeaderType,				TraitOne,					TraitTwo)
VALUES      ('LEADER_JFD_PILSUDSKI',	 'POLICY_CHARISMATIC_X',	'POLICY_PROTECTIVE_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Pilsudski [ICON_HAPPINESS_1][ICON_STRENGTH]'
	ELSE 'TXT_KEY_LEADER_JFD_PILSUDSKI' END) 
WHERE Type = 'LEADER_JFD_PILSUDSKI';

CREATE TRIGGER CivIVTraitsPolandPilsudski
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_PILSUDSKI' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Pilsudski [ICON_HAPPINESS_1][ICON_STRENGTH]]'
		ELSE 'TXT_KEY_LEADER_JFD_PILSUDSKI' END) 
	WHERE Type = 'LEADER_JFD_PILSUDSKI';
END;	
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_POLAND' )
	THEN '_POLAND'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_POLAND_PILSUDSKI';
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_POLAND_PILSUDSKI'),	X,	Y
FROM Civilizations_YagemStartPosition WHERE Type = 'CIVILIZATION_POLAND';
------------------------------------------------------------	
-- Civilizations_YahemStartPosition 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_POLAND_PILSUDSKI'),	X,	Y
FROM Civilizations_YahemStartPosition WHERE Type = 'CIVILIZATION_POLAND';
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_POLAND_PILSUDSKI'),	X,	Y
FROM Civilizations_CordiformStartPosition WHERE Type = 'CIVILIZATION_POLAND';
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_POLAND_PILSUDSKI'),	X,	Y
FROM Civilizations_GreatestEarthStartPosition WHERE Type = 'CIVILIZATION_POLAND';
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_POLAND_PILSUDSKI'),	X,	Y
FROM Civilizations_EuroGiantStartPosition WHERE Type = 'CIVILIZATION_POLAND';
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_POLAND_PILSUDSKI'),	X,	Y
FROM Civilizations_EuroLargeStartPosition WHERE Type = 'CIVILIZATION_POLAND';
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_POLAND_PILSUDSKI'),	X,	Y
FROM Civilizations_NorthAtlanticStartPosition WHERE Type = 'CIVILIZATION_POLAND';
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeStartPosition 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthWestEuropeStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_POLAND_PILSUDSKI'),	X,	Y
FROM Civilizations_NorthWestEuropeStartPosition WHERE Type = 'CIVILIZATION_POLAND';
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_POLAND_PILSUDSKI'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_POLAND';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_POLAND_PILSUDSKI'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_POLAND';
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_POLAND_PILSUDSKI'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_POLAND';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_POLAND_PILSUDSKI'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_POLAND';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_POLAND_PILSUDSKI'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_POLAND';
------------------------------------------------------------	
-- Civilizations_NorthAtlanticRequestedResource
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_POLAND_PILSUDSKI'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE Type = 'CIVILIZATION_POLAND';
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeRequestedResource 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthWestEuropeRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_POLAND_PILSUDSKI'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthWestEuropeRequestedResource WHERE Type = 'CIVILIZATION_POLAND';
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,								CultureType,	CultureEra)
VALUES		('CIVILIZATION_JFD_POLAND_PILSUDSKI',	'SLAVIC',		'ANY');
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
			(CivilizationType,						CultureType,	SplashScreenTag,	SoundtrackTag)
VALUES		('CIVILIZATION_JFD_POLAND_PILSUDSKI',	'JFD_Central',	'JFD_Totalitarian',	'JFD_Totalitarian');
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Totalitarian' )
	THEN 'JFD_Totalitarian'
	ELSE 'Poland' END) 
WHERE Type = 'CIVILIZATION_JFD_POLAND_PILSUDSKI';
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
			(CivilizationType, 						LinguisticType)
VALUES		('CIVILIZATION_JFD_POLAND_PILSUDSKI',	'JFD_Slavic');
------------------------------		
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_POLAND',					'CIVILIZATION_JFD_POLAND_PILSUDSKI'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI',	'CIVILIZATION_POLAND');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_POLAND_PILSUDSKI'),	('CIVILIZATION_JFD_LITHUANIA')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_LITHUANIA');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_POLAND_PILSUDSKI'),	('CIVILIZATION_JFD_POLAND_LITHUANIA')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_POLAND_LITHUANIA');
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
VALUES		('LEADER_JFD_PILSUDSKI',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		5);
--==========================================================================================================================
-- Sukritact's Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_PolandPilsudskiDecisions.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies
			(Type,										Description)
VALUES		('POLICY_JFD_PILSUDSKI_INDUSTRY',			'TXT_KEY_DECISIONS_JFD_POLAND_PILSUDSKI_INDUSTRIAL_DISTRICT'),
			('POLICY_JFD_PILSUDSKI_MONATERY_REFORM',	'TXT_KEY_DECISIONS_JFD_POLAND_PILSUDSKI_MONATERY_REFORM');
------------------------------
-- Policy_BuildingClassYieldModifiers
------------------------------
INSERT INTO Policy_BuildingClassYieldModifiers
			(PolicyType,						BuildingClassType,		YieldType,			YieldMod)
VALUES		('POLICY_JFD_PILSUDSKI_INDUSTRY',	'BUILDINGCLASS_BANK',	'YIELD_GOLD',		15);
------------------------------
-- Policy_ImprovementYieldChanges
------------------------------
INSERT INTO Policy_ImprovementYieldChanges
			(PolicyType,						ImprovementType,						YieldType,			Yield)
VALUES		('POLICY_JFD_PILSUDSKI_INDUSTRY',	'IMPROVEMENT_JFD_POLISH_MANUFACTORY',	'YIELD_GOLD',		1),		
			('POLICY_JFD_PILSUDSKI_INDUSTRY',	'IMPROVEMENT_JFD_POLISH_CUSTOMS_HOUSE',	'YIELD_PRODUCTION',	1);
--==========================================================================================================================
-- Sukritact's Events
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_PolandPilsudskiEvents.lua');
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type, 						 			BuildingClass, 										ExtraSpies, GreatWorkCount, Cost, FaithCost, PrereqTech, NeverCapture,	NukeImmune, Description)
VALUES		('BUILDING_JFD_PILSUDSKI_ENIGMA_CODE', 	'BUILDINGCLASS_JFD_PILSUDSKI_MILITARY_PRODUCTION', 	1,			-1,				-1,   -1, 		 null, 		 1,				1,			'TXT_KEY_BUILDING_JFD_PILSUDSKI_ENIGMA_CODE');
--==========================================================================================================================
--==========================================================================================================================