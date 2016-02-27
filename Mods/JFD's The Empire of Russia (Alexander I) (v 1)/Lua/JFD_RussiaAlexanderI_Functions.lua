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
--------------------------------------------------------------------------------------------------------------------------
-- UTILS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsDoFWithRussiaAlexanderI
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_RUSSIA_ALEXANDER_I"]
function JFD_IsDoFWithRussiaAlexanderI(playerID)
	local player = Players[playerID]
	for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		if otherPlayerID ~= playerID then
			local otherPlayer = Players[otherPlayerID]
			if (otherPlayer:IsAlive() and otherPlayer:GetCivilizationType() == civilizationID and otherPlayer:IsDoF(playerID)) then
				return true
			end
		end
	end
	return false
end

-- JFD_RussiaAlexanderI_GetNumDoFs
function JFD_RussiaAlexanderI_GetNumDoFs(playerID)
	local player = Players[playerID]
	local numDoFs = 0
	for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		if otherPlayerID ~= playerID then
			local otherPlayer = Players[otherPlayerID]
			if (otherPlayer:IsAlive() and otherPlayer:IsDoF(playerID)) then
				numDoFs = numDoFs + 1
			end
		end
	end
	return numDoFs
end
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("PlotIterators.lua")
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayer = Players[Game.GetActivePlayer()]
local isRussiaAlexanderICivActive = JFD_IsCivilisationActive(civilizationID)
local isRussiaAlexanderIActivePlayer = activePlayer:GetCivilizationType() == civilizationID
local mathCeil 	= math.ceil
local mathFloor = math.floor
if isRussiaAlexanderICivActive then
	print("Emperor Alexnader I is in this game")
end
--==========================================================================================================================
-- DIPLOMACY FUNCTIONS
--==========================================================================================================================
-- HOLY ALLIANCE
--------------------------------------------------------------------------------------------------------------------------
-- JFD_RussiaAlexanderI_HolyAlliance 
local buildingAlexanderPressureID = GameInfoTypes["BUILDING_JFD_RUSSIA_ALEXANDER_I"]
local promotionRussiaAlexanderI = GameInfoTypes["PROMOTION_JFD_RUSSIA_ALEXANDER_I"]
function JFD_RussiaAlexanderI_HolyAlliance(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then	
		local numDoFs = JFD_RussiaAlexanderI_GetNumDoFs(playerID)
		for city in player:Cities() do
			if city:GetResistanceTurns() > 0 then
				city:ChangeResistanceTurns(-numDoFs)
			end
			city:SetNumRealBuilding(buildingAlexanderPressureID, numDoFs)
		end

		for unit in player:Units() do
			if unit:GetPlot() then
				local plotOwnerID = unit:GetPlot():GetOwner()
				if (plotOwnerID ~= playerID and plotOwnerID > -1) then
					if player:IsDoF(plotOwnerID) then
						unit:ChangeDamage(-10)
						if (not unit:IsHasPromotion(promotionRussiaAlexanderI)) then
							unit:SetHasPromotion(promotionRussiaAlexanderI, true)
						end
					else
						if unit:IsHasPromotion(promotionRussiaAlexanderI) then
							unit:SetHasPromotion(promotionRussiaAlexanderI, false)
						end
					end
				else
					if unit:IsHasPromotion(promotionRussiaAlexanderI) then
						unit:SetHasPromotion(promotionRussiaAlexanderI, false)
					end
				end
			end
		end
	elseif (player:IsAlive() and (not player:IsBarbarian()) and (not player:IsMinorCiv())) then	
		if JFD_IsDoFWithRussiaAlexanderI(playerID) then
			for city in player:Cities() do
				if city:GetResistanceTurns() > 0 then
					city:ChangeResistanceTurns(-1)
				end
				city:SetNumRealBuilding(buildingAlexanderPressureID, 2)
			end		
		else
			for city in player:Cities() do
				if city:IsHasBuilding(buildingAlexanderPressureID) then
					city:SetNumRealBuilding(buildingAlexanderPressureID, 0)
				end
			end
		end
	end
end
if isRussiaAlexanderICivActive then
	GameEvents.PlayerDoTurn.Add(JFD_RussiaAlexanderI_HolyAlliance)
end
--------------------------------------------------------------------------------------------------------------------------
-- LEIB GVARDE
--------------------------------------------------------------------------------------------------------------------------
--JFD_RussiaAlexanderI_LeibGvarde
local unitLeibGvardeID = GameInfoTypes["UNIT_JFD_LEIB_GVARDE"]
local unitPromotionLeibGvardeID = GameInfoTypes["PROMOTION_JFD_LEIB_GVARDE"]
function JFD_RussiaAlexanderI_LeibGvarde(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and (not player:IsBarbarian())) then	
		for unit in player:Units() do
			if unit:IsHasPromotion(unitPromotionLeibGvardeID) then
				if unit:GetFortifyTurns() > 0 then
					local isAdjacentLeibGvarde = false
					local unitPlot = unit:GetPlot()
					if isUsingCPDLL then
						isAdjacentLeibGvarde = unit:IsAdjacentToUnit(unitLeibGvardeID, true, false)
					else
						for adjacentPlot in PlotAreaSweepIterator(unitPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
							isAdjacentLeibGvarde = (adjacentPlot:GetUnit() and adjacentPlot:GetUnit():GetUnitType() == unitLeibGvardeID)
							if isAdjacentLeibGvarde == true then 
								break
							end
						end
					end
					if isAdjacentLeibGvarde then
						unit:ChangeMoves(120)
					else
						unit:ChangeMoves(60)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_RussiaAlexanderI_LeibGvarde)
--=======================================================================================================================
--=======================================================================================================================
