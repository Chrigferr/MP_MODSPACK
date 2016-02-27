-- JFD_Normandy_Functions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("UniqueDiplomacyUtils.lua")
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
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
--------------------------------------------------------------------------------------------------------------------------
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsHasOriginalCapital
function JFD_IsHasOriginalCapital(playerID, otherPlayerID)
	local player = Players[playerID]
	for city in player:Cities() do
		if (city:GetOriginalOwner() == otherPlayerID and city:IsOriginalCapital()) then
			return true
		end
	end
end	
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID		= Game.GetActivePlayer()
local activePlayer			= Players[activePlayerID]
local civilizationID		= GameInfoTypes["CIVILIZATION_JFD_NORMANDY"]
local isCivNormandyActive	= JFD_IsCivilisationActive(civilizationID)
local isCivNormandyActivePlayer	= activePlayer:GetCivilizationType() == civilizationID
if isCivNormandyActive then
	print("Duke William the Conqueror is in this game")
end
--==========================================================================================================================
-- DIPLOMACY FUNCTIONS
--==========================================================================================================================
-- DIPLOMACY
----------------------------------------------------------------------------------------------------------------------------
-- JFD_Normandy_UniqueResponses
local civilizationAngloSaxons 		= GameInfoTypes["CIVILIZATION_JFD_ANGLO_SAXONS"]
local civilizationEnglandID 		= GameInfoTypes["CIVILIZATION_ENGLAND"]
local civilizationHenryVIIEngland 	= GameInfoTypes["CIVILIZATION_JFD_HENRY_ENGLAND"]
function JFD_Normandy_UniqueResponses()
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
        local player = Players[playerID]
        if (player and player:IsAlive() and player:IsHuman()) then
			local civilizationID = player:GetCivilizationType()
			-- If the player is England
			if (civilizationID == civilizationAngloSaxons or civilizationID == civilizationEnglandID or civilizationID == civilizationHenryVIIEngland) then
				ChangeDiplomacyResponse("LEADER_JFD_WILLIAM_I", "RESPONSE_FIRST_GREETING", "TXT_KEY_LEADER_JFD_WILLIAM_I_FIRSTGREETING%", "TXT_KEY_LEADER_JFD_WILLIAM_I_ENGLAND_FIRSTGREETING_1", 500)
				ChangeDiplomacyResponse("LEADER_JFD_WILLIAM_I", "RESPONSE_DEFEATED", "TXT_KEY_LEADER_JFD_WILLIAM_I_DEFEATED%", "TXT_KEY_LEADER_JFD_WILLIAM_I_ENGLAND_DEFEATED_1", 500)
				break
			end
		end
	end
end
if (isCivNormandyActive and (not isCivNormandyActivePlayer)) then
	Events.SequenceGameInitComplete.Add(JFD_Normandy_UniqueResponses)
end
--==========================================================================================================================
-- UA FUNCTIONS
--==========================================================================================================================
-- BAYEUX TAPESTRY
----------------------------------------------------------------------------------------------------------------------------
-- JFD_Normandy_CourthousesOnConquest
local buildingCourthouseID = GameInfoTypes["BUILDING_COURTHOUSE"]
function JFD_Normandy_CourthousesOnConquest(oldOwnerID, capital, plotX, plotY, newOwnerID)
	local player = Players[newOwnerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		local city = Map.GetPlot(plotX, plotY):GetPlotCity()
		if city:IsOriginalCapital() then
			city:SetNumRealBuilding(buildingCourthouseID, 1)
			for otherCity in player:Cities() do
				if otherCity:GetOriginalOwner() == oldOwnerID then
					if (not otherCity:IsHasBuilding(buildingCourthouseID)) then
						otherCity:SetNumRealBuilding(buildingCourthouseID, 1)
					end
				end
			end	
		else
			if JFD_IsHasOriginalCapital(newOwnerID, oldOwnerID) then
				city:SetNumRealBuilding(buildingCourthouseID, 1)
			end
		end
	end
end
if isCivNormandyActive then
	GameEvents.CityCaptureComplete.Add(JFD_Normandy_CourthousesOnConquest)
end
--==========================================================================================================================
--==========================================================================================================================