--==========================================================================================================================
-- Units
--==========================================================================================================================	
INSERT INTO Units 	
		(Class, 	Type, 					Range,	PrereqTech, Combat, RangedCombat,	Cost, FaithCost, RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 						Strategy, 								Help, 								MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, Mechanized, MoveRate, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,							PortraitIndex, 	IconAtlas)
SELECT	Class,		('UNIT_JFD_CHAR_B1'), 	2,		PrereqTech, Combat, Combat+5,		Cost, FaithCost, RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_CHAR_B1'), 	('TXT_KEY_CIV5_JFD_CHAR_B1_TEXT'), 	('TXT_KEY_UNIT_JFD_CHAR_B1_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_CHAR_B1'), 	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, Mechanized, MoveRate, ('ART_DEF_UNIT_JFD_CHAR_B1'),	0,					('UNITS_JFD_CHAR_B1_FLAG_ART_ATLAS'),	2, 				('JFD_FRANCE_DEGAULLE_ATLAS')
FROM Units WHERE Type = 'UNIT_WWI_TANK';

INSERT INTO Units 	
			(Class, Type, 									ShowInPedia,	BaseCultureTurnsToCount,	PrereqTech, Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, Moves, HurryCostModifier, WorkRate, Domain, DefaultUnitAI,	Description, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfoEraVariation, UnitArtInfo, UnitFlagAtlas, UnitFlagIconOffset, PortraitIndex, IconAtlas, MoveRate)
SELECT		Class, 	('UNIT_JFD_GREAT_GENERAL_DEGAULLE'), 	0,				12,							PrereqTech, Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, Moves, HurryCostModifier, WorkRate, Domain, DefaultUnitAI,	Description, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfoEraVariation, UnitArtInfo, UnitFlagAtlas, UnitFlagIconOffset, PortraitIndex, IconAtlas, MoveRate
FROM Units WHERE Type = 'UNIT_GREAT_GENERAL';
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_CHAR_B1'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_WWI_TANK';	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 								SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_GREAT_GENERAL_DEGAULLE'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GREAT_GENERAL';	
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================	
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_CHAR_B1'), 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_WWI_TANK';	

INSERT INTO Unit_AITypes 	
			(UnitType, 								UnitAIType)
SELECT		('UNIT_JFD_GREAT_GENERAL_DEGAULLE'), 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GREAT_GENERAL';	
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 				UnitClassType)
SELECT		('UNIT_JFD_CHAR_B1'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_WWI_TANK';	
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================	
INSERT INTO Unit_Builds 	
			(UnitType, 								BuildType)
SELECT		('UNIT_JFD_GREAT_GENERAL_DEGAULLE'), 	BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_GREAT_GENERAL';	
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================	
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		('UNIT_JFD_CHAR_B1'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_WWI_TANK';	

INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType,			Flavor)
VALUES		('UNIT_JFD_CHAR_B1',	'FLAVOR_RANGED',	5);

INSERT INTO Unit_Flavors 	
			(UnitType, 								FlavorType, Flavor)
SELECT		('UNIT_JFD_GREAT_GENERAL_DEGAULLE'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GREAT_GENERAL';	
--==========================================================================================================================
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================	
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 				ResourceType, Cost)
SELECT		('UNIT_JFD_CHAR_B1'), 	ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_WWI_TANK';	
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================	
INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
SELECT		('UNIT_JFD_CHAR_B1'), 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_WWI_TANK';	

INSERT INTO Unit_FreePromotions 	
			(UnitType, 								PromotionType)
SELECT		('UNIT_JFD_GREAT_GENERAL_DEGAULLE'), 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GREAT_GENERAL';	

INSERT INTO Unit_FreePromotions 	
			(UnitType, 								PromotionType)
VALUES		('UNIT_JFD_CHAR_B1', 					'PROMOTION_JFD_CHAR_B1'),	
			('UNIT_JFD_GREAT_GENERAL_DEGAULLE', 	'PROMOTION_JFD_AMPHIBIOUS');
--==========================================================================================================================	
--==========================================================================================================================				
		
			