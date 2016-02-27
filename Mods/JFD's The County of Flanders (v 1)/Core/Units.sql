--==========================================================================================================================
-- Units
--==========================================================================================================================	
INSERT INTO Units 	
			(Class,	Type, 					PrereqTech, Combat, FaithCost, RequiresFaithPurchaseEnabled, Cost,	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 										Strategy, 									Help, 									MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 					UnitFlagAtlas, 						UnitFlagIconOffset, PortraitIndex,	IconAtlas)
SELECT		Class,	('UNIT_JFD_GOEDENDAG'), PrereqTech, Combat, FaithCost, RequiresFaithPurchaseEnabled, Cost, 	Moves, 	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_GOEDENDAG'), 	('TXT_KEY_CIVILOPEDIA_UNITS_JFD_GOEDENDAG_TEXT'),	('TXT_KEY_UNIT_JFD_GOEDENDAG_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_GOEDENDAG'),	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, ('ART_DEF_UNIT_JFD_GOEDENDAG'), 	('JFD_UNIT_FLAG_GOEDENDAG_ATLAS'),	0,					2, 				('JFD_FLANDERS_ATLAS')
FROM Units WHERE Type = 'UNIT_PIKEMAN';
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_GOEDENDAG'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_PIKEMAN';	
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================	
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_JFD_GOEDENDAG'),		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_PIKEMAN';
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================	
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_GOEDENDAG'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_PIKEMAN';
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================	
INSERT INTO Unit_FreePromotions 	
			(UnitType, 					PromotionType)
SELECT		('UNIT_JFD_GOEDENDAG'),		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_PIKEMAN';

INSERT INTO Unit_FreePromotions 	
			(UnitType, 					PromotionType)
VALUES		('UNIT_JFD_GOEDENDAG',		'PROMOTION_JFD_GOEDENDAG');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 					UnitClassType)
SELECT		('UNIT_JFD_GOEDENDAG'),		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_PIKEMAN';
--==========================================================================================================================	
--==========================================================================================================================	