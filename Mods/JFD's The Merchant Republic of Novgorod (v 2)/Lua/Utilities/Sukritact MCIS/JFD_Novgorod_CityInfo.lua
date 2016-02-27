-- JFD_Novgorod_CityInfo
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
-- JFD_GetCityDefenseList
local mathFloor = math.floor
function JFD_GetCityDefenseList(playerID, city)
	local player = Players[playerID]
	local tradeRoutes = player:GetTradeRoutesToYou()
	local cityDefenseList = "[NEWLINE]"
	for _, tradeRoute in ipairs(tradeRoutes) do
		if tradeRoute.ToCity == city then
			local cityDefenseBonus = mathFloor((tradeRoute.FromCity:GetStrengthValue()*33/100)/100)
			cityDefenseList = cityDefenseList .. Locale.ConvertTextKey("[ICON_BULLET]+{1_Num} [ICON_STRENGTH] from " .. tradeRoute.FromCity:GetName() .. "[NEWLINE]", cityDefenseBonus)
		end
	end
	return cityDefenseList
end
-------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
-------------------------------------------------------------------------------------------------------------------------
local activePlayerID			= Game.GetActivePlayer()
local activePlayer				= Players[activePlayerID]
local civilizationID 			= GameInfoTypes["CIVILIZATION_JFD_NOVGOROD"]
local isNovgorodCivActive		= JFD_IsCivilisationActive(civilizationID)
local isNovgorodActivePlayer	= activePlayer:GetCivilizationType() == civilizationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_Novgorod_CityInfo", ["SortOrder"] = 1})
end
if isNovgorodActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_Novgorod_CityInfo" then return end
	ProcessCityScreen(instance)
end
if isNovgorodActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end
if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
g_JFD_Novgorod_TipControls = {}
TTManager:GetTypeControlTable("JFD_Novgorod_Tooltip", g_JFD_Novgorod_TipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
local buildingNovgorodDefenseID = GameInfoTypes["BUILDING_JFD_NOVGOROD_DEFENSE"]
function ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	instance.IconFrame:SetToolTipType("JFD_Novgorod_Tooltip")
	IconHookup(0, 64, "JFD_NOVGOROD_ATLAS", instance.IconImage)
	local cityBonus = city:GetNumBuilding(buildingNovgorodDefenseID)
	if (cityBonus == 0 or (not city:IsHasBuilding(buildingNovgorodDefenseID))) then
		instance.IconFrame:SetHide(true)
		return
	end
	local textDescription = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_NOVGOROD_SHORT")) .. "[ENDCOLOR]"
	local textHelp = Locale.ConvertTextKey("TXT_KEY_JFD_NOVGOROD_CITY_VIEW_HELP", JFD_GetCityDefenseList(activePlayerID, city), cityBonus)
	g_JFD_Novgorod_TipControls.Heading:SetText(textDescription)
	g_JFD_Novgorod_TipControls.Body:SetText(textHelp)
	g_JFD_Novgorod_TipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
