--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_MILAN_ATLAS', 				256, 		'JFD_MilanAtlas_256.dds',			2, 				2),
			('JFD_MILAN_ATLAS', 				128, 		'JFD_MilanAtlas_128.dds',			2, 				2),
			('JFD_MILAN_ATLAS', 				80, 		'JFD_MilanAtlas_80.dds',			2, 				2),
			('JFD_MILAN_ATLAS', 				64, 		'JFD_MilanAtlas_64.dds',			2, 				2),
			('JFD_MILAN_ATLAS', 				45, 		'JFD_MilanAtlas_45.dds',			2, 				2),
			('JFD_MILAN_ATLAS', 				32, 		'JFD_MilanAtlas_32.dds',			2, 				2),
			('JFD_MILAN_ALPHA_ATLAS', 			128, 		'JFD_MilanAlphaAtlas_128.dds',		1,				1),
			('JFD_MILAN_ALPHA_ATLAS', 			80, 		'JFD_MilanAlphaAtlas_80.dds',		1, 				1),
			('JFD_MILAN_ALPHA_ATLAS', 			64, 		'JFD_MilanAlphaAtlas_64.dds',		1, 				1),
			('JFD_MILAN_ALPHA_ATLAS', 			48, 		'JFD_MilanAlphaAtlas_48.dds',		1, 				1),
			('JFD_MILAN_ALPHA_ATLAS', 			45, 		'JFD_MilanAlphaAtlas_45.dds',		1, 				1),
			('JFD_MILAN_ALPHA_ATLAS', 			32, 		'JFD_MilanAlphaAtlas_32.dds',		1, 				1),
			('JFD_MILAN_ALPHA_ATLAS', 			24, 		'JFD_MilanAlphaAtlas_24.dds',		1, 				1),
			('JFD_MILAN_ALPHA_ATLAS', 			16, 		'JFD_MilanAlphaAtlas_16.dds',		1, 				1),
			('JFD_UNIT_FLAG_RIBAULT_ATLAS', 	32, 		'JFD_RibaultUnitFlag_32.dds',		1, 				1);
------------------------------	
-- Colors
------------------------------		
INSERT INTO Colors 
			(Type, 									Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_JFD_MILAN_ICON', 		0.811,	0.878,	0.901,	1),
			('COLOR_PLAYER_JFD_MILAN_BACKGROUND',	0.396,	0.454,	0.054,	1);
------------------------------	
-- PlayerColors
------------------------------				
INSERT INTO PlayerColors 
			(Type, 						PrimaryColor, 					SecondaryColor, 						TextColor)
VALUES		('PLAYERCOLOR_JFD_MILAN',	'COLOR_PLAYER_JFD_MILAN_ICON', 	'COLOR_PLAYER_JFD_MILAN_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 			LoadType)
VALUES		('SND_LEADER_MUSIC_JFD_VISCONTI_PEACE', 'Visconti_Peace',	'DynamicResident'),
			('SND_LEADER_MUSIC_JFD_VISCONTI_WAR', 	'Visconti_War', 	'DynamicResident');			
------------------------------	
-- Audio_2DSounds
------------------------------		
INSERT INTO Audio_2DSounds 
			(ScriptID, 									SoundID, 									SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES		('AS2D_LEADER_MUSIC_JFD_VISCONTI_PEACE', 	'SND_LEADER_MUSIC_JFD_VISCONTI_PEACE', 		'GAME_MUSIC', 	60, 		60, 		1, 		 0),
			('AS2D_LEADER_MUSIC_JFD_VISCONTI_WAR', 		'SND_LEADER_MUSIC_JFD_VISCONTI_WAR', 		'GAME_MUSIC', 	60, 		60, 		1,		 0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_RIBAULT',	'Unit',		'sv_Ribault.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 						DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_RIBAULT',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_GATLINGGUN';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,				UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_JFD_RIBAULT',	'ART_DEF_UNIT_MEMBER_JFD_RIBAULT', 	3
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_GATLINGGUN';
------------------------------	
-- ArtDefine_UnitMemberCombats
------------------------------	
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_RIBAULT',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GATLINGGUN';
------------------------------	
-- ArtDefine_UnitMemberCombatWeapons
------------------------------	
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_RIBAULT',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GATLINGGUN';
------------------------------	
-- ArtDefine_UnitMemberInfos
------------------------------		
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale,	ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_RIBAULT',	Scale,	ZOffset, Domain, 'VolleyGun.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_GATLINGGUN';
--==========================================================================================================================	
--==========================================================================================================================	
