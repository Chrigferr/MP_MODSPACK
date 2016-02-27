-- JFD_Novgorod_Pogost_Pogost_CityInfo
-- Author: JFD
-- DateCreated: 11/21/2014 10:10:10 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("IconSupport")
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
function JFD_IsCivilisationActive(civilizationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end
	return false
end
-------------------------------------------------------------------------------------------------------------------------
-- UTILITIES
-------------------------------------------------------------------------------------------------------------------------
-- JFD_GetCityTRList
local buildingPogostID = GameInfoTypes["BUILDING_JFD_POGOST"]
function JFD_GetCityTRList(playerID)
	local player = Players[playerID]
	local tradeRoutes = player:GetTradeRoutesToYou()
	local productionListText = "[NEWLINE]"
	for _, tradeRoute in ipairs(tradeRoutes) do
		if tradeRoute.ToCity:IsHasBuilding(buildingPogostID) then
			productionListText = productionListText .. "[ICON_BULLET]+2 [ICON_GOLD] from " .. tradeRoute.FromCity:GetName() .. "[NEWLINE]" .. "[ICON_BULLET]+1 [ICON_PRODUCTION] from " .. tradeRoute.FromCity:GetName() .. "[NEWLINE]"
		end
	end
	return productionListText
end
-------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
-------------------------------------------------------------------------------------------------------------------------
local activePlayerID		 = Game.GetActivePlayer()
local activePlayer			 = Players[activePlayerID]
local civilizationID 		 = GameInfoTypes["CIVILIZATION_JFD_NOVGOROD"]
local isNovgorodCivActive	 = JFD_IsCivilisationActive(civilizationID)
local isNovgorodActivePlayer = activePlayer:GetCivilizationType() == civilizationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_Novgorod_Pogost_CityInfo", ["SortOrder"] = 1})
end
if isNovgorodActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_Novgorod_Pogost_CityInfo" then return end
	ProcessCityScreen(instance)
end
if isNovgorodActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end
if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
g_JFD_Novgorod_Pogost_TipControls = {}
TTManager:GetTypeControlTable("JFD_Novgorod_Pogost_Tooltip", g_JFD_Novgorod_Pogost_TipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
local buildingPogostConnectionID = GameInfoTypes["BUILDING_JFD_POGOST_CONNECTION"]
function ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	instance.IconFrame:SetToolTipType("JFD_Novgorod_Pogost_Tooltip")
	IconHookup(3, 64, "JFD_NOVGOROD_ATLAS", instance.IconImage)
	local cityBonus = city:GetNumBuilding(buildingPogostConnectionID)
	if (cityBonus == 0 or (not city:IsHasBuilding(buildingPogostConnectionID))) then
		instance.IconFrame:SetHide(true)
		return
	end
	local textDescription = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_BUILDING_JFD_POGOST")) .. "[ENDCOLOR]"
	local textHelp = Locale.ConvertTextKey("TXT_KEY_JFD_POGOST_CITY_VIEW_HELP", JFD_GetCityTRList(activePlayerID), cityBonus*2, cityBonus)
	g_JFD_Novgorod_Pogost_TipControls.Heading:SetText(textDescription)
	g_JFD_Novgorod_Pogost_TipControls.Body:SetText(textHelp)
	g_JFD_Novgorod_Pogost_TipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
