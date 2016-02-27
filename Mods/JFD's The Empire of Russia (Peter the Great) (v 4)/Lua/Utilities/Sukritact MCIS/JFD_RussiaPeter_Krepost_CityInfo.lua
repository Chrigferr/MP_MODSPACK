-- JFD_RussiaPeter_Krepost_CityInfo
-- Author: JFD
-- DateCreated: 11/21/2014 10:10:10 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("IconSupport")
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
-- UTILITIES
-------------------------------------------------------------------------------------------------------------------------
local activePlayer				= Players[Game.GetActivePlayer()]
local civilizationID			= GameInfoTypes["CIVILIZATION_JFD_RUSSIA_PETER"]
local isRussiaPeterActivePlayer	= activePlayer:GetCivilizationType() == civilizationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_KrepostCityInfo", ["SortOrder"] = 1})
end
if isRussiaPeterActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_KrepostCityInfo" then return end
	ProcessCityScreen(instance)
end
if isRussiaPeterActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end

if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingKrepostID = GameInfoTypes["BUILDING_KREPOST"]
local buildingKrepostTilesID = GameInfoTypes["BUILDING_JFD_KREPOST_TILES"]

g_JFD_RussiaPeter_KrepostTipControls = {}
TTManager:GetTypeControlTable("JFD_RussiaPeter_KrepostToolTip", g_JFD_RussiaPeter_KrepostTipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
function ProcessCityScreen(instance)
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	if (not city:IsHasBuilding(buildingKrepostID)) then
		instance.IconFrame:SetHide(true)
		return
	end
	instance.IconFrame:SetToolTipType("JFD_RussiaPeter_KrepostToolTip")
	IconHookup(61, 64, "BW_ATLAS_1", instance.IconImage)
	local bonus = city:GetNumBuilding(buildingKrepostTilesID)
	if bonus <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_BUILDING_KREPOST_DESC")) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_BUILDING_JFD_KREPOST_CITY_VIEW_HELP", bonus)
	g_JFD_RussiaPeter_KrepostTipControls.Heading:SetText(titleText)
	g_JFD_RussiaPeter_KrepostTipControls.Body:SetText(helpText)
	g_JFD_RussiaPeter_KrepostTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
