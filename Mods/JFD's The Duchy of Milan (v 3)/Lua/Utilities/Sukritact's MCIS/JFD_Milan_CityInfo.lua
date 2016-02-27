-- JFD_Milan_CityInfo
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
local civilizationID  = GameInfoTypes["CIVILIZATION_JFD_MILAN"]
local isMilanCivActive = JFD_IsCivilisationActive(civilizationID)
local isMilanActivePlayer = activePlayer:GetCivilizationType() == civilizationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_Milan_CityInfo", ["SortOrder"] = 1})
end
if isMilanActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_Milan_CityInfo" then return end
	ProcessCityScreen(instance)
end
if isMilanActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end
if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
g_JFD_Milan_TipControls = {}
TTManager:GetTypeControlTable("JFD_Milan_Tooltip", g_JFD_Milan_TipControls)

-- ProcessCityScreen
local buildingMilanID = GameInfoTypes["BUILDING_JFD_MILAN"]
function ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	instance.IconFrame:SetToolTipType("JFD_Milan_Tooltip")
	IconHookup(0, 64, "JFD_MILAN_ATLAS", instance.IconImage)
	if (not city:IsHasBuilding(buildingMilanID)) then
		instance.IconFrame:SetHide(true)
		return
	end
	local purchaseBonus = city:GetNumBuilding(buildingMilanID)
	local textDescription = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_MILAN_SHORT")) .. "[ENDCOLOR]"
	local textHelp = Locale.ConvertTextKey("TXT_KEY_JFD_MILAN_CITY_VIEW_HELP", purchaseBonus)
	g_JFD_Milan_TipControls.Heading:SetText(textDescription)
	g_JFD_Milan_TipControls.Body:SetText(textHelp)
	g_JFD_Milan_TipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
