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
VALUES      ('LEADER_JFD_CHURCHILL', 'POLICY_CHARISMATIC_X',	'POLICY_IMPERIALISTIC_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Churchill [ICON_HAPPINESS_1][ICON_CITY_STATE]'
	ELSE 'TXT_KEY_LEADER_JFD_CHURCHILL' END) 
WHERE Type = 'LEADER_JFD_CHURCHILL';

CREATE TRIGGER CivIVTraitsUnitedKingdom
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_CHURCHILL' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Churchill [ICON_HAPPINESS_1][ICON_CITY_STATE]]'
		ELSE 'TXT_KEY_LEADER_JFD_CHURCHILL' END) 
	WHERE Type = 'LEADER_JFD_CHURCHILL';
END;	
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_ENGLAND')
	THEN '_ENGLAND'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_UNITED_KINGDOM';
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'),	X,	Y
FROM Civilizations_YagemStartPosition WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'),	X,	Y
FROM Civilizations_YahemStartPosition WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'),	X,	Y
FROM Civilizations_CordiformStartPosition WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'),	X,	Y
FROM Civilizations_GreatestEarthStartPosition WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'),	X,	Y
FROM Civilizations_EuroGiantStartPosition WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'),	X,	Y
FROM Civilizations_EuroLargeStartPosition WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'),	X,	Y
FROM Civilizations_NorthAtlanticStartPosition WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_AmericasStartPosition (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'),	X,	Y
FROM Civilizations_AmericasStartPosition WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeStartPosition (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthWestEuropeStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'),	X,	Y
FROM Civilizations_NorthWestEuropeStartPosition WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_AmericasRequestedResource (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AmericasRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AmericasRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_NorthAtlanticRequestedResource (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeRequestedResource (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthWestEuropeRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthWestEuropeRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,							CultureType,	CultureEra)
VALUES		('CIVILIZATION_JFD_UNITED_KINGDOM',	'BRITISH',		'ANY');
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
			(CivilizationType,					CultureType,	SplashScreenTag,	SoundtrackTag)
VALUES		('CIVILIZATION_JFD_UNITED_KINGDOM',	'JFD_Western',	'JFD_Western',		'JFD_Western');
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Western' )
	THEN 'JFD_Western'
	ELSE 'England' END) 
WHERE Type = 'CIVILIZATION_JFD_UNITED_KINGDOM';
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
			(CivilizationType, 					ColonyName,										LinguisticType)
VALUES		('CIVILIZATION_JFD_UNITED_KINGDOM',	null,											'JFD_Germanic'),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_01',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_02',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_03',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_04',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_05',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_06',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_07',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_08',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_09',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_10',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_11',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_12',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_13',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_14',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_15',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_16',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_17',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_18',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_19',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_20',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_21',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_22',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_23',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_24',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_25',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_26',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_27',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_28',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_29',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_30',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_31',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_32',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_33',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_34',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_35',	null),
			('CIVILIZATION_JFD_UNITED_KINGDOM',	'TXT_KEY_COLONY_NAME_JFD_UNITED_KINGDOM_36',	null);
------------------------------	
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_ENGLAND',				'CIVILIZATION_JFD_UNITED_KINGDOM'),
			('CIVILIZATION_JFD_UNITED_KINGDOM',		'CIVILIZATION_ENGLAND');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'),	('CIVILIZATION_JFD_UNITED_KINGDOM')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_UNITED_KINGDOM');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'),	('CIVILIZATION_JFD_GREAT_BRITAIN')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_GREAT_BRITAIN');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'),	('CIVILIZATION_JFD_SCOTLAND')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_SCOTLAND');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'),	('CIVILIZATION_MC_SCOTLAND')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_MC_SCOTLAND');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'),	('CIVILIZATION_JFD_ANGLO_SAXONS')
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
			(LeaderType,				FlavorType,								Flavor)
VALUES		('LEADER_JFD_CHURCHILL',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		4);
--==========================================================================================================================
-- Sukritact's Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_UnitedKingdom_Decisions.lua');
------------------------------
-- BuildingClasses
------------------------------
INSERT INTO BuildingClasses 	
			(Type, 										DefaultBuilding, 									Description)
VALUES		('BUILDINGCLASS_JFD_SPECIAL_RELATIONSHIP',	'BUILDING_JFD_UNITED_KINGDOM_SPECIAL_RELATIONSHIP',	'TXT_KEY_BUILDING_JFD_SPECIAL_RELATIONSHIP');
------------------------------	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type, 						 							BuildingClass, 								Cost,	FaithCost,	PrereqTech, GreatWorkCount, NumTradeRouteBonus, Description, 									Help)
VALUES		('BUILDING_JFD_UNITED_KINGDOM_SPECIAL_RELATIONSHIP', 	'BUILDINGCLASS_JFD_SPECIAL_RELATIONSHIP',	-1,		-1,			null,		-1,				2,					'TXT_KEY_BUILDING_JFD_SPECIAL_RELATIONSHIP',	'TXT_KEY_BUILDING_JFD_SPECIAL_RELATIONSHIP_HELP');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies 
			(Type,												Description,													AttackBonusTurns) 
VALUES		('POLICY_JFD_UNITED_KINGDOM_ADDRESS_THE_NATION',	'TXT_KEY_DECISIONS_JFD_UNITED_KINGDOM_ADDRESS_THE_NATION',		15),
			('POLICY_JFD_UNITED_KINGDOM_SPECIAL_RELATIONSHIP',	'TXT_KEY_DECISIONS_JFD_UNITED_KINGDOM_SPECIAL_RELATIONSHIP',	0);
--==========================================================================================================================
-- Sukritact's Events
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_UnitedKingdom_Events.lua');
--==========================================================================================================================
-- Tomatekh's Historical Religions
--==========================================================================================================================
-- Civilization_Religions
--------------------------------	
UPDATE Civilization_Religions 
SET ReligionType = 
( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_CHRISTIAN_ANGLICANISM' )
	THEN 'RELIGION_CHRISTIAN_ANGLICANISM'
	ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
	THEN 'RELIGION_PROTESTANTISM'
	ELSE 'RELIGION_CHRISTIANITY' END ) END
) WHERE CivilizationType IN ('CIVILIZATION_JFD_UNITED_KINGDOM', 'CIVILIZATION_JFD_ENGLAND');

CREATE TRIGGER ReligionUnitedKingdom
AFTER INSERT ON Religions WHEN 'RELIGION_CHRISTIAN_ANGLICANISM' = NEW.Type
BEGIN
	UPDATE Civilization_Religions 
	SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_CHRISTIAN_ANGLICANISM' )
		THEN 'RELIGION_CHRISTIAN_ANGLICANISM'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
		THEN 'RELIGION_PROTESTANTISM'
		ELSE 'RELIGION_CHRISTIANITY' END ) END
	) WHERE CivilizationType IN ('CIVILIZATION_JFD_UNITED_KINGDOM', 'CIVILIZATION_JFD_ENGLAND');
END;
--==========================================================================================================================
--==========================================================================================================================