-- JFD_Prussia_Functions
-- Author: JFD
-- DateCreated: 5/4/2014 12:54:31 AM
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

-- JFD_IsUsingCPDLL
function JFD_IsUsingCPDLL()
	local cPDLLID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == cPDLLID) then
			return true
		end
	end
	return false
end
local isUsingCPDLL = JFD_IsUsingCPDLL()

-- JFD_IsUsingMercenaries
function JFD_IsUsingMercenaries()
	local mercenariesID = "a19351c5-c0b3-4b07-8695-4affaa199949"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == mercenariesID) then
			return true
		end
	end
	return false
end
local isUsingMercenaries = JFD_IsUsingMercenaries()
--------------------------------------------------------------------------------------------------------------------------
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
-- JFD_AddBuilding
function JFD_AddBuilding(city, buildingID)
	if (not city:IsHasBuilding(buildingID)) then
		city:SetNumRealBuilding(buildingID, 1)
	end
end

-- JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("PlotIterators.lua")
if isUsingMercenaries then
	include("JFD_MercenariesUtilities.lua")
end
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID		= Game.GetActivePlayer()
local activePlayer			= Players[activePlayerID]
local civilizationID 		= GameInfoTypes["CIVILIZATION_JFD_PRUSSIA"]
local isPrussiaCivActive	= JFD_IsCivilisationActive(civilizationID)
local mathCeil 				= math.ceil
local mathFloor 			= math.floor
if isPrussiaCivActive then
	print("King Frederick the Great is in this game")
end
--------------------------------------------------------------------------------------------------------------------------
-- KONIGGRATZER MARSCH
--------------------------------------------------------------------------------------------------------------------------
local buildingArmoryID					= GameInfoTypes["BUILDING_ARMORY"]
local buildingArmoryPrussianID			= GameInfoTypes["BUILDING_JFD_PRUSSIAN_ARMORY"]
local buildingBarracksID				= GameInfoTypes["BUILDING_BARRACKS"]
local buildingBarracksPrussianID		= GameInfoTypes["BUILDING_JFD_PRUSSIAN_BARRACKS"]
local buildingMilitaryAcademyID			= GameInfoTypes["BUILDING_MILITARY_ACADEMY"]
local buildingMilitaryAcademyPrussianID = GameInfoTypes["BUILDING_JFD_PRUSSIAN_MILITARY_ACADEMY"]
local buildingPrussianMilitary = {}
	buildingPrussianMilitary[buildingArmoryID]			= buildingArmoryPrussianID
	buildingPrussianMilitary[buildingBarracksID]		= buildingBarracksPrussianID
	buildingPrussianMilitary[buildingMilitaryAcademyID] = buildingMilitaryAcademyPrussianID

-- JFD_Prussia_MilitaryBuildingsOnConstructed
function JFD_Prussia_MilitaryBuildingsOnConstructed(playerID, cityID, buildingID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		local buildingPrussianMilitaryID = buildingPrussianMilitary[buildingID]
		if buildingPrussianMilitaryID then
			local city = player:GetCityByID(cityID)
			city:SetNumRealBuilding(buildingPrussianMilitaryID, 1)
		end
	end 
end
if isPrussiaCivActive then
	GameEvents.CityConstructed.Add(JFD_Prussia_MilitaryBuildingsOnConstructed)
end

-- JFD_Prussia_MilitaryBuildingsOnConstructedOnTurn
function JFD_Prussia_MilitaryBuildingsOnConstructedOnTurn(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		for city in player:Cities() do
			if city:IsHasBuilding(buildingArmoryID) then
				JFD_AddBuilding(city, buildingArmoryPrussianID)
			end
			if city:IsHasBuilding(buildingBarracksID) then
				JFD_AddBuilding(city, buildingBarracksPrussianID)
			end
			if city:IsHasBuilding(buildingMilitaryAcademyID) then
				JFD_AddBuilding(city, buildingMilitaryAcademyPrussianID)
			end
		end
	end 
end
if isPrussiaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_Prussia_MilitaryBuildingsOnConstructedOnTurn)
end

-- JFD_Prussia_VeteranUnits
local unitCombatGunID		  = GameInfoTypes["UNITCOMBAT_GUN"]
local unitCombatMeleeID		  = GameInfoTypes["UNITCOMBAT_MELEE"]
local unitCombatMountedID	  = GameInfoTypes["UNITCOMBAT_MOUNTED"]
local unitPromotionVeteran1ID = GameInfoTypes["PROMOTION_JFD_PRUSSIAN_VETERAN_1"]
local unitPromotionVeteran2ID = GameInfoTypes["PROMOTION_JFD_PRUSSIAN_VETERAN_2"]
local unitPromotionVeteran3ID = GameInfoTypes["PROMOTION_JFD_PRUSSIAN_VETERAN_3"]
local unitPromotionVeteran4ID = GameInfoTypes["PROMOTION_JFD_PRUSSIAN_VETERAN_4"]
local unitVeteranPromotions = {}
	unitVeteranPromotions[3]  = unitPromotionVeteran1ID
	unitVeteranPromotions[4]  = unitPromotionVeteran1ID
	unitVeteranPromotions[5]  = unitPromotionVeteran2ID
	unitVeteranPromotions[6]  = unitPromotionVeteran2ID
	unitVeteranPromotions[7]  = unitPromotionVeteran3ID
	unitVeteranPromotions[8]  = unitPromotionVeteran3ID
	unitVeteranPromotions[9]  = unitPromotionVeteran3ID
	unitVeteranPromotions[10] = unitPromotionVeteran4ID

function JFD_Prussia_VeteranUnits(playerID, unitID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		local unit = player:GetUnitByID(unitID)
		local isUnitMercenary = false
		if (isUsingMercenaries and JFD_IsUnitMercenary(playerID, unitID)) then
			isUnitMercenary = true
		end
		local unitLevel = unit:GetLevel()
		if ((not isUnitMercenary) and unitLevel >= 3) then
			local unitCombatType = unit:GetUnitCombatType()
			if (unitCombatType == unitCombatGunID 
			or unitCombatType == unitCombatMeleeID 
			or unitCombatType == unitCombatMountedID) then
				local unitPromotionVeteranID = unitVeteranPromotions[unitLevel]
				if unitLevel >= 10 then unitPromotionVeteranID = unitPromotionVeteran4ID end
				if unitPromotionVeteranID then
					if (not unit:IsHasPromotion(unitPromotionVeteranID)) then
						unit:SetHasPromotion(unitPromotionVeteranID, true)
					end
				end
			end
		end
	end
end
if isPrussiaCivActive then
	GameEvents.UnitPromoted.Add(JFD_Prussia_VeteranUnits)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Prussia_Landwehr
--------------------------------------------------------------------------------------------------------------------------
--JFD_Prussia_Landwehr
local unitLandwehrID = GameInfoTypes["UNIT_JFD_LANDWEHR"]
local unitPromotionLandwehrID = GameInfoTypes["PROMOTION_JFD_LANDWEHR"]
local unitPromotionLandwehrAdjID = GameInfoTypes["PROMOTION_JFD_LANDWEHR_DOUBLE"]
function JFD_Prussia_Landwehr(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and (not player:IsBarbarian())) then	
		for unit in player:Units() do
			if unit:GetUnitType() == unitLandwehrID then
				local isAdjacentLandwehr = false
				if isUsingCPDLL then
					isAdjacentLandwehr = unit:IsAdjacentToUnit(unitLandwehrID, true, false)
				else
					local unitPlot = unit:GetPlot()
					for adjacentPlot in PlotAreaSweepIterator(unitPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
						isAdjacentLandwehr = (adjacentPlot:GetUnit() and adjacentPlot:GetUnit():GetUnitType() == unitLandwehrID)
						if isAdjacentLandwehr == true then 
							break
						end
					end
				end
				if isAdjacentLandwehr then
					if (not unit:IsHasPromotion(unitPromotionLandwehrAdjID)) then
						unit:SetHasPromotion(unitPromotionLandwehrID, false)
						unit:SetHasPromotion(unitPromotionLandwehrAdjID, true)
					end
				else
					if unit:IsHasPromotion(unitPromotionLandwehrAdjID) then
						unit:SetHasPromotion(unitPromotionLandwehrID, true)
						unit:SetHasPromotion(unitPromotionLandwehrAdjID, false)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_Prussia_Landwehr)
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Prussia_DeathsHead
--------------------------------------------------------------------------------------------------------------------------
local direction_types = {
	DirectionTypes["DIRECTION_NORTHEAST"],
	DirectionTypes["DIRECTION_NORTHWEST"],
	DirectionTypes["DIRECTION_EAST"],
	DirectionTypes["DIRECTION_SOUTHEAST"],
	DirectionTypes["DIRECTION_SOUTHWEST"],
	DirectionTypes["DIRECTION_WEST"],
	}
local unitDeathsHeadHussarID = GameInfoTypes["UNIT_JFD_DEATHS_HEAD"]
	
function JFD_Prussia_DeathsHead(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		local unit = player:GetUnitByID(unitID)
		if (unit:GetUnitType() == unitDeathsHeadHussarID and unit:GetPlot()) then
			local plot = unit:GetPlot()
			for loop, direction in ipairs(direction_types) do
				local adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), direction)
				if adjPlot:IsUnit() then
					local adjUnit = adjPlot:GetUnit(i)
					if adjUnit:IsCombatUnit() then
						local adjUnitPlayer = Players[adjUnit:GetOwner()]
						if Teams[adjUnitPlayer:GetTeam()]:IsAtWar(playerID) then
							if JFD_GetRandom(1,100) <= 50 then
								adjUnit:ChangeDamage(5, playerID)
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(JFD_Prussia_DeathsHead) 
--=======================================================================================================================
--=======================================================================================================================
