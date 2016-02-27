-- JFD_ByzantiumTheodora_Functions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM
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
-- JFD_GetUserSetting
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
local userSettingByzantiumTheodoraUA = JFD_GetUserSetting("JFD_CIVILIZATIONS_BYZANTIUM_UA") == 1
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID	= Game.GetActivePlayer()
local activePlayer		= Players[activePlayerID]
local civilizationID	= GameInfoTypes["CIVILIZATION_BYZANTIUM"]
local isCivByzantiumActive = JFD_IsCivilisationActive(civilizationID)
if isCivByzantiumActive then
	print("Emperor Theodora is in this game")
end
--------------------------------------------------------------------------------------------------------------------------
-- PATRIARCHATE OF CONSTANTINOPLE
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Byzantium_GreatProphet
local techTheologyID = GameInfoTypes["TECH_THEOLOGY"]
local unitProphetID	 = GameInfoTypes["UNIT_PROPHET"]
function JFD_Byzantium_GreatProphet(teamID, techID)
	local playerID = Teams[teamID]:GetLeaderID()
	local player = Players[playerID] 
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		if techID == techTheologyID then
			local capital = player:GetCapitalCity()
			local capitalX = capital:GetX()
			local capitalY = capital:GetY()
			player:InitUnit(unitProphetID, capitalX, capitalY)
		end
	end
end
if (isCivByzantiumActive and userSettingByzantiumTheodoraUA) then
	GameEvents.TeamTechResearched.Add(JFD_Byzantium_GreatProphet)
end
--------------------------------------------------------------------------------------------------------------------------
-- STOUDION
--------------------------------------------------------------------------------------------------------------------------
local buildingStoudionID			= GameInfoTypes["BUILDING_JFD_STOUDION"]
local unitPromotionExtraMovesID		= GameInfoTypes["PROMOTION_EXTRA_MOVES_I"]
local unitPromotionSightPenaltyID	= GameInfoTypes["PROMOTION_SIGHT_PENALTY"]
local unitMissionaryID				= GameInfoTypes["UNIT_MISSIONARY"]
function JFD_Byzantium_Stoudion(playerID, cityID, unitID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
		local city = player:GetCityByID(cityID)
		if city:IsHasBuilding(buildingStoudionID) then
			local unit = player:GetUnitByID(unitID)
			if unit:GetUnitType() == unitMissionaryID then
				unit:SetHasPromotion(unitPromotionExtraMovesID, true)
				unit:SetHasPromotion(unitPromotionSightPenaltyID, false)
			end
		end
	end
end
if isCivByzantiumActive then
	GameEvents.CityTrained.Add(JFD_Byzantium_Stoudion)
end
--==========================================================================================================================
--==========================================================================================================================