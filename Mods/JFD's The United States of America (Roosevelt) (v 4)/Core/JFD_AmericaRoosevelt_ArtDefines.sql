--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_AMERICA_ROOSEVELT_ATLAS', 		256, 		'JFD_AmericaRooseveltAtlas_256.dds',		2, 				2),
			('JFD_AMERICA_ROOSEVELT_ATLAS', 		128, 		'JFD_AmericaRooseveltAtlas_128.dds',		2, 				2),
			('JFD_AMERICA_ROOSEVELT_ATLAS', 		80, 		'JFD_AmericaRooseveltAtlas_80.dds',			2, 				2),
			('JFD_AMERICA_ROOSEVELT_ATLAS', 		64, 		'JFD_AmericaRooseveltAtlas_64.dds',			2, 				2),
			('JFD_AMERICA_ROOSEVELT_ATLAS', 		45, 		'JFD_AmericaRooseveltAtlas_45.dds',			2, 				2),
			('JFD_AMERICA_ROOSEVELT_ATLAS', 		32, 		'JFD_AmericaRooseveltAtlas_32.dds',			2, 				2),
			('JFD_AMERICA_ROOSEVELT_ALPHA_ATLAS', 	128, 		'JFD_AmericaRooseveltAlphaAtlas_128.dds',	1, 				1),
			('JFD_AMERICA_ROOSEVELT_ALPHA_ATLAS', 	80, 		'JFD_AmericaRooseveltAlphaAtlas_80.dds',	1, 				1),
			('JFD_AMERICA_ROOSEVELT_ALPHA_ATLAS', 	64, 		'JFD_AmericaRooseveltAlphaAtlas_64.dds',	1, 				1),
			('JFD_AMERICA_ROOSEVELT_ALPHA_ATLAS', 	48, 		'JFD_AmericaRooseveltAlphaAtlas_48.dds',	1, 				1),
			('JFD_AMERICA_ROOSEVELT_ALPHA_ATLAS', 	45, 		'JFD_AmericaRooseveltAlphaAtlas_45.dds',	1, 				1),
			('JFD_AMERICA_ROOSEVELT_ALPHA_ATLAS', 	32, 		'JFD_AmericaRooseveltAlphaAtlas_32.dds',	1, 				1),
			('JFD_AMERICA_ROOSEVELT_ALPHA_ATLAS', 	24, 		'JFD_AmericaRooseveltAlphaAtlas_24.dds',	1, 				1),
			('JFD_AMERICA_ROOSEVELT_ALPHA_ATLAS', 	16, 		'JFD_AmericaRooseveltAlphaAtlas_16.dds',	1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
			(Type, 												Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_JFD_AMERICA_ROOSEVELT_ICON', 		0.752,	0.752,	0.752,	1),
			('COLOR_PLAYER_JFD_AMERICA_ROOSEVELT_BACKGROUND', 	0.258,	0.345,	0.423,	1);
------------------------------	
-- PlayerColors
------------------------------				
INSERT INTO PlayerColors 
			(Type, 									PrimaryColor, 								SecondaryColor, 									TextColor)
VALUES		('PLAYERCOLOR_JFD_AMERICA_ROOSEVELT',	'COLOR_PLAYER_JFD_AMERICA_ROOSEVELT_ICON', 	'COLOR_PLAYER_JFD_AMERICA_ROOSEVELT_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 									Filename, 			LoadType)
VALUES		('SND_LEADER_MUSIC_JFD_ROOSEVELT_PEACE', 	'Roosevelt_Peace',	'DynamicResident'),
			('SND_LEADER_MUSIC_JFD_ROOSEVELT_WAR', 		'Roosevelt_War', 	'DynamicResident');			
------------------------------	
-- Audio_2DSounds
------------------------------		
INSERT INTO Audio_2DSounds 
			(ScriptID, 									SoundID, 								SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES		('AS2D_LEADER_MUSIC_JFD_ROOSEVELT_PEACE', 	'SND_LEADER_MUSIC_JFD_ROOSEVELT_PEACE', 'GAME_MUSIC', 	50, 		50, 		1, 		 0),
			('AS2D_LEADER_MUSIC_JFD_ROOSEVELT_WAR', 	'SND_LEADER_MUSIC_JFD_ROOSEVELT_WAR', 	'GAME_MUSIC', 	50, 		50, 		1,		 0);
--==========================================================================================================================	
--==========================================================================================================================	
