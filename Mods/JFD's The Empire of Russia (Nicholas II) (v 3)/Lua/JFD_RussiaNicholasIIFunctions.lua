-- JFD_RussiaNicholasIIFunctions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM
--==========================================================================================================================
-- Includes
--==========================================================================================================================
include("RouteConnections")
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- JFD_GetGlobalWeLoveTheKingDayCounter
--------------------------------------------------------------
function JFD_GetGlobalWeLoveTheKingDayCounter(playerID)
	local player = Players[playerID]
	local numCitiesWLTKD = 0
	for city in player:Cities() do
		if city:GetWeLoveTheKingDayCounter() > 0 then
			numCitiesWLTKD = numCitiesWLTKD + 1
		end
	end
	
	return numCitiesWLTKD
end
--------------------------------------------------------------
-- JFD_GetNumberDomesticRoutesToCapital
--------------------------------------------------------------
local buildingGuberniyaID = GameInfoTypes["BUILDING_JFD_GUBERNIYA"]

function JFD_GetNumberDomesticRoutesToCapital(playerID)
	local player = Players[playerID]
	local tradeRoutes = player:GetTradeRoutes()
	local numDomesticRoutes = 0
	for i, v in ipairs(tradeRoutes) do
		local originatingCity = v.FromCity
		local targetCity = v.ToCity
		if targetCity == player:GetCapitalCity() and originatingCity:IsHasBuilding(buildingGuberniyaID) then
			numDomesticRoutes = numDomesticRoutes + 1
		end
	end
	
	return numDomesticRoutes
end
--------------------------------------------------------------
-- JFD_IsCivilisationActive
--------------------------------------------------------------
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
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID			= Game.GetActivePlayer()
local activePlayer				= Players[activePlayerID]
local civilisationID 			= GameInfoTypes["CIVILIZATION_JFD_NICHOLAS_RUSSIA"]
local isNicholasRussiaCivActive = JFD_IsCivilisationActive(civilisationID)
local isNicholasActivePlayer	= activePlayer:GetCivilizationType() == civilisationID
local mathMin 					= math.min

if isNicholasRussiaCivActive then
	print("Emperor Nicholas II is in this game")
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_FaithtoWonderProduction
----------------------------------------------------------------------------------------------------------------------------
local buildingWonderProductionID = GameInfoTypes["BUILDING_JFD_WONDER_PRODUCTION"]

function JFD_FaithtoWonderProduction(playerID)
	local player = Players[playerID];
    if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then 
		local capital = player:GetCapitalCity()
		if capital then
			local faithPerTurn = player:GetTotalFaithPerTurn()
			capital:SetNumRealBuilding(buildingWonderProductionID, mathMin(faithPerTurn, 30))
		end
	end
end

function JFD_FaithtoWonderProductionCityView()
    if (activePlayer:IsAlive() and activePlayer:GetCivilizationType() == civilisationID) then 
		local city = UI.GetHeadSelectedCity()
		local capital = activePlayer:GetCapitalCity()
		if (city:GetID() == capital:GetID()) then
			local faithPerTurn = activePlayer:GetTotalFaithPerTurn()
			capital:SetNumRealBuilding(buildingWonderProductionID, mathMin(faithPerTurn, 30))
		end
	end
end

if isNicholasRussiaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_FaithtoWonderProduction)
	if isNicholasActivePlayer then
		Events.SerialEventEnterCityScreen.Add(JFD_FaithtoWonderProductionCityView)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_FaithFromWLTKD
----------------------------------------------------------------------------------------------------------------------------
local buildingWeLoveTheKingDayFaithID = GameInfoTypes["BUILDING_JFD_WE_LOVE_THE_KING_DAY_FAITH"]

function JFD_FaithFromWLTKD(playerID)
	local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then 
		local capital = player:GetCapitalCity()
		if capital then
			local numCitiesWLTKD = JFD_GetGlobalWeLoveTheKingDayCounter(playerID)
			capital:SetNumRealBuilding(buildingWeLoveTheKingDayFaithID, numCitiesWLTKD)
		end
	end
end

function JFD_FaithFromWLTKDCityView()
    if (activePlayer:IsAlive() and activePlayer:GetCivilizationType() == civilisationID) then 
		local city = UI.GetHeadSelectedCity()
		local capital = activePlayer:GetCapitalCity()
		if (city:GetID() == capital:GetID()) then
			local numCitiesWLTKD = JFD_GetGlobalWeLoveTheKingDayCounter(activePlayerID)
			capital:SetNumRealBuilding(buildingWeLoveTheKingDayFaithID, numCitiesWLTKD)
		end
	end
end

if isNicholasRussiaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_FaithFromWLTKD)
	if isNicholasActivePlayer then
		Events.SerialEventEnterCityScreen.Add(JFD_FaithFromWLTKDCityView)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GuberniyaGrowth
----------------------------------------------------------------------------------------------------------------------------
local buildingGuberniyaGrowthID = GameInfoTypes["BUILDING_JFD_GUBERNIYA_GROWTH"]

function JFD_GuberniyaGrowth(playerID)
	local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then 
		for city in player:Cities() do
			if (city:IsHasBuilding(buildingGuberniyaID) and city:GetID() ~= player:GetCapitalCity():GetID()) then
				if isCityConnected(player, player:GetCapitalCity(), city, 'Railroad', false, false, nil) then
					city:SetNumRealBuilding(buildingGuberniyaGrowthID, 1) 
				else
					if city:IsHasBuilding(buildingGuberniyaGrowthID) then
						city:SetNumRealBuilding(buildingGuberniyaGrowthID, 0) 
					end
				end
			else
				if city:IsHasBuilding(buildingGuberniyaGrowthID) then
					city:SetNumRealBuilding(buildingGuberniyaGrowthID, 0) 
				end
			end
		end
	end
end

if isNicholasRussiaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_GuberniyaGrowth)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GuberniyaProduction
----------------------------------------------------------------------------------------------------------------------------
local buildingGuberniyaProductionID = GameInfoTypes["BUILDING_JFD_GUBERNIYA_PRODUCTION"]

function JFD_GuberniyaProduction(playerID)
	local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then 
		if player:GetCapitalCity() then
			local numDomesticRoutes = JFD_GetNumberDomesticRoutesToCapital(playerID)
			player:GetCapitalCity():SetNumRealBuilding(buildingGuberniyaProductionID, numDomesticRoutes) 
		end
	end
end

if isNicholasRussiaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_GuberniyaProduction)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_DoubleOpolcheniye
----------------------------------------------------------------------------------------------------------------------------
local unitOpolcheniyeID 			= GameInfoTypes["UNIT_JFD_OPOLCHENIYE"]
local unitPromotionFriendlyLandsID 	= GameInfoTypes["PROMOTION_JFD_FRIENDLY_LANDS"]

function JFD_DoubleOpolcheniye(playerID, cityID, unitID)
    local player = Players[playerID];
    local unit = player:GetUnitByID(unitID)
	if unit:GetUnitType() == unitOpolcheniyeID then
		local newUnit = player:InitUnit(unitOpolcheniyeID, unit:GetX(), unit:GetY())
	    unit:SetHasPromotion(unitPromotionFriendlyLandsID, true)
		newUnit:SetHasPromotion(unitPromotionFriendlyLandsID, true)
	end
end
GameEvents.CityTrained.Add(JFD_DoubleOpolcheniye)

function JFD_DoubleOpolcheniyeOnUpgrade(playerID, unitID, newUnitID)
    local player = Players[playerID];
    if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then 
       	local unit = player:GetUnitByID(newUnitID)
		if unit:GetUnitType() == unitOpolcheniyeID then
			local newUnit = player:InitUnit(unitOpolcheniyeID, unit:GetX(), unit:GetY())
		    unit:SetHasPromotion(unitPromotionFriendlyLandsID, true)
			newUnit:SetHasPromotion(unitPromotionFriendlyLandsID, true)
         end
    end
end

if isNicholasRussiaCivActive then
	GameEvents.UnitUpgraded.Add(JFD_DoubleOpolcheniyeOnUpgrade)
end
--==========================================================================================================================
--==========================================================================================================================