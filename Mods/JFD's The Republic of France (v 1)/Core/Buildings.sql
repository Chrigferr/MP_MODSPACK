--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================			
INSERT INTO BuildingClasses 
			(DefaultBuilding, 					Type, 									Description)
VALUES		('BUILDING_JFD_FRENCH_RESISTANCE',  'BUILDINGCLASS_JFD_FRENCH_RESISTANCE',	'TXT_KEY_BUILDING_JFD_FRENCH_RESISTANCE');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 					BuildingClass, Cost, GreatWorkSlotType, GreatWorkCount, CultureRateModifier, GoldMaintenance, PrereqTech,	Description, 					Civilopedia, 						Help, 									ThemingBonusHelp,							Strategy,								 ArtDefineTag, 	MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_CAFE'),	BuildingClass, Cost, GreatWorkSlotType, 2,				CultureRateModifier, GoldMaintenance, PrereqTech,	('TXT_KEY_BUILDING_JFD_CAFE'),	('TXT_KEY_CIV5_JFD_CAFE_TEXT'), 	('TXT_KEY_BUILDING_JFD_CAFE_HELP'), 	('TXT_KEY_JFD_CAFE_THEMING_BONUS_HELP'),	('TXT_KEY_BUILDING_JFD_CAFE_STRATEGY'),	 ArtDefineTag,	MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, 3, 				('JFD_FRANCE_DEGAULLE_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_BROADCAST_TOWER';


INSERT OR REPLACE INTO Buildings 
			(Type, 								BuildingClass, 							GreatGeneralRateModifier,	GreatWorkCount, Cost, 	FaithCost,	GoldMaintenance,	PrereqTech, NeverCapture,	Description, 								Help)
VALUES		('BUILDING_JFD_FRENCH_RESISTANCE', 	'BUILDINGCLASS_JFD_FRENCH_RESISTANCE',	10,							-1,				-1, 	-1,			0,					NULL, 		1,				'TXT_KEY_BUILDING_JFD_FRENCH_RESISTANCE', 	'TXT_KEY_BUILDING_JFD_FRENCH_RESISTANCE_HELP');
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--==========================================================================================================================	
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 			BuildingClassType)
SELECT		('BUILDING_JFD_CAFE'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_BROADCAST_TOWER';	
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================	
INSERT INTO Building_Flavors 	
			(BuildingType, 			FlavorType, Flavor)
SELECT		('BUILDING_JFD_CAFE'),	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_BROADCAST_TOWER';
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================	
INSERT INTO Building_ThemingBonuses 	
			(BuildingType, 			Description,						Bonus,	RequiresOwner,	AiPriority)
VALUES		('BUILDING_JFD_CAFE',	'TXT_KEY_THEMING_BONUS_JFD_CAFE',	2,		1,				1);
--==========================================================================================================================	
--==========================================================================================================================	