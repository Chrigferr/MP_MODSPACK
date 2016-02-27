-- JFD_UnitedKingdom_Functions
-- Author: JFD
-- DateCreated: 6/17/2014 10:17:21 AM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
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
--------------------------------------------------------------------------------------------------------------------------
local buildingNavalAirProductionID = GameInfoTypes["BUILDING_JFD_NAVAL_AND_AIR_PRODUCTION"]
local buildingSeaTradeProductionID = GameInfoTypes["BUILDING_JFD_SEA_TRADE_PRODUCTION"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_UNITED_KINGDOM"]
local domainSeaID = GameInfoTypes["DOMAIN_SEA"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local isUnitedKingdomCivilisationActive = JFD_IsCivilisationActive(civilisationID)
local mathCeil = math.ceil
local mathMin = math.min
local popupOpen = false
local specialistEngineerID = GameInfoTypes["SPECIALIST_ENGINEER"]
local specialistMerchantID = GameInfoTypes["SPECIALIST_MERCHANT"]
local policyUKID = GameInfoTypes["POLICY_JFD_UNITED_KINGDOM"]

if isUnitedKingdomCivilisationActive then
	print("Prime Minister Churchill is in this game")
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_InitChurchill
------------------------------------------------------------------------------------------------------------------------
function JFD_InitChurchill(playerID)	
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
			if not player:HasPolicy(policyUKID) then
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(policyUKID, true)
			end
		end
	end
end

if isUnitedKingdomCivilisationActive then
	Events.LoadScreenClose.Add(JFD_InitChurchill)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_AirAndNavalProduction
------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumPledgesofProtection(playerID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local numPledgesofProtection = 0
	for cityStatePlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		local cityStatePlayer = Players[cityStatePlayerID]
		if (cityStatePlayer:IsAlive() and cityStatePlayer:IsMinorCiv()) then
			if cityStatePlayer:IsProtectedByMajor(playerID) then
				numPledgesofProtection = numPledgesofProtection + 1
			end
		end	
	end
	
	return numPledgesofProtection 
end

function JFD_AirAndNavalProduction(playerID)
	local playerID = playerID or Game.GetActivePlayer()
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		for city in player:Cities() do
			city:SetNumRealBuilding(buildingNavalAirProductionID, mathMin(10, JFD_GetNumPledgesofProtection(playerID)))
		end
	end
end

if isUnitedKingdomCivilisationActive then
	GameEvents.PlayerDoTurn.Add(JFD_AirAndNavalProduction)
	Events.SerialEventEnterCityScreen.Add(JFD_AirAndNavalProduction)
end
--=======================================================================================================================
--=======================================================================================================================