--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_FlandersDecisions.lua');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies		
			(Type,								Description,									InternalTradeRouteYieldModifier,	LandTradeRouteGoldChange,	SeaTradeRouteGoldChange)
VALUES		('POLICY_JFD_FLANDERS_CLOTH_TRADE', 'TXT_KEY_DECISIONS_JFD_FLANDERS_CLOTH_TRADE',	25,									200,						200);
--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Class, 				Type, 							GoldenAgeTurns, Cost,	Moves,	Domain,			DefaultUnitAI,		Description, 						ShowInPedia, 	AdvancedStartCost,	UnitArtInfo, 					UnitFlagIconOffset,		UnitFlagAtlas,					PortraitIndex,	IconAtlas, 					MoveRate)
VALUES		('UNITCLASS_ARTIST',	'UNIT_JFD_FLEMISH_PAINTER', 	8,				-1,		2,		'DOMAIN_LAND',	'UNITAI_ARTIST',	'TXT_KEY_UNIT_JFD_FLEMISH_PAINTER',	0,				-1,					'ART_DEF_UNIT_GREAT_WRITER',	6,						'EXPANSION2_UNIT_FLAG_ATLAS',	6, 				'EXPANSION2_UNIT_ATLAS',	'GREAT_PERSON');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_FLEMISH_PAINTER'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_ARTIST');	
--==========================================================================================================================
-- Unit_UniqueNames
--==========================================================================================================================
INSERT INTO Unit_UniqueNames 
			(UnitType, 						UniqueName,									GreatWorkType)
VALUES		('UNIT_JFD_FLEMISH_PAINTER', 	'TXT_KEY_GREAT_PERSON_JFD_JORDAENS_DESC',	'GREAT_WORK_JFD_THE_KING_DRINKS'),
			('UNIT_JFD_FLEMISH_PAINTER', 	'TXT_KEY_GREAT_PERSON_JFD_VAN_DYCK_DESC',	'GREAT_WORK_JFD_CHARLES_I'),
			('UNIT_JFD_FLEMISH_PAINTER', 	'TXT_KEY_GREAT_PERSON_JFD_RUBENS_DESC',		'GREAT_WORK_JFD_ELEVATION_OF_THE_CROSS');
--==========================================================================================================================	
-- GreatWorks
--==========================================================================================================================	
INSERT INTO GreatWorks 
			(Type, 										GreatWorkClassType,	Description,										Audio,							Image)
VALUES		('GREAT_WORK_JFD_ELEVATION_OF_THE_CROSS', 	'GREAT_WORK_ART',	'TXT_KEY_GREAT_WORK_JFD_ELEVATION_OF_THE_CROSS',	'AS2D_GREAT_ARTIST_ARTWORK',	'ElevationOfTheCross-Rubens.dds'),
			('GREAT_WORK_JFD_THE_KING_DRINKS',			'GREAT_WORK_ART',	'TXT_KEY_GREAT_WORK_JFD_THE_KING_DRINKS',			'AS2D_GREAT_ARTIST_ARTWORK',	'TheKingDrinks-Jordaens.dds'),
			('GREAT_WORK_JFD_CHARLES_I', 				'GREAT_WORK_ART',	'TXT_KEY_GREAT_WORK_JFD_CHARLES_I',					'AS2D_GREAT_ARTIST_ARTWORK',	'TripleCharlesI-VanDyck.dds');
--==========================================================================================================================
--==========================================================================================================================