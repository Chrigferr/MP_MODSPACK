-- JFD_GermanyHitler_Functions
-- Author: JFD
-- DateCreated: 12/23/2014 3:46:49 AM
--==========================================================================================================================
-- Includes
--==========================================================================================================================
include("PlotIterators");
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- JFD_GetNumDenunciationsAndWars
--------------------------------------------------------------
function JFD_GetNumDenunciationsAndWars(playerID)
	local player = Players[playerID]
	local numDenunciationsAndWars = 0
	for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local otherPlayer = Players[otherPlayerID]
		if (otherPlayer:IsAlive() and otherPlayerID ~= playerID) then
			if Teams[player:GetTeam()]:IsHasMet(otherPlayer:GetTeam()) then
				if (player:IsDenouncedPlayer(otherPlayerID) or otherPlayer:IsDenouncedPlayer(playerID) or otherPlayer:IsDenouncingPlayer(playerID) or Teams[otherPlayer:GetTeam()]:IsAtWar(player:GetTeam())) then
					numDenunciationsAndWars = numDenunciationsAndWars + 1
				end
			end
		end
	end

	return numDenunciationsAndWars
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
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
local civilisationID			= GameInfoTypes["CIVILIZATION_JFD_NAZI_GERMANY"]
local isGermanyHitlerCivActive	= JFD_IsCivilisationActive(civilisationID)
local mathMin					= math.min

if isGermanyHitlerCivActive then
	print("Chancellor Adolf Hitler is in this game")
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_BlockNaziGGs
----------------------------------------------------------------------------------------------------------------------------
local unitNaziGreatGeneralID = GameInfoTypes["UNIT_JFD_SS"]

function JFD_BlockNaziGGs(playerID, unitID)
	if unitID == unitNaziGreatGeneralID then return false end
	return true
end
GameEvents.PlayerCanTrain.Add(JFD_BlockNaziGGs)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_BlitzkreigGenerals
----------------------------------------------------------------------------------------------------------------------------
local unitPromotionHitlersBlitzID	= GameInfoTypes["PROMOTION_JFD_BLITZ"]
local unitCombatArcherID			= GameInfoTypes["UNITCOMBAT_ARCHER"]
local unitCombatGunID				= GameInfoTypes["UNITCOMBAT_GUN"]
local unitCombatMeleeID				= GameInfoTypes["UNITCOMBAT_MELEE"]

function JFD_BlitzkreigGenerals(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local naziGreatGeneralNearby = false
	local unit = player:GetUnitByID(unitID)
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then 
		if (unit and (unit:GetUnitCombatType() == unitCombatArcherID or unit:GetUnitCombatType() == unitCombatMeleeID or unit:GetUnitCombatType() == unitCombatGunID)) then
			for otherUnit in player:Units() do
				if otherUnit:GetUnitType() == unitNaziGreatGeneralID then
					if Map.PlotDistance(unit:GetX(), unit:GetY(), otherUnit:GetX(), otherUnit:GetY()) < 2 then
						naziGreatGeneralNearby = true
						break
					end
				end
			end
			
			if naziGreatGeneralNearby then
				if (not unit:IsHasPromotion(unitPromotionHitlersBlitzID)) then
					unit:SetHasPromotion(unitPromotionHitlersBlitzID, true)
				end
			else
				if unit:IsHasPromotion(unitPromotionHitlersBlitzID) then
					unit:SetHasPromotion(unitPromotionHitlersBlitzID, false)
				end
			end
			
		end
	end
end

if isGermanyHitlerCivActive then
	GameEvents.UnitSetXY.Add(JFD_BlitzkreigGenerals)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_CreateNaziGreatGenerals
----------------------------------------------------------------------------------------------------------------------------
local unitGreatGeneralID = GameInfoTypes["UNIT_GREAT_GENERAL"]

function JFD_CreateNaziGreatGenerals(playerID, unitID)
    local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then 
		local unit = player:GetUnitByID(unitID)
	   	if (unit and unit:GetUnitType() == unitGreatGeneralID) then 
			local newUnit
			if player:IsHuman() then
				newUnit = player:InitUnit(unitNaziGreatGeneralID, unit:GetX(), unit:GetY())
			else
				newUnit = player:InitUnit(unitNaziGreatGeneralID, unit:GetX(), unit:GetY())
				if player:GetCurrentResearch() > -1 then
					Teams[player:GetTeam()]:GetTeamTechs():ChangeResearchProgress(player:GetCurrentResearch(), player:GetScience()*10, player:GetID())
				end
			end
			newUnit:Convert(unit)
		end
    end
end

if isGermanyHitlerCivActive then
	Events.SerialEventUnitCreated.Add(JFD_CreateNaziGreatGenerals)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GreatGeneralRate
----------------------------------------------------------------------------------------------------------------------------
local buildingNaziGermanyID = GameInfoTypes["BUILDING_JFD_NAZI_GERMANY"]

function JFD_GreatGeneralRate(playerID)
	local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilisationID and player:GetCapitalCity()) then 
		player:GetCapitalCity():SetNumRealBuilding(buildingNaziGermanyID, mathMin(10, JFD_GetNumDenunciationsAndWars(playerID)))
	end
end

if isGermanyHitlerCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_GreatGeneralRate)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_PanzerRolling
----------------------------------------------------------------------------------------------------------------------------
local unitPromotionPanzerID = GameInfoTypes["PROMOTION_JFD_PANZER"] 

function JFD_PanzerRolling(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	if (player:IsAlive() and (not player:IsMinorCiv()) and (not player:IsBarbarian())) then 
		local unit = player:GetUnitByID(unitID)
		if unit:IsHasPromotion(unitPromotionPanzerID) then
			local plot = Map.GetPlot(unitX, unitY)
			if (plot:GetOwner() > -1 and plot:GetImprovementType() > -1) then
				local otherPlayer = Players[plot:GetOwner()]
				if Teams[otherPlayer:GetTeam()]:IsAtWar(player:GetTeam()) then
					if JFD_GetRandom(1,100) <= 33 then
						plot:SetImprovementPillaged(true)
					end
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(JFD_PanzerRolling)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_WehrmachtOnCapture
----------------------------------------------------------------------------------------------------------------------------
local unitWehrmachtID = GameInfoTypes["UNIT_JFD_WEHRMACHT"] 

function JFD_WehrmachtOnCapture(oldOwnerID, capital, cityX, cityY, newOwnerID)
	local player = Players[newOwnerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		if player:CanTrain(unitWehrmachtID) then
			player:InitUnit(unitWehrmachtID, cityX, cityY)
		end
	end
end

if isGermanyHitlerCivActive then
	GameEvents.CityCaptureComplete.Add(JFD_WehrmachtOnCapture)	
end
--==========================================================================================================================
--==========================================================================================================================