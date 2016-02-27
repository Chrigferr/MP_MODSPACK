-- JFD_FranceDeGaulleFunctions
-- Author: JFD
-- DateCreated: 12/23/2014 3:46:49 AM
--==========================================================================================================================
-- Includes
--==========================================================================================================================
include("PlotIterators");
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
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
local civilisationID			= GameInfoTypes["CIVILIZATION_JFD_FRANCE_DEGAULLE"]
local isFranceDeGaulleCivActive = JFD_IsCivilisationActive(civilisationID)
local mathMin					= math.min

if isFranceDeGaulleCivActive then
	print("General de Gaulle is in this game")
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_BlockFrenchGGs
----------------------------------------------------------------------------------------------------------------------------
local techPlasticsID				= GameInfoTypes["TECH_PLASTIC"]
local unitForeignLegionUpgradedID	= GameInfoTypes["UNIT_JFD_FOREIGN_LEGION_L"]
local unitFrenchGreatGeneralID		= GameInfoTypes["UNIT_JFD_GREAT_GENERAL_DEGAULLE"]

function JFD_BlockFrenchGGs(playerID, unitID)
	if unitID == unitFrenchGreatGeneralID then
		return
	end
	
	local player = Players[playerID]
	if unitID == unitForeignLegionUpgradedID then
		if (player:GetCivilizationType() == civilisationID and Teams[player:GetTeam()]:IsHasTech(techPlasticsID)) then
			return true
		else
			return
		end	
	end

	return true
end
GameEvents.PlayerCanTrain.Add(JFD_BlockFrenchGGs)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_AmphibiousGenerals
----------------------------------------------------------------------------------------------------------------------------
local unitPromotionAmphibiousID = GameInfoTypes["PROMOTION_JFD_AMPHIBIOUS"]

function JFD_AmphibiousGenerals(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local frenchGreatGeneralNearby = false
	local unit = player:GetUnitByID(unitID)
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then 
		if (unit and unit:IsCombatUnit() or unit:GetUnitType() == unitFrenchGreatGeneralID) then
			for otherUnit in player:Units() do
				if otherUnit:GetUnitType() == unitFrenchGreatGeneralID then
					if Map.PlotDistance(unit:GetX(), unit:GetY(), otherUnit:GetX(), otherUnit:GetY()) < 2 then
						frenchGreatGeneralNearby = true
					end
				end
			end
			
			if frenchGreatGeneralNearby then
				if not (unit:IsHasPromotion(unitPromotionAmphibiousID)) then
					unit:SetHasPromotion(unitPromotionAmphibiousID, true)
				end
			else
				if not (unit:GetUnitType() == unitFrenchGreatGeneralID and unit:IsHasPromotion(unitPromotionAmphibiousID)) then
					unit:SetHasPromotion(unitPromotionAmphibiousID, false)
				end
			end
			
		end
	end
end

if isFranceDeGaulleCivActive then
	GameEvents.UnitSetXY.Add(JFD_AmphibiousGenerals)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_CreateFrenchGreatGenerals
----------------------------------------------------------------------------------------------------------------------------
local unitGreatGeneralID = GameInfoTypes["UNIT_GREAT_GENERAL"]

function JFD_CreateFrenchGreatGenerals(playerID, unitID)
    local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then 
		local unit = player:GetUnitByID(unitID)
	   	if (unit and unit:GetUnitType() == unitGreatGeneralID) then 
			local newUnit
			if player:IsHuman() then
				newUnit = player:InitUnit(unitFrenchGreatGeneralID, unit:GetX(), unit:GetY())
			else
				newUnit = player:InitUnit(unitFrenchGreatGeneralID, unit:GetX(), unit:GetY())
				player:ChangeJONSCulture(player:GetTotalJONSCulturePerTurn() * 3)
			end
			newUnit:Convert(unit)
		end
    end
end

if isFranceDeGaulleCivActive then
	Events.SerialEventUnitCreated.Add(JFD_CreateFrenchGreatGenerals)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GreatGeneralRate
----------------------------------------------------------------------------------------------------------------------------
local buildingFrenchResistanceID = GameInfoTypes["BUILDING_JFD_FRENCH_RESISTANCE"]

function JFD_GreatGeneralRate(playerID)
	local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then 
		local numFrenchCitiesCaptured = 0
		for otherPlayerID = 0, GameDefines.MAX_PLAYERS - 1 do
			local otherPlayer = Players[otherPlayerID]
			for city in otherPlayer:Cities() do
				if (city:GetOriginalOwner() == playerID and city:GetOwner() ~= playerID) then
					numFrenchCitiesCaptured = numFrenchCitiesCaptured + 1
				end
			end
		end	

		player:GetCapitalCity():SetNumRealBuilding(buildingFrenchResistanceID, mathMin(5, numFrenchCitiesCaptured))
	end
end

if isFranceDeGaulleCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_GreatGeneralRate)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_CafeVisibility
----------------------------------------------------------------------------------------------------------------------------
local buildingCafeID = GameInfoTypes["BUILDING_JFD_CAFE"]

function JFD_CafeVisibility(playerID)
	local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then 
		for otherPlayerID = 0, GameDefines.MAX_PLAYERS - 1 do
			local otherPlayer = Players[otherPlayerID]
			if (otherPlayer:CountNumBuildings(buildingCafeID) > 0 and otherPlayer ~= player) then
				for city in otherPlayer:Cities() do
					local teamID = player:GetTeam()
					local otherTeamID = otherPlayer:GetTeam()
					if city:IsHasBuilding(buildingCafeID) then
						local plot = city:Plot()
						for adjacentPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
							if not (adjacentPlot:IsRevealed(teamID)) then
								adjacentPlot:ChangeVisibilityCount(teamID, 1)
								adjacentPlot:SetRevealed(teamID, true)
							end
						end
					else
						local plot = city:Plot()
						for adjacentPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
							if not (adjacentPlot:IsRevealed(teamID)) then
								adjacentPlot:ChangeVisibilityCount(teamID, 0)
								adjacentPlot:SetRevealed(teamID, false)
							end
						end
					end
				end
			end
		end
	end
end

if isFranceDeGaulleCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_CafeVisibility)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_CafeResistance
----------------------------------------------------------------------------------------------------------------------------
local buildingClassBroadcastTowerID = GameInfoTypes["BUILDINGCLASS_BROADCAST_TOWER"]
local unitCombatGunID				= GameInfoTypes["UNITCOMBAT_GUN"]
local unitCombatRangedID			= GameInfoTypes["UNITCOMBAT_ARCHER"]
local unitPromotionCafeID			= GameInfoTypes["PROMOTION_JFD_CAFE"]

function JFD_CafeResistance(playerID, cityID, unitID)
	local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then 
		local city = player:GetCityByID(cityID)
		if city:IsHasBuilding(buildingCafeID) then
			if city:GetNumGreatWorksInBuilding(buildingClassBroadcastTowerID) == 2 then
				local unit = player:GetUnitByID(unitID)
				if (unit:GetUnitCombatType() == unitCombatGunID or unit:GetUnitCombatType() == unitCombatRangedID) then
					unit:SetHasPromotion(unitPromotionCafeID, true)
				end
			end
		end
	end
end

if isFranceDeGaulleCivActive then
	GameEvents.CityTrained.Add(JFD_CafeResistance)
end
--==========================================================================================================================
--==========================================================================================================================