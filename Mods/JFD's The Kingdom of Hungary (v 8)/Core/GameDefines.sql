--==========================================================================================================================
-- BuildingClasses
--==========================================================================================================================	
-- BuildingClasses
------------------------------	
INSERT OR REPLACE INTO BuildingClasses 
			(DefaultBuilding, 							Type, 											Description)
VALUES		('BUILDING_JFD_VEGVAR_ATTRITION', 			'BUILDINGCLASS_JFD_VEGVAR',						'TXT_KEY_BUILDING_JFD_VEGVAR_DEFENSE'),
			('BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM', 	'BUILDINGCLASS_JFD_AUSTRIAN_DRAGOON_TOURISM', 	'TXT_KEY_BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM'),
			('BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM_2', 'BUILDINGCLASS_JFD_AUSTRIAN_DRAGOON_TOURISM_2', 'TXT_KEY_BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings
			(Type, 						BuildingClass, Cost,	GoldMaintenance,	PrereqTech, ExtraCityHitPoints,	Defense, ArtInfoCulturalVariation,	AllowsRangeStrike,	Description,					 Help,									Civilopedia,								Strategy,									ArtDefineTag, MinAreaSize, 	HurryCostModifier, 	IconAtlas,				ConquestProb, 	PortraitIndex)
SELECT		('BUILDING_JFD_VEGVAR'),	BuildingClass, Cost+30,	GoldMaintenance,	PrereqTech, ExtraCityHitPoints,	Defense, ArtInfoCulturalVariation,	AllowsRangeStrike,	('TXT_KEY_BUILDING_JFD_VEGVAR'), ('TXT_KEY_BUILDING_JFD_VEGVAR_HELP'),	('TXT_KEY_CIV5_BUILDINGS_JFD_VEGVAR_TEXT'),	('TXT_KEY_BUILDING_JFD_VEGVAR_STRATEGY'),	ArtDefineTag, MinAreaSize, 	HurryCostModifier, 	('JFD_HUNGARY_ATLAS'),	66, 			3	
FROM Buildings WHERE Type = 'BUILDING_CASTLE';		

INSERT OR REPLACE INTO Buildings 
			(Type, 													BuildingClass, 									GreatWorkCount, Cost, 	FaithCost,	GoldMaintenance,	PrereqTech, TechEnhancedTourism,	EnhancedYieldTech,	ReligiousPressureModifier,	NeverCapture,	Description, 										Help)
VALUES		('BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM', 				'BUILDINGCLASS_JFD_AUSTRIAN_DRAGOON_TOURISM',	-1,				-1, 	-1,			0,					NULL, 		2,						'TECH_RADIO',		0,							1,				'TXT_KEY_BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM',	'TXT_KEY_BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM_HELP'),
			('BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM_2', 			'BUILDINGCLASS_JFD_AUSTRIAN_DRAGOON_TOURISM_2',	-1,				-1, 	-1,			0,					NULL, 		4,						'TECH_RADIO',		0,							1,				'TXT_KEY_BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM',	'TXT_KEY_BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM_2_HELP'),
			('BUILDING_JFD_VEGVAR_FAITH', 							'BUILDINGCLASS_JFD_VEGVAR',						-1,				-1, 	-1,			0,					NULL, 		0,						null,				0,							1,				'TXT_KEY_BUILDING_JFD_VEGVAR_FAITH', 				'TXT_KEY_BUILDING_JFD_VEGVAR_FAITH_HELP'),
			('BUILDING_JFD_VEGVAR_PRESSURE', 						'BUILDINGCLASS_JFD_VEGVAR',						-1,				-1, 	-1,			0,					NULL, 		0,						null,				25,							1,				'TXT_KEY_BUILDING_JFD_VEGVAR_PRESSURE', 			'TXT_KEY_BUILDING_JFD_VEGVAR_PRESSURE_HELP'),
			('BUILDING_JFD_VEGVAR_ATTRITION', 						'BUILDINGCLASS_JFD_VEGVAR',						-1,				-1, 	-1,			0,					NULL, 		0,						null,				0,							1,				'TXT_KEY_BUILDING_JFD_VEGVAR_ATTRITION', 			'TXT_KEY_BUILDING_JFD_VEGVAR_ATTRITION_HELP');
--------------------------------		
-- Building_ClassesNeededInCity
--------------------------------
INSERT INTO Building_ClassesNeededInCity
			(BuildingType, 					BuildingClassType)
SELECT		('BUILDING_JFD_VEGVAR'),		BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_CASTLE';	
--------------------------------		
-- Building_YieldChanges
--------------------------------
INSERT INTO Building_YieldChanges 
			(BuildingType, 					YieldType,				Yield)
VALUES		('BUILDING_JFD_VEGVAR_FAITH', 	'YIELD_FAITH',			1);
--------------------------------		
-- Building_Flavors
--------------------------------
INSERT INTO Building_Flavors 
			(BuildingType, 					FlavorType,				Flavor)
VALUES		('BUILDING_JFD_VEGVAR', 		'FLAVOR_CITY_DEFENSE',	50),
			('BUILDING_JFD_VEGVAR', 		'FLAVOR_RELIGION',		10);
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
			(Type, 					Description, 					Civilopedia, 							CivilopediaTag, 							ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_JFD_STEPHEN', 	'TXT_KEY_LEADER_JFD_STEPHEN', 	'TXT_KEY_LEADER_JFD_STEPHEN_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_STEPHEN', 	'Stephen_Scene.xml', 	4, 						5, 						5, 							6, 			5, 				8, 				5, 						5, 				8, 			4, 			7, 				4, 			4, 			'JFD_HUNGARY_ATLAS',	1);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_STEPHEN', 	'MAJOR_CIV_APPROACH_WAR', 			3),
			('LEADER_JFD_STEPHEN', 	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
			('LEADER_JFD_STEPHEN', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
			('LEADER_JFD_STEPHEN', 	'MAJOR_CIV_APPROACH_GUARDED', 		8),
			('LEADER_JFD_STEPHEN', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_JFD_STEPHEN', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
			('LEADER_JFD_STEPHEN', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_STEPHEN', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
			('LEADER_JFD_STEPHEN', 	'MINOR_CIV_APPROACH_FRIENDLY', 		5),
			('LEADER_JFD_STEPHEN', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	7),
			('LEADER_JFD_STEPHEN', 	'MINOR_CIV_APPROACH_CONQUEST', 		3),
			('LEADER_JFD_STEPHEN', 	'MINOR_CIV_APPROACH_BULLY', 		2);
--------------------------------	
-- Leader_Flavors
--------------------------------						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_JFD_STEPHEN', 	'FLAVOR_OFFENSE', 					3),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_DEFENSE', 					8),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_CITY_DEFENSE', 				9),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_MILITARY_TRAINING', 		6),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_RECON', 					6),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_RANGED', 					2),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_MOBILE', 					8),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_NAVAL', 					4),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_NAVAL_GROWTH', 				3),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_AIR', 						3),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_EXPANSION', 				6),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_GROWTH', 					7),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_TILE_IMPROVEMENT', 			6),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_INFRASTRUCTURE', 			5),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_PRODUCTION', 				6),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_GOLD', 						5),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_SCIENCE', 					5),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_CULTURE', 					4),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_HAPPINESS', 				4),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_GREAT_PEOPLE', 				4),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_WONDER', 					3),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_RELIGION', 					8),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_DIPLOMACY', 				5),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_SPACESHIP', 				4),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_ESPIONAGE', 				6),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_AIRLIFT', 					5),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------						
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_JFD_STEPHEN', 	'TRAIT_JFD_HUNGARY');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
			(Type, 					Description, 					ShortDescription)
VALUES		('TRAIT_JFD_HUNGARY', 	'TXT_KEY_TRAIT_JFD_HUNGARY', 	'TXT_KEY_TRAIT_JFD_HUNGARY_SHORT');	
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT OR REPLACE INTO UnitPromotions 
			(Type, 										Description, 										Help, 													Sound, 				LostWithUpgrade,	CannotBeChosen, FriendlyLandsAttackModifier,	IgnoreZOC,	ExperiencePercent, 	PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_CEREMONIAL_DRAGOONS', 		'TXT_KEY_PROMOTION_JFD_CEREMONIAL_DRAGOONS', 		'TXT_KEY_PROMOTION_JFD_CEREMONIAL_DRAGOONS_HELP', 		'AS2D_IF_LEVELUP', 	1,					1, 				0,								0,			0, 					58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_CEREMONIAL_DRAGOONS'),
			('PROMOTION_JFD_DRAGOON_EXPERIENCE_BONUS', 	'TXT_KEY_PROMOTION_JFD_DRAGOON_EXPERIENCE_BONUS', 	'TXT_KEY_PROMOTION_JFD_DRAGOON_EXPERIENCE_BONUS_HELP', 	'AS2D_IF_LEVELUP', 	0,					1, 				0,								0,			20, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_DRAGOON_EXPERIENCE_BONUS'),
			('PROMOTION_JFD_DRAGOON_MOUNTED_BONUS', 	'TXT_KEY_PROMOTION_JFD_DRAGOON_MOUNTED_BONUS', 		'TXT_KEY_PROMOTION_JFD_DRAGOON_MOUNTED_BONUS_HELP', 	'AS2D_IF_LEVELUP', 	0,					1, 				0,								0,			0, 					24, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_DRAGOON_MOUNTED_BONUS');
--------------------------------	
-- UnitPromotions_UnitCombats
--------------------------------	
INSERT OR REPLACE INTO UnitPromotions_UnitCombatMods 
			(PromotionType, 							UnitCombatType, 		Modifier)
VALUES		('PROMOTION_JFD_DRAGOON_MOUNTED_BONUS', 	'UNITCOMBAT_MOUNTED', 	15);
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
			(Class, Type, 					PrereqTech, Combat, Cost, 		FaithCost, 		RequiresFaithPurchaseEnabled, Moves,	HurryCostModifier,	CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 					Strategy, 							Help, 							MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 				UnitFlagAtlas, 							UnitFlagIconOffset, PortraitIndex, 	IconAtlas, 				MoveRate)
SELECT		Class, 	('UNIT_JFD_HUSSAR'), 	PrereqTech, Combat, Cost+15,	FaithCost+30, 	RequiresFaithPurchaseEnabled, Moves+1, 	 HurryCostModifier,	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_JFD_HUSSAR_DESC'), 	('TXT_KEY_JFD_HUSSAR_TEXT'), 	('TXT_KEY_JFD_HUSSAR_STRATEGY'), 	('TXT_KEY_JFD_HUNGARY_HELP'),	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, ('ART_DEF_UNIT_JFD_HUSSAR'), ('UNITS_HUNGARIAN_HUSSAR_FLAG_ATLAS'), 	0,					2, 				('JFD_HUNGARY_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_CAVALRY');
--------------------------------	
-- Update Austria
--------------------------------
UPDATE Units
SET Description = 'TXT_KEY_JFD_DRAGOON_DESC', Civilopedia = 'TXT_KEY_JFD_DRAGOON_TEXT',	Strategy = 'TXT_KEY_JFD_DRAGOON_STRATEGY', Help = 'TXT_KEY_JFD_DRAGOON_HELP', Moves = 4, ObsoleteTech = null
WHERE Type = 'UNIT_AUSTRIAN_HUSSAR';
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_HUSSAR'), 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_CAVALRY');
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_JFD_HUSSAR'), 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_CAVALRY');
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType,	Flavor)
SELECT		('UNIT_JFD_HUSSAR'), 		FlavorType,	Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_CAVALRY');
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 					ResourceType)
SELECT		('UNIT_JFD_HUSSAR'), 		ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_CAVALRY');
--------------------------------	
-- Unit_FreePromotions
--------------------------------		
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_AUSTRIAN_HUSSAR';
INSERT INTO Unit_FreePromotions 
			(UnitType, 					PromotionType)
VALUES		('UNIT_JFD_HUSSAR', 		'PROMOTION_EXTRA_SIGHT_I'),
			('UNIT_JFD_HUSSAR', 		'PROMOTION_FLANK_ATTACK_BONUS'),
			('UNIT_JFD_HUSSAR', 		'PROMOTION_NO_DEFENSIVE_BONUSES'),
			('UNIT_JFD_HUSSAR', 		'PROMOTION_CAN_MOVE_AFTER_ATTACKING'),
			('UNIT_JFD_HUSSAR', 		'PROMOTION_CITY_PENALTY'),
			('UNIT_AUSTRIAN_HUSSAR', 	'PROMOTION_JFD_CEREMONIAL_DRAGOONS'),
			('UNIT_AUSTRIAN_HUSSAR', 	'PROMOTION_JFD_DRAGOON_MOUNTED_BONUS'),
			('UNIT_AUSTRIAN_HUSSAR', 	'PROMOTION_JFD_DRAGOON_EXPERIENCE_BONUS'),
			('UNIT_AUSTRIAN_HUSSAR', 	'PROMOTION_NO_DEFENSIVE_BONUSES'),
			('UNIT_AUSTRIAN_HUSSAR', 	'PROMOTION_CAN_MOVE_AFTER_ATTACKING'),
			('UNIT_AUSTRIAN_HUSSAR', 	'PROMOTION_CITY_PENALTY');
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 					UnitClassType)
SELECT		('UNIT_JFD_HUSSAR'), 		UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_CAVALRY');	
--==========================================================================================================================	
-- MinorCivilizations
--==========================================================================================================================		
UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_JFD_LVIV', ShortDescription = 'TXT_KEY_CITYSTATE_JFD_LVIV', Adjective = 'TXT_KEY_CITYSTATE_JFD_LVIV_ADJ', Civilopedia = 'TXT_KEY_CITYSTATE_JFD_LVIV_TEXT'
WHERE Type = 'MINOR_CIV_BUDAPEST';
--==========================================================================================================================	
-- MinorCivilization_CityNames
--==========================================================================================================================	
DELETE FROM MinorCivilization_CityNames WHERE MinorCivType = "MINOR_CIV_BUDAPEST";
INSERT INTO MinorCivilization_CityNames 
			(MinorCivType, 			CityName)
VALUES		('MINOR_CIV_BUDAPEST', 	'TXT_KEY_CITYSTATE_JFD_LVIV');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
			(Type, 							Description, 						ShortDescription, 							Adjective, 								Civilopedia, 							CivilopediaTag, 				DefaultPlayerColor, 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 				DawnOfManQuote, 						DawnOfManAudio,						DawnOfManImage)
SELECT		('CIVILIZATION_JFD_HUNGARY'), 	('TXT_KEY_CIV_JFD_HUNGARY_DESC'), 	('TXT_KEY_CIV_JFD_HUNGARY_SHORT_DESC'), 	('TXT_KEY_CIV_JFD_HUNGARY_ADJECTIVE'), 	('TXT_KEY_CIV5_JFD_HUNGARY_TEXT_1'),	('TXT_KEY_CIV5_JFD_HUNGARY'), 	('PLAYERCOLOR_JFD_HUNGARY'), 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_HUNGARY_ATLAS'),	0, 				('JFD_HUNGARY_ALPHA_ATLAS'),	('Poland'), 	('HungaryMap512.dds'), 	('TXT_KEY_CIV5_DOM_JFD_STEPHEN_TEXT'), 	('AS2D_DOM_SPEECH_JFD_STEPHENL'),	('Stephen_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_AUSTRIA');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
DELETE FROM Civilization_CityNames WHERE CityName = 'TXT_KEY_CITY_NAME_BUDAPEST';
INSERT INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_BUDAPEST'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_EZTERGOM'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_DEBRECEN'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_SZEGED'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_MISKOLC'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_PECS'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_GYOR'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_NYIREHYHAZA'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_KECSKEMET'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_SZEKESFEHERVAR'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_SZOMBATHELY'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_SZOLNOK'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_TATABANYA'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_KAPOSVAR'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_ERD'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_VESZPREM'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_BEKESCSABA'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_SOPRON'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_EGER'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_NAGYKANIZSA'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_DUNAUJVAROS'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_HODMEZOVSARHELY'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_DUNAKESZI'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_CEGLED'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_BAJA'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_SALGOTARJAN'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_SZIGETSZENTMIKLOS'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_VAC'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_GODOLLO'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_OZD'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_SZEKSZARD');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
SELECT		('CIVILIZATION_JFD_HUNGARY'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_AUSTRIA');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_JFD_HUNGARY'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_AUSTRIA');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_HUNGARY'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_AUSTRIA');
--------------------------------	
-- Civilization_Leaders
--------------------------------			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_JFD_HUNGARY', 	'LEADER_JFD_STEPHEN');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_JFD_HUNGARY', 	'UNITCLASS_CAVALRY', 	'UNIT_JFD_HUSSAR');
--------------------------------	
-- Austria
--------------------------------	
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_AUSTRIA';
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_AUSTRIA', 		'UNITCLASS_CAVALRY', 	'UNIT_AUSTRIAN_HUSSAR');
--------------------------------	
-- Civilization_BuildingClassOverrides
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 				BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_JFD_HUNGARY', 	'BUILDINGCLASS_CASTLE', 	'BUILDING_JFD_VEGVAR');
--------------------------------	
-- Civilization_Religions
--------------------------------		
INSERT INTO Civilization_Religions 
			(CivilizationType, 				ReligionType)
VALUES		('CIVILIZATION_JFD_HUNGARY', 	'RELIGION_CHRISTIANITY');					
--------------------------------	
-- Civilization_SpyNames
--------------------------------		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_SPY_NAME_JFD_HUNGARY_0'),	
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_SPY_NAME_JFD_HUNGARY_1'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_SPY_NAME_JFD_HUNGARY_2'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_SPY_NAME_JFD_HUNGARY_3'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_SPY_NAME_JFD_HUNGARY_4'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_SPY_NAME_JFD_HUNGARY_5'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_SPY_NAME_JFD_HUNGARY_6'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_SPY_NAME_JFD_HUNGARY_7'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_SPY_NAME_JFD_HUNGARY_8'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_SPY_NAME_JFD_HUNGARY_9');
--==========================================================================================================================
--==========================================================================================================================