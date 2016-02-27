--==========================================================================================================================
-- Leaders
--==========================================================================================================================		
INSERT INTO Leaders 
			(Type, 						Description, 					Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES		('LEADER_JFD_DEGAULLE', 	'TXT_KEY_LEADER_JFD_DEGAULLE', 	'TXT_KEY_LEADER_JFD_DEGAULLE_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_DEGAULLE', 	'DeGaulle_Scene.xml', 	7, 						6, 						6, 							8, 			2, 				6, 				7, 						3, 				3, 			7, 			1, 				7, 			5, 			'JFD_FRANCE_DEGAULLE_ATLAS',	1);
--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================					
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_DEGAULLE', 	'MAJOR_CIV_APPROACH_WAR', 			4),
			('LEADER_JFD_DEGAULLE', 	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
			('LEADER_JFD_DEGAULLE', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
			('LEADER_JFD_DEGAULLE', 	'MAJOR_CIV_APPROACH_GUARDED', 		9),
			('LEADER_JFD_DEGAULLE', 	'MAJOR_CIV_APPROACH_AFRAID', 		6),
			('LEADER_JFD_DEGAULLE', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
			('LEADER_JFD_DEGAULLE', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		2);
--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================					
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_DEGAULLE', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
			('LEADER_JFD_DEGAULLE', 	'MINOR_CIV_APPROACH_FRIENDLY', 		2),
			('LEADER_JFD_DEGAULLE', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
			('LEADER_JFD_DEGAULLE', 	'MINOR_CIV_APPROACH_CONQUEST', 		3),
			('LEADER_JFD_DEGAULLE', 	'MINOR_CIV_APPROACH_BULLY', 		3);
--==========================================================================================================================
-- Leader_Flavors
--==========================================================================================================================					
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_DEGAULLE', 	'FLAVOR_OFFENSE', 					6),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_DEFENSE', 					7),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_CITY_DEFENSE', 				6),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_MILITARY_TRAINING', 		5),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_RECON', 					4),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_RANGED', 					4),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_MOBILE', 					6),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_NAVAL', 					3),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_NAVAL_RECON', 				3),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_NAVAL_GROWTH', 				3),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_AIR', 						6),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_EXPANSION', 				6),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_GROWTH', 					3),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_PRODUCTION', 				4),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_GOLD', 						4),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_SCIENCE', 					5),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_CULTURE', 					8),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_HAPPINESS', 				4),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_GREAT_PEOPLE', 				5),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_WONDER', 					3),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_RELIGION', 					5),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_DIPLOMACY', 				4),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_SPACESHIP', 				3),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_NUKE', 						3),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_USE_NUKE', 					3),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_ESPIONAGE', 				5),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_AIRLIFT', 					5),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_DEGAULLE', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================
-- Leader_Traits
--==========================================================================================================================					
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_DEGAULLE', 	'TRAIT_JFD_FRANCE_DEGAULLE');
--==========================================================================================================================			
--==========================================================================================================================	