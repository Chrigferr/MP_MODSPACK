--==========================================================================================================================
-- Leaders
--==========================================================================================================================		
INSERT INTO Leaders 
			(Type, 						Description, 					Civilopedia, 											CivilopediaTag, 							ArtDefineTag, 				VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_JFD_ROBRECHT', 	'TXT_KEY_LEADER_JFD_ROBRECHT', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD__ROBRECHT_TEXT_1', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_ROBRECHT', 'Robrecht_Scene.xml',		4, 						2, 						2, 							7, 			6, 				5, 				2, 						5, 				5, 			4, 			4, 				4, 			2, 			'JFD_FLANDERS_ATLAS',	1),
			('LEADER_JFD_FLANDERS', 	'TXT_KEY_LEADER_JFD_FLANDERS', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD__FLANDERS_TEXT_1', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_FLANDERS', 'Robrecht_Scene.xml',		9, 						2, 						2, 							9, 			6, 				9, 				9, 						2, 				4, 			9, 			9, 				4, 			9, 			'JFD_FLANDERS_ATLAS_2',	0);
--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================					
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_ROBRECHT', 	'MAJOR_CIV_APPROACH_WAR', 			3),
			('LEADER_JFD_ROBRECHT', 	'MAJOR_CIV_APPROACH_HOSTILE', 		2),
			('LEADER_JFD_ROBRECHT', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
			('LEADER_JFD_ROBRECHT', 	'MAJOR_CIV_APPROACH_GUARDED', 		7),
			('LEADER_JFD_ROBRECHT', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
			('LEADER_JFD_ROBRECHT', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
			('LEADER_JFD_ROBRECHT', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6),
			('LEADER_JFD_FLANDERS', 	'MAJOR_CIV_APPROACH_WAR', 			9),
			('LEADER_JFD_FLANDERS', 	'MAJOR_CIV_APPROACH_HOSTILE', 		2),
			('LEADER_JFD_FLANDERS', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	9),
			('LEADER_JFD_FLANDERS', 	'MAJOR_CIV_APPROACH_GUARDED', 		2),
			('LEADER_JFD_FLANDERS', 	'MAJOR_CIV_APPROACH_AFRAID', 		2),
			('LEADER_JFD_FLANDERS', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		9),
			('LEADER_JFD_FLANDERS', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		2);
--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================					
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_ROBRECHT', 	'MINOR_CIV_APPROACH_IGNORE', 		6),
			('LEADER_JFD_ROBRECHT', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_JFD_ROBRECHT', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
			('LEADER_JFD_ROBRECHT', 	'MINOR_CIV_APPROACH_CONQUEST', 		5),
			('LEADER_JFD_ROBRECHT', 	'MINOR_CIV_APPROACH_BULLY', 		5),
			('LEADER_JFD_FLANDERS', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
			('LEADER_JFD_FLANDERS', 	'MINOR_CIV_APPROACH_FRIENDLY', 		9),
			('LEADER_JFD_FLANDERS', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	8),
			('LEADER_JFD_FLANDERS', 	'MINOR_CIV_APPROACH_CONQUEST', 		9),
			('LEADER_JFD_FLANDERS', 	'MINOR_CIV_APPROACH_BULLY', 		9);
--==========================================================================================================================
-- Leader_Flavors
--==========================================================================================================================					
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_ROBRECHT', 	'FLAVOR_OFFENSE', 					4),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_DEFENSE', 					7),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_CITY_DEFENSE', 				7),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_MILITARY_TRAINING', 		4),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_RECON', 					2),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_RANGED', 					2),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_MOBILE', 					3),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_NAVAL', 					3),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_NAVAL_RECON', 				2),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_AIR', 						3),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_EXPANSION', 				3),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_GROWTH', 					5),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_TILE_IMPROVEMENT', 			8),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_INFRASTRUCTURE', 			8),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_PRODUCTION', 				7),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_GOLD', 						6),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_SCIENCE', 					2),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_CULTURE', 					6),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_HAPPINESS', 				3),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_GREAT_PEOPLE', 				3),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_WONDER', 					2),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_RELIGION', 					4),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_DIPLOMACY', 				2),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_SPACESHIP', 				2),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_WATER_CONNECTION', 			3),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_ESPIONAGE', 				2),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_AIRLIFT', 					4),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_ROBRECHT', 	'FLAVOR_AIR_CARRIER', 				5),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_OFFENSE', 					9),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_DEFENSE', 					9),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_CITY_DEFENSE', 				2),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_MILITARY_TRAINING', 		9),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_RECON', 					2),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_RANGED', 					2),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_MOBILE', 					2),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_NAVAL', 					2),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_NAVAL_RECON', 				2),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_AIR', 						2),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_EXPANSION', 				9),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_GROWTH', 					6),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_TILE_IMPROVEMENT', 			8),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_INFRASTRUCTURE', 			8),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_PRODUCTION', 				8),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_GOLD', 						7),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_SCIENCE', 					3),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_CULTURE', 					3),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_HAPPINESS', 				3),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_GREAT_PEOPLE', 				2),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_WONDER', 					2),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_RELIGION', 					12),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_DIPLOMACY', 				4),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_SPACESHIP', 				2),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_WATER_CONNECTION', 			3),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_ESPIONAGE', 				2),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_AIRLIFT', 					4),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_FLANDERS', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================
-- Leader_Traits
--==========================================================================================================================
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_JFD_ROBRECHT', 'TRAIT_JFD_FLANDERS'),
			('LEADER_JFD_FLANDERS', 'TRAIT_JFD_FLANDERS');
--==========================================================================================================================			
--==========================================================================================================================	