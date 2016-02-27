--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 
		(DefaultBuilding, 		Type, 						Description)
VALUES	('BUILDING_JFD_MILAN', 	'BUILDINGCLASS_JFD_MILAN', 	'TXT_KEY_BUILDING_JFD_MILAN');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 
		(Type, 						BuildingClass, 				GreatWorkCount, Cost, 	FaithCost,	GoldMaintenance,	PrereqTech, NeverCapture,	Description, 					Help)
VALUES	('BUILDING_JFD_MILAN', 		'BUILDINGCLASS_JFD_MILAN',	-1,				-1, 	-1,			0,					null, 		1,				'TXT_KEY_BUILDING_JFD_MILAN',	'TXT_KEY_BUILDING_JFD_MILAN_HELP');

INSERT INTO Buildings 	
		(Type, 						Defense,	CapturePlunderModifier, BuildingClass, Cost, SpecialistType, SpecialistCount, TradeRouteRecipientBonus, TradeRouteTargetBonus, GoldMaintenance, PrereqTech,	Description, 					Civilopedia, 					  Help, 								Strategy,								 ArtDefineTag, 	MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT	'BUILDING_JFD_PALAZZO',		400,		100,					BuildingClass, Cost, SpecialistType, SpecialistCount, TradeRouteRecipientBonus, TradeRouteTargetBonus, GoldMaintenance, PrereqTech,	'TXT_KEY_BUILDING_JFD_PALAZZO',	'TXT_KEY_CIV5_JFD_PALAZZO_TEXT',  'TXT_KEY_BUILDING_JFD_PALAZZO_HELP', 	'TXT_KEY_BUILDING_JFD_PALAZZO_STRATEGY', ArtDefineTag,	MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, 2, 				'JFD_MILAN_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_BANK';	
------------------------------	
-- Building_Flavors
------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,				Flavor)
SELECT	'BUILDING_JFD_PALAZZO',		FlavorType,				Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_BANK';	

INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,				Flavor)
VALUES	('BUILDING_JFD_PALAZZO',	'FLAVOR_GREAT_PEOPLE',	20),
		('BUILDING_JFD_PALAZZO',	'FLAVOR_CITY_DEFENSE',	10);
------------------------------	
-- Building_HurryModifiers
------------------------------	
INSERT INTO Building_HurryModifiers 	
		(BuildingType, 				HurryType,		HurryCostModifier)
VALUES	('BUILDING_JFD_MILAN',		'HURRY_GOLD',	-5);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------	
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
SELECT	'BUILDING_JFD_PALAZZO',		BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_BANK';	
------------------------------	
-- Building_ResourceYieldChanges
------------------------------	
INSERT INTO Building_ResourceYieldChanges 	
		(BuildingType, 				ResourceType, YieldType, Yield)
SELECT	'BUILDING_JFD_PALAZZO',		ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_BANK';	
------------------------------	
-- Building_YieldChangesPerPop
------------------------------	
INSERT INTO Building_YieldChangesPerPop 	
		(BuildingType, 				YieldType, Yield)
SELECT	'BUILDING_JFD_PALAZZO',		YieldType, Yield
FROM Building_YieldChangesPerPop WHERE BuildingType = 'BUILDING_BANK';	
------------------------------	
-- Building_YieldModifiers
------------------------------	
INSERT INTO Building_YieldModifiers 	
		(BuildingType, 				YieldType, Yield)
SELECT	'BUILDING_JFD_PALAZZO',		YieldType, Yield
FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_BANK';	
------------------------------	
-- Building_YieldChanges
------------------------------	
INSERT INTO Building_YieldChanges 	
		(BuildingType, 				YieldType, Yield)
SELECT	'BUILDING_JFD_PALAZZO',		YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_BANK';	
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 			PortraitIndex)
VALUES	('LEADER_JFD_VISCONTI', 	'TXT_KEY_LEADER_JFD_VISCONTI', 		'TXT_KEY_LEADER_JFD_VISCONTI_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_VISCONTI', 	'Visconti_Scene.xml',	6, 						4, 						8, 							8, 			6, 				6, 				6, 						4, 				3, 			7, 			3, 				4, 			6, 			'JFD_MILAN_ATLAS', 	1);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_VISCONTI', 	'MAJOR_CIV_APPROACH_WAR', 			6),
		('LEADER_JFD_VISCONTI', 	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
		('LEADER_JFD_VISCONTI', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
		('LEADER_JFD_VISCONTI', 	'MAJOR_CIV_APPROACH_GUARDED', 		5),
		('LEADER_JFD_VISCONTI', 	'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_JFD_VISCONTI', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		3),
		('LEADER_JFD_VISCONTI', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		3);
--------------------------------	
-- Leader_MinorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_VISCONTI', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
		('LEADER_JFD_VISCONTI', 	'MINOR_CIV_APPROACH_FRIENDLY', 		8),
		('LEADER_JFD_VISCONTI', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	8),
		('LEADER_JFD_VISCONTI', 	'MINOR_CIV_APPROACH_CONQUEST', 		4),
		('LEADER_JFD_VISCONTI', 	'MINOR_CIV_APPROACH_BULLY', 		2);
--------------------------------	
-- Leader_Flavors
--------------------------------						
INSERT INTO Leader_Flavors 
		(LeaderType, 				FlavorType, 						Flavor)
VALUES	('LEADER_JFD_VISCONTI', 	'FLAVOR_OFFENSE', 					3),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_DEFENSE', 					6),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_CITY_DEFENSE', 				7),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_MILITARY_TRAINING', 		6),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_RECON', 					4),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_RANGED', 					6),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_MOBILE', 					3),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_NAVAL', 					3),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_NAVAL_RECON', 				2),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_NAVAL_GROWTH', 				2),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	2),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_AIR', 						2),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_EXPANSION', 				4),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_GROWTH', 					4),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_INFRASTRUCTURE', 			3),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_PRODUCTION', 				4),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_GOLD', 						9),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_SCIENCE', 					5),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_CULTURE', 					6),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_HAPPINESS', 				5),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_GREAT_PEOPLE', 				8),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_WONDER', 					5),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_RELIGION', 					3),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_DIPLOMACY', 				9),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_WATER_CONNECTION', 			4),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_ESPIONAGE', 				3),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_AIRLIFT', 					2),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_VISCONTI', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 				TraitType)
VALUES	('LEADER_JFD_VISCONTI', 	'TRAIT_JFD_MILAN');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 						Description, 					ShortDescription)
VALUES	('TRAIT_JFD_MILAN', 		'TXT_KEY_TRAIT_JFD_MILAN', 		'TXT_KEY_TRAIT_JFD_MILAN_SHORT');	
--==========================================================================================================================	
-- POLICIES
--==========================================================================================================================	
-- Policies
--------------------------------	
INSERT INTO Policies 
		(Type, 						Description, 					MinorFriendshipDecayMod)
VALUES	('POLICY_JFD_MILAN_PEACE', 	'TXT_KEY_TRAIT_JFD_MILAN', 		0),
		('POLICY_JFD_MILAN_WAR', 	'TXT_KEY_TRAIT_JFD_MILAN', 		-20);	
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 						Description, 						Help, 									Sound, 				CannotBeChosen, PortraitIndex,  IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_RIBAULT',	'TXT_KEY_PROMOTION_JFD_RIBAULT',	'TXT_KEY_PROMOTION_JFD_RIBAULT_HELP',	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_RIBAULT');
------------------------------
-- UnitPromotions_UnitCombatMods
------------------------------	
INSERT INTO UnitPromotions_UnitCombatMods
		(PromotionType,				UnitCombatType,		Modifier)
VALUES	('PROMOTION_JFD_RIBAULT',	'UNITCOMBAT_SIEGE',	33);
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
		(Type, 					Class,	PrereqTech,			Range, RangedCombat,	Combat,		FaithCost,		RequiresFaithPurchaseEnabled, Cost,		Moves, 	CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 						Strategy, 								Help, 								MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 				UnitFlagAtlas, 					UnitFlagIconOffset, PortraitIndex,	IconAtlas)
SELECT	'UNIT_JFD_RIBAULT', 	Class,	'TECH_ECONOMICS',	Range, RangedCombat-10, Combat-10,	FaithCost+40,	RequiresFaithPurchaseEnabled, Cost+20,	Moves, 	CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_RIBAULT', 	'TXT_KEY_CIV5_JFD_RIBAULT_TEXT',	'TXT_KEY_UNIT_JFD_RIBAULT_STRATEGY',	'TXT_KEY_UNIT_JFD_RIBAULT_HELP',	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_JFD_RIBAULT', 	'JFD_UNIT_FLAG_RIBAULT_ATLAS',	0,					3, 				'JFD_MILAN_ATLAS'
FROM Units WHERE Type = 'UNIT_GATLINGGUN';
--------------------------------
-- UnitGameplay2DScripts
--------------------------------	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_RIBAULT', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GATLINGGUN';	
--------------------------------
-- Unit_AITypes
--------------------------------	
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_RIBAULT', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GATLINGGUN';
--------------------------------
-- Unit_Flavors
--------------------------------	
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_RIBAULT', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GATLINGGUN';
--------------------------------
-- Unit_FreePromotions
--------------------------------	
INSERT INTO Unit_FreePromotions 
		(UnitType, 				PromotionType)
VALUES	('UNIT_JFD_RIBAULT', 	'PROMOTION_SECOND_ATTACK'),
		('UNIT_JFD_RIBAULT', 	'PROMOTION_JFD_RIBAULT');
--------------------------------
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_RIBAULT',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_GATLINGGUN';
--==========================================================================================================================	
-- MINOR CIVILIZATIONS
--==========================================================================================================================		
-- MinorCivilizations
--------------------------------	
UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_JFD_SAN_MARINO_DESC', ShortDescription = 'TXT_KEY_CITYSTATE_JFD_SAN_MARINO_SHORT_DESC', Adjective = 'TXT_KEY_CITYSTATE_JFD_SAN_MARINO_ADJECTIVE', Civilopedia = 'TXT_KEY_CIV5_JFD_SAN_MARINO_TEXT_1'
WHERE Type = 'MINOR_CIV_MILAN';
--------------------------------	
-- MinorCivilization_CityNames
--------------------------------		
UPDATE MinorCivilization_CityNames
SET CityName = 'TXT_KEY_CITYSTATE_JFD_SAN_MARINO_DESC'
WHERE MinorCivType = 'MINOR_CIV_MILAN';
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 		
		(Type, 						DerivativeCiv,						Description,					ShortDescription, 					Adjective, 							Civilopedia,						CivilopediaTag,				DefaultPlayerColor,			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 			PortraitIndex, 	AlphaIconAtlas, 			SoundtrackTag, 	MapImage, 			DawnOfManQuote, 				DawnOfManImage)
SELECT	'CIVILIZATION_JFD_MILAN', 	'TXT_KEY_JFD_TAL_ITALIAN_STATES',	'TXT_KEY_CIV_JFD_MILAN_DESC', 	'TXT_KEY_CIV_JFD_MILAN_SHORT_DESC',	'TXT_KEY_CIV_JFD_MILAN_ADJECTIVE',	'TXT_KEY_CIV5_JFD_MILAN_TEXT_1', 	'TXT_KEY_CIV5_JFD_MILAN', 	'PLAYERCOLOR_JFD_MILAN',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_MILAN_ATLAS', 	0, 				'JFD_MILAN_ALPHA_ATLAS', 	'Rome', 		'MapMilan512.dds',	'TXT_KEY_CIV5_DAWN_MILAN_TEXT',	'DOM_Visconti.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_VENICE';

UPDATE Civilizations
SET DerivativeCiv = 'TXT_KEY_JFD_TAL_ITALIAN_STATES'
WHERE Type = 'CIVILIZATION_VENICE';
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 			CityName)
VALUES	('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_01'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_02'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_03'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_04'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_05'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_06'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_07'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_08'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_09'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_10'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_11'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_12'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_13'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_14'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_15'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_16'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_17'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_18'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_19'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_20'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_21'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_22');			
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 			BuildingClassType)
SELECT	'CIVILIZATION_JFD_MILAN', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_VENICE';
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 			TechType)
SELECT	'CIVILIZATION_JFD_MILAN',	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_VENICE';
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 			UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_MILAN', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_VENICE';
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 			LeaderheadType)
VALUES	('CIVILIZATION_JFD_MILAN', 	'LEADER_JFD_VISCONTI');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 			BuildingClassType, 		BuildingType)
VALUES	('CIVILIZATION_JFD_MILAN', 	'BUILDINGCLASS_BANK',	'BUILDING_JFD_PALAZZO');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 			UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_JFD_MILAN', 	'UNITCLASS_GATLINGGUN',	'UNIT_JFD_RIBAULT');
--------------------------------	
-- Civilization_Religions
--------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 			ReligionType)
VALUES	('CIVILIZATION_JFD_MILAN', 	'RELIGION_CHRISTIANITY');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 			SpyName)
VALUES	('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_SPY_NAME_JFD_MILAN_0'),	
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_SPY_NAME_JFD_MILAN_1'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_SPY_NAME_JFD_MILAN_2'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_SPY_NAME_JFD_MILAN_3'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_SPY_NAME_JFD_MILAN_4'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_SPY_NAME_JFD_MILAN_5'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_SPY_NAME_JFD_MILAN_6'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_SPY_NAME_JFD_MILAN_7'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_SPY_NAME_JFD_MILAN_8'),
		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_SPY_NAME_JFD_MILAN_9');
--==========================================================================================================================
--==========================================================================================================================