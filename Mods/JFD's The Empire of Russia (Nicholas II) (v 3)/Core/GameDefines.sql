--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
			(Type, 						 		 		DefaultBuilding, 							Description)
VALUES		('BUILDINGCLASS_JFD_NICHOLAS_RUSSIA', 		'BUILDING_JFD_WE_LOVE_THE_KING_DAY_FAITH', 	'TXT_KEY_BUILDING_JFD_NICHOLAS_RUSSIA');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type, 						BuildingClass, Cost, GoldMaintenance, PrereqTech, Description, 							Civilopedia, 							Help, 										Strategy,								 	 ArtDefineTag, 	MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_GUBERNIYA'),	BuildingClass, Cost, GoldMaintenance, PrereqTech, ('TXT_KEY_BUILDING_JFD_GUBERNIYA'), 	('TXT_KEY_CIV5_JFD_GUBERNIYA_TEXT'), 	('TXT_KEY_BUILDING_JFD_GUBERNIYA_HELP'), 	('TXT_KEY_BUILDING_JFD_GUBERNIYA_STRATEGY'), ArtDefineTag,	MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, 2, 				('JFD_RUSSIA_NICHOLAS_ATLAS')
FROM Buildings WHERE (Type = 'BUILDING_CONSTABLE');	

INSERT INTO Buildings 	
			(Type, 						 					BuildingClass, 							WonderProductionModifier,	GreatWorkCount, Cost, FaithCost, Description, 											Help)
VALUES		('BUILDING_JFD_GUBERNIYA_PRODUCTION', 			'BUILDINGCLASS_JFD_NICHOLAS_RUSSIA', 	0,							-1, 			-1,   -1, 		 'TXT_KEY_BUILDING_JFD_GUBERNIYA_PRODUCTION', 			'TXT_KEY_BUILDING_JFD_GUBERNIYA_PRODUCTION_HELP'),
			('BUILDING_JFD_GUBERNIYA_GROWTH', 				'BUILDINGCLASS_JFD_NICHOLAS_RUSSIA', 	0,							-1, 			-1,   -1, 		 'TXT_KEY_BUILDING_JFD_GUBERNIYA_GROWTH', 				'TXT_KEY_BUILDING_JFD_GUBERNIYA_GROWTH_HELP'),
			('BUILDING_JFD_WONDER_PRODUCTION', 				'BUILDINGCLASS_JFD_NICHOLAS_RUSSIA', 	1,							-1, 			-1,   -1, 		 'TXT_KEY_BUILDING_JFD_WONDER_PRODUCTION', 				'TXT_KEY_BUILDING_JFD_WONDER_PRODUCTION_HELP'),
			('BUILDING_JFD_WE_LOVE_THE_KING_DAY_FAITH', 	'BUILDINGCLASS_JFD_NICHOLAS_RUSSIA', 	0,							-1, 			-1,   -1, 		 'TXT_KEY_BUILDING_JFD_WE_LOVE_THE_KING_DAY_FAITH', 	'TXT_KEY_BUILDING_JFD_WE_LOVE_THE_KING_DAY_FAITH_HELP');
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 									YieldType, 				Yield)
VALUES		('BUILDING_JFD_WE_LOVE_THE_KING_DAY_FAITH', 	'YIELD_FAITH', 			1);
------------------------------	
-- Building_YieldModifiers
------------------------------	
INSERT INTO Building_YieldModifiers 	
			(BuildingType, 									YieldType, 				Yield)
VALUES		('BUILDING_JFD_GUBERNIYA_GROWTH', 				'YIELD_FOOD', 			10),
			('BUILDING_JFD_GUBERNIYA_PRODUCTION', 			'YIELD_PRODUCTION', 	5);		
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 					FlavorType,				Flavor)
SELECT		('BUILDING_JFD_GUBERNIYA'),		FlavorType,				Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_CONSTABLE');	

INSERT INTO Building_Flavors 	
			(BuildingType, 					FlavorType,				Flavor)
VALUES		('BUILDING_JFD_GUBERNIYA',		'FLAVOR_PRODUCTION',	20),
			('BUILDING_JFD_GUBERNIYA',		'FLAVOR_GROWTH',		30);
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
			(Type, 							Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES		('LEADER_JFD_NICHOLAS', 		'TXT_KEY_LEADER_JFD_NICHOLAS', 		'TXT_KEY_LEADER_JFD_NICHOLAS_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_NICHOLAS', 	'Nicholas_Scene.xml',	4, 						8, 						4, 							3, 			5, 				8, 				3, 						6, 				8, 			8, 			8, 				6, 			2, 			'JFD_RUSSIA_NICHOLAS_ATLAS', 	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_NICHOLAS', 		'MAJOR_CIV_APPROACH_WAR', 			4),
			('LEADER_JFD_NICHOLAS', 		'MAJOR_CIV_APPROACH_HOSTILE', 		2),
			('LEADER_JFD_NICHOLAS', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	2),
			('LEADER_JFD_NICHOLAS', 		'MAJOR_CIV_APPROACH_GUARDED', 		5),
			('LEADER_JFD_NICHOLAS', 		'MAJOR_CIV_APPROACH_AFRAID', 		6),
			('LEADER_JFD_NICHOLAS', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_JFD_NICHOLAS', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 					MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_NICHOLAS', 		'MINOR_CIV_APPROACH_IGNORE', 		5),
			('LEADER_JFD_NICHOLAS', 		'MINOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_JFD_NICHOLAS', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
			('LEADER_JFD_NICHOLAS', 		'MINOR_CIV_APPROACH_CONQUEST', 		3),
			('LEADER_JFD_NICHOLAS', 		'MINOR_CIV_APPROACH_BULLY', 		3);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
			(LeaderType, 					FlavorType, 						Flavor)
VALUES		('LEADER_JFD_NICHOLAS', 		'FLAVOR_OFFENSE', 					2),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_DEFENSE', 					6),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_CITY_DEFENSE', 				5),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_MILITARY_TRAINING', 		5),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_RECON', 					4),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_RANGED', 					4),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_MOBILE', 					5),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_NAVAL', 					2),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_NAVAL_RECON', 				2),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_NAVAL_GROWTH', 				2),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	2),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_AIR', 						4),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_EXPANSION', 				9),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_GROWTH', 					8),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_TILE_IMPROVEMENT', 			6),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_PRODUCTION', 				8),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_GOLD', 						7),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_SCIENCE', 					2),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_CULTURE', 					5),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_HAPPINESS', 				3),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_GREAT_PEOPLE', 				4),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_WONDER', 					9),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_RELIGION', 					8),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_DIPLOMACY', 				3),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_SPACESHIP', 				2),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_WATER_CONNECTION', 			2),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_NUKE', 						2),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_ESPIONAGE', 				3),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_NICHOLAS', 		'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
			(LeaderType, 					TraitType)
VALUES		('LEADER_JFD_NICHOLAS', 		'TRAIT_JFD_NICHOLAS_RUSSIA');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
			(Type, 							Description, 								ShortDescription)
VALUES		('TRAIT_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_TRAIT_JFD_NICHOLAS_RUSSIA', 		'TXT_KEY_TRAIT_JFD_NICHOLAS_RUSSIA_SHORT');	
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
			(Type, 									Description, 								Help, 												Sound, 				CannotBeChosen, FriendlyLandsModifier, 	PortraitIndex,  IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_FRIENDLY_LANDS', 		'TXT_KEY_PROMOTION_JFD_FRIENDLY_LANDS',		'TXT_KEY_PROMOTION_JFD_FRIENDLY_LANDS_HELP', 		'AS2D_IF_LEVELUP', 	1, 				15, 				 	59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_FRIENDLY_LANDS');
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
			(Type, 						PrereqTech, Class, Combat, 		Cost, Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain, 	DefaultUnitAI, 	Description, 						Civilopedia, 							Help, 									Strategy,									ObsoleteTech, 	GoodyHutUpgradeUnitClass, 	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, UnitArtInfo,						UnitFlagIconOffset,	UnitFlagAtlas,							MoveRate,	PortraitIndex, 	IconAtlas)
SELECT		('UNIT_JFD_OPOLCHENIYE'),	PrereqTech, Class, Combat-10,  	Cost, Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain,	DefaultUnitAI, ('TXT_KEY_UNIT_JFD_OPOLCHENIYE'), 	('TXT_KEY_CIV5_JFD_OPOLCHENIYE_TEXT'), 	('TXT_KEY_UNIT_JFD_OPOLCHENIYE_HELP'), 	('TXT_KEY_UNIT_JFD_OPOLCHENIYE_STRATEGY'), 	ObsoleteTech,	GoodyHutUpgradeUnitClass,	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, ('ART_DEF_UNIT_JFD_OPOLCHENIYE'),  0,					('JFD_UNIT_FLAG_OPOLCHENIYE_ATLAS'),	MoveRate,	3, 				('JFD_RUSSIA_NICHOLAS_ATLAS')
FROM Units WHERE (Type = 'UNIT_GREAT_WAR_INFANTRY');	
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_OPOLCHENIYE'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');
--------------------------------		
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_JFD_OPOLCHENIYE'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 					UnitClassType)
SELECT		('UNIT_JFD_OPOLCHENIYE'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_OPOLCHENIYE'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');
--------------------------------	
-- Unit_FreePromotions
--------------------------------	
INSERT INTO Unit_FreePromotions
			(UnitType, 					PromotionType)
VALUES		('UNIT_JFD_OPOLCHENIYE', 	'PROMOTION_CITY_PENALTY');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
			(Type, 									Description, ShortDescription, 	Adjective, 	Civilopedia, CivilopediaTag, DefaultPlayerColor,					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 						PortraitIndex, 	AlphaIconAtlas, 						SoundtrackTag, 	MapImage, 						DawnOfManQuote, 							DawnOfManImage)
SELECT		('CIVILIZATION_JFD_NICHOLAS_RUSSIA'), 	Description, ShortDescription, 	Adjective, 	Civilopedia, CivilopediaTag, ('PLAYERCOLOR_JFD_NICHOLAS_RUSSIA'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_RUSSIA_NICHOLAS_ATLAS'), 	0, 				('JFD_RUSSIA_NICHOLAS_ALPHA_ATLAS'), 	('Russia'), 	('NicholasRussiaMap512.dds'),	('TXT_KEY_CIV5_DAWN_NICHOLAS_RUSSIA_TEXT'), ('Nicholas_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_RUSSIA');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames 
			(CivilizationType, 						CityName)
VALUES		('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_ST_PETERSBURG'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_TSARSKOYE_SELO'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_MOSCOW'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_KIEV'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_NOVGOROD'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_VLADIMIR'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_ROSTOV'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_SMOLENSK'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_YAROSLAVL'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_ODESSA'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_WARSAW'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_HELSINGFORS'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_MINSK'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_YEKATERINBURG'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_KAZAN'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_SARATOV'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_NIZHNIY_NOVGOROD'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_TIFLIS'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_RIGA'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_KHARKOV'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_SEVASTOPOL'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_TSARITSYN'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_NOVOROSSIYSK'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_YEKATERINOSLAV'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_ARKHANGELSK'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_VLADIVOSTOK'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_PETROPAVLOVSK'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_IRKUTSK'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_OMSK'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_TASHKENT'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_KHABAROVSK'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_ASTRAKHAN'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_SAMARKAND'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_YEKATERINODAR'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_NIKOLAEV'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_ALEKSANDROVSK'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_TULA'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_ORENBURG'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_SAMARA'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_VORONEZH'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_YAKUTSK'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_KYAKHTA'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_BELOTSARSK'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_TSARGRAD');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 						BuildingClassType)
SELECT		('CIVILIZATION_JFD_NICHOLAS_RUSSIA'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 						TechType)
SELECT		('CIVILIZATION_JFD_NICHOLAS_RUSSIA'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_NICHOLAS_RUSSIA'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 						LeaderheadType)
VALUES		('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'LEADER_JFD_NICHOLAS');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 						UnitClassType, 					UnitType)
VALUES		('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'UNITCLASS_GREAT_WAR_INFANTRY', 'UNIT_JFD_OPOLCHENIYE');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 						BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'BUILDINGCLASS_CONSTABLE', 	'BUILDING_JFD_GUBERNIYA');
--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions 
			(CivilizationType, 						ReligionType)
SELECT		('CIVILIZATION_JFD_NICHOLAS_RUSSIA'), 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 						SpyName)
SELECT		('CIVILIZATION_JFD_NICHOLAS_RUSSIA'), 	SpyName
FROM Civilization_SpyNames WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--==========================================================================================================================
--==========================================================================================================================