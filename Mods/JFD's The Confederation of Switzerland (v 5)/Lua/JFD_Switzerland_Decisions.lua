-- JFD_Switzerland_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Switzerland Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- MOD CHECKS
-------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingClaimsColonies
function JFD_IsUsingClaimsColonies()
	local claimsColoniesModID = "10e9728f-d61c-4317-be4f-7d52d6bae6f4"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == claimsColoniesModID) then
			return true
		end
	end
	return false
end
local isUsingClaimsColonies = JFD_IsUsingClaimsColonies()
-------------------------------------------------------------------------------------------------------------------------
-- UTILITIES
------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if not (player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_SWITZERLAND"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"] 
local mathCeil = math.ceil
local techBankingID = GameInfoTypes["TECH_BANKING"]
local resourceDignitariesID	= GameInfoTypes["RESOURCE_JFD_DIGNITARIES"]
--------------------------------------------------------------------------------------------------------------------------
-- Switzerland: Enact Bank Secrecy Laws
-------------------------------------------------------------------------------------------------------------------------
local policyBankSecrecyID = GameInfoTypes["POLICY_DECISIONS_JFD_SWITZERLAND_BANKS"]
local Decisions_JFD_Switzerland_BankSecrecy = {}
	Decisions_JFD_Switzerland_BankSecrecy.Name = "TXT_KEY_DECISIONS_JFD_SWITZERLAND_BANK_SECRECY"
	Decisions_JFD_Switzerland_BankSecrecy.Desc = "TXT_KEY_DECISIONS_JFD_SWITZERLAND_BANK_SECRECY_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_Switzerland_BankSecrecy, "CIVILIZATION_JFD_SWITZERLAND")
	Decisions_JFD_Switzerland_BankSecrecy.CanFunc = (
	function(player)		
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyBankSecrecyID) then
			Decisions_JFD_Switzerland_BankSecrecy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SWITZERLAND_BANK_SECRECY_ENACTED_DESC")
			return false, false, true
		end
		Decisions_JFD_Switzerland_BankSecrecy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SWITZERLAND_BANK_SECRECY_DESC")
		if (not Teams[player:GetTeam()]:IsHasTech(techBankingID)) then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Switzerland_BankSecrecy.DoFunc = (
	function(player)
		local playerID = player:GetID()
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyBankSecrecyID, true)
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SWITZERLAND_BANK_SECRECY", player:GetName(), player:GetCivilizationShortDescription())) 
	end
	)

Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_Switzerland_BankSecrecy", Decisions_JFD_Switzerland_BankSecrecy)
-------------------------------------------------------------------------------------------------------------------------
-- Switzerland: Fund Foreign Researchers
-------------------------------------------------------------------------------------------------------------------------
local policyForeignResearchersID = GameInfoTypes["POLICY_DECISIONS_JFD_SWITZERLAND_RESEARCH"]
local Decisions_JFD_Switzerland_ForeignResearchers = {}
	Decisions_JFD_Switzerland_ForeignResearchers.Name = "TXT_KEY_DECISIONS_JFD_SWITZERLAND_FOREIGN_RESEARCHERS"
	Decisions_JFD_Switzerland_ForeignResearchers.Desc = "TXT_KEY_DECISIONS_JFD_SWITZERLAND_FOREIGN_RESEARCHERS_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_Switzerland_ForeignResearchers, "CIVILIZATION_JFD_SWITZERLAND")
	Decisions_JFD_Switzerland_ForeignResearchers.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyForeignResearchersID) then
			Decisions_JFD_Switzerland_ForeignResearchers.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SWITZERLAND_FOREIGN_RESEARCHERS_ENACTED_DESC")
			return false, false, true
		end
		local goldCost = mathCeil(500*iMod)
		local resourceID = iMagistrate
		local resourceType = "[ICON_MAGISTRATES] Magistrates"
		if isUsingClaimsColonies then
			resourceID = resourceDignitariesID
			resourceType = "[ICON_JFD_DIGNITARY] Dignitaries"
		end
		Decisions_JFD_Switzerland_ForeignResearchers.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SWITZERLAND_FOREIGN_RESEARCHERS_DESC", goldCost, resourceType)
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		if player:GetGold() < goldCost then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Switzerland_ForeignResearchers.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local goldCost = mathCeil(500*iMod)
		local resourceID = iMagistrate
		if isUsingClaimsColonies then
			resourceID = resourceDignitariesID
		end
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(resourceID, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyForeignResearchersID, true)
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SWITZERLAND_FOREIGN_RESEARCHERS", player:GetName(), player:GetCivilizationShortDescription())) 
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_Switzerland_ForeignResearchers", Decisions_JFD_Switzerland_ForeignResearchers)
--=======================================================================================================================
--=======================================================================================================================
