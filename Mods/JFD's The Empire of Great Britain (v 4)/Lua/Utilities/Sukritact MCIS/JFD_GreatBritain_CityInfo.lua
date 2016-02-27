-- JFD_GreatBritain_CityInfo
-- Author: JFD
-- DateCreated: 11/21/2014 10:10:10 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("IconSupport")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILS
-------------------------------------------------------------------------------------------------------------------------
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

-- JFD_GetScienceCityList
local mathFloor	= math.floor
local yieldProductionID = GameInfoTypes["YIELD_PRODUCTION"]
function JFD_GetScienceCityList(playerID)
	local player = Players[playerID]
	local scienceListText = "[NEWLINE]"
	for city in player:Cities() do
		local baseProduction = mathFloor(city:GetBaseYieldRate(yieldProductionID)*10/100)
		if baseProduction > 0 then
			scienceListText = scienceListText .. Locale.ConvertTextKey("[ICON_BULLET]+{1_Num}% [ICON_RESEARCH] from " .. city:GetName() .. "'s [ICON_PRODUCTION][NEWLINE]", baseProduction)
		end
	end
	return scienceListText
end
-------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
-------------------------------------------------------------------------------------------------------------------------
local activePlayerID  = Game.GetActivePlayer()
local activePlayer	  = Players[activePlayerID]
local civilizationID  = GameInfoTypes["CIVILIZATION_JFD_GREAT_BRITAIN"]
local isGreatBritainCivActive = JFD_IsCivilisationActive(civilizationID)
local isGreatBritainActivePlayer = activePlayer:GetCivilizationType() == civilizationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_GreatBritain_CityInfo", ["SortOrder"] = 1})
end
if isGreatBritainActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_GreatBritain_CityInfo" then return end
	ProcessCityScreen(instance)
end
if isGreatBritainActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end
if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
g_JFD_GreatBritain_TipControls = {}
TTManager:GetTypeControlTable("JFD_GreatBritain_Tooltip", g_JFD_GreatBritain_TipControls)

-- ProcessCityScreen
local buildingGreatBritainID = GameInfoTypes["BUILDING_JFD_GREAT_BRITAIN"]
function ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	instance.IconFrame:SetToolTipType("JFD_GreatBritain_Tooltip")
	IconHookup(6, 64, "CIV_COLOR_ATLAS", instance.IconImage)
	if (not city:IsHasBuilding(buildingGreatBritainID)) then
		instance.IconFrame:SetHide(true)
		return
	end
	local scienceBonus = city:GetNumBuilding(buildingGreatBritainID)
	local textDescription = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_GREAT_BRITAIN_SHORT")) .. "[ENDCOLOR]"
	local textHelp = Locale.ConvertTextKey("TXT_KEY_JFD_GREAT_BRITAIN_CITY_VIEW_HELP", JFD_GetScienceCityList(Game.GetActivePlayer()), scienceBonus)
	g_JFD_GreatBritain_TipControls.Heading:SetText(textDescription)
	g_JFD_GreatBritain_TipControls.Body:SetText(textHelp)
	g_JFD_GreatBritain_TipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
