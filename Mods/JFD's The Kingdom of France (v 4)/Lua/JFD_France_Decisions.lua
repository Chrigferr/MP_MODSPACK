-- JFD_France_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's France (Louis XIV) Decisions: loaded")
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
--DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_FRANCE"]
local mathCeil = math.ceil
local resourceDignitariesID	= GameInfoTypes["RESOURCE_JFD_DIGNITARIES"]
-------------------------------------------------------------------------------------------------------------------------
-- Louis XIV: Hold Masquerade Ball
-------------------------------------------------------------------------------------------------------------------------
local improvementChateauID = GameInfoTypes["IMPROVEMENT_CHATEAU"]
local Decisions_JFD_France_MasqueradeBall = {}
	Decisions_JFD_France_MasqueradeBall.Name = "TXT_KEY_DECISIONS_JFD_FRANCE_MASQUERADE_BALL"
	Decisions_JFD_France_MasqueradeBall.Desc = "TXT_KEY_DECISIONS_JFD_FRANCE_MASQUERADE_BALL_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_France_MasqueradeBall, "CIVILIZATION_FRANCE")
	Decisions_JFD_France_MasqueradeBall.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		local eraID = load(player, "Decisions_JFD_France_MasqueradeBall")
		if eraID ~= nil then
			if eraID < player:GetCurrentEra() then
				save(player, "Decisions_JFD_France_MasqueradeBall", nil)
			else
				Decisions_JFD_France_MasqueradeBall.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FRANCE_MASQUERADE_BALL_ENACTED_DESC")
				return false, false, true
			end
		end
		local resourceID = iMagistrate
		local resourceType = "[ICON_MAGISTRATES] Magistrates"
		if isUsingClaimsColonies then
			resourceID = resourceDignitariesID
			resourceType = "[ICON_JFD_DIGNITARY] Dignitaries"
		end
		local numChateaus = player:GetImprovementCount(improvementChateauID)
		local goldCost = mathCeil((45*iMod)*numChateaus)
		Decisions_JFD_France_MasqueradeBall.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FRANCE_MASQUERADE_BALL_DESC", resourceType, goldCost, numChateaus*2)
		if player:GetNumResourceAvailable(resourceID, false) < 1 then return true, false end
		if (not player:IsGoldenAge()) then return true, false end
		if player:GetGold() < goldCost then return true, false end
		if numChateaus < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_France_MasqueradeBall.DoFunc = (
	function(player)
		local numChateaus = player:GetImprovementCount(improvementChateauID)
		local goldCost = mathCeil((45*iMod)*numChateaus)
		local resourceID = iMagistrate
		if isUsingClaimsColonies then
			resourceID = resourceDignitariesID
		end
		player:ChangeNumResourceTotal(resourceID, -1)
		player:ChangeGold(-goldCost)
		player:GetCapitalCity():ChangeWeLoveTheKingDayCounter(numChateaus*2)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENTS_JFD_FRANCE_MASQUERADE_BALL"))
		save(player, "Decisions_JFD_France_MasqueradeBall", player:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_France_MasqueradeBall", Decisions_JFD_France_MasqueradeBall)
--=======================================================================================================================
--=======================================================================================================================
