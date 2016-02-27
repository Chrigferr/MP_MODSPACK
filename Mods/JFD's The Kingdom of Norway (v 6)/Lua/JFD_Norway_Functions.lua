-- JFD_Norway_Functions
-- Author: JFD
-- DateCreated: 6/23/2014 2:36:23 PM
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
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
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayer 			= Players[Game.GetActivePlayer()]
local civilizationID		= GameInfoTypes["CIVILIZATION_JFD_NORWAY"]
local isNorwayCivActive		= JFD_IsCivilisationActive(civilizationID)
local isNorwayActivePlayer	= activePlayer:GetCivilizationType() == civilizationID
local mathMin				= math.min
if isNorwayCivActive then
	print("King Haakon is in this game")
end
----------------------------------------------------------------------------------------------------------------------------
-- THE NORTHWARD ROUTE
-------------------------------------------------------------------------------------------------------------------------
-- JFD_Norway_RevealCoast
local terrainCoastID = GameInfoTypes["TERRAIN_COAST"]
local worldHugeID = GameInfoTypes["WORLDSIZE_HUGE"]
function JFD_Norway_RevealCoast()
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
			local distance = 20
			local mapSize = Map.GetWorldSize()
			local startingPlot = player:GetStartingPlot()
			if mapSize >= worldHugeID then distance = 30 end
			for i = 0, Map.GetNumPlots() - 1, 1 do
				local plot = Map.GetPlotByIndex(i)
				local plotX = plot:GetX()
				local plotY = plot:GetY()
				local startingPlotX = startingPlot:GetX()
				local startingPlotY = startingPlot:GetY()
				if (plot:GetTerrainType() == terrainCoastID and Map.PlotDistance(startingPlotX, startingPlotY, plotX, plotY) <= distance) then
					plot:SetRevealed(player:GetTeam(), true)
				end
			end
		end
	end 
end
if isNorwayCivActive then
	Events.LoadScreenClose.Add(JFD_Norway_RevealCoast)
end

-- JFD_Norway_FishGold
local buildingNorwayFishGoldID = GameInfoTypes["BUILDING_JFD_NORWAY_FISH"]
function JFD_Norway_FishGold(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		for city in player:Cities() do
			if (not city:IsHasBuilding(buildingNorwayFishGoldID)) then
				city:SetNumRealBuilding(buildingNorwayFishGoldID, 1)
			end
		end
	end
end
if (isNorwayCivActive and (not isUsingCPDLL)) then
	GameEvents.PlayerDoTurn.Add(JFD_Norway_FishGold)
	GameEvents.PlayerCityFounded.Add(JFD_Norway_FishGold)
end
--------------------------------------------------------------------------------------------------------------------------
-- STAVE CHURCH
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Norway_StaveChurch
local buildingStaveChurchID	= GameInfoTypes["BUILDING_JFD_STAVE_CHURCH"]
local buildingStaveChurchStorageID = GameInfoTypes["BUILDING_JFD_STAVE_STORAGE"]
local yieldFaithID = GameInfoTypes["YIELD_FAITH"]
function JFD_Norway_StaveChurch(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		for city in player:Cities() do
			if city:IsHasBuilding(buildingStaveChurchID) then
				city:SetNumRealBuilding(buildingStaveChurchStorageID, mathMin(city:GetBaseYieldRate(yieldFaithID), 15))
			else
				if city:IsHasBuilding(buildingStaveChurchStorageID) then
					city:SetNumRealBuilding(buildingStaveChurchStorageID, 0)
				end
			end
		end
	end
end
if isNorwayCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_Norway_StaveChurch)
end
--==========================================================================================================================
--==========================================================================================================================