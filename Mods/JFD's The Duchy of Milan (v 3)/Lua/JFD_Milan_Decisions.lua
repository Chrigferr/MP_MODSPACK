-- JFD_Milan_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Milan Decisions: loaded")
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
-- JFD_GetNumCityStateAllies
function JFD_GetNumCityStateAllies(playerID)
	local numCSAllies = 0
	for minorPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		local minorCiv = Players[minorPlayerID]
		if (minorCiv:IsAlive() and minorCiv:GetCapitalCity()) then
			if minorCiv:GetMinorCivFriendshipLevelWithMajor(playerID) == 2 then
				numCSAllies = numCSAllies + 1
			end
		end
	end
	return numCSAllies
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
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
-------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_MILAN"]
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local mathCeil = math.ceil
local resourceDignitariesID	= GameInfoTypes["RESOURCE_JFD_DIGNITARIES"]
-------------------------------------------------------------------------------------------------------------------------
-- Milan: Form the Lombard League
-------------------------------------------------------------------------------------------------------------------------
local buildingLombardLeagueID = GameInfoTypes["BUILDING_DECISIONS_JFD_LOMBARD_LEAGUE"]
local Decisions_JFD_Milan_LombardLeague = {}
	Decisions_JFD_Milan_LombardLeague.Name = "TXT_KEY_DECISIONS_JFD_MILAN_LOMBARD_LEAGUE"
	Decisions_JFD_Milan_LombardLeague.Desc = "TXT_KEY_DECISIONS_JFD_MILAN_LOMBARD_LEAGUE_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_Milan_LombardLeague, "CIVILIZATION_JFD_MILAN")
	Decisions_JFD_Milan_LombardLeague.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if load(player, "Decisions_JFD_Milan_LombardLeague") then
			Decisions_JFD_Milan_LombardLeague.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MILAN_LOMBARD_LEAGUE_ENACTED_DESC")
			return false, false, true
		end
		local goldCost = mathCeil(1167*iMod)
		local resourceID = iMagistrate
		local resourceType = "[ICON_MAGISTRATES] Magistrates"
		if isUsingClaimsColonies then
			resourceID = resourceDignitariesID
			resourceType = "[ICON_JFD_DIGNITARY] Dignitaries"
		end
		Decisions_JFD_Milan_LombardLeague.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MILAN_LOMBARD_LEAGUE_DESC", resourceType, goldCost)
		local playerID = player:GetID()
		if player:GetCurrentEra() < eraMedievalID then return true, false end
		if JFD_GetNumCityStateAllies(player:GetID()) <= 1 then return true, false end
		if player:GetNumResourceAvailable(resourceID, false) < 1 then return true, false end
		if player:GetGold() < goldCost	then return true, false end
		if Teams[Players[playerID]:GetTeam()]:GetAtWarCount(false) <= 1 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Milan_LombardLeague.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local goldCost = mathCeil(1167*iMod)
		local resourceID = iMagistrate
		if isUsingClaimsColonies then
			resourceID = resourceDignitariesID
		end
		player:ChangeGold(goldCost)
		player:ChangeNumResourceTotal(resourceID, -1)
		local capital = player:GetCapitalCity()
		capital:SetNumRealBuilding(buildingLombardLeagueID, 1)
		for minorPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
			local minorCiv = Players[minorPlayerID]
			if (minorCiv:IsAlive() and minorCiv:GetCapitalCity()) then
				if minorCiv:GetMinorCivFriendshipLevelWithMajor(playerID) == 2 then
					local minorCapital = minorCiv:GetCapitalCity()
					minorCapital:SetNumRealBuilding(buildingLombardLeagueID, 1)
				end
			end
		end
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENTS_MILAN_LOMBARD_LEAGUE", player:GetName(), player:GetCivilizationShortDescription()))
		save(player, "Decisions_JFD_Milan_LombardLeague", true)
	end
	)

	Decisions_JFD_Milan_LombardLeague.Monitors = {}
	Decisions_JFD_Milan_LombardLeague.Monitors[GameEvents.PlayerDoTurn] =  (
	function(playerID)
		local player = Players[playerID]
		if load(player, "Decisions_JFD_Milan_LombardLeague") == true then
			local capital = player:GetCapitalCity()
			if (not capital:IsHasBuilding(buildingLombardLeagueID)) then
				capital:SetNumRealBuilding(buildingLombardLeagueID, 1)
			end
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_Milan_LombardLeague", Decisions_JFD_Milan_LombardLeague)
-------------------------------------------------------------------------------------------------------------------------
-- Milan: Establish the Ambrosian Republic
-------------------------------------------------------------------------------------------------------------------------
local policyAmbrosianRepublicID = GameInfoTypes["POLICY_DECISIONS_JFD_MILAN_AMBROSIAN_REPUBLIC"]
local Decisions_JFD_Milan_AmbrosianRepublic = {}
	Decisions_JFD_Milan_AmbrosianRepublic.Name = "TXT_KEY_DECISIONS_JFD_MILAN_AMBROSIAN_REPUBLIC"
	Decisions_JFD_Milan_AmbrosianRepublic.Desc = "TXT_KEY_DECISIONS_JFD_MILAN_AMBROSIAN_REPUBLIC_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_Milan_AmbrosianRepublic, "CIVILIZATION_JFD_MILAN")
	Decisions_JFD_Milan_AmbrosianRepublic.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyAmbrosianRepublicID) then
			Decisions_JFD_Milan_AmbrosianRepublic.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MILAN_AMBROSIAN_REPUBLIC_ENACTED_DESC")
			return false, false, true
		end
		local goldCost = mathCeil(1200*iMod)
		local numLiberty = 0
		for policy in GameInfo.Policies("PolicyBranchType = 'POLICY_BRANCH_LIBERTY'") do
			if player:HasPolicy(policy.ID) then
				numLiberty = numLiberty + 1
			end
		end
		Decisions_JFD_Milan_AmbrosianRepublic.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MILAN_AMBROSIAN_REPUBLIC_DESC", goldCost, numLiberty)
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if player:GetGold() < goldCost then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Milan_AmbrosianRepublic.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local goldCost = mathCeil(1200*iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyAmbrosianRepublicID, true)
		local numLiberty = 0
		for policy in GameInfo.Policies("PolicyBranchType = 'POLICY_BRANCH_LIBERTY'") do
			if player:HasPolicy(policy.ID) then
				numLiberty = numLiberty + 1
			else
				player:SetHasPolicy(policy.ID, true)
			end
		end
		player:ChangeNumResourceTotal(iMagistrate, numLiberty)
		PreGame.SetCivilizationDescription(playerID, "TXT_KEY_JFD_MILAN_AMBROSIAN_REPUBLIC_DESC")
		PreGame.SetCivilizationShortDescription(playerID, "TXT_KEY_JFD_MILAN_AMBROSIAN_REPUBLIC_SHORT_DESC")
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENTS_MILAN_AMBROSIAN_REPUBLIC", player:GetName()))
		save(player, "Decisions_JFD_Milan_AmbrosianRepublic", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_Milan_AmbrosianRepublic", Decisions_JFD_Milan_AmbrosianRepublic)
--=======================================================================================================================
--=======================================================================================================================
