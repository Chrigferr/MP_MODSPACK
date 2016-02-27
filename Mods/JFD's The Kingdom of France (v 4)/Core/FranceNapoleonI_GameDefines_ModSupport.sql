--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_FRANCE' )
	THEN '_FRANCE'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_NAPOLEONIC_FRANCE';
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,								X,	Y)
SELECT	'CIVILIZATION_JFD_FRANCE_NAPOLEON',	X,	Y
FROM Civilizations_YagemStartPosition WHERE Type = 'CIVILIZATION_FRANCE';
------------------------------------------------------------	
-- Civilizations_YahemStartPosition
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,								X,	Y)
SELECT	'CIVILIZATION_JFD_FRANCE_NAPOLEON',	X,	Y
FROM Civilizations_YahemStartPosition WHERE Type = 'CIVILIZATION_FRANCE';
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,								X,	Y)
SELECT	'CIVILIZATION_JFD_FRANCE_NAPOLEON',	X,	Y
FROM Civilizations_CordiformStartPosition WHERE Type = 'CIVILIZATION_FRANCE';
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,								X,	Y)
SELECT	'CIVILIZATION_JFD_FRANCE_NAPOLEON',	X,	Y
FROM Civilizations_GreatestEarthStartPosition WHERE Type = 'CIVILIZATION_FRANCE';
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
		(Type,								X,	Y)
SELECT	'CIVILIZATION_JFD_FRANCE_NAPOLEON',	X,	Y
FROM Civilizations_EuroGiantStartPosition WHERE Type = 'CIVILIZATION_FRANCE';
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
		(Type,								X,	Y)
SELECT	'CIVILIZATION_JFD_FRANCE_NAPOLEON',	X,	Y
FROM Civilizations_EuroLargeStartPosition WHERE Type = 'CIVILIZATION_FRANCE';
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
		(Type,								X,	Y)
SELECT	'CIVILIZATION_JFD_FRANCE_NAPOLEON',	X,	Y
FROM Civilizations_NorthAtlanticStartPosition WHERE Type = 'CIVILIZATION_FRANCE';
------------------------------------------------------------	
-- Civilizations_AmericasStartPosition (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasStartPosition
		(Type,									X,	Y)
SELECT	'CIVILIZATION_JFD_FRANCE_NAPOLEON',	X,	Y
FROM Civilizations_AmericasStartPosition WHERE Type = 'CIVILIZATION_FRANCE';
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeStartPosition (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthWestEuropeStartPosition
		(Type,								X,	Y)
SELECT	'CIVILIZATION_JFD_FRANCE_NAPOLEON',	X,	Y
FROM Civilizations_NorthWestEuropeStartPosition WHERE Type = 'CIVILIZATION_FRANCE';
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_FRANCE_NAPOLEON',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_FRANCE';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_FRANCE_NAPOLEON',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_FRANCE';
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_FRANCE_NAPOLEON',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_FRANCE';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_FRANCE_NAPOLEON',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_FRANCE';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_FRANCE_NAPOLEON',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_FRANCE';
------------------------------------------------------------	
-- Civilizations_AmericasRequestedResource (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AmericasRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_FRANCE_NAPOLEON',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AmericasRequestedResource WHERE Type = 'CIVILIZATION_FRANCE';
------------------------------------------------------------	
-- Civilizations_NorthAtlanticRequestedResource (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_FRANCE_NAPOLEON',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE Type = 'CIVILIZATION_FRANCE';
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeRequestedResource (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthWestEuropeRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_FRANCE_NAPOLEON',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthWestEuropeRequestedResource WHERE Type = 'CIVILIZATION_FRANCE';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,								CultureType,	CultureEra)
VALUES	('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'FRENCH',		'ANY');
--==========================================================================================================================
-- JFD CIVILOPEDIA
--==========================================================================================================================
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Civilopedia_HideFromPedia (Type text default null);

INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
VALUES	('PROMOTION_JFD_CHEVAU_LEGER_INFO');
--==========================================================================================================================
-- JFD CLAIMS
--==========================================================================================================================
-- Unit_FreePromotions
------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
SELECT	'UNIT_JFD_GENERAL_FRANCE',		Type
FROM UnitPromotions WHERE Type = 'PROMOTION_JFD_ASSIMILATE_CITY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CIVILIZATIONS_FRANCE_NAPOLEON_I_UA' AND Value = 0);

DELETE FROM Unit_FreePromotions WHERE PromotionType = 'PROMOTION_JFD_GENERAL_FRANCE' 
AND EXISTS (SELECT * FROM UnitPromotions WHERE Type = 'PROMOTION_JFD_ASSIMILATE_CITY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CIVILIZATIONS_FRANCE_NAPOLEON_I_UA' AND Value = 0);
--==========================================================================================================================
-- JFD COLONIES
--==========================================================================================================================
-- Civilization_JFD_ColonialCityNames
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT INTO Civilization_JFD_ColonialCityNames
		(CivilizationType,						LinguisticType, ColonyName)
SELECT	'CIVILIZATION_JFD_FRANCE_NAPOLEON',		LinguisticType, ColonyName
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--==========================================================================================================================
-- JFD CULTURAL DIVERSITY
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null,
	ArtDefineTag								text											default	null,
	IdealsTag									text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,					ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_FRANCE_NAPOLEON',	ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_FRANCE';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Western'
WHERE Type = 'CIVILIZATION_JFD_FRANCE_NAPOLEON'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Western')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================
-- JFD PROSPERITY
--==========================================================================================================================
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Currencies (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 	default null,
	CurrencyType	  				text 		  								default null);

INSERT INTO Civilization_JFD_Currencies
		(CivilizationType,					CurrencyType)
SELECT	'CIVILIZATION_JFD_FRANCE_NAPOLEON',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--==========================================================================================================================	
-- JFD SOVEREIGNTY
--==========================================================================================================================			
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	HeadOfGovernmentName			text 		 												default null);

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,      				HeadOfGovernmentName)
VALUES  ('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_1'),
		('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_2'),
        ('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_3'),
        ('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_4'),
        ('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_5'),
        ('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_6'),
        ('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_7'),
        ('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_8'),
        ('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_9'),
        ('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_10'),
        ('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_11'),
        ('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_12'),
        ('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_13'),
        ('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_14'),
        ('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_15'),
        ('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_16'),
        ('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_17'),
        ('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_18'),
        ('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_19'),
        ('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_20'),
        ('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_21'),
        ('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_22'),
        ('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_23'),
        ('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_24'),
        ('CIVILIZATION_JFD_FRANCE_NAPOLEON',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_FRANCE_25');
--==========================================================================================================================
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- Units
--------------------------------
INSERT OR REPLACE INTO Units 	
		(Type, 						 PrereqTech, Class, Combat,   Cost, 	Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 							Help, 									Strategy,										ObsoleteTech, GoodyHutUpgradeUnitClass, Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, UnitArtInfo,							UnitFlagIconOffset,	UnitFlagAtlas,							MoveRate,	PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_IMPERIAL_GUARD',	 PrereqTech, Class, Combat+3, Cost+35,	Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_JFD_IMPERIAL_GUARD', 	'TXT_KEY_CIV5_JFD_IMPERIAL_GUARD_TEXT', 'TXT_KEY_UNIT_JFD_IMPERIAL_GUARD_HELP', 'TXT_KEY_UNIT_JFD_IMPERIAL_GUARD_STRATEGY_EE',	ObsoleteTech, GoodyHutUpgradeUnitClass,	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, 'ART_DEF_UNIT_JFD_IMPERIAL_GUARD',  	0,					'JFD_UNIT_FLAG_IMPERIAL_GUARD_ATLAS',	MoveRate,	2, 				'JFD_FRANCE_ATLAS'
FROM Units WHERE Type = 'UNIT_EE_LINE_INFANTRY'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
--------------------------------
-- Unit_ClassUpgrades
--------------------------------
DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_JFD_IMPERIAL_GUARD'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 						UnitClassType)
SELECT	'UNIT_JFD_IMPERIAL_GUARD', 		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_EE_LINE_INFANTRY';
------------------------------
-- Civilization_UnitClassOverrides
------------------------------	
UPDATE Civilization_UnitClassOverrides
SET UnitClassType = 'UNITCLASS_EE_LINE_INFANTRY'
WHERE CivilizationType = 'CIVILIZATION_JFD_FRANCE_NAPOLEON' AND UnitClassType = 'UNITCLASS_RIFLEMAN'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_FranceNapoleonI_Decisions.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies 
		(Type,													Description) 
VALUES	('POLICY_DECISIONS_JFD_FRANCE_NAPOLEON_CIVIL_CODE',		'TXT_KEY_DECISIONS_JFD_FRANCE_NAPOLEON_CIVIL_CODE');
------------------------------
-- Policy_BuildingClassHappiness
------------------------------
INSERT INTO Policy_BuildingClassHappiness 
		(PolicyType, 											BuildingClassType,				Happiness)
VALUES	('POLICY_DECISIONS_JFD_FRANCE_NAPOLEON_CIVIL_CODE', 	'BUILDINGCLASS_COURTHOUSE',		1);
------------------------------
-- Policy_BuildingClassCultureChanges
------------------------------
INSERT INTO Policy_BuildingClassCultureChanges 
		(PolicyType, 											BuildingClassType,				CultureChange)
VALUES	('POLICY_DECISIONS_JFD_FRANCE_NAPOLEON_CIVIL_CODE', 	'BUILDINGCLASS_COURTHOUSE',		2);
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_FranceNapoleonI_Events.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies 
		(Type,												BuildingProductionModifier, Description) 
VALUES	('POLICY_EVENTS_JFD_FRANCE_NAPOLEON_DIPLOMAT_1',	0,							'TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS_OUTCOME_1'),
		('POLICY_EVENTS_JFD_FRANCE_NAPOLEON_DIPLOMAT_2',	0,							'TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS_OUTCOME_2'),
		('POLICY_EVENTS_JFD_FRANCE_NAPOLEON_DIPLOMAT_3',	0,							'TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS_OUTCOME_3'),
		('POLICY_EVENTS_JFD_FRANCE_NAPOLEON_DIPLOMAT_4',	5,							'TXT_KEY_EVENT_JFD_FRANCE_NAPOLEON_FOREIGN_AFFAIRS_OUTCOME_4');
------------------------------
-- Policy_BuildingClassHappiness
------------------------------
INSERT INTO Policy_UnitCombatProductionModifiers 
		(PolicyType, 										UnitCombatType,				ProductionModifier)
VALUES	('POLICY_EVENTS_JFD_FRANCE_NAPOLEON_DIPLOMAT_1', 	'UNITCOMBAT_MOUNTED',		10),
		('POLICY_EVENTS_JFD_FRANCE_NAPOLEON_DIPLOMAT_2', 	'UNITCOMBAT_GUN',			10),
		('POLICY_EVENTS_JFD_FRANCE_NAPOLEON_DIPLOMAT_3', 	'UNITCOMBAT_NAVALMELEE',	10),
		('POLICY_EVENTS_JFD_FRANCE_NAPOLEON_DIPLOMAT_3', 	'UNITCOMBAT_NAVALRANGED',	10);
--==========================================================================================================================
--==========================================================================================================================