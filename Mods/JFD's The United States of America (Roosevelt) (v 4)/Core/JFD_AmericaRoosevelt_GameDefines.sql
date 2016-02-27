--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type, 							BuildingClass, Cost, GoldMaintenance, 	PrereqTech, Description, 							Civilopedia, 							Help, 											Strategy,										XBuiltTriggersIdeologyChoice,	TrainedFreePromotion,			SpecialistType, SpecialistCount, ArtDefineTag,	MinAreaSize, ConquestProb, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_ARMS_FACTORY'),	BuildingClass, Cost, GoldMaintenance, 	PrereqTech, ('TXT_KEY_BUILDING_JFD_ARMS_FACTORY'), ('TXT_KEY_CIV5_BUILDINGS_FACTORY_TEXT'), ('TXT_KEY_BUILDING_JFD_ARMS_FACTORY_HELP'), 	('TXT_KEY_BUILDING_JFD_ARMS_FACTORY_STRATEGY'),	1,								'PROMOTION_JFD_ARMS_FACTORY',	SpecialistType, SpecialistCount, ArtDefineTag,	MinAreaSize, ConquestProb, HurryCostModifier, 2, 				('JFD_AMERICA_ROOSEVELT_ATLAS')
FROM Buildings WHERE (Type = 'BUILDING_FACTORY');	

INSERT INTO Buildings 	
			(Type, 					Happiness,	BuildingClass, Cost,	GoldMaintenance, 	PrereqTech,			Description, 					Civilopedia, 						Help, 									Strategy,									ArtDefineTag,	MinAreaSize, ConquestProb, HurryCostModifier, PortraitIndex, IconAtlas)
SELECT		('BUILDING_JFD_RANCH'),	1,			BuildingClass, Cost+35, 2, 					'TECH_TRAPPING',	('TXT_KEY_BUILDING_JFD_RANCH'), ('TXT_KEY_CIV5_JFD_RANCH_TEXT'), 	('TXT_KEY_BUILDING_JFD_RANCH_HELP'), 	('TXT_KEY_BUILDING_JFD_RANCH_STRATEGY'),	ArtDefineTag,	MinAreaSize, ConquestProb, HurryCostModifier, 3,			 ('JFD_AMERICA_ROOSEVELT_ATLAS')
FROM Buildings WHERE (Type = 'BUILDING_STABLE');
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 					FlavorType, Flavor)
SELECT		('BUILDING_JFD_ARMS_FACTORY'),	FlavorType, Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_FACTORY');	

INSERT OR REPLACE INTO Building_Flavors 	
			(BuildingType, 			FlavorType, Flavor)
SELECT		('BUILDING_JFD_RANCH'),	FlavorType, Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_STABLE');
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 					BuildingClassType)
SELECT		('BUILDING_JFD_ARMS_FACTORY'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE (BuildingType = 'BUILDING_FACTORY');	
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 					YieldType, Yield)
SELECT		('BUILDING_JFD_ARMS_FACTORY'),	YieldType, Yield
FROM Building_YieldChanges WHERE (BuildingType = 'BUILDING_FACTORY');	
------------------------------	
-- Building_YieldModifiers
------------------------------		
INSERT INTO Building_YieldModifiers 	
			(BuildingType, 					YieldType, Yield)
SELECT		('BUILDING_JFD_ARMS_FACTORY'),	YieldType, Yield
FROM Building_YieldModifiers WHERE (BuildingType = 'BUILDING_FACTORY');	
------------------------------	
-- Building_ResourceQuantityRequirements
------------------------------		
INSERT INTO Building_ResourceQuantityRequirements 	
			(BuildingType, 					ResourceType, Cost)
SELECT		('BUILDING_JFD_ARMS_FACTORY'),	ResourceType, Cost
FROM Building_ResourceQuantityRequirements WHERE (BuildingType = 'BUILDING_FACTORY');	
------------------------------	
-- Building_UnitCombatProductionModifiers
------------------------------	
INSERT OR REPLACE INTO Building_UnitCombatProductionModifiers 	
			(BuildingType, 			UnitCombatType, Modifier)
SELECT		('BUILDING_JFD_RANCH'),	UnitCombatType, 10
FROM Building_UnitCombatProductionModifiers WHERE (BuildingType = 'BUILDING_STABLE');

INSERT INTO Building_UnitCombatProductionModifiers 	
			(BuildingType, 					UnitCombatType,			Modifier)
VALUES		('BUILDING_JFD_ARMS_FACTORY',	'UNITCOMBAT_SIEGE',		10),
			('BUILDING_JFD_ARMS_FACTORY',	'UNITCOMBAT_ARMOR',		10);
------------------------------	
-- Building_DomainProductionModifiers
------------------------------	
INSERT INTO Building_DomainProductionModifiers 	
			(BuildingType, 					DomainType,		Modifier)
VALUES		('BUILDING_JFD_ARMS_FACTORY',	'DOMAIN_AIR',	10);
------------------------------	
-- Building_ResourceYieldChanges
------------------------------		
INSERT OR REPLACE INTO Building_ResourceYieldChanges 	
			(BuildingType, 			ResourceType, YieldType,	Yield)
SELECT		('BUILDING_JFD_RANCH'),	ResourceType, YieldType,	Yield
FROM Building_ResourceYieldChanges WHERE (BuildingType = 'BUILDING_STABLE');	

INSERT INTO Building_ResourceYieldChanges 	
			(BuildingType, 			ResourceType,		YieldType,			Yield)
VALUES		('BUILDING_JFD_RANCH',	'RESOURCE_DEER',	'YIELD_PRODUCTION', 1),	
			('BUILDING_JFD_RANCH',	'RESOURCE_BISON',	'YIELD_PRODUCTION', 1);
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES		('LEADER_JFD_ROOSEVELT', 	'TXT_KEY_LEADER_JFD_ROOSEVELT', 	'TXT_KEY_LEADER_JFD_ROOSEVELT_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_ROOSEVELT', 	'Roosevelt_Scene.xml',	8, 						6, 						2, 							6, 			7, 				6, 				8, 						6, 				6, 			6, 			5, 				5, 			2, 			'JFD_AMERICA_ROOSEVELT_ATLAS', 	1);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_ROOSEVELT', 	'MAJOR_CIV_APPROACH_WAR', 			7),
			('LEADER_JFD_ROOSEVELT', 	'MAJOR_CIV_APPROACH_HOSTILE', 		2),
			('LEADER_JFD_ROOSEVELT', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	8),
			('LEADER_JFD_ROOSEVELT', 	'MAJOR_CIV_APPROACH_GUARDED', 		6),
			('LEADER_JFD_ROOSEVELT', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_JFD_ROOSEVELT', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_JFD_ROOSEVELT', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_ROOSEVELT', 	'MINOR_CIV_APPROACH_IGNORE', 		6),
			('LEADER_JFD_ROOSEVELT', 	'MINOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_JFD_ROOSEVELT', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	8),
			('LEADER_JFD_ROOSEVELT', 	'MINOR_CIV_APPROACH_CONQUEST', 		4);
--------------------------------	
-- Leader_Flavors
--------------------------------						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_ROOSEVELT', 	'FLAVOR_OFFENSE', 					7),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_DEFENSE', 					5),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_CITY_DEFENSE', 				4),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_MILITARY_TRAINING', 		7),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_RECON', 					7),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_RANGED', 					6),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_MOBILE', 					8),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_NAVAL', 					4),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_AIR', 						3),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_EXPANSION', 				6),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_GROWTH', 					6),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_INFRASTRUCTURE', 			8),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_PRODUCTION', 				8),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_GOLD', 						6),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_SCIENCE', 					4),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_CULTURE', 					5),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_HAPPINESS', 				6),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_GREAT_PEOPLE', 				6),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_WONDER', 					4),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_RELIGION', 					2),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_DIPLOMACY', 				5),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_SPACESHIP', 				3),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_WATER_CONNECTION', 			3),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_NUKE', 						12),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_USE_NUKE', 					12),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_ESPIONAGE', 				6),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_AIRLIFT', 					3),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_ROOSEVELT', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_ROOSEVELT', 	'TRAIT_JFD_AMERICA_ROOSEVELT');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
			(Type, 								Description, 							ShortDescription)
VALUES		('TRAIT_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_TRAIT_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_TRAIT_JFD_AMERICA_ROOSEVELT_SHORT');

UPDATE Traits
SET Description = 'TXT_KEY_TRAIT_JFD_AMERICA',	PlotBuyCostModifier = 0
WHERE Type = 'TRAIT_RIVER_EXPANSION';
--------------------------------	
-- Trait_ImprovementYieldChanges
--------------------------------	
INSERT INTO Trait_ImprovementYieldChanges 
			(TraitType, 						ImprovementType,	YieldType,			Yield)
SELECT		('TRAIT_JFD_AMERICA_ROOSEVELT'), 	Type,				('YIELD_CULTURE'),	2
FROM Improvements WHERE CreatedByGreatPerson = 1;

CREATE TRIGGER JFD_ImprovementsYieldChangesAmericaRoosevelt
AFTER INSERT ON Improvements WHEN 1 = NEW.CreatedByGreatPerson
BEGIN
	INSERT INTO Trait_ImprovementYieldChanges 
			(TraitType, 						ImprovementType,	YieldType,			Yield)
	SELECT	('TRAIT_JFD_AMERICA_ROOSEVELT'), 	NEW.Type,			('YIELD_CULTURE'),	2
	FROM Improvements WHERE CreatedByGreatPerson = 1;
END;
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
			(Type, 							EmbarkDefenseModifier, 	Description, 							Help, 										Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_ARMS_FACTORY', 	50,						'TXT_KEY_PROMOTION_JFD_ARMS_FACTORY', 	'TXT_KEY_PROMOTION_JFD_ARMS_FACTORY_HELP',	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_ARMS_FACTORY');
------------------------------	
-- UnitPromotions_UnitCombats
------------------------------	
INSERT INTO UnitPromotions_UnitCombats
			(PromotionType,					UnitCombatType)
VALUES		('PROMOTION_JFD_ARMS_FACTORY',	'UNITCOMBAT_ARMOR'),
			('PROMOTION_JFD_ARMS_FACTORY',	'UNITCOMBAT_SIEGE');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
------------------------------	
UPDATE Units
SET Cost = Cost-30, FaithCost = FaithCost-60
WHERE Type = 'UNIT_AMERICAN_MINUTEMAN';
------------------------------
-- Unit_FreePromotions
------------------------------
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_AMERICAN_MINUTEMAN' AND PromotionType = 'PROMOTION_GOLDEN_AGE_POINTS';
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
			(Type, 										Description,								ShortDescription, 									Adjective, 	Civilopedia, 	CivilopediaTag,	DefaultPlayerColor, 					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 							PortraitIndex, 	AlphaIconAtlas, 						SoundtrackTag, 	MapImage, 							DawnOfManQuote, 							DawnOfManImage)
SELECT		('CIVILIZATION_JFD_AMERICA_ROOSEVELT'), 	('TXT_KEY_CIV_JFD_AMERICA_ROOSEVELT_DESC'),	('TXT_KEY_CIV_JFD_AMERICA_ROOSEVELT_SHORT_DESC'),	Adjective,	Civilopedia, 	CivilopediaTag, ('PLAYERCOLOR_JFD_AMERICA_ROOSEVELT'), 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_AMERICA_ROOSEVELT_ATLAS'), 	0, 				('JFD_AMERICA_ROOSEVELT_ALPHA_ATLAS'), 	('America'), 	('AmericaRooseveltMap512.dds'),		('TXT_KEY_CIV5_DOM_JFD_ROOSEVELT_TEXT'), 	('DOM_Roosevelt.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_AMERICA');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
DELETE FROM Civilization_CityNames WHERE CivilizationType = 'CIVILIZATION_AMERICA';
INSERT INTO Civilization_CityNames 
			(CivilizationType, 						CityName)
VALUES		('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_01'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_02'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_03'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_04'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_05'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_06'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_07'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_08'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_09'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_10'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_11'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_12'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_13'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_14'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_15'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_16'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_17'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_18'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_19'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_20'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_21'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_22'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_23'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_24'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_25'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_26'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_27'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_28'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_29'),
			('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'TXT_KEY_CITY_NAME_JFD_AMERICA_ROOSEVELT_30'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_01'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_02'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_03'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_04'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_05'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_06'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_07'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_08'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_09'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_10'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_11'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_12'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_13'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_14'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_15'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_16'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_17'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_18'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_19'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_20'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_21'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_22'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_23'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_24'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_25'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_26'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_27'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_28'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_29'),
			('CIVILIZATION_AMERICA', 				'TXT_KEY_CITY_NAME_JFD_AMERICA_30');	
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 						BuildingClassType)
SELECT		('CIVILIZATION_JFD_AMERICA_ROOSEVELT'), BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_AMERICA');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 						TechType)
SELECT		('CIVILIZATION_JFD_AMERICA_ROOSEVELT'), TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_AMERICA');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_AMERICA_ROOSEVELT'), UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_AMERICA');
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 						LeaderheadType)
VALUES		('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'LEADER_JFD_ROOSEVELT');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------	
DELETE FROM Civilization_UnitClassOverrides WHERE UnitType = 'UNIT_AMERICAN_B17';	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 						UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'UNITCLASS_BOMBER', 		'UNIT_AMERICAN_B17');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 						BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_JFD_AMERICA_ROOSEVELT', 	'BUILDINGCLASS_FACTORY', 	'BUILDING_JFD_ARMS_FACTORY'),
			('CIVILIZATION_AMERICA',				'BUILDINGCLASS_STABLE', 	'BUILDING_JFD_RANCH');
--------------------------------	
-- Civilization_Religions
--------------------------------		
INSERT INTO Civilization_Religions 
			(CivilizationType, 						ReligionType)
SELECT		('CIVILIZATION_JFD_AMERICA_ROOSEVELT'), ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_AMERICA');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 						SpyName)
SELECT		('CIVILIZATION_JFD_AMERICA_ROOSEVELT'), SpyName
FROM Civilization_SpyNames WHERE (CivilizationType = 'CIVILIZATION_AMERICA');
--------------------------------	
-- Civilization_Start_Region_Avoid
--------------------------------	
INSERT INTO Civilization_Start_Region_Avoid 
			(CivilizationType, 			RegionType)
VALUES		('CIVILIZATION_AMERICA', 	'REGION_HILLS');
--==========================================================================================================================
--==========================================================================================================================