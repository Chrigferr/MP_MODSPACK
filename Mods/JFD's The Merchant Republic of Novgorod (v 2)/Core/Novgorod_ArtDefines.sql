--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_NOVGOROD_ATLAS', 					256, 		'JFD_NovgorodAtlas_256.dds',		2, 				2),
		('JFD_NOVGOROD_ATLAS', 					128, 		'JFD_NovgorodAtlas_128.dds',		2, 				2),
		('JFD_NOVGOROD_ATLAS', 					80, 		'JFD_NovgorodAtlas_80.dds',			2, 				2),
		('JFD_NOVGOROD_ATLAS', 					64, 		'JFD_NovgorodAtlas_64.dds',			2, 				2),
		('JFD_NOVGOROD_ATLAS', 					45, 		'JFD_NovgorodAtlas_45.dds',			2, 				2),
		('JFD_NOVGOROD_ATLAS', 					32, 		'JFD_NovgorodAtlas_32.dds',			2, 				2),
		('JFD_NOVGOROD_ALPHA_ATLAS', 			128, 		'JFD_NovgorodAlphaAtlas_128.dds',	1, 				1),
		('JFD_NOVGOROD_ALPHA_ATLAS', 			80, 		'JFD_NovgorodAlphaAtlas_80.dds',	1, 				1),
		('JFD_NOVGOROD_ALPHA_ATLAS', 			64, 		'JFD_NovgorodAlphaAtlas_64.dds',	1, 				1),
		('JFD_NOVGOROD_ALPHA_ATLAS', 			48, 		'JFD_NovgorodAlphaAtlas_48.dds',	1, 				1),
		('JFD_NOVGOROD_ALPHA_ATLAS', 			45, 		'JFD_NovgorodAlphaAtlas_45.dds',	1, 				1),
		('JFD_NOVGOROD_ALPHA_ATLAS', 			32, 		'JFD_NovgorodAlphaAtlas_32.dds',	1, 				1),
		('JFD_NOVGOROD_ALPHA_ATLAS', 			24, 		'JFD_NovgorodAlphaAtlas_24.dds',	1, 				1),
		('JFD_NOVGOROD_ALPHA_ATLAS', 			16, 		'JFD_NovgorodAlphaAtlas_16.dds',	1, 				1),
		('JFD_UNIT_FLAG_BOYAR_ATLAS', 			32, 		'JFD_BoyarUnitFlag_32.dds',			1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_NOVGOROD_ICON', 			0.015, 	0.160,	0.313, 	1),
		('COLOR_PLAYER_JFD_NOVGOROD_BACKGROUND',	0.678,	0.552,	0.223, 	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 							PrimaryColor, 						SecondaryColor, 						TextColor)
VALUES	('PLAYERCOLOR_JFD_NOVGOROD', 	'COLOR_PLAYER_JFD_NOVGOROD_ICON', 	'COLOR_PLAYER_JFD_NOVGOROD_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 			LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_NEVSKY_PEACE', 		'Nevsky_Peace', 	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_NEVSKY_WAR', 		'Nevsky_War', 		'DynamicResident');	
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 								SoundType, 		MinVolume, 	MaxVolume,  IsMusic,	Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_NEVSKY_AMBIENCE', 	'SND_AMBIENCE_FOG_OF_WAR_BED', 			'GAME_SFX', 	60, 		60, 		0,			1),
		('AS2D_LEADER_MUSIC_JFD_NEVSKY_PEACE',		'SND_LEADER_MUSIC_JFD_NEVSKY_PEACE',	'GAME_MUSIC',	120, 		120, 		1, 			0),
		('AS2D_LEADER_MUSIC_JFD_NEVSKY_WAR', 		'SND_LEADER_MUSIC_JFD_NEVSKY_WAR', 		'GAME_MUSIC',	120, 		120, 		1,			0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		TileType,		Asset)
VALUES	('ART_DEF_UNIT_JFD_BOYAR', 	'Unit', 		'sv_Boyar.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
		(Type, 						DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_BOYAR',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_GENERAL_KHAN';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,				UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_JFD_BOYAR',	'ART_DEF_UNIT_MEMBER_JFD_BOYAR',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_GENERAL_KHAN';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_BOYAR',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN';
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_BOYAR',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN';
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_BOYAR',	Scale,	ZOffset, Domain, 'Knight_Russia.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN';
--==========================================================================================================================	
--==========================================================================================================================	
