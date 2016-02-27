-- JFD_SwitzerlandFunctions
-- Author: JFD
-- DateCreated: 12/4/2013 9:47:55 AM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- MOD CHECKS
----------------------------------------------------------------------------------------------------------------------------
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
-- INCLUDES
--==========================================================================================================================
include("JFD_Switzerland_DTP.lua")
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID			= Game.GetActivePlayer()
local activePlayer				= Players[activePlayerID]
local civilizationID 			= GameInfoTypes["CIVILIZATION_JFD_SWITZERLAND"]
local isSwitzerlandCivActive	= JFD_IsCivilisationActive(civilizationID)
local isSwitzerlandActivePlayer	= activePlayer:GetCivilizationType() == civilizationID
local mathCeil 					= math.ceil
local mathFloor 				= math.floor
if isSwitzerlandCivActive then
	print("General Dufour is in this game")
end
----------------------------------------------------------------------------------------------------------------------------
-- SWISS NEUTRALITY
----------------------------------------------------------------------------------------------------------------------------
-- JFD_Switzerland_NeutralCityStates
function JFD_Switzerland_NeutralCityStates(teamID, otherTeamID)
	local player = Players[Teams[teamID]:GetLeaderID()]
	local otherPlayer = Players[Teams[otherTeamID]:GetLeaderID()]
	if (player:IsMinorCiv() and otherPlayer:GetCivilizationType() == civilizationID) then
		Teams[otherTeamID]:MakePeace(teamID)
		player:ChangeMinorCivFriendshipWithMajor(otherPlayer:GetID(), 1)
	end
end
GameEvents.DeclareWar.Add(JFD_Switzerland_NeutralCityStates)

-- JFD_Switzerland_NeutralCityStatesNotification
function JFD_Switzerland_NeutralCityStatesNotification(notificationID, notificationType, headerText, summaryText)
	if summaryText == Locale.ConvertTextKey("TXT_KEY_MISC_MINOR_ALLIES_DECLARED_WAR_ON_YOU_SUMMARY") then
		UI.RemoveNotification(notificationID)
	end
end
if isSwitzerlandActivePlayer then
	Events.NotificationAdded.Add(JFD_Switzerland_NeutralCityStatesNotification)
end

-- JFD_Switzerland_NeutralGold
function JFD_Switzerland_NeutralGold(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		local goldFromNeutrality = JFD_Switzerland_GetGoldFromNeutrality(playerID)
		if goldFromNeutrality > 0 then
			player:ChangeGold(goldFromNeutrality)
		end
	end
end
if isSwitzerlandCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_Switzerland_NeutralGold)
end
----------------------------------------------------------------------------------------------------------------------------
-- KASERNE
----------------------------------------------------------------------------------------------------------------------------
local buildingKaserneID = GameInfoTypes["BUILDING_JFD_KASERNE"]
local unitPromotionKaserneID = GameInfoTypes["PROMOTION_JFD_KASERNE"]
local userSettingMercenariesNoGoldPurchase = JFD_GetUserSetting("JFD_MERCENARIES_NO_GOLD_PURCHASING") == 1
function JFD_Switzerland_Kaserne(playerID, cityID, unitID, isGold)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		if isGold then
			local city = player:GetCityByID(cityID)
			if city:HasBuilding(buildingKaserneID) then
				local unit = player:GetUnitByID(unitID)
				if unit:IsCombatUnit() then
					unit:SetHasPromotion(unitPromotionKaserneID, true)
				end
			end
		end
	end
end
if (isSwitzerlandCivActive and (not userSettingMercenariesNoGoldPurchase)) then
	GameEvents.CityTrained.Add(JFD_Switzerland_Kaserne)
end
--=======================================================================================================================================================================================
--=======================================================================================================================================================================================
