--==========================================================================================================================
-- GAZEBO COMMUNITY PATCH
--==========================================================================================================================
-- COMMUNITY
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
------------------------------
-- Buildings
------------------------------	
UPDATE Buildings 
SET Help = 'TXT_KEY_BUILDING_JFD_STOUDION_HELP_CBP'
WHERE Type = 'BUILDING_JFD_STOUDION'
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value = 1);
------------------------------	
-- Building_ResourceYieldChanges
------------------------------		
INSERT INTO Building_ResourceYieldChanges
		(BuildingType,				ResourceType,	YieldType,	Yield)
SELECT	'BUILDING_JFD_STOUDION',	ResourceType,	YieldType,  Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_GARDEN';
--==========================================================================================================================
-- JFD PIETY
--==========================================================================================================================
-- Buildings
------------------------------------------------------------
INSERT OR REPLACE INTO Buildings 	
		(Type, 						BuildingClass, Cost, GreatWorkSlotType,					GreatWorkCount, GoldMaintenance, PrereqTech, Description, 						Civilopedia, 							Help, 											Strategy,								 		ArtDefineTag, 	MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT	'BUILDING_JFD_STOUDION',	BuildingClass, Cost, 'GREAT_WORK_SLOT_ART_ARTIFACT',	1, 				GoldMaintenance, PrereqTech, 'TXT_KEY_BUILDING_JFD_STOUDION',	'TXT_KEY_BUILDING_JFD_STOUDION_TEXT',	'TXT_KEY_BUILDING_JFD_STOUDION_HELP_PIETY', 	'TXT_KEY_BUILDING_JFD_STOUDION_STRATEGY_PIETY',	ArtDefineTag,	MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, 3, 				'JFD_BYZANTIUM_ALEXIOS_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_MONASTERY'
AND EXISTS (SELECT * FROM Processes WHERE Type = 'PROCESS_JFD_PIETY');

UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_STOUDION_HELP_PIETY_EXCE'
WHERE Type = 'BUILDING_JFD_STOUDION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_MONASTERY' AND Value = 1);

UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_STOUDION_HELP_PIETY_HEALTH'
WHERE Type = 'BUILDING_JFD_STOUDION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_STOUDION_HELP_PIETY_EXCE_HEALTH'
WHERE Type = 'BUILDING_JFD_STOUDION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_MONASTERY' AND Value = 1);
------------------------------------------------------------
-- Building_ResourceYieldChanges
------------------------------------------------------------
DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_JFD_STOUDION'
AND EXISTS (SELECT * FROM Processes WHERE Type = 'PROCESS_JFD_PIETY');
INSERT INTO Building_ResourceYieldChanges
		(BuildingType,				ResourceType,	YieldType,	Yield)
SELECT	'BUILDING_JFD_STOUDION',	ResourceType,	YieldType,  Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_MONASTERY'
AND EXISTS (SELECT * FROM Processes WHERE Type = 'PROCESS_JFD_PIETY');
------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------
DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_JFD_STOUDION'
AND EXISTS (SELECT * FROM Processes WHERE Type = 'PROCESS_JFD_PIETY');
------------------------------
-- Civilization_BuildingClassOverrides
------------------------------	
UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_MONASTERY'
WHERE CivilizationType = 'CIVILIZATION_BYZANTIUM' AND BuildingType = 'BUILDING_JFD_STOUDION'
AND EXISTS (SELECT * FROM Processes WHERE Type = 'PROCESS_JFD_PIETY');
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_ByzantiumTheodora_Decisions.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies
		(Type,													Description)
VALUES	('POLICY_DECISIONS_JFD_BYZANTIUM_RENOVATE_CAPITAL',		'TXT_KEY_DECISIONS_JFD_BYZANTIUM_RENOVATE_CAPITAL');
------------------------------
-- Policy_BuildingClassTourismModifiers
------------------------------
INSERT INTO Policy_BuildingClassTourismModifiers
		(PolicyType, 											BuildingClassType,			TourismModifier)
VALUES	('POLICY_DECISIONS_JFD_BYZANTIUM_RENOVATE_CAPITAL', 	'BUILDINGCLASS_PALACE',		15);
------------------------------
-- Policy_BuildingClassYieldChanges
------------------------------
INSERT INTO Policy_BuildingClassYieldChanges
		(PolicyType, 											BuildingClassType,			YieldType,			YieldChange)
VALUES	('POLICY_DECISIONS_JFD_BYZANTIUM_RENOVATE_CAPITAL', 	'BUILDINGCLASS_GARDEN',		'YIELD_CULTURE',	2);
--==========================================================================================================================
--==========================================================================================================================