--==========================================================================================================================	
-- Leader_MinorCivApproachBiases
--==========================================================================================================================	
UPDATE Leader_MinorCivApproachBiases
SET Bias = 9
WHERE LeaderType = 'LEADER_BISMARCK' AND MinorCivApproachType = 'MINOR_CIV_APPROACH_CONQUEST';
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
DELETE FROM Leader_Traits WHERE LeaderType = 'LEADER_BISMARCK';
INSERT INTO Leader_Traits
			(LeaderType,		TraitType)
VALUES		('LEADER_BISMARCK', 'TRAIT_JFD_BISMARCKIAN_GERMANY');
--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT OR REPLACE INTO Traits 
			(Type, 								Description, 								ShortDescription)
VALUES		('TRAIT_JFD_BISMARCKIAN_GERMANY', 	'TXT_KEY_TRAIT_JFD_BISMARCKIAN_GERMANY', 	'TXT_KEY_TRAIT_JFD_BISMARCKIAN_GERMANY_SHORT');		
--==========================================================================================================================	
--==========================================================================================================================	