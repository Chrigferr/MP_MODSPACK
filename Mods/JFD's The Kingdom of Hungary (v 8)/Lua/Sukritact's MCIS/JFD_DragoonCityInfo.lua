-- JFD_DragoonCityInfo
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
local civilisationID			= GameInfoTypes["CIVILIZATION_AUSTRIA"]
local isAustriaActivePlayer		= activePlayer:GetCivilizationType() == civilisationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_DragoonCityInfo", ["SortOrder"] = 1})
end

if isAustriaActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_DragoonCityInfo" then return end
	ProcessCityScreen(instance)
end

if isAustriaActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end

if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local activePlayerTeam		= Teams[Game.GetActiveTeam()]
local buildingTourism1ID	= GameInfoTypes["BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM"]
local buildingTourism2ID	= GameInfoTypes["BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM_2"]
local techRadioID			= GameInfoTypes["TECH_RADIO"]
local unitDragoonID			= GameInfoTypes["UNIT_AUSTRIAN_HUSSAR"]

g_JFDDragoonTipControls = {}
TTManager:GetTypeControlTable("JFDDragoonTooltip", g_JFDDragoonTipControls)
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
	
	-- Ensure the player has Radio
	if (not activePlayerTeam:IsHasTech(techRadioID)) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local unitDragoon = GameInfo.Units[unitDragoonID]
	instance.IconFrame:SetToolTipType("JFDDragoonTooltip")
	IconHookup(unitDragoon.PortraitIndex, 64, unitDragoon.IconAtlas, instance.IconImage)
	
	local bonus = (city:GetNumBuilding(buildingTourism1ID) *2)
	if bonus == 0 then bonus = (city:GetNumBuilding(buildingTourism2ID) *4) end
	if bonus <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_PROMOTION_JFD_CEREMONIAL_DRAGOONS")) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_JFD_DRAGOON_CITY_VIEW_HELP", bonus)
	g_JFDDragoonTipControls.Heading:SetText(titleText)
	g_JFDDragoonTipControls.Body:SetText(helpText)
	g_JFDDragoonTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
