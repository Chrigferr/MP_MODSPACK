-- JFD_GuberniyaCityInfo
-- Author: JFD
-- DateCreated: 11/21/2014 10:10:10 AM
--=======================================================================================================================
-- Includes
--=======================================================================================================================
include("IconSupport")
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
-- JFD_GetCityProductionList
-------------------------------------------------------------------------------------------------------------------------
function JFD_GetCityProductionList(playerID, buildingGuberniyaID)
	local player = Players[playerID]
	local tradeRoutes = player:GetTradeRoutes()
	local productionListText = "[NEWLINE]"
	for i, v in ipairs(tradeRoutes) do
		local originatingCity = v.FromCity
		local targetCity = v.ToCity
		if (targetCity:GetID() == player:GetCapitalCity():GetID() and originatingCity:IsHasBuilding(buildingGuberniyaID)) then
			productionListText = productionListText .. "[ICON_BULLET]+5% [ICON_PRODUCTION] from " .. originatingCity:GetName() .. "[NEWLINE]"
		end
	end
	
	return productionListText
end
-------------------------------------------------------------------------------------------------------------------------
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
local activePlayer					= Players[Game.GetActivePlayer()]
local civilisationID				= GameInfoTypes["CIVILIZATION_JFD_NICHOLAS_RUSSIA"]
local isRussiaNicholasActivePlayer	= activePlayer:GetCivilizationType() == civilisationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_GuberniyaCityInfo", ["SortOrder"] = 1})
end

if isRussiaNicholasActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_GuberniyaCityInfo" then return end
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
local buildingGuberniyaID			= GameInfoTypes["BUILDING_JFD_GUBERNIYA"]
local buildingGuberniyaGrowthID		= GameInfoTypes["BUILDING_JFD_GUBERNIYA_GROWTH"]
local buildingGuberniyaProductionID = GameInfoTypes["BUILDING_JFD_GUBERNIYA_PRODUCTION"]

g_JFDGuberniyaTipControls = {}
TTManager:GetTypeControlTable("JFDGuberniyaTooltip", g_JFDGuberniyaTipControls)
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
	
	-- Ensure City has a Guberniya's Office
	if (not city:IsHasBuilding(buildingGuberniyaID)) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local buildingGuberniya = GameInfo.Buildings[buildingGuberniyaID]
	instance.IconFrame:SetToolTipType("JFDGuberniyaTooltip")
	IconHookup(buildingGuberniya.PortraitIndex, 64, buildingGuberniya.IconAtlas, instance.IconImage)
	
	local bonus = (city:GetNumBuilding(buildingGuberniyaProductionID) * 5)
	local helpText = Locale.ConvertTextKey("TXT_KEY_JFD_GUBERNIYAS_OFFICE_PRODUCTION_CITY_VIEW_HELP", JFD_GetCityProductionList(Game.GetActivePlayer(), buildingGuberniyaID), bonus)
	if city:GetID() ~= Players[Game.GetActivePlayer()]:GetCapitalCity():GetID() then
		bonus = city:GetNumBuilding(buildingGuberniyaGrowthID)
		helpText = Locale.ConvertTextKey("TXT_KEY_JFD_GUBERNIYAS_OFFICE_GROWTH_CITY_VIEW_HELP", bonus)
	end

	if bonus <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey(buildingGuberniya.Description)) .. "[ENDCOLOR]"
	g_JFDGuberniyaTipControls.Heading:SetText(titleText)
	g_JFDGuberniyaTipControls.Body:SetText(helpText)
	g_JFDGuberniyaTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
