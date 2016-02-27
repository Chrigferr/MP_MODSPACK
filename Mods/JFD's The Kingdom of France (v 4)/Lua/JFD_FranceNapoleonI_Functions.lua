-- JFD_FranceNapoleon_Functions
-- Author: JFD
-- DateCreated: 3/12/2014 9:35:16 PM
--=======================================================================================================================
-- Includes
--=======================================================================================================================
include("FLuaVector.lua")
include("IconSupport")
include("NewSaveUtils.lua"); MY_MOD_NAME = "NapoleonicFrance";
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
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

-- JFD_IsUsingClaimsColonies
function JFD_IsUsingClaimsColonies()
	local claimsColoniesModID = "10e9728f-d61c-4317-be4f-7d52d6bae6f4"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == claimsColoniesModID) then
			return true
		end
	end
	return false
end
local isUsingClaimsColonies = JFD_IsUsingClaimsColonies()
--------------------------------------------------------------------------------------------------------------------------
-- USER SETTINGS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetUserSetting
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- UTILS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

-- JFD_GetGreatGeneralStationedInCity
local unitClassGreatGeneralID = GameInfoTypes["UNITCLASS_GREAT_GENERAL"]
function JFD_GetGreatGeneralStationedInCity(city)
	local plot = city:Plot()
	for i = 0, plot:GetNumUnits() - 1, 1 do
		local unit = plot:GetUnit(i)
		if unit then
			if unit:GetUnitClassType() == unitClassGreatGeneralID then
				return unit
			end
		end
	end
end
--=======================================================================================================================
-- UNIQUE FUNCTIONS	
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local activePlayerID	   = Game.GetActivePlayer()
local activePlayer		   = Players[activePlayerID]
local buildingCourthouseID = GameInfoTypes["BUILDING_COURTHOUSE"]
local civilizationID	   = GameInfoTypes["CIVILIZATION_JFD_FRANCE_NAPOLEON"]
local isFranceCivActive    = JFD_IsCivilisationActive(civilizationID)
local isFranceActivePlayer = activePlayer:GetCivilizationType() == civilizationID
local userSettingFranceUA  = JFD_GetUserSetting("JFD_CIVILIZATIONS_FRANCE_NAPOLEON_I_UA") == 1
if isFranceCivActive then
	print("Emperor Napoleon I is in this game.")
end
----------------------------------------------------------------------------------------------------------------------------
-- SUN OF AUSTERLITZ
----------------------------------------------------------------------------------------------------------------------------	
local unitGeneralID	= GameInfoTypes["UNIT_GREAT_GENERAL"]
local unitFranceGeneralID = GameInfoTypes["UNIT_JFD_GENERAL_FRANCE"]
-- JFD_FranceNapoleon_GreatGeneralPlayerCanTrain
function JFD_FranceNapoleon_GreatGeneralPlayerCanTrain(playerID, unitID)
	return unitID ~= unitFranceGeneralID
end
GameEvents.PlayerCanTrain.Add(JFD_FranceNapoleon_GreatGeneralPlayerCanTrain)

-- JFD_FranceNapoleon_GreatGeneral
local unitClassGreatGeneralID = GameInfoTypes["UNITCLASS_GREAT_GENERAL"]
function JFD_FranceNapoleon_GreatGeneral(playerID, unitID)
    local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
	  	 if player:GetUnitClassCount(unitClassGreatGeneralID) == 0 then return end
		 local unit = player:GetUnitByID(unitID) 
		 if (unit and unit:GetUnitType() == unitGeneralID) then
			if player:IsHuman() then
				local newUnit = player:InitUnit(unitFranceGeneralID, unit:GetX(), unit:GetY())
				newUnit:Convert(unit)
			else
				player:ChangeGoldenAgeTurns(4)
			end
	    end
	end
end
if (isFranceCivActive and (not userSettingFranceUA)) then
	Events.SerialEventUnitCreated.Add(JFD_FranceNapoleon_GreatGeneral)
end

-- JFD_FranceNapoleon_GreatGeneralOnWar
function JFD_FranceNapoleon_GreatGeneralOnWar(teamID, otherTeamID)
	local player = Players[Teams[teamID]:GetLeaderID()]
	local otherPlayer = Players[Teams[otherTeamID]:GetLeaderID()]
	if (otherPlayer:GetCivilizationType() == civilizationID and (not player:IsMinorCiv())) then
		local capital = otherPlayer:GetCapitalCity()
		otherPlayer:InitUnit(unitFranceGeneralID, capital:GetX(), capital:GetY()):JumpToNearestValidPlot()
	elseif (player:GetCivilizationType() == civilizationID and (not otherPlayer:IsMinorCiv())) then
		local capital = player:GetCapitalCity()
		player:InitUnit(unitFranceGeneralID, capital:GetX(), capital:GetY()):JumpToNearestValidPlot()
	end
end
if isFranceCivActive then
	GameEvents.DeclareWar.Add(JFD_FranceNapoleon_GreatGeneralOnWar)
end

-- JFD_FranceNapoleon_AI
local policyNapoleonicFranceID = GameInfoTypes["POLICY_JFD_NAPOLEONIC_FRANCE"]
function JFD_FranceNapoleon_AI()
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if player:GetCivilizationType() == civilizationID then
			if (not player:HasPolicy(policyNapoleonicFranceID)) then
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(policyNapoleonicFranceID, true)
			end
		end
	end
end
if (isFranceCivActive and (not isFranceActivePlayer)) then
	GameEvents.LoadScreenClose.Add(JFD_FranceNapoleon_AI)
end

-- JFD_FranceNapoleon_AltUA
function JFD_FranceNapoleon_AltUA(oldOwnerID, capital, plotX, plotY, newOwnerID)
	local player = Players[newOwnerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		local city = Map.GetPlot(plotX, plotY):GetPlotCity()
		if city then
			city:SetNumRealBuilding(buildingCourthouseID, 1)
		end
	end
end
if (isFranceCivActive and userSettingFranceUA) then
	GameEvents.CityCaptureComplete.Add(JFD_FranceNapoleon_AltUA)
end
-----------------
-- UI
-----------------	
local isCityViewOpen = false

-- JFD_FranceNapoleon_UpdateGGBox
function JFD_FranceNapoleon_UpdateGGBox()
	Controls.FranceNapoleonIBox:SetHide(true)
	Controls.FranceNapoleonIButton:SetDisabled(true)
	Controls.FranceNapoleonIButton:LocalizeAndSetToolTip(nil)
	local city = UI.GetHeadSelectedCity()
	if (city and city:IsOccupied() and (not city:IsHasBuilding(buildingCourthouseID))) then
		local isDisabled = false
		if (city:IsRazing() or city:IsPuppet() or (not JFD_GetGreatGeneralStationedInCity(city))) then
			isDisabled = true
		end
		IconHookup(48, 64, "UNIT_ATLAS_2", Controls.FranceNapoleonIImg)
		Controls.FranceNapoleonIBox:SetHide(false)
		Controls.FranceNapoleonIButton:LocalizeAndSetText("TXT_KEY_JFD_NAPOLEON_GENERAL_EXPEND")
		Controls.FranceNapoleonIButton:LocalizeAndSetToolTip(buttonToolTipDisabled)
		Controls.FranceNapoleonIButton:SetDisabled(isDisabled)
		Controls.FranceNapoleonIButton:LocalizeAndSetToolTip("TXT_KEY_JFD_NAPOLEON_GENERAL_EXPEND_TT_OCCUPIED")		
		if isDisabled then
			Controls.FranceNapoleonIButton:LocalizeAndSetToolTip("TXT_KEY_JFD_NAPOLEON_GENERAL_EXPEND_TT_OCCUPIED_DISABLED")		
		end
	end
end

-- JFD_FranceNapoleon_ExpendGG
function JFD_FranceNapoleon_ExpendGG()
	local city = UI.GetHeadSelectedCity();
	if city then
		local unitGreatGeneral = JFD_GetGreatGeneralStationedInCity(city)
		local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
		if unitGreatGeneral then
			Events.GameplayFX(hex.x, hex.y, -1)
			unitGreatGeneral:Kill(false, -1)
		end
		city:ChangeResistanceTurns(-city:GetResistanceTurns())
		city:SetNumRealBuilding(buildingCourthouseID, 1)
	end
	JFD_FranceNapoleon_UpdateGGBox()
end
if (isFranceCivActive and isFranceActivePlayer and (not userSettingFranceUA) and (not isUsingClaimsColonies)) then
	Controls.FranceNapoleonIButton:RegisterCallback(Mouse.eLClick, JFD_FranceNapoleon_ExpendGG)
end

-- JFD_OnEnterCityScreen
function JFD_OnEnterCityScreen()
	isCityViewOpen = true
	JFD_FranceNapoleon_UpdateGGBox()
end

-- JFD_OnExitCityScreen
function JFD_OnExitCityScreen()
	isCityViewOpen = false
	JFD_FranceNapoleon_UpdateGGBox()
end

-- JFD_OnNextCityScren
function JFD_OnNextCityScren()
	if isCityViewOpen then
		JFD_FranceNapoleon_UpdateGGBox()
	end
end
if (isFranceCivActive and isFranceActivePlayer and (not userSettingFranceUA) and (not isUsingClaimsColonies)) then
	Events.SerialEventEnterCityScreen.Add(JFD_OnEnterCityScreen)
	Events.SerialEventExitCityScreen.Add(JFD_OnExitCityScreen)
	Events.SerialEventCityScreenDirty.Add(JFD_OnNextCityScren)
end
----------------------------------------------------------------------------------------------------------------------------
-- CHEVAU-LEGER
----------------------------------------------------------------------------------------------------------------------------	
-- JFD_FranceNapoleon_ChevauLeger
local unitPromotionChevauLegerID = GameInfoTypes["PROMOTION_JFD_CHEVAU_LEGER"]
local unitPromotionChevauLegerInfoID = GameInfoTypes["PROMOTION_JFD_CHEVAU_LEGER_INFO"]
function JFD_FranceNapoleon_ChevauLeger(playerID)
	local player = Players[playerID]
	for unit in player:Units() do
		if (unit:IsHasPromotion(unitPromotionChevauLegerID) or unit:IsHasPromotion(unitPromotionChevauLegerInfoID)) then
			if unit:GetDamage() >= 50 then
				if unit:IsHasPromotion(unitPromotionChevauLegerInfoID) then
					unit:SetHasPromotion(unitPromotionChevauLegerID, true)
					unit:SetHasPromotion(unitPromotionChevauLegerInfoID, false)
				end
			else
				if unit:IsHasPromotion(unitPromotionChevauLegerID) then
					unit:SetHasPromotion(unitPromotionChevauLegerID, false)
					unit:SetHasPromotion(unitPromotionChevauLegerInfoID, true)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_FranceNapoleon_ChevauLeger)
----------------------------------------------------------------------------------------------------------------------------
-- IMPERIAL GUARD
----------------------------------------------------------------------------------------------------------------------------
-- JFD_FranceNapoleon_ImperialGuard	
local unitImperialGuardID = GameInfoTypes["UNIT_JFD_IMPERIAL_GUARD"]
function JFD_FranceNapoleon_ImperialGuard(playerID, cityID, unitID)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if unit:GetUnitType() == unitImperialGuardID then
		local city = player:GetCityByID(cityID)
		if city:IsHasBuilding(buildingCourthouseID) then
			unit:ChangeExperience(20)
		end
	end
end	
if isFranceCivActive then
	GameEvents.CityTrained.Add(JFD_FranceNapoleon_ImperialGuard)
end
--==========================================================================================================================
--==========================================================================================================================