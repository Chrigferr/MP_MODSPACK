--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT OR REPLACE INTO UnitPromotions 
			(Type, 						Description, 						Help, 									Sound, 				ExperiencePercent, 	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_JAEGER',	'TXT_KEY_PROMOTION_JFD_JAEGER',		'TXT_KEY_PROMOTION_JFD_JAEGER_HELP', 	'AS2D_IF_LEVELUP',	15,					1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_JAEGER');
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
INSERT OR REPLACE INTO Units 	
			(Class, Type, 					PrereqTech, Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, Moves, HurryCostModifier,	CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 					Strategy, 							Help, 							MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 					UnitFlagAtlas, 					UnitFlagIconOffset, PortraitIndex, 	IconAtlas, 				MoveRate)
SELECT		Class, 	('UNIT_JFD_JAEGER'),	PrereqTech, Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, Moves, HurryCostModifier,	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_JFD_JAEGER_DESC'),	('TXT_KEY_JFD_JAEGER_TEXT'),	('TXT_KEY_JFD_JAEGER_STRATEGY'),	('TXT_KEY_JFD_JAEGER_HELP'),	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, ('ART_DEF_UNIT_JFD_JAEGER'),		('UNITS_JFD_JAEGER_FLAG_ATLAS'), 0,					0, 				('JFD_JAEGER_ATLAS'), 	MoveRate
FROM Units WHERE (Type = 'UNIT_RIFLEMAN');;
--------------------------------
-- UnitGameplay2DScripts
--------------------------------	
INSERT OR REPLACE INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_JAEGER'), 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_RIFLEMAN');	
--------------------------------
-- Unit_AITypes
--------------------------------	
INSERT OR REPLACE INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_JAEGER'),	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_RIFLEMAN');	
--------------------------------
-- Unit_Flavors
--------------------------------	
INSERT OR REPLACE INTO Unit_Flavors 	
			(UnitType, 				FlavorType,	Flavor)
SELECT		('UNIT_JFD_JAEGER'),	FlavorType,	Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_RIFLEMAN');		
--------------------------------
-- Unit_FreePromotions
--------------------------------	
INSERT OR REPLACE INTO Unit_FreePromotions 
			(UnitType, 				PromotionType)
VALUES		('UNIT_JFD_JAEGER', 	'PROMOTION_JFD_JAEGER'),
			('UNIT_JFD_JAEGER', 	'PROMOTION_SURVIVALISM_1'),
			('UNIT_JFD_JAEGER',		'PROMOTION_SCOUTING_1');
--------------------------------
-- Unit_ClassUpgrades
--------------------------------	
DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_JFD_JAEGER';
INSERT OR REPLACE INTO Unit_ClassUpgrades 	
			(UnitType, 				UnitClassType)
SELECT		('UNIT_JFD_JAEGER'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_RIFLEMAN');	
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--------------------------------	
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_GERMANY' AND UnitType = 'UNIT_GERMAN_PANZER';
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_GERMANY', 			'UNITCLASS_RIFLEMAN', 		'UNIT_JFD_JAEGER');
--==========================================================================================================================
--==========================================================================================================================