--==========================================================================================================================
-- Units
--==========================================================================================================================	
INSERT INTO Units 	
			(Class,	Type, 					SpreadReligion, ReligiousStrength,	ReligionSpreads,	Cost, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, BaseGold, NumGoldPerEra, WorkRate, Description, 					Civilopedia, 						Strategy, 								Help, 								MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas,			MoveRate)
SELECT		Class,	('UNIT_JFD_MBURICHI'),	1,				1000,				2,					Cost, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, BaseGold, NumGoldPerEra, WorkRate, ('TXT_KEY_UNIT_JFD_MBURICHI'), 	('TXT_KEY_CIV5_JFD_MBURICHI_TEXT'), ('TXT_KEY_UNIT_JFD_MBURICHI_STRATEGY'), ('TXT_KEY_UNIT_HELP_JFD_MBURICHI'), MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, ('ART_DEF_UNIT_JFD_MBURICHI'),	0,					('JFD_UNIT_FLAG_MBURICHI_ATLAS'),	2, 				('JFD_NRI_ATLAS'),	MoveRate
FROM Units WHERE Type = 'UNIT_MERCHANT';
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_MBURICHI'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MERCHANT';
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================	
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_MBURICHI'), 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MERCHANT';
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================	
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		('UNIT_JFD_MBURICHI'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MERCHANT';
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================	
INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
SELECT		('UNIT_JFD_MBURICHI'), 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MERCHANT';

INSERT INTO Unit_FreePromotions
			(UnitType,				PromotionType)
VALUES		('UNIT_JFD_MBURICHI',	'PROMOTION_JFD_MBUIRICHI');
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================	
INSERT INTO Unit_Builds 	
			(UnitType, 				BuildType)
SELECT		('UNIT_JFD_MBURICHI'), 	BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_MERCHANT';
--==========================================================================================================================	
--==========================================================================================================================	