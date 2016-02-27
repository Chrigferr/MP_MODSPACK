--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 				DefaultBuilding, 					Description)
VALUES	('BUILDINGCLASS_JFD_RUSSIA_ALEXANDER_I', 	'BUILDING_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_BUILDING_JFD_RUSSIA_ALEXANDER_I');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 									BuildingClass, 							ReligiousPressureModifier,	GreatWorkCount,	Cost,	FaithCost,	PrereqTech,	 NeverCapture,	Description, 								Help)
VALUES	('BUILDING_JFD_RUSSIA_ALEXANDER_I', 	'BUILDINGCLASS_JFD_RUSSIA_ALEXANDER_I',	10,							-1, 			-1,		-1, 		null, 		 1,				'TXT_KEY_BUILDING_JFD_RUSSIA_ALEXANDER_I', 	'TXT_KEY_BUILDING_JFD_RUSSIA_ALEXANDER_I_HELP');
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 									ExperiencePercent,	ExtraWithdrawal,	CityAttack,	Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_HOLY_ALLIANCE', 		30,					0,					0,			'TXT_KEY_PROMOTION_JFD_HOLY_ALLIANCE',		'TXT_KEY_PROMOTION_JFD_HOLY_ALLIANCE_HELP',		'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_HOLY_ALLIANCE'),
		('PROMOTION_JFD_LEIB_GVARDE', 			0,					0,					0,			'TXT_KEY_PROMOTION_JFD_LEIB_GVARDE',		'TXT_KEY_PROMOTION_JFD_LEIB_GVARDE_HELP',		'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_LEIB_GVARDE'),
		('PROMOTION_JFD_LICORNE',				0,					50,					0,			'TXT_KEY_PROMOTION_JFD_LICORNE',			'TXT_KEY_PROMOTION_JFD_LICORNE_HELP',			'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_LICORNE'),
		('PROMOTION_JFD_LICORNE_CITY',			0,					0,					150,		'TXT_KEY_PROMOTION_JFD_LICORNE_CITY',		'TXT_KEY_PROMOTION_JFD_LICORNE_CITY_HELP',		'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_LICORNE_CITY'),
		('PROMOTION_JFD_LICORNE_GUN',			0,					0,					0,			'TXT_KEY_PROMOTION_JFD_LICORNE_GUN',		'TXT_KEY_PROMOTION_JFD_LICORNE_GUN_HELP',		'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_LICORNE_GUN');
------------------------------
-- UnitPromotions_UnitCombatMods
------------------------------
INSERT INTO UnitPromotions_UnitCombatMods
		(PromotionType,					UnitCombatType,		Modifier)
VALUES	('PROMOTION_JFD_LICORNE_GUN',	'UNITCOMBAT_GUN',	33);
---==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 					Class, PrereqTech, Combat, Cost,	FaithCost,		RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 					 Civilopedia, 							Strategy, 									Help, 									MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 						UnitFlagIconOffset, UnitFlagAtlas,						 PortraitIndex,  IconAtlas)
SELECT	'UNIT_JFD_LEIB_GVARDE',	Class, PrereqTech, Combat, Cost-50, FaithCost-100,	RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_LEIB_GVARDE', 'TXT_KEY_CIV5_JFD_LEIB_GVARDE_TEXT', 	'TXT_KEY_UNIT_JFD_LEIB_GVARDE_STRATEGY', 	'TXT_KEY_UNIT_JFD_LEIB_GVARDE_HELP',	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_JFD_LEIB_GVARDE',	0,					'JFD_LEIB_GVARDE_FLAG_ART_ATLAS',	 2, 			 'JFD_RUSSIA_ALEXANDER_I_ATLAS'
FROM Units WHERE Type = 'UNIT_RIFLEMAN';

INSERT INTO Units 	
		(Type, 					Class, PrereqTech, Combat, Range, RangedCombat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 						Strategy, 								Help, 								MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, MoveRate,	UnitArtInfo, 				UnitFlagIconOffset, UnitFlagAtlas,					 PortraitIndex,  IconAtlas)
SELECT	'UNIT_JFD_LICORNE',		Class, PrereqTech, Combat, Range, RangedCombat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_LICORNE',	'TXT_KEY_CIV5_JFD_LICORNE_TEXT', 	'TXT_KEY_UNIT_JFD_LICORNE_STRATEGY', 	'TXT_KEY_UNIT_JFD_LICORNE_HELP',	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, MoveRate,	'ART_DEF_UNIT_JFD_LICORNE',	0,					'JFD_LICORNE_FLAG_ART_ATLAS',	 3, 			 'JFD_RUSSIA_ALEXANDER_I_ATLAS'
FROM Units WHERE Type = 'UNIT_CANNON';
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_LEIB_GVARDE',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_RIFLEMAN';	

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_LICORNE',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CANNON';	
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_LEIB_GVARDE',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_RIFLEMAN';

INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_LICORNE',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_CANNON';
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_LEIB_GVARDE',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_RIFLEMAN';	

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_LICORNE',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_CANNON';	
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_LEIB_GVARDE',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_RIFLEMAN';

INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_LICORNE',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_CANNON';
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_JFD_LEIB_GVARDE',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_RIFLEMAN';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_JFD_LICORNE',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CANNON';

DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_JFD_LICORNE' AND PromotionType = 'PROMOTION_CITY_SIEGE';
INSERT INTO Unit_FreePromotions
		(UnitType, 					PromotionType)
VALUES	('UNIT_JFD_LEIB_GVARDE',	'PROMOTION_JFD_LEIB_GVARDE'),
		('UNIT_JFD_LICORNE',		'PROMOTION_JFD_LICORNE'),
		('UNIT_JFD_LICORNE',		'PROMOTION_JFD_LICORNE_CITY'),
		('UNIT_JFD_LICORNE',		'PROMOTION_JFD_LICORNE_GUN');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES	('LEADER_JFD_ALEXANDER_I', 	'TXT_KEY_LEADER_JFD_ALEXANDER_I',	'TXT_KEY_LEADER_JFD_ALEXANDER_I_PEDIA', 'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_ALEXANDER_I', 	'AlexanderI_Scene.xml',	7, 						3, 						6, 							6, 			7, 				8, 				8, 						9, 				9, 			7, 			7, 				6, 			5, 			'JFD_RUSSIA_ALEXANDER_I_ATLAS', 	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_ALEXANDER_I', 	'MAJOR_CIV_APPROACH_WAR', 			6),
		('LEADER_JFD_ALEXANDER_I', 	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
		('LEADER_JFD_ALEXANDER_I', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	8),
		('LEADER_JFD_ALEXANDER_I', 	'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_JFD_ALEXANDER_I', 	'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_JFD_ALEXANDER_I', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_JFD_ALEXANDER_I', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_ALEXANDER_I', 	'MINOR_CIV_APPROACH_IGNORE', 		3),
		('LEADER_JFD_ALEXANDER_I', 	'MINOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_JFD_ALEXANDER_I', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
		('LEADER_JFD_ALEXANDER_I', 	'MINOR_CIV_APPROACH_CONQUEST', 		5),
		('LEADER_JFD_ALEXANDER_I', 	'MINOR_CIV_APPROACH_BULLY', 		2);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 				FlavorType, 						Flavor)
VALUES	('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_OFFENSE', 					7),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_DEFENSE', 					4),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_CITY_DEFENSE', 				3),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_MILITARY_TRAINING', 		7),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_RECON', 					6),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_RANGED', 					5),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_MOBILE', 					6),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_NAVAL', 					3),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_NAVAL_RECON', 				2),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	2),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_AIR', 						2),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_EXPANSION', 				7),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_GROWTH', 					3),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_TILE_IMPROVEMENT', 			8),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_INFRASTRUCTURE', 			3),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_PRODUCTION', 				4),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_GOLD', 						6),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_SCIENCE', 					3),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_CULTURE', 					5),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_HAPPINESS', 				5),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_GREAT_PEOPLE', 				6),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_WONDER', 					3),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_RELIGION', 					6),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_DIPLOMACY', 				2),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_WATER_CONNECTION', 			4),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_NUKE', 						3),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_ESPIONAGE', 				4),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_AIRLIFT', 					2),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_ALEXANDER_I', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 				TraitType)
VALUES	('LEADER_JFD_ALEXANDER_I', 	'TRAIT_JFD_RUSSIA_ALEXANDER_I');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 								Description, 							 ShortDescription)
VALUES	('TRAIT_JFD_RUSSIA_ALEXANDER_I', 	'TXT_KEY_TRAIT_JFD_RUSSIA_ALEXANDER_I',  'TXT_KEY_TRAIT_JFD_RUSSIA_ALEXANDER_I_SHORT');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 									DerivativeCiv,			Description, ShortDescription,	Adjective,										Civilopedia, CivilopediaTag, DefaultPlayerColor,					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,						PortraitIndex,	AlphaIconAtlas,							SoundtrackTag,  MapImage, 						DawnOfManQuote, 							  DawnOfManImage)
SELECT	'CIVILIZATION_JFD_RUSSIA_ALEXANDER_I',	'CIVILIZATION_RUSSIA',	Description, ShortDescription,	'TXT_KEY_CIV_JFD_RUSSIA_ALEXANDER_I_ADJECTIVE',	Civilopedia, CivilopediaTag, 'PLAYERCOLOR_JFD_RUSSIA_ALEXANDER_I',  ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_RUSSIA_ALEXANDER_I_ATLAS',	0,				'JFD_RUSSIA_ALEXANDER_I_ALPHA_ATLAS',	'Russia', 		'MapRussiaAlexanderI512.dds',	'TXT_KEY_CIV5_DAWN_RUSSIA_ALEXANDER_I_TEXT',  'DOM_RussiaAlexanderI.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_RUSSIA';
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_1'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_2'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_3'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_4'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_5'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_6'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_7'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_8'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_9'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_10'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_11'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_12'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_13'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_14'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_15'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_16'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_17'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_18'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_19'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_20'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_21'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_22'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_23'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_24'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_25'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_26'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_27'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_28'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_29'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_30'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_31'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_32'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_33'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_34'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_35'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_36'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_37'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'TXT_KEY_CITY_NAME_JFD_RUSSIA_ALEXANDER_I_38');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I',	'LEADER_JFD_ALEXANDER_I');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'UNITCLASS_RIFLEMAN',	'UNIT_JFD_LEIB_GVARDE'),
		('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'UNITCLASS_CANNON',		'UNIT_JFD_LICORNE');
--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 'RELIGION_ORTHODOXY');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
SELECT	'CIVILIZATION_JFD_RUSSIA_ALEXANDER_I', 	SpyName
FROM Civilization_SpyNames WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--==========================================================================================================================
--==========================================================================================================================