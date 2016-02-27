-- JFD_Bohemia_CityInfo
-- Author: JFD
-- DateCreated: 11/21/2014 10:10:10 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("IconSupport")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
-------------------------------------------------------------------------------------------------------------------------
local activePlayerID		= Game.GetActivePlayer()
local activePlayer			= Players[activePlayerID]
local civilizationID 		= GameInfoTypes["CIVILIZATION_JFD_BOHEMIA"]
local isBohemiaCivActive	= JFD_IsCivilisationActive(civilizationID)
local isBohemiaActivePlayer	= activePlayer:GetCivilizationType() == civilizationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_Bohemia_CityInfo", ["SortOrder"] = 1})
end
if isBohemiaActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_Bohemia_CityInfo" then return end
	ProcessCityScreen(instance)
end
if isBohemiaActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end
if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
g_JFD_Bohemia_TipControls = {}
TTManager:GetTypeControlTable("JFD_Bohemia_Tooltip", g_JFD_Bohemia_TipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
local buildingBohemiaDelegatesID = GameInfoTypes["BUILDING_JFD_BOHEMIAN_DELEGATES"]
function ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	if (not city:IsCapital()) then
		instance.IconFrame:SetHide(true)
		return
	end
	instance.IconFrame:SetToolTipType("JFD_Bohemia_Tooltip")
	IconHookup(0, 64, "JFD_BOHEMIA_ATLAS", instance.IconImage)
	if (not city:IsHasBuilding(buildingBohemiaDelegatesID)) then
		instance.IconFrame:SetHide(true)
		return
	end
	local delegateBonus = city:GetNumBuilding(buildingBohemiaDelegatesID)
	local religionID = activePlayer:GetReligionCreatedByPlayer() or activePlayer:GetCapitalCity():GetReligiousMajority()
	if isUsingCPDLL then religionID = activePlayer:GetMajorityReligion() end
	if religionID <= 0 then 
		instance.IconFrame:SetHide(true)
		return
	end
	local textDescription = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_BOHEMIA_SHORT")) .. "[ENDCOLOR]"
	local textHelp = Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_BOHEMIA_CITY_VIEW_HELP", delegateBonus, Game.GetReligionName(religionID), GameInfo.Religions[religionID].IconString)
	g_JFD_Bohemia_TipControls.Heading:SetText(textDescription)
	g_JFD_Bohemia_TipControls.Body:SetText(textHelp)
	g_JFD_Bohemia_TipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
