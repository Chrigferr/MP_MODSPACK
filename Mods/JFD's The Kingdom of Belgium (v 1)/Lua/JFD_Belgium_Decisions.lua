-- JFD_Belgium_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Belgian Decisions: loaded")
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
--------------------------------------------------------------------------------------------------------------------------
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
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_BELGIUM"]
local mathCeil		 = math.ceil
local resourceDignitariesID	= GameInfoTypes["RESOURCE_JFD_DIGNITARIES"]
--------------------------------------------------------------------------------------------------------------------------
-- Belgian: Create the Force Publique
-------------------------------------------------------------------------------------------------------------------------
local eraIndustrialID		= GameInfoTypes["ERA_INDUSTRIAL"]
local policyForcePubliqueID = GameInfoTypes["POLICY_DECISIONS_JFD_FORCE_PUBLIQUE"]
local Decisions_JFD_Belgium_ForcePublique = {}
	Decisions_JFD_Belgium_ForcePublique.Name = "TXT_KEY_DECISIONS_JFD_BELGIUM_FORCE_PUBLIQUE"
	Decisions_JFD_Belgium_ForcePublique.Desc = "TXT_KEY_DECISIONS_JFD_BELGIUM_FORCE_PUBLIQUE_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_Belgium_ForcePublique, "CIVILIZATION_JFD_BELGIUM")
	Decisions_JFD_Belgium_ForcePublique.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyForcePubliqueID) then
			Decisions_JFD_Belgium_ForcePublique.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BELGIUM_FORCE_PUBLIQUE_ENACTED_DESC")
			return false, false, true
		end
		local goldCost = mathCeil(750*iMod)
		Decisions_JFD_Belgium_ForcePublique.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BELGIUM_FORCE_PUBLIQUE_DESC", goldCost)
		if player:GetCurrentEra() < eraIndustrialID then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetGold() < goldCost then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Belgium_ForcePublique.DoFunc = (
	function(player)
		local goldCost = mathCeil(750 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyForcePubliqueID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_Belgium_ForcePublique", Decisions_JFD_Belgium_ForcePublique)
-------------------------------------------------------------------------------------------------------------------------
-- Belgian: Convene the Brussels Geographic Confederence
-------------------------------------------------------------------------------------------------------------------------
local eraRenaissanceID				= GameInfoTypes["ERA_RENAISSANCE"] 
local policyGeographicConferenceID	= GameInfoTypes["POLICY_DECISIONS_JFD_GEOGRAPHIC_CONFERENCE"]
local Decisions_JFD_Belgium_GeographicConference = {}
	Decisions_JFD_Belgium_GeographicConference.Name = "TXT_KEY_DECISIONS_JFD_BELGIUM_GEOGRAPHIC_CONFERENCE"
	Decisions_JFD_Belgium_GeographicConference.Desc = "TXT_KEY_DECISIONS_JFD_BELGIUM_GEOGRAPHIC_CONFERENCE_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_Belgium_GeographicConference, "CIVILIZATION_JFD_BELGIUM")
	Decisions_JFD_Belgium_GeographicConference.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyGeographicConferenceID) then
			Decisions_JFD_Belgium_GeographicConference.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BELGIUM_GEOGRAPHIC_CONFERENCE_ENACTED_DESC")
			return false, false, true
		end
		local goldCost = mathCeil(600*iMod)
		local resourceID = iMagistrate
		local resourceType = "[ICON_MAGISTRATES] Magistrates"
		if isUsingClaimsColonies then
			resourceID = resourceDignitariesID
			resourceType = "[ICON_JFD_DIGNITARY] Dignitaries"
		end
		Decisions_JFD_Belgium_GeographicConference.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BELGIUM_GEOGRAPHIC_CONFERENCE_DESC", goldCost, resourceType)
		if player:GetNumResourceAvailable(resourceID, false) < 2 then return true, false end
		if player:GetGold() < goldCost then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Belgium_GeographicConference.DoFunc = (
	function(player)
		local goldCost = mathCeil(600*iMod)
		local resourceID = iMagistrate
		if isUsingClaimsColonies then
			resourceID = resourceDignitariesID
		end
		player:ChangeGold(goldCost)
		player:ChangeNumResourceTotal(resourceID, -2)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyGeographicConferenceID, true)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BELGIUM_GEOGRAPHIC_CONFERENCE", player:GetName(), player:GetCivilizationShortDescription())) 
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_Belgium_GeographicConference", Decisions_JFD_Belgium_GeographicConference)
--=======================================================================================================================
--=======================================================================================================================