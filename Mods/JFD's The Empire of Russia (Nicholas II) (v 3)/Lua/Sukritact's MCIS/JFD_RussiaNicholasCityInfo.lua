-- JFD_RussiaNicholasCityInfo
-- Author: JFD
-- DateCreated: 11/21/2014 10:10:10 AM
--=======================================================================================================================
-- Includes
--=======================================================================================================================
include("IconSupport")
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
local activePlayer					= Players[Game.GetActivePlayer()]
local civilisationID				= GameInfoTypes["CIVILIZATION_JFD_NICHOLAS_RUSSIA"]
local isRussiaNicholasActivePlayer	= activePlayer:GetCivilizationType() == civilisationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_RussiaNicholasCityInfo", ["SortOrder"] = 1})
end

if isRussiaNicholasActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_RussiaNicholasCityInfo" then return end
	ProcessCityScreen(instance)
end

if isRussiaNicholasActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end

if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingNicholasFaithID				= GameInfoTypes["BUILDING_JFD_WE_LOVE_THE_KING_DAY_FAITH"]
local buildingNicholasWonderProductionID	= GameInfoTypes["BUILDING_JFD_WONDER_PRODUCTION"]

g_JFDRussiaNicholasTipControls = {}
TTManager:GetTypeControlTable("JFDRussiaNicholasTooltip", g_JFDRussiaNicholasTipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
function ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	instance.IconFrame:SetToolTipType("JFDRussiaNicholasTooltip")
	IconHookup(0, 64, "JFD_RUSSIA_NICHOLAS_ATLAS", instance.IconImage)
	
	local bonus = city:GetNumBuilding(buildingNicholasWonderProductionID)
	local bonusFaith = city:GetNumBuilding(buildingNicholasFaithID)
	if (bonus <= 0 and bonusFaith <= 0) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_NICHOLAS_RUSSIA_SHORT")) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_JFD_RUSSIA_NICHOLAS_CITY_VIEW_HELP", bonusFaith, bonus)
	g_JFDRussiaNicholasTipControls.Heading:SetText(titleText)
	g_JFDRussiaNicholasTipControls.Body:SetText(helpText)
	g_JFDRussiaNicholasTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
