-- JFD_PolandPilsudskiCityInfo
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
local civilisationID				= GameInfoTypes["CIVILIZATION_JFD_POLAND_PILSUDSKI"]
local isPolandPilsudskiActivePlayer	= activePlayer:GetCivilizationType() == civilisationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_PolandPilsudskiCityInfo", ["SortOrder"] = 1})
end

if isPolandPilsudskiActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_PolandPilsudskiCityInfo" then return end
	ProcessCityScreen(instance)
end

if isPolandPilsudskiActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end

if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingMilitaryProductionID	= GameInfoTypes["BUILDING_JFD_PILSUDSKI_MILITARY"]

g_JFDPolandPilsudskiTipControls = {}
TTManager:GetTypeControlTable("JFDPolandPilsudskiTooltip", g_JFDPolandPilsudskiTipControls)
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
	
	instance.IconFrame:SetToolTipType("JFDPolandPilsudskiTooltip")
	IconHookup(0, 64, "JFD_POLAND_PILSUDSKI_ATLAS", instance.IconImage)
	
	local bonus = city:GetNumBuilding(buildingMilitaryProductionID)
	if bonus <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_POLAND_PILSUDSKI_SHORT")) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_JFD_POLAND_PILSUDSKI_CITY_VIEW_HELP", bonus)
	g_JFDPolandPilsudskiTipControls.Heading:SetText(titleText)
	g_JFDPolandPilsudskiTipControls.Body:SetText(helpText)
	g_JFDPolandPilsudskiTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
