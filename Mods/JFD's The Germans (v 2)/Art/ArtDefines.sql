--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 								TileType,		Asset)
VALUES		('ART_DEF_UNIT_JFD_SLAGANZ', 						'Unit', 		'sv_Slaganz.dds'),
			('ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT', 				'Improvement', 	'sv_Encampment.dds'),
			('ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED', 	'Improvement', 	'sv_EncampmentUpgraded.dds');
--==========================================================================================================================
-- ArtDefine_LandmarkTypes
--==========================================================================================================================
INSERT INTO ArtDefine_LandmarkTypes 
			(Type, 									LandmarkType,	FriendlyName)
SELECT		('ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT'),	LandmarkType, 	('Tribal Camp')
FROM ArtDefine_LandmarkTypes WHERE (Type = 'ART_DEF_IMPROVEMENT_BARBARIAN_CAMP');

INSERT INTO ArtDefine_LandmarkTypes 
			(Type, 												LandmarkType,	FriendlyName)
SELECT		('ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED'),	LandmarkType, 	('Tribal Camp Upgraded')
FROM ArtDefine_LandmarkTypes WHERE (Type = 'ART_DEF_IMPROVEMENT_BARBARIAN_CAMP');
--==========================================================================================================================
-- ArtDefine_Landmarks
--==========================================================================================================================
INSERT INTO ArtDefine_Landmarks 
			(ImprovementType, 						Era,	State, Scale, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
SELECT		('ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT'),	Era, 	State, Scale, LayoutHandler, ResourceType, Model, TerrainContour, Tech
FROM ArtDefine_Landmarks WHERE (ImprovementType = 'ART_DEF_IMPROVEMENT_BARBARIAN_CAMP');

INSERT INTO ArtDefine_Landmarks 
			(ImprovementType, 								Era,			State,			Scale,	LayoutHandler,	ResourceType,			Model,					TerrainContour)
VALUES		('ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED', 'Ancient',		'Constructed',	1,		'RANDOM',		'ART_DEF_RESOURCE_ALL', 'mod_town1.fxsxml',		1),
			('ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED', 'Ancient',		'Pillaged',		1,		'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_mod_town1.fxsxml',	1),
			('ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED', 'Industrial',	'Constructed',	1,		'RANDOM',		'ART_DEF_RESOURCE_ALL', 'mod_town1.fxsxml',		1),
			('ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED', 'Industrial',	'Pillaged',		1,		'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_mod_town1.fxsxml',	1),
			('ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED', 'Ancient',		'Constructed',	1,		'RANDOM',		'ART_DEF_RESOURCE_ALL', 'mod_town2.fxsxml',		1),
			('ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED', 'Ancient',		'Pillaged',		1,		'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_mod_town2.fxsxml',	1),
			('ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED', 'Industrial',	'Constructed',	1,		'RANDOM',		'ART_DEF_RESOURCE_ALL', 'mod_town2.fxsxml',		1),
			('ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED', 'Industrial',	'Pillaged',		1,		'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_mod_town2.fxsxml',	1),
			('ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED', 'Ancient',		'Constructed',	1,		'RANDOM',		'ART_DEF_RESOURCE_ALL', 'mod_town3.fxsxml',		1),
			('ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED', 'Ancient',		'Pillaged',		1,		'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_mod_town3.fxsxml',	1),
			('ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED', 'Industrial',	'Constructed',	1,		'RANDOM',		'ART_DEF_RESOURCE_ALL', 'mod_town3.fxsxml',		1),
			('ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED', 'Industrial',	'Pillaged',		1,		'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_mod_town3.fxsxml',	1),
			('ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED', 'Ancient',		'Constructed',	1,		'RANDOM',		'ART_DEF_RESOURCE_ALL', 'mod_town4.fxsxml',		1),
			('ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED', 'Ancient',		'Pillaged',		1,		'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_med_town4.fxsxml',	1),
			('ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED', 'Industrial',	'Constructed',	1,		'RANDOM',		'ART_DEF_RESOURCE_ALL', 'mod_town4.fxsxml',		1),
			('ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED', 'Industrial',	'Pillaged',		1,		'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_mod_town4.fxsxml',	1);
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfos 
			(Type, 							DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_SLAGANZ'),	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT__WARRIOR');
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,						NumMembers)
SELECT		('ART_DEF_UNIT_JFD_SLAGANZ'),	('ART_DEF_UNIT_JFD_MEMBER_SLAGANZ'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT__WARRIOR');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_JFD_MEMBER_SLAGANZ'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WARRIOR');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_JFD_MEMBER_SLAGANZ'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WARRIOR');
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_JFD_MEMBER_SLAGANZ'),	Scale,	ZOffset, Domain, ('BearWarrior.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_WARRIOR');
--==========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 									IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_GERMANS_ATLAS', 						256, 		'JFD_GermansAtlas_256.dds',						3, 				1),
			('JFD_GERMANS_ATLAS', 						128, 		'JFD_GermansAtlas_128.dds',						3, 				1),
			('JFD_GERMANS_ATLAS', 						80, 		'JFD_GermansAtlas_80.dds',						3, 				1),
			('JFD_GERMANS_ATLAS', 						64, 		'JFD_GermansAtlas_64.dds',						3, 				1),
			('JFD_GERMANS_ATLAS', 						45, 		'JFD_GermansAtlas_45.dds',						3, 				1),
			('JFD_GERMANS_ATLAS', 						32, 		'JFD_GermansAtlas_32.dds',						3, 				1),
			('JFD_GERMANS_ALPHA_ATLAS', 				128, 		'JFD_GermansAlphaAtlas_128.dds',				1,				1),
			('JFD_GERMANS_ALPHA_ATLAS', 				80, 		'JFD_GermansAlphaAtlas_80.dds',					1, 				1),
			('JFD_GERMANS_ALPHA_ATLAS', 				64, 		'JFD_GermansAlphaAtlas_64.dds',					1, 				1),
			('JFD_GERMANS_ALPHA_ATLAS', 				48, 		'JFD_GermansAlphaAtlas_48.dds',					1, 				1),
			('JFD_GERMANS_ALPHA_ATLAS', 				45, 		'JFD_GermansAlphaAtlas_45.dds',					1, 				1),
			('JFD_GERMANS_ALPHA_ATLAS', 				32, 		'JFD_GermansAlphaAtlas_32.dds',					1, 				1),
			('JFD_GERMANS_ALPHA_ATLAS', 				24, 		'JFD_GermansAlphaAtlas_24.dds',					1, 				1),
			('JFD_GERMANS_ALPHA_ATLAS', 				16, 		'JFD_GermansAlphaAtlas_16.dds',					1, 				1),
			('JFD_UNIT_FLAG_SLAGANZ_ATLAS', 			32, 		'JFD_SlaganzUnitFlag_32.dds',					1, 				1),
			('JFD_GERMAN_TRIBES_ATLAS', 				256, 		'JFD_EncampmentAtlas_256.dds',					2, 				1),
			('JFD_GERMAN_TRIBES_ATLAS', 				64, 		'JFD_EncampmentAtlas_64.dds',					2, 				1),
			('JFD_UNIT_ACTION_ENCAMPMENT_ATLAS', 		64, 		'JFD_EncampmentUnitActionAtlas_64.dds',			1, 				1),
			('JFD_UNIT_ACTION_ENCAMPMENT_ATLAS', 		45, 		'JFD_EncampmentUnitActionAtlas_45.dds',			1, 				1),
			('JFD_UNIT_ACTION_ENCAMPMENT_GOLD_ATLAS', 	64, 		'JFD_EncampmentGoldUnitActionAtlas_64.dds',		1, 				1),
			('JFD_UNIT_ACTION_ENCAMPMENT_GOLD_ATLAS', 	45, 		'JFD_EncampmentGoldUnitActionAtlas_45.dds',		1, 				1);
--==========================================================================================================================
--==========================================================================================================================
