-- JFD_VegvarCityInfo
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
local activePlayer				= Players[Game.GetActivePlayer()]
local civilisationID			= GameInfoTypes["CIVILIZATION_JFD_HUNGARY"]
local isHungaryActivePlayer		= activePlayer:GetCivilizationType() == civilisationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_VegvarCityInfo", ["SortOrder"] = 1})
end

if isHungaryActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_VegvarCityInfo" then return end
	ProcessCityScreen(instance)
end

if isHungaryActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end

if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingVegvarID		= GameInfoTypes["BUILDING_JFD_VEGVAR"]
local buildingVegvarFaithID = GameInfoTypes["BUILDING_JFD_VEGVAR_FAITH"]

g_JFDVegvarTipControls = {}
TTManager:GetTypeControlTable("JFDVegvarTooltip", g_JFDVegvarTipControls)
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
	
	-- Ensure City has a Vegvar
	if (not city:IsHasBuilding(buildingVegvarID)) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local buildingVegvar = GameInfo.Buildings[buildingVegvarID]
	instance.IconFrame:SetToolTipType("JFDVegvarTooltip")
	IconHookup(buildingVegvar.PortraitIndex, 64, buildingVegvar.IconAtlas, instance.IconImage)
	
	local bonus = city:GetNumBuilding(buildingVegvarFaithID)
	if bonus <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey(buildingVegvar.Description)) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_JFD_VEGVAR_CITY_VIEW_HELP", bonus, 25)
	g_JFDVegvarTipControls.Heading:SetText(titleText)
	g_JFDVegvarTipControls.Body:SetText(helpText)
	g_JFDVegvarTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
