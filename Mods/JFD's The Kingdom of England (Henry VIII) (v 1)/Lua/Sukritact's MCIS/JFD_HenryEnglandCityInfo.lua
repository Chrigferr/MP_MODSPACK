-- JFD_EnglandHenryCityInfo
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
local civilisationID				= GameInfoTypes["CIVILIZATION_JFD_HENRY_ENGLAND"]
local isEnglandHenryActivePlayer	= activePlayer:GetCivilizationType() == civilisationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_EnglandHenryCityInfo", ["SortOrder"] = 1})
end

if isEnglandHenryActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_EnglandHenryCityInfo" then return end
	ProcessCityScreen(instance)
end

if isEnglandHenryActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end

if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingHenryGPGenID = GameInfoTypes["BUILDING_JFD_HENRY_GPGEN"]

g_JFDEnglandHenryTipControls = {}
TTManager:GetTypeControlTable("JFDEnglandHenryTooltip", g_JFDEnglandHenryTipControls)
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
	
	instance.IconFrame:SetToolTipType("JFDEnglandHenryTooltip")
	IconHookup(0, 64, "JFD_ENGLAND_HENRY_ATLAS", instance.IconImage)
	
	local bonus = city:GetNumBuilding(buildingHenryGPGenID)
	if bonus <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_HENRY_ENGLAND_SHORT")) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_JFD_ENGLAND_HENRY_CITY_VIEW_HELP", bonus)
	g_JFDEnglandHenryTipControls.Heading:SetText(titleText)
	g_JFDEnglandHenryTipControls.Body:SetText(helpText)
	g_JFDEnglandHenryTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
