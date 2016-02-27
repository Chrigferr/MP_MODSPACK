-- JFD_FranceNapoleonI_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's France (Louis XIV) Decisions: loaded")
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
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID		= GameInfoTypes["CIVILIZATION_JFD_FRANCE_NAPOLEON"]
local mathCeil				= math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- France (Napoleon): Organise the Grande Armée
--------------------------------------------------------------------------------------------------------------------------
local policyGrandArmeeID = GameInfoTypes["POLICY_DECISIONS_FRANCEARMEE"]
local techGunpowderID = GameInfoTypes["TECH_GUNPOWDER"]
local unitCombatGunID  = GameInfoTypes["UNITCOMBAT_GUN"]
tDecisions.Decisions_JFD_FranceNapoleon_Armee = nil
local Decisions_JFD_FranceNapoleon_Armee = {}
	Decisions_JFD_FranceNapoleon_Armee.Name = "TXT_KEY_DECISIONS_FRANCEARMEE"
	Decisions_JFD_FranceNapoleon_Armee.Desc = "TXT_KEY_Decisions_FRANCEARMEE_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_FranceNapoleon_Armee, "CIVILIZATION_JFD_FRANCE_NAPOLEON")
	Decisions_JFD_FranceNapoleon_Armee.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyGrandArmeeID) then
			Decisions_JFD_FranceNapoleon_Armee.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_FRANCEARMEE_ENACTED_DESC")
			return false, false, true
		end
		Decisions_JFD_FranceNapoleon_Armee.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_FRANCEARMEE_DESC")
		if player:GetNumResourceAvailable(iMagistrate, false) < 2	then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techGunPowderID))	then return true, false end
		local numGunUnits = 0
		for unit in player:Units() do
			if unit:GetUnitCombatType() == unitCombatGunID then
				numGunUnits = numGunUnits + 1
			end
		end
		if numGunUnits < 8 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_FranceNapoleon_Armee.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyGrandArmeeID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_FranceNapoleon_Armee", Decisions_JFD_FranceNapoleon_Armee)
-------------------------------------------------------------------------------------------------------------------------
-- France (Napoleon): Compile the Code Civil de Francais
-------------------------------------------------------------------------------------------------------------------------
local buildingCourthouseID = GameInfoTypes["BUILDING_JFD_COURTHOUSE"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local policyCivilCodeID = GameInfoTypes["POLICY_DECISIONS_JFD_FRANCE_NAPOLEON_CIVIL_CODE"]
local Decisions_JFD_FranceNapoleon_CivilCode = {}
	Decisions_JFD_FranceNapoleon_CivilCode.Name = "TXT_KEY_DECISIONS_JFD_FRANCE_NAPOLEON_CIVIL_CODE"
	Decisions_JFD_FranceNapoleon_CivilCode.Desc = "TXT_KEY_DECISIONS_JFD_FRANCE_NAPOLEON_CIVIL_CODE_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_FranceNapoleon_CivilCode, "CIVILIZATION_JFD_FRANCE_NAPOLEON")
	Decisions_JFD_FranceNapoleon_CivilCode.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyCivilCodeID) then
			Decisions_JFD_FranceNapoleon_CivilCode.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FRANCE_NAPOLEON_CIVIL_CODE_ENACTED_DESC")
			return false, false, true
		end
		local cultureCost = mathCeil((50*iMod)*(player:CountNumBuildings(buildingCourthouseID)+1))
		Decisions_JFD_FranceNapoleon_CivilCode.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FRANCE_NAPOLEON_CIVIL_CODE_DESC", cultureCost)
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		if player:GetJONSCulture() < cultureCost then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if (not load(player, "Decisions_CodeOfLaws")) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_FranceNapoleon_CivilCode.DoFunc = (
	function(player)
		local cultureCost = mathCeil((50*iMod)*(player:CountNumBuildings(buildingCourthouseID)+1))
		player:ChangeJONSCulture(-cultureCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyCivilCodeID, true)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENTS_JFD_FRANCE_NAPOLEON_CIVIL_CODE", player:GetName(), player:GetCivilizationShortDescription()))
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_FranceNapoleon_CivilCode", Decisions_JFD_FranceNapoleon_CivilCode)
--=======================================================================================================================
--=======================================================================================================================
