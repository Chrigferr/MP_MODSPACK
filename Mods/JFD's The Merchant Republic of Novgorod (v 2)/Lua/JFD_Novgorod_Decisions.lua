-- JFD_Novgorod_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Novgorod Decisions: loaded")
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
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local activePlayerTeam		= Teams[Game.GetActiveTeam()]
local civilizationID 		= GameInfoTypes["CIVILIZATION_JFD_NOVGOROD"]
local mathCeil 				= math.ceil
local resourceDignitariesID	= GameInfoTypes["RESOURCE_JFD_DIGNITARIES"]
--------------------------------------------------------------------------------------------------------------------------
-- Novgorod: Strike Peace with the Ushkuiniks
-------------------------------------------------------------------------------------------------------------------------
local playerBarbarian = Players[63]
local Event_JFD_Novgorod_Ushkuiniks = {}
	Event_JFD_Novgorod_Ushkuiniks.Name = "TXT_KEY_DECISIONS_JFD_NOVGOROD_USHKUINIKS"
	Event_JFD_Novgorod_Ushkuiniks.Desc = "TXT_KEY_DECISIONS_JFD_NOVGOROD_USHKUINIKS_DESC"
	HookDecisionCivilizationIcon(Event_JFD_Novgorod_Ushkuiniks, "CIVILIZATION_JFD_NOVGOROD")
	Event_JFD_Novgorod_Ushkuiniks.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		local eraID = load(player, "Event_JFD_Novgorod_Ushkuiniks")
		local currentEraID = player:GetCurrentEra()
		if eraID then
			if eraID < currentEraID then
				save(player, "Event_JFD_Novgorod_Ushkuiniks", nil)
			else
				Event_JFD_Novgorod_Ushkuiniks.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NOVGOROD_USHKUINIKS_ENACTED_DESC")
				return false, false, true
			end
		end
		local goldCost = mathCeil(250*iMod)
		local resourceID = iMagistrate
		local resourceType = "[ICON_MAGISTRATES] Magistrates"
		if isUsingClaimsColonies then
			resourceID = resourceDignitariesID
			resourceType = "[ICON_JFD_DIGNITARY] Dignitaries"
		end
		Event_JFD_Novgorod_Ushkuiniks.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NOVGOROD_USHKUINIKS_DESC", goldCost, resourceType)
		if player:GetGold() < goldCost	then return true, false end
		return true, true
	end
	)
	
	Event_JFD_Novgorod_Ushkuiniks.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local currentEraID = player:GetCurrentEra()
		local goldCost = mathCeil(250*iMod)
		local resourceID = iMagistrate
		if isUsingClaimsColonies then
			resourceID = resourceDignitariesID
		end
		player:ChangeNumResourceTotal(resourceID, -1)
		player:ChangeGold(-goldCost)
		Teams[player:GetTeam()]:MakePeace(playerBarbarian:GetTeam())
		save(player, "Event_JFD_Novgorod_Ushkuiniks", currentEraID)
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NOVGOROD_USHKUINIKS", player:GetName(), player:GetCivilizationShortDescription()))
	end
	)
	
	Event_JFD_Novgorod_Ushkuiniks.Monitors = {}
	Event_JFD_Novgorod_Ushkuiniks.Monitors[GameEvents.TeamSetEra] =  (
	function(teamID, eraID)
		local playerTeam = Teams[teamID]
		local player = Players[playerTeam:GetLeaderID()]
		if player:GetCivilizationType() ~= civilizationID then return end
		if (load(player, "Event_JFD_Novgorod_Ushkuiniks") and load(player, "Event_JFD_Novgorod_Ushkuiniks") < eraID) then
			playerTeam:DeclareWar(playerBarbarian:GetTeam())
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Event_JFD_Novgorod_Ushkuiniks", Event_JFD_Novgorod_Ushkuiniks)
-------------------------------------------------------------------------------------------------------------------------
-- Novgorod: Patronise Ivan's Hundred
-------------------------------------------------------------------------------------------------------------------------
local eraMedievalID  	 = GameInfoTypes["ERA_MEDIEVAL"]
local policyIvansHundred = GameInfoTypes["POLICY_DECISIONS_JFD_NOVGOROD_IVANS_HUNDRED"]
local unitMechantID 	 = GameInfoTypes["UNIT_MERCHANT"]
local Event_JFD_Novgorod_IvansHundred = {}
	Event_JFD_Novgorod_IvansHundred.Name = "TXT_KEY_DECISIONS_JFD_NOVGOROD_IVANS_HUNDRED"
	Event_JFD_Novgorod_IvansHundred.Desc = "TXT_KEY_DECISIONS_JFD_NOVGOROD_IVANS_HUNDRED_DESC"
	HookDecisionCivilizationIcon(Event_JFD_Novgorod_IvansHundred, "CIVILIZATION_JFD_NOVGOROD")
	Event_JFD_Novgorod_IvansHundred.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyIvansHundred) then
			Event_JFD_Novgorod_IvansHundred.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NOVGOROD_IVANS_HUNDRED_ENACTED_DESC")
			return false, false, true
		end
		local goldCost = mathCeil(630*iMod)
		local resourceID = iMagistrate
		local resourceType = "[ICON_MAGISTRATES] Magistrates"
		if isUsingClaimsColonies then
			resourceID = resourceDignitariesID
			resourceType = "[ICON_JFD_DIGNITARY] Dignitaries"
		end
		Event_JFD_Novgorod_IvansHundred.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NOVGOROD_IVANS_HUNDRED_DESC", goldCost, resourceType)
		if player:GetCurrentEra() < eraMedievalID then return true, false end
		if player:GetGold() < goldCost then return true, false end
		if player:GetNumResourceAvailable(resourceID, false) < 1 then return true, false end
		return true, true
	end
	)
	
	Event_JFD_Novgorod_IvansHundred.DoFunc = (
	function(player)
		local goldCost = mathCeil(630*iMod)
		local resourceID = iMagistrate
		if isUsingClaimsColonies then
			resourceID = resourceDignitariesID
		end
		player:ChangeNumResourceTotal(resourceID, -1)
		player:ChangeGold(-goldCost)
		local capital = player:GetCapitalCity()
		player:InitUnit(unitMechantID, capital:GetX(), capital:GetY())
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyIvansHundred, true)
	end
	)

Decisions_AddCivilisationSpecific(civilizationID, "Event_JFD_Novgorod_IvansHundred", Event_JFD_Novgorod_IvansHundred)
--=======================================================================================================================
--=======================================================================================================================
