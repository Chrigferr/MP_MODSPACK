--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
-- UnitPromotions
--------------------------------	
INSERT OR REPLACE INTO UnitPromotions 
		(Type, 									Description, 									Help, 												Sound, 					CannotBeChosen, LostWithUpgrade, UpgradeDiscount,	MovesChange,	AttackMod,	IgnoreZOC,	PortraitIndex,  IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_CHEVAU_LEGER', 			'TXT_KEY_PROMOTION_JFD_CHEVAU_LEGER',			'TXT_KEY_PROMOTION_JFD_CHEVAU_LEGER_HELP',			'AS2D_IF_LEVELUP',		1, 				0,				 0, 				0,				25,			0, 			59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_CHEVAU_LEGER'),
		('PROMOTION_JFD_CHEVAU_LEGER_INFO',		'TXT_KEY_PROMOTION_JFD_CHEVAU_LEGER_INFO',		'TXT_KEY_PROMOTION_JFD_CHEVAU_LEGER_INFO_HELP',		'AS2D_IF_LEVELUP',		1, 				0,				 0, 				0,				0,			0, 			59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_CHEVAU_LEGER_INFO'),
		('PROMOTION_JFD_CHEVAU_LEGER_MOVES',	'TXT_KEY_PROMOTION_JFD_CHEVAU_LEGER_MOVES',		'TXT_KEY_PROMOTION_JFD_CHEVAU_LEGER_MOVES_HELP',	'AS2D_IF_LEVELUP',		1, 				0,				 0, 				2,				0,			0, 			59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_CHEVAU_LEGER_MOVES'),
		('PROMOTION_JFD_GENERAL_FRANCE', 		'TXT_KEY_PROMOTION_JFD_GENERAL_FRANCE',			'TXT_KEY_PROMOTION_JFD_GENERAL_FRANCE_HELP', 		'AS2D_IF_LEVELUP', 		1, 				0, 				 0, 				0,				0,			1, 			59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_GENERAL_FRANCE'),
		('PROMOTION_JFD_IMPERIAL_GUARD', 		'TXT_KEY_PROMOTION_JFD_IMPERIAL_GUARD',			'TXT_KEY_PROMOTION_JFD_IMPERIAL_GUARD_HELP', 		'AS2D_IF_LEVELUP', 		1, 				1, 				 20, 				0,				0,			1, 			59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_IMPERIAL_GUARD');
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================	
-- Units
--------------------------------		
INSERT OR REPLACE INTO Units 	
		(Type, 						 PrereqTech,  Class, Combat, Cost, Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 							Help, 									Strategy,									ObsoleteTech, 	GoodyHutUpgradeUnitClass, 	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, UnitArtInfo,						UnitFlagIconOffset,	UnitFlagAtlas,						MoveRate,	PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_CHEVAU_LEGER',	 PrereqTech,  Class, Combat, Cost, Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_CHEVAU_LEGER', 	'TXT_KEY_CIV5_JFD_CHEVAU_LEGER_TEXT',	'TXT_KEY_UNIT_JFD_CHEVAU_LEGER_HELP', 	'TXT_KEY_UNIT_JFD_CHEVAU_LEGER_STRATEGY',	ObsoleteTech,	GoodyHutUpgradeUnitClass,	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, 'ART_DEF_UNIT_JFD_CHEVAU_LEGER',  	0,					'JFD_UNIT_FLAG_CHEVAU_LEGER_ATLAS',	MoveRate,	3, 				'JFD_FRANCE_ATLAS'
FROM Units WHERE Type = 'UNIT_LANCER';	

INSERT OR REPLACE INTO Units 	
		(Type, 						Class,	ShowInPedia, PrereqTech, Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, Moves, HurryCostModifier, WorkRate, Domain, DefaultUnitAI,	Description, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfoEraVariation, UnitArtInfo, UnitFlagAtlas, UnitFlagIconOffset, PortraitIndex, IconAtlas, MoveRate)
SELECT	'UNIT_JFD_GENERAL_FRANCE', 	Class, 	0,			 PrereqTech, Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, Moves, HurryCostModifier, WorkRate, Domain, DefaultUnitAI,	Description, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfoEraVariation, UnitArtInfo, UnitFlagAtlas, UnitFlagIconOffset, PortraitIndex, IconAtlas, MoveRate
FROM Units WHERE Type = 'UNIT_GREAT_GENERAL';

INSERT OR REPLACE INTO Units 	
		(Type, 						 PrereqTech, Class, Combat,   Cost, 	Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 								Help, 										Strategy,									ObsoleteTech, GoodyHutUpgradeUnitClass, Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, UnitArtInfo,							UnitFlagIconOffset,	UnitFlagAtlas,							MoveRate,	PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_IMPERIAL_GUARD',	 PrereqTech, Class, Combat+3, Cost+35,	Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_JFD_IMPERIAL_GUARD', 	'TXT_KEY_CIV5_JFD_IMPERIAL_GUARD_TEXT', 	'TXT_KEY_UNIT_JFD_IMPERIAL_GUARD_HELP', 	'TXT_KEY_UNIT_JFD_IMPERIAL_GUARD_STRATEGY',	ObsoleteTech, GoodyHutUpgradeUnitClass,	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, 'ART_DEF_UNIT_JFD_IMPERIAL_GUARD',  	0,					'JFD_UNIT_FLAG_IMPERIAL_GUARD_ATLAS',	MoveRate,	2, 				'JFD_FRANCE_ATLAS'
FROM Units WHERE Type = 'UNIT_RIFLEMAN';
--------------------------------
-- UnitGameplay2DScripts
--------------------------------	
INSERT OR REPLACE INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_CHEVAU_LEGER', 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_LANCER';	
INSERT OR REPLACE INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_GENERAL_FRANCE', 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GREAT_GENERAL';	

INSERT OR REPLACE INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_IMPERIAL_GUARD', 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_RIFLEMAN';
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	'UNIT_JFD_CHEVAU_LEGER', 		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_LANCER';

INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	'UNIT_JFD_GENERAL_FRANCE',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GREAT_GENERAL';

INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	'UNIT_JFD_IMPERIAL_GUARD', 		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_RIFLEMAN';
--------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 						ResourceType)
SELECT	'UNIT_JFD_CHEVAU_LEGER', 		ResourceType
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_LANCER';
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType, Flavor)
SELECT	'UNIT_JFD_CHEVAU_LEGER', 		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_LANCER';

INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType, Flavor)
SELECT	'UNIT_JFD_GENERAL_FRANCE', 		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GREAT_GENERAL';

INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType, Flavor)
SELECT	'UNIT_JFD_IMPERIAL_GUARD', 		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_RIFLEMAN';
--------------------------------
-- Unit_ClassUpgrades
--------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 						UnitClassType)
SELECT	'UNIT_JFD_CHEVAU_LEGER', 		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_LANCER';

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 						UnitClassType)
SELECT	'UNIT_JFD_IMPERIAL_GUARD', 		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_RIFLEMAN';
--------------------------------
-- Unit_Builds
--------------------------------
INSERT INTO Unit_Builds 	
		(UnitType, 						BuildType)
SELECT	'UNIT_JFD_GENERAL_FRANCE', 		BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
SELECT	'UNIT_JFD_CHEVAU_LEGER', 		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_LANCER';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
SELECT	'UNIT_JFD_GENERAL_FRANCE', 		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GREAT_GENERAL';

INSERT INTO Unit_FreePromotions
		(UnitType, 						PromotionType)
VALUES	('UNIT_JFD_CHEVAU_LEGER',		'PROMOTION_JFD_CHEVAU_LEGER_INFO'),
		('UNIT_JFD_CHEVAU_LEGER',		'PROMOTION_JFD_CHEVAU_LEGER_MOVES'),
		('UNIT_JFD_GENERAL_FRANCE',		'PROMOTION_JFD_GENERAL_FRANCE'),
		('UNIT_JFD_IMPERIAL_GUARD',		'PROMOTION_SPAWN_GENERALS_I'),
		('UNIT_JFD_IMPERIAL_GUARD',		'PROMOTION_JFD_IMPERIAL_GUARD');
		
DELETE FROM Unit_FreePromotions
WHERE PromotionType = 'PROMOTION_JFD_GENERAL_FRANCE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CIVILIZATIONS_FRANCE_NAPOLEON_I_UA' AND Value = 1);			
--------------------------------
-- Unit_UniqueNames
--------------------------------
INSERT INTO Unit_UniqueNames 
		(UnitType, 					UniqueName)
VALUES	('UNIT_JFD_GENERAL_FRANCE', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_GENERAL_NAPOLEON_1'),
		('UNIT_JFD_GENERAL_FRANCE', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_GENERAL_NAPOLEON_2'),
		('UNIT_JFD_GENERAL_FRANCE', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_GENERAL_NAPOLEON_3'),
		('UNIT_JFD_GENERAL_FRANCE', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_GENERAL_NAPOLEON_4'),
		('UNIT_JFD_GENERAL_FRANCE', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_GENERAL_NAPOLEON_5'),
		('UNIT_JFD_GENERAL_FRANCE', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_GENERAL_NAPOLEON_6'),
		('UNIT_JFD_GENERAL_FRANCE', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_GENERAL_NAPOLEON_7'),
		('UNIT_JFD_GENERAL_FRANCE', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_GENERAL_NAPOLEON_8'),
		('UNIT_JFD_GENERAL_FRANCE', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_GENERAL_NAPOLEON_9'),
		('UNIT_JFD_GENERAL_FRANCE', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_GENERAL_NAPOLEON_10'),
		('UNIT_JFD_GENERAL_FRANCE', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_GENERAL_NAPOLEON_11'),
		('UNIT_JFD_GENERAL_FRANCE', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_GENERAL_NAPOLEON_12'),
		('UNIT_JFD_GENERAL_FRANCE', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_GENERAL_NAPOLEON_13'),
		('UNIT_JFD_GENERAL_FRANCE', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_GENERAL_NAPOLEON_14'),
		('UNIT_JFD_GENERAL_FRANCE', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_GENERAL_NAPOLEON_15'),
		('UNIT_JFD_GENERAL_FRANCE', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_GENERAL_NAPOLEON_16'),
		('UNIT_JFD_GENERAL_FRANCE', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_GENERAL_NAPOLEON_17'),
		('UNIT_JFD_GENERAL_FRANCE', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_GENERAL_NAPOLEON_18'),
		('UNIT_JFD_GENERAL_FRANCE', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_GENERAL_NAPOLEON_19'),
		('UNIT_JFD_GENERAL_FRANCE', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_GENERAL_NAPOLEON_20'),
		('UNIT_JFD_GENERAL_FRANCE', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_GENERAL_NAPOLEON_21'),
		('UNIT_JFD_GENERAL_FRANCE', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_GENERAL_NAPOLEON_22'),
		('UNIT_JFD_GENERAL_FRANCE', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_GENERAL_NAPOLEON_23'),
		('UNIT_JFD_GENERAL_FRANCE', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_GENERAL_NAPOLEON_24'),
		('UNIT_JFD_GENERAL_FRANCE', 'TXT_KEY_GREAT_PERSON_JFD_GREAT_GENERAL_NAPOLEON_25');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--------------------------------						
DELETE FROM Leader_MajorCivApproachBiases Where LeaderType = 'LEADER_NAPOLEON';
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_NAPOLEON', 		'MAJOR_CIV_APPROACH_WAR', 			9),
		('LEADER_NAPOLEON', 		'MAJOR_CIV_APPROACH_HOSTILE', 		8),
		('LEADER_NAPOLEON', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
		('LEADER_NAPOLEON', 		'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_NAPOLEON', 		'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_NAPOLEON', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_NAPOLEON', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------						
DELETE FROM Leader_MajorCivApproachBiases Where LeaderType = 'LEADER_NAPOLEON';
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES	('LEADER_NAPOLEON', 		'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_NAPOLEON', 		'MINOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_NAPOLEON', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
		('LEADER_NAPOLEON', 		'MINOR_CIV_APPROACH_CONQUEST', 		7),
		('LEADER_NAPOLEON', 		'MINOR_CIV_APPROACH_BULLY', 		4);
--------------------------------	
-- Leader_Flavors
--------------------------------						
DELETE FROM Leader_Flavors Where LeaderType = 'LEADER_NAPOLEON';
INSERT INTO Leader_Flavors 
		(LeaderType, 				FlavorType, 						Flavor)
VALUES	('LEADER_NAPOLEON', 		'FLAVOR_OFFENSE', 					9),
		('LEADER_NAPOLEON', 		'FLAVOR_DEFENSE', 					6),
		('LEADER_NAPOLEON', 		'FLAVOR_CITY_DEFENSE', 				4),
		('LEADER_NAPOLEON', 		'FLAVOR_MILITARY_TRAINING', 		9),
		('LEADER_NAPOLEON', 		'FLAVOR_RECON', 					4),
		('LEADER_NAPOLEON', 		'FLAVOR_RANGED', 					4),
		('LEADER_NAPOLEON', 		'FLAVOR_MOBILE', 					9),
		('LEADER_NAPOLEON', 		'FLAVOR_NAVAL', 					3),
		('LEADER_NAPOLEON', 		'FLAVOR_NAVAL_RECON', 				3),
		('LEADER_NAPOLEON', 		'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_NAPOLEON', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_NAPOLEON', 		'FLAVOR_AIR', 						4),
		('LEADER_NAPOLEON', 		'FLAVOR_EXPANSION', 				9),
		('LEADER_NAPOLEON', 		'FLAVOR_GROWTH', 					5),
		('LEADER_NAPOLEON', 		'FLAVOR_TILE_IMPROVEMENT', 			6),
		('LEADER_NAPOLEON', 		'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_NAPOLEON', 		'FLAVOR_PRODUCTION', 				5),
		('LEADER_NAPOLEON', 		'FLAVOR_GOLD', 						6),
		('LEADER_NAPOLEON', 		'FLAVOR_SCIENCE', 					5),
		('LEADER_NAPOLEON', 		'FLAVOR_CULTURE', 					6),
		('LEADER_NAPOLEON', 		'FLAVOR_HAPPINESS', 				7),
		('LEADER_NAPOLEON', 		'FLAVOR_GREAT_PEOPLE', 				8),
		('LEADER_NAPOLEON', 		'FLAVOR_WONDER', 					3),
		('LEADER_NAPOLEON', 		'FLAVOR_RELIGION', 					6),
		('LEADER_NAPOLEON', 		'FLAVOR_DIPLOMACY', 				6),
		('LEADER_NAPOLEON', 		'FLAVOR_SPACESHIP', 				3),
		('LEADER_NAPOLEON', 		'FLAVOR_WATER_CONNECTION', 			4),
		('LEADER_NAPOLEON', 		'FLAVOR_NUKE', 						2),
		('LEADER_NAPOLEON', 		'FLAVOR_USE_NUKE', 					2),
		('LEADER_NAPOLEON', 		'FLAVOR_ESPIONAGE', 				7),
		('LEADER_NAPOLEON', 		'FLAVOR_AIRLIFT', 					2),
		('LEADER_NAPOLEON', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_NAPOLEON', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_NAPOLEON', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_NAPOLEON', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_NAPOLEON', 		'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_NAPOLEON', 		'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
UPDATE Leader_Traits 
SET TraitType = 'TRAIT_JFD_FRANCE_NAPOLEON'
WHERE LeaderType = 'LEADER_NAPOLEON';	
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 							Description, 							ShortDescription)
VALUES	('TRAIT_JFD_FRANCE_NAPOLEON',	'TXT_KEY_TRAIT_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_TRAIT_JFD_FRANCE_NAPOLEON_SHORT');

UPDATE Traits
SET Description = 'TXT_KEY_TRAIT_JFD_FRANCE_NAPOLEON_ALT'
WHERE Type = 'TRAIT_JFD_FRANCE_NAPOLEON'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CIVILIZATIONS_FRANCE_NAPOLEON_I_UA' AND Value = 1);	
--==========================================================================================================================	
-- POLICIES
--==========================================================================================================================	
-- Policies
--------------------------------
INSERT INTO Policies 
		(Type, 							Description, 							FreeBuildingOnConquest)
VALUES	('POLICY_JFD_FRANCE_NAPOLEON',	'TXT_KEY_TRAIT_JFD_FRANCE_NAPOLEON', 	'BUILDING_COURTHOUSE');		
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 									DerivativeCiv,			Description, 								ShortDescription, 								Adjective, 										Civilopedia, 								CivilopediaTag, 						DefaultPlayerColor, 				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 			SoundtrackTag, 	MapImage, 						DawnOfManQuote, 					DawnOfManImage,			DawnOfManAudio)
SELECT	'CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'CIVILIZATION_FRANCE',	'TXT_KEY_CIV_JFD_FRANCE_NAPOLEON_DESC', 	'TXT_KEY_CIV_JFD_FRANCE_NAPOLEON_SHORT_DESC', 	'TXT_KEY_CIV_JFD_FRANCE_NAPOLEON_ADJECTIVE', 	'TXT_KEY_CIV5_JFD_FRANCE_NAPOLEON_TEXT_1', 	'TXT_KEY_CIV5_JFD_FRANCE_NAPOLEON', 	'PLAYERCOLOR_JFD_FRANCE_NAPOLEON', 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_FRANCE_ATLAS', 	0, 				'JFD_FRANCE_ALPHA_ATLAS', 	'France', 		'NapoleonicFranceMap512.dds',	'TXT_KEY_CIV5_DAWN_FRANCE_TEXT', 	'Napoleon_DOM.dds',		'AS2D_DOM_SPEECH_FRANCE'
FROM Civilizations WHERE Type = 'CIVILIZATION_FRANCE';
---------------------------------	
-- Civilization_CityNames
---------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_PARIS'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_ORLEANS'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_LYONS'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_RHEIMS'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_TOURS'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_MARSEILLES'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_CHARTRES'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_AVIGNON'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_ROUEN'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_GRENOBLE'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_DJION'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_AMIENS'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_CHERBOURG'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_POITIERS'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_TOULOUSE'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_BAYONNE'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_STRASBOURG'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_BREST'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_BORDEAUX'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_RENNES'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_NICE'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_NANTES'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_REIMS'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_LE_MANS'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_MONTPELLIER'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_LIMOGES'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_NANCY'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_LILLE'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_CAEN'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_TOULON'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_NIMES'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_LOURDES'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_LE_HAVRE'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_CARCASSONNE'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_CANNES'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_AIX_EN_PROVINCE'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_LA_ROCHELLE'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_BOURGES'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_CITY_NAME_CALAIS');
---------------------------------	
-- Civilization_FreeBuildingClasses
---------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_JFD_FRANCE_NAPOLEON', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_FRANCE';
---------------------------------	
-- Civilization_FreeTechs
---------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_JFD_FRANCE_NAPOLEON', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_FRANCE';
---------------------------------	
-- Civilization_FreeUnits
---------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_FRANCE_NAPOLEON', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_FRANCE';
---------------------------------	
-- Civilization_Leaders
---------------------------------	
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'LEADER_NAPOLEON');
---------------------------------	
-- Civilization_UnitClassOverrides 
---------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'UNITCLASS_RIFLEMAN', 	'UNIT_JFD_IMPERIAL_GUARD'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'UNITCLASS_LANCER', 	'UNIT_JFD_CHEVAU_LEGER');
---------------------------------	
-- Civilization_Religions
---------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
SELECT	'CIVILIZATION_JFD_FRANCE_NAPOLEON', 	ReligionType
FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_FRANCE';
---------------------------------	
-- Civilization_SpyNames
---------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
VALUES	('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_SPY_NAME_JFD_FRANCE_NAPOLEON_0'),	
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_SPY_NAME_JFD_FRANCE_NAPOLEON_1'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_SPY_NAME_JFD_FRANCE_NAPOLEON_2'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_SPY_NAME_JFD_FRANCE_NAPOLEON_3'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_SPY_NAME_JFD_FRANCE_NAPOLEON_4'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_SPY_NAME_JFD_FRANCE_NAPOLEON_5'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_SPY_NAME_JFD_FRANCE_NAPOLEON_6'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_SPY_NAME_JFD_FRANCE_NAPOLEON_7'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_SPY_NAME_JFD_FRANCE_NAPOLEON_8'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON', 	'TXT_KEY_SPY_NAME_JFD_FRANCE_NAPOLEON_9');
--==========================================================================================================================
--==========================================================================================================================