--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_LandmarkTypes
			(Type,							LandmarkType,	FriendlyName)
VALUES		('ART_DEF_IMPROVEMENT_SCHLOSS', 'Improvement',	'Schloss');
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction', 0.20,  'ART_DEF_IMPROVEMENT_SCHLOSS', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'schloss_hb.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed', 0.20,  'ART_DEF_IMPROVEMENT_SCHLOSS', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'schloss.fxsxml', 1 UNION ALL
SELECT 'Any', 'Pillaged', 0.20,  'ART_DEF_IMPROVEMENT_SCHLOSS', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'schloss_pl.fxsxml', 1;
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 				TileType,	Asset)
VALUES		('ART_DEF_IMPROVEMENT_SCHLOSS', 	'Unit', 	'sv_schloss.dds'),
			('ART_DEF_UNIT_JFD_HARTSCHIER', 	'Unit', 	'sv_Hartschier.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 								DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_HARTSCHIER'),	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_PIKEMAN');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,						NumMembers)
SELECT		('ART_DEF_UNIT_JFD_HARTSCHIER'),	('ART_DEF_UNIT_MEMBER_JFD_HARTSCHIER'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_PIKEMAN');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_HARTSCHIER'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_HARTSCHIER'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale,  ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_HARTSCHIER'),	Scale,	ZOffset, Domain, ('hartschier.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_PIKEMAN');
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_SCHLOSS_ATLAS', 				256, 		'SchlossIcon256.dds',				1, 				2),
			('JFD_SCHLOSS_ATLAS', 				64, 		'SchlossIcon64.dds',				1, 				2),
			('JFD_SCHLOSS_ATLAS', 				45, 		'SchlossIcon45.dds',				1, 				2),
			('JFD_BAVARIA_ATLAS', 				256, 		'JFD_BavariaAtlas_256.dds',			2, 				2),
			('JFD_BAVARIA_ATLAS', 				128, 		'JFD_BavariaAtlas_128.dds',			2, 				2),
			('JFD_BAVARIA_ATLAS', 				80, 		'JFD_BavariaAtlas_80.dds',			2, 				2),
			('JFD_BAVARIA_ATLAS', 				64, 		'JFD_BavariaAtlas_64.dds',			2, 				2),
			('JFD_BAVARIA_ATLAS', 				45, 		'JFD_BavariaAtlas_45.dds',			2, 				2),
			('JFD_BAVARIA_ATLAS', 				32, 		'JFD_BavariaAtlas_32.dds',			2, 				2),
			('JFD_BAVARIA_ALPHA_ATLAS', 		128, 		'JFD_BavariaAlphaAtlas_128.dds',	1,				1),
			('JFD_BAVARIA_ALPHA_ATLAS', 		80, 		'JFD_BavariaAlphaAtlas_80.dds',		1, 				1),
			('JFD_BAVARIA_ALPHA_ATLAS', 		64, 		'JFD_BavariaAlphaAtlas_64.dds',		1, 				1),
			('JFD_BAVARIA_ALPHA_ATLAS', 		48, 		'JFD_BavariaAlphaAtlas_48.dds',		1, 				1),
			('JFD_BAVARIA_ALPHA_ATLAS', 		45, 		'JFD_BavariaAlphaAtlas_45.dds',		1, 				1),
			('JFD_BAVARIA_ALPHA_ATLAS', 		32, 		'JFD_BavariaAlphaAtlas_32.dds',		1, 				1),
			('JFD_BAVARIA_ALPHA_ATLAS', 		24, 		'JFD_BavariaAlphaAtlas_24.dds',		1, 				1),
			('JFD_BAVARIA_ALPHA_ATLAS', 		16, 		'JFD_BavariaAlphaAtlas_16.dds',		1, 				1),
			('JFD_UNIT_FLAG_HARTSCHIER_ATLAS', 	32, 		'JFD_HartschierUnitFlag_32.dds',	1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
			(Type, 									Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_JFD_BAVARIA_ICON', 		0.023,	0.239,	0.305,	1),
			('COLOR_PLAYER_JFD_BAVARIA_BACKGROUND', 0.792,	0.843,	0.854,	1);
------------------------------	
-- PlayerColors
------------------------------				
INSERT INTO PlayerColors 
			(Type, 							PrimaryColor, 						SecondaryColor, 						TextColor)
VALUES		('PLAYERCOLOR_JFD_BAVARIA',		'COLOR_PLAYER_JFD_BAVARIA_ICON', 	'COLOR_PLAYER_JFD_BAVARIA_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 		LoadType)
VALUES		('SND_LEADER_MUSIC_JFD_LUDWIG_PEACE', 	'Ludwig_Peace',	'DynamicResident'),
			('SND_LEADER_MUSIC_JFD_LUDWIG_WAR', 	'Ludwig_War', 	'DynamicResident');			
------------------------------	
-- Audio_2DSounds
------------------------------		
INSERT INTO Audio_2DSounds 
			(ScriptID, 										SoundID, 									SoundType, 		MinVolume, 	MaxVolume,  IsMusic,	Looping)
VALUES		('AS2D_AMBIENCE_LEADER_JFD_LUDWIG_AMBIENCE', 	'SND_AMBIENCE_FOG_OF_WAR_BED', 				'GAME_SFX', 	60, 		60, 		0, 			1),
			('AS2D_LEADER_MUSIC_JFD_LUDWIG_PEACE', 			'SND_LEADER_MUSIC_JFD_LUDWIG_PEACE', 		'GAME_MUSIC', 	60, 		60, 		1, 			0),
			('AS2D_LEADER_MUSIC_JFD_LUDWIG_WAR', 			'SND_LEADER_MUSIC_JFD_LUDWIG_WAR', 			'GAME_MUSIC', 	60, 		60, 		1,			0);
--==========================================================================================================================	
--==========================================================================================================================	
