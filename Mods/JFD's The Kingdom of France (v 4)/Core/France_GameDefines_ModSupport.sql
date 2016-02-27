--=======================================================================================================================
-- BINGLES CIV IV TRAITS
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT INTO Leader_SharedTraits
        (LeaderType,				TraitOne,				TraitTwo)
VALUES  ('LEADER_JFD_LOUIS_XIV',	'POLICY_CREATIVE_X',	'POLICY_INDUSTRIOUS_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Louis XIV [ICON_CULTURE][ICON_PRODUCTION]'
WHERE Type = 'LEADER_JFD_LOUIS_XIV'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================	
-- JFD AND POUAKAI MERCENARIES
--==========================================================================================================================
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_MERCENARY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,				 Flavor)
VALUES	('LEADER_JFD_LOUIS_XIV',	'FLAVOR_JFD_MERCENARY',	 7);
--==========================================================================================================================	
-- JFD PIETY
--==========================================================================================================================			
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,							 Flavor)
VALUES	('LEADER_JFD_LOUIS_XIV',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	 8);
--==========================================================================================================================	
-- JFD SOVEREIGNTY
--==========================================================================================================================			
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	HeadOfGovernmentName			text 		 												default null);

DELETE FROM Civilization_JFD_HeadsOfGovernment WHERE CivilizationType = 'CIVILIZATION_FRANCE';
INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,      	HeadOfGovernmentName)
VALUES  ('CIVILIZATION_FRANCE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_LOUIS_XIV_1'),
		('CIVILIZATION_FRANCE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_LOUIS_XIV_2'),
        ('CIVILIZATION_FRANCE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_LOUIS_XIV_3'),
        ('CIVILIZATION_FRANCE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_LOUIS_XIV_4'),
        ('CIVILIZATION_FRANCE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_LOUIS_XIV_5'),
        ('CIVILIZATION_FRANCE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_LOUIS_XIV_6'),
        ('CIVILIZATION_FRANCE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_LOUIS_XIV_7'),
        ('CIVILIZATION_FRANCE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_LOUIS_XIV_8'),
        ('CIVILIZATION_FRANCE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_LOUIS_XIV_9'),
        ('CIVILIZATION_FRANCE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_LOUIS_XIV_10'),
        ('CIVILIZATION_FRANCE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_LOUIS_XIV_11'),
        ('CIVILIZATION_FRANCE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_LOUIS_XIV_12'),
        ('CIVILIZATION_FRANCE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_LOUIS_XIV_13'),
        ('CIVILIZATION_FRANCE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_LOUIS_XIV_14'),
        ('CIVILIZATION_FRANCE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_LOUIS_XIV_15'),
        ('CIVILIZATION_FRANCE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_LOUIS_XIV_16'),
        ('CIVILIZATION_FRANCE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_LOUIS_XIV_17'),
        ('CIVILIZATION_FRANCE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_LOUIS_XIV_18'),
        ('CIVILIZATION_FRANCE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_LOUIS_XIV_19'),
        ('CIVILIZATION_FRANCE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_LOUIS_XIV_20'),
        ('CIVILIZATION_FRANCE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_LOUIS_XIV_21'),
        ('CIVILIZATION_FRANCE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_LOUIS_XIV_22'),
        ('CIVILIZATION_FRANCE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_LOUIS_XIV_23'),
        ('CIVILIZATION_FRANCE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_LOUIS_XIV_24'),
        ('CIVILIZATION_FRANCE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_LOUIS_XIV_25');
------------------------------------------------------------
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_CULTURE'),
		('FLAVOR_JFD_REFORM_ECONOMIC'),
		('FLAVOR_JFD_REFORM_FOREIGN'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,							 Flavor)
VALUES	('LEADER_JFD_LOUIS_XIV',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 9),
		('LEADER_JFD_LOUIS_XIV',	'FLAVOR_JFD_REFORM_CULTURE',		 7),
		('LEADER_JFD_LOUIS_XIV',	'FLAVOR_JFD_REFORM_ECONOMIC',		 7),
		('LEADER_JFD_LOUIS_XIV',	'FLAVOR_JFD_REFORM_FOREIGN',		 8),
		('LEADER_JFD_LOUIS_XIV',	'FLAVOR_JFD_REFORM_INDUSTRY',		 5),
		('LEADER_JFD_LOUIS_XIV',	'FLAVOR_JFD_REFORM_MILITARY',		 7),
		('LEADER_JFD_LOUIS_XIV',	'FLAVOR_JFD_REFORM_RELIGION',		 7);
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_France_Decisions.lua');
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_France_Events.lua');
--==========================================================================================================================
--==========================================================================================================================