-- JFD_JapanTojoFunctions
-- Author: JFD
-- DateCreated: 8/2/2013 7:09:28 PM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
include("FLuaVector.lua")
include("PlotIterators.lua")
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
--------------------------------------------------------------------------------------------------------------------------
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID		= GameInfoTypes["CIVILIZATION_JFD_JAPAN_TOJO"]
local isCivilisationActive	= JFD_IsCivilisationActive(civilisationID)
local mathFloor				= math.floor
local terrainCoastID		= GameInfoTypes["TERRAIN_COAST"]
local terrainOceanID		= GameInfoTypes["TERRAIN_OCEAN"]

if isCivilisationActive then
	print("Prime Minister Tojo is in this game")
end
--------------------------------------------------------------------------------------------------------------------------
--JFD_JapanTojoWaterTileNaturalAcquisition
----------------------------------------------------------------------------------------------------------------------------
function JFD_JapanTojoWaterTileNaturalAcquisition(playerID, cityID, plotX, plotY)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		local city = player:GetCityByID(cityID)
		local plot = Map.GetPlot(plotX, plotY)
		if (plot:GetTerrainType() == terrainCoastID or plot:GetTerrainType() == terrainOceanID) then
			local currentResearch = player:GetCurrentResearch()
			if currentResearch then
				local scienceBoost = player:GetScience()
				local teamTechs = Teams[player:GetTeam()]:GetTeamTechs()
				if city:GetOwner() ~= playerID then scientBoost = scienceBoost * 2 end
				teamTechs:ChangeResearchProgress(currentResearch, scienceBoost, playerID)
				
				if player:IsHuman() then
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(plotX, plotY))), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num}[ENDCOLOR] [ICON_RESEARCH]", scienceBoost), true)
				end
			end
		end
	end
end

if isCivilisationActive then
	GameEvents.CityBoughtPlot.Add(JFD_JapanTojoWaterTileNaturalAcquisition)
end
--------------------------------------------------------------------------------------------------------------------------
--JFD_JapanTojoWaterTileCityFoundation
----------------------------------------------------------------------------------------------------------------------------
function JFD_JapanTojoWaterTileCityFoundation(playerID, cityID, plotX, plotY)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		local currentResearch = player:GetCurrentResearch()
		if currentResearch then
			local cityPlot = Map.GetPlot(plotX, plotY)
			for loopPlot in PlotAreaSpiralIterator(cityPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if (loopPlot:GetOwner() == playerID and (loopPlot:GetTerrainType() == terrainCoastID or loopPlot:GetTerrainType() == terrainOceanID)) then
					local scienceBoost = player:GetScience()
					local teamTechs = Teams[player:GetTeam()]:GetTeamTechs()
					teamTechs:ChangeResearchProgress(currentResearch, scienceBoost, playerID)
					if player:IsHuman() then
						Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(loopPlot:GetX(), loopPlot:GetY()))), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num}[ENDCOLOR] [ICON_RESEARCH]", scienceBoost), true)
					end
				end
			end
		end
	end
end

if isCivilisationActive then
	GameEvents.PlayerCityFounded.Add(JFD_JapanTojoWaterTileCityFoundation)
end
--------------------------------------------------------------------------------------------------------------------------
--JFD_JapanTojoWaterTileCityFoundation
----------------------------------------------------------------------------------------------------------------------------
local buildingJapanTojoNavalProductionID = GameInfoTypes["BUILDING_JFD_JAPAN_TOJO_NAVAL_PRODUCTION"]

function JFD_JapanTojoWaterTileCityCaptured(oldPlayerID, isCapital, plotX, plotY, newPlayerID)
	local player = Players[newPlayerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		local cityPlot = Map.GetPlot(plotX, plotY)
		local city = cityPlot:GetPlotCity()
		local currentResearch = player:GetCurrentResearch()
		if currentResearch then
			for loopPlot in PlotAreaSpiralIterator(cityPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if (loopPlot:GetOwner() == newPlayerID and (loopPlot:GetTerrainType() == terrainCoastID or loopPlot:GetTerrainType() == terrainOceanID)) then
					local scienceBoost = player:GetScience() * 2
					local teamTechs = Teams[player:GetTeam()]:GetTeamTechs()
					teamTechs:ChangeResearchProgress(currentResearch, scienceBoost, playerID)
					
					if player:IsHuman() then
						Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(loopPlot:GetX(), loopPlot:GetY()))), Locale.ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num}[ENDCOLOR] [ICON_RESEARCH]", scienceBoost), true)
					end
				end
			end
		end
		
		if (not city:IsHasBuilding(buildingJapanTojoNavalProductionID)) then
			city:SetNumRealBuilding(buildingJapanTojoNavalProductionID, 1)
		end
	end
end

if isCivilisationActive then
	GameEvents.CityCaptureComplete.Add(JFD_JapanTojoWaterTileCityCaptured)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_JapanTojoDecisionKantaiKessen
----------------------------------------------------------------------------------------------------------------------------
local policyKantaiKessenID			= GameInfoTypes["POLICY_JFD_KANTAI_KESSEN"]
local unitCombatNavalRangedID		= GameInfoTypes["UNITCOMBAT_NAVALRANGED"]
local unitPromotionKantaiKessenID	= GameInfoTypes["PROMOTION_JFD_KANTAI_KESSEN"]

function JFD_KantaiKessen(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID and player:HasPolicy(policyKantaiKessenID)) then
		for unit in player:Units() do
			if unit:GetUnitCombatType() == unitCombatNavalRangedID then
				if unit:GetPlot():GetPlotCity() then
					if (not unit:IsHasPromotion(unitPromotionKantaiKessenID)) then
						unit:SetHasPromotion(unitPromotionKantaiKessenID, true)
					end
				else
					if unit:IsHasPromotion(unitPromotionKantaiKessenID) then
						unit:SetHasPromotion(unitPromotionKantaiKessenID, false)
					end
				end
			end
		end
	end
end

if isCivilisationActive then
	GameEvents.PlayerDoTurn.Add(JFD_KantaiKessen)
	GameEvents.UnitSetXY.Add(JFD_KantaiKessen)
end
--==========================================================================================================================
--==========================================================================================================================
