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
VALUES      ('LEADER_JFD_PIUS',		'POLICY_DIPLOMATIC_X',		'POLICY_SPIRITUAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Pius IX [ICON_INFLUENCE][ICON_PEACE]'
	ELSE 'TXT_KEY_LEADER_JFD_PIUS' END) 
WHERE Type = 'LEADER_JFD_PIUS';

CREATE TRIGGER CivIVTraitsPapalStates
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_PIUS' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Pius IX [ICON_INFLUENCE][ICON_PEACE]'
		ELSE 'TXT_KEY_LEADER_JFD_PIUS' END) 
	WHERE Type = 'LEADER_JFD_PIUS';
END;	
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_ROME' )
	THEN '_ROME'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_PAPAL_STATES';
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,								X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES',	21,		58,		13,		61);

CREATE TABLE IF NOT EXISTS MinorCiv_YagemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_YagemStartPosition WHERE Type IN ('MINOR_CIV_VATICAN_CITY');
INSERT INTO MinorCiv_YagemStartPosition
			(Type,								X,		Y)
VALUES		('MINOR_CIV_VATICAN_CITY',			27,		57); -- Karyes
------------------------------------------------------------
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,								X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES',	62,		54,		59,		56);

CREATE TABLE IF NOT EXISTS MinorCiv_YahemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_YahemStartPosition WHERE Type IN ('MINOR_CIV_VATICAN_CITY');
INSERT INTO MinorCiv_YahemStartPosition
			(Type,								X,		Y)
VALUES		('MINOR_CIV_VATICAN_CITY',			67,		53); -- Karyes
------------------------------------------------------------
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,								X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES',	37,		24,		34,		26);

CREATE TABLE IF NOT EXISTS MinorCiv_CordiformStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_CordiformStartPosition WHERE Type IN ('MINOR_CIV_VATICAN_CITY');
INSERT INTO MinorCiv_CordiformStartPosition
			(Type,								X,		Y)
VALUES		('MINOR_CIV_VATICAN_CITY',			42,		23); -- Karyes
------------------------------------------------------------
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,								X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES',	50,		42,		42,		43);

CREATE TABLE IF NOT EXISTS MinorCiv_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_GreatestEarthStartPosition WHERE Type IN ('MINOR_CIV_VATICAN_CITY');
INSERT INTO MinorCiv_GreatestEarthStartPosition
			(Type,								X,		Y)
VALUES		('MINOR_CIV_VATICAN_CITY',			56,		43); -- Karyes
------------------------------------------------------------
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
			(Type,								X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES',	63,		36,		50,		45);

CREATE TABLE IF NOT EXISTS MinorCiv_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_EuroGiantStartPosition WHERE Type IN ('MINOR_CIV_VATICAN_CITY');
INSERT INTO MinorCiv_EuroGiantStartPosition
			(Type,								X,		Y)
VALUES		('MINOR_CIV_VATICAN_CITY',			95,		28); -- Karyes
------------------------------------------------------------
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
			(Type,								X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES',	36,		32,		26,		35);

CREATE TABLE IF NOT EXISTS MinorCiv_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_EuroLargeStartPosition WHERE Type IN ('MINOR_CIV_VATICAN_CITY');
INSERT INTO MinorCiv_EuroLargeStartPosition
			(Type,								X,		Y)
VALUES		('MINOR_CIV_VATICAN_CITY',			48,		29); -- Karyes
------------------------------------------------------------
-- Civilizations_ApennineStartPosition (Apennine)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_ApennineStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_ApennineStartPosition
			(Type,								X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES',	29,		33,		5,		48);

CREATE TABLE IF NOT EXISTS MinorCiv_ApennineStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_ApennineStartPosition WHERE Type IN ('MINOR_CIV_VATICAN_CITY');
------------------------------------------------------------
-- Civilizations_MediterraneanStartPosition (Mediterranean)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
			(Type,								X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES',	43,		42,		30,		49);

CREATE TABLE IF NOT EXISTS MinorCiv_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_MediterraneanStartPosition WHERE Type IN ('MINOR_CIV_VATICAN_CITY');
INSERT INTO MinorCiv_MediterraneanStartPosition
			(Type,								X,		Y)
VALUES		('MINOR_CIV_VATICAN_CITY',			64,		37); -- Karyes
------------------------------------------------------------
-- Civilizations_NorthAtlanticStartPosition (North Atlantic)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
			(Type,								X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES',	92,		20,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_NorthAtlanticStartPosition WHERE Type IN ('MINOR_CIV_VATICAN_CITY');
------------------------------------------------------------
-- MinorCiv_AegeanStartPosition (Aegean)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_AegeanStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_AegeanStartPosition WHERE Type IN ('MINOR_CIV_VATICAN_CITY');
INSERT INTO MinorCiv_AegeanStartPosition
			(Type,								X,		Y)
VALUES		('MINOR_CIV_VATICAN_CITY',			17,		38); -- Karyes
------------------------------------------------------------
-- MinorCiv_MesopotamiaStartPosition (Aegean)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCiv_MesopotamiaStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_MesopotamiaStartPosition WHERE Type IN ('MINOR_CIV_VATICAN_CITY');
INSERT INTO MinorCiv_MesopotamiaStartPosition
			(Type,								X,		Y)
VALUES		('MINOR_CIV_VATICAN_CITY',			6,		36); -- Karyes
------------------------------------------------------------
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_PAPAL_STATES'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_PAPAL_STATES'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_PAPAL_STATES'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------
-- Civilizations_EuroGiantRequestedResource (Europe Giant)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_PAPAL_STATES'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------
-- Civilizations_EuroLargeRequestedResource (Europe Large)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_PAPAL_STATES'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------
-- Civilizations_ApennineRequestedResource (Apennine)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_ApennineRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_ApennineRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_PAPAL_STATES'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_ApennineRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------
-- Civilizations_MediterraneanRequestedResource (Mediterranean)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MediterraneanRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_PAPAL_STATES'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_ApennineRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------
-- Civilizations_NorthAtlanticRequestedResource (North Atlantic)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_PAPAL_STATES'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE Type = 'CIVILIZATION_ROME';
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,							CultureType,		CultureEra)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES',	'MEDITERRANEAN',	'ANY');
--==========================================================================================================================
-- JFD's Cultural Diversity
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	CultureType 								text										default null,
	SplashScreenTag								text										default	null,
	SoundtrackTag								text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_CultureTypes
			(CivilizationType,					CultureType,			SplashScreenTag,			SoundtrackTag)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES',	'JFD_Mediterranean',	'JFD_MediterraneanPapal',	'JFD_Mediterranean');

UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Mediterranean' )
	THEN 'JFD_Mediterranean'
	ELSE 'Rome' END) 
WHERE Type = 'CIVILIZATION_JFD_PAPAL_STATES';
--==========================================================================================================================
-- JFD's Exploration Continued Expanded
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 					ColonyName,									LinguisticType)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES',	null,										'JFD_Latinate'),
			('CIVILIZATION_JFD_PAPAL_STATES',	'TXT_KEY_COLONY_NAME_JFD_PAPAL_STATES_01',	null),
			('CIVILIZATION_JFD_PAPAL_STATES',	'TXT_KEY_COLONY_NAME_JFD_PAPAL_STATES_02',	null),
			('CIVILIZATION_JFD_PAPAL_STATES',	'TXT_KEY_COLONY_NAME_JFD_PAPAL_STATES_03',	null),
			('CIVILIZATION_JFD_PAPAL_STATES',	'TXT_KEY_COLONY_NAME_JFD_PAPAL_STATES_04',	null),
			('CIVILIZATION_JFD_PAPAL_STATES',	'TXT_KEY_COLONY_NAME_JFD_PAPAL_STATES_05',	null),
			('CIVILIZATION_JFD_PAPAL_STATES',	'TXT_KEY_COLONY_NAME_JFD_PAPAL_STATES_06',	null),
			('CIVILIZATION_JFD_PAPAL_STATES',	'TXT_KEY_COLONY_NAME_JFD_PAPAL_STATES_07',	null),
			('CIVILIZATION_JFD_PAPAL_STATES',	'TXT_KEY_COLONY_NAME_JFD_PAPAL_STATES_08',	null),
			('CIVILIZATION_JFD_PAPAL_STATES',	'TXT_KEY_COLONY_NAME_JFD_PAPAL_STATES_09',	null),
			('CIVILIZATION_JFD_PAPAL_STATES',	'TXT_KEY_COLONY_NAME_JFD_PAPAL_STATES_10',	null),
			('CIVILIZATION_JFD_PAPAL_STATES',	'TXT_KEY_COLONY_NAME_JFD_PAPAL_STATES_11',	null),
			('CIVILIZATION_JFD_PAPAL_STATES',	'TXT_KEY_COLONY_NAME_JFD_PAPAL_STATES_12',	null),
			('CIVILIZATION_JFD_PAPAL_STATES',	'TXT_KEY_COLONY_NAME_JFD_PAPAL_STATES_13',	null),
			('CIVILIZATION_JFD_PAPAL_STATES',	'TXT_KEY_COLONY_NAME_JFD_PAPAL_STATES_14',	null),
			('CIVILIZATION_JFD_PAPAL_STATES',	'TXT_KEY_COLONY_NAME_JFD_PAPAL_STATES_15',	null),
			('CIVILIZATION_JFD_PAPAL_STATES',	'TXT_KEY_COLONY_NAME_JFD_PAPAL_STATES_16',	null),
			('CIVILIZATION_JFD_PAPAL_STATES',	'TXT_KEY_COLONY_NAME_JFD_PAPAL_STATES_17',	null),
			('CIVILIZATION_JFD_PAPAL_STATES',	'TXT_KEY_COLONY_NAME_JFD_PAPAL_STATES_18',	null),
			('CIVILIZATION_JFD_PAPAL_STATES',	'TXT_KEY_COLONY_NAME_JFD_PAPAL_STATES_19',	null),
			('CIVILIZATION_JFD_PAPAL_STATES',	'TXT_KEY_COLONY_NAME_JFD_PAPAL_STATES_20',	null),
			('CIVILIZATION_JFD_PAPAL_STATES',	'TXT_KEY_COLONY_NAME_JFD_PAPAL_STATES_21',	null),
			('CIVILIZATION_JFD_PAPAL_STATES',	'TXT_KEY_COLONY_NAME_JFD_PAPAL_STATES_22',	null);
------------------------------	
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_ROME',					'CIVILIZATION_JFD_PAPAL_STATES'),
			('CIVILIZATION_JFD_PAPAL_STATES',		'CIVILIZATION_ROME');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_PAPAL_STATES'),		('CIVILIZATION_JFD_PAPAL_STATES_BORGIA')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_PAPAL_STATES_BORGIA');
--==========================================================================================================================	
-- JFD's Piety & Prestige
--==========================================================================================================================			
INSERT OR REPLACE INTO Flavors 
			(Type)
VALUES		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');

INSERT INTO Leader_Flavors
			(LeaderType,			FlavorType,								Flavor)
VALUES		('LEADER_JFD_PIUS',		'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		10);
--==========================================================================================================================
-- Sukritact's Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_PapalStates_Decisions.lua');
------------------------------	
-- Building_ResourcePerEra
------------------------------		
CREATE TABLE IF NOT EXISTS Building_ResourcePerEra (
  BuildingType text,
  ResourceType text,
  Quantity integer default 0,
  InitialQuantity integer default 0
);

INSERT INTO Building_ResourcePerEra 	
			(BuildingType, 						ResourceType,	Quantity, 	InitialQuantity)
SELECT		('BUILDING_JFD_APOSTOLIC_PALACE'), 	Type,			0, 			2
FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES';
--==========================================================================================================================
-- Sukritact's Events
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_PapalStates_Events.lua');
--==========================================================================================================================
--==========================================================================================================================