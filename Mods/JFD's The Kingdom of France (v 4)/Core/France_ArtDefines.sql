--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT OR REPLACE INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_FRANCE_ATLAS', 					256, 		'JFD_FranceAtlas_256.dds',				2, 				2),
		('JFD_FRANCE_ATLAS', 					128, 		'JFD_FranceAtlas_128.dds',				2, 				2),
		('JFD_FRANCE_ATLAS', 					80, 		'JFD_FranceAtlas_80.dds',				2, 				2),
		('JFD_FRANCE_ATLAS', 					64, 		'JFD_FranceAtlas_64.dds',				2, 				2),
		('JFD_FRANCE_ATLAS', 					45, 		'JFD_FranceAtlas_45.dds',				2, 				2),
		('JFD_FRANCE_ATLAS', 					32, 		'JFD_FranceAtlas_32.dds',				2, 				2),
		('JFD_FRANCE_ALPHA_ATLAS', 				128, 		'JFD_FranceAlphaAtlas_128.dds',			1, 				1),
		('JFD_FRANCE_ALPHA_ATLAS', 				80, 		'JFD_FranceAlphaAtlas_80.dds',			1, 				1),
		('JFD_FRANCE_ALPHA_ATLAS', 				64, 		'JFD_FranceAlphaAtlas_64.dds',			1, 				1),
		('JFD_FRANCE_ALPHA_ATLAS', 				48, 		'JFD_FranceAlphaAtlas_48.dds',			1, 				1),
		('JFD_FRANCE_ALPHA_ATLAS', 				45, 		'JFD_FranceAlphaAtlas_45.dds',			1, 				1),
		('JFD_FRANCE_ALPHA_ATLAS', 				32, 		'JFD_FranceAlphaAtlas_32.dds',			1, 				1),
		('JFD_FRANCE_ALPHA_ATLAS', 				24, 		'JFD_FranceAlphaAtlas_24.dds',			1, 				1),
		('JFD_FRANCE_ALPHA_ATLAS', 				16, 		'JFD_FranceAlphaAtlas_16.dds',			1, 				1),
		('JFD_UNIT_FLAG_IMPERIAL_GUARD_ATLAS', 	32, 		'JFD_ImperialGuardUnitFlag_32.dds',		1, 				1),
		('JFD_UNIT_FLAG_CHEVAU_LEGER_ATLAS', 	32, 		'JFD_ChevauLegerUnitFlag_32.dds',		1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT OR REPLACE INTO Colors 
		(Type, 												Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_FRANCE_NAPOLEON_ICON', 			0.992,	0.741,	0.227, 1),
		('COLOR_PLAYER_JFD_FRANCE_NAPOLEON_BACKGROUND', 	0,		0.364,	0.725, 1);
------------------------------	
-- PlayerColors
------------------------------				
INSERT OR REPLACE INTO PlayerColors 
		(Type, 								PrimaryColor, 							  SecondaryColor, 									TextColor)
VALUES	('PLAYERCOLOR_JFD_FRANCE_NAPOLEON',	'COLOR_PLAYER_JFD_FRANCE_NAPOLEON_ICON',  'COLOR_PLAYER_JFD_FRANCE_NAPOLEON_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 			LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_LOUIS_XIV_PEACE', 	'LouisXIV_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_LOUIS_XIV_WAR', 		'LouisXIV_War', 	'DynamicResident');			
------------------------------	
-- Audio_2DSounds
------------------------------		
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 									SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_LOUIS_XIV_PEACE', 	'SND_LEADER_MUSIC_JFD_LOUIS_XIV_PEACE', 	'GAME_MUSIC', 	50, 		50, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_LOUIS_XIV_WAR', 	'SND_LEADER_MUSIC_JFD_LOUIS_XIV_WAR', 		'GAME_MUSIC', 	50, 		50, 		1,		 0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT OR REPLACE INTO ArtDefine_StrategicView 
		(StrategicViewType, 					TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_IMPERIAL_GUARD', 	'Unit', 	'sv_ImperialGuard.dds'),
		('ART_DEF_UNIT_JFD_CHEVAU_LEGER', 		'Unit', 	'sv_ChevauLeger.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------			
INSERT OR REPLACE INTO  ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_IMPERIAL_GUARD',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_RIFLEMAN';

INSERT OR REPLACE INTO  ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_CHEVAU_LEGER', 		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_CAVALRY';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT OR REPLACE INTO  ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,							NumMembers)
SELECT	'ART_DEF_UNIT_JFD_IMPERIAL_GUARD',		'ART_DEF_UNIT_MEMBER_JFD_IMPERIAL_GUARD',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN';

INSERT OR REPLACE INTO  ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,							NumMembers)
SELECT	'ART_DEF_UNIT_JFD_CHEVAU_LEGER',		'ART_DEF_UNIT_MEMBER_JFD_CHEVAU_LEGER',		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_CAVALRY';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT OR REPLACE INTO  ArtDefine_UnitMemberCombats 
		(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_IMPERIAL_GUARD',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT OR REPLACE INTO  ArtDefine_UnitMemberCombats 
		(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_CHEVAU_LEGER',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CAVALRY';
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT OR REPLACE INTO  ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_IMPERIAL_GUARD',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT OR REPLACE INTO  ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_CHEVAU_LEGER',		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CAVALRY';
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT OR REPLACE INTO  ArtDefine_UnitMemberInfos 	
		(Type, 										Scale,  ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_IMPERIAL_GUARD',	Scale,	ZOffset, Domain, 'civ5_fremm3.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT OR REPLACE INTO  ArtDefine_UnitMemberInfos 	
		(Type, 										Scale,  ZOffset, Domain, Model, 			MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_CHEVAU_LEGER',		Scale,	ZOffset, Domain, 'dutlr1.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_CAVALRY';
--==========================================================================================================================	
--==========================================================================================================================	
