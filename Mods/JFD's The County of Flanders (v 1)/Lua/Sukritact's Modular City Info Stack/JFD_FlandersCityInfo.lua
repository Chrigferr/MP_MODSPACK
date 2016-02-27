-- JFD_FlandersCityInfo
-- Author: JFD
-- DateCreated: 11/21/2014 10:10:10 AM
--=======================================================================================================================
-- Includes
--=======================================================================================================================
include("IconSupport")
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_FLANDERS"]
if not (Players[Game.GetActivePlayer()]:GetCivilizationType() == civilisationID) then return end
-------------------------------------------------------------------------------------------------------------------------
-- JFD_GetCityExportList
-------------------------------------------------------------------------------------------------------------------------
function JFD_GetCityExportList(playerID, city)
	local player = Players[playerID]
	local tradeRoutes = player:GetTradeRoutes()
	local exportListText = "[NEWLINE]"
	for i, v in ipairs(tradeRoutes) do
		local originatingCity = v.FromCity
		if originatingCity:GetID() == city:GetID() then
			exportListText = exportListText .. "[ICON_BULLET]+10% [ICON_PRODUCTION] from " .. v.ToCity:GetName() .. "[NEWLINE]"
		end
	end
	
	return exportListText
end
-------------------------------------------------------------------------------------------------------------------------
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_FlandersCityInfo", ["SortOrder"] = 1})
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_FlandersCityInfo" then return end
	ProcessCityScreen(instance)
end
LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingFlandersID = GameInfoTypes["BUILDING_JFD_FLANDERS"]

g_JFDFlandersTipControls = {}
TTManager:GetTypeControlTable("JFDFlandersTooltip", g_JFDFlandersTipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
function ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if not(city) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local buildingFlanders = GameInfo.Buildings[buildingFlandersID]
	instance.IconFrame:SetToolTipType("JFDFlandersTooltip")
	IconHookup(26, 64, "RESOURCE_ATLAS", instance.IconImage)
	
	local bonus = city:GetNumBuilding(buildingFlandersID) * 10
	if bonus <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_FLANDERS_SHORT")) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_JFD_FLANDERS_CITY_VIEW_HELP", JFD_GetCityExportList(city:GetOwner(), city), bonus)
	g_JFDFlandersTipControls.Heading:SetText(titleText)
	g_JFDFlandersTipControls.Body:SetText(helpText)
	g_JFDFlandersTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
