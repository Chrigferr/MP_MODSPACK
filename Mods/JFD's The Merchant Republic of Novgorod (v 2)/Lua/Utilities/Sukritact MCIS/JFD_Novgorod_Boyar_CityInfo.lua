-- JFD_Novgorod_Boyar_CityInfo
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
-- GLOBALS
-------------------------------------------------------------------------------------------------------------------------
local activePlayerID		 = Game.GetActivePlayer()
local activePlayer			 = Players[activePlayerID]
local civilizationID 		 = GameInfoTypes["CIVILIZATION_JFD_NOVGOROD"]
local isNovgorodCivActive	 = JFD_IsCivilisationActive(civilizationID)
local isNovgorodActivePlayer = activePlayer:GetCivilizationType() == civilizationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_Novgorod_Boyar_CityInfo", ["SortOrder"] = 1})
end
if isNovgorodActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_Novgorod_Boyar_CityInfo" then return end
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
g_JFD_Novgorod_Boyar_TipControls = {}
TTManager:GetTypeControlTable("JFD_Novgorod_Boyar_ToolTip", g_JFD_Novgorod_Boyar_TipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
local buildingBoyarPeaceID	= GameInfoTypes["BUILDING_JFD_BOYAR_PEACE"]
local buildingBoyarWarID	= GameInfoTypes["BUILDING_JFD_BOYAR_WAR"]
function ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	instance.IconFrame:SetToolTipType("JFD_Novgorod_Boyar_ToolTip")
	IconHookup(2, 64, "JFD_NOVGOROD_ATLAS", instance.IconImage)
	local cityBonusPeace = city:GetNumBuilding(buildingBoyarPeaceID)
	local cityBonusWar = city:GetNumBuilding(buildingBoyarWarID)
	if (cityBonusPeace <= 0 and cityBonusWar <= 0) then
		instance.IconFrame:SetHide(true)
		return
	end
	local textDescription = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_PROMOTION_JFD_BOYAR")) .. "[ENDCOLOR]"
	local textHelp = Locale.ConvertTextKey("TXT_KEY_JFD_BOYAR_PEACE_CITY_VIEW_HELP")
	if cityBonusWar > 0 then textHelp = Locale.ConvertTextKey("TXT_KEY_JFD_BOYAR_WAR_CITY_VIEW_HELP") end
	g_JFD_Novgorod_Boyar_TipControls.Heading:SetText(textDescription)
	g_JFD_Novgorod_Boyar_TipControls.Body:SetText(textHelp)
	g_JFD_Novgorod_Boyar_TipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
