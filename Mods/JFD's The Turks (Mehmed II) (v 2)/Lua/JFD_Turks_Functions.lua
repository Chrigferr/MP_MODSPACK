-- JFD_Turks_Functions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("NewSaveUtils.lua"); MY_MOD_NAME = "JFD_Turks";
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
-- GetStrongestMilitaryUnit (Sukritact)
function GetStrongestMilitaryUnit(pPlayer, bIgnoreResources, ...)
	local tUnit = {["ID"] = GameInfoTypes.UNIT_WARRIOR, ["Combat"] = 0}
	for iKey, sCombatType in pairs(arg) do
		for row in GameInfo.Units("CombatClass = \'" .. sCombatType .. "\'") do
			if pPlayer:CanTrain(row.ID, bIgnoreResources) and row.Combat > tUnit.Combat then
				tUnit = row
			end
		end
	end
	return tUnit.ID
end

-- JFD_GetUniqueUnit (Whoward)
function JFD_GetUniqueUnit(player, unitClass)
	local unitType = nil
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	for uniqueUnit in GameInfo.Civilization_UnitClassOverrides{CivilizationType = civType, UnitClassType = unitClass} do
		unitType = uniqueUnit.UnitType
		break
	end
	if (not unitType) then
		unitType = GameInfo.UnitClasses[unitClass].DefaultUnit
	end
	return unitType
end
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID	 = Game.GetActivePlayer()
local activePlayer		 = Players[activePlayerID]
local civilizationID	 = GameInfoTypes["CIVILIZATION_JFD_TURKS"]
local isCivTurksActive	 = JFD_IsCivilisationActive(civilizationID)
if isCivTurksActive then
	print("Sultan Mehmed II is in this game")
end
--==========================================================================================================================
-- UA FUNCTIONS
--==========================================================================================================================
-- TRIBUTE IN BLOOD
----------------------------------------------------------------------------------------------------------------------------
-- JFD_Turks_Init
local policyTurksID = GameInfoTypes["POLICY_JFD_TURKS"]
function JFD_Turks_Init()
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
			if (not player:HasPolicy(policyTurksID)) then
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(policyTurksID, true)
			end
		end
	end 
end
if isCivTurksActive then
	Events.LoadScreenClose.Add(JFD_Turks_Init)
end

-- JFD_Turks_UnitOnConquest
function JFD_Turks_UnitOnConquest(oldOwnerID, capital, plotX, plotY, newOwnerID)
	local player = Players[newOwnerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		local city = Map.GetPlot(plotX, plotY):GetPlotCity()
		local citySave = "JFD_Turks " .. city:GetX() .. city:GetY()
		if city and (not GetPersistentProperty(citySave)) then
			local otherPlayer = Players[oldOwnerID]
			local unitID = GetStrongestMilitaryUnit(player, true, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
			if unitID then
				local unitClass = GameInfo.Units[unitID].Class
				local unitType = "UNIT_OTTOMAN_JANISSARY"
				if unitClass ~= "UNITCLASS_MUSKETMAN" then
					unitType = JFD_GetUniqueUnit(otherPlayer, unitClass)
				end
				if unitType then
					unitID = GameInfoTypes[unitType]
					player:InitUnit(unitID, plotX, plotY)
				end
			end
			SetPersistentProperty(citySave, true)
		end
	end
end
if isCivTurksActive then
	GameEvents.CityCaptureComplete.Add(JFD_Turks_UnitOnConquest)
end
--==========================================================================================================================
--==========================================================================================================================