--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_SAXONY_ATLAS', 						256, 		'JFD_SaxonyAtlas_256.dds',				2, 				2),
		('JFD_SAXONY_ATLAS', 						128, 		'JFD_SaxonyAtlas_128.dds',				2, 				2),
		('JFD_SAXONY_ATLAS', 						80, 		'JFD_SaxonyAtlas_80.dds',				2, 				2),
		('JFD_SAXONY_ATLAS', 						64, 		'JFD_SaxonyAtlas_64.dds',				2, 				2),
		('JFD_SAXONY_ATLAS', 						45, 		'JFD_SaxonyAtlas_45.dds',				2, 				2),
		('JFD_SAXONY_ATLAS', 						32, 		'JFD_SaxonyAtlas_32.dds',				2, 				2),
		('JFD_SAXONY_ALPHA_ATLAS', 					128, 		'JFD_SaxonyAlphaAtlas_128.dds',			1,				1),
		('JFD_SAXONY_ALPHA_ATLAS', 					80, 		'JFD_SaxonyAlphaAtlas_80.dds',			1, 				1),
		('JFD_SAXONY_ALPHA_ATLAS', 					64, 		'JFD_SaxonyAlphaAtlas_64.dds',			1, 				1),
		('JFD_SAXONY_ALPHA_ATLAS', 					48, 		'JFD_SaxonyAlphaAtlas_48.dds',			1, 				1),
		('JFD_SAXONY_ALPHA_ATLAS', 					45, 		'JFD_SaxonyAlphaAtlas_45.dds',			1, 				1),
		('JFD_SAXONY_ALPHA_ATLAS', 					32, 		'JFD_SaxonyAlphaAtlas_32.dds',			1, 				1),
		('JFD_SAXONY_ALPHA_ATLAS', 					24, 		'JFD_SaxonyAlphaAtlas_24.dds',			1, 				1),
		('JFD_SAXONY_ALPHA_ATLAS', 					16, 		'JFD_SaxonyAlphaAtlas_16.dds',			1, 				1),
		('JFD_SAXONY_RESOURCE_ATLAS', 				256, 		'JFD_SaxonyResourceAtlas_256.dds',		1, 				1),
		('JFD_SAXONY_RESOURCE_ATLAS', 				128, 		'JFD_SaxonyResourceAtlas_128.dds',		1, 				1),
		('JFD_SAXONY_RESOURCE_ATLAS', 				80, 		'JFD_SaxonyResourceAtlas_80.dds',		1, 				1),
		('JFD_SAXONY_RESOURCE_ATLAS', 				64, 		'JFD_SaxonyResourceAtlas_64.dds',		1, 				1),
		('JFD_SAXONY_RESOURCE_ATLAS', 				45, 		'JFD_SaxonyResourceAtlas_45.dds',		1, 				1),
		('JFD_SAXONY_RESOURCE_ATLAS', 				32, 		'JFD_SaxonyResourceAtlas_32.dds',		1, 				1),
		('JFD_CARABINIER_GUARD_FLAG_ART_ATLAS', 	32, 		'JFD_CarabinierGuardUnitFlag_32.dds',	1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 									Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_SAXONY_ICON', 		0.113,	0.294,	0.023,	1),
		('COLOR_PLAYER_JFD_SAXONY_BACKGROUND',	0.749,	0.733,	0.596,	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 							PrimaryColor, 						SecondaryColor, 						TextColor)
VALUES	('PLAYERCOLOR_JFD_SAXONY',		'COLOR_PLAYER_JFD_SAXONY_ICON', 	'COLOR_PLAYER_JFD_SAXONY_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 												Filename, 						LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_FREDERICK_AUGUSTUS_I_PEACE', 	'FrederickAugustusI_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_FREDERICK_AUGUSTUS_I_WAR', 		'FrederickAugustusI_War', 		'DynamicResident');
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 												SoundID, 											SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_FREDERICK_AUGUSTUS_I_PEACE', 	'SND_LEADER_MUSIC_JFD_FREDERICK_AUGUSTUS_I_PEACE', 	'GAME_MUSIC', 	-1.0,					60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_FREDERICK_AUGUSTUS_I_WAR', 		'SND_LEADER_MUSIC_JFD_FREDERICK_AUGUSTUS_I_WAR', 	'GAME_MUSIC', 	-1.0,					60, 		60, 		1,		 0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 					TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_CARABINIER_GUARD', 	'Unit', 	'sv_CarabinierGuard.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_CARABINIER_GUARD',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_CAVALRY';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,							NumMembers)
SELECT	'ART_DEF_UNIT_JFD_CARABINIER_GUARD', 	'ART_DEF_UNIT_MEMBER_JFD_CARABINIER_GUARD',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_CAVALRY';
------------------------
-- ArtDefine_UnitMemberCombats
------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_CARABINIER_GUARD',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CAVALRY';
------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_CARABINIER_GUARD',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CAVALRY';
------------------------
-- ArtDefine_UnitMemberInfos
------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 										Scale,	ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_CARABINIER_GUARD',	Scale,	ZOffset, Domain, 'CarabinierGuard.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_CAVALRY';
--==========================================================================================================================	
--==========================================================================================================================	