--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses
			(Type, 												DefaultBuilding, 								Description)
VALUES		('BUILDINGCLASS_JFD_JAPAN_TOJO_NAVAL_PRODUCTION', 	'BUILDING_JFD_JAPAN_TOJO_NAVAL_PRODUCTION', 	'TXT_KEY_BUILDING_JFD_JAPAN_TOJO_NAVAL_PRODUCTION_DESC');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings		
			(Type, 											BuildingClass, 			  							Cost, 	FaithCost,	GreatWorkCount,	 Help,														Description, 											NeverCapture)
VALUES		('BUILDING_JFD_JAPAN_TOJO_NAVAL_PRODUCTION', 	'BUILDINGCLASS_JFD_JAPAN_TOJO_NAVAL_PRODUCTION', 	-1, 	-1,			-1,				 'TXT_KEY_BUILDING_JFD_JAPAN_TOJO_NAVAL_PRODUCTION_HELP',	'TXT_KEY_BUILDING_JFD_JAPAN_TOJO_NAVAL_PRODUCTION', 	1);
------------------------------	
-- Building_DomainProductionModifiers
------------------------------		
INSERT INTO Building_DomainProductionModifiers
			(BuildingType,									DomainType,		Modifier)
VALUES		('BUILDING_JFD_JAPAN_TOJO_NAVAL_PRODUCTION',	'DOMAIN_SEA',	50);
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
			(Type, 						Description, 				Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_JFD_TOJO', 		'TXT_KEY_LEADER_JFD_TOJO', 	'TXT_KEY_LEADER_JFD_TOJO_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_TOJO', 	'Tojo_Scene.xml',	8, 						2, 						2, 							8, 			7, 				5, 				5, 						5, 				9, 			4, 			2, 				2, 			4, 			'JFD_JAPAN_TOJO_ATLAS', 	1);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_TOJO', 		'MAJOR_CIV_APPROACH_WAR', 			7),
			('LEADER_JFD_TOJO', 		'MAJOR_CIV_APPROACH_HOSTILE', 		7),
			('LEADER_JFD_TOJO', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	8),
			('LEADER_JFD_TOJO', 		'MAJOR_CIV_APPROACH_GUARDED', 		7),
			('LEADER_JFD_TOJO', 		'MAJOR_CIV_APPROACH_AFRAID', 		5),
			('LEADER_JFD_TOJO', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		3),
			('LEADER_JFD_TOJO', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		2);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_TOJO', 		'MINOR_CIV_APPROACH_IGNORE', 		3),
			('LEADER_JFD_TOJO', 		'MINOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_JFD_TOJO', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
			('LEADER_JFD_TOJO', 		'MINOR_CIV_APPROACH_CONQUEST', 		7);
--------------------------------		
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_TOJO', 		'FLAVOR_OFFENSE', 					8),
			('LEADER_JFD_TOJO', 		'FLAVOR_DEFENSE', 					4),
			('LEADER_JFD_TOJO', 		'FLAVOR_CITY_DEFENSE', 				4),
			('LEADER_JFD_TOJO', 		'FLAVOR_MILITARY_TRAINING', 		5),
			('LEADER_JFD_TOJO', 		'FLAVOR_RECON', 					5),
			('LEADER_JFD_TOJO', 		'FLAVOR_RANGED', 					5),
			('LEADER_JFD_TOJO', 		'FLAVOR_MOBILE', 					5),
			('LEADER_JFD_TOJO', 		'FLAVOR_NAVAL', 					8),
			('LEADER_JFD_TOJO', 		'FLAVOR_NAVAL_RECON', 				7),
			('LEADER_JFD_TOJO', 		'FLAVOR_NAVAL_GROWTH', 				6),
			('LEADER_JFD_TOJO', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
			('LEADER_JFD_TOJO', 		'FLAVOR_AIR', 						7),
			('LEADER_JFD_TOJO', 		'FLAVOR_EXPANSION', 				8),
			('LEADER_JFD_TOJO', 		'FLAVOR_GROWTH', 					4),
			('LEADER_JFD_TOJO', 		'FLAVOR_TILE_IMPROVEMENT', 			4),
			('LEADER_JFD_TOJO', 		'FLAVOR_INFRASTRUCTURE', 			5),
			('LEADER_JFD_TOJO', 		'FLAVOR_PRODUCTION', 				5),
			('LEADER_JFD_TOJO', 		'FLAVOR_GOLD', 						4),
			('LEADER_JFD_TOJO', 		'FLAVOR_SCIENCE', 					6),
			('LEADER_JFD_TOJO', 		'FLAVOR_CULTURE', 					5),
			('LEADER_JFD_TOJO', 		'FLAVOR_HAPPINESS', 				4),
			('LEADER_JFD_TOJO', 		'FLAVOR_GREAT_PEOPLE', 				4),
			('LEADER_JFD_TOJO', 		'FLAVOR_WONDER', 					2),
			('LEADER_JFD_TOJO', 		'FLAVOR_RELIGION', 					2),
			('LEADER_JFD_TOJO', 		'FLAVOR_DIPLOMACY', 				3),
			('LEADER_JFD_TOJO', 		'FLAVOR_SPACESHIP', 				2),
			('LEADER_JFD_TOJO', 		'FLAVOR_WATER_CONNECTION', 			2),
			('LEADER_JFD_TOJO', 		'FLAVOR_NUKE', 						2),
			('LEADER_JFD_TOJO', 		'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_TOJO', 		'FLAVOR_ESPIONAGE', 				8),
			('LEADER_JFD_TOJO', 		'FLAVOR_AIRLIFT', 					8),
			('LEADER_JFD_TOJO', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_TOJO', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_TOJO', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_TOJO', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_TOJO', 		'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_TOJO', 		'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_TOJO', 		'TRAIT_JFD_JAPAN_TOJO');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
			(Type, 						Description, 					ShortDescription)
VALUES		('TRAIT_JFD_JAPAN_TOJO', 	'TXT_KEY_TRAIT_JFD_JAPAN_TOJO', 'TXT_KEY_TRAIT_JFD_JAPAN_TOJO_SHORT');
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
			(Type, 						CityAttack,		Description, 						Help, 									Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_YAMATO', 	100,			'TXT_KEY_PROMOTION_JFD_YAMATO', 	'TXT_KEY_PROMOTION_JFD_YAMATO_HELP',	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_YAMATO');
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
			(Type, 					PrereqTech,	Class, Combat,	RangedCombat,	CombatClass,	Cost, Moves,	Range, Domain, DefaultUnitAI,			Description, 					Civilopedia, 						Strategy, 								Help, 								SpecialCargo,			DomainCargo,	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas,					MoveRate)
SELECT		('UNIT_JFD_YAMATO'),	PrereqTech,	Class, Combat,	RangedCombat,	CombatClass,	Cost, Moves-1,	Range, Domain, ('UNITAI_CITY_BOMBARD'),	('TXT_KEY_UNIT_JFD_YAMATO'), 	('TXT_KEY_UNIT_JFD_YAMATO_TEXT'), 	('TXT_KEY_UNIT_JFD_YAMATO_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_YAMATO'), 	'SPECIALUNIT_FIGHTER',	'DOMAIN_AIR',	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, ('ART_DEF_UNIT_JFD_YAMATO'), 	0,					('JFD_YAMATO_FLAG_ART_ATLAS'),	2, 				('JFD_JAPAN_TOJO_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_BATTLESHIP');
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_YAMATO'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_BATTLESHIP');	
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_YAMATO'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_BATTLESHIP');

INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_YAMATO'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_CARRIER');

INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
VALUES		('UNIT_JFD_YAMATO', 	'UNITAI_CITY_BOMBARD');
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 				ResourceType)
SELECT		('UNIT_JFD_YAMATO'), 	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_BATTLESHIP');
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		('UNIT_JFD_YAMATO'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_BATTLESHIP');

INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		('UNIT_JFD_YAMATO'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_CARRIER');
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
SELECT		('UNIT_JFD_YAMATO'), 	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_BATTLESHIP');

INSERT INTO Unit_FreePromotions
			(UnitType, 				PromotionType)
VALUES		('UNIT_JFD_YAMATO', 	'PROMOTION_CITY_SIEGE'),
			('UNIT_JFD_YAMATO', 	'PROMOTION_CARGO_II');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
			(Type, 								Description,	ShortDescription, 	Adjective, 	Civilopedia, CivilopediaTag,	DefaultPlayerColor, 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 					DawnOfManQuote, 				DawnOfManImage)
SELECT		('CIVILIZATION_JFD_JAPAN_TOJO'), 	Description,	ShortDescription,	Adjective,	Civilopedia, CivilopediaTag,	('PLAYERCOLOR_JFD_JAPAN_TOJO'), ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_JAPAN_TOJO_ATLAS'), 	0, 				('JFD_JAPAN_TOJO_ALPHA_ATLAS'), ('Japan'), 		('JapanTojoMap512.dds'),	('TXT_KEY_CIV_JFD_TOJO_DAWN'), 	('DOM_Tojo.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_JAPAN');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames 
			(CivilizationType, 					CityName)
VALUES		('CIVILIZATION_JFD_JAPAN_TOJO',		'TXT_KEY_CITY_NAME_TOKYO');

INSERT INTO Civilization_CityNames 
			(CivilizationType, 					CityName)
SELECT		('CIVILIZATION_JFD_JAPAN_TOJO'),	CityName
FROM Civilization_CityNames WHERE (CivilizationType = 'CIVILIZATION_JAPAN');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_JFD_JAPAN_TOJO'),	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_JAPAN');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_JFD_JAPAN_TOJO'),	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_JAPAN');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_JAPAN_TOJO'),	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_JAPAN');
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_JFD_JAPAN_TOJO', 	'LEADER_JFD_TOJO');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------	
DELETE FROM Civilization_UnitClassOverrides WHERE UnitType = 'UNIT_JAPANESE_ZERO';	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_JFD_JAPAN_TOJO', 	'UNITCLASS_FIGHTER', 	'UNIT_JAPANESE_ZERO'),
			('CIVILIZATION_JFD_JAPAN_TOJO', 	'UNITCLASS_BATTLESHIP', 'UNIT_JFD_YAMATO');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 					BuildingClassType, 		BuildingType)
VALUES		('CIVILIZATION_JAPAN', 				'BUILDINGCLASS_ARMORY', 'BUILDING_JFD_DOJO');
--------------------------------	
-- Civilization_Religions
--------------------------------		
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
SELECT		('CIVILIZATION_JFD_JAPAN_TOJO'),	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_JAPAN');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
SELECT		('CIVILIZATION_JFD_JAPAN_TOJO'),	SpyName
FROM Civilization_SpyNames WHERE (CivilizationType = 'CIVILIZATION_JAPAN');
--------------------------------	
-- Civilization_Start_Along_Ocean
--------------------------------	
INSERT INTO Civilization_Start_Along_Ocean 
			(CivilizationType, 					StartAlongOcean)
VALUES		('CIVILIZATION_JFD_JAPAN_TOJO', 	1);
--==========================================================================================================================
--==========================================================================================================================