--==========================================================================================================================
-- Builds
--==========================================================================================================================
INSERT INTO Builds
			(Type,									PrereqTech,					ImprovementType, 								Time,	Recommendation,										Description,								Help,												CtrlDown,	OrderPriority,	IconIndex,	IconAtlas,									HotKey, EntityEvent)
VALUES		('BUILD_JFD_ENCAMPMENT',				null,						'IMPROVEMENT_JFD_ENCAMPMENT',					1000,	'TXT_KEY_BUILD_JFD_ENCAMPMENT_REC',					'TXT_KEY_JFD_ENCAMPMENT',					'TXT_KEY_BUILD_JFD_ENCAMPMENT_HELP',				1,			96,				0,			'JFD_UNIT_ACTION_ENCAMPMENT_ATLAS',			'KB_F',	'ENTITY_EVENT_BUILD'),
			('BUILD_JFD_ENCAMPMENT_UPGRADE_DEER',	'TECH_GUILDS',				'IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_DEER',		1100,	'TXT_KEY_BUILD_JFD_ENCAMPMENT_UPGRADED_DEER_REC',	'TXT_KEY_JFD_ENCAMPMENT_UPGRADED_DEER',		'TXT_KEY_BUILD_JFD_ENCAMPMENT_UPGRADED_DEER_HELP',	1,			96,				0,			'JFD_UNIT_ACTION_ENCAMPMENT_GOLD_ATLAS',	'KB_F',	'ENTITY_EVENT_BUILD'),
			('BUILD_JFD_ENCAMPMENT_UPGRADE_HORSE',	'TECH_CIVIL_SERVICE',		'IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_HORSE',	1500,	'TXT_KEY_BUILD_JFD_ENCAMPMENT_UPGRADED_HORSE_REC',	'TXT_KEY_JFD_ENCAMPMENT_UPGRADED_HORSE',	'TXT_KEY_BUILD_JFD_ENCAMPMENT_UPGRADED_HORSE_HELP',	1,			96,				0,			'JFD_UNIT_ACTION_ENCAMPMENT_GOLD_ATLAS',	'KB_F',	'ENTITY_EVENT_BUILD'),
			('BUILD_JFD_ENCAMPMENT_UPGRADE_IRON',	'TECH_METAL_CASTING',		'IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_IRON',		1300,	'TXT_KEY_BUILD_JFD_ENCAMPMENT_UPGRADED_IRON_REC',	'TXT_KEY_JFD_ENCAMPMENT_UPGRADED_IRON',		'TXT_KEY_BUILD_JFD_ENCAMPMENT_UPGRADED_IRON_HELP',	1,			96,				0,			'JFD_UNIT_ACTION_ENCAMPMENT_GOLD_ATLAS',	'KB_F',	'ENTITY_EVENT_BUILD');			
--==========================================================================================================================
--==========================================================================================================================