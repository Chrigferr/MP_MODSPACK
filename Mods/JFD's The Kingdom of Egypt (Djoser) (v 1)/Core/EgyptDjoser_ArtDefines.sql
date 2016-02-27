--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_EGYPT_DJOSER_ATLAS', 				256, 		'JFD_EgyptDjoserAtlas_256.dds',			2, 				2),
		('JFD_EGYPT_DJOSER_ATLAS', 				128, 		'JFD_EgyptDjoserAtlas_128.dds',			2, 				2),
		('JFD_EGYPT_DJOSER_ATLAS', 				80, 		'JFD_EgyptDjoserAtlas_80.dds',			2, 				2),
		('JFD_EGYPT_DJOSER_ATLAS', 				64, 		'JFD_EgyptDjoserAtlas_64.dds',			2, 				2),
		('JFD_EGYPT_DJOSER_ATLAS', 				45, 		'JFD_EgyptDjoserAtlas_45.dds',			2, 				2),
		('JFD_EGYPT_DJOSER_ATLAS', 				32, 		'JFD_EgyptDjoserAtlas_32.dds',			2, 				2),
		('JFD_EGYPT_DJOSER_ALPHA_ATLAS', 		128, 		'JFD_EgyptDjoserAlphaAtlas_128.dds',	1,				1),
		('JFD_EGYPT_DJOSER_ALPHA_ATLAS', 		80, 		'JFD_EgyptDjoserAlphaAtlas_80.dds',		1, 				1),
		('JFD_EGYPT_DJOSER_ALPHA_ATLAS', 		64, 		'JFD_EgyptDjoserAlphaAtlas_64.dds',		1, 				1),
		('JFD_EGYPT_DJOSER_ALPHA_ATLAS', 		48, 		'JFD_EgyptDjoserAlphaAtlas_48.dds',		1, 				1),
		('JFD_EGYPT_DJOSER_ALPHA_ATLAS', 		45, 		'JFD_EgyptDjoserAlphaAtlas_45.dds',		1, 				1),
		('JFD_EGYPT_DJOSER_ALPHA_ATLAS', 		32, 		'JFD_EgyptDjoserAlphaAtlas_32.dds',		1, 				1),
		('JFD_EGYPT_DJOSER_ALPHA_ATLAS', 		24, 		'JFD_EgyptDjoserAlphaAtlas_24.dds',		1, 				1),
		('JFD_EGYPT_DJOSER_ALPHA_ATLAS', 		16, 		'JFD_EgyptDjoserAlphaAtlas_16.dds',		1, 				1),
		('JFD_EGYPT_DJOSER_RESOURCE_ATLAS', 	256, 		'JFD_EgyptDjoserResourceAtlas_256.dds',	1, 				1),
		('JFD_EGYPT_DJOSER_RESOURCE_ATLAS', 	128, 		'JFD_EgyptDjoserResourceAtlas_128.dds',	1, 				1),
		('JFD_EGYPT_DJOSER_RESOURCE_ATLAS', 	80, 		'JFD_EgyptDjoserResourceAtlas_80.dds',	1, 				1),
		('JFD_EGYPT_DJOSER_RESOURCE_ATLAS', 	64, 		'JFD_EgyptDjoserResourceAtlas_64.dds',	1, 				1),
		('JFD_EGYPT_DJOSER_RESOURCE_ATLAS', 	45, 		'JFD_EgyptDjoserResourceAtlas_45.dds',	1, 				1),
		('JFD_EGYPT_DJOSER_RESOURCE_ATLAS', 	32, 		'JFD_EgyptDjoserResourceAtlas_32.dds',	1, 				1),
		('JFD_VIZIER_FLAG_ART_ATLAS', 			32, 		'JFD_VizierUnitFlag_32.dds',			1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 											Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_EGYPT_DJOSER_ICON', 			0.886,	0.854,	0.611,	1),
		('COLOR_PLAYER_JFD_EGYPT_DJOSER_BACKGROUND',	0.576,	0.423,	0,		1);
------------------------------
-- IconFontTextures
------------------------------
INSERT INTO IconFontTextures 
		(IconFontTexture, 						IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_JFD_LIMESTONE',		'JFD_LimestoneFontIcon_22');
------------------------------
-- IconFontMapping
------------------------------
INSERT INTO IconFontMapping 
		(IconName, 					IconFontTexture,					IconMapping)
VALUES	('ICON_RES_JFD_LIMESTONE', 	'ICON_FONT_TEXTURE_JFD_LIMESTONE',	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 							SecondaryColor, 							TextColor)
VALUES	('PLAYERCOLOR_JFD_EGYPT_DJOSER',		'COLOR_PLAYER_JFD_EGYPT_DJOSER_ICON', 	'COLOR_PLAYER_JFD_EGYPT_DJOSER_BACKGROUND', 'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 			LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_DJOSER_PEACE', 		'Djoser_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_DJOSER_WAR', 		'Djoser_War', 		'DynamicResident'),
		('SND_SOUND_JFD_PING', 						'DiscoveredBonus',	'DynamicResident');
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 								SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_DJOSER_PEACE', 		'SND_LEADER_MUSIC_JFD_DJOSER_PEACE', 	'GAME_MUSIC', 	-1.0,					60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_DJOSER_WAR', 		'SND_LEADER_MUSIC_JFD_DJOSER_WAR', 		'GAME_MUSIC', 	-1.0,					60, 		60, 		1,		 0),
		('AS2D_SOUND_JFD_PING', 					'SND_SOUND_JFD_PING', 					'GAME_SFX', 	-1.0,					100, 		100, 		0, 		 0);
--==========================================================================================================================
-- UNIT/RESOURCE GRAPHICS
--==========================================================================================================================	
-- ArtDefine_LandmarkTypes
------------------------------
INSERT INTO ArtDefine_LandmarkTypes 
		(Type,								LandmarkType,	FriendlyName) 
VALUES	('ART_DEF_RESOURCE_JFD_LIMESTONE',	'Resource',		'Limestone');
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,		Asset)
VALUES	('ART_DEF_RESOURCE_JFD_LIMESTONE', 	'Resource', 	'sv_Limestone.dds'),
		('ART_DEF_UNIT_JFD_VIZIER', 		'Unit', 		'sv_Vizier.dds');
------------------------------
-- ArtDefine_Landmarks
------------------------------
INSERT INTO ArtDefine_Landmarks 
		(Era,				State,					Scale,	ImprovementType,				LayoutHandler,	ResourceType,						Model,								TerrainContour)
VALUES	('Any',				'Any',					1,		'ART_DEF_IMPROVEMENT_NONE',		'SNAPSHOT',		'ART_DEF_RESOURCE_JFD_LIMESTONE',	'Limestone.fxsxml',					1),
		('Ancient',			'Constructed',			1,		'ART_DEF_IMPROVEMENT_QUARRY',	'SNAPSHOT',		'ART_DEF_RESOURCE_JFD_LIMESTONE',	'anc_limestone_quarry.fxsxml',		1),
		('Ancient',			'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_QUARRY',	'SNAPSHOT',		'ART_DEF_RESOURCE_JFD_LIMESTONE',	'hb_anc_limestone_quarry.fxsxml',	1),
		('Ancient',			'Pillaged',				1,		'ART_DEF_IMPROVEMENT_QUARRY',	'SNAPSHOT',		'ART_DEF_RESOURCE_JFD_LIMESTONE',	'PL_Anc_Stone_Quarry.fxsxml',		1),
		('Industrial',		'Constructed',			1,		'ART_DEF_IMPROVEMENT_QUARRY',	'SNAPSHOT',		'ART_DEF_RESOURCE_JFD_LIMESTONE',	'ind_limestone_quarry.fxsxml',		1),
		('Industrial',		'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_QUARRY',	'SNAPSHOT',		'ART_DEF_RESOURCE_JFD_LIMESTONE',	'hb_ind_limestone_quarry.fxsxml',	1),
		('Industrial',		'Pillaged',				1,		'ART_DEF_IMPROVEMENT_QUARRY',	'SNAPSHOT',		'ART_DEF_RESOURCE_JFD_LIMESTONE',	'PL_IND_Stone_Quarry.fxsxml',		1);
------------------------------
-- ArtDefine_UnitInfos
------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 						DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_VIZIER',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_ENGINEER';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,				UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_JFD_VIZIER', 	'ART_DEF_UNIT_MEMBER_JFD_VIZIER',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_ENGINEER';
------------------------
-- ArtDefine_UnitMemberCombats
------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_VIZIER',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATENGINEER_EARLY';
------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_VIZIER',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATENGINEER_EARLY';
------------------------
-- ArtDefine_UnitMemberInfos
------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale,	ZOffset, Domain, Model, 			MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_VIZIER',	Scale,	ZOffset, Domain, 'Vizier.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_GREATENGINEER_EARLY';
--==========================================================================================================================	
--==========================================================================================================================	
