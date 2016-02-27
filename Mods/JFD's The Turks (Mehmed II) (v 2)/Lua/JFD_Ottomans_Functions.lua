-- JFD_Ottoman_Functions
-- Author: JFD
-- DateCreated: 6/5/2015 2:45:49 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("JFD_OttomansDTP.lua")
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
-- USER SETTINGS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetUserSetting
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID			= Game.GetActivePlayer()
local activePlayer				= Players[activePlayerID]
local civilizationOttomanID		= GameInfoTypes["CIVILIZATION_OTTOMAN"]
local isCivOttomanActive		= JFD_IsCivilisationActive(civilizationOttomanID)
local isCivOttomanActivePlayer  = activePlayer:GetCivilizationType() == civilizationOttomanID
local userSettingOttomansUA		= JFD_GetUserSetting("JFD_CIVILIZATIONS_OTTOMAN_UA") == 1
if isCivOttomanActive then
	print("Sultan Suleiman is in this game")
end
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- SUZERAINTY
----------------------------------------------------------------------------------------------------------------------------
-- JFD_Ottomans_Init
local policyOttomanID = GameInfoTypes["POLICY_JFD_OTTOMAN_INTERNAL_BONUS"]
function JFD_Ottomans_Init()
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if (player:IsAlive() and player:GetCivilizationType() == civilizationOttomanID) then
			if (not player:HasPolicy(policyOttomanID)) then
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(policyOttomanID, true)
			end
		end
	end 
end
if (isCivOttomanActive and userSettingOttomansUA) then
	Events.LoadScreenClose.Add(JFD_Ottomans_Init)
end

-- JFD_Ottomans_Tribute
function JFD_Ottomans_Tribute(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationOttomanID) then
		local numGoldFromPuppets = JFD_Ottomans_GetGoldFromPuppets(playerID)
		if numGoldFromPuppets > 0 then
			player:ChangeGold(numGoldFromPuppets)
		end
		local numFaithFromPuppets = JFD_Ottomans_GetFaithFromPuppets(playerID)
		if numFaithFromPuppets > 0 then
			player:ChangeFaith(numFaithFromPuppets)
		end
	end
end
if (isCivOttomanActive and userSettingOttomansUA) then
	GameEvents.PlayerDoTurn.Add(JFD_Ottomans_Tribute)
end
--==========================================================================================================================
--==========================================================================================================================