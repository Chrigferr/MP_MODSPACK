--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 			TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_GOEDENDAG', 	'Unit', 	'sv_Goedendag.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 							DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_GOEDENDAG'), DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE	(Type = 'ART_DEF_UNIT_PIKEMAN');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================	
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,						NumMembers)
SELECT		('ART_DEF_UNIT_JFD_GOEDENDAG'), ('ART_DEF_UNIT_MEMBER_JFD_GOEDENDAG'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_PIKEMAN');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_GOEDENDAG'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale,	ZOffset, Domain, Model,					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_GOEDENDAG'),	Scale,	ZOffset, Domain, ('Maceman.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_PIKEMAN');
--==========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_FLANDERS_ATLAS', 					256, 		'JFD_FlandersAtlas_256.dds',			4, 				1),
			('JFD_FLANDERS_ATLAS', 					128, 		'JFD_FlandersAtlas_128.dds',			4, 				1),
			('JFD_FLANDERS_ATLAS', 					80, 		'JFD_FlandersAtlas_80.dds',				4, 				1),
			('JFD_FLANDERS_ATLAS', 					64, 		'JFD_FlandersAtlas_64.dds',				4, 				1),
			('JFD_FLANDERS_ATLAS', 					45, 		'JFD_FlandersAtlas_45.dds',				4, 				1),
			('JFD_FLANDERS_ATLAS', 					32, 		'JFD_FlandersAtlas_32.dds',				4, 				1),
			('JFD_FLANDERS_ATLAS_2', 				256, 		'JFD_FlandersAtlas2_256.dds',			1, 				1),
			('JFD_FLANDERS_ATLAS_2', 				128, 		'JFD_FlandersAtlas2_128.dds',			1, 				1),
			('JFD_FLANDERS_ATLAS_2', 				64, 		'JFD_FlandersAtlas2_64.dds',			1, 				1),
			('JFD_FLANDERS_ALPHA_ATLAS', 			128, 		'JFD_FlandersAlphaAtlas_128.dds',		1, 				1),
			('JFD_FLANDERS_ALPHA_ATLAS', 			80, 		'JFD_FlandersAlphaAtlas_80.dds',		1, 				1),
			('JFD_FLANDERS_ALPHA_ATLAS', 			64, 		'JFD_FlandersAlphaAtlas_64.dds',		1, 				1),
			('JFD_FLANDERS_ALPHA_ATLAS', 			48, 		'JFD_FlandersAlphaAtlas_48.dds',		1, 				1),
			('JFD_FLANDERS_ALPHA_ATLAS', 			45, 		'JFD_FlandersAlphaAtlas_45.dds',		1, 				1),
			('JFD_FLANDERS_ALPHA_ATLAS', 			32, 		'JFD_FlandersAlphaAtlas_32.dds',		1, 				1),
			('JFD_FLANDERS_ALPHA_ATLAS', 			24, 		'JFD_FlandersAlphaAtlas_24.dds',		1, 				1),
			('JFD_FLANDERS_ALPHA_ATLAS', 			16, 		'JFD_FlandersAlphaAtlas_16.dds',		1, 				1),
			('JFD_UNIT_FLAG_GOEDENDAG_ATLAS', 		32, 		'JFD_GoedendagUnitFlag_32.dds',			1, 				1);
--==========================================================================================================================
--==========================================================================================================================