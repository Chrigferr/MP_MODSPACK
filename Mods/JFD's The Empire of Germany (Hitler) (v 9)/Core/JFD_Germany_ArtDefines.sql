--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT OR REPLACE INTO ArtDefine_StrategicView 
			(StrategicViewType, 			TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_JAEGER', 	'Unit', 	'sv_Jaeger.dds'),
			('ART_DEF_UNIT_JFD_WEHRMACHT', 	'Unit', 	'sv_Wehrmacht.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos 
			(Type,								DamageStates, Formation)
SELECT		('ART_DEF_UNIT_JFD_WEHRMACHT'),		DamageStates, Formation
FROM "ArtDefine_UnitInfos" WHERE (Type = 'ART_DEF_UNIT_INFANTRY');

INSERT OR REPLACE INTO ArtDefine_UnitInfos 
			(Type,								DamageStates, Formation)
SELECT		('ART_DEF_UNIT_JFD_JAEGER'),		DamageStates, Formation
FROM "ArtDefine_UnitInfos" WHERE (Type = 'ART_DEF_UNIT_RIFLEMAN');
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfoMemberInfos 
			(UnitInfoType,						UnitMemberInfoType,						NumMembers)
SELECT		('ART_DEF_UNIT_JFD_WEHRMACHT'),		('ART_DEF_UNIT_MEMBER_JFD_WEHRMACHT'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_INFANTRY');

INSERT OR REPLACE INTO ArtDefine_UnitInfoMemberInfos 
			(UnitInfoType,						UnitMemberInfoType,					NumMembers)
SELECT		('ART_DEF_UNIT_JFD_JAEGER'),		('ART_DEF_UNIT_MEMBER_JFD_JAEGER'), NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------	
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_WEHRMACHT'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_INFANTRY');

INSERT OR REPLACE INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_JAEGER'),		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------	
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_WEHRMACHT'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_INFANTRY');

INSERT OR REPLACE INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_JAEGER'),		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------	
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale, ZOffset, Domain, Model, 						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_WEHRMACHT'),	Scale, ZOffset, Domain, ('Infantry_German.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_INFANTRY');

INSERT OR REPLACE INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale, ZOffset, Domain, Model, 						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_JAEGER'),		Scale, ZOffset, Domain, ('civ5_rusmm2.fxsxml'),		MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');
------------------------------	
-- IconTextureAtlases
------------------------------	
INSERT OR REPLACE INTO IconTextureAtlases 
			(Atlas, 									IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_JAEGER_ATLAS', 						256, 		'JFD_Jaeger_256.dds',					1, 				1),
			('JFD_JAEGER_ATLAS', 						128, 		'JFD_Jaeger_128.dds',					1, 				1),
			('JFD_JAEGER_ATLAS', 						80, 		'JFD_Jaeger_80.dds',					1, 				1),
			('JFD_JAEGER_ATLAS', 						45, 		'JFD_Jaeger_45.dds',					1, 				1),
			('JFD_JAEGER_ATLAS', 						64, 		'JFD_Jaeger_64.dds',					1, 				1),
			('JFD_JAEGER_ATLAS', 						32, 		'JFD_Jaeger_32.dds',					1, 				1),
			('JFD_NAZI_GERMANY_ATLAS', 					256, 		'JFD_NaziGermanyAtlas_256.dds',			2, 				2),
			('JFD_NAZI_GERMANY_ATLAS', 					128, 		'JFD_NaziGermanyAtlas_128.dds',			2, 				2),
			('JFD_NAZI_GERMANY_ATLAS', 					80, 		'JFD_NaziGermanyAtlas_80.dds',			2, 				2),
			('JFD_NAZI_GERMANY_ATLAS', 					45, 		'JFD_NaziGermanyAtlas_45.dds',			2, 				2),
			('JFD_NAZI_GERMANY_ATLAS', 					64, 		'JFD_NaziGermanyAtlas_64.dds',			2, 				2),
			('JFD_NAZI_GERMANY_ATLAS', 					32, 		'JFD_NaziGermanyAtlas_32.dds',			2, 				2),
			('JFD_NAZI_GERMANY_ALPHA_ATLAS', 			128, 		'JFD_NaziGermanyAlphaAtlas_128.dds',	1, 				1),
			('JFD_NAZI_GERMANY_ALPHA_ATLAS', 			80, 		'JFD_NaziGermanyAlphaAtlas_80.dds',		1, 				1),
			('JFD_NAZI_GERMANY_ALPHA_ATLAS', 			64, 		'JFD_NaziGermanyAlphaAtlas_64.dds',		1, 				1),
			('JFD_NAZI_GERMANY_ALPHA_ATLAS', 			48, 		'JFD_NaziGermanyAlphaAtlas_48.dds',		1, 				1),
			('JFD_NAZI_GERMANY_ALPHA_ATLAS', 			45, 		'JFD_NaziGermanyAlphaAtlas_45.dds',		1, 				1),
			('JFD_NAZI_GERMANY_ALPHA_ATLAS', 			32, 		'JFD_NaziGermanyAlphaAtlas_32.dds',		1, 				1),
			('JFD_NAZI_GERMANY_ALPHA_ATLAS', 			24, 		'JFD_NaziGermanyAlphaAtlas_24.dds',		1, 				1),
			('JFD_NAZI_GERMANY_ALPHA_ATLAS', 			16, 		'JFD_NaziGermanyAlphaAtlas_16.dds',		1, 				1),
			('UNITS_JFD_JAEGER_FLAG_ATLAS', 			32, 		'Unit_Jaeger_Flag_32.dds',				1, 				1),
			('UNITS_JFD_WEHRMACHT_FLAG_ART_ATLAS', 		32, 		'Unit_Wehrmacht_Flag_32.dds',			1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
			(Type, 											Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_JFD_NAZI_GERMANY_ICON', 			0, 		0, 		0, 		1),
			('COLOR_PLAYER_JFD_NAZI_GERMANY_BACKGROUND', 	0.588,	0,		0, 		1);
------------------------------
-- PlayerColors
------------------------------				
INSERT INTO PlayerColors 
			(Type, 								PrimaryColor, 							SecondaryColor, 							TextColor)
VALUES		('PLAYERCOLOR_JFD_NAZI_GERMANY', 	'COLOR_PLAYER_JFD_NAZI_GERMANY_ICON', 	'COLOR_PLAYER_JFD_NAZI_GERMANY_BACKGROUND', 'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 									Filename, 			LoadType)
VALUES		('SND_LEADER_MUSIC_JFD_HITLER_PEACE', 		'Hitler_Peace',		'DynamicResident'),
			('SND_LEADER_MUSIC_JFD_HITLER_WAR', 		'Hitler_War', 		'DynamicResident');			
------------------------------	
-- Audio_2DSounds
------------------------------		
INSERT INTO Audio_2DSounds 
			(ScriptID, 										SoundID, 								SoundType, 		MinVolume, 	MaxVolume,  IsMusic,	Looping)
VALUES		('AS2D_LEADER_MUSIC_JFD_HITLER_PEACE', 			'SND_LEADER_MUSIC_JFD_HITLER_PEACE', 	'GAME_MUSIC', 	60, 		60, 		1, 			0),
			('AS2D_LEADER_MUSIC_JFD_HITLER_WAR', 			'SND_LEADER_MUSIC_JFD_HITLER_WAR', 		'GAME_MUSIC', 	60, 		60, 		1,			0);
--==========================================================================================================================	
--==========================================================================================================================	
