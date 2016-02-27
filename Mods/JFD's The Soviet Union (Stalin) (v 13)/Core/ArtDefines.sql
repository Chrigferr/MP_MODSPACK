--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 		TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_IS2', 	'Unit', 	'sv_IS2.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type, 						DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_IS2'), 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_TANK');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,				UnitMemberInfoType,					NumMembers)
SELECT		('ART_DEF_UNIT_JFD_IS2'), 	('ART_DEF_UNIT_MEMBER_JFD_IS2'), 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_TANK');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,				EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_IS2'),EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_TANK');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_IS2'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_TANK');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale, ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_JFD_IS2'),	Scale, ZOffset, Domain, ('IS-2.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_TANK');
------------------------------
-- IconTextureAtlasesa
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 									IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_USSR_STALIN_ATLAS', 					256, 		'JFD_USSRStalinAtlas_256.dds',			2, 				2),
			('JFD_USSR_STALIN_ATLAS', 					128, 		'JFD_USSRStalinAtlas_128.dds',			2, 				2),
			('JFD_USSR_STALIN_ATLAS', 					80, 		'JFD_USSRStalinAtlas_80.dds',			2, 				2),
			('JFD_USSR_STALIN_ATLAS', 					45, 		'JFD_USSRStalinAtlas_45.dds',			2, 				2),
			('JFD_USSR_STALIN_ATLAS', 					64, 		'JFD_USSRStalinAtlas_64.dds',			2, 				2),
			('JFD_USSR_STALIN_ATLAS', 					32, 		'JFD_USSRStalinAtlas_32.dds',			2, 				2),
			('JFD_USSR_STALIN_ALPHA_ATLAS', 			128, 		'JFD_USSRStalinAlphaAtlas_128.dds',		1, 				1),
			('JFD_USSR_STALIN_ALPHA_ATLAS', 			80, 		'JFD_USSRStalinAlphaAtlas_80.dds',		1, 				1),
			('JFD_USSR_STALIN_ALPHA_ATLAS', 			64, 		'JFD_USSRStalinAlphaAtlas_64.dds',		1, 				1),
			('JFD_USSR_STALIN_ALPHA_ATLAS', 			48, 		'JFD_USSRStalinAlphaAtlas_48.dds',		1, 				1),
			('JFD_USSR_STALIN_ALPHA_ATLAS', 			45, 		'JFD_USSRStalinAlphaAtlas_45.dds',		1, 				1),
			('JFD_USSR_STALIN_ALPHA_ATLAS', 			32, 		'JFD_USSRStalinAlphaAtlas_32.dds',		1, 				1),
			('JFD_USSR_STALIN_ALPHA_ATLAS', 			24, 		'JFD_USSRStalinAlphaAtlas_24.dds',		1, 				1),
			('JFD_USSR_STALIN_ALPHA_ATLAS', 			16, 		'JFD_USSRStalinAlphaAtlas_16.dds',		1, 				1),
			('JFD_STALIN_IS2_FLAG_ART_ATLAS', 			32, 		'JFD_IS2UnitFLag_32.dds',				1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
			(Type, 											Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_JFD_USSR_STALIN_ICON', 			0.945, 	0.713, 	0.027, 	1),
			('COLOR_PLAYER_JFD_USSR_STALIN_BACKGROUND', 	0.450,	0,		0, 		1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
			(Type, 								PrimaryColor, 							SecondaryColor, 							TextColor)
VALUES		('PLAYERCOLOR_JFD_USSR_STALIN', 	'COLOR_PLAYER_JFD_USSR_STALIN_ICON', 	'COLOR_PLAYER_JFD_USSR_STALIN_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 		LoadType)
VALUES		('SND_LEADER_MUSIC_JFD_STALIN_ANTHEM', 	'SovietAnthem',	'DynamicResident'),
			('SND_LEADER_MUSIC_JFD_STALIN_PEACE', 	'Stalin_Peace',	'DynamicResident'),
			('SND_LEADER_MUSIC_JFD_STALIN_WAR', 	'Stalin_War',	'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
			(ScriptID, 								SoundID, 								SoundType, 				TaperSoundtrackVolume,  MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_LEADER_MUSIC_JFD_STALIN_ANTHEM', 'SND_LEADER_MUSIC_JFD_STALIN_ANTHEM',	'GAME_MUSIC_STINGS',	0.0,					60, 		60, 		1, 			0),
			('AS2D_LEADER_MUSIC_JFD_STALIN_PEACE', 	'SND_LEADER_MUSIC_JFD_STALIN_PEACE',	'GAME_MUSIC',			-1.0,					50, 		50, 		1, 			0),
			('AS2D_LEADER_MUSIC_JFD_STALIN_WAR', 	'SND_LEADER_MUSIC_JFD_STALIN_WAR', 		'GAME_MUSIC',			-1.0,					30, 		30, 		1,			0);
--==========================================================================================================================	
--==========================================================================================================================	
