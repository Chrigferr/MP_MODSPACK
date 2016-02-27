--==========================================================================================================================	
-- Audio_Sounds
--==========================================================================================================================		
INSERT INTO Audio_Sounds 
			(SoundID, 									Filename, 			LoadType)
VALUES		('SND_LEADER_MUSIC_JFD_DEGAULLE_PEACE', 	'DeGaulle_Peace',		'DynamicResident'),
			('SND_LEADER_MUSIC_JFD_DEGAULLE_WAR', 		'DeGaulle_War', 		'DynamicResident');			
--==========================================================================================================================	
-- Audio_2DSounds
--==========================================================================================================================		
INSERT INTO Audio_2DSounds 
			(ScriptID, 									SoundID, 								SoundType, 		MinVolume, 	MaxVolume,  IsMusic,	Looping)
VALUES		('AS2D_LEADER_MUSIC_JFD_DEGAULLE_PEACE', 	'SND_LEADER_MUSIC_JFD_DEGAULLE_PEACE', 	'GAME_MUSIC', 	60, 		60, 		1, 			0),
			('AS2D_LEADER_MUSIC_JFD_DEGAULLE_WAR', 		'SND_LEADER_MUSIC_JFD_DEGAULLE_WAR', 	'GAME_MUSIC', 	60, 		60, 		1,			0);
--==========================================================================================================================		
--==========================================================================================================================		
