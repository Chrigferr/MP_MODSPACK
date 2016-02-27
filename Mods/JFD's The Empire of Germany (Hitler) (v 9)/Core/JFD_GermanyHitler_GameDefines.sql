--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 
			(DefaultBuilding, 				Type, 								Description)
VALUES		('BUILDING_JFD_NAZI_GERMANY',  'BUILDINGCLASS_JFD_NAZI_GERMANY',	'TXT_KEY_BUILDING_JFD_NAZI_GERMANY');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT OR REPLACE INTO Buildings 
			(Type, 							BuildingClass, 						GreatGeneralRateModifier,	GreatWorkCount, Cost, 	FaithCost,	GoldMaintenance,	PrereqTech, NeverCapture,	Description, 							Help)
VALUES		('BUILDING_JFD_NAZI_GERMANY', 	'BUILDINGCLASS_JFD_NAZI_GERMANY',	10,							-1,				-1, 	-1,			0,					NULL, 		1,				'TXT_KEY_BUILDING_JFD_NAZI_GERMANY', 	'TXT_KEY_BUILDING_JFD_NAZI_GERMANY_HELP');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
			(Type, 					Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_JFD_HITLER', 	'TXT_KEY_LEADER_JFD_HITLER', 	'TXT_KEY_LEADER_JFD_HITLER_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_HITLER', 	'Hitler_Scene.xml', 	9, 						5, 						7, 							9, 			2, 				5, 				8, 						2, 				4, 			6, 			1, 				6, 			9, 			'JFD_NAZI_GERMANY_ATLAS',	1);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------					
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_HITLER', 	'MAJOR_CIV_APPROACH_WAR', 			7),
			('LEADER_JFD_HITLER', 	'MAJOR_CIV_APPROACH_HOSTILE', 		6),
			('LEADER_JFD_HITLER', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	9),
			('LEADER_JFD_HITLER', 	'MAJOR_CIV_APPROACH_GUARDED', 		4),
			('LEADER_JFD_HITLER', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
			('LEADER_JFD_HITLER', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
			('LEADER_JFD_HITLER', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		2);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------					
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_HITLER', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
			('LEADER_JFD_HITLER', 	'MINOR_CIV_APPROACH_FRIENDLY', 		2),
			('LEADER_JFD_HITLER', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
			('LEADER_JFD_HITLER', 	'MINOR_CIV_APPROACH_CONQUEST', 		7),
			('LEADER_JFD_HITLER', 	'MINOR_CIV_APPROACH_BULLY', 		9);
--------------------------------
-- Leader_Flavors
--------------------------------					
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_JFD_HITLER', 	'FLAVOR_OFFENSE', 					9),
			('LEADER_JFD_HITLER', 	'FLAVOR_DEFENSE', 					4),
			('LEADER_JFD_HITLER', 	'FLAVOR_CITY_DEFENSE', 				3),
			('LEADER_JFD_HITLER', 	'FLAVOR_MILITARY_TRAINING', 		9),
			('LEADER_JFD_HITLER', 	'FLAVOR_RECON', 					4),
			('LEADER_JFD_HITLER', 	'FLAVOR_RANGED', 					4),
			('LEADER_JFD_HITLER', 	'FLAVOR_MOBILE', 					7),
			('LEADER_JFD_HITLER', 	'FLAVOR_NAVAL', 					5),
			('LEADER_JFD_HITLER', 	'FLAVOR_NAVAL_RECON', 				5),
			('LEADER_JFD_HITLER', 	'FLAVOR_NAVAL_GROWTH', 				5),
			('LEADER_JFD_HITLER', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
			('LEADER_JFD_HITLER', 	'FLAVOR_AIR', 						6),
			('LEADER_JFD_HITLER', 	'FLAVOR_EXPANSION', 				9),
			('LEADER_JFD_HITLER', 	'FLAVOR_GROWTH', 					3),
			('LEADER_JFD_HITLER', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_JFD_HITLER', 	'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_JFD_HITLER', 	'FLAVOR_PRODUCTION', 				6),
			('LEADER_JFD_HITLER', 	'FLAVOR_GOLD', 						4),
			('LEADER_JFD_HITLER', 	'FLAVOR_SCIENCE', 					8),
			('LEADER_JFD_HITLER', 	'FLAVOR_CULTURE', 					6),
			('LEADER_JFD_HITLER', 	'FLAVOR_HAPPINESS', 				4),
			('LEADER_JFD_HITLER', 	'FLAVOR_GREAT_PEOPLE', 				4),
			('LEADER_JFD_HITLER', 	'FLAVOR_WONDER', 					3),
			('LEADER_JFD_HITLER', 	'FLAVOR_RELIGION', 					0),
			('LEADER_JFD_HITLER', 	'FLAVOR_DIPLOMACY', 				6),
			('LEADER_JFD_HITLER', 	'FLAVOR_SPACESHIP', 				3),
			('LEADER_JFD_HITLER', 	'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_JFD_HITLER', 	'FLAVOR_NUKE', 						3),
			('LEADER_JFD_HITLER', 	'FLAVOR_USE_NUKE', 					3),
			('LEADER_JFD_HITLER', 	'FLAVOR_ESPIONAGE', 				8),
			('LEADER_JFD_HITLER', 	'FLAVOR_AIRLIFT', 					5),
			('LEADER_JFD_HITLER', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_HITLER', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_HITLER', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_HITLER', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_HITLER', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_HITLER', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------
-- Leader_Traits
--------------------------------					
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_JFD_HITLER', 	'TRAIT_JFD_GERMANY');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
			(Type, 					Description, 						ShortDescription)
VALUES		('TRAIT_JFD_GERMANY', 	'TXT_KEY_TRAIT_JFD_NAZI_GERMANY', 	'TXT_KEY_TRAIT_JFD_NAZI_GERMANY_SHORT');	
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT OR REPLACE INTO UnitPromotions 
			(Type, 						Description, 						Help, 									Sound, 				CanMoveAfterAttacking,	ExtraAttacks,	ExperiencePercent, 	FreePillageMoves,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_BLITZ',		'TXT_KEY_PROMOTION_BLITZ',			'TXT_KEY_PROMOTION_BLITZ_HELP', 		'AS2D_IF_LEVELUP', 	1,						1,				0,					0,					1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_BLITZ'),
			('PROMOTION_JFD_JAEGER',	'TXT_KEY_PROMOTION_JFD_JAEGER',		'TXT_KEY_PROMOTION_JFD_JAEGER_HELP', 	'AS2D_IF_LEVELUP',	0,						0,				15,					0,					1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_JAEGER'),
			('PROMOTION_JFD_PANZER',	'TXT_KEY_PROMOTION_JFD_PANZER',		'TXT_KEY_PROMOTION_JFD_PANZER_HELP', 	'AS2D_IF_LEVELUP',	0,						0,				0,					1,					1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_PANZER');
--==========================================================================================================================
-- UnitPromotions_UnitCombats
--==========================================================================================================================	
INSERT OR REPLACE INTO UnitPromotions_UnitCombats
			(PromotionType,				UnitCombatType)
VALUES		('PROMOTION_SURVIVALISM_2',	'UNITCOMBAT_GUN'),
			('PROMOTION_SURVIVALISM_3',	'UNITCOMBAT_GUN'),
			('PROMOTION_SCOUTING_2',	'UNITCOMBAT_GUN'),
			('PROMOTION_SCOUTING_3',	'UNITCOMBAT_GUN');
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
			(Class, Type, 					PrereqTech, Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, Moves, HurryCostModifier,	CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 					Strategy, 							Help, 							MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 					UnitFlagAtlas, 							UnitFlagIconOffset, PortraitIndex, 	IconAtlas, 						MoveRate)
SELECT		Class, 	('UNIT_JFD_WEHRMACHT'), PrereqTech, Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, Moves, HurryCostModifier,	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_JFD_WEHRMACHT_DESC'), ('TXT_KEY_JFD_WEHRMACHT_TEXT'), ('TXT_KEY_JFD_WEHRMACHT_STRATEGY'), ('TXT_KEY_JFD_WEHRMACHT_HELP'),	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, ('ART_DEF_UNIT_JFD_WEHRMACHT'), ('UNITS_JFD_WEHRMACHT_FLAG_ART_ATLAS'), 	0,					2, 				('JFD_NAZI_GERMANY_ATLAS'), 	MoveRate
FROM Units WHERE (Type = 'UNIT_INFANTRY');

INSERT OR REPLACE INTO Units 	
			(Class, Type, 					PrereqTech, Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, Moves, HurryCostModifier,	CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 					Strategy, 							Help, 							MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 					UnitFlagAtlas, 					UnitFlagIconOffset, PortraitIndex, 	IconAtlas, 				MoveRate)
SELECT		Class, 	('UNIT_JFD_JAEGER'),	PrereqTech, Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, Moves, HurryCostModifier,	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_JFD_JAEGER_DESC'),	('TXT_KEY_JFD_JAEGER_TEXT'),	('TXT_KEY_JFD_JAEGER_STRATEGY'),	('TXT_KEY_JFD_JAEGER_HELP'),	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, ('ART_DEF_UNIT_JFD_JAEGER'),		('UNITS_JFD_JAEGER_FLAG_ATLAS'), 0,					0, 				('JFD_JAEGER_ATLAS'), 	MoveRate
FROM Units WHERE (Type = 'UNIT_RIFLEMAN');

INSERT INTO Units 	
			(Class, Type, 				ShowInPedia,	BaseBeakersTurnsToCount,	PrereqTech, Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, Moves, HurryCostModifier, WorkRate, Domain, DefaultUnitAI,	Description, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfoEraVariation, UnitArtInfo, UnitFlagAtlas, UnitFlagIconOffset, PortraitIndex, IconAtlas,					MoveRate)
SELECT		Class, 	('UNIT_JFD_SS'), 	0,				10,							PrereqTech, Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, Moves, HurryCostModifier, WorkRate, Domain, DefaultUnitAI,	Description, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfoEraVariation, UnitArtInfo, UnitFlagAtlas, UnitFlagIconOffset, 3, 			('JFD_NAZI_GERMANY_ATLAS'), MoveRate
FROM Units WHERE Type = 'UNIT_GREAT_GENERAL';
--------------------------------
-- UnitGameplay2DScripts
--------------------------------	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_WEHRMACHT'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_INFANTRY');	

INSERT OR REPLACE INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_JAEGER'), 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_RIFLEMAN');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 			SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_SS'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_GENERAL');	
--------------------------------
-- Unit_AITypes
--------------------------------	
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_WEHRMACHT'), UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_INFANTRY');	

INSERT OR REPLACE INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_JAEGER'),	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_RIFLEMAN');

INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_SS'), 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GREAT_GENERAL');	
--------------------------------
-- Unit_Flavors
--------------------------------	
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType,	Flavor)
SELECT		('UNIT_JFD_WEHRMACHT'), FlavorType,	Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_INFANTRY');	

INSERT OR REPLACE INTO Unit_Flavors 	
			(UnitType, 				FlavorType,	Flavor)
SELECT		('UNIT_JFD_JAEGER'),	FlavorType,	Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_RIFLEMAN');	

INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType,	Flavor)
SELECT		('UNIT_JFD_SS'), 		FlavorType,	Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREAT_GENERAL');	
--------------------------------
-- Unit_Builds
--------------------------------	
INSERT INTO Unit_Builds 	
			(UnitType, 				BuildType)
SELECT		('UNIT_JFD_SS'), 		BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_GREAT_GENERAL');	
--------------------------------
-- Unit_FreePromotions
--------------------------------	
INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
SELECT		('UNIT_JFD_SS'), 		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_GREAT_GENERAL');	
	
INSERT OR REPLACE INTO Unit_FreePromotions 
			(UnitType, 				PromotionType)
VALUES		('UNIT_JFD_WEHRMACHT', 	'PROMOTION_SPAWN_GENERALS_I'),
			('UNIT_JFD_JAEGER', 	'PROMOTION_JFD_JAEGER'),
			('UNIT_JFD_JAEGER', 	'PROMOTION_SURVIVALISM_1'),
			('UNIT_JFD_JAEGER',		'PROMOTION_SCOUTING_1'),
			('UNIT_GERMAN_PANZER',	'PROMOTION_JFD_PANZER');
--------------------------------
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 				UnitClassType)
SELECT		('UNIT_JFD_WEHRMACHT'), UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_INFANTRY');	

DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_JFD_JAEGER';
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 				UnitClassType)
SELECT		('UNIT_JFD_JAEGER'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_RIFLEMAN');	
--------------------------------
-- Unit_UniqueNames
--------------------------------	
INSERT INTO Unit_UniqueNames 
			(UnitType, 				UniqueName)
VALUES		('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_JULIUS_SCHREK'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_JOSEPH_BERCHTOLD'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_ERHARD_HEIDAN'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_HEINRICH_HIMMLER'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_KARL_HANKE'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_KURT_DALUEGE'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_PAUL_HAUSSER'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_FRAZ_XAVER_SCHWARZ'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_FRIEDRICH_ALPERS'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_MAX_AMANN'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_HERBERT_BACKE'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_GOTTLOB_BERGER'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_WERNER_BEST'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_WILHELM_BITTRICH'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_ERNST_WILHELM_BOHLE'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_MARTIN_BORMANN'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_PHILIPP_BOUHLER'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_FRANZ_BREITHAUPT'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_WALTER_BUCH'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_RICHARD_WALTHER_DARRE'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_KARL_MARIA_DEMELHBUER'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_OTTO_DIETRICH'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_KARL_VON_EBERSTEIN'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_JOACHIM_ALBRECHT_EGGELING'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_THEODOR_EICKE'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_KARL_FIEHLER'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_ALBERT_FORSTER'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_KARL_HERMANN_FRANK'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_AUGUST_FRANK'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_HERBERT_OTTO_GILLE'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_CURT_VON_GOTTBERG'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_ERNST_ROBERT_GRAWITZ'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_ULRICH_GREIFELT');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------
INSERT INTO Civilizations 	
			(Type, 								Description, 						ShortDescription, 							Adjective,							Civilopedia, CivilopediaTag, DefaultPlayerColor,				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,					PortraitIndex, 	AlphaIconAtlas,						SoundtrackTag, 	MapImage,								DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'), 	('TXT_KEY_JFD_NAZI_GERMANY_DESC'), 	('TXT_KEY_JFD_NAZI_GERMANY_SHORT_DESC'),	('TXT_KEY_JFD_NAZI_GERMANY_ADJ'), 	Civilopedia, CivilopediaTag, ('PLAYERCOLOR_JFD_NAZI_GERMANY'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_NAZI_GERMANY_ATLAS'),	0, 				('JFD_NAZI_GERMANY_ALPHA_ATLAS'),	('Germany'), 	('MapNaziGermany512_Uncensored.dds'), 	('TXT_KEY_CIV5_DAWN_JFD_HITLER_TEXT'), 	('DOM_Hitler.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_GERMANY');
--------------------------------
-- Civilization_CityNames
--------------------------------		
INSERT INTO Civilization_CityNames 
			(CivilizationType, 					CityName)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'), 	CityName
FROM Civilization_CityNames WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--------------------------------
-- Civilization_FreeBuildingClasses
--------------------------------		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--------------------------------
-- Civilization_FreeTechs
--------------------------------	
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--------------------------------
-- Civilization_FreeUnits
--------------------------------	
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--------------------------------
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_JFD_NAZI_GERMANY', 	'LEADER_JFD_HITLER');
--------------------------------
-- Civilization_UnitClassOverrides 
--------------------------------	
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_GERMANY' AND UnitType = 'UNIT_GERMAN_PANZER';
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_GERMANY', 			'UNITCLASS_RIFLEMAN', 		'UNIT_JFD_JAEGER'),
			('CIVILIZATION_JFD_NAZI_GERMANY', 	'UNITCLASS_INFANTRY', 		'UNIT_JFD_WEHRMACHT'),
			('CIVILIZATION_JFD_NAZI_GERMANY', 	'UNITCLASS_TANK', 			'UNIT_GERMAN_PANZER');
--------------------------------
-- Civilization_Start_Region_Priority
--------------------------------	
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 					RegionType)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'), 	RegionType
FROM Civilization_Start_Region_Priority WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--------------------------------
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_JFD_NAZI_GERMANY', 	'TXT_KEY_SPY_NAME_JFD_NAZI_0'),
			('CIVILIZATION_JFD_NAZI_GERMANY', 	'TXT_KEY_SPY_NAME_JFD_NAZI_1'),
			('CIVILIZATION_JFD_NAZI_GERMANY', 	'TXT_KEY_SPY_NAME_JFD_NAZI_2'),
			('CIVILIZATION_JFD_NAZI_GERMANY', 	'TXT_KEY_SPY_NAME_JFD_NAZI_3'),
			('CIVILIZATION_JFD_NAZI_GERMANY', 	'TXT_KEY_SPY_NAME_JFD_NAZI_4'),
			('CIVILIZATION_JFD_NAZI_GERMANY', 	'TXT_KEY_SPY_NAME_JFD_NAZI_5'),
			('CIVILIZATION_JFD_NAZI_GERMANY', 	'TXT_KEY_SPY_NAME_JFD_NAZI_6'),
			('CIVILIZATION_JFD_NAZI_GERMANY', 	'TXT_KEY_SPY_NAME_JFD_NAZI_7'),
			('CIVILIZATION_JFD_NAZI_GERMANY', 	'TXT_KEY_SPY_NAME_JFD_NAZI_8'),
			('CIVILIZATION_JFD_NAZI_GERMANY', 	'TXT_KEY_SPY_NAME_JFD_NAZI_9');	
--==========================================================================================================================
--==========================================================================================================================