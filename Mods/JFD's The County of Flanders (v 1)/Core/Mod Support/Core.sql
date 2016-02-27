--=======================================================================================================================
-- Bingle's Civ IV Traits
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,			TraitOne,					TraitTwo)
VALUES      ('LEADER_JFD_ROBRECHT',	 'POLICY_FINANCIAL_X',		'POLICY_MERCANTILE_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Robrecht III [ICON_TRADE][ICON_GOLD]'
	ELSE 'TXT_KEY_LEADER_JFD_ROBRECHT' END) 
WHERE Type = 'LEADER_JFD_ROBRECHT';

CREATE TRIGGER CivIVTraitsROBRECHTFrance
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_ROBRECHT' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Robrecht III [ICON_TRADE][ICON_GOLD]'
		ELSE 'TXT_KEY_LEADER_JFD_ROBRECHT' END) 
	WHERE Type = 'LEADER_JFD_ROBRECHT';
END;
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_NETHERLANDS' )
	THEN '_NETHERLANDS'
	ELSE '_MED' END) 
WHERE Type = 'CIVILIZATION_JFD_FLANDERS';
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						CultureType,	CultureEra)
VALUES		('CIVILIZATION_JFD_FLANDERS',	'GERMANIC',		'ANY');
--==========================================================================================================================
-- JFD's Cultural Diversity
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SplashScreenTag, SoundtrackTag);
INSERT OR REPLACE INTO Civilization_JFD_CultureTypes
			(CivilizationType,				CultureType,	SplashScreenTag,	SoundtrackTag)
VALUES		('CIVILIZATION_JFD_FLANDERS',	'JFD_Western',	'JFD_Western',		'JFD_Western');

UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Western' )
	THEN 'JFD_Western'
	ELSE 'Germany' END) 
WHERE Type = 'CIVILIZATION_JFD_FLANDERS';
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
			(CivilizationType,				LinguisticType)
VALUES		('CIVILIZATION_JFD_FLANDERS',	'JFD_Germanic'),
			('CIVILIZATION_JFD_FLANDERS',	'JFD_Latinate');
--==========================================================================================================================	
-- JFD's Piety & Prestige
--==========================================================================================================================			
INSERT OR REPLACE INTO Flavors 
			(Type)
VALUES		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');

INSERT INTO Leader_Flavors
			(LeaderType,			FlavorType,								Flavor)
VALUES		('LEADER_JFD_ROBRECHT',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		4);
--==========================================================================================================================
--==========================================================================================================================
