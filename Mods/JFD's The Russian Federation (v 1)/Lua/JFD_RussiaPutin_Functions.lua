-- JFD_RussiaPutin_Functions
-- Author: JFD
-- DateCreated: 4/19/2014 1:40:04 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("FLuaVector.lua")
include("IconSupport")
include("JFD_CID_ColoniesUtils.lua")
include("JFD_RussiaPutinUtils.lua")
include("PlotIterators")
--=======================================================================================================================
-- UTILITY FUNCTIONS
--=======================================================================================================================
-- MOD CHECKS
------------------------------------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------------------------------------
-- UTILS
------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

-- JFD_IsBorderingCityState
function JFD_IsBorderingCityState(playerID, city)
	local plot = city:Plot()
	for loopPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_INWARDS, CENTRE_EXCLUDE) do
		if loopPlot:GetOwner() == playerID then
			return true
		end
	end
	return false
end

-- JFD_IsTileRingComplete
function JFD_IsTileRingComplete(playerID, city, radius)
	for loopPlot in PlotRingIterator(city:Plot(), radius, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		if loopPlot:GetOwner() ~= playerID then 
			return false 
		end
	end
	return true
end
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local activePlayerID			= Game.GetActivePlayer()
local activePlayer				= Players[activePlayerID]
local civilizationID			= GameInfoTypes["CIVILIZATION_JFD_RUSSIA_PUTIN"]
local isRussiaPutinCivActive	= JFD_IsCivilisationActive(civilizationID)
local isRussiaPutinActivePlayer	= activePlayer:GetCivilizationType() == civilizationID
local mathFloor					= math.floor
local mathMin					= math.min
if isRussiaPutinCivActive then
	print("Emperor Putin is in the game")
end
--------------------------------------------------------------------------------------------------------------------------
-- IMPERIAL LEGACY
--------------------------------------------------------------------------------------------------------------------------
-- JFD_RussiaPutin_SecondTileAcquisition
function JFD_RussiaPutin_SecondTileAcquisition(playerID, cityID, plotX, plotY, isGold, isCulture)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		local acquiredPlot = Map.GetPlot(plotX, plotY)
		local plots = {}
		local count = 1
		for loopPlot in PlotAreaSpiralIterator(acquiredPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			if loopPlot:GetOwner() ~= playerID then
				plots[count] = loopPlot
				count = count + 1
			end
		end
		local newPlot = plots[JFD_GetRandom(1, #plots)]
		if newPlot then
			newPlot:SetOwner(playerID, -1, true, true)
			newPlot:SetRevealed(player:GetTeam(), true)
		end
	end
end
if isRussiaPutinCivActive then
	GameEvents.CityBoughtPlot.Add(JFD_RussiaPutin_SecondTileAcquisition)
end

-- JFD_RussiaPutin_CityStateNeighbours
function JFD_RussiaPutin_CityStateNeighbours(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			if (otherPlayer:IsAlive() and otherPlayer:IsMinorCiv()) then
				for city in otherPlayer:Cities() do
					if JFD_IsCityStateBordering(playerID, city) then
						otherPlayer:ChangeMinorCivFriendshipWithMajor(playerID, 2)	
					end
				end					
			end
		end
	end
end
if isRussiaPutinCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_RussiaPutin_CityStateNeighbours)
end

-- JFD_RussiaPutin_CityCapture
function JFD_RussiaPutin_CityCapture(oldOwnerID, capital, plotX, plotY, newOwnerID)
	local player = Players[newOwnerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		local otherPlayer = Players[oldOwnerID]
		if otherPlayer:IsMinorCiv() then
			local city = Map.GetPlot(plotX, plotY):GetPlotCity()
			if JFD_IsCityStateBordering(newOwnerID, city) then
				city:ChangeResistanceTurns(-city:GetResistanceTurns())
			end
		end
	end
end
if isRussiaPutinCivActive then
	GameEvents.CityCaptureComplete.Add(JFD_RussiaPutin_CityCapture)	
end
--------------------------------------------------------------------------------------------------------------------------
-- STATE ASSEMBLY
--------------------------------------------------------------------------------------------------------------------------
-- JFD_RussiaPutin_StateAssembly
local buildingStateAssemblyID = GameInfoTypes["BUILDING_JFD_STATE_ASSEMBLY"]
local buildingStateAssemblyHappinessID = GameInfoTypes["BUILDING_JFD_STATE_ASSEMBLY_HAPPINESS"]
function JFD_RussiaPutin_StateAssembly(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		for city in player:Cities() do
			if city:IsHasBuilding(buildingStateAssemblyID) then
				local numRingsComplete = 0
				for value = 1, 4 do
					if JFD_IsTileRingComplete(playerID, city, value) then
						numRingsComplete = numRingsComplete + 1
					end
				end
				city:SetNumRealBuilding(buildingStateAssemblyHappinessID, numRingsComplete)
			else
				if city:IsHasBuilding(buildingStateAssemblyHappinessID) then
					city:SetNumRealBuilding(buildingStateAssemblyHappinessID, 0)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_RussiaPutin_StateAssembly)
--------------------------------------------------------------------------------------------------------------------------
-- SPETSNAZS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_RussiaPutin_Spetsnaz
local unitClassMarineID = GameInfoTypes["UNITCLASS_MARINE"]
local unitPromotionSpetsnazID = GameInfoTypes["PROMOTION_JFD_SPETSNAZ"]
-- JFD_RussiaPutin_Spetsnaz
function JFD_RussiaPutin_Spetsnaz(oldOwnerID, capital, plotX, plotY, newOwnerID)
	local player = Players[newOwnerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		local city = Map.GetPlot(plotX, plotY):GetPlotCity()
		if city:GetGarrisonedUnit():HasPromotion(unitPromotionSpetsnazID) then
			local oldPlayer = Players[oldOwnerID]
			local resistanceTurns = 1
			if city:IsOriginalCapital() then resistanceTurns = 2 end
			for otherCity in oldPlayer:Cities() do
				otherCity:ChangeResistanceTurns(resistanceTurns)
				if oldPlayer:IsHuman() then
					Events.GameplayAlertMessage(Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]Spetsnaz Operations have caused our empire to go into [ICON_RESISTANCE] Resistance![ENDCOLOR]"))
				end
			end
		end
	end
end
GameEvents.CityCaptureComplete.Add(JFD_RussiaPutin_Spetsnaz)	
--------------------------------------------------------------------------------------------------------------------------
-- EVENT: EMO PLAGUE
--------------------------------------------------------------------------------------------------------------------------
-- JFD_RussiaPutin_EventEmoPlague
local policyRussiaPutinEmos = GameInfoTypes["POLICY_EVENTS_JFD_RUSSIA_PUTIN_EMO_PLAGUE"]
function JFD_RussiaPutin_EventEmoPlague(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		if player:HasPolicy(policyRussiaPutinEmos) then
			local happiness	= player:GetExcessHappiness()
			local unhappiness = player:GetUnhappiness()
			player:ChangeGoldenAgeProgressMeter(-happiness)
			player:ChangeGoldenAgeProgressMeter(unhappiness)
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_RussiaPutin_EventEmoPlague)
--==========================================================================================================================
--==========================================================================================================================