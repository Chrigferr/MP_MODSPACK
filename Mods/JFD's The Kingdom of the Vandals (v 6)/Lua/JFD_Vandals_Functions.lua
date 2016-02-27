-- JFD_Vandals_Functions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
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
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayer	 = Players[Game.GetActivePlayer()]
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_THE_VANDALS"]
local isVandalsCivActive = JFD_IsCivilisationActive(civilizationID)
if isVandalsCivActive then
	print("King Genseric is in the game")
end
--------------------------------------------------------------------------------------------------------------------------
-- MEDITERRANEAN PIRATES
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Vandals_MediterraneanPirates
function JFD_Vandals_MediterraneanPirates(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		for city in player:Cities() do
			if (city:IsCoastal() and city:IsRazing()) then
				city:ChangeRazingTurns(-city:GetRazingTurns())
			end
		end
	end
end
if isVandalsCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_Vandals_MediterraneanPirates)
end
--------------------------------------------------------------------------------------------------------------------------
-- ALAN CAVALRY
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Vandals_AlanCavalry
local unitSettlerID					= GameInfoTypes["UNIT_SETTLER"]
local unitPromotionAlanCavalryID	= GameInfoTypes["PROMOTION_JFD_ALAN_CAVALRY"]
function JFD_Vandals_AlanCavalry(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		for unit in player:Units() do
			if unit:GetUnitType() == unitSettlerID then
				local plot = unit:GetPlot()
				if (plot:GetUnit() and plot:GetUnit():IsHasPromotion(unitPromotionAlanCavalryID)) then
					unit:ChangeMoves(120)
				end
			end
		end
	end
end
if isVandalsCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_Vandals_AlanCavalry)
end
--==========================================================================================================================
--==========================================================================================================================