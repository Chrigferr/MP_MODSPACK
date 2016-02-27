--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_RUSSIA_PUTIN_ATLAS', 				256, 		'JFD_RussiaPutinAtlas_256.dds',			2, 				2),
		('JFD_RUSSIA_PUTIN_ATLAS', 				128, 		'JFD_RussiaPutinAtlas_128.dds',			2, 				2),
		('JFD_RUSSIA_PUTIN_ATLAS', 				80, 		'JFD_RussiaPutinAtlas_80.dds',			2, 				2),
		('JFD_RUSSIA_PUTIN_ATLAS', 				64, 		'JFD_RussiaPutinAtlas_64.dds',			2, 				2),
		('JFD_RUSSIA_PUTIN_ATLAS', 				45, 		'JFD_RussiaPutinAtlas_45.dds',			2, 				2),
		('JFD_RUSSIA_PUTIN_ATLAS', 				32, 		'JFD_RussiaPutinAtlas_32.dds',			2, 				2),
		('JFD_RUSSIA_PUTIN_ALPHA_ATLAS', 		128, 		'JFD_RussiaPutinAlphaAtlas_128.dds',	1,				1),
		('JFD_RUSSIA_PUTIN_ALPHA_ATLAS', 		80, 		'JFD_RussiaPutinAlphaAtlas_80.dds',		1, 				1),
		('JFD_RUSSIA_PUTIN_ALPHA_ATLAS', 		64, 		'JFD_RussiaPutinAlphaAtlas_64.dds',		1, 				1),
		('JFD_RUSSIA_PUTIN_ALPHA_ATLAS', 		48, 		'JFD_RussiaPutinAlphaAtlas_48.dds',		1, 				1),
		('JFD_RUSSIA_PUTIN_ALPHA_ATLAS', 		45, 		'JFD_RussiaPutinAlphaAtlas_45.dds',		1, 				1),
		('JFD_RUSSIA_PUTIN_ALPHA_ATLAS', 		32, 		'JFD_RussiaPutinAlphaAtlas_32.dds',		1, 				1),
		('JFD_RUSSIA_PUTIN_ALPHA_ATLAS', 		24, 		'JFD_RussiaPutinAlphaAtlas_24.dds',		1, 				1),
		('JFD_RUSSIA_PUTIN_ALPHA_ATLAS', 		16, 		'JFD_RussiaPutinAlphaAtlas_16.dds',		1, 				1),
		('JFD_RUSSIA_PUTIN_RESOURCE_ATLAS', 	256, 		'JFD_RussiaPutinResourceAtlas_256.dds',	2, 				2),
		('JFD_RUSSIA_PUTIN_RESOURCE_ATLAS', 	128, 		'JFD_RussiaPutinResourceAtlas_128.dds',	2, 				2),
		('JFD_RUSSIA_PUTIN_RESOURCE_ATLAS', 	80, 		'JFD_RussiaPutinResourceAtlas_80.dds',	2, 				2),
		('JFD_RUSSIA_PUTIN_RESOURCE_ATLAS', 	64, 		'JFD_RussiaPutinResourceAtlas_64.dds',	2, 				2),
		('JFD_RUSSIA_PUTIN_RESOURCE_ATLAS', 	45, 		'JFD_RussiaPutinResourceAtlas_45.dds',	2, 				2),
		('JFD_RUSSIA_PUTIN_RESOURCE_ATLAS', 	32, 		'JFD_RussiaPutinResourceAtlas_32.dds',	2, 				2),
		('JFD_UNIT_FLAG_SPETSNAZ_ATLAS',		32, 		'JFD_SpetsnazUnitFlag_32.dds',			1, 				1);	
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 											Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_RUSSIA_PUTIN_ICON', 			0.560,	0.384,	0,		1),
		('COLOR_PLAYER_JFD_RUSSIA_PUTIN_BACKGROUND',	1,		0.976,	0.921,	1);
------------------------------
-- Font Icons
------------------------------
INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_JFD_VODKA', 	'JFD_VodkaFontIcons_22');
------------------------------
-- IconFontMapping
------------------------------
INSERT INTO IconFontMapping 
		(IconName, 				IconFontTexture,				IconMapping)
VALUES	('ICON_RES_JFD_VODKA', 	'ICON_FONT_TEXTURE_JFD_VODKA',	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 								PrimaryColor, 							SecondaryColor, 								TextColor)
VALUES	('PLAYERCOLOR_JFD_RUSSIA_PUTIN',	'COLOR_PLAYER_JFD_RUSSIA_PUTIN_ICON', 	'COLOR_PLAYER_JFD_RUSSIA_PUTIN_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 			LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_PUTIN_ANTHEM', 		'Putin_Anthem',		'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_PUTIN_ANTHEM_ALT', 	'Putin_AnthemAlt',	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_PUTIN_PEACE', 		'Putin_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_PUTIN_WAR', 			'Putin_War', 		'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 									SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_PUTIN_ANTHEM', 		'SND_LEADER_MUSIC_JFD_PUTIN_ANTHEM', 		'GAME_MUSIC_STINGS', 	0.0,					60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_PUTIN_ANTHEM_ALT', 	'SND_LEADER_MUSIC_JFD_PUTIN_ANTHEM_ALT', 	'GAME_MUSIC_STINGS', 	0.0,					60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_PUTIN_PEACE', 		'SND_LEADER_MUSIC_JFD_PUTIN_PEACE', 		'GAME_MUSIC', 			-1.0,					60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_PUTIN_WAR', 		'SND_LEADER_MUSIC_JFD_PUTIN_WAR', 			'GAME_MUSIC', 			-1.0,					60, 		60, 		1,		 0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,		Asset)
VALUES	('ART_DEF_UNIT_JFD_SPETSNAZ',	'Unit', 		'sv_Spetsnaz.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_SPETSNAZ',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_MARINE';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_JFD_SPETSNAZ', 		'ART_DEF_UNIT_MEMBER_JFD_SPETSNAZ',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_MARINE';
------------------------
-- ArtDefine_UnitMemberCombats
------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_SPETSNAZ',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MARINE';
------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_SPETSNAZ',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MARINE';
------------------------
-- ArtDefine_UnitMemberInfos
------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale,	ZOffset, Domain, Model, 			 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_SPETSNAZ',	Scale,	ZOffset, Domain, 'RussianSF.fxsxml', MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_MARINE';
--==========================================================================================================================	
--==========================================================================================================================	
