--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
			(Type, 						 		 		DefaultBuilding, 									Description)
VALUES		('BUILDINGCLASS_JFD_STALIN_SATELLITES', 	'BUILDING_JFD_SOVIET_STALIN_CULT_OF_PERSONALITY', 	'TXT_KEY_BUILDING_JFD_STALIN_SATELLITES');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type, 									BuildingClass, Cost, GoldMaintenance, PrereqTech, EspionageModifier, Espionage, Description, 											Civilopedia, 												Help, 											Strategy,								 				ArtDefineTag, 	MinAreaSize, NeverCapture, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_STALIN_COMMISSARIAT'),	BuildingClass, Cost, GoldMaintenance, PrereqTech, EspionageModifier, Espionage, ('TXT_KEY_BUILDING_JFD_STALIN_COMMISSARIAT_DESC'), 	('TXT_KEY_CIV5_BUILDINGS_JFD_STALIN_COMMISSARIAT_TEXT'), 	('TXT_KEY_BUILDING_JFD_STALIN_COMMISSARIAT_HELP'), 	('TXT_KEY_BUILDING_JFD_STALIN_COMMISSARIAT_STRATEGY'),	ArtDefineTag,	MinAreaSize, NeverCapture, HurryCostModifier, 2, 				('JFD_USSR_STALIN_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_CONSTABLE';	

INSERT INTO Buildings 	
			(Type, 						 			BuildingClass, 							GreatWorkCount, Cost, FaithCost, PrereqTech, NeverCapture,	NukeImmune, Description, 								Help,											PortraitIndex,	IconAtlas)
VALUES		('BUILDING_JFD_STALIN_SATELLITES', 		'BUILDINGCLASS_JFD_STALIN_SATELLITES', 	-1,				-1,   -1, 		 null, 		 1,				1,			'TXT_KEY_BUILDING_JFD_STALIN_SATELLITES', 	'TXT_KEY_BUILDING_JFD_STALIN_SATELLITES_HELP',	0,				'JFD_USSR_STALIN_ATLAS');
------------------------------	
-- Building_DomainProductionModifiers
------------------------------	
INSERT INTO Building_DomainProductionModifiers 
			(BuildingType, 							DomainType, 		Modifier)
VALUES		('BUILDING_JFD_STALIN_SATELLITES', 		'DOMAIN_LAND', 		10);	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 
			(BuildingType, 							FlavorType, 					Flavor)
VALUES		('BUILDING_JFD_STALIN_COMMISSARIAT', 	'FLAVOR_ESPIONAGE', 			25),
			('BUILDING_JFD_STALIN_COMMISSARIAT', 	'FLAVOR_HAPPINESS', 			75),
			('BUILDING_JFD_STALIN_COMMISSARIAT', 	'FLAVOR_MILITARY_TRAINING', 	50);	
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
			(Type, 					Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_JFD_STALIN', 	'TXT_KEY_LEADER_JFD_STALIN', 	'TXT_KEY_LEADER_JFD_STALIN_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_STALIN', 	'Stalin_Scene.xml', 7, 						3, 						9, 							9, 			4, 				3, 				6, 						4, 				3, 			1, 			2, 				4, 			9, 			'JFD_USSR_STALIN_ATLAS', 	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_STALIN', 	'MAJOR_CIV_APPROACH_WAR', 			5),
			('LEADER_JFD_STALIN', 	'MAJOR_CIV_APPROACH_HOSTILE', 		6),
			('LEADER_JFD_STALIN', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	8),
			('LEADER_JFD_STALIN', 	'MAJOR_CIV_APPROACH_GUARDED', 		8),
			('LEADER_JFD_STALIN', 	'MAJOR_CIV_APPROACH_AFRAID', 		1),
			('LEADER_JFD_STALIN', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
			('LEADER_JFD_STALIN', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_STALIN', 	'MINOR_CIV_APPROACH_IGNORE', 		1),
			('LEADER_JFD_STALIN', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_JFD_STALIN', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	9),
			('LEADER_JFD_STALIN', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
			('LEADER_JFD_STALIN', 	'MINOR_CIV_APPROACH_BULLY', 		3);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_JFD_STALIN', 	'FLAVOR_OFFENSE', 					8),
			('LEADER_JFD_STALIN', 	'FLAVOR_DEFENSE', 					6),
			('LEADER_JFD_STALIN', 	'FLAVOR_CITY_DEFENSE', 				7),
			('LEADER_JFD_STALIN', 	'FLAVOR_MILITARY_TRAINING', 		8),
			('LEADER_JFD_STALIN', 	'FLAVOR_RECON', 					4),
			('LEADER_JFD_STALIN', 	'FLAVOR_RANGED', 					4),
			('LEADER_JFD_STALIN', 	'FLAVOR_MOBILE', 					5),
			('LEADER_JFD_STALIN', 	'FLAVOR_NAVAL', 					4),
			('LEADER_JFD_STALIN', 	'FLAVOR_NAVAL_RECON', 				3),
			('LEADER_JFD_STALIN', 	'FLAVOR_NAVAL_GROWTH', 				2),
			('LEADER_JFD_STALIN', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
			('LEADER_JFD_STALIN', 	'FLAVOR_AIR', 						5),
			('LEADER_JFD_STALIN', 	'FLAVOR_EXPANSION', 				8),
			('LEADER_JFD_STALIN', 	'FLAVOR_GROWTH', 					8),
			('LEADER_JFD_STALIN', 	'FLAVOR_TILE_IMPROVEMENT', 			9),
			('LEADER_JFD_STALIN', 	'FLAVOR_INFRASTRUCTURE', 			9),
			('LEADER_JFD_STALIN', 	'FLAVOR_PRODUCTION', 				9),
			('LEADER_JFD_STALIN', 	'FLAVOR_GOLD', 						6),
			('LEADER_JFD_STALIN', 	'FLAVOR_SCIENCE', 					8),
			('LEADER_JFD_STALIN', 	'FLAVOR_CULTURE', 					4),
			('LEADER_JFD_STALIN', 	'FLAVOR_HAPPINESS', 				5),
			('LEADER_JFD_STALIN', 	'FLAVOR_GREAT_PEOPLE', 				4),
			('LEADER_JFD_STALIN', 	'FLAVOR_WONDER', 					6),
			('LEADER_JFD_STALIN', 	'FLAVOR_RELIGION', 					0),
			('LEADER_JFD_STALIN', 	'FLAVOR_DIPLOMACY', 				4),
			('LEADER_JFD_STALIN', 	'FLAVOR_SPACESHIP', 				3),
			('LEADER_JFD_STALIN', 	'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_JFD_STALIN', 	'FLAVOR_NUKE', 						3),
			('LEADER_JFD_STALIN', 	'FLAVOR_USE_NUKE', 					3),
			('LEADER_JFD_STALIN', 	'FLAVOR_ESPIONAGE', 				9),
			('LEADER_JFD_STALIN', 	'FLAVOR_AIRLIFT', 					1),
			('LEADER_JFD_STALIN', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_STALIN', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_STALIN', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_STALIN', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_STALIN', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_STALIN', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_JFD_STALIN', 	'TRAIT_JFD_USSR_STALIN');
--==========================================================================================================================	
-- POLICIES
--==========================================================================================================================	
-- Policies
--------------------------------	
INSERT INTO Policies
			(Type,							Description,							AfraidMinorPerTurnInfluence)
VALUES		('POLICY_JFD_STALIN_QUICK',		'TXT_KEY_TRAIT_JFD_USSR_STALIN_SHORT',	250),
			('POLICY_JFD_STALIN_STANDARD',	'TXT_KEY_TRAIT_JFD_USSR_STALIN_SHORT',	200),
			('POLICY_JFD_STALIN_EPIC',		'TXT_KEY_TRAIT_JFD_USSR_STALIN_SHORT',	150),
			('POLICY_JFD_STALIN_MARATHON',	'TXT_KEY_TRAIT_JFD_USSR_STALIN_SHORT',	125);
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
			(Type, 							Description, 						ShortDescription)
VALUES		('TRAIT_JFD_USSR_STALIN', 		'TXT_KEY_TRAIT_JFD_USSR_STALIN', 	'TXT_KEY_TRAIT_JFD_USSR_STALIN_SHORT');
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
			(Type, 								Description, 							Help, 										Sound, 				EnemyDamageChance,	ExtraAttacks,	CanMoveAfterAttacking,	EnemyDamage,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_WARSAW_PACT', 		'TXT_KEY_PROMOTION_JFD_WARSAW_PACT',	'TXT_KEY_PROMOTION_JFD_WARSAW_PACT_HELP', 	'AS2D_IF_LEVELUP', 	50,					0,				0,						10,				1, 				57, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_WARSAW_PACT'),
			('PROMOTION_JFD_STALIN_IS2_INFO', 	'TXT_KEY_PROMOTION_JFD_IS2_INFO', 		'TXT_KEY_PROMOTION_JFD_IS2_INFO_HELP', 		'AS2D_IF_LEVELUP',	0,					0,				0,						0,				1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_IS2_INFO'),
			('PROMOTION_JFD_STALIN_IS2', 		'TXT_KEY_PROMOTION_JFD_IS2', 			'TXT_KEY_PROMOTION_JFD_IS2_HELP', 			'AS2D_IF_LEVELUP',	0,					1,				0,						0,				1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_IS2');
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
			(Class, 	Type, 				PrereqTech, Combat, Cost, 	 FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, 				Civilopedia, 					Strategy, 							Help, 							MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, Mechanized, MoveRate, UnitArtInfo, 				UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		Class,		('UNIT_JFD_IS2'), 	PrereqTech, Combat, Cost-10, FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_IS2'), 	('TXT_KEY_CIV5_JFD_IS2_TEXT'), 	('TXT_KEY_UNIT_JFD_IS2_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_IS2'), 	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, Mechanized, MoveRate, ('ART_DEF_UNIT_JFD_IS2'),	0,					('JFD_STALIN_IS2_FLAG_ART_ATLAS'),	3, 				('JFD_USSR_STALIN_ATLAS')
FROM Units WHERE (Type = 'UNIT_TANK');
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 			SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_IS2'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_TANK');	
--------------------------------		
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, 			UnitAIType)
SELECT		('UNIT_JFD_IS2'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_TANK');
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 			UnitClassType)
SELECT		('UNIT_JFD_IS2'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_TANK');	
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
			(UnitType, 			FlavorType, Flavor)
SELECT		('UNIT_JFD_IS2'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_TANK');	
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 			ResourceType, Cost)
SELECT		('UNIT_JFD_IS2'), 	ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_TANK');	
--------------------------------	
-- Unit_FreePromotions
--------------------------------	
INSERT INTO Unit_FreePromotions 	
			(UnitType, 			PromotionType)
SELECT		('UNIT_JFD_IS2'), 	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_TANK');	

INSERT INTO Unit_FreePromotions 	
			(UnitType, 			PromotionType)
VALUES		('UNIT_JFD_IS2', 	'PROMOTION_JFD_STALIN_IS2_INFO');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations
			(Type, 								Description, 							ShortDescription, 								Adjective, 										Civilopedia, 	CivilopediaTag, 	DefaultPlayerColor, 				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 					DawnOfManQuote, 				DawnOfManImage)
SELECT		('CIVILIZATION_JFD_USSR_STALIN'), 	('TXT_KEY_CIV_JFD_USSR_STALIN_DESC'), 	('TXT_KEY_CIV_JFD_USSR_STALIN_SHORT_DESC'), 	('TXT_KEY_CIV_JFD_USSR_STALIN_ADJECTIVE'),		Civilopedia, 	CivilopediaTag, 	('PLAYERCOLOR_JFD_USSR_STALIN'), 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_USSR_STALIN_ATLAS'), 	0, 				('JFD_USSR_STALIN_ALPHA_ATLAS'), 	('Russia'), 	('USSRStalinMap512.dds'), 	('TXT_KEY_CIV_JFD_USSR_DAWN'), 	('DOM_Stalin.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_RUSSIA');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
			(CivilizationType, 					CityName)
VALUES		('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_MOSCOW'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_LENINGRAD'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_KIEV'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_MINSK'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_KHARKOV'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_STALINGRAD'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_SVERDLOVSK'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_GORKY'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_KRASNODAR'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_VLADIVOSTOK'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_NOVOSIBIRSK'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_KRASNOYARSK'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_KUYBYSHEV'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_BAKU'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_TBILISI'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_ALMA_ATA'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_TASHKENT'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_OMSK'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_UFA'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_CHELYABINSK'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_SEVASTOPOL'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_MOLOTOV'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_KALININGRAD'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_RIGA'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_TALLIN'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_KAZAN'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_ODESSA'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_KIROV'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_ULYANOVSK'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_DNEPROPETROVSK'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_STALINO'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_KHABAROVSK'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_TOLYATTI'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_BARNAUL'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_USTINOV'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_ORDZONIKIDZE'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_ASHGABAT'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_STALINABAD'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_NOVOKUZNETSK'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_TSELINOGRAD'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_KARAGANDA'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_FRUNZE'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_SHCHERBAKOV'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_ARZAMAS_16');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 						BuildingClassType)
SELECT		('CIVILIZATION_JFD_USSR_STALIN'), 		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 						TechType)
SELECT		('CIVILIZATION_JFD_USSR_STALIN'), 		TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_USSR_STALIN'),		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 						LeaderheadType)
VALUES		('CIVILIZATION_JFD_USSR_STALIN', 		'LEADER_JFD_STALIN');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 						UnitClassType, 					UnitType)
VALUES		('CIVILIZATION_JFD_USSR_STALIN', 		'UNITCLASS_TANK', 				'UNIT_JFD_IS2');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 						BuildingClassType, 				BuildingType)
VALUES		('CIVILIZATION_JFD_USSR_STALIN', 		'BUILDINGCLASS_CONSTABLE', 		'BUILDING_JFD_STALIN_COMMISSARIAT');
--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions 
			(CivilizationType, 						ReligionType)
SELECT		('CIVILIZATION_JFD_USSR_STALIN'), 		ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 						SpyName)
SELECT		('CIVILIZATION_JFD_USSR_STALIN'), 		SpyName
FROM Civilization_SpyNames WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--==========================================================================================================================
--==========================================================================================================================