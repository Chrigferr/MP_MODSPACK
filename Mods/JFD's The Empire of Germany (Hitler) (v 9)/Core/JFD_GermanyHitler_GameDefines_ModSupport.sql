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
VALUES      ('LEADER_JFD_HITLER',	 'POLICY_AGGRESSIVE_X',		'POLICY_INVENTIVE_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Hitler [ICON_WAR][ICON_RESEARCH]'
	ELSE 'TXT_KEY_LEADER_JFD_HITLER' END) 
WHERE Type = 'LEADER_JFD_HITLER';

CREATE TRIGGER CivIVTraitsNaziGermany
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_HITLER' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Hitler [ICON_WAR][ICON_RESEARCH]]'
		ELSE 'TXT_KEY_LEADER_JFD_HITLER' END) 
	WHERE Type = 'LEADER_JFD_HITLER';
END;		
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_GERMANY' )
	THEN '_GERMANY'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_NAZI_GERMANY';
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,								X,	Y)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'),	X,	Y
FROM Civilizations_YagemStartPosition WHERE (Type = 'CIVILIZATION_GERMANY');
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,								X,	Y)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'),	X,	Y
FROM Civilizations_YahemStartPosition WHERE (Type = 'CIVILIZATION_GERMANY');
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,								X,	Y)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'),	X,	Y
FROM Civilizations_CordiformStartPosition WHERE (Type = 'CIVILIZATION_GERMANY');
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,								X,	Y)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'),	X,	Y
FROM Civilizations_GreatestEarthStartPosition WHERE (Type = 'CIVILIZATION_GERMANY');
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
			(Type,								X,	Y)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'),	X,	Y
FROM Civilizations_EuroGiantStartPosition WHERE (Type = 'CIVILIZATION_GERMANY');
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
			(Type,								X,	Y)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'),	X,	Y
FROM Civilizations_EuroLargeStartPosition WHERE (Type = 'CIVILIZATION_GERMANY');
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
			(Type,								X,	Y)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'),	X,	Y
FROM Civilizations_NorthAtlanticStartPosition WHERE (Type = 'CIVILIZATION_GERMANY');
------------------------------------------------------------	
-- Civilizations_AmericasStartPosition (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasStartPosition
			(Type,								X,	Y)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'),	X,	Y
FROM Civilizations_AmericasStartPosition WHERE (Type = 'CIVILIZATION_GERMANY');
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeStartPosition (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthWestEuropeStartPosition
			(Type,								X,	Y)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'),	X,	Y
FROM Civilizations_NorthWestEuropeStartPosition WHERE (Type = 'CIVILIZATION_GERMANY');
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE (Type = 'CIVILIZATION_GERMANY');
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE (Type = 'CIVILIZATION_GERMANY');
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE (Type = 'CIVILIZATION_GERMANY');
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE (Type = 'CIVILIZATION_GERMANY');
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE (Type = 'CIVILIZATION_GERMANY');
------------------------------------------------------------	
-- Civilizations_AmericasRequestedResource (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AmericasRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AmericasRequestedResource WHERE (Type = 'CIVILIZATION_GERMANY');
------------------------------------------------------------	
-- Civilizations_NorthAtlanticRequestedResource (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE (Type = 'CIVILIZATION_GERMANY');
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeRequestedResource (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthWestEuropeRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthWestEuropeRequestedResource WHERE (Type = 'CIVILIZATION_GERMANY');
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,							CultureType,	CultureEra)
VALUES		('CIVILIZATION_JFD_NAZI_GERMANY',	'GERMANIC',		'ANY');
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
			(CivilizationType,					CultureType,			SplashScreenTag,		SoundtrackTag)
VALUES		('CIVILIZATION_JFD_NAZI_GERMANY',	'JFD_Totalitarian',		'JFD_Totalitarian',		'JFD_Totalitarian');
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Totalitarian' )
	THEN 'JFD_Totalitarian'
	ELSE 'Germany' END) 
WHERE Type = 'CIVILIZATION_JFD_NAZI_GERMANY';
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
VALUES		('CIVILIZATION_JFD_NAZI_GERMANY',		null,											'JFD_Germanic'),
			('CIVILIZATION_JFD_NAZI_GERMANY',		'TXT_KEY_COLONY_NAME_JFD_NAZI_GERMANY_01',		null),
			('CIVILIZATION_JFD_NAZI_GERMANY',		'TXT_KEY_COLONY_NAME_JFD_NAZI_GERMANY_02',		null),
			('CIVILIZATION_JFD_NAZI_GERMANY',		'TXT_KEY_COLONY_NAME_JFD_NAZI_GERMANY_03',		null),
			('CIVILIZATION_JFD_NAZI_GERMANY',		'TXT_KEY_COLONY_NAME_JFD_NAZI_GERMANY_04',		null),
			('CIVILIZATION_JFD_NAZI_GERMANY',		'TXT_KEY_COLONY_NAME_JFD_NAZI_GERMANY_05',		null),
			('CIVILIZATION_JFD_NAZI_GERMANY',		'TXT_KEY_COLONY_NAME_JFD_NAZI_GERMANY_06',		null);
------------------------------	
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_GERMANY',				'CIVILIZATION_JFD_NAZI_GERMANY'),
			('CIVILIZATION_JFD_NAZI_GERMANY',		'CIVILIZATION_GERMANY');
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
VALUES		('LEADER_JFD_HITLER',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		0);
--==========================================================================================================================
-- Sukritact's Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_GermanyHitler_Decisions.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies 
			(Type,										Description) 
VALUES		('POLICY_JFD_NAZI_GERMANY_LUFTWAFFE',		'TXT_KEY_DECISIONS_JFD_NAZI_GERMANY_LUFTWAFFE'),
			('POLICY_JFD_NAZI_GERMANY_FUHRERPRINZIP',	'TXT_KEY_DECISIONS_JFD_NAZI_GERMANY_FUHRERPRINZIP');
------------------------------
-- Policy_BuildingClassHappiness
------------------------------
INSERT INTO Policy_BuildingClassHappiness 
			(PolicyType, 								BuildingClassType,				Happiness)
VALUES		('POLICY_JFD_NAZI_GERMANY_FUHRERPRINZIP', 	'BUILDINGCLASS_CONSTABLE',		2),
			('POLICY_JFD_NAZI_GERMANY_FUHRERPRINZIP', 	'BUILDINGCLASS_POLICE_STATION',	2);
------------------------------
-- Policy_BuildingClassProductionModifiers
------------------------------
INSERT INTO Policy_BuildingClassProductionModifiers 
			(PolicyType, 								BuildingClassType,				ProductionModifier)
VALUES		('POLICY_JFD_NAZI_GERMANY_FUHRERPRINZIP', 	'BUILDINGCLASS_CONSTABLE',		50),
			('POLICY_JFD_NAZI_GERMANY_FUHRERPRINZIP', 	'BUILDINGCLASS_POLICE_STATION',	50);
------------------------------
-- Policy_UnitCombatProductionModifiers
------------------------------
INSERT INTO Policy_UnitCombatProductionModifiers 
			(PolicyType, 								UnitCombatType,					ProductionModifier)
VALUES		('POLICY_JFD_NAZI_GERMANY_LUFTWAFFE', 		'UNITCOMBAT_BOMBER',			10),
			('POLICY_JFD_NAZI_GERMANY_LUFTWAFFE', 		'UNITCOMBAT_FIGHTER',			10),
			('POLICY_JFD_NAZI_GERMANY_LUFTWAFFE', 		'UNITCOMBAT_HELICOPTER',		10);
------------------------------
-- Policy_UnitCombatFreeExperiences
------------------------------
INSERT INTO Policy_UnitCombatFreeExperiences 
			(PolicyType, 								UnitCombatType,					FreeExperience)
VALUES		('POLICY_JFD_NAZI_GERMANY_LUFTWAFFE', 		'UNITCOMBAT_FIGHTER',			20),
			('POLICY_JFD_NAZI_GERMANY_LUFTWAFFE', 		'UNITCOMBAT_BOMBER',			20),
			('POLICY_JFD_NAZI_GERMANY_LUFTWAFFE', 		'UNITCOMBAT_HELICOPTER',		20);
--==========================================================================================================================
-- Sukritact's Events
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_GermanyHitler_Events.lua');
--==========================================================================================================================
--==========================================================================================================================