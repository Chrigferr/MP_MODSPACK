--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 			TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_PZL23', 		'Unit', 	'sv_PZL23.dds'),
			('ART_DEF_UNIT_JFD_LEG_UHLAN', 	'Unit', 	'sv_LegUhlan.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type, 							DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_PZL23'), 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_FIGHTER');

INSERT INTO ArtDefine_UnitInfos 
			(Type, 							DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_LEG_UHLAN'), DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_CAVALRY');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT		('ART_DEF_UNIT_JFD_PZL23'), 	('ART_DEF_UNIT_MEMBER_JFD_PZL23'), 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_FIGHTER');

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,						NumMembers)
SELECT		('ART_DEF_UNIT_JFD_LEG_UHLAN'), ('ART_DEF_UNIT_MEMBER_JFD_LEG_UHLAN'), 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_CAVALRY');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_PZL23'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_FIGHTER');

INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_LEG_UHLAN'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_CAVALRY');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_PZL23'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_FIGHTER');

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_LEG_UHLAN'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_CAVALRY');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale, ZOffset, Domain, Model, 						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_JFD_PZL23'),	Scale, ZOffset, Domain, ('PZL_P.23_Karas.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_FIGHTER');

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale, ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_JFD_LEG_UHLAN'),	Scale, ZOffset, Domain, ('LegUhlan.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_CAVALRY');
------------------------------
-- IconTextureAtlasesa
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 									IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_POLAND_PILSUDSKI_ATLAS', 				256, 		'JFD_PolandPilsudskiAtlas_256.dds',			2, 				2),
			('JFD_POLAND_PILSUDSKI_ATLAS', 				128, 		'JFD_PolandPilsudskiAtlas_128.dds',			2, 				2),
			('JFD_POLAND_PILSUDSKI_ATLAS', 				80, 		'JFD_PolandPilsudskiAtlas_80.dds',			2, 				2),
			('JFD_POLAND_PILSUDSKI_ATLAS', 				45, 		'JFD_PolandPilsudskiAtlas_45.dds',			2, 				2),
			('JFD_POLAND_PILSUDSKI_ATLAS', 				64, 		'JFD_PolandPilsudskiAtlas_64.dds',			2, 				2),
			('JFD_POLAND_PILSUDSKI_ATLAS', 				32, 		'JFD_PolandPilsudskiAtlas_32.dds',			2, 				2),
			('JFD_POLAND_PILSUDSKI_ALPHA_ATLAS', 		128, 		'JFD_PolandPilsudskiAlphaAtlas_128.dds',	1, 				1),
			('JFD_POLAND_PILSUDSKI_ALPHA_ATLAS', 		80, 		'JFD_PolandPilsudskiAlphaAtlas_80.dds',		1, 				1),
			('JFD_POLAND_PILSUDSKI_ALPHA_ATLAS', 		64, 		'JFD_PolandPilsudskiAlphaAtlas_64.dds',		1, 				1),
			('JFD_POLAND_PILSUDSKI_ALPHA_ATLAS', 		48, 		'JFD_PolandPilsudskiAlphaAtlas_48.dds',		1, 				1),
			('JFD_POLAND_PILSUDSKI_ALPHA_ATLAS', 		45, 		'JFD_PolandPilsudskiAlphaAtlas_45.dds',		1, 				1),
			('JFD_POLAND_PILSUDSKI_ALPHA_ATLAS', 		32, 		'JFD_PolandPilsudskiAlphaAtlas_32.dds',		1, 				1),
			('JFD_POLAND_PILSUDSKI_ALPHA_ATLAS', 		24, 		'JFD_PolandPilsudskiAlphaAtlas_24.dds',		1, 				1),
			('JFD_POLAND_PILSUDSKI_ALPHA_ATLAS', 		16, 		'JFD_PolandPilsudskiAlphaAtlas_16.dds',		1, 				1),
			('JFD_PZL23_FLAG_ART_ATLAS', 				32, 		'JFD_PZL23UnitFlag_32.dds',					1, 				1),
			('JFD_UNIT_FLAG_LEG_UHLAN_ATLAS', 			32, 		'JFD_LegUhlanUnitFlag_32.dds',				1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
			(Type, 												Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_JFD_POLAND_PILSUDSKI_ICON', 			0.878, 	0.780, 	0.788, 	1),
			('COLOR_PLAYER_JFD_POLAND_PILSUDSKI_BACKGROUND', 	0.411,	0.007,	0.101, 	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
			(Type, 									PrimaryColor, 								SecondaryColor, 									TextColor)
VALUES		('PLAYERCOLOR_JFD_POLAND_PILSUDSKI', 	'COLOR_PLAYER_JFD_POLAND_PILSUDSKI_ICON', 	'COLOR_PLAYER_JFD_POLAND_PILSUDSKI_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 									Filename, 			LoadType)
VALUES		('SND_LEADER_MUSIC_JFD_PILSUDSKI_PEACE', 	'Pilsudski_Peace',	'DynamicResident'),
			('SND_LEADER_MUSIC_JFD_PILSUDSKI_WAR', 		'Pilsudski_War',	'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
			(ScriptID, 									SoundID, 									SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_LEADER_MUSIC_JFD_PILSUDSKI_PEACE', 	'SND_LEADER_MUSIC_JFD_PILSUDSKI_PEACE',		'GAME_MUSIC',	50, 		50, 		1, 			0),
			('AS2D_LEADER_MUSIC_JFD_PILSUDSKI_WAR', 	'SND_LEADER_MUSIC_JFD_PILSUDSKI_WAR', 		'GAME_MUSIC',	30, 		30, 		1,			0);
--==========================================================================================================================	
--==========================================================================================================================	
