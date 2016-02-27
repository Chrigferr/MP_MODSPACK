-- JFD_PapalStates_SwissGuard_CityInfo
-- Author: JFD
-- DateCreated: 11/21/2014 10:10:10 AM
--=======================================================================================================================
-- Includes
--=======================================================================================================================
include("IconSupport")
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_PAPAL_STATES"]
if not (Players[Game.GetActivePlayer()]:GetCivilizationType() == civilisationID) then return end
-------------------------------------------------------------------------------------------------------------------------
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_SwissGuardCityInfo", ["SortOrder"] = 1})
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_SwissGuardCityInfo" then return end
	ProcessCityScreen(instance)
end
LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingSwissGuardID	= GameInfoTypes["BUILDING_JFD_SWISS_GUARD_TOURISM"]
local techRadioID			= GameInfoTypes["TECH_RADIO"]
local unitSwissGuardID		= GameInfoTypes["UNIT_JFD_SWISS_GUARD"]

g_JFDSwissGuardTipControls = {}
TTManager:GetTypeControlTable("JFDSwissGuardTooltip", g_JFDSwissGuardTipControls)
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
	
	local player = Players[Game.GetActivePlayer()]
	if (not Teams[player:GetTeam()]:IsHasTech(techRadioID)) then
		instance.IconFrame:SetHide(true)
		return
	end

	local unitSwissGuard = GameInfo.Units[unitSwissGuardID]
	instance.IconFrame:SetToolTipType("JFDSwissGuardTooltip")
	IconHookup(unitSwissGuard.PortraitIndex, 64, unitSwissGuard.IconAtlas, instance.IconImage)
	
	local bonus = city:GetNumBuilding(buildingSwissGuardID)
	if bonus <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey(unitSwissGuard.Description)) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_JFD_SWISS_GUARD_CITY_VIEW_HELP", bonus)
	g_JFDSwissGuardTipControls.Heading:SetText(titleText)
	g_JFDSwissGuardTipControls.Body:SetText(helpText)
	g_JFDSwissGuardTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
