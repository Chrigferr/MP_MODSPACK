--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================			
INSERT OR REPLACE INTO BuildingClasses 
			(DefaultBuilding, 			Type, 							Description)
VALUES		('BUILDING_JFD_FLANDERS', 	'BUILDINGCLASS_JFD_FLANDERS',	'TXT_KEY_BUILDING_JFD_FLANDERS'),
			(null, 						'BUILDINGCLASS_JFD_BELFORT_2',	'TXT_KEY_BUILDING_JFD_FLANDERS'),
			(null, 						'BUILDINGCLASS_JFD_BELFORT_3',	'TXT_KEY_BUILDING_JFD_FLANDERS');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================			
INSERT INTO Buildings
			(Type, 						BuildingClass, Cost,	PrereqTech,		 FreeStartEra,	AllowsRangeStrike, ExtraCityHitPoints,		Defense,		ArtInfoCulturalVariation, Description,							Help,									Civilopedia,									Strategy,								ArtDefineTag, MinAreaSize, 	HurryCostModifier, 	IconAtlas,				ConquestProb, 	PortraitIndex)
SELECT		('BUILDING_JFD_BELFORT'),	BuildingClass, Cost-40,	('TECH_GUILDS'), FreeStartEra,	AllowsRangeStrike, ExtraCityHitPoints-15,	Defense-600,	ArtInfoCulturalVariation, ('TXT_KEY_BUILDING_JFD_BELFORT'),	('TXT_KEY_BUILDING_JFD_BELFORT_HELP'),	('TXT_KEY_CIV5_BUILDINGS_JFD_BELFORT_TEXT'),	('TXT_KEY_BUILDING_JFD_BELFORT_STRATEGY'),	ArtDefineTag, MinAreaSize, 	HurryCostModifier, 	('JFD_FLANDERS_ATLAS'),	66, 			3	
FROM Buildings WHERE Type = 'BUILDING_CASTLE';	

INSERT INTO Buildings
			(Type, 						BuildingClass,					 Cost,		PrereqTech,		FreeStartEra,	AllowsRangeStrike, ExtraCityHitPoints,		Defense,		ArtInfoCulturalVariation, Description,						Help,									Civilopedia,									Strategy,									ArtDefineTag, MinAreaSize, 	HurryCostModifier, 	IconAtlas,				ConquestProb, 	PortraitIndex)
SELECT		('BUILDING_JFD_BELFORT_2'),	('BUILDINGCLASS_JFD_BELFORT_2'), Cost-40,	null,			FreeStartEra,	AllowsRangeStrike, ExtraCityHitPoints-15,	Defense-600,	ArtInfoCulturalVariation, ('TXT_KEY_BUILDING_JFD_BELFORT'),	('TXT_KEY_BUILDING_JFD_BELFORT_HELP'),	('TXT_KEY_CIV5_BUILDINGS_JFD_BELFORT_TEXT'),	('TXT_KEY_BUILDING_JFD_BELFORT_STRATEGY'),	ArtDefineTag, MinAreaSize, 	HurryCostModifier, 	('JFD_FLANDERS_ATLAS'),	66, 			3	
FROM Buildings WHERE Type = 'BUILDING_CASTLE';	

INSERT INTO Buildings
			(Type, 						BuildingClass,					 Cost,		PrereqTech,		FreeStartEra,	AllowsRangeStrike, ExtraCityHitPoints,		Defense,		ArtInfoCulturalVariation, Description,						Help,									Civilopedia,									Strategy,									ArtDefineTag, MinAreaSize, 	HurryCostModifier, 	IconAtlas,				ConquestProb, 	PortraitIndex)
SELECT		('BUILDING_JFD_BELFORT_3'),	('BUILDINGCLASS_JFD_BELFORT_3'), Cost-40,	null,			FreeStartEra,	AllowsRangeStrike, ExtraCityHitPoints-15,	Defense-600,	ArtInfoCulturalVariation, ('TXT_KEY_BUILDING_JFD_BELFORT'),	('TXT_KEY_BUILDING_JFD_BELFORT_HELP'),	('TXT_KEY_CIV5_BUILDINGS_JFD_BELFORT_TEXT'),	('TXT_KEY_BUILDING_JFD_BELFORT_STRATEGY'),	ArtDefineTag, MinAreaSize, 	HurryCostModifier, 	('JFD_FLANDERS_ATLAS'),	66, 			3	
FROM Buildings WHERE Type = 'BUILDING_CASTLE';	

INSERT OR REPLACE INTO Buildings 
			(Type, 							BuildingClass, 					BuildingProductionModifier, GreatWorkCount, Cost, 	FaithCost,	GoldMaintenance,	NeverCapture,	Description, 							Help)
VALUES		('BUILDING_JFD_FLANDERS', 		'BUILDINGCLASS_JFD_FLANDERS',	10,							-1,				-1, 	-1,			0,					1,				'TXT_KEY_BUILDING_JFD_FLANDERS', 		'TXT_KEY_BUILDING_JFD_FLANDERS_HELP');
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================					
INSERT INTO Building_Flavors
			(BuildingType, 				FlavorType, Flavor)
SELECT		('BUILDING_JFD_BELFORT'),	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_CASTLE';	

INSERT INTO Building_Flavors 
			(BuildingType, 				FlavorType,			Flavor)
VALUES		('BUILDING_JFD_BELFORT', 	'FLAVOR_CULTURE',	30),
			('BUILDING_JFD_BELFORT_2', 	'FLAVOR_CULTURE',	30),
			('BUILDING_JFD_BELFORT_3', 	'FLAVOR_CULTURE',	30);
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--==========================================================================================================================					
INSERT INTO Building_ClassesNeededInCity 
			(BuildingType, 				BuildingClassType)
VALUES		('BUILDING_JFD_BELFORT', 	'BUILDINGCLASS_MARKET'),
			('BUILDING_JFD_BELFORT_2', 	'BUILDINGCLASS_TEMPLE'),
			('BUILDING_JFD_BELFORT_3', 	'BUILDINGCLASS_UNIVERSITY');
--==========================================================================================================================	
--==========================================================================================================================	