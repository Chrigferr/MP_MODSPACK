-- JFD_FlandersFunctions
-- Author: JFD
-- DateCreated: 3/12/2014 9:35:16 PM
--=======================================================================================================================
-- Includes
--=======================================================================================================================
include("FLuaVector.lua")
include("IconSupport")
include("NewSaveUtils.lua"); MY_MOD_NAME = "Flanders";
include("PlotIterators")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_CityHasImprovedResource
------------------------------------------------------------------------------------------------------------------------
function JFD_CityHasImprovedResource(playerID, city, resourceID, improvementID)
	for cityPlot = 0, city:GetNumCityPlots() - 1, 1 do
		local plot = city:GetCityIndexPlot(cityPlot)
		if (plot and plot:GetOwner() == playerID) then
			if (plot:GetResourceType() == resourceID and plot:GetImprovementType() == improvementID) then
				return true
			end
		end
	end
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_GetNumTradeRoutesLeavingThisCity
------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumTradeRoutesLeavingThisCity(playerID, city)
	local player = Players[playerID]
	local tradeRoutes = player:GetTradeRoutes()
	local numTradeRoutes = 0
	for i, v in ipairs(tradeRoutes) do
		local originatingCity = v.FromCity
		if originatingCity:GetID() == city:GetID() then
			numTradeRoutes = numTradeRoutes + 1
		end
	end
	
	return numTradeRoutes
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
------------------------------------------------------------------------------------------------------------------------
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end

--------------------------------------------------------------
-- Sukritact_PlaceResource
--------------------------------------------------------------
function Sukritact_PlaceResource(startingPlot, resourceID)
    local plots = {}
    for loopPlot in PlotAreaSweepIterator(startingPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
        table.insert(plots, loopPlot)
    end
	
    for iVal = 1, 1 do
		local isPlaced = false
		while (not isPlaced) and #plots > 0 do
			local randomNumber = JFD_GetRandom(1, #plots)
			local plot = plots[randomNumber]
			if (plot:IsHills()) then
				plot:SetResourceType(resourceID, 1)
				plot:SetFeatureType(-1)
				isPlaced = true
			end
			
			table.remove(plots, randomNumber)
		end
	end
end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local activePlayerID 			= Game.GetActivePlayer()
local activePlayer 				= Players[activePlayerID]
local activePlayerTeam 			= Teams[Game.GetActiveTeam()]
local civilisationID 			= GameInfoTypes["CIVILIZATION_JFD_FLANDERS"]
local isFlandersCivActive 		= JFD_IsCivilisationActive(civilisationID)
local isFlandersActivePlayer 	= activePlayer:GetCivilizationType() == civilisationID
local mathMin 					= math.min

if isFlandersCivActive then
	print("Count Robrecht III is in the game")
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_InitFlanders
----------------------------------------------------------------------------------------------------------------------------		
local resourceSheepID = GameInfoTypes["RESOURCE_SHEEP"]

function JFD_InitFlanders()
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if (player:IsEverAlive() and player:GetCivilizationType() == civilisationID) then
			if (not GetPersistentProperty("JFD_InitFlanders") == true) then
				Sukritact_PlaceResource(player:GetStartingPlot(), resourceSheepID)
				SetPersistentProperty("JFD_InitFlanders", true)
			end
		end
	end
end

if isFlandersCivActive then
	Events.LoadScreenClose.Add(JFD_InitFlanders)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_WoolExports
----------------------------------------------------------------------------------------------------------------------------
local buildingFlandersID 	= GameInfoTypes["BUILDING_JFD_FLANDERS"]
local improvementPastureID 	= GameInfoTypes["IMPROVEMENT_PASTURE"]
		
function JFD_WoolExports(playerID)
	local player = Players[playerID]
	if (player:IsEverAlive() and player:GetCivilizationType() == civilisationID) then
		for city in player:Cities() do
			if JFD_CityHasImprovedResource(playerID, city, resourceSheepID, improvementPastureID) then
				local numWoolExports = mathMin(JFD_GetNumTradeRoutesLeavingThisCity(playerID, city), 3)
				city:SetNumRealBuilding(buildingFlandersID, numWoolExports)
			else
				if city:IsHasBuilding(buildingFlandersID) then
					city:SetNumRealBuilding(buildingFlandersID, 0)
				end
			end
		end
	end
end

function JFD_WoolExportsCityView()
	local city = UI.GetHeadSelectedCity()
	if city then
		local playerID = city:GetOwner()
		local player = Players[playerID]
		if JFD_CityHasImprovedResource(playerID, city, resourceSheepID, improvementPastureID) then
			local numWoolExports = mathMin(JFD_GetNumTradeRoutesLeavingThisCity(activePlayerID, city), 3)
			city:SetNumRealBuilding(buildingFlandersID, numWoolExports)
		else
			if city:IsHasBuilding(buildingFlandersID) then
				city:SetNumRealBuilding(buildingFlandersID, 0)
			end
		end
	end
end

if isFlandersCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_WoolExports)
	if isFlandersActivePlayer then
		Events.SerialEventEnterCityScreen.Add(JFD_WoolExportsCityView)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_AIMilitia
----------------------------------------------------------------------------------------------------------------------------	
local unitMilitiaID	= GameInfoTypes["UNIT_JFD_GOEDENDAG"]

function JFD_AIMilitia(teamID, otherTeamID)
	local player = Players[Teams[teamID]:GetLeaderID()]
	local otherPlayer = Players[Teams[otherTeamID]:GetLeaderID()]
	if (otherPlayer:GetCivilizationType() == civilisationID and not (player:IsMinorCiv())) then
		for city in otherPlayer:Cities() do
			if city:CanTrain(unitMilitiaID) then
				otherPlayer:InitUnit(unitMilitiaID, city:GetX(), city:GetY())
			end
		end
	end
end

if (isFlandersCivActive and (not isFlandersActivePlayer)) then
	GameEvents.DeclareWar.Add(JFD_AIMilitia)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_BelfortConstructed
----------------------------------------------------------------------------------------------------------------------------
local buildingBelfort1ID			= GameInfoTypes["BUILDING_JFD_BELFORT"]
local buildingBelfort2ID			= GameInfoTypes["BUILDING_JFD_BELFORT_2"]
local buildingBelfort3ID			= GameInfoTypes["BUILDING_JFD_BELFORT_3"]
local buildingClassMarketID 		= GameInfoTypes["BUILDINGCLASS_MARKET"]
local buildingClassTempleID 		= GameInfoTypes["BUILDINGCLASS_TEMPLE"]
local buildingClassUniversityID		= GameInfoTypes["BUILDINGCLASS_UNIVERSITY"]
local yieldGoldID 					= GameInfoTypes["YIELD_GOLD"]

function JFD_BelfortConstructed(playerID, cityID, buildingID)
	local player = Players[playerID]
	if (player:IsEverAlive() and player:GetCivilizationType() == civilisationID) then
		if buildingID == buildingBelfort1ID then
			local city = player:GetCityByID(cityID)
			local cultureBoost = city:GetBaseYieldRate(yieldGoldID)*3
			player:ChangeJONSCulture(cultureBoost)
			city:SetBuildingYieldChange(buildingClassMarketID, yieldGoldID, 1)
			if player:IsHuman() then 
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_BUILDING_JFD_BELFORT_COMPLETE_MESSAGE", cultureBoost, city:GetName())) 
			end
		elseif buildingID == buildingBelfort2ID then
			local city = player:GetCityByID(cityID)
			local cultureBoost = city:GetBaseYieldRate(yieldGoldID)*3
			player:ChangeJONSCulture(cultureBoost)
			city:SetBuildingYieldChange(buildingClassTempleID, yieldGoldID, 1)
			if player:IsHuman() then 
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_BUILDING_JFD_BELFORT_COMPLETE_MESSAGE", cultureBoost, city:GetName())) 
			end
		elseif buildingID == buildingBelfort3ID then
			local city = player:GetCityByID(cityID)
			local cultureBoost = city:GetBaseYieldRate(yieldGoldID)*3
			player:ChangeJONSCulture(cultureBoost)
			city:SetBuildingYieldChange(buildingClassUniversityID, yieldGoldID, 1)
			if player:IsHuman() then 
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_BUILDING_JFD_BELFORT_COMPLETE_MESSAGE", cultureBoost, city:GetName())) 
			end
		end
	end
end

if isFlandersCivActive then
	GameEvents.CityConstructed.Add(JFD_BelfortConstructed)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_BlockBelfries
--------------------------------------------------------------------------------------------------------------------------
local techGuildsID = GameInfoTypes["TECH_GUILDS"] 

function JFD_BlockBelfries(playerID, cityID, buildingID)
	local player = Players[playerID]
	if (buildingID == buildingBelfort2ID or buildingID == buildingBelfort2ID) then
		if (not activePlayerTeam:IsHasTech(techGuildsID)) then return false end
	end
	
	return true
end
GameEvents.CityCanConstruct.Add(JFD_BlockBelfries)
--==========================================================================================================================
-- UI FUNCTIONS
--==========================================================================================================================
--Globals
----------------------------------------------------------------------------------------------------------------------------
local isCityViewOpen = false
----------------------------------------------------------------------------------------------------------------------------
-- JFD_UpdateMilitiaRecruitment
----------------------------------------------------------------------------------------------------------------------------
local unitPromotionMilitiaID	= GameInfoTypes["PROMOTION_JFD_FLANDERS_MILITIA"]

function JFD_UpdateMilitiaRecruitment()
	Controls.UnitBackground:SetHide(true)
	Controls.UnitImage:SetHide(true)
	Controls.UnitButton:SetDisabled(true)
	Controls.UnitButton:LocalizeAndSetToolTip(nil)
	local militia = GameInfo.Units[unitMilitiaID]
	if (not activePlayerTeam:IsHasTech(GameInfoTypes[militia.PrereqTech]))	then return end
	if activePlayerTeam:IsHasTech(GameInfoTypes[militia.ObsoleteTech])		then return end
	local city = UI.GetHeadSelectedCity()
	if (city and (not city:IsOccupied()) and (not city:IsPuppet())) then
		local isDisabled = true
		local garrisonedUnit = city:GetGarrisonedUnit()
		local buttonText = "TXT_KEY_JFD_RECRUIT_GOEDENDAG"
		local buttonToolTip = "TXT_KEY_JFD_RECRUIT_GOEDENDAG_TT"
		if (garrisonedUnit and garrisonedUnit:GetUnitType() == unitMilitiaID) then
			if garrisonedUnit:IsHasPromotion(unitPromotionMilitiaID) then
				isDisabled = false
				buttonText = "TXT_KEY_JFD_RETURN_GOEDENDAG"
				buttonToolTip = "TXT_KEY_JFD_RETURN_GOEDENDAG_TT"
			end
		else
			if (city:CanTrain(militia.ID) and city:GetPopulation() > 1) then
				isDisabled = false
			end
		end
		
		if isDisabled then
			buttonToolTip = "TXT_KEY_JFD_RECRUIT_GOEDENDAG_TT_DISABLED"
		end

		IconHookup(militia.PortraitIndex, 64, militia.IconAtlas, Controls.UnitImage)
		Controls.UnitBackground:SetHide(false)
		Controls.UnitImage:SetHide(false)
		Controls.UnitButton:LocalizeAndSetText(buttonText)
		Controls.UnitButton:LocalizeAndSetToolTip(buttonToolTipDisabled)
		Controls.UnitButton:SetDisabled(isDisabled)
		Controls.UnitButton:LocalizeAndSetToolTip(buttonToolTip)		
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_OnHireMilitia
----------------------------------------------------------------------------------------------------------------------------
function JFD_OnHireMilitia()
	local city = UI.GetHeadSelectedCity();
	if city then
		local cityX = city:GetX()
		local cityY = city:GetY()
		local garrisonedUnit = city:GetGarrisonedUnit()
		local militia = GameInfo.Units[unitMilitiaID]
		if (garrisonedUnit and garrisonedUnit:GetUnitType() == unitMilitiaID) then
			garrisonedUnit:Kill(false, -1)
			city:ChangePopulation(1)
			local hex = ToHexFromGrid(Vector2(cityX, cityY))
			Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(adjUnitX, adjUnitY))), Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_CITIZEN]", 1))
			Events.GameplayFX(hex.x, hex.y, -1)
		else
			activePlayer:InitUnit(unitMilitiaID, cityX, cityY):SetHasPromotion(unitPromotionMilitiaID, true)
			city:ChangePopulation(-1)
		end
	end
	JFD_UpdateMilitiaRecruitment()
end
Controls.UnitButton:RegisterCallback(Mouse.eLClick, JFD_OnHireMilitia)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_OnEnterCityScreen
----------------------------------------------------------------------------------------------------------------------------
function JFD_OnEnterCityScreen()
	isCityViewOpen = true
	JFD_UpdateMilitiaRecruitment()
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_OnExitCityScreen
----------------------------------------------------------------------------------------------------------------------------
function JFD_OnExitCityScreen()
	isCityViewOpen = false
	JFD_UpdateMilitiaRecruitment()
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_OnNextCityScren
----------------------------------------------------------------------------------------------------------------------------
function JFD_OnNextCityScren()
	if isCityViewOpen then
		JFD_UpdateMilitiaRecruitment()
	end
end

if (isFlandersCivActive and isFlandersActivePlayer) then
	Events.SerialEventEnterCityScreen.Add(JFD_OnEnterCityScreen)
	Events.SerialEventExitCityScreen.Add(JFD_OnExitCityScreen)
	Events.SerialEventCityScreenDirty.Add(JFD_OnNextCityScren)
end
--==========================================================================================================================
--==========================================================================================================================