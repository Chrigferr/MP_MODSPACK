-- JFD_ByzantiumAlexios_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Byzantium (Alexios) Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILITIES
-------------------------------------------------------------------------------------------------------------------------
-- JFD_IsHasConqueredCity
function JFD_IsHasConqueredCity(playerID)
	local player = Players[playerID]
	local numConqueredCapitals = 0
	for city in player:Cities() do
		if city:GetOriginalOwner() ~= playerID then
			return true
		end
	end
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
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilizationByzantiumAlexiosID  = GameInfoTypes["CIVILIZATION_JFD_BYZANTIUM_ALEXIOS"]
local eraClassicalID = GameInfoTypes["ERA_CLASSICAL"]
local eraMedievalID	= GameInfoTypes["ERA_MEDIEVAL"]
local mathCeil = math.ceil
-------------------------------------------------------------------------------------------------------------------------
-- Byzantium (Alexios): Establish the Laws of Porphyrogennetos
-------------------------------------------------------------------------------------------------------------------------
tDecisions.Decisions_ByzantiumPorphyrogennetos = nil
local Decisions_ByzantiumPorphyrogennetos = {}
	Decisions_ByzantiumPorphyrogennetos.Name = "TXT_KEY_DECISIONS_BYZANTIUMPORPHYROGENNETOS"
	Decisions_ByzantiumPorphyrogennetos.Desc = "TXT_KEY_DECISIONS_BYZANTIUMPORPHYROGENNETOS_DESC"
	HookDecisionCivilizationIcon(Decisions_ByzantiumPorphyrogennetos, "CIVILIZATION_JFD_BYZANTIUM_ALEXIOS")
	Decisions_ByzantiumPorphyrogennetos.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationByzantiumAlexiosID then return false, false end
		if load(player, "Decisions_ByzantiumPorphyrogennetos") == true then
			Decisions_ByzantiumPorphyrogennetos.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BYZANTIUMPORPHYROGENNETOS_ENACTED_DESC")
			return false, false, true
		end
		local goldCost = mathCeil(400*iMod)
		Decisions_ByzantiumPorphyrogennetos.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BYZANTIUMPORPHYROGENNETOS_DESC", goldCost)
		if player:GetNumPolicyBranchesFinished() < 1 then return true, false end
		local currentEraID = player:GetCurrentEra()
		if ((currentEraID == eraClassicalID or currentEraID == eraMedievalID) and (player:GetGold() >= goldCost) and (player:IsGoldenAge())) then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_ByzantiumPorphyrogennetos.DoFunc = (
	function(player)
		local goldCost = mathCeil(400*iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, 2)
		save(player, "Decisions_ByzantiumPorphyrogennetos", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationByzantiumAlexiosID, "Decisions_ByzantiumPorphyrogennetos", Decisions_ByzantiumPorphyrogennetos)
-------------------------------------------------------------------------------------------------------------------------
-- Byzantium (Alexios): Reform the Thematic System
-------------------------------------------------------------------------------------------------------------------------
local policyByzantiumAlexiosThematicSystemID = GameInfoTypes["POLICY_DECISIONS_JFD_REFORM_THEMATIC_SYSTEM"]
local Decisions_JFD_ByzantiumAlexios_ReformThematicSystem = {}
	Decisions_JFD_ByzantiumAlexios_ReformThematicSystem.Name = "TXT_KEY_DECISIONS_JFD_BYZANTIUM_ALEXIOS_REFORM_THEMATIC_SYSTEM"
	Decisions_JFD_ByzantiumAlexios_ReformThematicSystem.Desc = "TXT_KEY_DECISIONS_JFD_BYZANTIUM_ALEXIOS_REFORM_THEMATIC_SYSTEM_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_ByzantiumAlexios_ReformThematicSystem, "CIVILIZATION_JFD_BYZANTIUM_ALEXIOS")
	Decisions_JFD_ByzantiumAlexios_ReformThematicSystem.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationByzantiumAlexiosID then return false, false end
		if player:HasPolicy(policyByzantiumAlexiosThematicSystemID) then
			Decisions_JFD_ByzantiumAlexios_ReformThematicSystem.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BYZANTIUM_ALEXIOS_REFORM_THEMATIC_SYSTEM_ENACTED_DESC")
			return false, false, true 
		end
		local playerID = player:GetID()
		local goldCost = mathCeil((50*player:GetNumCities())*iMod)
		Decisions_JFD_ByzantiumAlexios_ReformThematicSystem.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BYZANTIUM_ALEXIOS_REFORM_THEMATIC_SYSTEM_DESC", goldCost)
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		local currentEraID = player:GetCurrentEra()
		if ((currentEraID >= eraMedievalID) and (player:GetGold() >= goldCost) and (player:IsGoldenAge())) then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_JFD_ByzantiumAlexios_ReformThematicSystem.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local goldCost = mathCeil((50*player:GetNumCities())*iMod)
		player:ChangeGold(-goldCost)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyByzantiumAlexiosThematicSystemID, true)
		player:ChangeNumResourceTotal(iMagistrate, -2)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationByzantiumAlexiosID, "Decisions_JFD_ByzantiumAlexios_ReformThematicSystem", Decisions_JFD_ByzantiumAlexios_ReformThematicSystem)
--=======================================================================================================================
--=======================================================================================================================
