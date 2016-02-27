--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
INSERT INTO UnitPromotions 
			(Type, 								Description, 								Help, 												Sound, 				CannotBeChosen, LostWithUpgrade, PortraitIndex, IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_GOEDENDAG', 		'TXT_KEY_PROMOTION_JFD_GOEDENDAG',			'TXT_KEY_PROMOTION_JFD_GOEDENDAG_HELP',				'AS2D_IF_LEVELUP', 	1, 				0, 				 59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_GOEDENDAG'),
			('PROMOTION_JFD_FLANDERS_MILITIA', 	'TXT_KEY_PROMOTION_JFD_FLANDERS_MILITIA', 	'TXT_KEY_PROMOTION_JFD_FLANDERS_MILITIA_HELP',		'AS2D_IF_LEVELUP', 	1, 				1, 				 59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_FLANDERS_MILITIA');
--==========================================================================================================================
-- UnitPromotions_UnitCombatMods
--==========================================================================================================================	
INSERT INTO	UnitPromotions_UnitCombatMods
			(PromotionType,				UnitCombatType,		Modifier)
VALUES		('PROMOTION_JFD_GOEDENDAG',	'UNITCOMBAT_MELEE', 25);
--==========================================================================================================================	
--==========================================================================================================================		

