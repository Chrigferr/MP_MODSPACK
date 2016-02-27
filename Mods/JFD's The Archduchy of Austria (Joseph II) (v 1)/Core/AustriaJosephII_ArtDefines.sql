--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_AUSTRIA_JOSEPH_II_ATLAS', 		256, 		'JFD_AustriaJosephIIAtlas_256.dds',			2, 				2),
		('JFD_AUSTRIA_JOSEPH_II_ATLAS', 		128, 		'JFD_AustriaJosephIIAtlas_128.dds',			2, 				2),
		('JFD_AUSTRIA_JOSEPH_II_ATLAS', 		80, 		'JFD_AustriaJosephIIAtlas_80.dds',			2, 				2),
		('JFD_AUSTRIA_JOSEPH_II_ATLAS', 		64, 		'JFD_AustriaJosephIIAtlas_64.dds',			2, 				2),
		('JFD_AUSTRIA_JOSEPH_II_ATLAS', 		45, 		'JFD_AustriaJosephIIAtlas_45.dds',			2, 				2),
		('JFD_AUSTRIA_JOSEPH_II_ATLAS', 		32, 		'JFD_AustriaJosephIIAtlas_32.dds',			2, 				2),
		('JFD_AUSTRIA_JOSEPH_II_ALPHA_ATLAS', 	128, 		'JFD_AustriaJosephIIAlphaAtlas_128.dds',	1,				1),
		('JFD_AUSTRIA_JOSEPH_II_ALPHA_ATLAS', 	80, 		'JFD_AustriaJosephIIAlphaAtlas_80.dds',		1, 				1),
		('JFD_AUSTRIA_JOSEPH_II_ALPHA_ATLAS', 	64, 		'JFD_AustriaJosephIIAlphaAtlas_64.dds',		1, 				1),
		('JFD_AUSTRIA_JOSEPH_II_ALPHA_ATLAS', 	48, 		'JFD_AustriaJosephIIAlphaAtlas_48.dds',		1, 				1),
		('JFD_AUSTRIA_JOSEPH_II_ALPHA_ATLAS', 	45, 		'JFD_AustriaJosephIIAlphaAtlas_45.dds',		1, 				1),
		('JFD_AUSTRIA_JOSEPH_II_ALPHA_ATLAS', 	32, 		'JFD_AustriaJosephIIAlphaAtlas_32.dds',		1, 				1),
		('JFD_AUSTRIA_JOSEPH_II_ALPHA_ATLAS', 	24, 		'JFD_AustriaJosephIIAlphaAtlas_24.dds',		1, 				1),
		('JFD_AUSTRIA_JOSEPH_II_ALPHA_ATLAS', 	16, 		'JFD_AustriaJosephIIAlphaAtlas_16.dds',		1, 				1),
		('JFD_GRENADIER_FLAG_ART_ATLAS', 		32, 		'JFD_AustrianGrenadierUnitFlag_32.dds',		1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 												Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_AUSTRIA_JOSEPH_II_ICON', 		0, 		0, 		0, 		1),
		('COLOR_PLAYER_JFD_AUSTRIA_JOSEPH_II_BACKGROUND',	0.819, 	0.717, 	0.031, 	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 								 TextColor)
VALUES	('PLAYERCOLOR_JFD_AUSTRIA_JOSEPH_II',	'COLOR_PLAYER_JFD_AUSTRIA_JOSEPH_II_ICON', 	'COLOR_PLAYER_JFD_AUSTRIA_JOSEPH_II_BACKGROUND', 'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 				LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_JOSEPH_II_MOZART', 	'GW_MozartMagicFlute',	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_JOSEPH_II_PEACE', 	'Joseph_Peace',			'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_JOSEPH_II_WAR', 		'Joseph_War', 			'DynamicResident');
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 									SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_JOSEPH_II_MOZART', 	'SND_LEADER_MUSIC_JFD_JOSEPH_II_MOZART',	'GAME_MUSIC_STINGS', 	0.0,					60, 		60, 		0, 		 0),
		('AS2D_LEADER_MUSIC_JFD_JOSEPH_II_PEACE', 	'SND_LEADER_MUSIC_JFD_JOSEPH_II_PEACE',		'GAME_MUSIC', 			-1.0,					60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_JOSEPH_II_WAR', 	'SND_LEADER_MUSIC_JFD_JOSEPH_II_WAR', 		'GAME_MUSIC', 			-1.0,					60, 		60, 		1,		 0);
--==========================================================================================================================
-- UNIT/RESOURCE GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,		Asset)
VALUES	('ART_DEF_UNIT_JFD_GRENADIER', 	'Unit', 		'sv_AustrianGrenadier.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_GRENADIER',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_RIFLEMAN';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_JFD_GRENADIER', 	'ART_DEF_UNIT_MEMBER_JFD_GRENADIER',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN';
------------------------
-- ArtDefine_UnitMemberCombats
------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_GRENADIER',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_GRENADIER',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
------------------------
-- ArtDefine_UnitMemberInfos
------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 			 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_GRENADIER',	Scale,	ZOffset, Domain, 'Grenadier.fxsxml', MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
--==========================================================================================================================	
--==========================================================================================================================	
