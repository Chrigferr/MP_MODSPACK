-- JFD_Milan_Functions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------
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
--------------------------------------------------------------
-- UTILITIES
--------------------------------------------------------------
-- JFD_AtPeace
function JFD_AtPeace(playerID)
	if Teams[Players[playerID]:GetTeam()]:GetAtWarCount(false) == 0 then return true end
	return false
end

-- JFD_GetPurchaseCostMod
function JFD_GetPurchaseCostMod(playerID)
	local costMod = 0
	for minorPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		local minorCiv = Players[minorPlayerID]
		if (minorCiv:GetCapitalCity() and minorCiv:IsAlive()) then
			if minorCiv:GetMinorCivFriendshipLevelWithMajor(playerID) == 1 then
				costMod = costMod + 1
			elseif minorCiv:GetMinorCivFriendshipLevelWithMajor(playerID) == 2 then
				costMod = costMod + 2
			end
		end
	end
	return costMod
end
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
--Globals
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID		 = Game.GetActivePlayer()
local activePlayer			 = Players[activePlayerID]
local civilizationID		 = GameInfoTypes["CIVILIZATION_JFD_MILAN"]
local isMilanCivActive		 = JFD_IsCivilisationActive(civilizationID)
local isMilanCivActivePlayer = activePlayer:GetCivilizationType() == civilizationID
local mathCeil				 = math.ceil
local mathFloor				 = math.floor
local mathMin				 = math.min
if isMilanCivActive then
	print("Gian Visconti is in the game")
end
----------------------------------------------------------------------------------------------------------------------------
-- HOUSE OF VISCONTI
----------------------------------------------------------------------------------------------------------------------------
-- JFD_Milan_PurchaseCosts
local buildingMilanID = GameInfoTypes["BUILDING_JFD_MILAN"]
function JFD_Milan_PurchaseCosts(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		local capital = player:GetCapitalCity()
		if capital then
			capital:SetNumRealBuilding(buildingMilanID, JFD_GetPurchaseCostMod(playerID))
		end
	end
end
if isMilanCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_Milan_PurchaseCosts)
end

-- JFD_Milan_PurchaseCostsEnterCityView
function JFD_Milan_PurchaseCostsEnterCityView()
	local city = UI.GetHeadSelectedCity()
	if (city and city:IsCapital()) then
		city:SetNumRealBuilding(buildingMilanID, JFD_GetPurchaseCostMod(activePlayerID))
	end
end
if isMilanCivActivePlayer then
	Events.SerialEventEnterCityScreen.Add(JFD_Milan_PurchaseCostsEnterCityView)
end

-- JFD_Milan_WartimeInfluence
local policyMilanPeaceID = GameInfoTypes["POLICY_JFD_MILAN_PEACE"]
local policyMilanWarID = GameInfoTypes["POLICY_JFD_MILAN_WAR"]
function JFD_MilanWarTimeInfluence(playerID)
	local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
		if JFD_AtPeace(playerID) then
			if player:HasPolicy(policyMilanWarID) then
				player:SetHasPolicy(policyMilanWarID, true)
			end
			if (not player:HasPolicy(policyMilanPeaceID)) then
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(policyMilanPeaceID, true)
			end
		else
			if player:HasPolicy(policyMilanPeaceID) then
				player:SetHasPolicy(policyMilanPeaceID, true)
			end
			if (not player:HasPolicy(policyMilanWarID)) then
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(policyMilanWarID, true)
			end
		end
	end
end
if isMilanCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_Milan_WartimeInfluence)
end
----------------------------------------------------------------------------------------------------------------------------
-- PALAZZO
----------------------------------------------------------------------------------------------------------------------------
-- JFD_Milan_Palazzo
local buildingPalazzoID = GameInfoTypes["BUILDING_JFD_PALAZZO"]
local specialistMerchantID = GameInfoTypes["SPECIALIST_MERCHANT"]
local yieldGoldID = GameInfoTypes["YIELD_GOLD"]
function JFD_Milan_Palazzo(playerID)
	local player = Players[playerID];
    if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
		for city in player:Cities() do
			if city:IsHasBuilding(buildingPalazzoID) then
				local merchantBoost = mathCeil(city:GetBaseYieldRate(yieldGoldID)*10/100)
				city:ChangeSpecialistGreatPersonProgressTimes100(specialistMerchantID, merchantBoost*100)
			end	
		end
	end
end
if isMilanCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_Milan_Palazzo)
end
--==========================================================================================================================
--==========================================================================================================================