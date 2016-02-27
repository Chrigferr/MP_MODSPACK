--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 							SpecialistType,				SpecialistCount,	FreeStartEra, BuildingClass, PrereqTech, Cost, GoldMaintenance, MinAreaSize, ConquestProb, Description, 							Civilopedia, 								Help, 										 Strategy,											ArtDefineTag, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_BRONZE_CASTER'),	('SPECIALIST_MERCHANT'),	1,					FreeStartEra, BuildingClass, PrereqTech, Cost, GoldMaintenance,	MinAreaSize, ConquestProb, ('TXT_KEY_BUILDING_JFD_BRONZE_CASTER'), 	('TXT_KEY_CIV5_JFD_BRONZE_CASTER_TEXT'),	('TXT_KEY_BUILDING_JFD_BRONZE_CASTER_HELP'), ('TXT_KEY_BUILDING_JFD_BRONZE_CASTER_STRATEGY'),	ArtDefineTag, 3, 				('JFD_NRI_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_FORGE';	
--==========================================================================================================================	
-- Building_ResourceYieldChanges
--==========================================================================================================================	
INSERT INTO Building_ResourceYieldChanges 	
			(BuildingType, 					ResourceType, YieldType, Yield)
SELECT		('BUILDING_JFD_BRONZE_CASTER'),	ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_FORGE';	
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================	
INSERT INTO Building_Flavors 	
			(BuildingType, 					FlavorType, Flavor)
SELECT		('BUILDING_JFD_BRONZE_CASTER'),	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_FORGE';

INSERT INTO Building_Flavors 	
			(BuildingType, 					FlavorType,				Flavor)
VALUES		('BUILDING_JFD_BRONZE_CASTER',  'FLAVOR_HAPPINESS',		20),
			('BUILDING_JFD_BRONZE_CASTER',  'FLAVOR_PRODUCTION',	30),
			('BUILDING_JFD_BRONZE_CASTER',  'FLAVOR_GOLD',			10);
--==========================================================================================================================	
--==========================================================================================================================	