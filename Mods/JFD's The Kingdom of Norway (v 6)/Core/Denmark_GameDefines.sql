--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT OR REPLACE INTO UnitPromotions 
		(Type, 						Description, 						Help, 									Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_LONGBOAT', 	'TXT_KEY_PROMOTION_JFD_LONGBOAT', 	'TXT_KEY_PROMOTION_JFD_LONGBOAT_HELP',	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_LONGBOAT');
---==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT OR REPLACE INTO Units 	
		(Type, 					Class, PrereqTech,		Cost,	 Moves, Combat,		RangedCombat,	Range,	CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 						Strategy, 								Help, 								MilitarySupport, MilitaryProduction, Pillage, Mechanized, ObsoleteTech, AdvancedStartCost, XPValueAttack, MinAreaSize, XPValueDefense, UnitArtInfo, 				UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas, 			MoveRate)
SELECT	'UNIT_JFD_LONGBOAT', 	Class, 'TECH_OPTICS',	Cost-20, Moves, Combat-4,	RangedCombat-4,	Range,	CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_LONGBOAT', 	'TXT_KEY_UNIT_JFD_LONGBOAT_TEXT',	'TXT_KEY_UNIT_JFD_LONGBOAT_STRATEGY',	'TXT_KEY_UNIT_JFD_LONGBOAT_HELP',	MilitarySupport, MilitaryProduction, Pillage, Mechanized, ObsoleteTech, AdvancedStartCost, XPValueAttack, MinAreaSize, XPValueDefense, 'ART_DEF_UNIT_JFD_LONGBOAT',	0,					'JFD_UNIT_FLAG_LONGBOAT_ATLAS', 	4, 				'JFD_NORWAY_ATLAS',	MoveRate
FROM Units WHERE Type = 'UNIT_GALLEASS';
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
DELETE FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_JFD_LONGBOAT';	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_LONGBOAT', 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GALLEASS';
--------------------------------
-- Unit_AITypes
--------------------------------	
DELETE FROM Unit_AITypes WHERE UnitType = 'UNIT_JFD_LONGBOAT';	
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_LONGBOAT', 		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GALLEASS';
--------------------------------
-- Unit_Flavors
--------------------------------	
DELETE FROM Unit_Flavors WHERE UnitType = 'UNIT_JFD_LONGBOAT';	
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_LONGBOAT', 		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GALLEASS';
--------------------------------
-- Unit_FreePromotions
--------------------------------	
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_JFD_LONGBOAT';	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_LONGBOAT', 		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GALLEASS';
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_JFD_LONGBOAT' AND PromotionType = 'PROMOTION_OCEAN_IMPASSABLE';

INSERT INTO Unit_FreePromotions 
		(UnitType, 					PromotionType)
VALUES	('UNIT_JFD_LONGBOAT', 		'PROMOTION_COASTAL_RAIDER_1'),
		('UNIT_JFD_LONGBOAT', 		'PROMOTION_JFD_LONGBOAT');
--------------------------------
-- Unit_ClassUpgrades
--------------------------------	
DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_JFD_LONGBOAT';	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_JFD_LONGBOAT',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_GALLEASS';		
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilization_UnitClassOverrides
--------------------------------	
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_DENMARK';
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				UnitClassType, 					UnitType)
VALUES	('CIVILIZATION_DENMARK', 		'UNITCLASS_LONGSWORDSMAN', 		'UNIT_DANISH_BERSERKER'),
		('CIVILIZATION_DENMARK', 		'UNITCLASS_GALLEASS', 			'UNIT_JFD_LONGBOAT');
--==========================================================================================================================
--==========================================================================================================================