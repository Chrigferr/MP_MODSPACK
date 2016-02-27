--==========================================================================================================================
-- GAZEBO COMMUNITY BALANCE PATCH
--==========================================================================================================================
-- Buildings
------------------------------	
UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_BANYA_HELP_CBP', Strategy = 'TXT_KEY_BUILDING_JFD_BANYA_STRATEGY_CBP'
WHERE Type = 'BUILDING_JFD_BANYA' 
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value = 1);
------------------------------	
-- Building_ImprovementYieldChanges
------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_ImprovementYieldChanges (
	BuildingType 					text 	REFERENCES Buildings(Type) 		default null,
	ImprovementType 				text	REFERENCES Improvements(Type) 	default null,
	Yield							text									default	null,
	YieldChange						integer									default	0);

UPDATE Building_ImprovementYieldChanges
SET BuildingType = 'BUILDING_JFD_BANYA'
WHERE BuildingType = 'BUILDING_KREPOST' 
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value = 1);
------------------------------	
-- Building_ResourceYieldChanges
------------------------------		
INSERT INTO Building_ResourceYieldChanges
		(BuildingType,			ResourceType,	YieldType,	Yield)
SELECT	'BUILDING_JFD_BANYA',	ResourceType,	YieldType,  Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_GARDEN';
------------------------------	
-- Building_ResourceYieldModifiers
------------------------------	
DELETE FROM Building_ResourceYieldModifiers WHERE BuildingType = 'BUILDING_JFD_BANYA' 
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================