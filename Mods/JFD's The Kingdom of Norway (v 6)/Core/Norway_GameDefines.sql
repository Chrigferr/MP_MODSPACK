--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
-- BuildingClasses
--------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 	DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_JFD_NORWAY', 	'BUILDING_JFD_STAVE_STORAGE', 	'TXT_KEY_BUILDING_JFD_STAVE_STORAGE');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
-- Buildings
--------------------------------	
INSERT INTO Buildings 	
		(Type, 							BuildingClass, PrereqTech, Cost, GoldMaintenance, MinAreaSize, Description, 						Civilopedia, 							Help, 										Strategy,										ArtDefineTag, PortraitIndex, 	IconAtlas)
SELECT	'BUILDING_JFD_STAVE_CHURCH',	BuildingClass, PrereqTech, Cost, GoldMaintenance, MinAreaSize, 'TXT_KEY_BUILDING_JFD_STAVE_CHURCH', 'TXT_KEY_CIV5_JFD_STAVE_CHURCH_TEXT',	'TXT_KEY_BUILDING_JFD_STAVE_CHURCH_HELP', 	'TXT_KEY_BUILDING_JFD_STAVE_CHURCH_STRATEGY',	ArtDefineTag, 2, 				'JFD_NORWAY_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';		

INSERT INTO Buildings 	
		(Type, 						 	BuildingClass, 				FoodKept, 	GreatWorkCount, Cost, FaithCost, PrereqTech, Description, 							Help)
VALUES	('BUILDING_JFD_STAVE_STORAGE', 	'BUILDINGCLASS_JFD_NORWAY',	1, 			-1, 			-1,   -1, 		 null, 		 'TXT_KEY_BUILDING_JFD_STAVE_STORAGE', 	'TXT_KEY_BUILDING_JFD_STAVE_STORAGE_HELP'),
		('BUILDING_JFD_NORWAY_FISH', 	'BUILDINGCLASS_JFD_NORWAY',	0, 			-1, 			-1,   -1, 		 null, 		 'TXT_KEY_BUILDING_JFD_NORWAY_FISH', 	'TXT_KEY_BUILDING_JFD_NORWAY_FISH_HELP');
--------------------------------	
-- Building_ResourceYieldChanges
--------------------------------	
INSERT INTO Building_ResourceYieldChanges 	
		(BuildingType, 					ResourceType, YieldType, Yield)
SELECT	'BUILDING_JFD_STAVE_CHURCH',	ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_TEMPLE';	
--------------------------------	
-- Building_YieldChanges
--------------------------------	
INSERT INTO Building_YieldChanges 	
		(BuildingType, 					YieldType, Yield)
SELECT	'BUILDING_JFD_STAVE_CHURCH',	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_TEMPLE';		
--------------------------------	
-- Building_Flavors
--------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType, Flavor)
SELECT	'BUILDING_JFD_STAVE_CHURCH',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_TEMPLE';

INSERT INTO Building_Flavors
		(BuildingType,					FlavorType,			Flavor)
VALUES	('BUILDING_JFD_STAVE_CHURCH',	'FLAVOR_GROWTH',	10);
--------------------------------	
-- Building_ResourceYieldChanges
--------------------------------	
INSERT INTO Building_ResourceYieldChanges
		(BuildingType,					ResourceType,		YieldType,		Yield)
VALUES	('BUILDING_JFD_NORWAY_FISH',	'RESOURCE_FISH',	'YIELD_GOLD',	1);
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 					Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 			PortraitIndex)
VALUES	('LEADER_JFD_HAAKON', 	'TXT_KEY_LEADER_JFD_HAAKON', 	'TXT_KEY_LEADER_JFD_HAAKON_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_HAAKON', 	'Haakon_Scene.xml', 6, 						5, 						6, 							7, 			6, 				5, 				5, 						5, 				6, 			5, 			6, 				5, 			5, 			'JFD_NORWAY_ATLAS', 1);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------					
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_HAAKON', 	'MAJOR_CIV_APPROACH_WAR', 			8),
		('LEADER_JFD_HAAKON', 	'MAJOR_CIV_APPROACH_HOSTILE', 		7),
		('LEADER_JFD_HAAKON', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	7),
		('LEADER_JFD_HAAKON', 	'MAJOR_CIV_APPROACH_GUARDED', 		6),
		('LEADER_JFD_HAAKON', 	'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_JFD_HAAKON', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_HAAKON', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------					
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_HAAKON', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_JFD_HAAKON', 	'MINOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_JFD_HAAKON', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
		('LEADER_JFD_HAAKON', 	'MINOR_CIV_APPROACH_CONQUEST', 		5),
		('LEADER_JFD_HAAKON', 	'MINOR_CIV_APPROACH_BULLY', 		7);
--------------------------------
-- Leader_Flavors
--------------------------------					
INSERT INTO Leader_Flavors 
		(LeaderType, 			FlavorType, 						Flavor)
VALUES	('LEADER_JFD_HAAKON', 	'FLAVOR_OFFENSE', 					6),
		('LEADER_JFD_HAAKON', 	'FLAVOR_DEFENSE', 					6),
		('LEADER_JFD_HAAKON', 	'FLAVOR_CITY_DEFENSE', 				6),
		('LEADER_JFD_HAAKON', 	'FLAVOR_MILITARY_TRAINING', 		6),
		('LEADER_JFD_HAAKON', 	'FLAVOR_RECON', 					6),
		('LEADER_JFD_HAAKON', 	'FLAVOR_RANGED', 					2),
		('LEADER_JFD_HAAKON', 	'FLAVOR_MOBILE', 					8),
		('LEADER_JFD_HAAKON', 	'FLAVOR_NAVAL', 					8),
		('LEADER_JFD_HAAKON', 	'FLAVOR_NAVAL_RECON', 				9),
		('LEADER_JFD_HAAKON', 	'FLAVOR_NAVAL_GROWTH', 				10),
		('LEADER_JFD_HAAKON', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	10),
		('LEADER_JFD_HAAKON', 	'FLAVOR_AIR', 						3),
		('LEADER_JFD_HAAKON', 	'FLAVOR_EXPANSION', 				7),
		('LEADER_JFD_HAAKON', 	'FLAVOR_GROWTH', 					7),
		('LEADER_JFD_HAAKON', 	'FLAVOR_TILE_IMPROVEMENT', 			6),
		('LEADER_JFD_HAAKON', 	'FLAVOR_INFRASTRUCTURE', 			6),
		('LEADER_JFD_HAAKON', 	'FLAVOR_PRODUCTION', 				6),
		('LEADER_JFD_HAAKON', 	'FLAVOR_GOLD', 						7),
		('LEADER_JFD_HAAKON', 	'FLAVOR_SCIENCE', 					4),
		('LEADER_JFD_HAAKON', 	'FLAVOR_CULTURE', 					4),
		('LEADER_JFD_HAAKON', 	'FLAVOR_HAPPINESS', 				4),
		('LEADER_JFD_HAAKON', 	'FLAVOR_GREAT_PEOPLE', 				4),
		('LEADER_JFD_HAAKON', 	'FLAVOR_WONDER', 					4),
		('LEADER_JFD_HAAKON', 	'FLAVOR_RELIGION', 					7),
		('LEADER_JFD_HAAKON', 	'FLAVOR_DIPLOMACY', 				8),
		('LEADER_JFD_HAAKON', 	'FLAVOR_SPACESHIP', 				4),
		('LEADER_JFD_HAAKON', 	'FLAVOR_WATER_CONNECTION', 			6),
		('LEADER_JFD_HAAKON', 	'FLAVOR_NUKE', 						3),
		('LEADER_JFD_HAAKON', 	'FLAVOR_USE_NUKE', 					3),
		('LEADER_JFD_HAAKON', 	'FLAVOR_ESPIONAGE', 				6),
		('LEADER_JFD_HAAKON', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_JFD_HAAKON', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_HAAKON', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_HAAKON', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		8),
		('LEADER_JFD_HAAKON', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_HAAKON', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_HAAKON', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------
-- Leader_Traits
--------------------------------					
INSERT INTO Leader_Traits 
		(LeaderType, 			TraitType)
VALUES	('LEADER_JFD_HAAKON', 	'TRAIT_JFD_NORWAY');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 					Description, 					ShortDescription)
VALUES	('TRAIT_JFD_NORWAY', 	'TXT_KEY_TRAIT_JFD_NORWAY', 	'TXT_KEY_TRAIT_JFD_NORWAY_SHORT');	
--------------------------------
-- Trait_ResourceQuantityModifiers
--------------------------------	
INSERT INTO Trait_ResourceQuantityModifiers 
		(TraitType, 			ResourceType, 		ResourceQuantityModifier)
VALUES	('TRAIT_JFD_NORWAY', 	'RESOURCE_FISH', 	100),
		('TRAIT_JFD_NORWAY', 	'RESOURCE_CRAB', 	100),
		('TRAIT_JFD_NORWAY', 	'RESOURCE_PEARLS', 	100),
		('TRAIT_JFD_NORWAY', 	'RESOURCE_WHALE', 	100);	

INSERT INTO Trait_ResourceQuantityModifiers
		(TraitType, 			ResourceType,		ResourceQuantityModifier)
SELECT	'TRAIT_JFD_NORWAY',		'RESOURCE_CORAL',	100
WHERE EXISTS (SELECT Type FROM Resources WHERE Type = 'RESOURCE_CORAL');
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 							Description, 						Help, 										Sound, 				CannotBeChosen, HillsDoubleMove,	PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_BIRKEBEINER', 	'TXT_KEY_PROMOTION_SKI_INFANTRY', 	'TXT_KEY_PROMOTION_JFD_BIRKEBEINER_HELP', 	'AS2D_IF_LEVELUP', 	1, 				1, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_SKI_INFANTRY');
------------------------------
-- UnitPromotions_Terrains
------------------------------	
INSERT INTO UnitPromotions_Terrains		
		(PromotionType, 				TerrainType, 		DoubleMove, Attack, Defense)
VALUES	('PROMOTION_JFD_BIRKEBEINER', 	'TERRAIN_SNOW', 	1, 			0, 		0),
		('PROMOTION_JFD_BIRKEBEINER', 	'TERRAIN_TUNDRA', 	1, 			0, 		0),
		('PROMOTION_JFD_BIRKEBEINER', 	'TERRAIN_HILL', 	0, 			20, 	20);
---==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
		(Type, 					Class, PrereqTech, Combat, FaithCost, RequiresFaithPurchaseEnabled, Cost,	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 										Strategy, 								Help, 									MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 					UnitFlagAtlas, 						UnitFlagIconOffset, PortraitIndex,	IconAtlas)
SELECT	'UNIT_JFD_BIRKEBEINER',	Class, PrereqTech, Combat, FaithCost, RequiresFaithPurchaseEnabled, Cost, 	Moves, 	CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_BIRKEBEINER', 	'TXT_KEY_CIVILOPEDIA_UNITS_JFD_BIRKEBEINER_TEXT', 'TXT_KEY_UNIT_JFD_BIRKEBEINER_STRATEGY', 	'TXT_KEY_UNIT_HELP_JFD_BIRKEBEINER',	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_JFD_BIRKEBEINER', 	'JFD_UNIT_FLAG_BIRKEBEINER_ATLAS',	0,					3, 				'JFD_NORWAY_ATLAS'
FROM Units WHERE Type = 'UNIT_SWORDSMAN';
--------------------------------
-- UnitGameplay2DScripts
--------------------------------	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_BIRKEBEINER', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_SWORDSMAN';
--------------------------------
-- Unit_AITypes
--------------------------------	
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_BIRKEBEINER', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SWORDSMAN';
--------------------------------
-- Unit_Flavors
--------------------------------	
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_BIRKEBEINER', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SWORDSMAN';
--------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------	
INSERT INTO Unit_ResourceQuantityRequirements 
		(UnitType, 					ResourceType)
VALUES	('UNIT_JFD_BIRKEBEINER', 	'RESOURCE_IRON');
--------------------------------
-- Unit_FreePromotions
--------------------------------	
INSERT INTO Unit_FreePromotions 
		(UnitType, 					PromotionType)
VALUES	('UNIT_JFD_BIRKEBEINER', 	'PROMOTION_JFD_BIRKEBEINER');
--------------------------------
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_JFD_BIRKEBEINER',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_SWORDSMAN';
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 						Description, 					ShortDescription, 						Adjective, 								Civilopedia, 					CivilopediaTag, 		DefaultPlayerColor, 		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				AlphaIconAtlas, 			PortraitIndex,	SoundtrackTag, 	MapImage, 			 DawnOfManQuote, 					  DawnOfManImage)
SELECT	'CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CIV_JFD_NORWAY_DESC', 	'TXT_KEY_CIV_JFD_NORWAY_SHORT_DESC', 	'TXT_KEY_CIV_JFD_NORWAY_ADJECTIVE', 	'TXT_KEY_CIV5_NORWAY_TEXT_1',	'TXT_KEY_CIV5_NORWAY', 	'PLAYERCOLOR_JFD_NORWAY',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_NORWAY_ATLAS',		'JFD_NORWAY_ALPHA_ATLAS',	0, 				'Denmark',		'MapNorway512.dds',  'TXT_KEY_CIV5_DOM_JFD_HAAKON_TEXT',  'DOM_Haakon.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_DENMARK';
--------------------------------
-- Civilization_CityNames
--------------------------------		
DELETE FROM Civilization_CityNames WHERE CityName IN ('TXT_KEY_CITY_NAME_OSLO', 'TXT_KEY_CITY_NAME_BERGEN', 'TXT_KEY_CITY_NAME_TRONDHEIM');
INSERT INTO Civilization_CityNames 
		(CivilizationType, 				CityName)
VALUES	('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_01'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_02'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_03'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_04'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_05'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_06'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_07'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_08'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_09'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_10'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_11'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_12'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_13'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_14'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_15'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_16'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_17'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_18'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_19'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_20'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_21'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_22'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_23'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_24'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_25'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_26'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_27'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_28'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_29'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_NORWAY_30');
--------------------------------
-- Civilization_FreeBuildingClasses
--------------------------------		
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 			BuildingClassType)
SELECT	'CIVILIZATION_JFD_NORWAY', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_DENMARK';
--------------------------------
-- Civilization_FreeTechs
--------------------------------	
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 			TechType)
SELECT	'CIVILIZATION_JFD_NORWAY', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_DENMARK';
--------------------------------
-- Civilization_FreeUnits
--------------------------------	
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 			UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_NORWAY', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_DENMARK';
--------------------------------
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_JFD_NORWAY', 	'LEADER_JFD_HAAKON');
--------------------------------
-- Civilization_BuildingClassOverrides 
--------------------------------	
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 				BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_JFD_NORWAY', 	'BUILDINGCLASS_TEMPLE', 		'BUILDING_JFD_STAVE_CHURCH');
--------------------------------
-- Civilization_UnitClassOverrides 
--------------------------------	
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				UnitClassType, 					UnitType)
VALUES	('CIVILIZATION_JFD_NORWAY', 	'UNITCLASS_SWORDSMAN', 			'UNIT_JFD_BIRKEBEINER');
--------------------------------
-- Civilization_Religions
--------------------------------	
INSERT INTO Civilization_Religions
		(CivilizationType, 				ReligionType)
VALUES	('CIVILIZATION_JFD_NORWAY',		'RELIGION_CHRISTIANITY');
--------------------------------
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 				SpyName)
VALUES	('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_NORWAY_0'),	
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_NORWAY_1'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_NORWAY_2'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_NORWAY_3'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_NORWAY_4'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_NORWAY_5'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_NORWAY_6'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_NORWAY_7'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_NORWAY_8'),
		('CIVILIZATION_JFD_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_NORWAY_9');
--------------------------------
-- Civilization_Start_Along_Ocean
--------------------------------	
INSERT INTO Civilization_Start_Along_Ocean 
		(CivilizationType, 				StartAlongOcean)
VALUES	('CIVILIZATION_JFD_NORWAY', 	1);
--------------------------------
-- Civilization_Start_Region_Priority
--------------------------------	
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 				RegionType)
VALUES	('CIVILIZATION_JFD_NORWAY', 	'REGION_TUNDRA');
--==========================================================================================================================
--==========================================================================================================================