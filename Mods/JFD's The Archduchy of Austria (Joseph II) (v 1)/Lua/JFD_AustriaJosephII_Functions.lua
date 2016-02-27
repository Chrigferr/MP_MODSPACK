-- JFD_Prussia_Functions
-- Author: JFD
-- DateCreated: 5/4/2014 12:54:31 AM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
function JFD_IsCivilisationActive(civilizationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end

	return false
end

-- JFD_IsUsingCPDLL
function JFD_IsUsingCPDLL()
	local cPDLLID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == cPDLLID) then
			return true
		end
	end
	return false
end
local isUsingCPDLL = JFD_IsUsingCPDLL()
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("JFD_AustriaJosephII_DTP.lua")
include("PlotIterators.lua")
include("UniqueDiplomacyUtilsV2.lua")
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayer 			 	 = Players[Game.GetActivePlayer()]
local civilizationID 			 = GameInfoTypes["CIVILIZATION_JFD_AUSTRIA_JOSEPH_II"]
local isAustriaJosephIICivActive = JFD_IsCivilisationActive(civilizationID)
local mathCeil 					 = math.ceil
local mathFloor 				 = math.floor
if isAustriaJosephIICivActive then
	print("Archduke Joseph II is in this game")
end
--==========================================================================================================================
-- DIPLOMACY FUNCTIONS
--==========================================================================================================================
-- DIPLOMACY
----------------------------------------------------------------------------------------------------------------------------
local civilizationAustriaID = GameInfoTypes["CIVILIZATION_AUSTRIA"]
function JFD_JosephII_UniqueResponses()
	if (civilizationAustriaID and activePlayer:GetCivilizationType() == civilizationAustriaID) then
		ChangeDiplomacyResponse("LEADER_JFD_JOSEPH_II", "RESPONSE_FIRST_GREETING", "TXT_KEY_LEADER_JFD_JOSEPH_II_FIRSTGREETING%", "TXT_KEY_LEADER_JFD_JOSEPH_II_MARIA_THERESA_FIRSTGREETING_1", 500)
		ChangeDiplomacyResponse("LEADER_JFD_JOSEPH_II", "RESPONSE_DEFEATED", "TXT_KEY_LEADER_JFD_JOSEPH_II_DEFEATED%", "TXT_KEY_LEADER_JFD_JOSEPH_II_MARIA_THERESA_DEFEATED_1", 500)
	end
end
for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
	local player = Players[playerID]
	if (player and player:IsAlive() and (not player:IsHuman()) and (player:GetCivilizationType() == civilizationID)) then
		Events.SequenceGameInitComplete.Add(JFD_JosephII_UniqueResponses)
		break
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- ENLIGHTENED ABSOLUTISM
--------------------------------------------------------------------------------------------------------------------------
-- JFD_AustriaJosephII_GreatPeoplePoints
function JFD_AustriaJosephII_GreatPeoplePoints(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then	
		local goldenAgePointsFromGPP = JFD_AustriaJosephII_GetGAPFromGPP(playerID)
		if goldenAgePointsFromGPP > 0 then
			player:ChangeGoldenAgeProgressMeter(goldenAgePointsFromGPP)
		end
	end
end
if isAustriaJosephIICivActive then
	GameEvents.PlayerDoTurn.Add(JFD_AustriaJosephII_GreatPeoplePoints)
end

-- JFD_AustriaJosephII_GoldenAgeLength
local buildingAustriaJosephIIID = GameInfoTypes["BUILDING_JFD_AUSTRIA_JOSEPH_II"]
function JFD_AustriaJosephII_GoldenAgeLength(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then	
		local numUnlockedBranches = player:GetNumPolicyBranchesUnlocked()
		if numUnlockedBranches > 0 then
			player:GetCapitalCity():SetNumRealBuilding(buildingAustriaJosephIIID, numUnlockedBranches)
		end
	end
end
if isAustriaJosephIICivActive then
	GameEvents.PlayerDoTurn.Add(JFD_AustriaJosephII_GoldenAgeLength)
	GameEvents.PlayerAdoptPolicyBranch.Add(JFD_AustriaJosephII_GoldenAgeLength)
end
--------------------------------------------------------------------------------------------------------------------------
-- STATE SCHOOL
--------------------------------------------------------------------------------------------------------------------------
local buildingStateSchoolID = GameInfoTypes["BUILDING_JFD_STATE_SCHOOL"]
local buildingStateSchoolEngineerID = GameInfoTypes["BUILDING_JFD_STATE_SCHOOL_ENGINEER"]
local buildingStateSchoolMerchantID = GameInfoTypes["BUILDING_JFD_STATE_SCHOOL_MERCHANT"]
function JFD_AustriaJosephII_StateSchool(playerID, cityID, buildingID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then	
		if buildingID == buildingStateSchoolID then
			local city = player:GetCityByID(cityID) 
			if city:IsHasBuilding(buildingStateSchoolID) then
				city:SetNumRealBuilding(buildingStateSchoolEngineerID, 1)
				city:SetNumRealBuilding(buildingStateSchoolMerchantID, 1)
			else
				city:SetNumRealBuilding(buildingStateSchoolEngineerID, 0)
				city:SetNumRealBuilding(buildingStateSchoolMerchantID, 0)
			end
		end
	end
end
if isAustriaJosephIICivActive then
	GameEvents.CityConstructed.Add(JFD_AustriaJosephII_StateSchool)
	GameEvents.CitySoldBuilding.Add(JFD_AustriaJosephII_StateSchool)
end	
--------------------------------------------------------------------------------------------------------------------------
-- GRENADIER
--------------------------------------------------------------------------------------------------------------------------
-- JFD_AustriaJosephII_Grenadier
local unitGrenadierID = GameInfoTypes["UNIT_JFD_GRENADIER"]
local unitPromotionGrenadierRangeID = GameInfoTypes["PROMOTION_JFD_GRENADIER_RANGE"]
local unitPromotionGrenadierRangeInfoID = GameInfoTypes["PROMOTION_JFD_GRENADIER_RANGE_INFO"]
function JFD_AustriaJosephII_Grenadier(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and (not player:IsBarbarian())) then	
		for unit in player:Units() do
			if unit:GetUnitType() == unitGrenadierID then
				local isAdjacentGrenadier = false
				local unitPlot = unit:GetPlot()
				if isUsingCPDLL then
					isAdjacentGrenadier = unit:IsAdjacentToUnit(unitGrenadierID, true, false)
				else
					for adjacentPlot in PlotAreaSweepIterator(unitPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
						isAdjacentGrenadier = (adjacentPlot:GetUnit() and adjacentPlot:GetUnit():GetUnitType() == unitGrenadierID)
						if isAdjacentGrenadier == true then 
							break
						end
					end
				end
				if isAdjacentGrenadier then
					if (not unit:IsHasPromotion(unitPromotionGrenadierRangeID)) then
						unit:SetHasPromotion(unitPromotionGrenadierRangeID, true)
						unit:SetHasPromotion(unitPromotionGrenadierRangeInfoID, false)
					end
				else
					if unit:IsHasPromotion(unitPromotionGrenadierRangeID) then
						unit:SetHasPromotion(unitPromotionGrenadierRangeID, false)
						unit:SetHasPromotion(unitPromotionGrenadierRangeInfoID, true)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_AustriaJosephII_Grenadier)
--=======================================================================================================================
--=======================================================================================================================
