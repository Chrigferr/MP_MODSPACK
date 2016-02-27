-- JFD_RussiaPeter_Functions
-- Author: JFD
-- DateCreated: 3/12/2014 9:35:16 PM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- MOD CHECKS
----------------------------------------------------------------------------------------------------------------------------
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
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
-- JFD_RussiaPeter_GetNumDoFsWithPlayer
function JFD_RussiaPeter_GetNumDoFsWithPlayer(playerID)
	local player = Players[playerID]
	local numDoFs = 0
	for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		if otherPlayerID ~= playerID then
			local otherPlayer = Players[otherPlayerID]
			if (otherPlayer:IsAlive() and otherPlayer:IsDoF(playerID)) then
				numDoFs = numDoFs + 1
			end
		end
	end
	return numDoFs
end

-- JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("JFD_RussiaPeter_DTP.lua")
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID			= Game.GetActivePlayer()
local activePlayer				= Players[activePlayerID]
local civilizationID 			= GameInfoTypes["CIVILIZATION_JFD_RUSSIA_PETER"]
local isRussiaPeterCivActive	= JFD_IsCivilisationActive(civilizationID)
local mathCeil 					= math.ceil
local mathFloor 				= math.floor
local mathMin 					= math.min
if isRussiaPeterCivActive then
	print("Emperor Peter the Great is in this game")
end
----------------------------------------------------------------------------------------------------------------------------
-- PETRINE REFORMATION
----------------------------------------------------------------------------------------------------------------------------
--JFD_RussiaPeter_Init
local policyRussiaPeterID = GameInfoTypes["POLICY_JFD_RUSSIA_PETER"]
function JFD_RussiaPeter_Init(player)
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
			if (not player:HasPolicy(policyPetrineRussiaID)) then
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(policyPetrineRussiaID, true)	
			end
		end
	end 
end
if isRussiaPeterCivActive then
	Events.SequenceGameInitComplete.Add(JFD_RussiaPeter_Init)
end

-- JFD_RussiaPeter_ScienceFromDoF
function JFD_RussiaPeter_ScienceFromDoF(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		local scienceFromDoF = JFD_RussiaPeter_GetScienceFromDoF(playerID)
		if scienceFromDoF > 0 then
			local currentTechID = player:GetCurrentResearch() 
			local teamTechs = Teams[player:GetTeam()]:GetTeamTechs()
			teamTechs:ChangeResearchProgress(currentTechID, scienceFromDoF, playerID)
		end
	end
end
if isRussiaPeterCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_RussiaPeter_ScienceFromDoF)
end
----------------------------------------------------------------------------------------------------------------------------
-- KREPOST
----------------------------------------------------------------------------------------------------------------------------	
-- JFD_RussiaPeter_Krepost
local buildingKrepostID = GameInfoTypes["BUILDING_KREPOST"]
local buildingKrepostExpansionID = GameInfoTypes["BUILDING_JFD_KREPOST_TILES"]
function JFD_RussiaPeter_Krepost(playerID, cityID, buildingID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		if buildingID == buildingKrepostID then
			local city = player:GetCityByID(cityID)
			local capital = player:GetCapitalCity()
			local distance = Map.PlotDistance(capital:GetX(), capital:GetY(), city:GetX(), city:GetY())
			city:SetNumRealBuilding(buildingKrepostExpansionID, mathMin(100, distance))
		end
	end
end
if isRussiaPeterCivActive then
	GameEvents.CityConstructed.Add(JFD_RussiaPeter_Krepost)
end	
----------------------------------------------------------------------------------------------------------------------------
-- TWO-DECKER
----------------------------------------------------------------------------------------------------------------------------	
-- JFD_RussiaPeter_TwoDecker
local unitTwoDeckerID = GameInfoTypes["UNIT_JFD_TWO_DECKER"]
function JFD_RussiaPeter_TwoDecker(playerID, cityID, unitID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		local unit = player:GetUnitByID(unitID)
		if unit:GetUnitType() == unitTwoDeckerID then
			local numXPToGive = mathMin(JFD_RussiaPeter_GetNumDoFsWithPlayer(playerID)*5, 20)
			unit:ChangeExperience(numXPToGive)
		end
	end
end
if isRussiaPeterCivActive then
	GameEvents.CityTrained.Add(JFD_RussiaPeter_TwoDecker)
end	
--==========================================================================================================================
--==========================================================================================================================