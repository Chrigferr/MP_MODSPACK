-- JFD_RussiaPutin_StateAssembly_CityInfo
-- Author: JFD
-- DateCreated: 11/21/2014 10:10:10 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("IconSupport")
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
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
-------------------------------------------------------------------------------------------------------------------------
-- USER SETTINGS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetUserSetting
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
local userSettingColoniesLoyaltyCore = JFD_GetUserSetting("JFD_CID_COLONIES_LOYALTY_CORE") == 1
-------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
-------------------------------------------------------------------------------------------------------------------------
local activePlayerID	= Game.GetActivePlayer()
local activePlayer		= Players[activePlayerID]
local civilizationID 	= GameInfoTypes["CIVILIZATION_JFD_RUSSIA_PUTIN"]
local isRussiaPutinCivActive	 = JFD_IsCivilisationActive(civilizationID)
local isRussiaPutinActivePlayer  = activePlayer:GetCivilizationType() == civilizationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_RussiaPutin_StateAssembly_CityInfo", ["SortOrder"] = 1})
end
if isRussiaPutinActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_RussiaPutin_StateAssembly_CityInfo" then return end
	ProcessCityScreen(instance)
end
if isRussiaPutinActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end
if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
g_JFD_RussiaPutin_StateAssembly_TipControls = {}
TTManager:GetTypeControlTable("JFD_RussiaPutin_StateAssembly_Tooltip", g_JFD_RussiaPutin_StateAssembly_TipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
local buildingStateAssemblyHappinessID = GameInfoTypes["BUILDING_JFD_STATE_ASSEMBLY_HAPPINESS"]
function ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	instance.IconFrame:SetToolTipType("JFD_RussiaPutin_StateAssembly_Tooltip")
	IconHookup(3, 64, "JFD_RUSSIA_PUTIN_ATLAS", instance.IconImage)
	local cityBonus = city:GetNumBuilding(buildingStateAssemblyHappinessID) 
	if (cityBonus == 0 or (not city:IsHasBuilding(buildingStateAssemblyHappinessID))) then
		instance.IconFrame:SetHide(true)
		return
	end
	local textDescription = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_BUILDING_JFD_STATE_ASSEMBLY")) .. "[ENDCOLOR]"
	local textHelp = Locale.ConvertTextKey("TXT_KEY_JFD_STATE_ASSEMBLY_CITY_VIEW_HELP", cityBonus)
	if userSettingColoniesLoyaltyCore then textHelp = Locale.ConvertTextKey("TXT_KEY_JFD_STATE_ASSEMBLY_CITY_VIEW_HELP_LOYALTY", cityBonus, cityBonus*10) end
	g_JFD_RussiaPutin_StateAssembly_TipControls.Heading:SetText(textDescription)
	g_JFD_RussiaPutin_StateAssembly_TipControls.Body:SetText(textHelp)
	g_JFD_RussiaPutin_StateAssembly_TipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
