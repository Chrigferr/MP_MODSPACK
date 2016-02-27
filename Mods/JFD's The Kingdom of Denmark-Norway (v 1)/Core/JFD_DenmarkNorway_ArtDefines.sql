--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- ArtDefine_LandmarkTypes
------------------------------
INSERT OR REPLACE INTO ArtDefine_LandmarkTypes 
			(Type, 										LandmarkType,	FriendlyName)
VALUES		('ART_DEF_IMPROVEMENT_JFD_SEA_FORTRESS',	'Improvement',	'SEAFORTRESS.dds');
------------------------------	
-- ArtDefine_Landmarks
------------------------------
INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction', 1.3,  'ART_DEF_IMPROVEMENT_JFD_SEA_FORTRESS', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Feitoria_HB.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed', 0.5,  'ART_DEF_IMPROVEMENT_JFD_SEA_FORTRESS', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Anc_Citadel.fxsxml', 1 UNION ALL
SELECT 'Any', 'Pillaged', 1.3,  'ART_DEF_IMPROVEMENT_JFD_SEA_FORTRESS', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Feitoria_PIL.fxsxml', 1;
------------------------------	
-- ArtDefine_StrategicView
------------------------------
INSERT OR REPLACE INTO ArtDefine_StrategicView 
			(StrategicViewType, 						TileType,		Asset)
VALUES		('ART_DEF_IMPROVEMENT_JFD_SEA_FORTRESS',	'Improvement',	'sv_Citadel.dds'),
			('ART_DEF_UNIT_JFD_LONGBOAT',				'Unit',			'sv_Longboat.dds'),
			('ART_DEF_UNIT_JFD_KONTREADMIRAL',			'Unit',			'sv_Kontreadmiral.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------			
INSERT OR REPLACE INTO ArtDefine_UnitInfos 
			(Type, 							DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_LONGBOAT'),	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_U_DANISH_LONGBOAT');

INSERT OR REPLACE INTO ArtDefine_UnitInfos 
			(Type, 								DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_KONTREADMIRAL'),	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_GREAT_ADMIRAL');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT OR REPLACE INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,						NumMembers)
SELECT		('ART_DEF_UNIT_JFD_LONGBOAT'),	('ART_DEF_UNIT_MEMBER_JFD_LONGBOAT'), 	1
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_U_DANISH_LONGBOAT');

INSERT OR REPLACE INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_JFD_KONTREADMIRAL'),	('ART_DEF_UNIT_MEMBER_JFD_KONTREADMIRAL'), 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_GREAT_ADMIRAL');
------------------------------	
-- ArtDefine_UnitMemberCombats
------------------------------	
INSERT OR REPLACE INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_LONGBOAT'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_TRIREME');
------------------------------	
-- ArtDefine_UnitMemberCombatWeapons
------------------------------	
INSERT OR REPLACE INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_LONGBOAT'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_TRIREME');
------------------------------	
-- ArtDefine_UnitMemberInfos
------------------------------		
INSERT OR REPLACE INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_JFD_LONGBOAT'),	Scale,	ZOffset, Domain, ('U_Denmark_Longboat.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_TRIREME');

INSERT OR REPLACE INTO ArtDefine_UnitMemberInfos 	
		(Type, 										Scale,	ZOffset, Domain, Model, 						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_JFD_KONTREADMIRAL'),	Scale,	ZOffset, Domain, ('WarGalleonDanish.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_GREAT_ADMIRAL');
------------------------------
-- IconTextureAtlases
------------------------------
INSERT OR REPLACE INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_DENMARK_NORWAY_ATLAS', 			256, 		'JFD_DenmarkNorwayAtlas_256.dds',			2, 				2),
			('JFD_DENMARK_NORWAY_ATLAS', 			128, 		'JFD_DenmarkNorwayAtlas_128.dds',			2, 				2),
			('JFD_DENMARK_NORWAY_ATLAS', 			80, 		'JFD_DenmarkNorwayAtlas_80.dds',			2, 				2),
			('JFD_DENMARK_NORWAY_ATLAS', 			64, 		'JFD_DenmarkNorwayAtlas_64.dds',			2, 				2),
			('JFD_DENMARK_NORWAY_ATLAS', 			45, 		'JFD_DenmarkNorwayAtlas_45.dds',			2, 				2),
			('JFD_DENMARK_NORWAY_ATLAS', 			32, 		'JFD_DenmarkNorwayAtlas_32.dds',			2, 				2),
			('JFD_DENMARK_NORWAY_ALPHA_ATLAS', 		128, 		'JFD_DenmarkNorwayAlphaAtlas_128.dds',		1,				1),
			('JFD_DENMARK_NORWAY_ALPHA_ATLAS', 		80, 		'JFD_DenmarkNorwayAlphaAtlas_80.dds',		1, 				1),
			('JFD_DENMARK_NORWAY_ALPHA_ATLAS', 		64, 		'JFD_DenmarkNorwayAlphaAtlas_64.dds',		1, 				1),
			('JFD_DENMARK_NORWAY_ALPHA_ATLAS', 		48, 		'JFD_DenmarkNorwayAlphaAtlas_48.dds',		1, 				1),
			('JFD_DENMARK_NORWAY_ALPHA_ATLAS', 		45, 		'JFD_DenmarkNorwayAlphaAtlas_45.dds',		1, 				1),
			('JFD_DENMARK_NORWAY_ALPHA_ATLAS', 		32, 		'JFD_DenmarkNorwayAlphaAtlas_32.dds',		1, 				1),
			('JFD_DENMARK_NORWAY_ALPHA_ATLAS', 		24, 		'JFD_DenmarkNorwayAlphaAtlas_24.dds',		1, 				1),
			('JFD_DENMARK_NORWAY_ALPHA_ATLAS', 		16, 		'JFD_DenmarkNorwayAlphaAtlas_16.dds',		1, 				1),
			('JFD_UNIT_FLAG_KONTREADMIRAL_ATLAS', 	32, 		'JFD_KontreadmiralUnitFlag_32.dds',			1, 				1),
			('JFD_UNIT_FLAG_LONGBOAT_ATLAS',		32, 		'Unit_Longboat_Flag_32.dds',				1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
			(Type, 											Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_JFD_DENMARK_NORWAY_ICON', 		0.725,	0.807,	0.929,	1),
			('COLOR_PLAYER_JFD_DENMARK_NORWAY_BACKGROUND',	0.592,	0.290,	0.125,	1);
------------------------------	
-- PlayerColors
------------------------------				
INSERT INTO PlayerColors 
			(Type, 								PrimaryColor, 							SecondaryColor, 								TextColor)
VALUES		('PLAYERCOLOR_JFD_DENMARK_NORWAY',	'COLOR_PLAYER_JFD_DENMARK_NORWAY_ICON', 'COLOR_PLAYER_JFD_DENMARK_NORWAY_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 									Filename, 		LoadType)
VALUES		('SND_LEADER_MUSIC_JFD_CHRISTIAN_PEACE', 	'Christian_Peace',	'DynamicResident'),
			('SND_LEADER_MUSIC_JFD_CHRISTIAN_WAR', 		'Christian_War', 	'DynamicResident');			
------------------------------	
-- Audio_2DSounds
------------------------------		
INSERT INTO Audio_2DSounds 
			(ScriptID, 									SoundID, 								SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES		('AS2D_LEADER_MUSIC_JFD_CHRISTIAN_PEACE', 	'SND_LEADER_MUSIC_JFD_CHRISTIAN_PEACE', 'GAME_MUSIC', 	60, 		60, 		1, 		 0),
			('AS2D_LEADER_MUSIC_JFD_CHRISTIAN_WAR', 	'SND_LEADER_MUSIC_JFD_CHRISTIAN_WAR', 	'GAME_MUSIC', 	60, 		60, 		1,		 0);
--==========================================================================================================================	
--==========================================================================================================================	
