-- JFD_EgyptDjoser_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Egypt (Djoser) Decisions: loaded")
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("FLuaVector.lua")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
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
--------------------------------------------------------------------------------------------------------------------------
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingSovereignty
function JFD_IsUsingSovereignty()
	local sovereigntyModID = "d99bf7aa-51ac-4bef-bd88-d765b28e260e"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == sovereigntyModID) then
			return true
		end
	end
	return false
end
local isUsingSovereignty = JFD_IsUsingSovereignty()
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_EGYPT_DJOSER"]
local mathCeil = math.ceil
-------------------------------------------------------------------------------------------------------------------------
-- Egypt (Djoser): Codify the Vizierate
-------------------------------------------------------------------------------------------------------------------------
local policyVizierateID = GameInfoTypes["POLICY_DECISIONS_JFD_EGYPT_DJOSER_VIZIERATE"]
local techWritingID	= GameInfoTypes["TECH_WRITING"]
local unitClassEngineerID = GameInfoTypes["UNITCLASS_ENGINEER"]
local unitVizierID = GameInfoTypes["UNIT_JFD_VIZIER"]
local Decisions_JFD_EgyptDjoser_Vizierate = {}
	Decisions_JFD_EgyptDjoser_Vizierate.Name = "TXT_KEY_DECISIONS_JFD_EGYPT_DJOSER_VIZIERATE"
	Decisions_JFD_EgyptDjoser_Vizierate.Desc = "TXT_KEY_DECISIONS_JFD_EGYPT_DJOSER_VIZIERATE_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_EgyptDjoser_Vizierate, "CIVILIZATION_JFD_EGYPT_DJOSER")
	Decisions_JFD_EgyptDjoser_Vizierate.CanFunc = (
	function(player)
		local playerID = player:GetID()
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyVizierateID) then
			Decisions_JFD_EgyptDjoser_Vizierate.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_EGYPT_DJOSER_VIZIERATE_ENACTED_DESC")
			return false, false, true 
		end
		local magistrateCost = 1
		local yieldCost = player:GetNextPolicyCost()
		local yieldType = "[ICON_CULTURE] Culture"
		Decisions_JFD_EgyptDjoser_Vizierate.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_EGYPT_DJOSER_VIZIERATE_DESC", yieldCost, yieldType, magistrateCost)
		if (not Teams[player:GetTeam()]:IsHasTech(techWritingID)) then return true, false end
		if player:GetUnitClassCount(unitClassEngineerID) == 0 then return true, false end
		if isUsingSovereignty then 
			if JFD_GetSovereignty(playerID) < yieldCost then return true, false end
		else
			if player:GetJONSCulture() < yieldCost then return true, false end
		end
		if player:GetNumResourceAvailable(iMagistrate, false) < magistrateCost then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_EgyptDjoser_Vizierate.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local magistrateCost = 1
		local yieldCost = player:GetNextPolicyCost()
		player:ChangeJONSCulture(-yieldCost)
		player:ChangeNumResourceTotal(iMagistrate, -magistrateCost)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyVizierateID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_EgyptDjoser_Vizierate", Decisions_JFD_EgyptDjoser_Vizierate)
-------------------------------------------------------------------------------------------------------------------------
-- Egypt (Djoser): Develop Step Pyramids
-------------------------------------------------------------------------------------------------------------------------
local buildingStepPyramidID	= GameInfoTypes["BUILDING_DECISIONS_JFD_STEP_PYRAMID"]
local policyStepPyramidID = GameInfoTypes["POLICY_DECISIONS_JFD_EGYPT_DJOSER_STEP_PYRAMIDS"]
local Decisions_JFD_EgyptDjoser_StepPyramids = {}
	Decisions_JFD_EgyptDjoser_StepPyramids.Name = "TXT_KEY_DECISIONS_JFD_EGYPT_DJOSER_STEP_PYRAMIDS"
	Decisions_JFD_EgyptDjoser_StepPyramids.Desc = "TXT_KEY_DECISIONS_JFD_EGYPT_DJOSER_STEP_PYRAMIDS_DESC"
	Decisions_JFD_EgyptDjoser_StepPyramids.Pedia = "TXT_KEY_DECISIONS_JFD_STEP_PYRAMID"
	HookDecisionCivilizationIcon(Decisions_JFD_EgyptDjoser_StepPyramids, "CIVILIZATION_JFD_EGYPT_DJOSER")
	Decisions_JFD_EgyptDjoser_StepPyramids.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyStepPyramidID) then
			Decisions_JFD_EgyptDjoser_StepPyramids.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_EGYPT_DJOSER_STEP_PYRAMIDS_ENACTED_DESC")
			return false, false, true 
		end
		local goldCost = mathCeil(300*iMod)
		Decisions_JFD_EgyptDjoser_StepPyramids.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_EGYPT_DJOSER_STEP_PYRAMIDS_DESC", goldCost)
		if player:GetGold() < goldCost then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_EgyptDjoser_StepPyramids.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local goldCost = mathCeil(300*iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyStepPyramidID, true)
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_EGYPT_DJOSER_STEP_PYRAMID", player:GetName(), player:GetCivilizationShortDescription())) 
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_EgyptDjoser_StepPyramids", Decisions_JFD_EgyptDjoser_StepPyramids)
--=======================================================================================================================
--=======================================================================================================================
