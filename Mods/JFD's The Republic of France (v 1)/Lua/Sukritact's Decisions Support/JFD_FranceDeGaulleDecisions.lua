-- JFD_FranceDeGaulleDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's France (De Gaulle) Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_SendWorldEvent
------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if not (player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID	= GameInfoTypes["CIVILIZATION_JFD_FRANCE_DEGAULLE"]
local mathCeil			= math.ceil
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- France: Foreign Legion
-------------------------------------------------------------------------------------------------------------------------
local policyForeignLegionID			= GameInfoTypes["POLICY_JFD_FOREIGN_LEGION"]
local techPlasticsID				= GameInfoTypes["TECH_PLASTIC"]
local techReplaceablePartsID		= GameInfoTypes["TECH_REPLACEABLE_PARTS"]
local unitForeignLegionID			= GameInfoTypes["UNIT_JFD_FOREIGN_LEGION"]
local unitForeignLegionUpgradedID	= GameInfoTypes["UNIT_JFD_FOREIGN_LEGION_L"]

local Decisions_ForeignLegion = {}
	Decisions_ForeignLegion.Name = "TXT_KEY_DECISIONS_JFD_FRANCE_DEGAULLE_FOREIGN_LEGION"
	Decisions_ForeignLegion.Desc = "TXT_KEY_DECISIONS_JFD_FRANCE_DEGAULLE_FOREIGN_LEGION_DESC"
	Decisions_ForeignLegion.Pedia = "TXT_KEY_UNIT_FRENCH_FOREIGNLEGION"
	HookDecisionCivilizationIcon(Decisions_ForeignLegion, "CIVILIZATION_JFD_FRANCE_DEGAULLE")
	Decisions_ForeignLegion.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_ForeignLegion") == true then
			Decisions_ForeignLegion.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FRANCE_DEGAULLE_FOREIGN_LEGION_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = mathCeil(567 * iMod)
		Decisions_ForeignLegion.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FRANCE_DEGAULLE_FOREIGN_LEGION_DESC", goldCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 			then return true, false end
		if player:GetGold() < goldCost 										then return true, false end
		if not (Teams[player:GetTeam()]:IsHasTech(techReplaceablePartsID)) 	then return true, false end
		
		return true, true
	end
	)
	
	Decisions_ForeignLegion.DoFunc = (
	function(player)
		local goldCost = mathCeil(567 * iMod)
		local capitalX = player:GetCapitalCity():GetX()
		local capitalY = player:GetCapitalCity():GetY()
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGold(-goldCost)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyForeignLegionID, true)
		player:InitUnit(unitForeignLegionID, capitalX, capitalY)
		save(player, "Decisions_ForeignLegion", true)
	end
	)

	Decisions_ForeignLegion.Monitors = {}
	Decisions_ForeignLegion.Monitors[GameEvents.TeamTechResearched] =  (
	function(teamID, techID)
		local player = Players[Teams[teamID]:GetLeaderID()]
		if load(player, "Decisions_ForeignLegion") == true then
			if techID == techPlasticsID then
				for unit in player:Units() do
					if unit:GetUnitType() == unitForeignLegionID then
						local foreignLegion = unit
						local newUnit
						newUnit = player:InitUnit(unitForeignLegionUpgradedID, unit:GetX(), unit:GetY())
						newUnit:Convert(foreignLegion)
					end
				end
			end
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_ForeignLegion", Decisions_ForeignLegion)
-------------------------------------------------------------------------------------------------------------------------
-- France: Maginot Line
-------------------------------------------------------------------------------------------------------------------------
local techEngineeringID		= GameInfoTypes["TECH_ENGINEERING"]
local unitFrenchWorkerID	= GameInfoTypes["UNIT_JFD_FRENCH_WORKER"]

local Decisions_MaginotLine = {}
	Decisions_MaginotLine.Name = "TXT_KEY_DECISIONS_JFD_FRANCE_DEGAULLE_MAGINOT_LINE"
	Decisions_MaginotLine.Desc = "TXT_KEY_DECISIONS_JFD_FRANCE_DEGAULLE_MAGINOT_LINE_DESC"
	HookDecisionCivilizationIcon(Decisions_MaginotLine, "CIVILIZATION_JFD_FRANCE_DEGAULLE")
	Decisions_MaginotLine.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_MaginotLine") == true then
			Decisions_MaginotLine.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FRANCE_DEGAULLE_MAGINOT_LINE_DESC")
			return false, false, true
		end
		
		local goldCost = mathCeil(700 * iMod)
		Decisions_MaginotLine.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FRANCE_DEGAULLE_MAGINOT_LINE_DESC", goldCost)
		
		if player:GetGold() < goldCost 									then return true, false end
		if not (Teams[player:GetTeam()]:IsHasTech(techEngineeringID)) 	then return true, false end
		
		return true, true
	end
	)
	
	Decisions_MaginotLine.DoFunc = (
	function(player)
		local goldCost = mathCeil(700 * iMod)
		local capitalX = player:GetCapitalCity():GetX()
		local capitalY = player:GetCapitalCity():GetY()
		player:ChangeGold(-goldCost)
		player:InitUnit(unitFrenchWorkerID, capitalX, capitalY)
		player:InitUnit(unitFrenchWorkerID, capitalX, capitalY)
		player:InitUnit(unitFrenchWorkerID, capitalX, capitalY)
		save(player, "Decisions_MaginotLine", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_MaginotLine", Decisions_MaginotLine)
--=======================================================================================================================
--=======================================================================================================================