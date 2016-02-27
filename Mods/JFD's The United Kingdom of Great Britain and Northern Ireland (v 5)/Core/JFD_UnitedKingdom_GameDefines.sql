--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
			(Type, 						 		 DefaultBuilding, 							Description)
VALUES		('BUILDINGCLASS_JFD_UNITED_KINGDOM', 'BUILDING_JFD_NAVAL_AND_AIR_PRODUCTION',	'TXT_KEY_BUILDING_JFD_NAVAL_AND_AIR_PRODUCTION');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type, 						 				BuildingClass, 						GreatWorkCount, Cost,	FaithCost,	PrereqTech,	Description, 										Help)
VALUES		('BUILDING_JFD_NAVAL_AND_AIR_PRODUCTION', 	'BUILDINGCLASS_JFD_UNITED_KINGDOM',	-1,				-1,		-1,			null, 		'TXT_KEY_BUILDING_JFD_NAVAL_AND_AIR_PRODUCTION', 	'TXT_KEY_BUILDING_JFD_NAVAL_AND_AIR_PRODUCTION_HELP');
------------------------------	
-- Building_DomainProductionModifiers
------------------------------		
INSERT INTO Building_DomainProductionModifiers
			(BuildingType, 								DomainType, 		Modifier)
VALUES		('BUILDING_JFD_NAVAL_AND_AIR_PRODUCTION', 	'DOMAIN_SEA', 		5),	
			('BUILDING_JFD_NAVAL_AND_AIR_PRODUCTION', 	'DOMAIN_AIR', 		5);
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
			(Type, 						Description, 					Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_JFD_CHURCHILL', 	'TXT_KEY_LEADER_JFD_CHURCHILL', 'TXT_KEY_LEADER_JFD_CHURCHILL_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_CHURCHILL', 	'Churchill_Scene.xml',	9, 						3, 						8, 							8, 			6, 				9, 				6, 						5, 				8, 			4, 			4, 				6, 			6, 			'JFD_UNITED_KINGDOM_ATLAS', 1);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_CHURCHILL', 	'MAJOR_CIV_APPROACH_WAR', 			6),
			('LEADER_JFD_CHURCHILL', 	'MAJOR_CIV_APPROACH_HOSTILE', 		2),
			('LEADER_JFD_CHURCHILL', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
			('LEADER_JFD_CHURCHILL', 	'MAJOR_CIV_APPROACH_GUARDED', 		8),
			('LEADER_JFD_CHURCHILL', 	'MAJOR_CIV_APPROACH_AFRAID', 		2),
			('LEADER_JFD_CHURCHILL', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_JFD_CHURCHILL', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------		
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_CHURCHILL', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
			('LEADER_JFD_CHURCHILL', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_JFD_CHURCHILL', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	9),
			('LEADER_JFD_CHURCHILL', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
			('LEADER_JFD_CHURCHILL', 	'MINOR_CIV_APPROACH_BULLY', 		2);
--------------------------------	
-- Leader_Flavors
--------------------------------						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_CHURCHILL', 	'FLAVOR_OFFENSE', 					5),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_DEFENSE', 					6),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_CITY_DEFENSE', 				6),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_MILITARY_TRAINING', 		7),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_RECON', 					4),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_RANGED', 					3),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_MOBILE', 					3),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_NAVAL', 					9),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_NAVAL_RECON', 				8),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_NAVAL_GROWTH', 				8),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	8),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_AIR', 						9),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_EXPANSION', 				6),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_GROWTH', 					5),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_TILE_IMPROVEMENT', 			6),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_INFRASTRUCTURE', 			7),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_PRODUCTION', 				7),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_GOLD', 						7),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_SCIENCE', 					6),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_CULTURE', 					6),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_HAPPINESS', 				7),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_GREAT_PEOPLE', 				5),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_WONDER', 					3),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_RELIGION', 					4),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_DIPLOMACY', 				8),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_SPACESHIP', 				4),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_ESPIONAGE', 				5),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		9),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------						
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_CHURCHILL', 	'TRAIT_JFD_UNITED_KINGDOM');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
			(Type, 							Description, 						ShortDescription)
VALUES		('TRAIT_JFD_UNITED_KINGDOM', 	'TXT_KEY_TRAIT_JFD_UNITED_KINGDOM', 'TXT_KEY_TRAIT_JFD_UNITED_KINGDOM_SHORT');
--==========================================================================================================================	
-- POLICIES
--==========================================================================================================================	
-- Policies
--------------------------------		
INSERT INTO Policies
			(Type,							Description)
VALUES		('POLICY_JFD_UNITED_KINGDOM',	'TXT_KEY_TRAIT_JFD_UNITED_KINGDOM_SHORT');
--------------------------------	
-- Policy_BuildingClassYieldChanges
--------------------------------		
INSERT INTO Policy_BuildingClassYieldChanges
			(PolicyType,					BuildingClassType,			YieldType,			YieldChange)
VALUES		('POLICY_JFD_UNITED_KINGDOM',	'BUILDINGCLASS_LIGHTHOUSE', 'YIELD_PRODUCTION', 1),
			('POLICY_JFD_UNITED_KINGDOM',	'BUILDINGCLASS_HARBOR',		'YIELD_PRODUCTION', 1),
			('POLICY_JFD_UNITED_KINGDOM',	'BUILDINGCLASS_SEAPORT',	'YIELD_PRODUCTION', 1);
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
			(Type, 							IgnoreZoC, 	FriendlyLandsModifier, 	Description, 							Help, 									Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_RAF', 			0,			20,						'TXT_KEY_PROMOTION_JFD_RAF', 			'TXT_KEY_PROMOTION_JFD_RAF_HELP',		'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_RAF'),
			('PROMOTION_JFD_DREADNOUGHT', 	1,			0,						'TXT_KEY_PROMOTION_JFD_DREADNOUGHT', 	'TXT_KEY_PROMOTION_JFD_DREADNOUGHT',	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_DREADNOUGHT');
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
			(Class, 	Type, 					PrereqTech, RangedCombat, Range, AirInterceptRange, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 							Strategy, 									Help, 								Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas,						MoveRate)
SELECT		Class,		('UNIT_JFD_SPITFIRE'), 	PrereqTech, RangedCombat, Range, AirInterceptRange, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_SPITFIRE'), 	('TXT_KEY_CIV5_JFD_SPITFIRE_TEXT'), 	('TXT_KEY_UNIT_JFD_SPITFIRE_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_SPITFIRE'), Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, ('ART_DEF_UNIT_JFD_SPITFIRE'), 	0,					('JFD_SPITFIRE_FLAG_ART_ATLAS'),	3, 				('JFD_UNITED_KINGDOM_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_FIGHTER');


INSERT INTO Units 	
			(Type, 							PrereqTech,					Class, Combat,		ExtraMaintenanceCost,	RangedCombat,	 CombatClass, Cost, Moves, Range, Domain, DefaultUnitAI,	Description, 						Civilopedia, 							Strategy, 									Help, 									Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 						UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas,						MoveRate)
SELECT		('UNIT_JFD_DREADNOUGHT'),		'TECH_REPLACEABLE_PARTS',	Class, Combat+8,	1,						RangedCombat+8,  CombatClass, Cost, Moves, Range, Domain, DefaultUnitAI,	('TXT_KEY_UNIT_JFD_DREADNOUGHT'), 	('TXT_KEY_UNIT_JFD_DREADNOUGHT_TEXT'), 	('TXT_KEY_UNIT_JFD_DREADNOUGHT_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_DREADNOUGHT'), 	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, ('ART_DEF_UNIT_JFD_DREADNOUGHT'), 	0,					('JFD_DREADNOUGHT_FLAG_ART_ATLAS'),	2, 				('JFD_UNITED_KINGDOM_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_BATTLESHIP');	
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
--Disciple
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_SPITFIRE'), 			SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_FIGHTER');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_DREADNOUGHT'), 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_BATTLESHIP');	
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_SPITFIRE'), 			UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_FIGHTER');

INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_DREADNOUGHT'), 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_BATTLESHIP');
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 						ResourceType)
SELECT		('UNIT_JFD_SPITFIRE'), 			ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_FIGHTER');

INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 						ResourceType)
SELECT		('UNIT_JFD_DREADNOUGHT'), 		ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_BATTLESHIP');
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 						UnitClassType)
SELECT		('UNIT_JFD_SPITFIRE'), 			UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_FIGHTER');

INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 						UnitClassType)
SELECT		('UNIT_JFD_DREADNOUGHT'), 		UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_BATTLESHIP');
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_SPITFIRE'), 			FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_FIGHTER');

INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_DREADNOUGHT'), 		FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_BATTLESHIP');
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
			(UnitType, 						PromotionType)
SELECT		('UNIT_JFD_SPITFIRE'), 			PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_FIGHTER');

INSERT INTO Unit_FreePromotions 	
			(UnitType, 						PromotionType)
SELECT		('UNIT_JFD_DREADNOUGHT'), 		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_BATTLESHIP');

INSERT INTO Unit_FreePromotions
			(UnitType, 						PromotionType)
VALUES		('UNIT_JFD_DREADNOUGHT', 		'PROMOTION_JFD_DREADNOUGHT'),
			('UNIT_JFD_SPITFIRE', 			'PROMOTION_PARTIAL_HEAL_IF_DESTROY_ENEMY'),
			('UNIT_JFD_SPITFIRE', 			'PROMOTION_JFD_RAF');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations
			(Type, 									Description, 								ShortDescription, 								Adjective, 										Civilopedia, CivilopediaTag, DefaultPlayerColor, 				 ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 						DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'), 	('TXT_KEY_CIV_JFD_UNITED_KINGDOM_DESC'), 	('TXT_KEY_CIV_JFD_UNITED_KINGDOM_SHORT_DESC'), 	('TXT_KEY_CIV_JFD_UNITED_KINGDOM_ADJECTIVE'),	Civilopedia, CivilopediaTag, ('PLAYERCOLOR_JFD_UNITED_KINGDOM'), ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_UNITED_KINGDOM_ATLAS'), 	0, 				('JFD_UNITED_KINGDOM_ALPHA_ATLAS'), ('England'), 	('UnitedKingdomMap512.dds'), 	('TXT_KEY_CIV_JFD_CHURCHILL_DAWN'), 	('Churchill_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ENGLAND');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
			(CivilizationType, 					CityName)
VALUES		('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_LONDON'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_BIRMINGHAM'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_LEEDS'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_MANCHESTER'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_EDINBURGH'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_CARDIFF'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_BELFAST'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_GLASGOW'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_LIVERPOOL'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_NEWCASTLE'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_OXFORD'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_BRISTOL'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_ABERDEEN'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_SHEFFIELD'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_SOUTHAMPTON'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_PORTSMOUTH'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_LEICESTER'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_COVENTRY'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_BRIGHTON'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_SWANSEA'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_DUNDEE'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_CANTERBURG'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_CAMBRIDGE'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_PLYMOUTH'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_YORK'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_DERBY'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_NORWICH'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_EXETER'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_BATH'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_INVERNESS'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_NEWPORT'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_LONDONDERRY');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------	
INSERT INTO Civilization_FreeBuildingClasses
			(CivilizationType, 						BuildingClassType)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------	
INSERT INTO Civilization_FreeTechs
			(CivilizationType, 						TechType)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------	
INSERT INTO Civilization_FreeUnits
			(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--------------------------------	
-- Civilization_Religions
--------------------------------	
INSERT INTO Civilization_Religions
			(CivilizationType, 					ReligionType)
VALUES		('CIVILIZATION_JFD_UNITED_KINGDOM',	'RELIGION_PROTESTANTISM');
--------------------------------	
-- Civilization_Leaders
--------------------------------	
INSERT INTO Civilization_Leaders
			(CivilizationType, 						LeaderheadType)
VALUES		('CIVILIZATION_JFD_UNITED_KINGDOM',		'LEADER_JFD_CHURCHILL');
--------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------	
INSERT INTO Civilization_UnitClassOverrides
			(CivilizationType, 						UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_UNITED_KINGDOM', 	'UNITCLASS_BATTLESHIP', 	'UNIT_JFD_DREADNOUGHT'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 	'UNITCLASS_FIGHTER', 		'UNIT_JFD_SPITFIRE');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames
			(CivilizationType, 						SpyName)
VALUES		('CIVILIZATION_JFD_UNITED_KINGDOM', 	'TXT_KEY_SPY_NAME_JFD_UNITED_KINGDOM_0'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 	'TXT_KEY_SPY_NAME_JFD_UNITED_KINGDOM_1'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 	'TXT_KEY_SPY_NAME_JFD_UNITED_KINGDOM_2'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 	'TXT_KEY_SPY_NAME_JFD_UNITED_KINGDOM_3'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 	'TXT_KEY_SPY_NAME_JFD_UNITED_KINGDOM_4'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 	'TXT_KEY_SPY_NAME_JFD_UNITED_KINGDOM_5'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 	'TXT_KEY_SPY_NAME_JFD_UNITED_KINGDOM_6'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 	'TXT_KEY_SPY_NAME_JFD_UNITED_KINGDOM_7'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 	'TXT_KEY_SPY_NAME_JFD_UNITED_KINGDOM_8'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 	'TXT_KEY_SPY_NAME_JFD_UNITED_KINGDOM_9');
--------------------------------	
-- Civilization_Start_Along_Ocean
--------------------------------		
INSERT INTO Civilization_Start_Along_Ocean 
			(CivilizationType, 							StartAlongOcean)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'), 		StartAlongOcean
FROM Civilization_Start_Along_Ocean WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================
--==========================================================================================================================