-- JFD_ByzantiumAlexios_Functions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("UniqueDiplomacyUtils.lua")
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
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

-- JFD_IsCPDLL
function JFD_IsCPDLL()
	local cPDLLID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == cPDLLID) then
			return true
		end
	end
	return false
end
local isUsingCPDLL = JFD_IsCPDLL()
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID = Game.GetActivePlayer()
local activePlayer	 = Players[activePlayerID]
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_BYZANTIUM_ALEXIOS"]
local gameSpeedID	 = Game:GetGameSpeedType()
local isCivByzantiumAlexiosActive = JFD_IsCivilisationActive(civilizationID)
local isCivByzantiumAlexiosActivePlayer	= activePlayer:GetCivilizationType() == civilizationID
local mathCeil = math.ceil
if isCivByzantiumAlexiosActive then
	print("Emperor Alexios I Komnenos is in this game")
	if isUsingPiety then
		include("JFD_PietyUtils.lua")
	end
end
--==========================================================================================================================
-- DIPLOMACY FUNCTIONS
--==========================================================================================================================
-- DIPLOMACY
----------------------------------------------------------------------------------------------------------------------------
local civilizationByzantiumID = GameInfoTypes["CIVILIZATION_BYZANTIUM"]
local civilizationTurksID = GameInfoTypes["CIVILIZATION_JFD_TURKS"]
-- JFD_ByzantiumAlexios_UniqueResponses
function JFD_ByzantiumAlexios_UniqueResponses()
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
        local player = Players[playerID]
        if (player and player:IsAlive() and player:IsHuman()) then
			local civilizationID = player:GetCivilizationType()
			if civilizationID == civilizationByzantiumID then
				ChangeDiplomacyResponse("LEADER_JFD_ALEXIOS", "RESPONSE_FIRST_GREETING", "TXT_KEY_LEADER_JFD_ALEXIOS_FIRSTGREETING%", "TXT_KEY_LEADER_JFD_ALEXIOS_THEODORA_FIRSTGREETING_1", 500)
				break
			elseif civilizationID == civilizationTurksID then
				ChangeDiplomacyResponse("LEADER_JFD_ALEXIOS", "RESPONSE_FIRST_GREETING", "TXT_KEY_LEADER_JFD_ALEXIOS_FIRSTGREETING%", "TXT_KEY_LEADER_JFD_ALEXIOS_MEHMED_II_FIRSTGREETING_1", 500)
				ChangeDiplomacyResponse("LEADER_JFD_ALEXIOS", "RESPONSE_DEFEAT", "TXT_KEY_LEADER_JFD_ALEXIOS_DEFEAT%", "TXT_KEY_LEADER_JFD_ALEXIOS_MEHMED_II_DEFEATED_1", 500)
				break
			end
		end
	end
end
if (isCivByzantiumAlexiosActive and (not isCivByzantiumAlexiosActivePlayer)) then
	Events.SequenceGameInitComplete.Add(JFD_ByzantiumAlexios_UniqueResponses)
end
----------------------------------------------------------------------------------------------------------------------------
-- KOMNENONIAN RESTORATION
----------------------------------------------------------------------------------------------------------------------------
-- JFD_ByzantiumAlexios_Init
local policyByzantiumAlexiosRangedCombatStrengthOffID = GameInfoTypes["POLICY_JFD_BYZANTIUM_ALEXIOS_GOLDEN_AGE_OFF"]
local policyByzantiumAlexiosRangedCombatStrengthOnID = GameInfoTypes["POLICY_JFD_BYZANTIUM_ALEXIOS_GOLDEN_AGE_ON"]
function JFD_ByzantiumAlexios_Init(playerID, isStart, turns)
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
			if ((not player:HasPolicy(policyByzantiumAlexiosRangedCombatStrengthOffID)) and (not player:HasPolicy(policyByzantiumAlexiosRangedCombatStrengthOnID))) then
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(policyByzantiumAlexiosRangedCombatStrengthOffID, true)
			end
		end
	end 
end
if isCivByzantiumAlexiosActive then
	Events.LoadScreenClose.Add(JFD_ByzantiumAlexios_Init)
end

-- JFD_ByzantiumAlexios_GoldenAgeRangedStrength
function JFD_ByzantiumAlexios_GoldenAgeRangedStrength(playerID, isStart, turns)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		if player:IsGoldenAge() then
			if player:HasPolicy(policyByzantiumAlexiosRangedCombatStrengthOffID) then
				player:SetHasPolicy(policyByzantiumAlexiosRangedCombatStrengthOffID, false)
			end
			if (not player:HasPolicy(policyByzantiumAlexiosRangedCombatStrengthOnID)) then
				player:SetHasPolicy(policyByzantiumAlexiosRangedCombatStrengthOnID, true)
			end
		else
			if player:HasPolicy(policyByzantiumAlexiosRangedCombatStrengthOnID) then
				player:SetHasPolicy(policyByzantiumAlexiosRangedCombatStrengthOnID, false)
			end
			if (not player:HasPolicy(policyByzantiumAlexiosRangedCombatStrengthOffID)) then
				player:SetHasPolicy(policyByzantiumAlexiosRangedCombatStrengthOffID, true)
			end
		end
	end
end
if isCivByzantiumAlexiosActive then
	if isUsingCPDLL then
		GameEvents.PlayerGoldenAge.Add(JFD_ByzantiumAlexios_GoldenAgeRangedStrength)
	else
		GameEvents.PlayerDoTurn.Add(JFD_ByzantiumAlexios_GoldenAgeRangedStrength)
	end
end

-- JFD_ByzantiumAlexios_GoldenAgeWar
function JFD_ByzantiumAlexios_GoldenAgeWar(teamID, otherTeamID)
	local team = Teams[teamID]
	local otherTeam = Teams[otherTeamID]
	local playerID = team:GetLeaderID()
	local player = Players[playerID]
	local otherPlayerID = otherTeam:GetLeaderID()
	local otherPlayer = Players[otherPlayerID]
	if (player:IsAlive() and (not otherPlayer:IsMinorCiv()) and player:GetCivilizationType() == civilizationID) then
		local otherPlayerSize = otherPlayer:GetNumCities()*2
		player:ChangeGoldenAgeTurns(otherPlayerSize)
	elseif (otherPlayer:IsAlive() and (not player:IsMinorCiv()) and otherPlayer:GetCivilizationType() == civilizationID) then
		local otherPlayerSize = player:GetNumCities()*2
		otherPlayer:ChangeGoldenAgeTurns(otherPlayerSize)
	end
end
if isCivByzantiumAlexiosActive then
	GameEvents.DeclareWar.Add(JFD_ByzantiumAlexios_GoldenAgeWar)
end
--------------------------------------------------------------------------------------------------------------------------
-- LANTERNAS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_ByzantiumAlexios_Lanternas
local unitPromotionLanternasID = GameInfoTypes["PROMOTION_JFD_LANTERNAS"]
function JFD_ByzantiumAlexios_Lanternas(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
		if player:IsGoldenAge() then
			for unit in player:Units() do
				if unit:IsHasPromotion(unitPromotionLanternasID) then
					if unit:GetDamage() > 0 then
						unit:ChangeDamage(-15)
					end
				end
			end
		end
	end
end
if isCivByzantiumAlexiosActive then
	GameEvents.PlayerDoTurn.Add(JFD_ByzantiumAlexios_Lanternas)
end
--==========================================================================================================================
--==========================================================================================================================