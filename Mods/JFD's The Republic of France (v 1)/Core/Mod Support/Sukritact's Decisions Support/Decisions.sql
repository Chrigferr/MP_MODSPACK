--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_FranceDeGaulleDecisions.lua');
--==========================================================================================================================
-- Policies
--==========================================================================================================================	
INSERT INTO Policies 	
			(Type, 							Description)
VALUES		('POLICY_JFD_FOREIGN_LEGION',	'TXT_KEY_DECISIONS_JFD_FRANCE_DEGAULLE_FOREIGN_LEGION');
--==========================================================================================================================
-- UnitClasses
--==========================================================================================================================
INSERT INTO UnitClasses	
			(Type,								Description,							DefaultUnit)
VALUES		('UNITCLASS_JFD_FOREIGN_LEGION',	'TXT_KEY_UNIT_FRENCH_FOREIGNLEGION',	'UNIT_JFD_FOREIGN_LEGION'),
			('UNITCLASS_JFD_FOREIGN_LEGION_L',	'TXT_KEY_UNIT_FRENCH_FOREIGNLEGION',	'UNIT_JFD_FOREIGN_LEGION_L');
--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Type, 							PolicyType,						Class,								ShowInPedia,	Combat,		Cost,		Moves, FaithCost,		RequiresFaithPurchaseEnabled, CombatClass, Domain, 	DefaultUnitAI, 	Description, 	Civilopedia, 	Help, 	Strategy, Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, ObsoleteTech, AdvancedStartCost, Pillage, IgnoreBuildingDefense, UnitArtInfo,	UnitFlagIconOffset,	UnitFlagAtlas,	MoveRate,	PortraitIndex, 	IconAtlas)
SELECT		('UNIT_JFD_FOREIGN_LEGION'),	('POLICY_JFD_FOREIGN_LEGION'),	('UNITCLASS_JFD_FOREIGN_LEGION'),	0,				Combat+2,	Cost-40,	Moves, FaithCost-80,	RequiresFaithPurchaseEnabled, CombatClass, Domain,	DefaultUnitAI,  Description, 	Civilopedia, 	Help, 	Strategy, Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, ObsoleteTech, AdvancedStartCost, Pillage, IgnoreBuildingDefense, UnitArtInfo, UnitFlagIconOffset,	UnitFlagAtlas,	MoveRate,	PortraitIndex, 	IconAtlas
FROM Units WHERE Type = 'UNIT_FRENCH_FOREIGNLEGION';	

INSERT INTO Units 	
			(Type, 							PolicyType,						Class,								ShowInPedia,	Combat,		Cost,		Moves, FaithCost,		RequiresFaithPurchaseEnabled, CombatClass, Domain, 	DefaultUnitAI, 	Description, 							Civilopedia, 	Help, 									Strategy,										Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, UnitArtInfo,								UnitFlagIconOffset,	UnitFlagAtlas,	MoveRate,	PortraitIndex, 	IconAtlas)
SELECT		('UNIT_JFD_FOREIGN_LEGION_L'),	('POLICY_JFD_FOREIGN_LEGION'),	('UNITCLASS_JFD_FOREIGN_LEGION_L'),	0,				Combat-10,	Cost-30,	Moves, FaithCost-60,	RequiresFaithPurchaseEnabled, CombatClass, Domain,	DefaultUnitAI,  ('TXT_KEY_UNIT_FRENCH_FOREIGNLEGION'), 	Civilopedia, 	('TXT_KEY_UNIT_HELP_FOREIGN_LEGION'), 	('TXT_KEY_UNIT_FRENCH_FOREIGNLEGION_STRATEGY'), Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, ('ART_DEF_UNIT_U_FRENCH_FOREIGNLEGION'),   55,					UnitFlagAtlas,	MoveRate,	38, 			('UNIT_ATLAS_2')
FROM Units WHERE Type = 'UNIT_INFANTRY';	

INSERT INTO Units 	
			(Type, 							PrereqTech, Class, Capture, Cost,	Moves, CivilianAttackPriority, Domain, ShowInPedia, 	DefaultUnitAI,	Description, Civilopedia, Help, Strategy, AdvancedStartCost, WorkRate, 	CombatLimit, UnitArtInfo, UnitArtInfoEraVariation, UnitFlagIconOffset, PortraitIndex, IconAtlas)
SELECT		('UNIT_JFD_FRENCH_WORKER'),		PrereqTech, Class, Capture, -1,		Moves, CivilianAttackPriority, Domain, 0,				DefaultUnitAI,	Description, Civilopedia, Help, Strategy, AdvancedStartCost, 1,			CombatLimit, UnitArtInfo, UnitArtInfoEraVariation, UnitFlagIconOffset, PortraitIndex, IconAtlas
FROM Units WHERE Type = 'UNIT_WORKER';
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_FOREIGN_LEGION'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_FRENCH_FOREIGNLEGION';

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_FOREIGN_LEGION_L'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_FRENCH_FOREIGNLEGION';

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_FRENCH_WORKER'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_WORKER';
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_FOREIGN_LEGION'), 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_FRENCH_FOREIGNLEGION';

INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_FOREIGN_LEGION_L'), 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_FRENCH_FOREIGNLEGION';

INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_FRENCH_WORKER'), 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_WORKER';
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_FOREIGN_LEGION'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_FRENCH_FOREIGNLEGION';

INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_FOREIGN_LEGION_L'), 	FlavorType, Flavor

FROM Unit_Flavors WHERE UnitType = 'UNIT_FRENCH_FOREIGNLEGION';
INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_FRENCH_WORKER'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_WORKER';
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================
INSERT INTO Unit_Builds 	
			(UnitType, 						BuildType)
VALUES		('UNIT_JFD_FRENCH_WORKER', 		'BUILD_CITADEL');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
			(UnitType, 						PromotionType)
SELECT		('UNIT_JFD_FOREIGN_LEGION'), 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_FRENCH_FOREIGNLEGION';

INSERT INTO Unit_FreePromotions 	
			(UnitType, 						PromotionType)
SELECT		('UNIT_JFD_FOREIGN_LEGION_L'), 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_FRENCH_FOREIGNLEGION';
--==========================================================================================================================
--==========================================================================================================================	
			

