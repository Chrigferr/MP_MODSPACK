--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 							IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_BOHEMIA_ATLAS', 				256, 		'JFD_BohemiaAtlas_256.dds',			2, 				2),
		('JFD_BOHEMIA_ATLAS', 				128, 		'JFD_BohemiaAtlas_128.dds',			2, 				2),
		('JFD_BOHEMIA_ATLAS', 				80, 		'JFD_BohemiaAtlas_80.dds',			2, 				2),
		('JFD_BOHEMIA_ATLAS', 				64, 		'JFD_BohemiaAtlas_64.dds',			2, 				2),
		('JFD_BOHEMIA_ATLAS', 				45, 		'JFD_BohemiaAtlas_45.dds',			2, 				2),
		('JFD_BOHEMIA_ATLAS', 				32, 		'JFD_BohemiaAtlas_32.dds',			2, 				2),
		('JFD_BOHEMIA_ALPHA_ATLAS', 		128, 		'JFD_BohemiaAlphaAtlas_128.dds',	2, 				2),
		('JFD_BOHEMIA_ALPHA_ATLAS', 		80, 		'JFD_BohemiaAlphaAtlas_80.dds',		1, 				1),
		('JFD_BOHEMIA_ALPHA_ATLAS', 		64, 		'JFD_BohemiaAlphaAtlas_64.dds',		1, 				1),
		('JFD_BOHEMIA_ALPHA_ATLAS', 		48, 		'JFD_BohemiaAlphaAtlas_48.dds',		1, 				1),
		('JFD_BOHEMIA_ALPHA_ATLAS', 		45, 		'JFD_BohemiaAlphaAtlas_45.dds',		1, 				1),
		('JFD_BOHEMIA_ALPHA_ATLAS', 		32, 		'JFD_BohemiaAlphaAtlas_32.dds',		1, 				1),
		('JFD_BOHEMIA_ALPHA_ATLAS', 		24, 		'JFD_BohemiaAlphaAtlas_24.dds',		1, 				1),
		('JFD_BOHEMIA_ALPHA_ATLAS', 		16, 		'JFD_BohemiaAlphaAtlas_16.dds',		1, 				1),
		('JFD_UNIT_FLAG_TABOR_ATLAS', 		32, 		'flag_Tabor_32.dds',				1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_BOHEMIA_ICON', 			0.819, 	0.796, 	0.807, 	1),
		('COLOR_PLAYER_JFD_BOHEMIA_BACKGROUND', 	0.356,	0.039,	0.007, 	1);
------------------------------
-- PlayerColors
------------------------------				
INSERT INTO PlayerColors 
		(Type, 							PrimaryColor, 						SecondaryColor, 						TextColor)
VALUES	('PLAYERCOLOR_JFD_BOHEMIA', 	'COLOR_PLAYER_JFD_BOHEMIA_ICON',	'COLOR_PLAYER_JFD_BOHEMIA_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------
INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 			LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_VACLAV_PEACE',	'Vaclav_Peace', 	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_VACLAV_WAR', 	'Vaclav_War', 		'DynamicResident');			
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 								SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_VACLAV_PEACE', 	'SND_LEADER_MUSIC_JFD_VACLAV_PEACE', 	'GAME_MUSIC', 	60, 		60, 		1, 			0),
		('AS2D_LEADER_MUSIC_JFD_VACLAV_WAR', 	'SND_LEADER_MUSIC_JFD_VACLAV_WAR', 		'GAME_MUSIC', 	60, 		60, 		1,			0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 					TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_BOHEMIAN_TABOR', 	'Unit', 	'sv_Tabor.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------
INSERT INTO ArtDefine_UnitInfos 
		(Type,								DamageStates,		Formation)
SELECT	'ART_DEF_UNIT_JFD_BOHEMIAN_TABOR',	DamageStates,		'ThreeInLine'
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_CHARIOT_ARCHER';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_JFD_BOHEMIAN_TABOR', 'ART_DEF_UNIT_MEMBER_TABOR', "1");	
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats
		(UnitMemberType,				EnableActions,	DisableActions,	MoveRadius,	ShortMoveRadius,	ChargeRadius,	AttackRadius,	RangedAttackRadius,	MoveRate,	ShortMoveRate,	TurnRateMin,	TurnRateMax,	TurnFacingRateMin,	TurnFacingRateMax,	RollRateMin,	RollRateMax,	PitchRateMin,	PitchRateMax,	LOSRadiusScale,	TargetRadius,	TargetHeight,	HasShortRangedAttack,	HasLongRangedAttack,	HasLeftRightAttack,	HasStationaryMelee,	HasStationaryRangedAttack,	HasRefaceAfterCombat,	ReformBeforeCombat,	HasIndependentWeaponFacing,	HasOpponentTracking,	HasCollisionAttack,	AttackAltitude,	AltitudeDecelerationDistance,	OnlyTurnInMovementActions,	RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_TABOR',	EnableActions,	DisableActions,	MoveRadius,	ShortMoveRadius,	ChargeRadius,	AttackRadius,	RangedAttackRadius,	MoveRate,	ShortMoveRate,	TurnRateMin,	TurnRateMax,	TurnFacingRateMin,	TurnFacingRateMax,	RollRateMin,	RollRateMax,	PitchRateMin,	PitchRateMax,	LOSRadiusScale,	TargetRadius,	TargetHeight,	HasShortRangedAttack,	HasLongRangedAttack,	HasLeftRightAttack,	HasStationaryMelee,	HasStationaryRangedAttack,	HasRefaceAfterCombat,	ReformBeforeCombat,	HasIndependentWeaponFacing,	HasOpponentTracking,	HasCollisionAttack,	AttackAltitude,	AltitudeDecelerationDistance,	OnlyTurnInMovementActions,	RushAttackFormation
FROM ArtDefine_UnitMemberCombats		WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CHARIOTARCHER';
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons 
		(UnitMemberType,				 "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_TABOR',	"Index", "SubIndex", "ID", "VisKillStrengthMin", "VisKillStrengthMax", "ProjectileSpeed", "ProjectileTurnRateMin", "ProjectileTurnRateMax", "HitEffect", "HitEffectScale", "HitRadius", "ProjectileChildEffectScale", "AreaDamageDelay", "ContinuousFire", "WaitForEffectCompletion", "TargetGround", "IsDropped", "WeaponTypeTag", "WeaponTypeSoundOverrideTag"
FROM ArtDefine_UnitMemberCombatWeapons	WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CHARIOTARCHER';
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos	
		(Type,							Scale,	ZOffset,	Domain,		Model,			MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_TABOR',	Scale,	ZOffset,	Domain,		'tabor.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos	WHERE Type = 'ART_DEF_UNIT_MEMBER_CHARIOTARCHER';
--==========================================================================================================================	
--==========================================================================================================================	
