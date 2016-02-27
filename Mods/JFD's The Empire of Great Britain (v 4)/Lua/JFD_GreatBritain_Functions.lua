-- JFD_GreatBritain_Functions
-- Author: JFD
-- DateCreated: 6/23/2014 2:36:23 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("PlotIterators.lua")
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
-- JFD_GreatBritain_CalculateScienceBonus
local mathFloor	= math.floor
local yieldProductionID = GameInfoTypes["YIELD_PRODUCTION"]
function JFD_GreatBritain_CalculateScienceBonus(playerID)
	local player = Players[playerID]
	local numProduction = 0
	for city in player:Cities() do
		local baseProduction = mathFloor((city:GetBaseYieldRate(yieldProductionID)*10)/100)
		numProduction = numProduction + baseProduction
	end
	return numProduction
end

-- JFD_GreatBritain_GetUnhappinessProductionPenalty
function JFD_GreatBritain_GetUnhappinessProductionPenalty(playerID)
	local player = Players[playerID]
	return (player:GetUnhappiness()-player:GetHappiness())*2
end

-- JFD_GreatBritain_GetCityStartingGold
local goldMod = GameInfo.GameSpeeds[Game.GetGameSpeedType()].GoldPercent
function JFD_GreatBritain_GetCityStartingGold(playerID, plotX, plotY)
	local player = Players[playerID]
	local eraMod = GameInfo.Eras[player:GetCurrentEra()].StartingGold
	local numGold = (40+(40*goldMod/100))+eraMod
	if player:GetCapitalCity() then
		local capital = player:GetCapitalCity()
		local plotDistance = Map.PlotDistance(plotX, plotY, capital:GetX(), capital:GetY())
		numGold = numGold + (plotDistance*10)
	end
	return numGold
end
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID		= Game.GetActivePlayer()
local activePlayer			= Players[activePlayerID]
local civilizationID 		= GameInfoTypes["CIVILIZATION_JFD_GREAT_BRITAIN"]
local isGreatBritainCivActive = JFD_IsCivilisationActive(civilizationID)
local isGreatBritainActivePlayer = activePlayer:GetCivilizationType() == civilizationID
local mathCeil 				= math.ceil
if isGreatBritainCivActive then
	print("Queen Victoria is in this game")
end
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- SUN NEVER SETS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GreatBritain_StartingGold
function JFD_GreatBritain_StartingGold(playerID, plotX, plotY)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilizationID and player:IsEverAlive()) then
		local startingGold = mathFloor(JFD_GreatBritain_GetCityStartingGold(playerID, plotX, plotY))
		player:ChangeGold(startingGold)
		if player:IsHuman() then
			local city = Map.GetPlot(plotX, plotY):GetPlotCity()
			local alertmessage = Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_GREAT_BRITAIN_MSG", startingGold, city:GetName())
			Events.GameplayAlertMessage(alertmessage)
		end		
	end 	
end
if isGreatBritainCivActive then
	GameEvents.PlayerCityFounded.Add(JFD_GreatBritain_StartingGold)
end

-- JFD_GreatBritain_ScienceFromProduction
local buildingGreatBritainID = GameInfoTypes["BUILDING_JFD_GREAT_BRITAIN"]
function JFD_GreatBritain_ScienceFromProduction(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		local capital = player:GetCapitalCity()
		if capital then
			capital:SetNumRealBuilding(buildingGreatBritainID, JFD_GreatBritain_CalculateScienceBonus(playerID))
		end
	end
end
if isGreatBritainCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_GreatBritain_ScienceFromProduction)
end

-- JFD_GreatBritain_ScienceFromProductionEnterCityView
function JFD_GreatBritain_ScienceFromProductionEnterCityView()
	local city = UI.GetHeadSelectedCity()
	if (city and city:IsCapital()) then
		city:SetNumRealBuilding(buildingGreatBritainID, JFD_GreatBritain_CalculateScienceBonus(activePlayerID))
	end
end
if isGreatBritainActivePlayer then
	Events.SerialEventEnterCityScreen.Add(JFD_GreatBritain_ScienceFromProductionEnterCityView)
end
--------------------------------------------------------------------------------------------------------------------------
-- REDCOAT
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GreatBritain_Redcoat
local buildingRedcoatProductionID = GameInfoTypes["BUILDING_JFD_REDCOAT"]
local unitPromotionRedcoatID = GameInfoTypes["PROMOTION_JFD_REDCOAT"]
function JFD_GreatBritain_Redcoat(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		local productionPenalty = JFD_GreatBritain_GetUnhappinessProductionPenalty(playerID)
		if productionPenalty > 0 then
			for city in player:Cities() do
				if (city:GetGarrisonedUnit() and city:GetGarrisonedUnit():IsHasPromotion(unitPromotionRedcoatID)) then
					city:SetNumRealBuilding(buildingRedcoatProductionID, productionPenalty)
				else
					if city:IsHasBuilding(buildingRedcoatProductionID) then
						city:SetNumRealBuilding(buildingRedcoatProductionID, 0)
					end
				end
			end
		end
	end
end
if isGreatBritainCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_GreatBritain_Redcoat)
end

-- JFD_GreatBritain_RedcoatEnterCityScreen
function JFD_GreatBritain_RedcoatEnterCityScreen()
	local city = UI.GetHeadSelectedCity()
	local productionPenalty = JFD_GreatBritain_GetUnhappinessProductionPenalty(activePlayerID)
	if productionPenalty > 0 then
		if city then
			if (city:GetGarrisonedUnit() and city:GetGarrisonedUnit():IsHasPromotion(unitPromotionRedcoatID)) then
				city:SetNumRealBuilding(buildingRedcoatProductionID, productionPenalty)
			else
				if city:IsHasBuilding(buildingRedcoatProductionID) then
					city:SetNumRealBuilding(buildingRedcoatProductionID, 0)
				end
			end
		end
	end	
end
if isGreatBritainActivePlayer then
	Events.SerialEventEnterCityScreen.Add(JFD_GreatBritain_RedcoatEnterCityScreen)
end
--------------------------------------------------------------------------------------------------------------------------
-- FIRST RATE
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GreatBritain_FirstRate
local domainSeaID = GameInfoTypes["DOMAIN_SEA"]
local unitPromotionFirstRateID = GameInfoTypes["PROMOTION_JFD_FIRST_RATE"]
local unitPromotionFirstRateDefenseID = GameInfoTypes["PROMOTION_JFD_FIRST_RATE_DEFENSE"]
function JFD_GreatBritain_FirstRate(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and (not player:IsBarbarian()) and (not player:IsMinorCiv())) then
		for unit in player:Units() do
			local isAdjacentFirstRate = false
			if (unit:IsEmbarked() or unit:GetDomainType() == domainSeaID) then
				local unitPlot = unit:GetPlot()
				if isUsingCPDLL then
					isAdjacentFirstRate = unit:IsAdjacentToUnitPromotion(unitPromotionFirstRateID, true, false)
				else
					for adjacentPlot in PlotAreaSweepIterator(unitPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
						isAdjacentFirstRate = (adjacentPlot:GetUnit() and adjacentPlot:GetUnit():IsHasPromotion(unitPromotionFirstRateID)) or false
						if isAdjacentFirstRate == true then 
							break
						end
					end
				end
			end
			if isAdjacentFirstRate then
				if (not unit:IsHasPromotion(unitPromotionFirstRateDefenseID)) then
					unit:SetHasPromotion(unitPromotionFirstRateDefenseID, true)
				end
			else
				if unit:IsHasPromotion(unitPromotionFirstRateDefenseID) then
					unit:SetHasPromotion(unitPromotionFirstRateDefenseID, false)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_GreatBritain_FirstRate)
--==========================================================================================================================
--==========================================================================================================================