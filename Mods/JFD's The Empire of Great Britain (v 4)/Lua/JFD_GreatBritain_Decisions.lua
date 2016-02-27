-- JFD_GreatBritain_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Great British Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- MOD CHECKS
------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingExCE
function JFD_IsUsingExCE()
	local eXCEModID = "43868e8d-de88-48a1-a8d9-ce144e07f5e0"
	local isUsingExCE = false
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == eXCEModID) then
			return true
		end
	end
	return false
end
local isUsingExCE = JFD_IsUsingExCE()
------------------------------------------------------------------------------------------------------------------------
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
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_GREAT_BRITAIN"]
local mathCeil = math.ceil
if isUsingExCE then
	include("JFD_ExCEUtilities.lua")
end
-------------------------------------------------------------------------------------------------------------------------
-- Great Britain: Open Westminster Parliament
-------------------------------------------------------------------------------------------------------------------------
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]
local Decisions_JFD_GreatBritain_Westminster = {}
	Decisions_JFD_GreatBritain_Westminster.Name = "TXT_KEY_DECISIONS_JFD_GREAT_BRITAIN_WESTMINSTER"
	Decisions_JFD_GreatBritain_Westminster.Desc = "TXT_KEY_DECISIONS_JFD_GREAT_BRITAIN_WESTMINSTER_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_GreatBritain_Westminster, "CIVILIZATION_JFD_GREAT_BRITAIN")
	Decisions_JFD_GreatBritain_Westminster.CanFunc = (
	function(player)		
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		local eraID = load(player, "Decisions_JFD_GreatBritain_Westminster")
		local currentEraID = player:GetCurrentEra()
		if eraID ~= nil then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_GreatBritain_Westminster", nil)
			else
				Decisions_JFD_GreatBritain_Westminster.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_GREAT_BRITAIN_WESTMINSTER_ENACTED_DESC")
				return false, false, true
			end
		end
		local nextPolicyCost = player:GetNextPolicyCost()
		local goldCost = mathCeil((nextPolicyCost*1.5)*iMod)
		Decisions_JFD_GreatBritain_Westminster.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_GREAT_BRITAIN_WESTMINSTER_DESC", goldCost)
		if currentEraID < eraMedievalID then return true, false end
		if player:GetGold() < goldCost then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_GreatBritain_Westminster.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local nextPolicyCost = player:GetNextPolicyCost()
		local goldCost = mathCeil((nextPolicyCost*1.5)*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGold(-goldCost)
		player:ChangeNumFreePolicies(1)
		save(player, "Decisions_JFD_GreatBritain_Westminster", player:GetCurrentEra())
	end
	)

Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_GreatBritain_Westminster", Decisions_JFD_GreatBritain_Westminster)
-------------------------------------------------------------------------------------------------------------------------
-- Great Britain: Found the British East India Company
-------------------------------------------------------------------------------------------------------------------------
local buildingNationalTreasuryID = GameInfoTypes["BUILDING_NATIONAL_TREASURY"]
local eraIndustrialID = GameInfoTypes["ERA_INDUSTRIAL"]
local policyEastIndiaCompanyID = GameInfoTypes["POLICY_DECISIONS_GREAT_BRITAIN_EIC"]
local Decisions_JFD_GreatBritain_EIC = {}
	Decisions_JFD_GreatBritain_EIC.Name = "TXT_KEY_DECISIONS_JFD_GREAT_BRITAIN_EIC"
	Decisions_JFD_GreatBritain_EIC.Desc = "TXT_KEY_DECISIONS_JFD_GREAT_BRITAIN_EIC_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_GreatBritain_EIC, "CIVILIZATION_JFD_GREAT_BRITAIN")
	Decisions_JFD_GreatBritain_EIC.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyEastIndiaCompanyID) then
			Decisions_JFD_GreatBritain_EIC.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_GREAT_BRITAIN_EIC_ENACTED_DESC")
			return false, false, true
		end
		Decisions_JFD_GreatBritain_EIC.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_GREAT_BRITAIN_EIC_DESC")
		if player:CountNumBuildings(buildingNationalTreasuryID) == 0 then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if player:GetCurrentEra() < eraIndustrialID	then return true, false	end
		return true, true
	end
	)
	
	Decisions_JFD_GreatBritain_EIC.DoFunc = (
	function(player)
		local playerID = player:GetID()
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyEastIndiaCompanyID, true)
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_GREAT_BRITAIN_EIC", player:GetName(), player:GetCivilizationShortDescription()))
		save(player, "Decisions_JFD_GreatBritain_EIC", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_GreatBritain_EIC", Decisions_JFD_GreatBritain_EIC)
--=======================================================================================================================
--=======================================================================================================================
