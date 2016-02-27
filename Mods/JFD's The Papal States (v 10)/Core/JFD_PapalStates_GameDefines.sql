--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
			(Type, 						 		 		DefaultBuilding, 						Description)
VALUES		('BUILDINGCLASS_JFD_SWISS_GUARD_TOURISM', 	'BUILDING_JFD_SWISS_GUARD_TOURISM', 	'TXT_KEY_BUILDING_JFD_SWISS_GUARD_TOURISM'),
			('BUILDINGCLASS_JFD_CHAPEL_MUSIC', 			null, 									'TXT_KEY_BUILDING_JFD_CHAPEL'),
			('BUILDINGCLASS_JFD_CHAPEL_ART', 			null, 									'TXT_KEY_BUILDING_JFD_CHAPEL');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------		
INSERT INTO Buildings 	
			(Type, 								BuildingClass, Cost, Capital, NukeImmune, MinAreaSize, Defense, ArtInfoCulturalVariation, DisplayPosition, GreatWorkSlotType, GreatWorkCount, NeverCapture, Description, 								Civilopedia, 									Help, 	Strategy,											PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_APOSTOLIC_PALACE'), 	BuildingClass, Cost, Capital, NukeImmune, MinAreaSize, Defense, ArtInfoCulturalVariation, DisplayPosition, GreatWorkSlotType, GreatWorkCount, NeverCapture, ('TXT_KEY_BUILDING_JFD_APOSTOLIC_PALACE'), 	('TXT_KEY_BUILDING_JFD_APOSTOLIC_PALACE_TEXT'), Help, 	('TXT_KEY_BUILDING_JFD_APOSTOLIC_PALACE_STRATEGY'),	PortraitIndex, 	IconAtlas
FROM Buildings WHERE (Type = 'BUILDING_PALACE');
	
INSERT INTO Buildings 	
			(Type, 							BuildingClass,						GreatWorkSlotType, 				   GreatWorkCount,	PrereqTech, Cost, GoldMaintenance, MinAreaSize, NeverCapture, 	Description, 						Civilopedia, 						Help, 									Strategy,									ArtDefineTag, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_CHAPEL_ART'),	('BUILDINGCLASS_JFD_CHAPEL_ART'),	('GREAT_WORK_SLOT_ART_ARTIFACT'),  1, 				null,		Cost, GoldMaintenance, MinAreaSize, 1, 				('TXT_KEY_BUILDING_JFD_CHAPEL'), 	('TXT_KEY_CIV5_JFD_CHAPEL_TEXT'),   ('TXT_KEY_BUILDING_JFD_CHAPEL_HELP'), 	('TXT_KEY_BUILDING_JFD_CHAPEL_STRATEGY'),	ArtDefineTag, 4, 				('JFD_PAPAL_STATES_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';		

INSERT INTO Buildings 	
			(Type, 							BuildingClass,						GreatWorkSlotType, 			GreatWorkCount,	PrereqTech, Cost, GoldMaintenance, MinAreaSize, NeverCapture, 	Description, 						Civilopedia, 						Help, 									Strategy,									ArtDefineTag, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_CHAPEL_MUSIC'),	('BUILDINGCLASS_JFD_CHAPEL_MUSIC'),	('GREAT_WORK_SLOT_MUSIC'),  1, 				null,		Cost, GoldMaintenance, MinAreaSize, 1, 				('TXT_KEY_BUILDING_JFD_CHAPEL'), 	('TXT_KEY_CIV5_JFD_CHAPEL_TEXT'),   ('TXT_KEY_BUILDING_JFD_CHAPEL_HELP'), 	('TXT_KEY_BUILDING_JFD_CHAPEL_STRATEGY'),	ArtDefineTag, 4, 				('JFD_PAPAL_STATES_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';	

INSERT INTO Buildings 	
			(Type, 								BuildingClass,	GreatWorkSlotType, 				GreatWorkCount,	PrereqTech, Cost, GoldMaintenance, MinAreaSize, NeverCapture, 	Description, 						Civilopedia, 						Help, 									Strategy,									ArtDefineTag, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_CHAPEL_WRITING'),	BuildingClass,	('GREAT_WORK_SLOT_LITERATURE'),	1, 				PrereqTech, Cost, GoldMaintenance, MinAreaSize, 1, 				('TXT_KEY_BUILDING_JFD_CHAPEL'), 	('TXT_KEY_CIV5_JFD_CHAPEL_TEXT'),   ('TXT_KEY_BUILDING_JFD_CHAPEL_HELP'), 	('TXT_KEY_BUILDING_JFD_CHAPEL_STRATEGY'),	ArtDefineTag, 4, 				('JFD_PAPAL_STATES_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';	

INSERT INTO Buildings 	
			(Type, 						 			BuildingClass, 								EnhancedYieldTech,  TechEnhancedTourism, GreatWorkCount, Cost, FaithCost, PrereqTech,	Description, 								Help)
VALUES		('BUILDING_JFD_SWISS_GUARD_TOURISM', 	'BUILDINGCLASS_JFD_SWISS_GUARD_TOURISM',	'TECH_RADIO',		2,					 -1, 			 -1,   -1, 		  null, 		'TXT_KEY_BUILDING_JFD_SWISS_GUARD_TOURISM', 'TXT_KEY_BUILDING_JFD_SWISS_GUARD_TOURISM_HELP'),
			('BUILDING_JFD_CHAPEL_FAITH', 			'BUILDINGCLASS_JFD_SWISS_GUARD_TOURISM',	null,				0,					 -1, 			 -1,   -1, 		  null, 		'TXT_KEY_BUILDING_JFD_CHAPEL_FAITH',		'TXT_KEY_BUILDING_JFD_CHAPEL_FAITH_HELP');

INSERT INTO Building_YieldChanges 
			(BuildingType, 						YieldType, 			Yield)
VALUES		('BUILDING_JFD_CHAPEL_FAITH', 		'YIELD_FAITH', 		2),
			('BUILDING_JFD_CHAPEL_ART', 		'YIELD_FAITH', 		1),
			('BUILDING_JFD_CHAPEL_MUSIC', 		'YIELD_FAITH', 		1),
			('BUILDING_JFD_CHAPEL_WRITING', 	'YIELD_FAITH', 		1),
			('BUILDING_JFD_APOSTOLIC_PALACE', 	'YIELD_FAITH', 		1),
			('BUILDING_JFD_APOSTOLIC_PALACE', 	'YIELD_GOLD', 		3),
			('BUILDING_JFD_APOSTOLIC_PALACE', 	'YIELD_PRODUCTION', 3),
			('BUILDING_JFD_APOSTOLIC_PALACE', 	'YIELD_SCIENCE', 	3);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------	
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 				 BuildingClassType)
SELECT		('BUILDING_JFD_CHAPEL_ART'), BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_TEMPLE';	

INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 					BuildingClassType)
SELECT		('BUILDING_JFD_CHAPEL_MUSIC'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_TEMPLE';	

INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 					BuildingClassType)
SELECT		('BUILDING_JFD_CHAPEL_WRITING'), BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_TEMPLE';	
------------------------------	
-- Building_Flavors
------------------------------	
INSERT INTO Building_Flavors 	
			(BuildingType, 					 FlavorType,		Flavor)
VALUES		('BUILDING_JFD_CHAPEL_ART',		'FLAVOR_RELIGION',	10),
			('BUILDING_JFD_CHAPEL_ART',		'FLAVOR_CULTURE',	10),
			('BUILDING_JFD_CHAPEL_MUSIC',	'FLAVOR_RELIGION',	10),
			('BUILDING_JFD_CHAPEL_MUSIC',	'FLAVOR_CULTURE',	10),
			('BUILDING_JFD_CHAPEL_WRITING', 'FLAVOR_RELIGION',	10),
			('BUILDING_JFD_CHAPEL_WRITING', 'FLAVOR_CULTURE',	10);
--==========================================================================================================================	
-- BELIEFS
--==========================================================================================================================
-- Belief_BuildingClassYieldChanges																																	
------------------------------	
INSERT INTO Belief_BuildingClassYieldChanges	
			(BeliefType, BuildingClassType,					YieldType, YieldChange)
SELECT		BeliefType, ('BUILDINGCLASS_JFD_CHAPEL_MUSIC'), YieldType, YieldChange
FROM Belief_BuildingClassYieldChanges WHERE BuildingClassType = 'BUILDINGCLASS_TEMPLE';

INSERT INTO Belief_BuildingClassYieldChanges	
			(BeliefType, BuildingClassType,					YieldType, YieldChange)
SELECT		BeliefType, ('BUILDINGCLASS_JFD_CHAPEL_ART'),	YieldType, YieldChange
FROM Belief_BuildingClassYieldChanges WHERE BuildingClassType = 'BUILDINGCLASS_TEMPLE';
------------------------------	
-- Belief_BuildingClassHappiness
------------------------------
INSERT INTO Belief_BuildingClassHappiness	
			(BeliefType, BuildingClassType,					Happiness)
SELECT		BeliefType, ('BUILDINGCLASS_JFD_CHAPEL_MUSIC'), Happiness
FROM Belief_BuildingClassHappiness WHERE BuildingClassType = 'BUILDINGCLASS_TEMPLE';

INSERT INTO Belief_BuildingClassHappiness	
			(BeliefType, BuildingClassType,					Happiness)
SELECT		BeliefType, ('BUILDINGCLASS_JFD_CHAPEL_ART'),	Happiness
FROM Belief_BuildingClassHappiness WHERE BuildingClassType = 'BUILDINGCLASS_TEMPLE';
--==========================================================================================================================	
-- GREAT WORKS
--==========================================================================================================================	
-- GreatWorks																																	
------------------------------	
INSERT INTO GreatWorks 
			(Type, 															GreatWorkClassType,			Description,														Quote,																		Audio,																Image)
VALUES		--Artists
			('GREAT_WORK_THE_CRUCIFIXTION_OF_SAINT_PETER', 					'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_THE_CRUCIFIXTION_OF_SAINT_PETER',				null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Caravaggio--The_Crucifixtion_of_Saint_Peter.dds'),
			('GREAT_WORK_CORONATION_OF_THE_VIRGIN', 						'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_CORONATION_OF_THE_VIRGIN',						null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Enguerrand_Quarton--Coronation_of_the_Virgin.dds'),
			('GREAT_WORK_THE_NUN', 											'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_THE_NUN',										null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Gwen_John--The_Nun.dds'),
			('GREAT_WORK_PAINTING_OF_SAINT_DOMINIC', 						'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_PAINTING_OF_ST_DOMINIC',						null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Fra_Angelico--St_Dominic.dds'),
			('GREAT_WORK_LAST_JUDGEMENT', 									'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_LAST_JUDGEMENT',								null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Memling--Last_Judgement.dds'),
			('GREAT_WORK_MADONNA', 											'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_MADONNA',										null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Raphael--Madonna.dds'),
			('GREAT_WORK_THE_ANNUNCIATION', 								'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_THE_ANNUNCIATION',								null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Paolo_de_Matteis--The_Annunciation.dds'),
			('GREAT_WORK_MAN_OF_SORROWS', 									'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_MAN_OF_SORROWS',								null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Man_of_Sorrows_Meister_Francke.dds'),
			('GREAT_WORK_LIBERATION_OF_SAINT_PETER', 						'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_THE_LIBERATION_OF_SAINT_PETER',					null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Bartolomew_Esteban_Murillo--Liberation_of_St_Peter.dds'),
			('GREAT_WORK_SAINT_PETER_IN_PENITENCE', 						'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_SAINT_PETER_IN_PENITENCE',						null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_El_Greco--Saint_Peter_in_Penitence.dds'),
			('GREAT_WORK_LAMENTATION', 										'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_LAMENTATION',									null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Scipione_Pulzone--Lamentation.dds'),
			('GREAT_WORK_FRESCO_OF_THE_LAST_JUDGEMENT', 					'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_FRESCO_OF_THE_LAST_JUDGEMENT',					null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Michelangelo--Fresco_of_the_Last_Judgement.dds'),
			('GREAT_WORK_THE_STONING_OF_SAINT_STEPHEN', 					'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_THE_STONING_OF_SAINT_STEPHEN',					null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Rembrant--The_Stoning_of_Saint_Stephen.dds'),
			('GREAT_WORK_ADORATION_OF_THE_MAGI', 							'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_ADORATION_OF_THE_MAGI',							null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Rembrant--Adoration_of_the_Magi.dds'),
			('GREAT_WORK_MADONNA_OF_HUMILITY', 								'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_MADONNA_OF_HUMILITY',							null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Fra_Angelico--Madonna_of_Humility.dds'),
			('GREAT_WORK_PAINTING_OF_SAINT_SEBASTIAN', 						'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_PAINTING_OF_SAINT_SEBASTIAN',					null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Sandro_Botticellii--St.Sebastian.dds'),
			('GREAT_WORK_THE_WEDDING_AT_CANA', 								'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_THE_WEDDING_AT_CANA',							null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Paolo_Veronese--The_Weddeding_at_Cana.dds'),
			('GREAT_WORK_IMMACULATE_CONCEPTION', 							'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_IMMACULATE_CONCEPTION',							null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Murillo--Immaculate_Conception.dds'),
			--Musicians
			('GREAT_WORK_MISEREREI_MEI_DEUS', 								'GREAT_WORK_MUSIC',			'TXT_KEY_GREAT_WORK_MISEREREI_MEI_DEUS',							null,																		'AS2D_GREAT_MUSICIAN_ALLEGRIS_MISEREREI_MEI_DEUS',					'GreatMusician_Background.dds'),
			('GREAT_WORK_ALMA_REDEMPTORIS_MATER', 							'GREAT_WORK_MUSIC',			'TXT_KEY_GREAT_WORK_ALMA_REDEMPTORIS_MATER',						null,																		'AS2D_GREAT_MUSICIAN_PALESTRINAS_ALMA_REDEMPTORIS_MATER',			'GreatMusician_Background.dds'),
			('GREAT_WORK_MISSA_ET_ECCE_TERRAE_MOTUS_GLORIA',				'GREAT_WORK_MUSIC',			'TXT_KEY_GREAT_WORK_MISSA_ET_ECCE_TERRAE_MOTUS_GLORIA',				null,																		'AS2D_GREAT_MUSICIAN_BRUMELS_MISSA_ET_ECCE_TERRAE_MOTUS_GLORIA',	'GreatMusician_Background.dds'),
			('GREAT_WORK_MISSA_PAPAE_MARCELLI_CREDO', 						'GREAT_WORK_MUSIC',			'TXT_KEY_GREAT_WORK_MISSA_PAPAE_MARCELLI_CREDO',					null,																		'AS2D_GREAT_MUSICIAN_PALESTRINAS_MISSA_PAPAE_MARCELLI_CREDO',		'GreatMusician_Background.dds'),
			('GREAT_WORK_O_MORS_INEVITABILIS', 								'GREAT_WORK_MUSIC',			'TXT_KEY_GREAT_WORK_O_MORS_INEVITABILIS',							null,																		'AS2D_GREAT_MUSICIAN_VANDERS_O_MORS_INEVITABILIS',					'GreatMusician_Background.dds'),
			('GREAT_WORK_MEDIA_VITA', 										'GREAT_WORK_MUSIC',			'TXT_KEY_GREAT_WORK_MEDIA_VITA',									null,																		'AS2D_GREAT_MUSICIAN_SHEPPARDS_MEDIA_VITA',							'GreatMusician_Background.dds'),
			('GREAT_WORK_INTEMERATA', 										'GREAT_WORK_MUSIC',			'TXT_KEY_GREAT_WORK_INTEMERATA',									null,																		'AS2D_GREAT_MUSICIAN_OCKEGHEMS_INTEMERATA',							'GreatMusician_Background.dds'),
			('GREAT_WORK_AVE_MARIA', 										'GREAT_WORK_MUSIC',			'TXT_KEY_GREAT_WORK_AVE_MARIA',										null,																		'AS2D_GREAT_MUSICIAN_SCHUBERTS_AVE_MARIA',							'GreatMusician_Background.dds'),
			('GREAT_WORK_REQUIEM_DIES_IRAE', 								'GREAT_WORK_MUSIC',			'TXT_KEY_GREAT_WORK_REQUIEM_DIES_IRAE',								null,																		'AS2D_GREAT_MUSICIAN_VERDIS_REQUIEM',								'GreatMusician_Background.dds'),
			('GREAT_WORK_REQUIEM', 											'GREAT_WORK_MUSIC',			'TXT_KEY_GREAT_WORK_REQUIEM',										null,																		'AS2D_GREAT_MUSICIAN_MOZARTS_REQUIEM',								'GreatMusician_Background.dds'),
			--Writers
			('GREAT_WORK_HOW_TO_DRESS_FOR_EVERY_OCCASSION_BY_THE_POPE', 	'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_HOW_TO_DRESS_FOR_EVERY_OCCASSION_BY_THE_POPE',	'TXT_KEY_GREAT_WORK_QUOTE_HOW_TO_DRESS_FOR_EVERY_OCCASSION_BY_THE_POPE',	'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_THE_SOULS_JOURNEY_TO_GOD', 						'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_THE_SOULS_JOURNEY_TO_GOD',						'TXT_KEY_GREAT_WORK_QUOTE_THE_SOULS_JOURNEY_TO_GOD',						'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_THE_PRACTICE_OF_THE_PRESCENCE_OF_GOD', 			'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_THE_PRACTICE_OF_THE_PRESCENCE_OF_GOD',			'TXT_KEY_GREAT_WORK_QUOTE_THE_PRACTICE_OF_THE_PRESCENCE_OF_GOD',			'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_THE_PARSONS_TALE', 								'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_THE_PARSONS_TALE',								'TXT_KEY_GREAT_WORK_QUOTE_THE_PARSONS_TALE',								'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_THE_LETTERS_OF_SAINT_CATHERINE_OF_SIENA', 			'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_THE_LETTERS_OF_SAINT_CATHERINE_OF_SIENA',		'TXT_KEY_GREAT_WORK_QUOTE_THE_LETTERS_OF_SAINT_CATHERINE_OF_SIENAE',		'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_THE_DIVINE_COMEDY', 								'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_THE_DIVINE_COMEDY',								'TXT_KEY_GREAT_WORK_QUOTE_HE_DIVINE_COMEDY',								'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_THE_BETHROTHED', 									'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_THE_BETHROTHED',								'TXT_KEY_GREAT_WORK_QUOTE_THE_BETHROTHED',									'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_THE_LIFE_OF_SAINT_TERESA_OF_AVILA_BY_HERSELF', 	'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_THE_LIFE_OF_SAINT_TERESA_OF_AVILA_BY_HERSELF',	'TXT_KEY_GREAT_WORK_QUOTE_THE_LIFE_OF_SAINT_TERESA_OF_AVILA_BY_HERSELF',	'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_INTRODUCTION_TO_THE_DEVOUT_LIFE', 					'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_INTRODUCTION_TO_THE_DEVOUT_LIFE',				'TXT_KEY_GREAT_WORK_QUOTE_INTRODUCTION_TO_THE_DEVOUT_LIFE',					'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_ASCENT_OF_MOUNT_CARMEL', 							'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_ASCENT_OF_MOUNT_CARMEL',						'TXT_KEY_GREAT_WORK_QUOTE_ASCENT_OF_MOUNT_CARMEL',							'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_DIES_IRAE', 										'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_DIES_IRAE',										'TXT_KEY_GREAT_WORK_QUOTE_DIES_IRAE',										'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_SUMMA_THEOLOGICA', 								'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SUMMA_THEOLOGICA',								'TXT_KEY_GREAT_WORK_QUOTE_SUMMA_THEOLOGICA',								'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_STORY_OF_A_SOUL', 									'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_STORY_OF_A_SOUL',								'TXT_KEY_GREAT_WORK_QUOTE_STORY_OF_A_SOUL',									'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_THE_BOOK_OF_PASTORAL_RULE', 						'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_THE_BOOK_OF_PASTORAL_RULE',						'TXT_KEY_GREAT_WORK_QUOTE_THE_BOOK_OF_PASTORAL_RULE',						'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_CITY_OF_GOD', 										'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_CITY_OF_GOD',									'TXT_KEY_GREAT_WORK_QUOTE_CITY_OF_GOD',										'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
			(Type, 				Description, 				Civilopedia, 						CivilopediaTag, 						ArtDefineTag, 		VictoryCompetitiveness,	WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_JFD_PIUS', 'TXT_KEY_LEADER_JFD_PIUS', 	'TXT_KEY_LEADER_JFD_PIUS_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_PIUS', 'Pius_Scene.xml',	9, 						8, 						8, 							8, 			8, 				9, 				7, 						4, 				7, 			4, 			8, 				8, 			1, 			'JFD_PAPAL_STATES_ATLAS', 	1);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------					
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 		MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_PIUS', 'MAJOR_CIV_APPROACH_WAR', 			2),
			('LEADER_JFD_PIUS', 'MAJOR_CIV_APPROACH_HOSTILE', 		2),
			('LEADER_JFD_PIUS', 'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
			('LEADER_JFD_PIUS', 'MAJOR_CIV_APPROACH_GUARDED', 		3),
			('LEADER_JFD_PIUS', 'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_JFD_PIUS', 'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_JFD_PIUS', 'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------					
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 		MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_PIUS', 'MINOR_CIV_APPROACH_IGNORE', 		2),
			('LEADER_JFD_PIUS', 'MINOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_JFD_PIUS', 'MINOR_CIV_APPROACH_PROTECTIVE', 	8),
			('LEADER_JFD_PIUS', 'MINOR_CIV_APPROACH_CONQUEST', 		2),
			('LEADER_JFD_PIUS', 'MINOR_CIV_APPROACH_BULLY', 		4);
--------------------------------	
-- Leader_Flavors
--------------------------------					
INSERT INTO Leader_Flavors 
			(LeaderType, 		FlavorType, 						Flavor)
VALUES		('LEADER_JFD_PIUS', 'FLAVOR_OFFENSE', 					2),
			('LEADER_JFD_PIUS', 'FLAVOR_DEFENSE', 					5),
			('LEADER_JFD_PIUS', 'FLAVOR_CITY_DEFENSE', 				8),
			('LEADER_JFD_PIUS', 'FLAVOR_MILITARY_TRAINING', 		3),
			('LEADER_JFD_PIUS', 'FLAVOR_RECON', 					3),
			('LEADER_JFD_PIUS', 'FLAVOR_RANGED', 					2),
			('LEADER_JFD_PIUS', 'FLAVOR_MOBILE', 					3),
			('LEADER_JFD_PIUS', 'FLAVOR_NAVAL', 					3),
			('LEADER_JFD_PIUS', 'FLAVOR_NAVAL_RECON', 				3),
			('LEADER_JFD_PIUS', 'FLAVOR_NAVAL_GROWTH', 				3),
			('LEADER_JFD_PIUS', 'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	10),
			('LEADER_JFD_PIUS', 'FLAVOR_AIR', 						3),
			('LEADER_JFD_PIUS', 'FLAVOR_EXPANSION', 				2),
			('LEADER_JFD_PIUS', 'FLAVOR_GROWTH', 					8),
			('LEADER_JFD_PIUS', 'FLAVOR_TILE_IMPROVEMENT', 			7),
			('LEADER_JFD_PIUS', 'FLAVOR_INFRASTRUCTURE', 			8),
			('LEADER_JFD_PIUS', 'FLAVOR_PRODUCTION', 				6),
			('LEADER_JFD_PIUS', 'FLAVOR_GOLD', 						7),
			('LEADER_JFD_PIUS', 'FLAVOR_SCIENCE', 					5),
			('LEADER_JFD_PIUS', 'FLAVOR_CULTURE', 					8),
			('LEADER_JFD_PIUS', 'FLAVOR_HAPPINESS', 				6),
			('LEADER_JFD_PIUS', 'FLAVOR_GREAT_PEOPLE', 				8),
			('LEADER_JFD_PIUS', 'FLAVOR_WONDER', 					8),
			('LEADER_JFD_PIUS', 'FLAVOR_RELIGION', 					10),
			('LEADER_JFD_PIUS', 'FLAVOR_DIPLOMACY', 				9),
			('LEADER_JFD_PIUS', 'FLAVOR_SPACESHIP', 				3),
			('LEADER_JFD_PIUS', 'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_JFD_PIUS', 'FLAVOR_NUKE', 						1),
			('LEADER_JFD_PIUS', 'FLAVOR_USE_NUKE', 					1),
			('LEADER_JFD_PIUS', 'FLAVOR_ESPIONAGE', 				7),
			('LEADER_JFD_PIUS', 'FLAVOR_AIRLIFT', 					1),
			('LEADER_JFD_PIUS', 'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_PIUS', 'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_PIUS', 'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_PIUS', 'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_PIUS', 'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_PIUS', 'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------				
INSERT INTO Leader_Traits 
			(LeaderType, 		TraitType)
VALUES		('LEADER_JFD_PIUS', 'TRAIT_JFD_PAPAL_STATES');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
			(Type, 						Description, 						ShortDescription)
VALUES		('TRAIT_JFD_PAPAL_STATES', 	'TXT_KEY_TRAIT_JFD_PAPAL_STATES', 	'TXT_KEY_TRAIT_JFD_PAPAL_STATES_SHORT');
--==========================================================================================================================	
-- POLICIES
--==========================================================================================================================	
-- Policies
--------------------------------	
INSERT INTO Policies
			(Type,						Description,						SharedReligionTourismModifier)
VALUES		('POLICY_JFD_PAPAL_STATES', 'TXT_KEY_TRAIT_JFD_PAPAL_STATES',	50);
--------------------------------	
-- Policy_BuildingClassYieldModifiers
--------------------------------
INSERT INTO Policy_BuildingClassYieldModifiers	
			(PolicyType, BuildingClassType,					YieldType, YieldMod)
SELECT		PolicyType, ('BUILDINGCLASS_JFD_CHAPEL_MUSIC'), YieldType, YieldMod
FROM Policy_BuildingClassYieldModifiers WHERE BuildingClassType = 'BUILDINGCLASS_TEMPLE';

INSERT INTO Policy_BuildingClassYieldModifiers	
			(PolicyType, BuildingClassType,					YieldType, YieldMod)
SELECT		PolicyType, ('BUILDINGCLASS_JFD_CHAPEL_ART'),	YieldType, YieldMod
FROM Policy_BuildingClassYieldModifiers WHERE BuildingClassType = 'BUILDINGCLASS_TEMPLE';
--------------------------------	
-- Policy_BuildingClassYieldChanges
--------------------------------
INSERT INTO Policy_BuildingClassYieldChanges	
			(PolicyType, BuildingClassType,					YieldType, YieldChange)
SELECT		PolicyType, ('BUILDINGCLASS_JFD_CHAPEL_MUSIC'), YieldType, YieldChange
FROM Policy_BuildingClassYieldChanges WHERE BuildingClassType = 'BUILDINGCLASS_TEMPLE';

INSERT INTO Policy_BuildingClassYieldChanges	
			(PolicyType, BuildingClassType,					YieldType, YieldChange)
SELECT		PolicyType, ('BUILDINGCLASS_JFD_CHAPEL_ART'),	YieldType, YieldChange
FROM Policy_BuildingClassYieldChanges WHERE BuildingClassType = 'BUILDINGCLASS_TEMPLE';
--------------------------------	
-- Policy_BuildingClassProductionModifiers
--------------------------------
INSERT INTO Policy_BuildingClassProductionModifiers	
			(PolicyType, BuildingClassType,					ProductionModifier)
SELECT		PolicyType, ('BUILDINGCLASS_JFD_CHAPEL_MUSIC'), ProductionModifier
FROM Policy_BuildingClassProductionModifiers WHERE BuildingClassType = 'BUILDINGCLASS_TEMPLE';

INSERT INTO Policy_BuildingClassProductionModifiers	
			(PolicyType, BuildingClassType,					ProductionModifier)
SELECT		PolicyType, ('BUILDINGCLASS_JFD_CHAPEL_ART'),	ProductionModifier
FROM Policy_BuildingClassProductionModifiers WHERE BuildingClassType = 'BUILDINGCLASS_TEMPLE';
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
			(Type, 										Description, 									Help, 												Sound, 				CannotBeChosen, DefenseMod, 	HPHealedIfDestroyEnemy, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_PAPAL_STATES', 				'TXT_KEY_PROMOTION_PAPAL_STATES', 				'TXT_KEY_PROMOTION_PAPAL_STATES_HELP', 				'AS2D_IF_LEVELUP', 	1, 				0, 				0, 						59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_PAPAL_STATES'),
			('PROMOTION_JFD_SWISS_GUARD', 				'TXT_KEY_PROMOTION_SWISS_GUARD', 				'TXT_KEY_PROMOTION_SWISS_GUARD_HELP', 				'AS2D_IF_LEVELUP', 	1, 				20, 			0, 						59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_SWISS_GUARD'),
			('PROMOTION_JFD_SWISS_GUARD_TOURISM', 		'TXT_KEY_PROMOTION_SWISS_GUARD_TOURISM', 		'TXT_KEY_PROMOTION_SWISS_GUARD_TOURISM_HELP', 		'AS2D_IF_LEVELUP', 	1, 				0, 				0, 						58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_SWISS_GUARD_TOURISM'),
			('PROMOTION_JFD_SWISS_GUARD_HEALING', 		'TXT_KEY_PROMOTION_SWISS_GUARD_HEALING', 		'TXT_KEY_PROMOTION_SWISS_GUARD_HEALING_HELP', 		'AS2D_IF_LEVELUP', 	1, 				0, 				50, 					32, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_SWISS_GUARD_HEALING'),
			('PROMOTION_JFD_SWISS_GUARD_HEALING_INFO', 	'TXT_KEY_PROMOTION_SWISS_GUARD_HEALING', 		'TXT_KEY_PROMOTION_SWISS_GUARD_HEALING_HELP', 		'AS2D_IF_LEVELUP', 	1, 				0, 				0, 						59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_SWISS_GUARD_HEALING');
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
			(Class, 				Type, 					GoldenAgeTurns,	Special,				CivilianAttackPriority,				Cost,	Moves,	Domain,			DefaultUnitAI,		Description, 					Strategy,								ShowInPedia, 	AdvancedStartCost,	UnitArtInfo, 					UnitFlagIconOffset,		UnitFlagAtlas,					PortraitIndex,	IconAtlas, 					MoveRate)
VALUES		('UNITCLASS_ARTIST',	'UNIT_JFD_DISCIPLE', 	10,				'SPECIALUNIT_PEOPLE',	'CIVILIAN_ATTACK_PRIORITY_HIGH',	-1,		2,		'DOMAIN_LAND',	'UNITAI_ARTIST',	'TXT_KEY_UNIT_JFD_DISCIPLE',	'TXT_KEY_UNIT_JFD_DISCIPLE_STRATEGY',	0,				-1,					'ART_DEF_UNIT_JFD_DISCIPLE',	0,						'JFD_UNIT_FLAG_DISCIPLE_ATLAS',	2, 				'JFD_PAPAL_STATES_ATLAS',	'GREAT_PERSON');

INSERT INTO Units 	
			(Class, Type, 						PrereqTech, Combat, Cost,		FaithCost,		RequiresFaithPurchaseEnabled,	PurchaseOnly, 	MoveAfterPurchase, Moves, CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 							Strategy, 									Help, 									MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, UnitArtInfo, 						UnitFlagIconOffset, UnitFlagAtlas,						 PortraitIndex, 	IconAtlas)
SELECT		Class, 	('UNIT_JFD_SWISS_GUARD'), 	PrereqTech, Combat, Cost+20,	Cost+Cost+40,	1,								PurchaseOnly,	MoveAfterPurchase, Moves, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_SWISS_GUARD'), ('TXT_KEY_CIV5_JFD_SWISS_GUARD_TEXT'), 	('TXT_KEY_UNIT_JFD_SWISS_GUARD_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_SWISS_GUARD'), 	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, ('ART_DEF_UNIT_JFD_SWISS_GUARD'), 	0,					('JFD_UNIT_FLAG_SWISS_GUARD_ATLAS'), 3, 				('JFD_PAPAL_STATES_ATLAS')
FROM Units WHERE (Type = 'UNIT_GERMAN_LANDSKNECHT');
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_DISCIPLE'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_MISSIONARY');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_SWISS_GUARD'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_PIKEMAN');
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_DISCIPLE'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_ARTIST');	
	
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_JFD_SWISS_GUARD'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_PIKEMAN');	
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		('UNIT_JFD_DISCIPLE'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_ARTIST');	
	
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_SWISS_GUARD'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_PIKEMAN');

INSERT INTO Unit_Flavors 
			(UnitType, 					FlavorType, 		Flavor)
VALUES		('UNIT_JFD_SWISS_GUARD', 	'FLAVOR_CULTURE', 	3);
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 
			(UnitType, 					PromotionType)
VALUES		('UNIT_JFD_SWISS_GUARD', 	'PROMOTION_JFD_SWISS_GUARD'),
			('UNIT_JFD_SWISS_GUARD', 	'PROMOTION_JFD_SWISS_GUARD_TOURISM'),
			('UNIT_JFD_SWISS_GUARD', 	'PROMOTION_JFD_SWISS_GUARD_HEALING_INFO');
--------------------------------
-- Unit_UniqueNames
--------------------------------
INSERT INTO Unit_UniqueNames 
			(UnitType, 				UniqueName,													GreatWorkType)
VALUES		--Artists
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_CARAVAGGIO_DESC',					'GREAT_WORK_THE_CRUCIFIXTION_OF_SAINT_PETER'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_GWEN_JOHN_DESC',					'GREAT_WORK_THE_NUN'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_FRA_ANGELICO_DESC',				'GREAT_WORK_PAINTING_OF_SAINT_DOMINIC'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_ENGUERRAND_QUARTON_DESC',			'GREAT_WORK_CORONATION_OF_THE_VIRGIN'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_RAPHAEL_DESC',					'GREAT_WORK_MADONNA'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_MEMLING_DESC',					'GREAT_WORK_LAST_JUDGEMENT'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_PAOLO_DE_MATTEIS_DESC',			'GREAT_WORK_THE_ANNUNCIATION'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_MEISTER_FRANCKE_DESC',			'GREAT_WORK_MAN_OF_SORROWS'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_BARTOLOME_ESTEBAN_MURILLO_DESC',	'GREAT_WORK_LIBERATION_OF_SAINT_PETER'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_MICHELANGELO_DESC',				'GREAT_WORK_FRESCO_OF_THE_LAST_JUDGEMENT'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SCIPIONE_PULZONE_DESC',			'GREAT_WORK_LAMENTATION'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_EL_GRECO_DESC',					'GREAT_WORK_SAINT_PETER_IN_PENITENCE'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_REMBRANT_DESC',					'GREAT_WORK_THE_STONING_OF_SAINT_STEPHEN'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_REMBRANT_2_DESC',					'GREAT_WORK_ADORATION_OF_THE_MAGI'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_FRA_ANGELICO_2_DESC',				'GREAT_WORK_MADONNA_OF_HUMILITY'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SANDRO_BOTTICELLI_DESC',			'GREAT_WORK_PAINTING_OF_SAINT_SEBASTIAN'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_PAOLO_VERONESE_DESC',				'GREAT_WORK_THE_WEDDING_AT_CANA'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_MURILLO_DESC',					'GREAT_WORK_IMMACULATE_CONCEPTION'),
			--Musicians
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_PALESTRINA_DESC',					'GREAT_WORK_ALMA_REDEMPTORIS_MATER'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_GREGORIO_ALLEGRI_DESC',			'GREAT_WORK_MISEREREI_MEI_DEUS'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_PALESTRINA_2_DESC',				'GREAT_WORK_MISSA_PAPAE_MARCELLI_CREDO'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_JHERONIMUS_VINDERS_DESC',			'GREAT_WORK_O_MORS_INEVITABILIS'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_ANTOINE_BRUMEL_DESC',				'GREAT_WORK_MISSA_ET_ECCE_TERRAE_MOTUS_GLORIA'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_JOHN_SHEPPARD_DESC',				'GREAT_WORK_MEDIA_VITA'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_JOHANNES_OCKEGHEM_DESC',			'GREAT_WORK_INTEMERATA'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_FRANZ_SCHUBERT_DESC',				'GREAT_WORK_AVE_MARIA'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_VERDI_DESC',						'GREAT_WORK_REQUIEM_DIES_IRAE'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_MOZART_2_DESC',					'GREAT_WORK_REQUIEM'),
			--Writers
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_THE_POPE_DESC',					'GREAT_WORK_HOW_TO_DRESS_FOR_EVERY_OCCASSION_BY_THE_POPE'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_BONEVENTURE_DESC',			'GREAT_WORK_THE_SOULS_JOURNEY_TO_GOD'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_BROTHER_LAWRENCE_DESC',			'GREAT_WORK_THE_PRACTICE_OF_THE_PRESCENCE_OF_GOD'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_GEOFFREY_CHAUCER_DESC',			'GREAT_WORK_THE_PARSONS_TALE'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_CATHERINE_OF_SIENA_DESC',	'GREAT_WORK_THE_LETTERS_OF_SAINT_CATHERINE_OF_SIENA'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_DANTE_DESC',						'GREAT_WORK_THE_DIVINE_COMEDY'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_ALESSANDRO_MANZONI_DESC',			'GREAT_WORK_THE_BETHROTHED'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_TERESA_OF_AVILA_DESC',			'GREAT_WORK_THE_LIFE_OF_SAINT_TERESA_OF_AVILA_BY_HERSELF'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_ST_FRANCOIS_DE_SALES_DESC',		'GREAT_WORK_INTRODUCTION_TO_THE_DEVOUT_LIFE'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_JOHN_OF_THE_CROSS_DESC',	'GREAT_WORK_ASCENT_OF_MOUNT_CARMEL'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_THOMAS_OF_CELANO_DESC',			'GREAT_WORK_DIES_IRAE'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_AUGUSTINE_OF_HIPPO_DESC',	'GREAT_WORK_CITY_OF_GOD'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_THOMAS_AQUINAS_DESC',		'GREAT_WORK_SUMMA_THEOLOGICA'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_THERESA_DE_LISIEUX_DESC',	'GREAT_WORK_STORY_OF_A_SOUL'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_GREGORY_THE_GREAT_DESC',	'GREAT_WORK_THE_BOOK_OF_PASTORAL_RULE');
--==========================================================================================================================	
-- MINOR CIVILIZATIONS
--==========================================================================================================================	
-- MinorCivilizations
--------------------------------	
UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_JFD_KARYES_DESC', ShortDescription = 'TXT_KEY_CITYSTATE_JFD_KARYES_SHORT_DESC', Adjective = 'TXT_KEY_CITYSTATE_JFD_KARYES_ADJECTIVE', Civilopedia = 'TXT_KEY_CIV5_JFD_KARYES_TEXT_1'
WHERE Type = 'MINOR_CIV_VATICAN_CITY';	
--------------------------------	
-- MinorCivilization_CityNames
--------------------------------	
DELETE FROM MinorCivilization_CityNames WHERE MinorCivType = 'MINOR_CIV_VATICAN_CITY';
INSERT INTO MinorCivilization_CityNames
			(MinorCivType, 				CityName)
VALUES		('MINOR_CIV_VATICAN_CITY', 	'TXT_KEY_CITYSTATE_JFD_KARYES');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
			(Type, 								Description,						ShortDescription, 							Adjective, 							Civilopedia, 								CivilopediaTag, 					DefaultPlayerColor, 				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 					DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_JFD_PAPAL_STATES'), 	('TXT_KEY_JFD_PAPAL_STATES_DESC'),	('TXT_KEY_JFD_PAPAL_STATES_SHORT_DESC'),	('TXT_KEY_JFD_PAPAL_STATES_ADJ'),	('TXT_KEY_CIV5_JFD_PAPAL_STATES_TEXT_1'), 	('TXT_KEY_CIV5_JFD_PAPAL_STATES'), 	('PLAYERCOLOR_JFD_PAPAL_STATES'), 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_PAPAL_STATES_ATLAS'), 0, 				('JFD_PAPAL_STATES_ALPHA_ATLAS'), 	('JFD_Papal'), 	('PapalStatesMap512.dds'),	('TXT_KEY_CIV5_DOM_JFD_PIUS_TEXT'), 	('Pius_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ROME');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames 
			(CivilizationType, 					CityName)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_ROMA'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_BENEVENTO'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_PONTECORVO'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_ASCOLI'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_AVIGNON'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_RAVENNA'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_BOLOGNA'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_FERRARA'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_CIVITAVECCHIA'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_PERUGIA'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_ASSISI'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_ORVIETO'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_SINIGAGLIA'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_ANCONA'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_GUBBIO'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_CAMERINO'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_FERMO'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_RIMINI'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_URBINO'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_RIETI'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_TODI'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_VELLETRI'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_VITERBO');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_JFD_PAPAL_STATES'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ROME');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_JFD_PAPAL_STATES'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ROME');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_PAPAL_STATES'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ROME');
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES', 	'LEADER_JFD_PIUS');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES', 	'UNITCLASS_LANDSKNECHT',	'UNIT_JFD_SWISS_GUARD');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 					BuildingClassType, 					BuildingType)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES', 	'BUILDINGCLASS_TEMPLE',				'BUILDING_JFD_CHAPEL_WRITING'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'BUILDINGCLASS_JFD_CHAPEL_ART',		'BUILDING_JFD_CHAPEL_ART'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'BUILDINGCLASS_JFD_CHAPEL_MUSIC',	'BUILDING_JFD_CHAPEL_MUSIC'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'BUILDINGCLASS_PALACE',				'BUILDING_JFD_APOSTOLIC_PALACE');
--------------------------------	
-- Civilization_Religions
--------------------------------		
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES', 	'RELIGION_CHRISTIANITY');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_0'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_1'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_2'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_3'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_4'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_5'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_6'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_7'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_8'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_9');
--------------------------------	
-- Civilization_Start_Region_Priority
--------------------------------	
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 					RegionType)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES', 	'REGION_HILLS');
--==========================================================================================================================
--==========================================================================================================================