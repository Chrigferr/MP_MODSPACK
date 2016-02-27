--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
INSERT OR REPLACE INTO UnitPromotions 
			(Type, 							Description, 							Help, 										Sound, 				Amphib, River,  DefenseMod, ExperiencePercent,	VisibilityChange,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_CAFE',			'TXT_KEY_PROMOTION_JFD_CAFE',			'TXT_KEY_PROMOTION_JFD_CAFE_HELP', 			'AS2D_IF_LEVELUP', 	0,		0,		20,			10,					1,					1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_CAFE'),
			('PROMOTION_JFD_CHAR_B1',		'TXT_KEY_PROMOTION_JFD_CHAR_B1',		'TXT_KEY_PROMOTION_JFD_CHAR_B1_HELP', 		'AS2D_IF_LEVELUP', 	0,		0,		20,			0,					0,					1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_CHAR_B1'),
			('PROMOTION_JFD_AMPHIBIOUS',	'TXT_KEY_PROMOTION_AMPHIBIOUS',			'TXT_KEY_PROMOTION_AMPHIBIOUS_HELP', 		'AS2D_IF_LEVELUP', 	1,		1,		0,			0,					0,					1, 				5, 				'PROMOTION_ATLAS', 	'PEDIA_NAVAL',		'TXT_KEY_PROMOTION_AMPHIBIOUS');
--==========================================================================================================================
--==========================================================================================================================
