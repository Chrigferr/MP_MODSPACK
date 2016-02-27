--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_RUSSIA_ALEXANDER_I_ATLAS', 		256, 		'JFD_RussiaAlexanderIAtlas_256.dds',		2, 				2),
		('JFD_RUSSIA_ALEXANDER_I_ATLAS', 		128, 		'JFD_RussiaAlexanderIAtlas_128.dds',		2, 				2),
		('JFD_RUSSIA_ALEXANDER_I_ATLAS', 		80, 		'JFD_RussiaAlexanderIAtlas_80.dds',			2, 				2),
		('JFD_RUSSIA_ALEXANDER_I_ATLAS', 		64, 		'JFD_RussiaAlexanderIAtlas_64.dds',			2, 				2),
		('JFD_RUSSIA_ALEXANDER_I_ATLAS', 		45, 		'JFD_RussiaAlexanderIAtlas_45.dds',			2, 				2),
		('JFD_RUSSIA_ALEXANDER_I_ATLAS', 		32, 		'JFD_RussiaAlexanderIAtlas_32.dds',			2, 				2),
		('JFD_RUSSIA_ALEXANDER_I_ALPHA_ATLAS', 	128, 		'JFD_RussiaAlexanderIAlphaAtlas_128.dds',	1,				1),
		('JFD_RUSSIA_ALEXANDER_I_ALPHA_ATLAS', 	80, 		'JFD_RussiaAlexanderIAlphaAtlas_80.dds',	1, 				1),
		('JFD_RUSSIA_ALEXANDER_I_ALPHA_ATLAS', 	64, 		'JFD_RussiaAlexanderIAlphaAtlas_64.dds',	1, 				1),
		('JFD_RUSSIA_ALEXANDER_I_ALPHA_ATLAS', 	48, 		'JFD_RussiaAlexanderIAlphaAtlas_48.dds',	1, 				1),
		('JFD_RUSSIA_ALEXANDER_I_ALPHA_ATLAS', 	45, 		'JFD_RussiaAlexanderIAlphaAtlas_45.dds',	1, 				1),
		('JFD_RUSSIA_ALEXANDER_I_ALPHA_ATLAS', 	32, 		'JFD_RussiaAlexanderIAlphaAtlas_32.dds',	1, 				1),
		('JFD_RUSSIA_ALEXANDER_I_ALPHA_ATLAS', 	24, 		'JFD_RussiaAlexanderIAlphaAtlas_24.dds',	1, 				1),
		('JFD_RUSSIA_ALEXANDER_I_ALPHA_ATLAS', 	16, 		'JFD_RussiaAlexanderIAlphaAtlas_16.dds',	1, 				1),
		('JFD_LEIB_GVARDE_FLAG_ART_ATLAS',		32, 		'JFD_LeibgvardiaUnitFlag_32.dds',			1, 				1),
		('JFD_LICORNE_FLAG_ART_ATLAS', 			32, 		'JFD_LicorneUnitFlag_32.dds',				1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 												Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_RUSSIA_ALEXANDER_I_ICON', 		0.670, 	0.662, 	0.074, 	1),
		('COLOR_PLAYER_JFD_RUSSIA_ALEXANDER_I_BACKGROUND',	0.031, 	0.443, 	0.074, 	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 									TextColor)
VALUES	('PLAYERCOLOR_JFD_RUSSIA_ALEXANDER_I',	'COLOR_PLAYER_JFD_RUSSIA_ALEXANDER_I_ICON', 'COLOR_PLAYER_JFD_RUSSIA_ALEXANDER_I_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 				LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_ALEXANDER_I_PEACE', 	'AlexanderI_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_ALEXANDER_I_WAR', 	'AlexanderI_War', 		'DynamicResident');
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 									SoundType, 			TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_ALEXANDER_I_PEACE', 'SND_LEADER_MUSIC_JFD_ALEXANDER_I_PEACE',	'GAME_MUSIC', 		-1.0,					60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_ALEXANDER_I_WAR', 	'SND_LEADER_MUSIC_JFD_ALEXANDER_I_WAR', 	'GAME_MUSIC', 		-1.0,					60, 		60, 		1,		 0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,		Asset)
VALUES	('ART_DEF_UNIT_JFD_LEIB_GVARDE', 	'Unit', 		'sv_Leibgvardia.dds'),
		('ART_DEF_UNIT_JFD_LICORNE', 		'Unit', 		'sv_Licorne.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_LEIB_GVARDE',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_RIFLEMAN';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_LICORNE',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_CANNON';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_JFD_LEIB_GVARDE', 'ART_DEF_UNIT_MEMBER_JFD_LEIB_GVARDE',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_JFD_LICORNE', 	'ART_DEF_UNIT_MEMBER_JFD_LICORNE',		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_CANNON';
------------------------
-- ArtDefine_UnitMemberCombats
------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_LEIB_GVARDE',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_LICORNE',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CANNON';
------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_LEIB_GVARDE',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_LICORNE',		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CANNON';
------------------------
-- ArtDefine_UnitMemberInfos
------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_LEIB_GVARDE',	Scale,	ZOffset, Domain, 'civ5_rusmm2.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 			 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_LICORNE',		Scale,	ZOffset, Domain, 'Licorne.fxsxml',	 MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_CANNON';
--==========================================================================================================================	
--==========================================================================================================================	
