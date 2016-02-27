--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 					Civilopedia, 								CivilopediaTag, 						ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES	('LEADER_JFD_GENSERIC', 	'TXT_KEY_LEADER_JFD_GENSERIC', 	'TXT_KEY_FOR_SCENARIO_LEADER_GENSERIC', 	'TXT_KEY_FOR_SCENARIO_LEADER_GENSERIC', 'Genseric_Scene.xml',	6, 						3, 						2, 							7, 			5, 				4, 				7, 						4, 				3, 			4, 			4, 				4, 			8, 			'JFD_THE_VANDALS_ATLAS',	1);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------					
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_GENSERIC', 	'MAJOR_CIV_APPROACH_WAR', 			8),
		('LEADER_JFD_GENSERIC', 	'MAJOR_CIV_APPROACH_HOSTILE', 		8),
		('LEADER_JFD_GENSERIC', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
		('LEADER_JFD_GENSERIC', 	'MAJOR_CIV_APPROACH_GUARDED', 		4),
		('LEADER_JFD_GENSERIC', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_JFD_GENSERIC', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_GENSERIC', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------					
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_GENSERIC', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_JFD_GENSERIC', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_GENSERIC', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
		('LEADER_JFD_GENSERIC', 	'MINOR_CIV_APPROACH_CONQUEST', 		6),
		('LEADER_JFD_GENSERIC', 	'MINOR_CIV_APPROACH_BULLY', 		8);
--------------------------------
-- Leader_Flavors
--------------------------------					
INSERT INTO Leader_Flavors 
		(LeaderType, 				FlavorType, 						Flavor)
VALUES	('LEADER_JFD_GENSERIC', 	'FLAVOR_OFFENSE', 					7),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_DEFENSE', 					3),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_CITY_DEFENSE', 				3),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_MILITARY_TRAINING', 		7),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_RECON', 					5),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_RANGED', 					3),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_MOBILE', 					4),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_NAVAL', 					8),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_NAVAL_RECON', 				6),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_NAVAL_GROWTH', 				6),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	7),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_AIR', 						3),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_EXPANSION', 				7),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_GROWTH', 					6),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_PRODUCTION', 				6),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_GOLD', 						8),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_SCIENCE', 					5),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_CULTURE', 					3),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_HAPPINESS', 				3),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_GREAT_PEOPLE', 				4),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_WONDER', 					3),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_RELIGION', 					2),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_DIPLOMACY', 				4),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_SPACESHIP', 				3),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_WATER_CONNECTION', 			4),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_AIRLIFT', 					4),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		8),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_GENSERIC', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------
-- Leader_Traits
--------------------------------
INSERT INTO Leader_Traits 
		(LeaderType, 			TraitType)
VALUES	('LEADER_JFD_GENSERIC', 'TRAIT_JFD_VANDALS');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 					Description, 					ShortDescription)
VALUES	('TRAIT_JFD_VANDALS', 	'TXT_KEY_TRAIT_JFD_VANDALS', 	'TXT_KEY_TRAIT_JFD_VANDALS_SHORT');
--------------------------------
-- Trait_FreePromotionUnitCombats
--------------------------------		
INSERT INTO Trait_FreePromotionUnitCombats 
		(TraitType, 			UnitCombatType, 				PromotionType)
VALUES	('TRAIT_JFD_VANDALS', 	'UNITCOMBAT_NAVALMELEE', 		'PROMOTION_COASTAL_RAIDER_1'),
		('TRAIT_JFD_VANDALS', 	'UNITCOMBAT_NAVALMELEE', 		'PROMOTION_COASTAL_RAIDER_2');
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 							Description, 							Help, 										Sound, 				CannotBeChosen, LostWithUpgrade, PortraitIndex, IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_ALAN_CAVALRY', 	'TXT_KEY_PROMOTION_JFD_ALAN_CAVALRY', 	'TXT_KEY_PROMOTION_JFD_ALAN_CAVALRY_HELP', 	'AS2D_IF_LEVELUP', 	1, 				1, 				 59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_ALAN_CAVALRY');
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
		(Type, 						Class, PrereqTech,	Combat,	Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 							Strategy, 									Help, 									MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, UnitArtInfo, 						UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas,					MoveRate)
SELECT	'UNIT_JFD_ALAN_CAVALRY',	Class, PrereqTech,	Combat, Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_ALAN_CAVALRY', 	'TXT_KEY_CIV5_JFD_ALAN_CAVALRY_TEXT',	'TXT_KEY_UNIT_JFD_ALAN_CAVALRY_STRATEGY',	'TXT_KEY_UNIT_HELP_JFD_ALAN_CAVALRY',	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, 'ART_DEF_UNIT_JFD_ALAN_CAVALRY',	0,					'JFD_UNIT_FLAG_ALAN_CAVALRY_ATLAS',	2, 				'JFD_THE_VANDALS_ATLAS',	MoveRate
FROM Units WHERE Type = 'UNIT_HORSEMAN';

INSERT INTO Units 	
		(Type, 						Class, PrereqTech, Combat, Cost,	 Moves, CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 											Strategy, 									Help, 									MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo,						UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex,  IconAtlas, 				 MoveRate)
SELECT	'UNIT_JFD_TRIHEMIOLIA',		Class, PrereqTech, Combat, Cost+10,  Moves, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_TRIHEMIOLIA', 	'TXT_KEY_CIVILOPEDIA_UNITS_VANDAL_TRIHEMIOLLA_TEXT', 	'TXT_KEY_UNIT_JFD_TRIHEMIOLIA_STRATEGY', 	'TXT_KEY_UNIT_HELP_JFD_TRIHEMIOLIA', 	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_JFD_TRIHEMIOLA',	0,					'JFD_UNIT_FLAG_TRIHEMIOLIA_ATLAS',	3,				'JFD_THE_VANDALS_ATLAS', MoveRate
FROM Units WHERE Type = 'UNIT_TRIREME';
------------------------------
-- UnitGameplay2DScripts
------------------------------	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_ALAN_CAVALRY', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_HORSEMAN';

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_TRIHEMIOLIA', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_TRIREME';
------------------------------
-- Unit_AITypes
------------------------------	
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_ALAN_CAVALRY', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_HORSEMAN';

INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_TRIHEMIOLIA', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_TRIREME';
------------------------------
-- Unit_ResourceQuantityRequirements
------------------------------	
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 						ResourceType)
SELECT	'UNIT_JFD_ALAN_CAVALRY', 		ResourceType
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_HORSEMAN';	
------------------------------
-- Unit_Flavors
------------------------------	
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_ALAN_CAVALRY', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_HORSEMAN';

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_TRIHEMIOLIA', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_TRIREME';
------------------------------
-- Unit_FreePromotions
------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_ALAN_CAVALRY', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_HORSEMAN';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_TRIHEMIOLIA', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_TRIREME';

INSERT INTO Unit_FreePromotions 
		(UnitType, 					PromotionType)
VALUES	('UNIT_JFD_ALAN_CAVALRY', 	'PROMOTION_JFD_ALAN_CAVALRY'),
		('UNIT_JFD_ALAN_CAVALRY', 	'PROMOTION_IGNORE_TERRAIN_COST'),
		('UNIT_JFD_TRIHEMIOLIA', 	'PROMOTION_OCEAN_IMPASSABLE'),
		('UNIT_JFD_TRIHEMIOLIA', 	'PROMOTION_TARGETING_1'),
		('UNIT_JFD_TRIHEMIOLIA', 	'PROMOTION_PRIZE_SHIPS');
------------------------------
-- Unit_ClassUpgrades
------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_JFD_ALAN_CAVALRY', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_HORSEMAN';

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_JFD_TRIHEMIOLIA', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_TRIREME';
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 								Description, 							ShortDescription, 							Adjective, 									Civilopedia, 						CivilopediaTag, 			DefaultPlayerColor, 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					AlphaIconAtlas, 				PortraitIndex,	SoundtrackTag, 	MapImage, 				DawnOfManQuote, 						DawnOfManImage)
SELECT	'CIVILIZATION_JFD_THE_VANDALS', 	'TXT_KEY_CIV_JFD_THE_VANDALS_DESC', 	'TXT_KEY_CIV_JFD_THE_VANDALS_SHORT_DESC',	'TXT_KEY_CIV_JFD_THE_VANDALS_ADJECTIVE', 	'TXT_KEY_CIV5_THE_VANDALS_TEXT_1',	'TXT_KEY_CIV5_THE_VANDALS', 'PLAYERCOLOR_JFD_THE_VANDALS',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_THE_VANDALS_ATLAS',	'JFD_THE_VANDALS_ALPHA_ATLAS', 	0, 				'Germany', 		'MapVandals512.dds', 	'TXT_KEY_CIV5_DOM_JFD_GENSERIC_TEXT',	'DOM_Genseric.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_GERMANY';
--------------------------------
-- Civilization_CityNames
--------------------------------		
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_01'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_02'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_03'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_04'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_05'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_06'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_07'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_08'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_09'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_10'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_11'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_12'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_13'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_14'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_15'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_16'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_17'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_18'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_19'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_20'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_21'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_22'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_23'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_24'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_25'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_26'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_27'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_28'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_29'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_30'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_31'),
		('CIVILIZATION_JFD_THE_VANDALS', 		'TXT_KEY_CITY_NAME_JFD_THE_VANDALS_32');
--------------------------------
-- Civilization_FreeBuildingClasses
--------------------------------		
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_JFD_THE_VANDALS', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_GERMANY';
--------------------------------
-- Civilization_FreeTechs
--------------------------------	
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_JFD_THE_VANDALS', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_GERMANY';
--------------------------------
-- Civilization_FreeUnits
--------------------------------	
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_THE_VANDALS', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_GERMANY';
--------------------------------
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_JFD_THE_VANDALS', 	'LEADER_JFD_GENSERIC');
--------------------------------
-- Civilization_UnitClassOverrides 
--------------------------------	
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_JFD_THE_VANDALS', 	'UNITCLASS_HORSEMAN', 	'UNIT_JFD_ALAN_CAVALRY'),
		('CIVILIZATION_JFD_THE_VANDALS', 	'UNITCLASS_TRIREME', 	'UNIT_JFD_TRIHEMIOLIA');
--------------------------------
-- Civilization_Religions
--------------------------------	
INSERT INTO Civilization_Religions 
		(CivilizationType, 					ReligionType)
VALUES	('CIVILIZATION_JFD_THE_VANDALS', 	'RELIGION_CHRISTIANITY');
--------------------------------
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_JFD_THE_VANDALS', 	'TXT_KEY_SPY_NAME_JFD_THE_VANDALS_0'),	
		('CIVILIZATION_JFD_THE_VANDALS', 	'TXT_KEY_SPY_NAME_JFD_THE_VANDALS_1'),
		('CIVILIZATION_JFD_THE_VANDALS', 	'TXT_KEY_SPY_NAME_JFD_THE_VANDALS_2'),
		('CIVILIZATION_JFD_THE_VANDALS', 	'TXT_KEY_SPY_NAME_JFD_THE_VANDALS_3'),
		('CIVILIZATION_JFD_THE_VANDALS', 	'TXT_KEY_SPY_NAME_JFD_THE_VANDALS_4'),
		('CIVILIZATION_JFD_THE_VANDALS', 	'TXT_KEY_SPY_NAME_JFD_THE_VANDALS_5'),
		('CIVILIZATION_JFD_THE_VANDALS', 	'TXT_KEY_SPY_NAME_JFD_THE_VANDALS_6'),
		('CIVILIZATION_JFD_THE_VANDALS', 	'TXT_KEY_SPY_NAME_JFD_THE_VANDALS_7'),
		('CIVILIZATION_JFD_THE_VANDALS', 	'TXT_KEY_SPY_NAME_JFD_THE_VANDALS_8'),
		('CIVILIZATION_JFD_THE_VANDALS', 	'TXT_KEY_SPY_NAME_JFD_THE_VANDALS_9');
--------------------------------
-- Civilization_Start_Along_Ocean
--------------------------------	
INSERT INTO Civilization_Start_Along_Ocean 
		(CivilizationType, 					StartAlongOcean)
VALUES	('CIVILIZATION_JFD_THE_VANDALS', 	1);
--==========================================================================================================================
--==========================================================================================================================