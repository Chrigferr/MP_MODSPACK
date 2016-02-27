-- JFD_Bohemia_Decisons
-- Author: JFD
--=======================================================================================================================
print("JFD's Bohemia Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILITIES
-------------------------------------------------------------------------------------------------------------------------
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
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_BOHEMIA"]
local mathCeil = math.ceil
-------------------------------------------------------------------------------------------------------------------------
-- Bohemia: Renovate Prague Castle
-------------------------------------------------------------------------------------------------------------------------
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local buildingHradID = GameInfoTypes["BUILDING_JFD_HRAD"]
local buildingPragueRenovationID = GameInfoTypes["BUILDING_DECISIONS_JFD_PRAGUE_RENOVATION"]
local Decisions_JFD_Bohemia_Renovations = {}
	Decisions_JFD_Bohemia_Renovations.Name = "TXT_KEY_DECISIONS_JFD_BOHEMIA_RENOVATIONS"
	Decisions_JFD_Bohemia_Renovations.Desc = "TXT_KEY_DECISIONS_JFD_BOHEMIA_RENOVATIONS_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_Bohemia_Renovations, "CIVILIZATION_JFD_BOHEMIA")
	Decisions_JFD_Bohemia_Renovations.CanFunc = (
	function(player)		
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if load(player, "Decisions_JFD_Bohemia_Renovations") == true then
			Decisions_JFD_Bohemia_Renovations.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BOHEMIA_RENOVATIONS_ENACTED_DESC")
			return false, false, true
		end
		local goldCost = mathCeil(400*iMod)
		Decisions_JFD_Bohemia_Renovations.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BOHEMIA_RENOVATIONS_DESC", goldCost)
		if (not player:GetCapitalCity()) then return true, false end
		if (not player:GetCapitalCity():IsHasBuilding(buildingHradID)) then return true, false end
		if player:GetGold() < goldCost then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Bohemia_Renovations.DoFunc = (
	function(player)
		local goldCost = mathCeil(400*iMod)
		player:ChangeGold(-goldCost)
		player:GetCapitalCity():SetNumRealBuilding(buildingPragueRenovationID, 1)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		save(player, "Decisions_JFD_Bohemia_Renovations", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_BOHEMIA"], "Decisions_JFD_Bohemia_Renovations", Decisions_JFD_Bohemia_Renovations)
-------------------------------------------------------------------------------------------------------------------------
-- Bohemia: Issue Prague Groschen
-------------------------------------------------------------------------------------------------------------------------
local buildingMintID = GameInfoTypes["BUILDING_MINT"]
local policyBohemianSilverID = GameInfoTypes["POLICY_DECISIONS_JFD_BOHEMIA_SILVER"]
local resourceSilverID = GameInfoTypes["RESOURCE_SILVER"]
local Decisions_Bohemia_Groschen = {}
	Decisions_Bohemia_Groschen.Name = "TXT_KEY_DECISIONS_JFD_BOHEMIA_GROSCHEN"
	Decisions_Bohemia_Groschen.Desc = "TXT_KEY_DECISIONS_JFD_BOHEMIA_GROSCHEN_DESC"
	HookDecisionCivilizationIcon(Decisions_Bohemia_Groschen, "CIVILIZATION_JFD_BOHEMIA")
	Decisions_Bohemia_Groschen.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyBohemianSilverID) then
			Decisions_Bohemia_Groschen.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BOHEMIA_GROSCHEN_ENACTED_DESC")
			return false, false, true
		end
		Decisions_Bohemia_Groschen.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BOHEMIA_GROSCHEN_DESC")
		if (not player:GetCapitalCity()) then return true, false end
		if (not player:GetCapitalCity():IsHasBuilding(buildingHradID)) then return true, false end
		if player:GetNumResourceAvailable(resourceSilverID, false) == 0 then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_Bohemia_Groschen.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyBohemianSilverID, true)
		for city in player:Cities() do
			city:SetNumRealBuilding(buildingMintID, 1)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_Bohemia_Groschen", Decisions_Bohemia_Groschen)
--=======================================================================================================================
--=======================================================================================================================
