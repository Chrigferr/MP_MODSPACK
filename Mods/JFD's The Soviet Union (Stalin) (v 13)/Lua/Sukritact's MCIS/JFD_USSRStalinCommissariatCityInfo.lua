-- JFD_USSRStalinCommissariatCityInfo
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
local activePlayer			= Players[Game.GetActivePlayer()]
local civilisationID		= GameInfoTypes["CIVILIZATION_JFD_USSR_STALIN"]
local isUSSRActivePlayer	= activePlayer:GetCivilizationType() == civilisationID
-------------------------------------------------------------------------------------------------------------------------
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
	table.insert(tCityInfoAddins, {["Key"] = "JFD_USSRStalinCommissariatCityInfo", ["SortOrder"] = 1})

	table.insert(tEventsToHook, Events.SerialEventCityHexHighlightDirty)
	table.insert(tEventsToHook, Events.SpecificCityInfoDirty)
end

if isUSSRActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end

function CityInfoStackDirty(key, instance)
	if key ~= "JFD_USSRStalinCommissariatCityInfo" then return end
	
	Events.SerialEventEnterCityScreen.Remove(EventEnterCityScreen_JFDUSSRStalinCommissariat)
	Events.SerialEventCityHexHighlightDirty.Remove(SerialEventCityDirty_JFDUSSRStalinCommissariat)
	Events.SpecificCityInfoDirty.Remove(SerialEventCityDirty_JFDUSSRStalinCommissariat)
	
	Controls.IconFrame:SetHide(true)
	ProcessCityScreen(instance)
end

if isUSSRActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end

if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingUSSRStalinID = GameInfoTypes["BUILDING_JFD_STALIN_SATELLITES"]

g_JFDUSSRStalinCommissariatTipControls = {}
TTManager:GetTypeControlTable("JFDUSSRStalinCommissariatTooltip", g_JFDUSSRStalinCommissariatTipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
function ProcessCityScreen(instance)

	if not(instance) then
		instance = Controls
	end

	-- Ensure City Selected
	local activePlayer = Players[Game.GetActivePlayer()]
	local city = UI.GetHeadSelectedCity()
	if not(city) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	instance.IconFrame:SetToolTipType("JFDUSSRStalinCommissariatTooltip")
	IconHookup(0, 64, "JFD_USSR_STALIN_ATLAS", instance.IconImage)
	
	local bonus = city:GetNumBuilding(buildingUSSRStalinID)*10
	if bonus == 0 then
		instance.IconFrame:SetHide(true)
		return
	end

	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_USSR_STALIN_SHORT")) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_JFD_USSR_STALIN_CITY_VIEW_HELP", bonus)
	g_JFDUSSRStalinCommissariatTipControls.Heading:SetText(titleText)
	g_JFDUSSRStalinCommissariatTipControls.Body:SetText(helpText)
	g_JFDUSSRStalinCommissariatTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
