-- JFD_ByzantiumTheodora_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Byzantium (Theodora) Decisions: loaded")
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_BYZANTIUM"]
local eraMedievalID	 = GameInfoTypes["ERA_MEDIEVAL"]
local mathCeil 		 = math.ceil
-------------------------------------------------------------------------------------------------------------------------
-- Byzantium (Theodora): Renovate the Capital
-------------------------------------------------------------------------------------------------------------------------
local policyRenovateTheCapitalID = GameInfoTypes["POLICY_DECISIONS_JFD_BYZANTIUM_RENOVATE_CAPITAL"]
local Decisions_JFD_Byzantium_RenovateCapital = {}
	Decisions_JFD_Byzantium_RenovateCapital.Name = "TXT_KEY_DECISIONS_JFD_BYZANTIUM_RENOVATE_CAPITAL"
	Decisions_JFD_Byzantium_RenovateCapital.Desc = "TXT_KEY_DECISIONS_JFD_BYZANTIUM_RENOVATE_CAPITAL_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_Byzantium_RenovateCapital, "CIVILIZATION_BYZANTIUM")
	Decisions_JFD_Byzantium_RenovateCapital.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if load(player, "Decisions_JFD_Byzantium_RenovateCapital") == true then
			Decisions_JFD_Byzantium_RenovateCapital.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BYZANTIUM_RENOVATE_CAPITAL_ENACTED_DESC")
			return false, false, true
		end
		local playerID = player:GetID()
		local goldCost = mathCeil(800*iMod)
		Decisions_JFD_Byzantium_RenovateCapital.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BYZANTIUM_RENOVATE_CAPITAL_DESC", goldCost)
		if player:GetCurrentEra() < eraMedievalID then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetGold() < goldCost then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Byzantium_RenovateCapital.DoFunc = (
	function(player)
		local goldCost = mathCeil(800*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGold(-goldCost)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyRenovateTheCapitalID, true)
		save(player, "Decisions_JFD_Byzantium_RenovateCapital", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_Byzantium_RenovateCapital", Decisions_JFD_Byzantium_RenovateCapital)
--=======================================================================================================================
--=======================================================================================================================
