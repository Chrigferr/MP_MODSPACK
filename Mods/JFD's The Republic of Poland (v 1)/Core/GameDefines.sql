--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
			(Type, 						 		 					DefaultBuilding, 					Description)
VALUES		('BUILDINGCLASS_JFD_PILSUDSKI_MILITARY_PRODUCTION', 	'BUILDING_JFD_PILSUDSKI_MILITARY_PRODUCTION', 	'TXT_KEY_BUILDING_JFD_PILSUDSKI_MILITARY_PRODUCTION');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type, 						 					BuildingClass, 										MilitaryProductionModifier, GreatWorkCount, Cost, FaithCost, PrereqTech, NeverCapture,	NukeImmune, Description, 											Help)
VALUES		('BUILDING_JFD_PILSUDSKI_MILITARY_PRODUCTION', 	'BUILDINGCLASS_JFD_PILSUDSKI_MILITARY_PRODUCTION', 	25,							-1,				-1,   -1, 		 null, 		 1,				1,			'TXT_KEY_BUILDING_JFD_PILSUDSKI_MILITARY_PRODUCTION', 	'TXT_KEY_JFD_POLAND_PILSUDSKI_CITY_VIEW_HELP');
--==========================================================================================================================	
-- IMPROVEMENTS
--==========================================================================================================================
-- Improvements
------------------------------	
INSERT INTO Improvements 	
			(Type, 										CivilizationType,						SpecificCivRequired,	Description, Civilopedia, ArtDefineTag, BuildableOnResources, PillageGold, PortraitIndex, IconAtlas)
SELECT		('IMPROVEMENT_JFD_POLISH_MANUFACTORY'),		('CIVILIZATION_JFD_POLAND_PILSUDSKI'),	1,						Description, Civilopedia, ArtDefineTag, BuildableOnResources, PillageGold, PortraitIndex, IconAtlas
FROM Improvements WHERE Type = 'IMPROVEMENT_MANUFACTORY';	

INSERT INTO Improvements 	
			(Type, 										CivilizationType,						SpecificCivRequired,	Description, Civilopedia, ArtDefineTag, BuildableOnResources, PillageGold, PortraitIndex, IconAtlas)
SELECT		('IMPROVEMENT_JFD_POLISH_CUSTOMS_HOUSE'),	('CIVILIZATION_JFD_POLAND_PILSUDSKI'),	1,						Description, Civilopedia, ArtDefineTag, BuildableOnResources, PillageGold, PortraitIndex, IconAtlas
FROM Improvements WHERE Type = 'IMPROVEMENT_CUSTOMS_HOUSE';	
--------------------------------		
-- Improvement_Yields
--------------------------------	
INSERT INTO Improvement_Yields 	
			(ImprovementType, 							YieldType, Yield)
SELECT		('IMPROVEMENT_JFD_POLISH_MANUFACTORY'), 	YieldType, Yield-2
FROM Improvement_Yields WHERE (ImprovementType = 'IMPROVEMENT_MANUFACTORY');	
	
INSERT INTO Improvement_Yields 	
			(ImprovementType, 							YieldType, Yield)
SELECT		('IMPROVEMENT_JFD_POLISH_CUSTOMS_HOUSE'), 	YieldType, Yield-2
FROM Improvement_Yields WHERE (ImprovementType = 'IMPROVEMENT_CUSTOMS_HOUSE');		
--------------------------------		
-- Improvement_ValidTerrains
--------------------------------	
INSERT INTO Improvement_ValidTerrains 	
			(ImprovementType, 							TerrainType)
SELECT		('IMPROVEMENT_JFD_POLISH_MANUFACTORY'), 	TerrainType
FROM Improvement_ValidTerrains WHERE (ImprovementType = 'IMPROVEMENT_MANUFACTORY');	
	
INSERT INTO Improvement_ValidTerrains 	
			(ImprovementType, 							TerrainType)
SELECT		('IMPROVEMENT_JFD_POLISH_CUSTOMS_HOUSE'), 	TerrainType
FROM Improvement_ValidTerrains WHERE (ImprovementType = 'IMPROVEMENT_CUSTOMS_HOUSE');	
--------------------------------		
-- Improvement_ResourceTypes
--------------------------------	
INSERT INTO Improvement_ResourceTypes 	
			(ImprovementType, 							ResourceType)
SELECT		('IMPROVEMENT_JFD_POLISH_MANUFACTORY'), 	ResourceType
FROM Improvement_ResourceTypes WHERE (ImprovementType = 'IMPROVEMENT_MANUFACTORY');	
	
INSERT INTO Improvement_ResourceTypes 	
			(ImprovementType, 							ResourceType)
SELECT		('IMPROVEMENT_JFD_POLISH_CUSTOMS_HOUSE'), 	ResourceType
FROM Improvement_ResourceTypes WHERE (ImprovementType = 'IMPROVEMENT_CUSTOMS_HOUSE');	
--------------------------------		
-- Improvement_TechYieldChanges
--------------------------------	
INSERT INTO Improvement_TechYieldChanges 	
			(ImprovementType, 							TechType, YieldType, Yield)
SELECT		('IMPROVEMENT_JFD_POLISH_MANUFACTORY'), 	TechType, YieldType, Yield
FROM Improvement_TechYieldChanges WHERE (ImprovementType = 'IMPROVEMENT_MANUFACTORY');	
	
INSERT INTO Improvement_TechYieldChanges 	
			(ImprovementType, 							TechType, YieldType, Yield)
SELECT		('IMPROVEMENT_JFD_POLISH_CUSTOMS_HOUSE'), 	TechType, YieldType, Yield
FROM Improvement_TechYieldChanges WHERE (ImprovementType = 'IMPROVEMENT_CUSTOMS_HOUSE');	
--==========================================================================================================================	
-- BUILDS
--==========================================================================================================================
-- Builds
--------------------------------	
INSERT INTO Builds 	
			(Type,								ImprovementType, 							PrereqTech,					Time,	ShowInpedia,	Description, EntityEvent, HotKey, OrderPriority, IconIndex, IconAtlas)
SELECT		('BUILD_JFD_POLISH_MANUFACTORY'),	('IMPROVEMENT_JFD_POLISH_MANUFACTORY'),		('TECH_INDUSTRIALIZATION'),	1000,	0,				Description, EntityEvent, HotKey, OrderPriority, IconIndex, IconAtlas
FROM Builds WHERE (Type = 'BUILD_MANUFACTORY');	
	
INSERT INTO Builds 	
			(Type,								ImprovementType, 							PrereqTech,					Time,	ShowInpedia,	Description, EntityEvent, HotKey, OrderPriority, IconIndex, IconAtlas)
SELECT		('BUILD_JFD_POLISH_CUSTOMS_HOUSE'),	('IMPROVEMENT_JFD_POLISH_CUSTOMS_HOUSE'),	('TECH_INDUSTRIALIZATION'),	1000,	0,				Description, EntityEvent, HotKey, OrderPriority, IconIndex, IconAtlas
FROM Builds WHERE (Type = 'BUILD_CUSTOMS_HOUSE');	
--------------------------------		
-- BuildFeatures
--------------------------------	
INSERT INTO BuildFeatures 	
			(BuildType, 						PrereqTech, FeatureType, Remove)
SELECT		('BUILD_JFD_POLISH_MANUFACTORY'), 	PrereqTech, FeatureType, Remove
FROM BuildFeatures WHERE (BuildType = 'IMPROVEMENT_MANUFACTORY');	
	
INSERT INTO BuildFeatures 	
			(BuildType, 						PrereqTech, FeatureType, Remove)
SELECT		('BUILD_JFD_POLISH_CUSTOMS_HOUSE'), PrereqTech, FeatureType, Remove
FROM BuildFeatures WHERE (BuildType = 'IMPROVEMENT_CUSTOMS_HOUSE');	
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES		('LEADER_JFD_PILSUDSKI', 	'TXT_KEY_LEADER_JFD_PILSUDSKI', 	'TXT_KEY_LEADER_JFD_PILSUDSKI_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_PILSUDSKI', 	'Pilsudski_Scene.xml',	5, 						2, 						2, 							8, 			6, 				8, 				8, 						3, 				2, 			1, 			3, 				3, 			3, 			'JFD_POLAND_PILSUDSKI_ATLAS', 	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_PILSUDSKI', 	'MAJOR_CIV_APPROACH_WAR', 			6),
			('LEADER_JFD_PILSUDSKI', 	'MAJOR_CIV_APPROACH_HOSTILE', 		5),
			('LEADER_JFD_PILSUDSKI', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
			('LEADER_JFD_PILSUDSKI', 	'MAJOR_CIV_APPROACH_GUARDED', 		7),
			('LEADER_JFD_PILSUDSKI', 	'MAJOR_CIV_APPROACH_AFRAID', 		2),
			('LEADER_JFD_PILSUDSKI', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
			('LEADER_JFD_PILSUDSKI', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_PILSUDSKI', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
			('LEADER_JFD_PILSUDSKI', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_JFD_PILSUDSKI', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	3),
			('LEADER_JFD_PILSUDSKI', 	'MINOR_CIV_APPROACH_CONQUEST', 		7),
			('LEADER_JFD_PILSUDSKI', 	'MINOR_CIV_APPROACH_BULLY', 		6);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_PILSUDSKI', 	'FLAVOR_OFFENSE', 					8),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_DEFENSE', 					8),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_CITY_DEFENSE', 				3),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_MILITARY_TRAINING', 		4),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_RECON', 					4),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_RANGED', 					3),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_MOBILE', 					8),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_NAVAL', 					2),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_NAVAL_RECON', 				2),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_NAVAL_GROWTH', 				2),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	2),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_AIR', 						3),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_EXPANSION', 				6),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_GROWTH', 					5),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_INFRASTRUCTURE', 			5),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_PRODUCTION', 				6),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_GOLD', 						6),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_SCIENCE', 					4),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_CULTURE', 					3),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_HAPPINESS', 				6),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_GREAT_PEOPLE', 				2),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_WONDER', 					2),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_RELIGION', 					2),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_DIPLOMACY', 				3),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_SPACESHIP', 				4),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_NUKE', 						3),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_USE_NUKE', 					3),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_ESPIONAGE', 				6),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_AIRLIFT', 					3),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_PILSUDSKI', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_PILSUDSKI', 	'TRAIT_JFD_POLAND_PILSUDSKI');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
			(Type, 								Description, 							ShortDescription)
VALUES		('TRAIT_JFD_POLAND_PILSUDSKI', 		'TXT_KEY_TRAIT_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_TRAIT_JFD_POLAND_PILSUDSKI_SHORT');
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
			(Type, 								Description, 								Help, 											Sound, 				MovesChange,	AttackMod,	DefenseMod, ExperiencePercent,	IgnoreZOC,	LostWithUpgrade,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_PILSUDSKI', 		'TXT_KEY_PROMOTION_JFD_PILSUDSKI',			'TXT_KEY_PROMOTION_JFD_PILSUDSKI_HELP', 		'AS2D_IF_LEVELUP', 	0,				20,			20,			33,					0,			0,					1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_PILSUDSKI'),
			('PROMOTION_JFD_UHLAN', 			'TXT_KEY_PROMOTION_JFD_UHLAN',				'TXT_KEY_PROMOTION_JFD_UHLAN_HELP',				'AS2D_IF_LEVELUP', 	0,				0,			0,			0,					0,			1,					1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_UHLAN'),
			('PROMOTION_JFD_UHLAN_COMBUSTION', 	'TXT_KEY_PROMOTION_JFD_UHLAN_COMBUSTION',	'TXT_KEY_PROMOTION_JFD_UHLAN_COMBUSTION_HELP', 	'AS2D_IF_LEVELUP', 	0,				0,			0,			0,					0,			1,					1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_UHLAN_COMBUSTION'),
			('PROMOTION_JFD_UHLAN_ARMOUR', 		'TXT_KEY_PROMOTION_JFD_UHLAN_ARMOUR',		'TXT_KEY_PROMOTION_JFD_UHLAN_ARMOUR_HELP', 		'AS2D_IF_LEVELUP', 	0,				0,			0,			0,					0,			1,					1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_UHLAN_ARMOUR'),
			('PROMOTION_JFD_PZL23', 			'TXT_KEY_PROMOTION_JFD_PZL23', 				'TXT_KEY_PROMOTION_JFD_PZL23_HELP', 			'AS2D_IF_LEVELUP',	0,				0,			0,			0,					0,			0,					1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_PZL23');
------------------------------
-- UnitPromotions_Domains
------------------------------
INSERT INTO UnitPromotions_Domains
			(PromotionType,					DomainType,					Modifier)
VALUES		('PROMOTION_JFD_PZL23',			'DOMAIN_LAND',				40);
------------------------------
-- UnitPromotions_UnitClasses
------------------------------
INSERT INTO UnitPromotions_UnitClasses
			(PromotionType,					UnitClassType,				Attack)
VALUES		('PROMOTION_JFD_UHLAN_ARMOUR',	'UNITCLASS_WWI_TANK',		10),
			('PROMOTION_JFD_UHLAN_ARMOUR',	'UNITCLASS_TANK',			10),
			('PROMOTION_JFD_UHLAN_ARMOUR',	'UNITCLASS_MECH',			10),
			('PROMOTION_JFD_UHLAN_ARMOUR',	'UNITCLASS_MODERN_ARMOR',	10);
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
			(Class, 	Type, 				PrereqTech, RangedCombat, Range,	AirInterceptRange, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 						Strategy, 								Help, 							 Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas,						MoveRate)
SELECT		Class,		('UNIT_JFD_PZL23'), PrereqTech, RangedCombat, Range+2,	AirInterceptRange, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_PZL23'), 	('TXT_KEY_CIV5_JFD_PZL23_TEXT'), 	('TXT_KEY_UNIT_JFD_PZL23_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_PZL23'), Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, ('ART_DEF_UNIT_JFD_PZL23'), 	0,					('JFD_PZL23_FLAG_ART_ATLAS'),	3, 				('JFD_POLAND_PILSUDSKI_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_FIGHTER');

INSERT INTO Units 	
			(Class,	Type, 					PrereqTech, Combat,	Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves,		CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 							Strategy, 									Help, 									MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech,			XPValueDefense, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas,						MoveRate)
SELECT		Class,	('UNIT_JFD_LEG_UHLAN'),	PrereqTech, Combat, Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves+1,	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_LEG_UHLAN'), 	('TXT_KEY_CIV5_JFD_LEG_UHLAN_TEXT'), 	('TXT_KEY_UNIT_JFD_LEG_UHLAN_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_LEG_UHLAN'), 	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ('TECH_COMBINED_ARMS'),	XPValueDefense, ('ART_DEF_UNIT_JFD_LEG_UHLAN'),	0,					('JFD_UNIT_FLAG_LEG_UHLAN_ATLAS'),	2, 				('JFD_POLAND_PILSUDSKI_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_CAVALRY');	
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_PZL23'), 			SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_FIGHTER');	
	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_LEG_UHLAN'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_CAVALRY');		
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_JFD_PZL23'), 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_FIGHTER');
	
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_JFD_LEG_UHLAN'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_CAVALRY');	
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 					ResourceType)
SELECT		('UNIT_JFD_PZL23'), 		ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_FIGHTER');

INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 					UnitClassType)
SELECT		('UNIT_JFD_LEG_UHLAN'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_CAVALRY');	
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 					UnitClassType)
SELECT		('UNIT_JFD_PZL23'), 		UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_FIGHTER');

INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 					UnitClassType)
SELECT		('UNIT_JFD_LEG_UHLAN'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_CAVALRY');
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_PZL23'), 		FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_FIGHTER');

INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_LEG_UHLAN'),		FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_CAVALRY');
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
			(UnitType, 					PromotionType)
SELECT		('UNIT_JFD_PZL23'), 		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_FIGHTER');

INSERT INTO Unit_FreePromotions 	
			(UnitType, 					PromotionType)
SELECT		('UNIT_JFD_LEG_UHLAN'),		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_CAVALRY');

INSERT INTO Unit_FreePromotions
			(UnitType, 					PromotionType)
VALUES		('UNIT_JFD_LEG_UHLAN', 		'PROMOTION_JFD_UHLAN_ZOC'),
			('UNIT_JFD_LEG_UHLAN', 		'PROMOTION_JFD_UHLAN_COMBUSTION'),
			('UNIT_JFD_LEG_UHLAN', 		'PROMOTION_JFD_UHLAN_MOVES_INFO'),
			('UNIT_JFD_LEG_UHLAN', 		'PROMOTION_JFD_UHLAN_ARMOUR'),
			('UNIT_JFD_PZL23', 			'PROMOTION_JFD_PZL23');
--------------------------------		
-- Unit_Builds
--------------------------------	
INSERT INTO Unit_Builds 	
			(UnitType, 					BuildType)
VALUES		('UNIT_WORKER', 			'BUILD_JFD_POLISH_CUSTOMS_HOUSE'),
			('UNIT_WORKER', 			'BUILD_JFD_POLISH_MANUFACTORY');	
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations
			(Type, 									Description, 	ShortDescription, 	Adjective, 	Civilopedia, CivilopediaTag, DefaultPlayerColor, 					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 						PortraitIndex, 	AlphaIconAtlas, 						SoundtrackTag, 	MapImage, 						DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_JFD_POLAND_PILSUDSKI'), 	Description, 	ShortDescription, 	Adjective,	Civilopedia, CivilopediaTag, ('PLAYERCOLOR_JFD_POLAND_PILSUDSKI'), 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_POLAND_PILSUDSKI_ATLAS'), 0, 				('JFD_POLAND_PILSUDSKI_ALPHA_ATLAS'), 	('Poland'), 	('PolandPilsudskiMap512.dds'), 	('TXT_KEY_CIV_JFD_PILSUDSKI_DAWN'),		('Pilsudski_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_POLAND');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
			(CivilizationType, 						CityName)
VALUES		('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_WARSAW'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_KRAKOW'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_01'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_02'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_03'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_04'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_05'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_06'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_07'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_08'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_09'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_10'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_11'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_12'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_13'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_14'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_15'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_16'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_17'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_18'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_19'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_20'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_21'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_22'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_23'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_24'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_25'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_26'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_27'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_28'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_29'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_30'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_31'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_32'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_33'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_34'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_CITY_NAME_JFD_POLAND_PILSUDSKI_35');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 						BuildingClassType)
SELECT		('CIVILIZATION_JFD_POLAND_PILSUDSKI'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_POLAND');
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 						TechType)
SELECT		('CIVILIZATION_JFD_POLAND_PILSUDSKI'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_POLAND');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_POLAND_PILSUDSKI'),	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_POLAND');
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 						LeaderheadType)
VALUES		('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'LEADER_JFD_PILSUDSKI');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 						UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'UNITCLASS_CAVALRY', 	'UNIT_JFD_LEG_UHLAN'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'UNITCLASS_FIGHTER', 	'UNIT_JFD_PZL23');
--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions 
			(CivilizationType, 						ReligionType)
SELECT		('CIVILIZATION_JFD_POLAND_PILSUDSKI'), 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_POLAND');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 						SpyName)
VALUES		('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_SPY_NAME_JFD_POLAND_PILSUDSKI_01'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_SPY_NAME_JFD_POLAND_PILSUDSKI_02'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_SPY_NAME_JFD_POLAND_PILSUDSKI_03'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_SPY_NAME_JFD_POLAND_PILSUDSKI_04'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_SPY_NAME_JFD_POLAND_PILSUDSKI_05'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_SPY_NAME_JFD_POLAND_PILSUDSKI_06'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_SPY_NAME_JFD_POLAND_PILSUDSKI_07'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_SPY_NAME_JFD_POLAND_PILSUDSKI_08'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_SPY_NAME_JFD_POLAND_PILSUDSKI_09'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_SPY_NAME_JFD_POLAND_PILSUDSKI_10'),
			('CIVILIZATION_JFD_POLAND_PILSUDSKI', 	'TXT_KEY_SPY_NAME_JFD_POLAND_PILSUDSKI_11');
--==========================================================================================================================
--==========================================================================================================================