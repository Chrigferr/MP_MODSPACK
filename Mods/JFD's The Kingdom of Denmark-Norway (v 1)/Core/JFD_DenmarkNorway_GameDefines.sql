--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
			(Type, 									DefaultBuilding, 				Description)
VALUES		('BUILDINGCLASS_JFD_DENMARK_NORWAY', 	'BUILDING_JFD_DENMARK_NORWAY', 	'TXT_KEY_BUILDING_JFD_DENMARK_NORWAY');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type, 						 	BuildingClass, 							SpecialistType,			SpecialistCount,	AllowsWaterRoutes,	Water,	Cost, FaithCost, PrereqTech, Description, 								Help,										PortraitIndex,	IconAtlas)
VALUES		('BUILDING_JFD_DENMARK_NORWAY', 'BUILDINGCLASS_JFD_DENMARK_NORWAY', 	'SPECIALIST_MERCHANT',	1,					1,					1,		-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_DENMARK_NORWAY', 	'TXT_KEY_BUILDING_JFD_DENMARK_NORWAY_HELP',	2,				'EXPANSION_TECH_ATLAS_1');
--==========================================================================================================================
-- BUILDS
--==========================================================================================================================
-- Builds
------------------------------	
INSERT INTO Builds
			(Type,						ImprovementType, 				Water,	Time,	Recommendation,							Description,				Help,									CtrlDown,	OrderPriority,	IconIndex,	IconAtlas,				HotKey, EntityEvent)
VALUES		('BUILD_JFD_SEA_FORTRESS',	'IMPROVEMENT_JFD_SEA_FORTRESS',	1,		1,		'TXT_KEY_BUILD_JFD_SEA_FORTRESS_REC',	'TXT_KEY_JFD_SEA_FORTRESS',	'TXT_KEY_BUILD_JFD_SEA_FORTRESS_HELP',	1,			96,				51,			'UNIT_ACTION_ATLAS',	'KB_F',	'ENTITY_EVENT_BUILD');
--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
-- Improvements
--------------------------------
INSERT INTO Improvements
			(Type,								NoTwoAdjacent,	Water,	NearbyEnemyDamage,	DefenseModifier,	CreatedByGreatPerson,	AllowsWalkWater,	InAdjacentFriendly,	CultureBombRadius,	Description,							Civilopedia,								ArtDefineTag,					BuildableOnResources,	PortraitIndex,	IconAtlas)
VALUES		('IMPROVEMENT_JFD_SEA_FORTRESS',	1,				1,		30,					100,				1,						1,					1,					1,					'TXT_KEY_IMPROVEMENT_JFD_SEA_FORTRESS',	'TXT_KEY_CIV5_IMPROVEMENTS_CITADEL_TEXT',	'ART_DEF_IMPROVEMENT_CITADEL', 	0,						35,				'TERRAIN_ATLAS');
--------------------------------
-- Improvement_ResourceTypes
--------------------------------
INSERT INTO Improvement_ValidTerrains
			(ImprovementType,					TerrainType)
VALUES		('IMPROVEMENT_JFD_SEA_FORTRESS',	'TERRAIN_COAST'),
			('IMPROVEMENT_JFD_SEA_FORTRESS',	'TERRAIN_OCEAN');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_JFD_CHRISTIAN', 	'TXT_KEY_LEADER_JFD_CHRISTIAN', 	'TXT_KEY_LEADER_JFD_CHRISTIAN_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_CHRISTIAN', 	'Christian_Scene.xml',	6, 						7, 						4, 							8, 			6, 				4, 				3, 						6, 				4, 			7, 			8, 				9, 			2, 			'JFD_DENMARK_NORWAY_ATLAS', 1);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_CHRISTIAN', 	'MAJOR_CIV_APPROACH_WAR', 			4),
			('LEADER_JFD_CHRISTIAN', 	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
			('LEADER_JFD_CHRISTIAN', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	2),
			('LEADER_JFD_CHRISTIAN', 	'MAJOR_CIV_APPROACH_GUARDED', 		4),
			('LEADER_JFD_CHRISTIAN', 	'MAJOR_CIV_APPROACH_AFRAID', 		4),
			('LEADER_JFD_CHRISTIAN', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_JFD_CHRISTIAN', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_CHRISTIAN', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
			('LEADER_JFD_CHRISTIAN', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_JFD_CHRISTIAN', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
			('LEADER_JFD_CHRISTIAN', 	'MINOR_CIV_APPROACH_CONQUEST', 		4),
			('LEADER_JFD_CHRISTIAN', 	'MINOR_CIV_APPROACH_BULLY', 		4);
--------------------------------	
-- Leader_Flavors
--------------------------------						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_CHRISTIAN', 	'FLAVOR_OFFENSE', 					4),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_DEFENSE', 					8),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_CITY_DEFENSE', 				5),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_MILITARY_TRAINING', 		4),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_RECON', 					4),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_RANGED', 					4),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_MOBILE', 					4),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_NAVAL', 					9),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_NAVAL_RECON', 				9),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_NAVAL_GROWTH', 				9),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	9),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_AIR', 						4),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_EXPANSION', 				7),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_GROWTH', 					6),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_INFRASTRUCTURE', 			5),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_PRODUCTION', 				5),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_GOLD', 						8),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_SCIENCE', 					4),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_CULTURE', 					6),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_HAPPINESS', 				5),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_GREAT_PEOPLE', 				6),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_WONDER', 					4),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_RELIGION', 					4),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_DIPLOMACY', 				4),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_SPACESHIP', 				2),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_WATER_CONNECTION', 			2),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_ESPIONAGE', 				2),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_CHRISTIAN', 	'TRAIT_JFD_DENMARK_NORWAY');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
			(Type, 							Description, 							ShortDescription,							FreeBuilding)
VALUES		('TRAIT_JFD_DENMARK_NORWAY', 	'TXT_KEY_TRAIT_JFD_DENMARK_NORWAY', 	'TXT_KEY_TRAIT_JFD_DENMARK_NORWAY_SHORT',	'BUILDING_JFD_DENMARK_NORWAY');		
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT OR REPLACE INTO UnitPromotions 
			(Type, 														Description, 														Help, 																	Sound, 				CannotBeChosen, MovesChange,	OutsideFriendlyLandsModifier, 	PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_DANO_NORWEGIAN_SKI_INFANTRY_MOVES',			'TXT_KEY_PROMOTION_JFD_DANO_NORWEGIAN_SKI_INFANTRY_MOVES',			'TXT_KEY_PROMOTION_JFD_DANO_NORWEGIAN_SKI_INFANTRY_MOVES_HELP',			'AS2D_IF_LEVELUP', 	1, 				0, 				0, 								59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_DANO_NORWEGIAN_SKI_INFANTRY_MOVES'),
			('PROMOTION_JFD_LAND_UNIT_BONUS_LONGBOAT', 					'TXT_KEY_PROMOTION_JFD_LAND_UNIT_BONUS_LONGBOAT', 					'TXT_KEY_PROMOTION_JFD_LAND_UNIT_BONUS_LONGBOAT_HELP',					'AS2D_IF_LEVELUP', 	1, 				0, 				0, 								59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_LAND_UNIT_BONUS_LONGBOAT'),
			('PROMOTION_JFD_LAND_UNIT_BONUS', 							'TXT_KEY_PROMOTION_JFD_LAND_UNIT_BONUS', 							'TXT_KEY_PROMOTION_JFD_LAND_UNIT_BONUS_HELP', 							'AS2D_IF_LEVELUP', 	1, 				0, 				20, 							59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_LAND_UNIT_BONUS');
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
			(Class, Type, 						WorkRate,	Cost, Moves, CivilianAttackPriority, Special, Domain,	DefaultUnitAI, 	Description,							Help,										Strategy,										Civilopedia,								AdvancedStartCost, WorkRate, CombatLimit, GoldenAgeTurns, UnitArtInfo,							UnitArtInfoEraVariation, UnitFlagAtlas,							UnitFlagIconOffset, IconAtlas,						PortraitIndex,	MoveRate)
SELECT		Class, 	('UNIT_JFD_KONTREADMIRAL'),	1,			Cost, Moves, CivilianAttackPriority, Special, Domain,	DefaultUnitAI,	('TXT_KEY_UNIT_JFD_KONTREADMIRAL'),		('TXT_KEY_UNIT_JFD_KONTREADMIRAL_HELP'),	('TXT_KEY_UNIT_JFD_KONTREADMIRAL_STRATEGY'),	('TXT_KEY_UNIT_JFD_KONTREADMIRAL_PEDIA'),	AdvancedStartCost, WorkRate, CombatLimit, GoldenAgeTurns, ('ART_DEF_UNIT_JFD_KONTREADMIRAL'),	UnitArtInfoEraVariation, ('JFD_UNIT_FLAG_KONTREADMIRAL_ATLAS'),	0,					('JFD_DENMARK_NORWAY_ATLAS'),	2,				MoveRate
FROM Units WHERE (Type = 'UNIT_GREAT_ADMIRAL');

INSERT OR REPLACE INTO Units 	
			(Class,	Type, 						PrereqTech, Cost, 	Moves, 	Combat,		RangedCombat,	Range,	CombatClass,				Domain, DefaultUnitAI, Description, 					Civilopedia, 						Strategy, 								Help, 								MilitarySupport, MilitaryProduction, Pillage, Mechanized, ObsoleteTech, AdvancedStartCost, XPValueAttack, MinAreaSize, XPValueDefense, UnitArtInfo, 					UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas, 						MoveRate)
SELECT		Class,	('UNIT_JFD_LONGBOAT'), 		PrereqTech, Cost, 	Moves, 	Combat-2,	Combat+2,		2,		('UNITCOMBAT_NAVALRANGED'), Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_LONGBOAT'), 	('TXT_KEY_UNIT_JFD_LONGBOAT_TEXT'), ('TXT_KEY_UNIT_JFD_LONGBOAT_STRATEGY'), ('TXT_KEY_UNIT_JFD_LONGBOAT_HELP'), MilitarySupport, MilitaryProduction, Pillage, Mechanized, ObsoleteTech, AdvancedStartCost, XPValueAttack, MinAreaSize, XPValueDefense, ('ART_DEF_UNIT_JFD_LONGBOAT'),	0,					('JFD_UNIT_FLAG_LONGBOAT_ATLAS'), 	3, 				('JFD_DENMARK_NORWAY_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_TRIREME');

INSERT OR REPLACE INTO Units 	
			(Class,	Type, 							PrereqTech, Cost, 	Moves, 	Combat,		RangedCombat,	Range,	CombatClass, Domain, DefaultUnitAI, Description, 					ShowInPedia,	Help, 								MilitarySupport, MilitaryProduction, Pillage, Mechanized, ObsoleteTech, AdvancedStartCost, XPValueAttack, MinAreaSize, XPValueDefense, UnitArtInfo, 					UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas, 						MoveRate)
SELECT		Class,	('UNIT_JFD_LONGBOAT_UPGRADE'), 	PrereqTech, Cost, 	Moves, 	Combat-2,	RangedCombat-2,	2,		CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_LONGBOAT'), 	0,				('TXT_KEY_UNIT_JFD_LONGBOAT_HELP'), MilitarySupport, MilitaryProduction, Pillage, Mechanized, ObsoleteTech, AdvancedStartCost, XPValueAttack, MinAreaSize, XPValueDefense, ('ART_DEF_UNIT_JFD_LONGBOAT'),	0,					('JFD_UNIT_FLAG_LONGBOAT_ATLAS'), 	3, 				('JFD_DENMARK_NORWAY_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_GALLEASS');
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_KONTREADMIRAL'),		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_ADMIRAL');

INSERT OR REPLACE INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_LONGBOAT'), 			SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_TRIREME');

INSERT OR REPLACE INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_LONGBOAT_UPGRADE'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GALLEASS');
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_KONTREADMIRAL'),		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GREAT_ADMIRAL');	

INSERT OR REPLACE INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_LONGBOAT'), 			UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_TRIREME');

INSERT OR REPLACE INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_LONGBOAT_UPGRADE'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GALLEASS');
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_KONTREADMIRAL'),		FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREAT_ADMIRAL');

INSERT OR REPLACE INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_LONGBOAT'), 			FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_TRIREME');

INSERT OR REPLACE INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_LONGBOAT_UPGRADE'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GALLEASS');
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
			(UnitType, 						PromotionType)
SELECT		('UNIT_JFD_KONTREADMIRAL'),		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_GREAT_ADMIRAL');

DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_DANISH_SKI_INFANTRY';
INSERT OR REPLACE INTO Unit_FreePromotions 
			(UnitType, 						PromotionType)
VALUES		('UNIT_DANISH_SKI_INFANTRY',	'PROMOTION_JFD_DANO_NORWEGIAN_SKI_INFANTRY_MOVES'),
			('UNIT_JFD_LONGBOAT', 			'PROMOTION_ONLY_DEFENSIVE'),
			('UNIT_JFD_LONGBOAT_UPGRADE', 	'PROMOTION_ONLY_DEFENSIVE'),
			('UNIT_JFD_LONGBOAT', 			'PROMOTION_OCEAN_IMPASSABLE'),
			('UNIT_JFD_LONGBOAT_UPGRADE', 	'PROMOTION_OCEAN_IMPASSABLE'),
			('UNIT_JFD_LONGBOAT', 			'PROMOTION_CAN_MOVE_AFTER_ATTACKING'),
			('UNIT_JFD_LONGBOAT_UPGRADE', 	'PROMOTION_CAN_MOVE_AFTER_ATTACKING'),
			('UNIT_JFD_LONGBOAT', 			'PROMOTION_JFD_LAND_UNIT_BONUS_LONGBOAT'),
			('UNIT_JFD_LONGBOAT_UPGRADE', 	'PROMOTION_JFD_LAND_UNIT_BONUS_LONGBOAT');
--------------------------------
-- Unit_UniqueNames
--------------------------------
INSERT INTO Unit_UniqueNames 
			(UnitType, 					UniqueName)
VALUES		('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_01'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_02'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_03'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_04'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_05'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_06'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_08'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_09'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_10'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_11'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_12'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_13'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_14'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_15'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_16'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_17'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_18'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_20'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_21'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_22'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_23'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_24'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_25'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_26'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_27'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_28'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_29'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_30');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================	
-- Denmark
--------------------------------	
INSERT OR REPLACE INTO Unit_ClassUpgrades 	
			(UnitType, 						UnitClassType)
SELECT		('UNIT_JFD_LONGBOAT'),			UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_TRIREME');

INSERT OR REPLACE INTO Unit_ClassUpgrades 	
			(UnitType, 						UnitClassType)
SELECT		('UNIT_JFD_LONGBOAT_UPGRADE'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_GALLEASS');	
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================
INSERT INTO Unit_Builds 	
			(UnitType, 					BuildType)
VALUES		('UNIT_JFD_KONTREADMIRAL', 	'BUILD_JFD_SEA_FORTRESS');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 		
			(Type, 									Description,								ShortDescription, 								Adjective, 										Civilopedia,								CivilopediaTag,							DefaultPlayerColor,					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 						PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 						DawnOfManQuote, 							DawnOfManImage)
SELECT		('CIVILIZATION_JFD_DENMARK_NORWAY'), 	('TXT_KEY_CIV_JFD_DENMARK_NORWAY_DESC'), 	('TXT_KEY_CIV_JFD_DENMARK_NORWAY_SHORT_DESC'), ('TXT_KEY_CIV_JFD_DENMARK_NORWAY_ADJECTIVE'), 	('TXT_KEY_CIV5_JFD_DENMARK_NORWAY_TEXT_1'), ('TXT_KEY_CIV5_JFD_DENMARK_NORWAY'), 	('PLAYERCOLOR_JFD_DENMARK_NORWAY'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_DENMARK_NORWAY_ATLAS'), 	0, 				('JFD_DENMARK_NORWAY_ALPHA_ATLAS'), ('Sweden'), 	('DenmarkNorwayMap512.dds'),	('TXT_KEY_CIV5_DAWN_DENMARK_NORWAY_TEXT'),	('DOM_Christian.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_DENMARK');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames 
			(CivilizationType, 						CityName)
VALUES		('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_01'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_02'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_03'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_04'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_05'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_06'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_07'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_08'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_09'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_10'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_11'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_12'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_13'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_14'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_15'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_16'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_17'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_18'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_19'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_20'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_21'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_22'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_23'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_24'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_25'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_26');	
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 						BuildingClassType)
SELECT		('CIVILIZATION_JFD_DENMARK_NORWAY'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_DENMARK');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 						TechType)
SELECT		('CIVILIZATION_JFD_DENMARK_NORWAY'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_DENMARK');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_DENMARK_NORWAY'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_DENMARK');
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 						LeaderheadType)
VALUES		('CIVILIZATION_JFD_DENMARK_NORWAY', 	'LEADER_JFD_CHRISTIAN');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_DENMARK';
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 					UnitType)
VALUES		('CIVILIZATION_JFD_DENMARK_NORWAY', 'UNITCLASS_GREAT_ADMIRAL', 		'UNIT_JFD_KONTREADMIRAL'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 'UNITCLASS_RIFLEMAN', 			'UNIT_DANISH_SKI_INFANTRY'),
			('CIVILIZATION_DENMARK', 			'UNITCLASS_LONGSWORDSMAN', 		'UNIT_DANISH_BERSERKER'),
			('CIVILIZATION_DENMARK', 			'UNITCLASS_TRIREME', 			'UNIT_JFD_LONGBOAT'),
			('CIVILIZATION_DENMARK', 			'UNITCLASS_GALLEASS', 			'UNIT_JFD_LONGBOAT_UPGRADE');
--------------------------------	
-- Civilization_Religions
--------------------------------		
INSERT INTO Civilization_Religions 
			(CivilizationType, 						ReligionType)
SELECT		('CIVILIZATION_JFD_DENMARK_NORWAY'),	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_SWEDEN');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 						SpyName)
VALUES		('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_DENMARK_NORWAY_0'),	
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_DENMARK_NORWAY_1'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_DENMARK_NORWAY_2'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_DENMARK_NORWAY_3'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_DENMARK_NORWAY_4'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_DENMARK_NORWAY_5'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_DENMARK_NORWAY_6'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_DENMARK_NORWAY_7'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_DENMARK_NORWAY_8'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_DENMARK_NORWAY_9');
--------------------------------
-- Civilization_Start_Along_Ocean
--------------------------------	
INSERT INTO Civilization_Start_Along_Ocean 
			(CivilizationType, 						StartAlongOcean)
VALUES		('CIVILIZATION_JFD_DENMARK_NORWAY', 	1);
--------------------------------
-- Civilization_Start_Region_Priority
--------------------------------	
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 						RegionType)
VALUES		('CIVILIZATION_JFD_DENMARK_NORWAY', 	'REGION_TUNDRA');
--==========================================================================================================================
--==========================================================================================================================