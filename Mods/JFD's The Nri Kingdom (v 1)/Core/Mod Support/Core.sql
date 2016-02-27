--=======================================================================================================================
-- Bingle's Civ IV Traits
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,         TraitOne,                  TraitTwo)
VALUES      ('LEADER_JFD_ERI',	 'POLICY_CHARISMATIC_X',	'POLICY_SPIRITUAL_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Eri [ICON_HAPPINESS_1][ICON_PEACE]'
	ELSE 'TXT_KEY_LEADER_JFD_ERI' END) 
WHERE Type = 'LEADER_JFD_ERI';

CREATE TRIGGER CivIVTraitsERIFrance
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_ERI' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Eri [ICON_HAPPINESS_1][ICON_PEACE]'
		ELSE 'TXT_KEY_LEADER_JFD_ERI' END) 
	WHERE Type = 'LEADER_JFD_ERI';
END;
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_SONGHAI' )
	THEN '_SONGHAI'
	ELSE '_MED' END) 
WHERE Type = 'CIVILIZATION_JFD_NRI';
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,					CultureType,		CultureEra)
VALUES		('CIVILIZATION_JFD_NRI',	'AFRICAN',			'ANY');
--==========================================================================================================================
-- JFD's Cultural Diversity
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SplashScreenTag, SoundtrackTag);
INSERT OR REPLACE INTO Civilization_JFD_CultureTypes
			(CivilizationType,				CultureType,		SplashScreenTag,	SoundtrackTag)
VALUES		('CIVILIZATION_JFD_NRI',		'JFD_WestAfrican',	'JFD_WestAfrican',	'JFD_WestAfrican');

UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_WestAfrican' )
	THEN 'JFD_WestAfrican'
	ELSE 'Songhai' END) 
WHERE Type = 'CIVILIZATION_JFD_NRI';
--==========================================================================================================================	
-- JFD's Piety & Prestige
--==========================================================================================================================			
INSERT OR REPLACE INTO Flavors 
			(Type)
VALUES		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');

INSERT INTO Leader_Flavors
			(LeaderType,		FlavorType,								Flavor)
VALUES		('LEADER_JFD_ERI',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		8);
--==========================================================================================================================
--==========================================================================================================================
