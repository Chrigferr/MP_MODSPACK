--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_THE_VANDALS_ATLAS', 				256, 		'JFD_VandalsAtlas_256.dds',				4, 				1),
		('JFD_THE_VANDALS_ATLAS', 				128, 		'JFD_VandalsAtlas_128.dds',				4, 				1),
		('JFD_THE_VANDALS_ATLAS', 				80, 		'JFD_VandalsAtlas_80.dds',				4, 				1),
		('JFD_THE_VANDALS_ATLAS', 				64, 		'JFD_VandalsAtlas_64.dds',				4, 				1),
		('JFD_THE_VANDALS_ATLAS', 				45, 		'JFD_VandalsAtlas_45.dds',				4, 				1),
		('JFD_THE_VANDALS_ATLAS', 				32, 		'JFD_VandalsAtlas_32.dds',				4, 				1),
		('JFD_THE_VANDALS_ALPHA_ATLAS', 		128, 		'JFD_VandalsAlphaAtlas_128.dds',		2, 				2),
		('JFD_THE_VANDALS_ALPHA_ATLAS', 		80, 		'JFD_VandalsAlphaAtlas_80.dds',			1, 				1),
		('JFD_THE_VANDALS_ALPHA_ATLAS', 		64, 		'JFD_VandalsAlphaAtlas_64.dds',			1, 				1),
		('JFD_THE_VANDALS_ALPHA_ATLAS', 		48, 		'JFD_VandalsAlphaAtlas_48.dds',			1, 				1),
		('JFD_THE_VANDALS_ALPHA_ATLAS', 		45, 		'JFD_VandalsAlphaAtlas_45.dds',			1, 				1),
		('JFD_THE_VANDALS_ALPHA_ATLAS', 		32, 		'JFD_VandalsAlphaAtlas_32.dds',			1, 				1),
		('JFD_THE_VANDALS_ALPHA_ATLAS', 		24, 		'JFD_VandalsAlphaAtlas_24.dds',			1, 				1),
		('JFD_THE_VANDALS_ALPHA_ATLAS', 		16, 		'JFD_VandalsAlphaAtlas_16.dds',			1, 				1),
		('JFD_UNIT_FLAG_ALAN_CAVALRY_ATLAS', 	32, 		'JFD_AlanCavalryUnitFlag_32.dds',		1, 				1),
		('JFD_UNIT_FLAG_TRIHEMIOLIA_ATLAS', 	32, 		'JFD_TrihemioliaUnitFlag_32.dds',		1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_THE_VANDALS_ICON', 		0.341, 	0.066,	0, 		1),
		('COLOR_PLAYER_JFD_THE_VANDALS_BACKGROUND', 0.768,	0.529,	0.341, 	1);
------------------------------
-- PlayerColors
------------------------------				
INSERT INTO PlayerColors 
		(Type, 								PrimaryColor, 							SecondaryColor, 							TextColor)
VALUES	('PLAYERCOLOR_JFD_THE_VANDALS', 	'COLOR_PLAYER_JFD_THE_VANDALS_ICON', 	'COLOR_PLAYER_JFD_THE_VANDALS_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 				LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_GENSERIC_PEACE', 	'Genseric_Peace', 		'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_GENSERIC_WAR', 		'Genseric_War', 		'DynamicResident');			
------------------------------
-- Audio_2DSounds
------------------------------
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 									SoundType, 	MinVolume, 	MaxVolume, IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_GENSERIC_PEACE',	'SND_LEADER_MUSIC_JFD_GENSERIC_PEACE', 		'GAME_MUSIC', 120, 		120, 		1, 		0),
		('AS2D_LEADER_MUSIC_JFD_GENSERIC_WAR', 		'SND_LEADER_MUSIC_JFD_GENSERIC_WAR', 		'GAME_MUSIC', 120, 		120, 		1,		0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_ALAN_CAVALRY', 	'Unit', 	'sv_AlanCavalry.dds'),
		('ART_DEF_UNIT_JFD_TRIHEMIOLA', 	'Unit', 	'sv_Trihemiolia.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_ALAN_CAVALRY', 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_HORSEMAN';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_TRIHEMIOLA',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_TRIREME';
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT	'ART_DEF_UNIT_JFD_ALAN_CAVALRY', 	'ART_DEF_UNIT_MEMBER_JFD_ALAN_CAVALRY', 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_HORSEMAN';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT	'ART_DEF_UNIT_JFD_TRIHEMIOLA', 		'ART_DEF_UNIT_MEMBER_JFD_TRIHEMIOLA',		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_TRIREME';
------------------------------
-- ArtDefine_UnitInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_ALAN_CAVALRY',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_HORSEMAN';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_TRIHEMIOLA',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_TRIREME';
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_ALAN_CAVALRY',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_HORSEMAN';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_TRIHEMIOLA',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_TRIREME';
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale, ZOffset, Domain, Model, 						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_ALAN_CAVALRY',	Scale, ZOffset, Domain, 'Horseman_Turkey.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_HORSEMAN';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,		ZOffset, Domain, Model,  MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_TRIHEMIOLA',	Scale+0.01,	ZOffset, Domain, Model,  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_TRIREME';

UPDATE ArtDefine_UnitMemberInfos 
SET Model = (CASE WHEN EXISTS(SELECT Model FROM ArtDefine_UnitMemberInfos WHERE Model = 'U_Carthage_Quinquereme.fxsxml' )
	THEN 'U_Carthage_Quinquereme.fxsxml'
	ELSE 'Trireme.fxsxml' END) 
WHERE Type = 'ART_DEF_UNIT_MEMBER_JFD_TRIHEMIOLA';
--==========================================================================================================================	
--==========================================================================================================================	
