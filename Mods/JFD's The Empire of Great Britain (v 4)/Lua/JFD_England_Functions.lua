-- JFD_England_Functions
-- Author: JFD
-- DateCreated: 9/28/2015 2:02:42 PM
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
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID		= Game.GetActivePlayer()
local activePlayer			= Players[activePlayerID]
local civilizationID 		= GameInfoTypes["CIVILIZATION_ENGLAND"]
local isEnglandCivActive	= JFD_IsCivilisationActive(civilizationID)
local mathCeil 				= math.ceil
local mathFloor 			= math.floor
local userSettingEnglandUA  = JFD_GetUserSetting("JFD_CIVILIZATIONS_ENGLAND_UA") == 1
if isEnglandCivActive then
	print("Queen Elizabeth is in this game")
end
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- ELIZABETHAN AGE
--------------------------------------------------------------------------------------------------------------------------
local unitAdmiralID	= GameInfoTypes["UNIT_GREAT_ADMIRAL"]
local unitEnglandAdmiralID = GameInfoTypes["UNIT_JFD_ENGLAND_ADMIRAL"]

function JFD_England_GreatAdmiralPlayerCanTrain(playerID, unitID)
	return unitID ~= unitEnglandAdmiralID
end
GameEvents.PlayerCanTrain.Add(JFD_England_GreatAdmiralPlayerCanTrain)

function JFD_England_GreatAdmiral(playerID, unitID)
    local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
	  	 local unit = player:GetUnitByID(unitID) 
		 if (unit and unit:GetUnitType() == unitAdmiralID) then
			if player:IsHuman() then
				local newUnit = player:InitUnit(unitEnglandAdmiralID, unit:GetX(), unit:GetY())
				newUnit:Convert(unit)
			else
				player:ChangeGoldenAgeTurns(4)
			end
	    end
	end
end
if (isEnglandCivActive and userSettingEnglandUA) then
	Events.SerialEventUnitCreated.Add(JFD_England_GreatAdmiral)
end

-- JFD_England_ElizabethanAge
local domainSeaID = GameInfoTypes["DOMAIN_SEA"]
local unitPromotionEnglandID = GameInfoTypes["PROMOTION_JFD_ENGLAND"]
function JFD_England_ElizabethanAge(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
		for unit in player:Units() do
			if player:IsGoldenAge() then
				if (unit:IsEmbarked() or unit:GetDomainType() == domainSeaID) then
					if (not unit:IsHasPromotion(unitPromotionEnglandID)) then
						unit:SetHasPromotion(unitPromotionEnglandID, true)
					end
				end
			else
				if unit:IsHasPromotion(unitPromotionEnglandID) then
					unit:SetHasPromotion(unitPromotionEnglandID, false)
				end
			end
		end
	end
end
if (isEnglandCivActive and userSettingEnglandUA) then
	if isUsingCPDLL then
		GameEvents.PlayerGoldenAge.Add(JFD_England_ElizabethanAge) 
	else
		GameEvents.PlayerDoTurn.Add(JFD_England_ElizabethanAge)
	end
end
--==========================================================================================================================
--==========================================================================================================================