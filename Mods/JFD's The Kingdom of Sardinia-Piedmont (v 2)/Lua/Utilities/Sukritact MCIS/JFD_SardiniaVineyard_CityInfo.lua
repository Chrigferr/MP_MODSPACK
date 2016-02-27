-- JFD_SardiniaVineyard_CityInfo
-- Author: JFD
-- DateCreated: 11/21/2014 10:10:10 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("IconSupport")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
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
local activePlayerID  = Game.GetActivePlayer()
local activePlayer	  = Players[activePlayerID]
local civilizationID  = GameInfoTypes["CIVILIZATION_JFD_SARDINIA"]
local isSardiniaCivActive = JFD_IsCivilisationActive(civilizationID)
local isSardiniaActivePlayer = activePlayer:GetCivilizationType() == civilizationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_SardiniaVineyard_CityInfo", ["SortOrder"] = 1})
end
if isSardiniaActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_SardiniaVineyard_CityInfo" then return end
	ProcessCityScreen(instance)
end
if isSardiniaActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end
if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
g_JFD_SardiniaVineyard_TipControls = {}
TTManager:GetTypeControlTable("JFD_SardiniaVineyard_Tooltip", g_JFD_SardiniaVineyard_TipControls)

-- ProcessCityScreen
local buildingSardiniaVineyardID = GameInfoTypes["BUILDING_DECISIONS_JFD_ROYAL_VINEYARD_HAPPINESS"]
function ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	instance.IconFrame:SetToolTipType("JFD_SardiniaVineyard_Tooltip")
	IconHookup(5, 64, "JFD_SARDINIA_ATLAS", instance.IconImage)
	if (not city:IsHasBuilding(buildingSardiniaVineyardID)) then
		instance.IconFrame:SetHide(true)
		return
	end
	local happinessBonus = city:GetNumBuilding(buildingSardiniaVineyardID)
	local textDescription = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_BUILDING_DECISIONS_JFD_ROYAL_VINEYARD")) .. "[ENDCOLOR]"
	local textHelp = Locale.ConvertTextKey("TXT_KEY_JFD_VE_ROYAL_VINEYARD_CITY_VIEW_HELP", happinessBonus)
	g_JFD_SardiniaVineyard_TipControls.Heading:SetText(textDescription)
	g_JFD_SardiniaVineyard_TipControls.Body:SetText(textHelp)
	g_JFD_SardiniaVineyard_TipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
