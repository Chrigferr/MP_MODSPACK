--==========================================================================================================================
-- Leaders
--==========================================================================================================================		
INSERT INTO Leaders 
			(Type, 				Description, 				Civilopedia, 									CivilopediaTag, 						ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 			PortraitIndex)
VALUES		('LEADER_JFD_ERI', 	'TXT_KEY_LEADER_JFD_ERI', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD__ERI_TEXT_1', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_ERI', 'Eri_Scene.xml',		2, 						2, 						7, 							4, 			6, 				9, 				2, 						5, 				5, 			4, 			4, 				4, 			2, 			'JFD_NRI_ATLAS',	1);
--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================					
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 		MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_ERI', 	'MAJOR_CIV_APPROACH_WAR', 			0),
			('LEADER_JFD_ERI', 	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
			('LEADER_JFD_ERI', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	2),
			('LEADER_JFD_ERI', 	'MAJOR_CIV_APPROACH_GUARDED', 		8),
			('LEADER_JFD_ERI', 	'MAJOR_CIV_APPROACH_AFRAID', 		6),
			('LEADER_JFD_ERI', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_JFD_ERI', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================					
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 		MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_ERI', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
			('LEADER_JFD_ERI', 	'MINOR_CIV_APPROACH_FRIENDLY', 		9),
			('LEADER_JFD_ERI', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	8),
			('LEADER_JFD_ERI', 	'MINOR_CIV_APPROACH_CONQUEST', 		0),
			('LEADER_JFD_ERI', 	'MINOR_CIV_APPROACH_BULLY', 		0);
--==========================================================================================================================
-- Leader_Flavors
--==========================================================================================================================					
INSERT INTO Leader_Flavors 
			(LeaderType, 		FlavorType, 						Flavor)
VALUES		('LEADER_JFD_ERI', 	'FLAVOR_OFFENSE', 					2),
			('LEADER_JFD_ERI', 	'FLAVOR_DEFENSE', 					4),
			('LEADER_JFD_ERI', 	'FLAVOR_CITY_DEFENSE', 				3),
			('LEADER_JFD_ERI', 	'FLAVOR_MILITARY_TRAINING', 		2),
			('LEADER_JFD_ERI', 	'FLAVOR_RECON', 					2),
			('LEADER_JFD_ERI', 	'FLAVOR_RANGED', 					2),
			('LEADER_JFD_ERI', 	'FLAVOR_MOBILE', 					2),
			('LEADER_JFD_ERI', 	'FLAVOR_NAVAL', 					2),
			('LEADER_JFD_ERI', 	'FLAVOR_NAVAL_RECON', 				2),
			('LEADER_JFD_ERI', 	'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_JFD_ERI', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
			('LEADER_JFD_ERI', 	'FLAVOR_AIR', 						3),
			('LEADER_JFD_ERI', 	'FLAVOR_EXPANSION', 				2),
			('LEADER_JFD_ERI', 	'FLAVOR_GROWTH', 					7),
			('LEADER_JFD_ERI', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
			('LEADER_JFD_ERI', 	'FLAVOR_INFRASTRUCTURE', 			5),
			('LEADER_JFD_ERI', 	'FLAVOR_PRODUCTION', 				5),
			('LEADER_JFD_ERI', 	'FLAVOR_GOLD', 						7),
			('LEADER_JFD_ERI', 	'FLAVOR_SCIENCE', 					3),
			('LEADER_JFD_ERI', 	'FLAVOR_CULTURE', 					4),
			('LEADER_JFD_ERI', 	'FLAVOR_HAPPINESS', 				4),
			('LEADER_JFD_ERI', 	'FLAVOR_GREAT_PEOPLE', 				6),
			('LEADER_JFD_ERI', 	'FLAVOR_WONDER', 					2),
			('LEADER_JFD_ERI', 	'FLAVOR_RELIGION', 					12),
			('LEADER_JFD_ERI', 	'FLAVOR_DIPLOMACY', 				8),
			('LEADER_JFD_ERI', 	'FLAVOR_SPACESHIP', 				2),
			('LEADER_JFD_ERI', 	'FLAVOR_WATER_CONNECTION', 			3),
			('LEADER_JFD_ERI', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_ERI', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_ERI', 	'FLAVOR_ESPIONAGE', 				2),
			('LEADER_JFD_ERI', 	'FLAVOR_AIRLIFT', 					4),
			('LEADER_JFD_ERI', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_ERI', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_ERI', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_ERI', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_ERI', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_ERI', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================
-- Leader_Traits
--==========================================================================================================================
INSERT INTO Leader_Traits 
			(LeaderType, 		TraitType)
VALUES		('LEADER_JFD_ERI', 'TRAIT_JFD_NRI');
--==========================================================================================================================			
--==========================================================================================================================	