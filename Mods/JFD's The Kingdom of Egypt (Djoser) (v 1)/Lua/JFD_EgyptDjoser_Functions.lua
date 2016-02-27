-- JFD_EgyptDjoser_Functions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("FLuaVector.lua")
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
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID			= Game.GetActivePlayer()
local activePlayer				= Players[activePlayerID]
local civilizationID 			= GameInfoTypes["CIVILIZATION_JFD_EGYPT_DJOSER"]
local isEgyptDjoserCivActive	= JFD_IsCivilisationActive(civilizationID)
local isEgyptDjoserActivePlayer	= activePlayer:GetCivilizationType() == civilizationID
local isUsingCPDLL				= JFD_IsUsingCPDLL()
local mathCeil 					= math.ceil
local mathFloor 				= math.floor
if isEgyptDjoserCivActive then
	print("Pharaoh Djoser is in this game")
end
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- FEATS OF IMUTHES
----------------------------------------------------------------------------------------------------------------------------
-- JFD_EgyptDjoser_ProductionModifiers
local buildingEgyptDjoserProductionBonusID = GameInfoTypes["BUILDING_JFD_EGYPT_DJOSER_PRODUCTION_MOD"]
local buildingPyramidsID = GameInfoTypes["BUILDING_PYRAMIDS"]
function JFD_EgyptDjoser_ProductionModifiers(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
		local productionModifier = player:GetWonderProductionModifier()
		for belief in GameInfo.Beliefs("WonderProductionModifier > 0") do
			local beliefID = belief.ID
			local obsoleteEraID = GameInfoTypes[belief.ObsoleteEra]
			if player:GetCurrentEra() < obsoleteEraID then
				if (isUsingCPDLL and player:HasBelief(beliefID)) then
					productionModifier = productionModifier + belief.WonderProductionModifier
				elseif player:GetBeliefInPantheon() == beliefID then
					productionModifier = productionModifier + belief.WonderProductionModifier	
				end
			end
		end
		for policy in GameInfo.Policies("WonderProductionModifier > 0") do
			local policyID = policy.ID
			if player:HasPolicy(policyID) then
				productionModifier = productionModifier + policy.WonderProductionModifier
			end
		end
		for city in player:Cities() do
			productionModifier = productionModifier + city:GetWonderProductionModifier()
			productionModifier = productionModifier + city:GetLocalResourceWonderProductionMod(buildingPyramidsID)
			productionModifier = mathFloor(productionModifier/2)
			city:SetNumRealBuilding(buildingEgyptDjoserProductionBonusID, productionModifier)
		end
	end
end
if isEgyptDjoserCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_EgyptDjoser_ProductionModifiers)
end
----------------------------------------------------------------------------------------------------------------------------
-- VIZIER
----------------------------------------------------------------------------------------------------------------------------
local improvementQuarryID = GameInfoTypes["IMPROVEMENT_QUARRY"]
local resourceLimestoneID = GameInfoTypes["RESOURCE_JFD_LIMESTONE"]
local unitVizierID = GameInfoTypes["UNIT_JFD_VIZIER"]
local unitWorkerID = GameInfoTypes["UNIT_WORKER"]
-- JFD_EgyptDjoser_DiscoverLimestone
function JFD_EgyptDjoser_DiscoverLimestone(playerID, plot, unitID)
	local player = Players[playerID]
	if plot then
		local plotX = plot:GetX()
		local plotY = plot:GetY()
		plot:SetImprovementType(-1)
		plot:SetResourceType(resourceLimestoneID, 1)
		plot:SetNumResource(1)
		if unitID then 
			local unit = player:GetUnitByID(unitID)
			unit:Kill(true, -1)
		end
		player:InitUnit(unitWorkerID, plotX, plotY)
		if player:IsHuman() then
			local hex = ToHexFromGrid(Vector2(plotX, plotY))
			Events.GameplayFX(hex.x, hex.y, -1)
			Events.AudioPlay2DSound("AS2D_SOUND_JFD_PING")
		end
	end
end

-- JFD_EgyptDjoser_SetHasWonderProductionMod
local buildingLimestoneID = GameInfoTypes["BUILDING_JFD_EGYPT_DJOSER_LIMESTONE_BONUS"]
function JFD_EgyptDjoser_SetHasWonderProductionMod(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
		for city in player:Cities() do
			local hasLimestone = false
			if isUsingCPDLL then
				hasLimestone = city:HasWorkedResource(resourceLimestoneID)
			else
				local cityPlot = Map.GetPlot(city:GetX(), city:GetY())
				for adjacentPlot in PlotAreaSweepIterator(cityPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					if adjacentPlot:IsBeingWorked() then
						local improvementID = adjacentPlot:GetImprovementType() 
						local resourceID = adjacentPlot:GetResourceType()
						if (improvementID == improvementQuarryID and resourceID == resourceLimestoneID 
						and (not adjacentPlot:IsImprovementPillaged())) then
							hasLimestone = true
							break
						end
					end
				end
			end
			if hasLimestone then
				if (not city:IsHasBuilding(buildingLimestoneID)) then
					city:SetNumRealBuilding(buildingLimestoneID, 1)
				end
			else
				if city:IsHasBuilding(buildingLimestoneID) then
					city:SetNumRealBuilding(buildingLimestoneID, 0)
				end
			end
		end
	end
end
if isEgyptDjoserCivActive then
	--GameEvents.PlayerDoTurn.Add(JFD_SetHasWonderProductionMod)
end

-- JFD_EgyptDjoser_VizierBuilds
local buildingMarbleID = GameInfoTypes["BUILDING_JFD_EGYPT_DJOSER_LIMESTONE_BONUS"]
local improvementLimestoneID = GameInfoTypes["IMPROVEMENT_JFD_VIZIER_LIMESTONE"]
g_EgyptDjoserPlayerID		 = nil
g_EgyptDjoserPlotX			 = nil
g_EgyptDjoserPlotY			 = nil
g_EgyptDjoserImprovementID	 = nil
function JFD_EgyptDjoser_VizierBuilds(playerID, plotX, plotY, improvementID)
	if g_EgyptDjoserPlayerID == playerID 
	and g_EgyptDjoserPlotX == plotX 
	and g_EgyptDjoserPlotY == plotY 
	and g_EgyptDjoserImprovementID == improvementID
	then return end
	g_EgyptDjoserPlayerID = playerID
	g_EgyptDjoserPlotX = plotX
	g_EgyptDjoserPlotY = plotY
	g_EgyptDjoserImprovementID = improvementID 
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
		local plot = Map.GetPlot(plotX, plotY)
		if (plot and improvementID == improvementLimestoneID) then
			JFD_EgyptDjoser_DiscoverLimestone(playerID, plot)
		elseif (plot and improvementID == improvementQuarryID and plot:GetResourceType() == resourceLimestoneID) then
			plot:SetImprovementType(improvementQuarryID)
			JFD_EgyptDjoser_SetHasWonderProductionMod(playerID)
			if player:IsHuman() then
				Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DISCOVERED_BONUS_RESOURCE"], Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_RESOURCE_JFD_LIMESTONE_DESC"), Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_RESOURCE_JFD_LIMESTONE_SHORT_DESC"), plotX, plotY, resourceLimestoneID)
			end
		end
	end
end
if isEgyptDjoserCivActive then
	GameEvents.BuildFinished.Add(JFD_EgyptDjoser_VizierBuilds)
end

-- JFD_EgyptDjoser_VizierCreated
function JFD_EgyptDjoser_VizierCreated(playerID, unitID, unitTypeID)
	local player = Players[playerID]
	if player:HasTech(techMasonryID) then
		if unitTypeID == unitVizierID then
			local unit = player:GetUnitByID(unitID) 
			local unitPlot = unit:GetPlot()
			for adjacentPlot in PlotAreaSweepIterator(unitPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				local ownerID = adjacentPlot:GetOwner()
				local improvementID = adjacentPlot:GetImprovementType()
				local resourceID = adjacentPlot:GetImprovementType()
				if (ownerID == playerID 
				and (not adjacentPlot:IsHills()) 
				and (not adjacentPlot:GetPlotCity()) 
				and (not adjacentPlot:IsWater()) 
				and (not adjacentPlot:IsMountain()) 
				and (improvementID == -1 and resourceID == -1)) then
					JFD_EgyptDjoser_DiscoverLimestone(playerID, adjacentPlot, unitID)
					break
				end
			end
		end
	end
end
if ((not isEgyptDjoserActivePlayer) and isUsingCPDLL) then
	GameEvents.UnitCreated.Add(JFD_EgyptDjoser_VizierCreated)
end 

-- JFD_EgyptDjoser_VizierExpended
local policyVizierateID = GameInfoTypes["POLICY_DECISIONS_JFD_EGYPT_DJOSER_VIZIERATE"]
local resourceMagistrateID = GameInfoTypes["RESOURCE_MAGISTRATES"]
function JFD_EgyptDjoser_VizierExpended(playerID, unitID, unitTypeID, plotX, plotY)
	local player = Players[playerID]
	if unitID == unitVizierID then
		if player:HasPolicy(policyVizierateID) then
			player:ChangeNumResourceTotal(resourceMagistrateID, 1)
			if (player:IsHuman() and plotX and plotY) then
				local hex = ToHexFromGrid(Vector2(plotX, plotY))
				Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("+[ICON_MAGISTRATES]"), true)
			end
		end
	end
end
if isEgyptDjoserCivActive then
	GameEvents.GreatPersonExpended.Add(JFD_EgyptDjoser_VizierExpended)
end 
----------------------------------------------------------------------------------------------------------------------------
-- STEP PYRAMID
----------------------------------------------------------------------------------------------------------------------------
-- JFD_EgyptDjoser_StepPyramid
local buildingStepPyramidID = GameInfoTypes["BUILDING_DECISIONS_JFD_STEP_PYRAMID"]
local policyStepPyramidID = GameInfoTypes["POLICY_DECISIONS_JFD_EGYPT_DJOSER_STEP_PYRAMIDS"]
function JFD_EgyptDjoser_StepPyramid(playerID, buildingID)
	local player = Players[playerID]
	if buildingID == buildingStepPyramidID then
		return player:HasPolicy(policyStepPyramidID)
	end
	return true
end
GameEvents.PlayerCanConstruct.Add(JFD_EgyptDjoser_StepPyramid)
--==========================================================================================================================
--==========================================================================================================================