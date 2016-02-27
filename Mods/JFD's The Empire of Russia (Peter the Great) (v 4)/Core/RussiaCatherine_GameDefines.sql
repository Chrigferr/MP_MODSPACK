--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 					BuildingClass, Cost,	FaithCost, UnlockedByBelief, GoldMaintenance, PrereqTech, Description, 					Civilopedia, 					Help, 								Strategy,								PlotBuyCostModifier,	ArtDefineTag, 	MinAreaSize, ConquestProb, GreatPeopleRateModifier,	FreshWater, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT	'BUILDING_JFD_BANYA',	BuildingClass, Cost+15, FaithCost, UnlockedByBelief, GoldMaintenance, PrereqTech, 'TXT_KEY_BUILDING_JFD_BANYA', 'TXT_KEY_CIV5_JFD_BANYA_TEXT', 	'TXT_KEY_BUILDING_JFD_BANYA_HELP', 	'TXT_KEY_BUILDING_JFD_BANYA_STRATEGY',	-15,					ArtDefineTag,	MinAreaSize, ConquestProb, GreatPeopleRateModifier,	FreshWater,	HurryCostModifier, 3, 				'JFD_RUSSIA_PETER_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_GARDEN';	
------------------------------	
-- Building_ResourceYieldModifiers
------------------------------		
INSERT INTO Building_ResourceYieldModifiers
		(BuildingType,			ResourceType,	YieldType,			Yield)
SELECT	'BUILDING_JFD_BANYA',	Type,			'YIELD_PRODUCTION', 10
FROM Resources WHERE ResourceClassType IN ('RESOURCECLASS_RUSH', 'RESOURCECLASS_MODERN') 
AND NOT Type IN ('RESOURCE_ARTIFACTS', 'RESOURCE_HIDDEN_ARTIFACTS');
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 			FlavorType, Flavor)
SELECT	'BUILDING_JFD_BANYA',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_GARDEN';	

INSERT INTO Building_Flavors
		(BuildingType,			FlavorType,			Flavor)
VALUES	('BUILDING_JFD_BANYA', 'FLAVOR_PRODUCTION',	25),
		('BUILDING_JFD_BANYA', 'FLAVOR_EXPANSION',	25),
		('BUILDING_JFD_BANYA', 'FLAVOR_GOLD',		20);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilization_CityNames
--------------------------------
DELETE FROM Civilization_CityNames WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
INSERT INTO Civilization_CityNames 
		(CivilizationType, 			CityName)
VALUES	('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_01'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_02'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_03'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_04'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_05'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_06'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_07'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_08'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_CATHERINE_01'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_CATHERINE_02'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_CATHERINE_03'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_CATHERINE_04'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_CATHERINE_05'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_CATHERINE_06'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_CATHERINE_07'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_CATHERINE_08'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_CATHERINE_09'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_CATHERINE_10'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_CATHERINE_11'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_CATHERINE_12'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_CATHERINE_13'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_CATHERINE_14'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_CATHERINE_15'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_CATHERINE_16'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_CATHERINE_17'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_CATHERINE_18'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_CATHERINE_19'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_CATHERINE_20'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_CATHERINE_21'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_CATHERINE_22'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_CATHERINE_23'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_CATHERINE_24'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_RUSSIA_CATHERINE_25');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------	
DELETE FROM Civilization_BuildingClassOverrides WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 			BuildingClassType, 		BuildingType)
VALUES	('CIVILIZATION_RUSSIA', 	'BUILDINGCLASS_GARDEN', 'BUILDING_JFD_BANYA');
--==========================================================================================================================
--==========================================================================================================================