--=======================================================================================================================
-- Bingle's Civ IV Traits
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,             TraitOne,                  TraitTwo)
VALUES      ('LEADER_JFD_DEGAULLE',	 'POLICY_CHARISMATIC_X',	'POLICY_PROTECTIVE_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Charles de Gaulle [ICON_HAPPINESS_1][ICON_STRENGTH]'
	ELSE 'TXT_KEY_LEADER_JFD_DEGAULLE' END) 
WHERE Type = 'LEADER_JFD_DEGAULLE';

CREATE TRIGGER CivIVTraitsDeGaulleFrance
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_DEGAULLE' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Charles de Gaulle [ICON_HAPPINESS_1][ICON_STRENGTH]]'
		ELSE 'TXT_KEY_LEADER_JFD_DEGAULLE' END) 
	WHERE Type = 'LEADER_JFD_DEGAULLE';
END;
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_FRANCE' )
	THEN '_FRANCE'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_FRANCE_DEGAULLE';
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,								CultureType,	CultureEra)
VALUES		('CIVILIZATION_JFD_FRANCE_DEGAULLE',	'FRENCH',		'ANY');
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
			(CivilizationType,						CultureType,		SplashScreenTag,	SoundtrackTag)
VALUES		('CIVILIZATION_JFD_FRANCE_DEGAULLE',	'JFD_Western',		'JFD_Western',		'JFD_Western');

UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Western' )
	THEN 'JFD_Western'
	ELSE 'France' END) 
WHERE Type = 'CIVILIZATION_JFD_FRANCE_DEGAULLE';
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
			(CivilizationType, 						ColonyName,										LinguisticType)
VALUES		('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	null,											'JFD_Latinate'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_01',	null),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_02',	null),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_03',	null),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_04',	null),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_05',	null),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_06',	null),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_07',	null),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_08',	null),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_09',	null),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_10',	null),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_11',	null),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_12',	null),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_13',	null),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_14',	null),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_15',	null),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_16',	null),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_17',	null),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_18',	null),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_19',	null),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_20',	null),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_21',	null),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_22',	null),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_23',	null),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_24',	null),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_25',	null),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE', 	'TXT_KEY_COLONY_NAME_JFD_FRANCE_DEGAULLE_26',	null);

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_FRANCE',					'CIVILIZATION_JFD_FRANCE_DEGAULLE'),
			('CIVILIZATION_JFD_FRANCE_DEGAULLE',	'CIVILIZATION_FRANCE');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'),	('CIVILIZATION_JFD_NAPOLEONIC_FRANCE')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_NAPOLEONIC_FRANCE');
--==========================================================================================================================	
-- JFD's Piety & Prestige
--==========================================================================================================================			
INSERT OR REPLACE INTO Flavors 
			(Type)
VALUES		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');

INSERT INTO Leader_Flavors
			(LeaderType,			FlavorType,								Flavor)
VALUES		('LEADER_JFD_DEGAULLE',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		3);
--==========================================================================================================================
--==========================================================================================================================
