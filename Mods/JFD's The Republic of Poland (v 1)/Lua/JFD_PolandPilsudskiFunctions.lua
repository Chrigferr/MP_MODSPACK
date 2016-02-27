-- JFD_PolandPilsudskiFunctions
-- Author: JFD
-- DateCreated: 5/6/2014 4:50:19 AM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
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
------------------------------------------------------------------------------------------------------------------------
-- JFD_IsFightingStrongerFoe
------------------------------------------------------------------------------------------------------------------------
function JFD_IsFightingStrongerFoe(playerID)
	local player = Players[playerID]
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local otherPlayer = Players[playerID]
		if player:GetMilitaryMight() < otherPlayer:GetMilitaryMight() then
			if Teams[player:GetTeam()]:IsAtWar(otherPlayer:GetTeam()) then
				return true
			end
		end
	end
end
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID				= GameInfoTypes["CIVILIZATION_JFD_POLAND_PILSUDSKI"]
local isPolandPilsudskiCivActive	= JFD_IsCivilisationActive(civilisationID)
local mathMin						= math.min

if isPolandPilsudskiCivActive then
	print("Chief of State Pilsudski is in this game")
end
-------------------------------------------------------------------------------------------------------------------------
--JFD_PilsudskiPoland
-------------------------------------------------------------------------------------------------------------------------
local buildingPilsudskiID		= GameInfoTypes["BUILDING_JFD_PILSUDSKI_MILITARY"]
local unitpromotionPilsudskiID	= GameInfoTypes["PROMOTION_JFD_PILSUDSKI"]

function JFD_PilsudskiPoland(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		if JFD_IsFightingStrongerFoe(playerID) then
			for city in player:Cities() do
				if (not city:IsHasBuilding(buildingPilsudskiID)) then
					city:SetNumRealBuilding(buildingPilsudskiID, 1)
				end
			end

			for unit in player:Units() do
				if (not unit:IsHasPromotion(unitpromotionPilsudskiID)) then
					unit:SetHasPromotion(unitpromotionPilsudskiID, true)
				end
			end
		else
			for city in player:Cities() do
				if city:IsHasBuilding(buildingPilsudskiID) then
					city:SetNumRealBuilding(buildingPilsudskiID, 0)
				end
			end

			for unit in player:Units() do
				if unit:IsHasPromotion(unitpromotionPilsudskiID) then
					unit:SetHasPromotion(unitpromotionPilsudskiID, false)
				end
			end
		end
	end
end

if isPolandPilsudskiCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_PilsudskiPoland)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_UhlanStrengthUpgrade
----------------------------------------------------------------------------------------------------------------------------
local techCombustionID			= GameInfoTypes["TECH_COMBUSTION"]
local unitStrength				= GameInfo.Units["UNIT_GREAT_WAR_INFANTRY"].Combat
local unitPromotionCombustionID	= GameInfoTypes["PROMOTION_JFD_UHLAN_COMBUSTION"]

function JFD_UhlanStrengthUpgrade(playerID, cityID, unitID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		local unit = player:GetUnitByID(unitID)
		if unit:IsHasPromotion(unitPromotionCombustionID) then
			unit:SetBaseCombatStrength(unitStrength-4)
			unit:SetHasPromotion(unitPromotionCombustionID, false)
		end
	end
end 

function JFD_UhlanStrengthUpgradeTech(teamID, techID)
	local playerID = Teams[teamID]:GetLeaderID()
	local player = Players[playerID] 
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		if techID == techCombustionID then
			for unit in player:Units() do
				if unit:IsHasPromotion(unitPromotionCombustionID) then
					unit:SetBaseCombatStrength(unitStrength-4)
					unit:SetHasPromotion(unitPromotionCombustionID, false)
				end
			end
		end
	end
end

if isPolandPilsudskiCivActive then
	GameEvents.CityTrained.Add(JFD_UhlanStrengthUpgrade)
	GameEvents.TeamTechResearched.Add(JFD_UhlanStrengthUpgradeTech)
end
--=======================================================================================================================
--=======================================================================================================================

local JFDbType = GameInfoTypes.UNIT_JFD_LEG_UHLAN;
local JFDhPlayer = -1;

function UTPreKillFunction(unitOwnerId, unitId, unitType, unitX, unitY, bDelay, eKillingPlayer)
	if bDelay then
		JFDhPlayer = -1;
		local dUnit = Players[unitOwnerId]:GetUnitByID(unitId);
		if dUnit:IsCombatUnit() then
			JFDhPlayer = eKillingPlayer;
			UTkillUnit = unitType;			
		end
	elseif JFDhPlayer ~= -1 then
		for iUnit in Players[JFDhPlayer]:Units() do
			if iUnit:GetUnitType() == JFDbType then
				if iUnit:GetPlot() == Map.GetPlot(unitX, unitY) then
					UTuatFunction(iUnit)
					return;					
				end
			end
		end
	end
end
GameEvents.UnitPrekill.Add(UTPreKillFunction)

function UTuatFunction(iUnit, eUnitType)
	iUnit:ChangeMoves(60)
	iUnit:SetMadeAttack(false)
	local iTeam = Players[iUnit:GetOwner()]:GetTeam();
	for i = 0, 5 do
		local iPlot = Map.PlotDirection(iUnit:GetX(), iUnit:GetY(), i);
		if iPlot then
			if not iPlot:IsCity() then
				for i = 0, iPlot:GetNumUnits() - 1 do
					local eUnit = iPlot:GetUnit(i);
					if eUnit:IsCombatUnit() then
						if Teams[iTeam]:IsAtWar(Players[eUnit:GetOwner()]:GetTeam()) then
							eUnit:ChangeDamage(math.min(10, math.max(0, 99 - eUnit:GetDamage())))
						end
					end
				end
			end
		end
	end
end