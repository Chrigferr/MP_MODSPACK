--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_FranksDecisions.lua');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type,								Description) 
VALUES		('POLICY_JFD_CAROLINGIAN_EMPIRE',	'TXT_KEY_DECISIONS_JFD_PRUSSIA_EMPOWER_JUNKER_CLASS');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policy_BuildingClassProductionModifiers 
			(PolicyType,						BuildingClassType,			ProductionModifier) 
VALUES		('POLICY_JFD_CAROLINGIAN_EMPIRE',	'BUILDINGCLASS_COURTHOUSE', 25);
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policy_BuildingClassHappiness 
			(PolicyType,						BuildingClassType,			Happiness) 
VALUES		('POLICY_JFD_CAROLINGIAN_EMPIRE',	'BUILDINGCLASS_COURTHOUSE', 2);
--==========================================================================================================================
--==========================================================================================================================

