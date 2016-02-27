--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leader_Flavors
--------------------------------						
UPDATE Leader_Flavors
SET Flavor = 8
WHERE LeaderType = 'LEADER_ELIZABETH' AND FlavorType = 'FLAVOR_HAPPINESS';
--------------------------------	
-- Leader_Traits
--------------------------------	
UPDATE Leader_Traits 
SET TraitType = 'TRAIT_JFD_ENGLAND'
WHERE LeaderType = 'LEADER_ELIZABETH'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CIVILIZATIONS_ENGLAND_UA' AND Value = 1);	
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 					Description, 						ShortDescription)
VALUES	('TRAIT_JFD_ENGLAND', 	'TXT_KEY_TRAIT_JFD_ENGLAND',		'TXT_KEY_TRAIT_JFD_ENGLAND_SHORT');
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 								ExtraNavalMovement, ExperiencePercent,  HealOutsideFriendly,	Description, 									Help, 												Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_ENGLAND', 			2,					0,					1,						'TXT_KEY_PROMOTION_JFD_ENGLAND',				'TXT_KEY_PROMOTION_JFD_ENGLAND_HELP',				'AS2D_IF_LEVELUP', 	1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_ENGLAND'),
		('PROMOTION_JFD_GRAND_CARRACK', 	0,					30,					0,						'TXT_KEY_PROMOTION_JFD_GRAND_CARRACK',			'TXT_KEY_PROMOTION_JFD_GRAND_CARRACK_HELP',			'AS2D_IF_LEVELUP', 	1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_GRAND_CARRACK');
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
		(Type, 						Class, PrereqTech, RangedCombat,	Range, Special, Combat,		Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 							Strategy, 									Help, 									Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 						UnitFlagIconOffset, UnitFlagAtlas,							PortraitIndex, 	IconAtlas,					MoveRate)
SELECT	'UNIT_JFD_GRAND_CARRACK',	Class, PrereqTech, RangedCombat+2,	Range, Special, Combat+1,	Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_GRAND_CARRACK',	'TXT_KEY_CIV5_JFD_GRAND_CARRACK_TEXT', 	'TXT_KEY_UNIT_JFD_GRAND_CARRACK_STRATEGY',	'TXT_KEY_UNIT_HELP_JFD_GRAND_CARRACK',  Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_JFD_GRAND_CARRACK',	0,					'JFD_UNIT_FLAG_GRAND_CARRACK_ATLAS',	2, 				'JFD_GREAT_BRITAIN_ATLAS',	MoveRate
FROM Units WHERE Type = 'UNIT_GALLEASS';

INSERT INTO Units 	
		(Type, 						Class, ShowInPedia,	GoldenAgeTurns, CivilianAttackPriority, Special, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Domain, DefaultUnitAI, Description, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate)
SELECT	'UNIT_JFD_ENGLAND_ADMIRAL', Class, 0,			8,				CivilianAttackPriority, Special, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Domain, DefaultUnitAI, Description, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate
FROM Units WHERE Type = 'UNIT_GREAT_ADMIRAL';
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_GRAND_CARRACK', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GALLEASS';	

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_ENGLAND_ADMIRAL', SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GREAT_ADMIRAL';	
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_GRAND_CARRACK',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GALLEASS';

INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_ENGLAND_ADMIRAL', UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GREAT_ADMIRAL';
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_JFD_GRAND_CARRACK',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_GALLEASS';	
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_GRAND_CARRACK', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GALLEASS';

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_ENGLAND_ADMIRAL', FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GREAT_ADMIRAL';
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions
		(UnitType, 					PromotionType)
VALUES	('UNIT_JFD_GRAND_CARRACK', 	'PROMOTION_ONLY_DEFENSIVE'),
		('UNIT_JFD_GRAND_CARRACK', 	'PROMOTION_JFD_GRAND_CARRACK');
--------------------------------
-- Unit_UniqueNames
--------------------------------
INSERT INTO Unit_UniqueNames 	
		(UnitType, 					 UniqueName)
VALUES	('UNIT_JFD_ENGLAND_ADMIRAL', 'TXT_KEY_GREAT_PERSON_JFD_ENGLAND_ADMIRAL_1'),
		('UNIT_JFD_ENGLAND_ADMIRAL', 'TXT_KEY_GREAT_PERSON_JFD_ENGLAND_ADMIRAL_2'),
		('UNIT_JFD_ENGLAND_ADMIRAL', 'TXT_KEY_GREAT_PERSON_JFD_ENGLAND_ADMIRAL_3'),
		('UNIT_JFD_ENGLAND_ADMIRAL', 'TXT_KEY_GREAT_PERSON_JFD_ENGLAND_ADMIRAL_4'),
		('UNIT_JFD_ENGLAND_ADMIRAL', 'TXT_KEY_GREAT_PERSON_JFD_ENGLAND_ADMIRAL_5'),
		('UNIT_JFD_ENGLAND_ADMIRAL', 'TXT_KEY_GREAT_PERSON_JFD_ENGLAND_ADMIRAL_6'),
		('UNIT_JFD_ENGLAND_ADMIRAL', 'TXT_KEY_GREAT_PERSON_JFD_ENGLAND_ADMIRAL_7'),
		('UNIT_JFD_ENGLAND_ADMIRAL', 'TXT_KEY_GREAT_PERSON_JFD_ENGLAND_ADMIRAL_8'),
		('UNIT_JFD_ENGLAND_ADMIRAL', 'TXT_KEY_GREAT_PERSON_JFD_ENGLAND_ADMIRAL_9'),
		('UNIT_JFD_ENGLAND_ADMIRAL', 'TXT_KEY_GREAT_PERSON_JFD_ENGLAND_ADMIRAL_10'),
		('UNIT_JFD_ENGLAND_ADMIRAL', 'TXT_KEY_GREAT_PERSON_JFD_ENGLAND_ADMIRAL_11'),
		('UNIT_JFD_ENGLAND_ADMIRAL', 'TXT_KEY_GREAT_PERSON_JFD_ENGLAND_ADMIRAL_12'),
		('UNIT_JFD_ENGLAND_ADMIRAL', 'TXT_KEY_GREAT_PERSON_JFD_ENGLAND_ADMIRAL_13'),
		('UNIT_JFD_ENGLAND_ADMIRAL', 'TXT_KEY_GREAT_PERSON_JFD_ENGLAND_ADMIRAL_14'),
		('UNIT_JFD_ENGLAND_ADMIRAL', 'TXT_KEY_GREAT_PERSON_JFD_ENGLAND_ADMIRAL_15'),
		('UNIT_JFD_ENGLAND_ADMIRAL', 'TXT_KEY_GREAT_PERSON_JFD_ENGLAND_ADMIRAL_16'),
		('UNIT_JFD_ENGLAND_ADMIRAL', 'TXT_KEY_GREAT_PERSON_JFD_ENGLAND_ADMIRAL_17'),
		('UNIT_JFD_ENGLAND_ADMIRAL', 'TXT_KEY_GREAT_PERSON_JFD_ENGLAND_ADMIRAL_18'),
		('UNIT_JFD_ENGLAND_ADMIRAL', 'TXT_KEY_GREAT_PERSON_JFD_ENGLAND_ADMIRAL_19'),
		('UNIT_JFD_ENGLAND_ADMIRAL', 'TXT_KEY_GREAT_PERSON_JFD_ENGLAND_ADMIRAL_20');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
UPDATE Civilizations
SET	DerivativeCiv = 'CIVILIZATION_JFD_GREAT_BRITAIN', DefaultPlayerColor = 'PLAYERCOLOR_JFD_ENGLAND', PortraitIndex = 0, AlphaIconAtlas = 'JFD_GREAT_BRITAIN_ALPHA_ATLAS', IconAtlas = 'JFD_GREAT_BRITAIN_ATLAS' 
WHERE Type = 'CIVILIZATION_ENGLAND';
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
		(CivilizationType, 		 CityName)
VALUES	('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_LONDON'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_1'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_2'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_3'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_4'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_5'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_6'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_7'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_8'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_9'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_10'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_11'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_12'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_13'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_14'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_15'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_16'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_17'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_18'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_19'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_20'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_21'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_22'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_23'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_24'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_25'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_26'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_27'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_28'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_29'),
		('CIVILIZATION_ENGLAND', 'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_ENGLAND_30');
--------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------	
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_ENGLAND' AND NOT UnitType IN ('UNIT_ENGLISH_LONGBOWMAN');
INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, 			UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_ENGLAND', 	'UNITCLASS_GALLEASS',	'UNIT_JFD_GRAND_CARRACK');
--==========================================================================================================================
--==========================================================================================================================