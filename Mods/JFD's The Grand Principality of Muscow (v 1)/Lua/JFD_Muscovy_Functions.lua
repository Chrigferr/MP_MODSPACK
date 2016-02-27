-- JFD_FlandersFunctions
-- Author: JFD
-- DateCreated: 3/12/2014 9:35:16 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("FLuaVector.lua")
include("PlotIterators")
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
--------------------------------------------------------------------------------------------------------------------------
-- UTILS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID 			= Game.GetActivePlayer()
local activePlayer 				= Players[activePlayerID]
local civilizationID 			= GameInfoTypes["CIVILIZATION_JFD_MUSCOVY"]
local isMuscovyCivActive 		= JFD_IsCivilisationActive(civilizationID)
local isMuscovyCivActivePlayer	= activePlayer:GetCivilizationType() == civilizationID
local mathCeil 					= math.ceil
local mathMin 					= math.min
if isMuscovyCivActive then
	print("Grand Prince Ivan IV is in the game")
end
--------------------------------------------------------------------------------------------------------------------------
-- TSAR OF ALL THE RUSSIAS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Moscovy_CityCaptured
function JFD_Moscovy_CityCaptured(oldOwnerID, isCapital, plotX, plotY, newOwnerID)
	local player = Players[newOwnerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		local plot = Map.GetPlot(plotX, plotY)
		for adjacentPlot in PlotAreaSpiralIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			local unit = adjacentPlot:GetUnit()
			if (unit and unit:GetOwner() == newOwnerID) then
				unit:ChangeDamage(-25)
			end
			local otherPlayer = Players[oldOwnerID]
			for city in otherPlayer:Cities() do
				city:ChangeDamage(city:GetMaxHitPoints()*33/100)
			end
        end
	end
end
if isMuscovyCivActive then
	GameEvents.CityCaptureComplete.Add(JFD_Moscovy_CityCaptured)
end

--JFD_Moscovy_Razing
local goldenAgeMod = GameInfo.GameSpeeds[Game:GetGameSpeedType()].GoldenAgePercent
function JFD_Moscovy_Razing(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		local goldenAgeRewardTotal = 0 
		for city in player:Cities() do
			if city:IsRazing() then
				local goldenAgeReward = mathCeil((city:GetPopulation()*goldenAgeMod) / 4)
				goldenAgeRewardTotal = goldenAgeRewardTotal + goldenAgeReward
				player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
				if player:IsHuman() then 
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(city:GetX(), city:GetY()))), Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_GOLDEN_AGE]", goldenAgeReward))
				end
			end
		end
		if (player:IsHuman() and goldenAgeRewardTotal > 0) then 
			Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_MUSCOVY_ALERT", goldenAgeRewardTotal)) 
		end
	end
end
if isMuscovyCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_Moscovy_Razing)
end
--------------------------------------------------------------------------------------------------------------------------
-- SOBOR
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Muscovy_SoborExpansion
local buildingSoborID = GameInfoTypes["BUILDING_JFD_SOBOR"]
local buildingSoborCourthouseID	= GameInfoTypes["BUILDING_JFD_SOBOR_COURTHOUSE"]
local buildingSoborExpansionID	= GameInfoTypes["BUILDING_JFD_SOBOR_FAITH"]
function JFD_Muscovy_Sobor(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
		for city in player:Cities() do
			if city:IsHasBuilding(buildingSoborID) then
				city:SetNumRealBuilding(buildingSoborExpansionID, mathMin(city:GetFaithPerTurn(),30)) 
				if city:IsOccupied() then
					city:SetNumRealBuilding(buildingSoborCourthouseID, 1)
				else
					if city:IsHasBuilding(buildingSoborCourthouseID) then
						city:SetNumRealBuilding(buildingSoborCourthouseID, 0)
					end
				end
			else
				if city:IsHasBuilding(buildingSoborExpansionID) then
					city:SetNumRealBuilding(buildingSoborExpansionID, 0)
				end
				if city:IsHasBuilding(buildingSoborCourthouseID) then
					city:SetNumRealBuilding(buildingSoborCourthouseID, 0)
				end
			end
		end
	end
end
if isMuscovyCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_Muscovy_Sobor)
end
--------------------------------------------------------------------------------------------------------------------------
-- STRELTSY
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Muscovy_Streltsy
local unitPromotionStreltsyID	  = GameInfoTypes["PROMOTION_JFD_STRELTSY"]
local unitPromotionStreltsyInfoID = GameInfoTypes["PROMOTION_JFD_STRELTSY_INFO"]
function JFD_Muscovy_Streltsy(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and (not player:IsBarbarian())) then	
		for unit in player:Units() do
			if (unit:IsHasPromotion(unitPromotionStreltsyInfoID) or unit:IsHasPromotion(unitPromotionStreltsyID)) then
				local isAdjacentStreltsy = false
				local unitPlot = unit:GetPlot()
				if isUsingCPDLL then
					isAdjacentStreltsy = (unit:IsAdjacentToUnitPromotion(unitPromotionStreltsyID, true, false) or unit:IsAdjacentToUnitPromotion(unitPromotionStreltsyInfoID, true, false))
				else
					for adjacentPlot in PlotAreaSweepIterator(unitPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
						isAdjacentStreltsy = (adjacentPlot:GetUnit() and (adjacentPlot:GetUnit():IsHasPromotion(unitPromotionStreltsyID) or adjacentPlot:GetUnit():IsHasPromotion(unitPromotionStreltsyInfoID)))
						if isAdjacentStreltsy == true then 
							break
						end
					end
				end
				if isAdjacentStreltsy then
					if (not unit:IsHasPromotion(unitPromotionStreltsyID)) then
						unit:SetHasPromotion(unitPromotionStreltsyID, true)
						unit:SetHasPromotion(unitPromotionStreltsyInfoID, false)
					end
				else
					if unit:IsHasPromotion(unitPromotionStreltsyID) then
						unit:SetHasPromotion(unitPromotionStreltsyID, false)
						unit:SetHasPromotion(unitPromotionStreltsyInfoID, true)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_Muscovy_Streltsy)
--==========================================================================================================================
--==========================================================================================================================