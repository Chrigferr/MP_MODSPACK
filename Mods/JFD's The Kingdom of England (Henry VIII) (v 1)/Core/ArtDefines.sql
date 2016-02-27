--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_ENGLAND_HENRY_ATLAS', 			256, 		'JFD_EnglandHenryAtlas_256.dds',			2, 				2),
			('JFD_ENGLAND_HENRY_ATLAS', 			128, 		'JFD_EnglandHenryAtlas_128.dds',			2, 				2),
			('JFD_ENGLAND_HENRY_ATLAS', 			80, 		'JFD_EnglandHenryAtlas_80.dds',				2, 				2),
			('JFD_ENGLAND_HENRY_ATLAS', 			64, 		'JFD_EnglandHenryAtlas_64.dds',				2, 				2),
			('JFD_ENGLAND_HENRY_ATLAS', 			45, 		'JFD_EnglandHenryAtlas_45.dds',				2, 				2),
			('JFD_ENGLAND_HENRY_ATLAS', 			32, 		'JFD_EnglandHenryAtlas_32.dds',				2, 				2),
			('JFD_ENGLAND_HENRY_ALPHA_ATLAS', 		128, 		'JFD_EnglandHenryAlphaAtlas_128.dds',		1,				1),
			('JFD_ENGLAND_HENRY_ALPHA_ATLAS', 		80, 		'JFD_EnglandHenryAlphaAtlas_80.dds',		1, 				1),
			('JFD_ENGLAND_HENRY_ALPHA_ATLAS', 		64, 		'JFD_EnglandHenryAlphaAtlas_64.dds',		1, 				1),
			('JFD_ENGLAND_HENRY_ALPHA_ATLAS', 		48, 		'JFD_EnglandHenryAlphaAtlas_48.dds',		1, 				1),
			('JFD_ENGLAND_HENRY_ALPHA_ATLAS', 		45, 		'JFD_EnglandHenryAlphaAtlas_45.dds',		1, 				1),
			('JFD_ENGLAND_HENRY_ALPHA_ATLAS', 		32, 		'JFD_EnglandHenryAlphaAtlas_32.dds',		1, 				1),
			('JFD_ENGLAND_HENRY_ALPHA_ATLAS', 		24, 		'JFD_EnglandHenryAlphaAtlas_24.dds',		1, 				1),
			('JFD_ENGLAND_HENRY_ALPHA_ATLAS', 		16, 		'JFD_EnglandHenryAlphaAtlas_16.dds',		1, 				1);	
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
			(Type, 											Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_JFD_ENGLAND_HENRY_ICON', 		0.854,	0.870,	0.588,	1),
			('COLOR_PLAYER_JFD_ENGLAND_HENRY_BACKGROUND',	0.274,	0.462,	0.137,	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
			(Type, 									PrimaryColor, 							SecondaryColor, 								TextColor)
VALUES		('PLAYERCOLOR_JFD_ENGLAND_HENRY',		'COLOR_PLAYER_JFD_ENGLAND_HENRY_ICON', 	'COLOR_PLAYER_JFD_ENGLAND_HENRY_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 			LoadType)
VALUES		('SND_LEADER_MUSIC_JFD_HENRY_PEACE', 	'Henry_Peace',		'DynamicResident'),
			('SND_LEADER_MUSIC_JFD_HENRY_WAR', 		'Henry_War', 		'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
			(ScriptID, 								SoundID, 								SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES		('AS2D_LEADER_MUSIC_JFD_HENRY_PEACE', 	'SND_LEADER_MUSIC_JFD_HENRY_PEACE', 	'GAME_MUSIC', 	60, 		60, 		1, 		 0),
			('AS2D_LEADER_MUSIC_JFD_HENRY_WAR', 	'SND_LEADER_MUSIC_JFD_HENRY_WAR', 		'GAME_MUSIC', 	60, 		60, 		1,		 0);
--==========================================================================================================================	
--==========================================================================================================================	
