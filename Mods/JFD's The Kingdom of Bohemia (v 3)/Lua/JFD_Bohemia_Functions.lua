-- JFD_BohemiaFunctions
-- Author: JFD
-- DateCreated: 6/23/2014 2:36:23 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("PlotIterators")
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
--------------------------------------------------------------------------------------------------------------------------
-- UTILS
--------------------------------------------------------------------------------------------------------------------------
-- GetStrongestMilitaryUnit (Sukritact)
function GetStrongestMilitaryUnit(pPlayer, bIgnoreResources, ...)
	local tUnit = {["Combat"] = 0}
	for iKey, sCombatType in pairs(arg) do
		for row in GameInfo.Units("CombatClass = \'" .. sCombatType .. "\'") do
			if pPlayer:CanTrain(row.ID, bIgnoreResources) and row.Combat > tUnit.Combat then
				tUnit = row
			end
		end
	end
	return tUnit.ID
end

-- JFD_GetNumAdjacentTabors
local unitPromotionTaborID = GameInfoTypes["PROMOTION_JFD_TABOR_DEFENSE"]
function JFD_GetNumAdjacentTabors(playerID, city)
	local player = Players[playerID]
	local plot = Map.GetPlot(city:GetX(), city:GetY())
	local numAdjTabors = 0 
	for adjacentPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		for value = 0,(adjacentPlot:GetNumUnits() - 1) do
			local adjUnit = adjacentPlot:GetUnit(value)
			if (adjUnit:IsHasPromotion(unitPromotionTaborID) and adjUnit:GetOwner() == playerID) then
				numAdjTabors = numAdjTabors + 1
			end
		end
	end
	return numAdjTabors
end

-- JFD_GetNumCityStateFollowers
local buildingReligiousPressureID = GameInfoTypes["BUILDING_JFD_BOHEMIAN_PRESSURE"]
function JFD_GetNumCityStateFollowers(playerID, religionID)
	local numCityStateFollowers = 0
	for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		local minor = Players[otherPlayerID]
		local minorCapital = minor:GetCapitalCity()
		if (minor:IsAlive() and minor:IsMinorCiv() and minorCapital) then
			if (minorCapital:GetReligiousMajority() == religionID and religionID > 0) then
				if (not minorCapital:IsHasBuilding(buildingReligiousPressureID)) then
					minorCapital:SetNumRealBuilding(buildingReligiousPressureID, 1)
				end
				numCityStateFollowers = numCityStateFollowers + 1
			else
				if minorCapital:IsHasBuilding(buildingReligiousPressureID) then
					minorCapital:SetNumRealBuilding(buildingReligiousPressureID, 0)
				end
			end
		end
	end
	return numCityStateFollowers
end

-- JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
--=======================================================================================================================
-- UNIQUE FUNCTIONS	
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_BOHEMIA"]
local isBohemiaCivActive = JFD_IsCivilisationActive(civilizationID)
if isBohemiaCivActive then
	print("King Vaclav II is in this game")
end
--------------------------------------------------------------------------------------------------------------------------
-- HUSSITE WARS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Bohemia_Hussites
local notificationGreatPersonID = NotificationTypes["NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER"]
local unitClassInquisitorID = GameInfoTypes["UNITCLASS_INQUISITOR"]
local unitClassMissionaryID = GameInfoTypes["UNITCLASS_MISSIONARY"]
local unitClassProphetID = GameInfoTypes["UNITCLASS_PROPHET"]
function JFD_Bohemia_Hussites(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			if (otherPlayer:IsAlive() and (not otherPlayer:IsPlayerHasOpenBorders(playerID))) then
				for unit in otherPlayer:Units() do
					if unit:GetPlot():GetOwner() == playerID then 
						local convertChance = 0
						local unitClassID = unit:GetUnitClassType()
						if (unitClassID == unitClassMissionaryID or unitClassID == unitClassInquisitorID) then
							convertChance = 25
						elseif unitClassID == unitClassProphetID then
							convertChance = 10
						end
						if (convertChance > 0 and JFD_GetRandom(1,100) <= convertChance) then
							local newUnitID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
							print(newUnitID)
							if newUnitID then
								player:InitUnit(newUnitID, unit:GetX(), unit:GetY())
								if player:IsHuman() then
									player:AddNotification(notificationGreatPersonID, Locale.ConvertTextKey("TXT_KEY_JFD_BOHEMIA_CONVERTED_DESC", unit:GetName()), Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_BOHEMIA_SHORT"), unit:GetX(), unit:GetY(), unit:GetUnitType(), -1)
								end
								unit:Kill(-1)
							end
						end
					end
				end
			end
		end
	end
end
if isBohemiaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_Bohemia_Hussites)
end

-- JFD_Bohemian_CityStateDelegates
local buildingDelegatesID = GameInfoTypes["BUILDING_JFD_BOHEMIAN_DELEGATES"]
function JFD_Bohemian_CityStateDelegates(playerID)
	local player = Players[playerID]
	local capital = player:GetCapitalCity()
	if (not capital) then return end
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		local religionID = player:GetReligionCreatedByPlayer() or capital:GetReligiousMajority()
		if isUsingCPDLL then religionID = player:GetMajorityReligion() end
		if religionID > 0 then 
			capital:SetNumRealBuilding(buildingDelegatesID, JFD_GetNumCityStateFollowers(playerID, religionID))
		end
	end
end
if isBohemiaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_Bohemian_CityStateDelegates)
end
------------------------------------------------------------------------------------------------------------------------
-- TABOR
------------------------------------------------------------------------------------------------------------------------
-- JFD_Bohemia_Tabor
local unitPromotionTaborDefenseID = GameInfoTypes["PROMOTION_JFD_TABOR_DEFENSE_OTHER"]
local unitPromotionTaborRangedID = GameInfoTypes["PROMOTION_JFD_TABOR_RANGED"] 
function JFD_Bohemia_Tabor(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and (not player:IsBarbarian())) then	
		for unit in player:Units() do
			local unitPlot = unit:GetPlot()
			if unitPlot:GetOwner() ~= playerID then return end
			if unit:IsCombatUnit() then
				local isSameTileTabor = false
				if isUsingCPDLL then
					isSameTileTabor = unit:IsWithinDistanceOfUnitPromotion(unitPromotionTaborID, 0)
				else
					for adjacentPlot in PlotAreaSweepIterator(unitPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
						isSameTileTabor = (adjacentPlot:GetUnit() and adjacentPlot:GetUnit():IsHasPromotion(unitPromotionTaborID))
						if isSameTileTabor == true then 
							break
						end
					end
				end
				if isSameTileTabor  then
					if (not unit:IsHasPromotion(unitPromotionTaborDefenseID)) then
						unit:SetHasPromotion(unitPromotionTaborDefenseID, true)
					end
					if (unit:IsRanged() and (not unit:IsHasPromotion(unitPromotionTaborRangedID))) then
						unit:SetHasPromotion(unitPromotionTaborRangedID, true)
					end
				else
					if unit:IsHasPromotion(unitPromotionTaborDefenseID) then
						unit:SetHasPromotion(unitPromotionTaborDefenseID, false)
					end
					if unit:IsHasPromotion(unitPromotionTaborRangedID) then
						unit:SetHasPromotion(unitPromotionTaborRangedID, false)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_Bohemia_Tabor)

-- JFD_Bohemia_TaborCityDefense
local buildingDefenseID = GameInfoTypes["BUILDING_JFD_BOHEMIAN_DEFENSE"]
function JFD_Bohemia_TaborCityDefense(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and (not player:IsBarbarian())) then	 
		for city in player:Cities() do
			city:SetNumRealBuilding(buildingDefenseID, JFD_GetNumAdjacentTabors(playerID, city))
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_Bohemia_TaborCityDefense)
--==========================================================================================================================
--==========================================================================================================================