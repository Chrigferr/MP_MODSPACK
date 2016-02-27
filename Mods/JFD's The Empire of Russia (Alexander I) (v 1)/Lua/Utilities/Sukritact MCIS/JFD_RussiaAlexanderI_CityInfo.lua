-- JFD_RussiaAlexanderI_CityInfo
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
-- GLOBALS
-------------------------------------------------------------------------------------------------------------------------
local activePlayerID					= Game.GetActivePlayer()
local activePlayer						= Players[activePlayerID]
local civilizationID 					= GameInfoTypes["CIVILIZATION_JFD_RUSSIA_ALEXANDER_I"]
local isRussiaAlexanderICivActive		= JFD_IsCivilisationActive(civilizationID)
local isRussiaAlexanderIActivePlayer	= activePlayer:GetCivilizationType() == civilizationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_RussiaAlexanderI_CityInfo", ["SortOrder"] = 1})
end
if isRussiaAlexanderICivActive then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_RussiaAlexanderI_CityInfo" then return end
	ProcessCityScreen(instance)
end
if isRussiaAlexanderICivActive then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end
if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
g_JFD_RussiaAlexanderI_TipControls = {}
TTManager:GetTypeControlTable("JFD_RussiaAlexanderI_Tooltip", g_JFD_RussiaAlexanderI_TipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
local buildingRussiaAlexanderIPressureID = GameInfoTypes["BUILDING_JFD_RUSSIA_ALEXANDER_I"]
function ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	instance.IconFrame:SetToolTipType("JFD_RussiaAlexanderI_Tooltip")
	IconHookup(0, 64, "JFD_RUSSIA_ALEXANDER_I_ATLAS", instance.IconImage)
	local cityBonus = city:GetNumBuilding(buildingRussiaAlexanderIPressureID)
	if (cityBonus == 0 or (not city:IsHasBuilding(buildingRussiaAlexanderIPressureID))) then
		instance.IconFrame:SetHide(true)
		return
	end
	local textDescription = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_RUSSIA_ALEXANDER_I_SHORT")) .. "[ENDCOLOR]"
	local textHelp = Locale.ConvertTextKey("TXT_KEY_JFD_RUSSIA_ALEXANDER_I_CITY_VIEW_HELP", cityBonus*10)
	if (not isRussiaAlexanderIActivePlayer) then
		textHelp = Locale.ConvertTextKey("TXT_KEY_JFD_RUSSIA_ALEXANDER_I_OTHER_CITY_VIEW_HELP", 10)
	end
	g_JFD_RussiaAlexanderI_TipControls.Heading:SetText(textDescription)
	g_JFD_RussiaAlexanderI_TipControls.Body:SetText(textHelp)
	g_JFD_RussiaAlexanderI_TipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
