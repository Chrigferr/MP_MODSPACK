--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 				TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_KHAGAN_BEK', 	'Unit', 	'sv_KhaghanBek.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 								DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_KHAGAN_BEK'), 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_GENERAL_KHAN');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_JFD_KHAGAN_BEK'), 	('ART_DEF_UNIT_MEMBER_JFD_KHAGAN_BEK'), 	1
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_GENERAL_KHAN');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_KHAGAN_BEK'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_KHAGAN_BEK'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_KHAGAN_BEK'),	Scale,	ZOffset, Domain, ('Knight_Turkey.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN');
------------------------------
-- IconTextureAtlasesa
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_KHAZARIA_ATLAS', 					256, 		'JFD_KhazariaAtlas_256.dds',			2, 				2),
			('JFD_KHAZARIA_ATLAS', 					128, 		'JFD_KhazariaAtlas_128.dds',			2, 				2),
			('JFD_KHAZARIA_ATLAS', 					80, 		'JFD_KhazariaAtlas_80.dds',				2, 				2),
			('JFD_KHAZARIA_ATLAS', 					64, 		'JFD_KhazariaAtlas_64.dds',				2, 				2),
			('JFD_KHAZARIA_ATLAS', 					45, 		'JFD_KhazariaAtlas_45.dds',				2, 				2),
			('JFD_KHAZARIA_ATLAS', 					32, 		'JFD_KhazariaAtlas_32.dds',				2, 				2),
			('JFD_KHAZARIA_ALPHA_ATLAS', 			128, 		'JFD_KhazariaAlphaAtlas_128.dds',		1, 				1),
			('JFD_KHAZARIA_ALPHA_ATLAS', 			80, 		'JFD_KhazariaAlphaAtlas_80.dds',		1, 				1),
			('JFD_KHAZARIA_ALPHA_ATLAS', 			64, 		'JFD_KhazariaAlphaAtlas_64.dds',		1, 				1),
			('JFD_KHAZARIA_ALPHA_ATLAS', 			48, 		'JFD_KhazariaAlphaAtlas_48.dds',		1, 				1),
			('JFD_KHAZARIA_ALPHA_ATLAS', 			45, 		'JFD_KhazariaAlphaAtlas_45.dds',		1, 				1),
			('JFD_KHAZARIA_ALPHA_ATLAS', 			32, 		'JFD_KhazariaAlphaAtlas_32.dds',		1, 				1),
			('JFD_KHAZARIA_ALPHA_ATLAS', 			24, 		'JFD_KhazariaAlphaAtlas_24.dds',		1, 				1),
			('JFD_KHAZARIA_ALPHA_ATLAS', 			16, 		'JFD_KhazariaAlphaAtlas_16.dds',		1, 				1),
			('JFD_UNIT_FLAG_KHAGAN_BEK_ATLAS', 		32, 		'Unit_KhaganBek_Flag_32.dds',			1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
			(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_JFD_KHAZARIA_ICON', 			0.694,	0.796,	0.905,	1),
			('COLOR_PLAYER_JFD_KHAZARIA_BACKGROUND', 	0.384,	0.294,	0.098,	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
			(Type, 						PrimaryColor, 						SecondaryColor, 							TextColor)
VALUES		('PLAYERCOLOR_JFD_KHAZARIA', 'COLOR_PLAYER_JFD_KHAZARIA_ICON', 	'COLOR_PLAYER_JFD_KHAZARIA_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 		LoadType)
VALUES		('SND_LEADER_MUSIC_JFD_BULAN_PEACE', 	'Bulan_Peace', 	'DynamicResident'),
			('SND_LEADER_MUSIC_JFD_BULAN_WAR', 		'Bulan_War', 	'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
			(ScriptID, 										SoundID, 								SoundType, 		MinVolume, 	MaxVolume,  IsMusic,	Looping)
VALUES		('AS2D_AMBIENCE_LEADER_JFD_BULAN_AMBIENCE', 	'SND_AMBIENCE_ALEXANDER_AMBIENCE', 		'GAME_SFX', 	40, 		40, 		0, 			1),
			('AS2D_LEADER_MUSIC_JFD_BULAN_PEACE', 			'SND_LEADER_MUSIC_JFD_BULAN_PEACE', 	'GAME_MUSIC', 	50, 		50, 		1, 			0),
			('AS2D_LEADER_MUSIC_JFD_BULAN_WAR', 			'SND_LEADER_MUSIC_JFD_BULAN_WAR', 		'GAME_MUSIC', 	50, 		50, 		1,			0);
--==========================================================================================================================	
--==========================================================================================================================	
