--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses
		(Type, 								DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_JFD_RUSSIA_PETER', 	'BUILDING_JFD_KREPOST_TILES', 	'TXT_KEY_BUILDING_JFD_KREPOST_TILES_DESC');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings		
		(Type, 							BuildingClass, 			  			Cost, 	FaithCost,	GreatWorkCount,	PlotCultureCostModifier, Description, 							Help,										NeverCapture)
VALUES	('BUILDING_JFD_KREPOST_TILES', 	'BUILDINGCLASS_JFD_RUSSIA_PETER', 	-1, 	-1,			-1,				-1,						 'TXT_KEY_BUILDING_JFD_KREPOST_TILES', 	'TXT_KEY_BUILDING_JFD_KREPOST_TILES_HELP',	1);

UPDATE Buildings
SET Cost = 360, BuildingClass = 'BUILDINGCLASS_ARSENAL', PrereqTech = 'TECH_METALLURGY', PlotBuyCostModifier = 0, PlotCultureCostModifier = 0, ExtraCityHitPoints = 25, Defense = 900, BorderObstacleCity = 1, Help = 'TXT_KEY_BUILDING_JFD_KREPOST_HELP', Strategy = 'TXT_KEY_BUILDINGS_JFD_KREPOST_STRATEGY'
WHERE Type = 'BUILDING_KREPOST';
--------------------------------	
-- Building_DomainFreeExperiences
--------------------------------	
DELETE FROM Building_DomainFreeExperiences WHERE BuildingType = 'BUILDING_KREPOST';
--------------------------------	
-- Building_ClassesNeededInCity
--------------------------------	
DELETE FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_KREPOST';
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 							Description, 							Help, 										Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_TWO_DECKER', 	'TXT_KEY_PROMOTION_JFD_TWO_DECKER',		'TXT_KEY_PROMOTION_JFD_TWO_DECKER_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_TWO_DECKER');
--------------------------------	
-- UnitPromotions_Domains
--------------------------------	
INSERT INTO UnitPromotions_Domains
		(PromotionType, 				DomainType, 			Modifier)
VALUES	('PROMOTION_JFD_TWO_DECKER', 	'DOMAIN_LAND',			25);
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
		(Type, 					Class,	PrereqTech, RangedCombat, Range, Special, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 						Strategy, 								Help, 								Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas,					MoveRate)
SELECT	'UNIT_JFD_TWO_DECKER',	Class,	PrereqTech, RangedCombat, Range, Special, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_TWO_DECKER', 	'TXT_KEY_CIV5_JFD_TWO_DECKER_TEXT', 'TXT_KEY_UNIT_JFD_TWO_DECKER_STRATEGY', 'TXT_KEY_UNIT_HELP_JFD_TWO_DECKER', Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_JFD_TWO_DECKER', 	0,					'JFD_UNIT_FLAG_TWO_DECKER_ATLAS',	2, 				'JFD_RUSSIA_PETER_ATLAS',	MoveRate
FROM Units WHERE Type = 'UNIT_FRIGATE';
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_TWO_DECKER', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_FRIGATE';
--------------------------------		
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_TWO_DECKER', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_FRIGATE';
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_TWO_DECKER',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_FRIGATE';	
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_TWO_DECKER', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_FRIGATE';
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------	
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 				ResourceType, Cost)
SELECT	'UNIT_JFD_TWO_DECKER', 	ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_FRIGATE';
--------------------------------	
-- Unit_FreePromotions
--------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_JFD_TWO_DECKER', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_FRIGATE';	

INSERT INTO Unit_FreePromotions
		(UnitType, 				PromotionType)
VALUES	('UNIT_JFD_TWO_DECKER', 'PROMOTION_JFD_TWO_DECKER');	
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 					Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES	('LEADER_JFD_PETER', 	'TXT_KEY_LEADER_JFD_PETER', 	'TXT_KEY_LEADER_JFD_PETER_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_PETER', 	'Peter_Scene.xml',	6, 						3, 						4, 							5, 			5, 				6, 				4, 						8, 				5, 			4, 			6, 				8, 			3, 			'JFD_RUSSIA_PETER_ATLAS', 1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_PETER', 	'MAJOR_CIV_APPROACH_WAR', 			6),
		('LEADER_JFD_PETER', 	'MAJOR_CIV_APPROACH_HOSTILE', 		2),
		('LEADER_JFD_PETER', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	2),
		('LEADER_JFD_PETER', 	'MAJOR_CIV_APPROACH_GUARDED', 		2),
		('LEADER_JFD_PETER', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_JFD_PETER', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
		('LEADER_JFD_PETER', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_PETER', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_JFD_PETER', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_PETER', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	3),
		('LEADER_JFD_PETER', 	'MINOR_CIV_APPROACH_CONQUEST', 		6),
		('LEADER_JFD_PETER', 	'MINOR_CIV_APPROACH_BULLY', 		4);
--------------------------------
-- Leader_Flavors
--------------------------------					
INSERT INTO Leader_Flavors 
		(LeaderType, 			FlavorType, 						Flavor)
VALUES	('LEADER_JFD_PETER', 	'FLAVOR_OFFENSE', 					4),
		('LEADER_JFD_PETER', 	'FLAVOR_DEFENSE', 					6),
		('LEADER_JFD_PETER', 	'FLAVOR_CITY_DEFENSE', 				6),
		('LEADER_JFD_PETER', 	'FLAVOR_MILITARY_TRAINING', 		4),
		('LEADER_JFD_PETER', 	'FLAVOR_RECON', 					4),
		('LEADER_JFD_PETER', 	'FLAVOR_RANGED', 					3),
		('LEADER_JFD_PETER', 	'FLAVOR_MOBILE', 					3),
		('LEADER_JFD_PETER', 	'FLAVOR_NAVAL', 					5),
		('LEADER_JFD_PETER', 	'FLAVOR_NAVAL_RECON', 				4),
		('LEADER_JFD_PETER', 	'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_JFD_PETER', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_JFD_PETER', 	'FLAVOR_AIR', 						3),
		('LEADER_JFD_PETER', 	'FLAVOR_EXPANSION', 				9),
		('LEADER_JFD_PETER', 	'FLAVOR_GROWTH', 					3),
		('LEADER_JFD_PETER', 	'FLAVOR_TILE_IMPROVEMENT', 			3),
		('LEADER_JFD_PETER', 	'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_JFD_PETER', 	'FLAVOR_PRODUCTION', 				4),
		('LEADER_JFD_PETER', 	'FLAVOR_GOLD', 						4),
		('LEADER_JFD_PETER', 	'FLAVOR_SCIENCE', 					7),
		('LEADER_JFD_PETER', 	'FLAVOR_CULTURE', 					8),
		('LEADER_JFD_PETER', 	'FLAVOR_HAPPINESS', 				6),
		('LEADER_JFD_PETER', 	'FLAVOR_GREAT_PEOPLE', 				5),
		('LEADER_JFD_PETER', 	'FLAVOR_WONDER', 					4),
		('LEADER_JFD_PETER', 	'FLAVOR_RELIGION', 					3),
		('LEADER_JFD_PETER', 	'FLAVOR_DIPLOMACY', 				3),
		('LEADER_JFD_PETER', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_PETER', 	'FLAVOR_WATER_CONNECTION', 			4),
		('LEADER_JFD_PETER', 	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_PETER', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_PETER', 	'FLAVOR_ESPIONAGE', 				4),
		('LEADER_JFD_PETER', 	'FLAVOR_AIRLIFT', 					2),
		('LEADER_JFD_PETER', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_PETER', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_PETER', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_PETER', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_PETER', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_PETER', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------
-- Leader_Traits
--------------------------------
INSERT INTO Leader_Traits 
		(LeaderType, 			TraitType)
VALUES	('LEADER_JFD_PETER', 	'TRAIT_JFD_RUSSIA_PETER');
--==========================================================================================================================	
-- POLICIES
--==========================================================================================================================	
-- Policies
--------------------------------
INSERT INTO Policies	
		(Type,						Description,							NumCitiesPolicyCostDiscount)
VALUES	('POLICY_JFD_RUSSIA_PETER',	'TXT_KEY_TRAIT_JFD_RUSSIA_PETER_SHORT',	-50);
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 						Description, 						ShortDescription)
VALUES	('TRAIT_JFD_RUSSIA_PETER', 	'TXT_KEY_TRAIT_JFD_RUSSIA_PETER',	'TXT_KEY_TRAIT_JFD_RUSSIA_PETER_SHORT');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 								DerivativeCiv,			Description, ShortDescription, Adjective, 						Civilopedia, CivilopediaTag, DefaultPlayerColor, 			 ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 					DawnOfManQuote, 					DawnOfManImage)
SELECT	'CIVILIZATION_JFD_RUSSIA_PETER',	'CIVILIZATION_RUSSIA',	Description, ShortDescription, 'TXT_KEY_JFD_RUSSIA_PETER_ADJ',	Civilopedia, CivilopediaTag, 'PLAYERCOLOR_JFD_RUSSIA_PETER', ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_RUSSIA_PETER_ATLAS',	0, 				'JFD_RUSSIA_PETER_ALPHA_ATLAS', 'Russia', 		'PetrineRussiaMap512.dds',	'TXT_KEY_CIV5_DOM_JFD_PETER_TEXT', 	'Peter_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_RUSSIA';
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 					CityName)
VALUES	('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_01'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_02'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_03'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_04'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_05'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_06'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_07'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_08'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_09'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_10'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_11'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_12'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_13'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_14'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_15'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_16'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_17'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_18'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_19'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_20'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_21'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_22'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_23'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_24'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_25'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_26'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_27'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_28'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_29'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_30'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_31'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_32'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_33'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_34'),
		('CIVILIZATION_JFD_RUSSIA_PETER',	'TXT_KEY_CITY_NAME_JFD_RUSSIA_PETER_35');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_JFD_RUSSIA_PETER', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_JFD_RUSSIA_PETER', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_RUSSIA_PETER', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_JFD_RUSSIA_PETER',	'LEADER_JFD_PETER');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 					BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_JFD_RUSSIA_PETER',	'BUILDINGCLASS_ARSENAL', 	'BUILDING_KREPOST');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_JFD_RUSSIA_PETER',	'UNITCLASS_FRIGATE', 	'UNIT_JFD_TWO_DECKER');
--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 					ReligionType)
SELECT	'CIVILIZATION_JFD_RUSSIA_PETER', 	ReligionType
FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
SELECT	'CIVILIZATION_JFD_RUSSIA_PETER', 	SpyName
FROM Civilization_SpyNames WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--------------------------------	
-- Civilization_Start_Along_Ocean
--------------------------------	
INSERT INTO Civilization_Start_Along_Ocean 
		(CivilizationType, 					StartAlongOcean)
VALUES	('CIVILIZATION_JFD_RUSSIA_PETER',	1);
--==========================================================================================================================
--==========================================================================================================================