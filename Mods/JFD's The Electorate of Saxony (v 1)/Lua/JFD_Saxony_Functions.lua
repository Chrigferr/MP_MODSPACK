-- JFD_Saxony_Functions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
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
--------------------------------------------------------------------------------------------------------------------------
-- UTILS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CountNumNationalWonders
function JFD_CountNumNationalWonders(city)
	local numNationalWonders = 0
	for buildingClass in GameInfo.BuildingClasses("MaxPlayerInstances == 1") do
		if city:IsHasBuilding(GameInfoTypes[buildingClass.DefaultBuilding]) then
			numNationalWonders = numNationalWonders + 1
		end
	end
	return numNationalWonders
end
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID		= Game.GetActivePlayer()
local activePlayer			= Players[activePlayerID]
local civilizationID 		= GameInfoTypes["CIVILIZATION_JFD_SAXONY"]
local isSaxonyCivActive		= JFD_IsCivilisationActive(civilizationID)
local mathCeil 				= math.ceil
local mathFloor 			= math.floor
if isSaxonyCivActive then
	print("Elector Frederick Augustus I is in this game")
end
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- THE JEWELLED ELECTORATE
----------------------------------------------------------------------------------------------------------------------------
-- JFD_Saxony_TourismIntoProduction
function JFD_Saxony_TourismIntoProduction(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
		for city in player:Cities() do
			local cityBuildingProductionID = city:GetProductionBuilding()
			if cityBuildingProductionID > -1 then
				local building = GameInfo.Buildings[cityBuildingProductionID]
				local buildingClass = GameInfo.BuildingClasses[building.BuildingClass]
				if (buildingClass.MaxGlobalInstances == 1 or buildingClass.MaxPlayerInstances == 1) then
					local tourism = (city:GetBaseTourism()/2)
					city:ChangeProduction(tourism)
				end
			end
		end
	end
end
if isSaxonyCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_Saxony_TourismIntoProduction)
end

-- JFD_Saxony_FreeGreatArtist
local unitArtistID = GameInfoTypes["UNIT_ARTIST"]
function JFD_Saxony_FreeGreatArtist(playerID, cityID, buildingID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
		local building = GameInfo.Buildings[buildingID]
		local buildingClass = GameInfo.BuildingClasses[building.BuildingClass]
		if buildingClass.MaxPlayerInstances == 1 then
			local city = player:GetCityByID(cityID)
			player:InitUnit(unitArtistID, city:GetX(), city:GetY())
		end
	end
end
if isSaxonyCivActive then
	GameEvents.CityConstructed.Add(JFD_Saxony_FreeGreatArtist)
end
----------------------------------------------------------------------------------------------------------------------------
-- CARABINIER GUARD
----------------------------------------------------------------------------------------------------------------------------
-- JFD_Saxony_CarabinierGuard
local promotionCarabinierGuardID = GameInfoTypes["PROMOTION_JFD_CARABINIER_GUARD"]
function JFD_Saxony_CarabinierGuard(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and (not player:IsBarbarian()) and (not player:IsMinorCiv())) then 
		for unit in player:Units() do
			if unit:IsHasPromotion(promotionCarabinierGuardID) then
				local unitCombatStrength = GameInfo.Units[unit:GetUnitType()].Combat
				local city = unit:GetPlot():GetPlotCity()
				if city then
					local nationalWonderCount = JFD_CountNumNationalWonders(city)
					unit:SetBaseCombatStrength(unitCombatStrength+nationalWonderCount)
				else
					unit:SetBaseCombatStrength(unitCombatStrength)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_Saxony_CarabinierGuard)
----------------------------------------------------------------------------------------------------------------------------
-- KUNSTHAUS
----------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
--==========================================================================================================================