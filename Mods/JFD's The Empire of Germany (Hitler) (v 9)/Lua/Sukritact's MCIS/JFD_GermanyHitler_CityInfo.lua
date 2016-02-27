-- JFD_GermanyHitlerCityInfo
-- Author: JFD
-- DateCreated: 11/21/2014 10:10:10 AM
--=======================================================================================================================
-- Includes
--=======================================================================================================================
include("IconSupport")
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
-- JFD_GetDenunciationWarList
-------------------------------------------------------------------------------------------------------------------------
function JFD_GetDenunciationWarList(playerID)
	local player = Players[playerID]
	local denunciationWarList = "[NEWLINE]"
	for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local otherPlayer = Players[otherPlayerID]
		if (otherPlayer:IsAlive() and otherPlayerID ~= playerID) then
			if Teams[player:GetTeam()]:IsHasMet(otherPlayer:GetTeam()) then
				if (player:IsDenouncedPlayer(otherPlayerID) or otherPlayer:IsDenouncedPlayer(playerID) or otherPlayer:IsDenouncingPlayer(playerID) or Teams[otherPlayer:GetTeam()]:IsAtWar(player:GetTeam())) then
					denunciationWarList = denunciationWarList .. "[ICON_BULLET]+10% [ICON_GREAT_GENERAL] from " .. otherPlayer:GetName() .. "[NEWLINE]"
				end
			end
		end
	end
	
	return denunciationWarList
end
-------------------------------------------------------------------------------------------------------------------------
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
local activePlayer					= Players[Game.GetActivePlayer()]
local civilisationID				= GameInfoTypes["CIVILIZATION_JFD_NAZI_GERMANY"]
local isGermanyHitlerActivePlayer	= activePlayer:GetCivilizationType() == civilisationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_GermanyHitlerCityInfo", ["SortOrder"] = 1})
end

if isGermanyHitlerActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_GermanyHitlerCityInfo" then return end
	ProcessCityScreen(instance)
end

if isGermanyHitlerActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end

if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingNaziGermanyID = GameInfoTypes["BUILDING_JFD_NAZI_GERMANY"]

g_JFDGermanyHitlerTipControls = {}
TTManager:GetTypeControlTable("JFDGermanyHitlerTooltip", g_JFDGermanyHitlerTipControls)
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
	
	instance.IconFrame:SetToolTipType("JFDGermanyHitlerTooltip")
	IconHookup(0, 64, "JFD_NAZI_GERMANY_ATLAS", instance.IconImage)
	
	local bonus = city:GetNumBuilding(buildingNaziGermanyID)*10
	if bonus <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_NAZI_GERMANY_SHORT")) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_JFD_NAZI_GERMANY_CITY_VIEW_HELP", JFD_GetDenunciationWarList(Game.GetActivePlayer()), bonus)
	g_JFDGermanyHitlerTipControls.Heading:SetText(titleText)
	g_JFDGermanyHitlerTipControls.Body:SetText(helpText)
	g_JFDGermanyHitlerTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
