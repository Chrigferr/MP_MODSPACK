-- JFD_GreatBritain_Redcoat_CityInfo
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
local civilizationID  = GameInfoTypes["CIVILIZATION_JFD_GREAT_BRITAIN"]
local isGreatBritainCivActive = JFD_IsCivilisationActive(civilizationID)
local isGreatBritainActivePlayer = activePlayer:GetCivilizationType() == civilizationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_GreatBritain_Redcoat_CityInfo", ["SortOrder"] = 1})
end
if isGreatBritainActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_GreatBritain_Redcoat_CityInfo" then return end
	ProcessCityScreen(instance)
end
if isGreatBritainActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end
if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
g_JFD_GreatBritain_Redcoat_TipControls = {}
TTManager:GetTypeControlTable("JFD_GreatBritain_Redcoat_Tooltip", g_JFD_GreatBritain_Redcoat_TipControls)

-- ProcessCityScreen
local buildingRedcoatID = GameInfoTypes["BUILDING_JFD_REDCOAT"]
function ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	instance.IconFrame:SetToolTipType("JFD_GreatBritain_Redcoat_Tooltip")
	IconHookup(3, 64, "JFD_GREAT_BRITAIN_ATLAS", instance.IconImage)
	if (not city:IsHasBuilding(buildingRedcoatID)) then
		instance.IconFrame:SetHide(true)
		return
	end
	local productionBonus = city:GetNumBuilding(buildingRedcoatID)
	local textDescription = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_UNIT_JFD_REDCOAT")) .. "[ENDCOLOR]"
	local textHelp = Locale.ConvertTextKey("TXT_KEY_UNIT_JFD_REDCOAT_CITY_VIEW_HELP", productionBonus)
	g_JFD_GreatBritain_Redcoat_TipControls.Heading:SetText(textDescription)
	g_JFD_GreatBritain_Redcoat_TipControls.Body:SetText(textHelp)
	g_JFD_GreatBritain_Redcoat_TipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
