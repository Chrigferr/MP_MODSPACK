-- JFD_RussiaPeter_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Russia (Peter) Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILITIES
------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_RUSSIA_PETER"]
local mathCeil = math.ceil
-------------------------------------------------------------------------------------------------------------------------
-- Russia (Peter): Create the Table of Ranks
-------------------------------------------------------------------------------------------------------------------------
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local policyTableOfRanksID = GameInfoTypes["POLICY_DECISIONS_JFD_RUSSIA_PETER_TABLE_OF_RANKS "]
local Decisions_JFD_RussiaPeter_TableofRanks = {}
	Decisions_JFD_RussiaPeter_TableofRanks.Name = "TXT_KEY_DECISIONS_JFD_RUSSIA_PETER_TABLE_OF_RANKS"
	Decisions_JFD_RussiaPeter_TableofRanks.Desc = "TXT_KEY_DECISIONS_JFD_RUSSIA_PETER_TABLE_OF_RANKS_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_RussiaPeter_TableofRanks, "CIVILIZATION_JFD_RUSSIA_PETER")
	Decisions_JFD_RussiaPeter_TableofRanks.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyTableOfRanksID) then
			Decisions_JFD_RussiaPeter_TableofRanks.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_PETER_TABLE_OF_RANKS_ENACTED_DESC")
			return false, false, true 
		end
		local cultureCost = mathCeil(330*iMod)
		Decisions_JFD_RussiaPeter_TableofRanks.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_PETER_TABLE_OF_RANKS_DESC", cultureCost)
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetJONSCulture() < cultureCost then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_RussiaPeter_TableofRanks.DoFunc = (
	function(player)
		local cultureCost = mathCeil(330*iMod)
		player:ChangeJONSCulture(-cultureCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyTableOfRanksID, true)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_PETER_TABLE_OF_RANKS", player:GetName(), player:GetCivilizationShortDescription())) 
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_RussiaPeter_TableofRanks", Decisions_JFD_RussiaPeter_TableofRanks)
-------------------------------------------------------------------------------------------------------------------------
-- Russia (Peter): Institute the Preobrazhensky Regiment
-------------------------------------------------------------------------------------------------------------------------
local techGunpowderID = GameInfoTypes["TECH_GUNPOWDER"]
local unitCombatGunID = GameInfoTypes["UNITCOMBAT_GUN"]
local unitPromotionPreobrazhenskyID = GameInfoTypes["PROMOTION_DECISIONS_JFD_PREOBRAZHENSKY"]
local Decisions_JFD_RussiaPeter_Preobrazhensky = {}
	Decisions_JFD_RussiaPeter_Preobrazhensky.Name = "TXT_KEY_DECISIONS_JFD_RUSSIA_PETER_PREOBRAZHENSKY"
	Decisions_JFD_RussiaPeter_Preobrazhensky.Desc = "TXT_KEY_DECISIONS_JFD_RUSSIA_PETER_PREOBRAZHENSKY_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_RussiaPeter_Preobrazhensky, "CIVILIZATION_JFD_RUSSIA_PETER")
	Decisions_JFD_RussiaPeter_Preobrazhensky.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if load(player, "Decisions_JFD_RussiaPeter_Preobrazhensky") == true then
			Decisions_JFD_RussiaPeter_Preobrazhensky.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_PETER_PREOBRAZHENSKY_ENACTED_DESC")
			return false, false, true
		end
		local goldCost = mathCeil(350*iMod)
		Decisions_JFD_RussiaPeter_Preobrazhensky.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_PETER_PREOBRAZHENSKY_DESC", goldCost)
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetGold() < goldCost then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techGunpowderID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_RussiaPeter_Preobrazhensky.DoFunc = (
	function(player)
		local goldCost = mathCeil(350*iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyPreobrazhenskyID, true)
		for unit in player:Units() do
			if (unit:GetUnitCombatType() == unitCombatGunID and unit:GetLevel() >= 4) then
				unit:SetHasPromotion(unitPromotionPreobrazhenskyID, true)
			end
		end
		save(player, "Decisions_JFD_RussiaPeter_Preobrazhensky", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_RussiaPeter_Preobrazhensky", Decisions_JFD_RussiaPeter_Preobrazhensky)
--=======================================================================================================================
--=======================================================================================================================
