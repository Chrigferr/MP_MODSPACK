-- JFD_UnitedKingdom_CityInfo
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
local civilisationID				= GameInfoTypes["CIVILIZATION_JFD_UNITED_KINGDOM"]
local isUnitedKingdomActivePlayer	= activePlayer:GetCivilizationType() == civilisationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_UnitedKingdomCityInfo", ["SortOrder"] = 1})
end

if isUnitedKingdomActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_UnitedKingdomCityInfo" then return end
	ProcessCityScreen(instance)
end

if isUnitedKingdomActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end

if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingUKID = GameInfoTypes["BUILDING_JFD_NAVAL_AND_AIR_PRODUCTION"]

g_JFDUnitedKingdomTipControls = {}
TTManager:GetTypeControlTable("JFDUnitedKingdomTooltip", g_JFDUnitedKingdomTipControls)
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
	
	instance.IconFrame:SetToolTipType("JFDUnitedKingdomTooltip")
	IconHookup(0, 64, "JFD_UNITED_KINGDOM_ATLAS", instance.IconImage)
	
	local bonus = city:GetNumBuilding(buildingUKID)*5
	if bonus <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_UNITED_KINGDOM_SHORT")) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_JFD_UK_CITY_VIEW_HELP", bonus)
	g_JFDUnitedKingdomTipControls.Heading:SetText(titleText)
	g_JFDUnitedKingdomTipControls.Body:SetText(helpText)
	g_JFDUnitedKingdomTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
