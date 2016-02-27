-- JFD_RussiaAlexanderI_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Russia (Alexander I) Decisions: loaded")
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("FLuaVector.lua")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetNumDoFsWithPlayer
function JFD_GetNumDoFsWithPlayer(playerID)
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

-- JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--------------------------------------------------------------------------------------------------------------------------
-- MODS CHECKS
--------------------------------------------------------------------------------------------------------------------------
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

-- JFD_IsUsingCPDLL
function JFD_IsUsingCPDLL()
	local cPDLLModID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
	for _, mod in pairs(Modding.GetActivatedMods()) do
	   if (mod.ID == cPDLLModID) then
	     return true
		end
	end
	return false
end
local isUsingCPDLL = JFD_IsUsingCPDLL()

-- JFD_IsUsingEnlightenmentEra
function JFD_IsUsingEnlightenmentEra()
	local enlightenmentEraModID = "ce8aa614-7ef7-4a45-a179-5329869e8d6d"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == enlightenmentEraModID) then
			return true
		end
	end
	return false
end
local isUsingEnlightenmentEra = JFD_IsUsingEnlightenmentEra()
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_RUSSIA_ALEXANDER_I"]
local mathCeil = math.ceil
local resourceDignitaryID = GameInfoTypes["RESOURCE_JFD_DIGNITARIES"]
-------------------------------------------------------------------------------------------------------------------------
-- Russia (Alexander I): Expel Foreign Scholars
-------------------------------------------------------------------------------------------------------------------------
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local policyExpelScholarsID	= GameInfoTypes["POLICY_DECISIONS_JFD_RUSSIA_ALEXANDER_I_EXPEL_FOREIGN_SCHOLARS"]
local Decisions_JFD_RussiaAlexanderI_ExpelScholars = {}
	Decisions_JFD_RussiaAlexanderI_ExpelScholars.Name = "TXT_KEY_DECISIONS_JFD_RUSSIA_ALEXANDER_I_EXPEL_SCHOLARS"
	Decisions_JFD_RussiaAlexanderI_ExpelScholars.Desc = "TXT_KEY_DECISIONS_JFD_RUSSIA_ALEXANDER_I_EXPEL_SCHOLARS_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_RussiaAlexanderI_ExpelScholars, "CIVILIZATION_JFD_RUSSIA_ALEXANDER_I")
	Decisions_JFD_RussiaAlexanderI_ExpelScholars.CanFunc = (
	function(player)
		local playerID = player:GetID()
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		local yieldType = "[ICON_CULTURE] Culture"
		if isUsingCPDLL then
			yieldType = "[ICON_PEACE] Faith"
		end
		if player:HasPolicy(policyExpelScholarsID) then
			Decisions_JFD_RussiaAlexanderI_ExpelScholars.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_ALEXANDER_I_EXPEL_SCHOLARS_ENACTED_DESC", yieldType)
			return false, false, true 
		end
		local eraDesc = "Renaissance"
		local eraID = eraRenaissanceID
		if isUsingEnlightenmentEra then
			eraDesc = "Enlightenment"
			eraID = GameInfoTypes["ERA_ENLIGHTENMENT"]
		end
		Decisions_JFD_RussiaAlexanderI_ExpelScholars.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_ALEXANDER_I_EXPEL_SCHOLARS_DESC", eraDesc, yieldType)
		if player:GetCurrentEra() < eraID then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_RussiaAlexanderI_ExpelScholars.DoFunc = (
	function(player)
		local playerID = player:GetID()
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyExpelScholarsID, true)
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_RUSSIA_ALEXANDER_I_EXPEL_SCHOLARS", player:GetName(), player:GetCivilizationShortDescription())) 
		save(player, "Decisions_JFD_RussiaAlexanderI_ExpelScholars", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_RussiaAlexanderI_ExpelScholars", Decisions_JFD_RussiaAlexanderI_ExpelScholars)
-------------------------------------------------------------------------------------------------------------------------
-- Russia (Alexander I): Form the League of Armed Neutrality
-------------------------------------------------------------------------------------------------------------------------
local policyLeagueOfTheArmedNeutralityID = GameInfoTypes["POLICY_DECISIONS_JFD_RUSSIA_ALEXANDER_I_LEAGUE_ARMED_NEUTRALITY"]
local Decisions_JFD_RussiaAlexanderI_LeagueArmedNeutrality = {}
	Decisions_JFD_RussiaAlexanderI_LeagueArmedNeutrality.Name = "TXT_KEY_DECISIONS_JFD_RUSSIA_ALEXANDER_I_LEAGUE_ARMED_NEUTRALITY"
	Decisions_JFD_RussiaAlexanderI_LeagueArmedNeutrality.Desc = "TXT_KEY_DECISIONS_JFD_RUSSIA_ALEXANDER_I_LEAGUE_ARMED_NEUTRALITY_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_RussiaAlexanderI_LeagueArmedNeutrality, "CIVILIZATION_JFD_RUSSIA_ALEXANDER_I")
	Decisions_JFD_RussiaAlexanderI_LeagueArmedNeutrality.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyLeagueOfTheArmedNeutralityID) then
			Decisions_JFD_RussiaAlexanderI_LeagueArmedNeutrality.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_ALEXANDER_I_LEAGUE_ARMED_NEUTRALITY_ENACTED_DESC")
			return false, false, true 
		end
		local resourceType = "[ICON_MAGISTRATES] Magistrates"
		local resourceID = iMagistrate
		if isUsingClaimsColonies then
			resourceType = "[ICON_JFD_DIGNITARY] Dignitaries"
			resourceID = resourceDignitaryID
		end
		local eraDesc = "Renaissance"
		local eraID = eraRenaissanceID
		if isUsingEnlightenmentEra then
			eraDesc = "Enlightenment"
			eraID = GameInfoTypes["ERA_ENLIGHTENMENT"]
		end
		Decisions_JFD_RussiaAlexanderI_LeagueArmedNeutrality.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_ALEXANDER_I_LEAGUE_ARMED_NEUTRALITY_DESC", eraDesc, resourceType)
		if player:GetCurrentEra() < eraID then return true, false end
		if JFD_GetNumDoFsWithPlayer(playerID) < 2 then return true, false end
		if player:GetNumResourceAvailable(resourceID, false) < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_RussiaAlexanderI_LeagueArmedNeutrality.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local resourceID = iMagistrate
		if isUsingClaimsColonies then
			resourceID = resourceDignitaryID
		end
		player:ChangeNumResourceTotal(resourceID, -2)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyLeagueOfTheArmedNeutralityID, true)
		local civsDoF = ""
		for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
			if otherPlayerID ~= playerID then
				local otherPlayer = Players[otherPlayerID]
				if (otherPlayer:IsAlive() and otherPlayer:IsDoF(playerID)) then
					otherPlayer:SetNumFreePolicies(1)
					otherPlayer:SetNumFreePolicies(0)
					otherPlayer:SetHasPolicy(policyLeagueOfTheArmedNeutralityID, true)
					civsDoF = "[NEWLINE][ICON_BULLET]" .. otherPlayer:GetCivilizationShortDescription()
				end
			end
		end
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_RUSSIA_ALEXANDER_I_LEAGUE_ARMED_NEUTRALITY", player:GetName(), player:GetCivilizationShortDescription(), civsDoF)) 
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_RussiaAlexanderI_LeagueArmedNeutrality", Decisions_JFD_RussiaAlexanderI_LeagueArmedNeutrality)
--=======================================================================================================================
--=======================================================================================================================
