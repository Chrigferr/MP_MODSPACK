--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_EGYPT_AKHENATEN_ATLAS', 			256, 		'JFD_EgyptAkhenatenAtlas_256.dds',			2, 				2),
		('JFD_EGYPT_AKHENATEN_ATLAS', 			128, 		'JFD_EgyptAkhenatenAtlas_128.dds',			2, 				2),
		('JFD_EGYPT_AKHENATEN_ATLAS', 			80, 		'JFD_EgyptAkhenatenAtlas_80.dds',			2, 				2),
		('JFD_EGYPT_AKHENATEN_ATLAS', 			64, 		'JFD_EgyptAkhenatenAtlas_64.dds',			2, 				2),
		('JFD_EGYPT_AKHENATEN_ATLAS', 			45, 		'JFD_EgyptAkhenatenAtlas_45.dds',			2, 				2),
		('JFD_EGYPT_AKHENATEN_ATLAS', 			32, 		'JFD_EgyptAkhenatenAtlas_32.dds',			2, 				2),
		('JFD_EGYPT_AKHENATEN_ALPHA_ATLAS', 	128, 		'JFD_EgyptAkhenatenAlphaAtlas_128.dds',		1,				1),
		('JFD_EGYPT_AKHENATEN_ALPHA_ATLAS', 	80, 		'JFD_EgyptAkhenatenAlphaAtlas_80.dds',		1, 				1),
		('JFD_EGYPT_AKHENATEN_ALPHA_ATLAS', 	64, 		'JFD_EgyptAkhenatenAlphaAtlas_64.dds',		1, 				1),
		('JFD_EGYPT_AKHENATEN_ALPHA_ATLAS', 	48, 		'JFD_EgyptAkhenatenAlphaAtlas_48.dds',		1, 				1),
		('JFD_EGYPT_AKHENATEN_ALPHA_ATLAS', 	45, 		'JFD_EgyptAkhenatenAlphaAtlas_45.dds',		1, 				1),
		('JFD_EGYPT_AKHENATEN_ALPHA_ATLAS', 	32, 		'JFD_EgyptAkhenatenAlphaAtlas_32.dds',		1, 				1),
		('JFD_EGYPT_AKHENATEN_ALPHA_ATLAS', 	24, 		'JFD_EgyptAkhenatenAlphaAtlas_24.dds',		1, 				1),
		('JFD_EGYPT_AKHENATEN_ALPHA_ATLAS', 	16, 		'JFD_EgyptAkhenatenAlphaAtlas_16.dds',		1, 				1),
		('JFD_EGYPT_AKHENATEN_OBELISK_ATLAS', 	256, 		'JFD_EgyptAkhenatenObeliskAtlas_256.dds',	1, 				2),
		('JFD_EGYPT_AKHENATEN_OBELISK_ATLAS', 	64, 		'JFD_EgyptAkhenatenObeliskAtlas_64.dds',	1, 				2),
		('JFD_EGYPT_AKHENATEN_OBELISK_ATLAS', 	45, 		'JFD_EgyptAkhenatenObeliskAtlas_45.dds',	1, 				2),
		('JFD_EGYPT_AKHENATEN_RELIGION_ATLAS',  256, 		'JFD_EgyptAkhenatenReligionAtlas_256.dds',	1, 				12),
		('JFD_EGYPT_AKHENATEN_RELIGION_ATLAS',  214, 		'JFD_EgyptAkhenatenReligionAtlas_214.dds',	1, 				12),
		('JFD_EGYPT_AKHENATEN_RELIGION_ATLAS',  128, 		'JFD_EgyptAkhenatenReligionAtlas_128.dds',	1, 				12),
		('JFD_EGYPT_AKHENATEN_RELIGION_ATLAS',  80, 		'JFD_EgyptAkhenatenReligionAtlas_80.dds',	1, 				12),
		('JFD_EGYPT_AKHENATEN_RELIGION_ATLAS',  64, 		'JFD_EgyptAkhenatenReligionAtlas_64.dds',	1, 				12),
		('JFD_EGYPT_AKHENATEN_RELIGION_ATLAS',  48, 		'JFD_EgyptAkhenatenReligionAtlas_48.dds',	1, 				12),
		('JFD_EGYPT_AKHENATEN_RELIGION_ATLAS',  45, 		'JFD_EgyptAkhenatenReligionAtlas_45.dds',	1, 				12),
		('JFD_EGYPT_AKHENATEN_RELIGION_ATLAS',  32, 		'JFD_EgyptAkhenatenReligionAtlas_32.dds',	1, 				12),
		('JFD_EGYPT_AKHENATEN_RELIGION_ATLAS',  24, 		'JFD_EgyptAkhenatenReligionAtlas_24.dds',	1, 				12),
		('JFD_EGYPT_AKHENATEN_RELIGION_ATLAS',  16, 		'JFD_EgyptAkhenatenReligionAtlas_16.dds',	1, 				12),
		('JFD_KHOPESH_FLAG_ART_ATLAS', 			32, 		'JFD_KhopeshSwordsmanUnitFlag_32.dds',		1, 				1);
------------------------------
-- IconFontTextures
------------------------------	
INSERT INTO IconFontTextures 
		(IconFontTexture, 							IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_RELIGION_JFD_ATENISM', 	'AtenismFontIcons'),
		('ICON_FONT_TEXTURE_JFD_HYMN',				'HymnFontIcons');
------------------------------
-- IconFontMapping
------------------------------	
INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,							IconMapping)
VALUES	('ICON_JFD_HYMN',							'ICON_FONT_TEXTURE_JFD_HYMN',				1),
		('ICON_RELIGION_JFD_ATENISM',				'ICON_FONT_TEXTURE_RELIGION_JFD_ATENISM',	1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 											Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_EGYPT_AKHENATEN_ICON', 		0.278,	0.125,	0.466,	1),
		('COLOR_PLAYER_JFD_EGYPT_AKHENATEN_BACKGROUND',	0.874,	0.627,	0.223,	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 								TextColor)
VALUES	('PLAYERCOLOR_JFD_EGYPT_AKHENATEN',		'COLOR_PLAYER_JFD_EGYPT_AKHENATEN_ICON', 	'COLOR_PLAYER_JFD_EGYPT_AKHENATEN_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 			LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_AKHENATEN_PEACE', 	'Akhenaten_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_AKHENATEN_WAR', 		'Akhenaten_War', 	'DynamicResident'),
		('SND_SOUND_JFD_ATENISM', 					'JFD_Atenism',		'DynamicResident');
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 									SoundType, 		DontTriggerDuplicates,	TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_AKHENATEN_PEACE', 	'SND_LEADER_MUSIC_JFD_AKHENATEN_PEACE', 	'GAME_MUSIC', 	0,						-1.0,					60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_AKHENATEN_WAR', 	'SND_LEADER_MUSIC_JFD_AKHENATEN_WAR', 		'GAME_MUSIC', 	0,						-1.0,					60, 		60, 		1,		 0),
		('AS2D_SOUND_JFD_ATENISM', 					'SND_SOUND_JFD_ATENISM', 					'GAME_SFX', 	1,						0.0,					100, 		100, 		0, 		 0);
--==========================================================================================================================
-- UNIT/IMPROVEMENT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 					TileType,		Asset)
VALUES	('ART_DEF_IMPROVEMENT_MONOLITH_AFRI', 	'Improvement', 	'sv_Obelisk.dds'),
		('ART_DEF_UNIT_JFD_KHOPESH', 			'Unit', 		'sv_KhopeshSwordsman.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_KHOPESH',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_SPEARMAN';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_JFD_KHOPESH',		'ART_DEF_UNIT_MEMBER_JFD_KHOPESH',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SPEARMAN';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_KHOPESH',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SPEARMAN';
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_KHOPESH',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SPEARMAN';
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale,  ZOffset, Domain, Model, 						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_KHOPESH',	Scale,	ZOffset, Domain, 'Longswordsman_Egypt.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_SPEARMAN';
--==========================================================================================================================	
--==========================================================================================================================	
