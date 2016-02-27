--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_SWITZERLAND_ATLAS', 					256, 		'JFD_SwitzerlandAtlas_256.dds',				2, 				2),
		('JFD_SWITZERLAND_ATLAS', 					128, 		'JFD_SwitzerlandAtlas_128.dds',				2, 				2),
		('JFD_SWITZERLAND_ATLAS', 					80, 		'JFD_SwitzerlandAtlas_80.dds',				2, 				2),
		('JFD_SWITZERLAND_ATLAS', 					64, 		'JFD_SwitzerlandAtlas_64.dds',				2, 				2),
		('JFD_SWITZERLAND_ATLAS', 					45, 		'JFD_SwitzerlandAtlas_45.dds',				2, 				2),
		('JFD_SWITZERLAND_ATLAS', 					32, 		'JFD_SwitzerlandAtlas_32.dds',				2, 				2),
		('JFD_SWITZERLAND_ALPHA_ATLAS', 			128, 		'JFD_SwitzerlandAlphaAtlas_128.dds',		2, 				2),
		('JFD_SWITZERLAND_ALPHA_ATLAS', 			80, 		'JFD_SwitzerlandAlphaAtlas_80.dds',			1, 				1),
		('JFD_SWITZERLAND_ALPHA_ATLAS', 			64, 		'JFD_SwitzerlandAlphaAtlas_64.dds',			1, 				1),
		('JFD_SWITZERLAND_ALPHA_ATLAS', 			48, 		'JFD_SwitzerlandAlphaAtlas_48.dds',			1, 				1),
		('JFD_SWITZERLAND_ALPHA_ATLAS', 			45, 		'JFD_SwitzerlandAlphaAtlas_45.dds',			1, 				1),
		('JFD_SWITZERLAND_ALPHA_ATLAS', 			32, 		'JFD_SwitzerlandAlphaAtlas_32.dds',			1, 				1),
		('JFD_SWITZERLAND_ALPHA_ATLAS', 			24, 		'JFD_SwitzerlandAlphaAtlas_24.dds',			1, 				1),
		('JFD_SWITZERLAND_ALPHA_ATLAS', 			16, 		'JFD_SwitzerlandAlphaAtlas_16.dds',			1, 				1),
		('JFD_SWITZERLAND_SPECIALIST_ATLAS', 		256, 		'JFD_SwitzerlandSpecialistAtlas_256.dds',	1, 				1),
		('JFD_SWITZERLAND_SPECIALIST_ATLAS', 		128, 		'JFD_SwitzerlandSpecialistAtlas_128.dds',	1, 				1),
		('JFD_SWITZERLAND_SPECIALIST_ATLAS', 		80, 		'JFD_SwitzerlandSpecialistAtlas_80.dds',	1, 				1),
		('JFD_SWITZERLAND_SPECIALIST_ATLAS', 		64, 		'JFD_SwitzerlandSpecialistAtlas_64.dds',	1, 				1),
		('JFD_SWITZERLAND_SPECIALIST_ATLAS', 		45, 		'JFD_SwitzerlandSpecialistAtlas_45.dds',	1, 				1),
		('JFD_SWITZERLAND_SPECIALIST_ATLAS', 		32, 		'JFD_SwitzerlandSpecialistAtlas_32.dds',	1, 				1),
		('JFD_UNIT_FLAG_COMBAT_MEDIC_ATLAS', 		32, 		'Unit_CombatMedic_Flag_32.dds',				1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_SWITZERLAND_ICON', 		0.576, 	0, 		0.094,	1),
		('COLOR_PLAYER_JFD_SWITZERLAND_BACKGROUND', 0.808,	0.765,	0.722, 	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 								PrimaryColor, 							SecondaryColor, 							TextColor)
VALUES	('PLAYERCOLOR_JFD_SWITZERLAND', 	'COLOR_PLAYER_JFD_SWITZERLAND_ICON', 	'COLOR_PLAYER_JFD_SWITZERLAND_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 			LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_DUFOUR_PEACE', 	'Dufour_Peace', 	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_DUFOUR_WAR', 	'Dufour_War', 		'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 								SoundType, 		MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES	('AS2D_AMBIENCE_LEADER_JFD_DUFOUR_AMBIENCE', 	'SND_AMBIENCE_CITY_MED_SMALL', 			'GAME_SFX', 	50, 		50, 		0, 		1),
		('AS2D_LEADER_MUSIC_JFD_DUFOUR_PEACE', 			'SND_LEADER_MUSIC_JFD_DUFOUR_PEACE', 	'GAME_MUSIC', 	50, 		50, 		1, 		0),
		('AS2D_LEADER_MUSIC_JFD_DUFOUR_WAR', 			'SND_LEADER_MUSIC_JFD_DUFOUR_WAR', 		'GAME_MUSIC', 	50, 		50, 		1,		0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_COMBAT_MEDIC', 	'Unit', 	'sv_CombatMedic.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							  DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_COMBAT_MEDIC',  DamageStates, Formation
FROM ArtDefine_UnitInfos WHERE	Type = 'ART_DEF_UNIT_RIFLEMAN';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 										DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_COMBAT_MEDIC_POSTMODERN', DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE	Type = 'ART_DEF_UNIT_RIFLEMAN';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_JFD_COMBAT_MEDIC', 	'ART_DEF_UNIT_MEMBER_JFD_COMBAT_MEDIC', NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,								UnitMemberInfoType,									NumMembers)
SELECT	'ART_DEF_UNIT_JFD_COMBAT_MEDIC_POSTMODERN', 'ART_DEF_UNIT_MEMBER_JFD_COMBAT_MEDIC_POSTMODERN',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_COMBAT_MEDIC',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_COMBAT_MEDIC_POSTMODERN',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_COMBAT_MEDIC',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_COMBAT_MEDIC_POSTMODERN',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale, ZOffset, Domain, Model, 				 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_COMBAT_MEDIC',	Scale, ZOffset, Domain, 'civ5_frerm.fxsxml', MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 												Scale, ZOffset, Domain, Model, 			 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_COMBAT_MEDIC_POSTMODERN',	Scale, ZOffset, Domain, 'ausgw1.fxsxml', MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
--==========================================================================================================================	
--==========================================================================================================================	
