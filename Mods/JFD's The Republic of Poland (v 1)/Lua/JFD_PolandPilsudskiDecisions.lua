-- JFD_PolandPilsudskiDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Poland (Pilsudski) Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_SendWorldEvent
------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID	= GameInfoTypes["CIVILIZATION_JFD_POLAND_PILSUDSKI"]
local eraIndustrialID	= GameInfoTypes["ERA_INDUSTRIAL"]
local mathCeil			= math.ceil
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Poland (Pilsudski): Create Industrial District
-------------------------------------------------------------------------------------------------------------------------
local policyIndustrialDistrictID = GameInfoTypes["POLICY_JFD_PILSUDSKI_INDUSTRY"]

local Decisions_IndustrialDistrict = {}
	Decisions_IndustrialDistrict.Name = "TXT_KEY_DECISIONS_JFD_POLAND_PILSUDSKI_INDUSTRIAL_DISTRICT"
	Decisions_IndustrialDistrict.Desc = "TXT_KEY_DECISIONS_JFD_POLAND_PILSUDSKI_INDUSTRIAL_DISTRICT_DESC"
	HookDecisionCivilizationIcon(Decisions_IndustrialDistrict, "CIVILIZATION_JFD_POLAND_PILSUDSKI")
	Decisions_IndustrialDistrict.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_IndustrialDistrict") == true then
			Decisions_IndustrialDistrict.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_POLAND_PILSUDSKI_INDUSTRIAL_DISTRICT_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = mathCeil(600 * iMod)
		Decisions_IndustrialDistrict.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_POLAND_PILSUDSKI_INDUSTRIAL_DISTRICT_DESC", goldCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetGold() < goldCost 								then return true, false end
		if player:GetCurrentEra() < eraIndustrialID 				then return true, false	end
		
		return true, true
	end
	)
	
	Decisions_IndustrialDistrict.DoFunc = (
	function(player)
		local goldCost = mathCeil(600 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyIndustrialDistrictID, true)
		save(player, "Decisions_IndustrialDistrict", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_IndustrialDistrict", Decisions_IndustrialDistrict)
-------------------------------------------------------------------------------------------------------------------------
-- Poland (Pilsudski): Enact Currency Reform
-------------------------------------------------------------------------------------------------------------------------
local policyMonateryReformsID = GameInfoTypes["POLICY_JFD_PILSUDSKI_MONATERY_REFORM"]

local Decisions_MonetaryReforms = {}
	Decisions_MonetaryReforms.Name = "TXT_KEY_DECISIONS_JFD_POLAND_PILSUDSKI_MONATERY_REFORM"
	Decisions_MonetaryReforms.Desc = "TXT_KEY_DECISIONS_JFD_POLAND_PILSUDSKI_MONATERY_REFORM_DESC"
	HookDecisionCivilizationIcon(Decisions_MonetaryReforms, "CIVILIZATION_JFD_POLAND_PILSUDSKI")
	Decisions_MonetaryReforms.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_MonetaryReforms") == true then
			Decisions_MonetaryReforms.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_POLAND_PILSUDSKI_MONATERY_REFORM_ENACTED_DESC")
			return false, false, true
		end
		
		local cultureCost = player:GetNextPolicyCost()
		Decisions_MonetaryReforms.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_POLAND_PILSUDSKI_MONATERY_REFORM_DESC", cultureCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetJONSCulture() < cultureCost 					then return true, false end
		if player:GetCurrentEra() < eraIndustrialID 				then return true, false	end
		
		
		return true, true
	end
	)
	
	Decisions_MonetaryReforms.DoFunc = (
	function(player)
		local cultureCost = player:GetNextPolicyCost()
		player:ChangeJONSCulture(-cultureCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyMonateryReformsID, true)
		save(player, "Decisions_MonetaryReforms", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_MonetaryReforms", Decisions_MonetaryReforms)
--=======================================================================================================================
--=======================================================================================================================