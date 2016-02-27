--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_NORWAY_ATLAS', 					256, 		'JFD_NorwayAtlas_256.dds',				3, 				3),
		('JFD_NORWAY_ATLAS', 					128, 		'JFD_NorwayAtlas_128.dds',				3, 				3),
		('JFD_NORWAY_ATLAS', 					80, 		'JFD_NorwayAtlas_80.dds',				3, 				3),
		('JFD_NORWAY_ATLAS', 					64, 		'JFD_NorwayAtlas_64.dds',				3, 				3),
		('JFD_NORWAY_ATLAS', 					45, 		'JFD_NorwayAtlas_45.dds',				3, 				3),
		('JFD_NORWAY_ATLAS', 					32, 		'JFD_NorwayAtlas_32.dds',				3, 				3),
		('JFD_NORWAY_ALPHA_ATLAS', 				128, 		'JFD_NorwayAlphaAtlas_128.dds',			1, 				1),
		('JFD_NORWAY_ALPHA_ATLAS', 				80, 		'JFD_NorwayAlphaAtlas_80.dds',			1, 				1),
		('JFD_NORWAY_ALPHA_ATLAS', 				64, 		'JFD_NorwayAlphaAtlas_64.dds',			1, 				1),
		('JFD_NORWAY_ALPHA_ATLAS', 				48, 		'JFD_NorwayAlphaAtlas_48.dds',			1, 				1),
		('JFD_NORWAY_ALPHA_ATLAS', 				45, 		'JFD_NorwayAlphaAtlas_45.dds',			1, 				1),
		('JFD_NORWAY_ALPHA_ATLAS', 				32, 		'JFD_NorwayAlphaAtlas_32.dds',			1, 				1),
		('JFD_NORWAY_ALPHA_ATLAS', 				24, 		'JFD_NorwayAlphaAtlas_24.dds',			1, 				1),
		('JFD_NORWAY_ALPHA_ATLAS', 				16, 		'JFD_NorwayAlphaAtlas_16.dds',			1, 				1),
		('JFD_UNIT_FLAG_BIRKEBEINER_ATLAS', 	32, 		'Unit_Birkebeiner_Flag_32.dds',			1, 				1);
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 			LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_HAAKON_PEACE', 	'Haakon_Peace', 	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_HAAKON_WAR', 	'Haakon_War', 		'DynamicResident');			
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 								SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_HAAKON_PEACE', 		'SND_LEADER_MUSIC_JFD_HAAKON_PEACE', 	'GAME_MUSIC', 	60, 		60, 		1, 			0),
		('AS2D_LEADER_MUSIC_JFD_HAAKON_WAR', 		'SND_LEADER_MUSIC_JFD_HAAKON_WAR', 		'GAME_MUSIC', 	60, 		60, 		1,			0),
		('AS2D_LEADER_MUSIC_JFD_HAAKON_AMBIENCE', 	'SND_AMBIENCE_FOG_OF_WAR_BED', 			'GAME_SFX', 	60, 		60, 		0,			1);
--==========================================================================================================================
-- Colors
--==========================================================================================================================	
-- Colors
------------------------------	
INSERT INTO Colors 
		(Type, 									Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_NORWAY_ICON', 		0.849, 	0.619, 	0.125, 	1),
		('COLOR_PLAYER_JFD_NORWAY_BACKGROUND', 	0,		0.101,	0.2, 	1);
------------------------------
-- PlayerColors
------------------------------				
INSERT INTO PlayerColors 
		(Type, 						PrimaryColor, 					SecondaryColor, 						TextColor)
VALUES	('PLAYERCOLOR_JFD_NORWAY', 	'COLOR_PLAYER_JFD_NORWAY_ICON', 'COLOR_PLAYER_JFD_NORWAY_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_BIRKEBEINER', 	'Unit', 	'sv_Birkebeiner.dds');
------------------------------	
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_BIRKEBEINER',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_U_SAXON_HUSCARL';
------------------------------	
-- ArtDefine_UnitInfoMemberInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_JFD_BIRKEBEINER',		'ART_DEF_UNIT_MEMBER_U_SAXON_HUSCARL', 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_U_SAXON_HUSCARL';
--==========================================================================================================================	
--==========================================================================================================================	
