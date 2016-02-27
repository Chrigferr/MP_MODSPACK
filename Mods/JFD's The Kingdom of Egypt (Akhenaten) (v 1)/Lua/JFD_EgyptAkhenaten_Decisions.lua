-- JFD_EgyptAkhenaten_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Egypt (Akhenaten) Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- MOD CHECKS
-------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingCPDLL
function JFD_IsUsingCPDLL()
	local cPDLLID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == cPDLLID) then
			return true
		end
	end
	return false
end
local isUsingCPDLL = JFD_IsUsingCPDLL()
-------------------------------------------------------------------------------------------------------------------------
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
local civilizationID  = GameInfoTypes["CIVILIZATION_JFD_EGYPT_AKHENATEN"]
local mathCeil = math.ceil
-------------------------------------------------------------------------------------------------------------------------
-- Egypt (Akhenaten): Declare Aten the One God
-------------------------------------------------------------------------------------------------------------------------
local policyDeclareAtenID = GameInfoTypes["POLICY_DECISIONS_JFD_DECLARE_ATEN"]
local Decisions_JFD_EgyptAkhenaten_DeclareAten = {}
	Decisions_JFD_EgyptAkhenaten_DeclareAten.Name = "TXT_KEY_DECISIONS_JFD_EGYPT_AKHENATEN_DECLARE_ATEN"
	Decisions_JFD_EgyptAkhenaten_DeclareAten.Desc = "TXT_KEY_DECISIONS_JFD_EGYPT_AKHENATEN_DECLARE_ATEN_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_EgyptAkhenaten_DeclareAten, "CIVILIZATION_JFD_EGYPT_AKHENATEN")
	Decisions_JFD_EgyptAkhenaten_DeclareAten.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyDeclareAtenID) then
			Decisions_JFD_EgyptAkhenaten_DeclareAten.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_EGYPT_AKHENATEN_DECLARE_ATEN_ENACTED_DESC")
			return false, false, true
		end
		local foodCost	= mathCeil(40*iMod)
		Decisions_JFD_EgyptAkhenaten_DeclareAten.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_EGYPT_AKHENATEN_DECLARE_ATEN_DESC", foodCost)
		if (not player:HasCreatedPantheon()) then return true, false end
		local capital = player:GetCapitalCity()
		if capital:GetFood() < foodCost then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_EgyptAkhenaten_DeclareAten.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local foodCost	= mathCeil(40*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:GetCapitalCity():ChangeFood(-foodCost)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyDeclareAtenID, true)
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_EGYPT_AKHENATEN_DECLARE_ATEN", player:GetName(), player:GetCivilizationShortDescription(), player:GetCivilizationAdjective()))
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_EgyptAkhenaten_DeclareAten", Decisions_JFD_EgyptAkhenaten_DeclareAten)
-------------------------------------------------------------------------------------------------------------------------
-- Egypt (Akhenaten): Construct the Gempaaten
-------------------------------------------------------------------------------------------------------------------------
local buildingGempaatenID = GameInfoTypes["BUILDING_DECISIONS_JFD_GEMPAATEN_ART"]
local Decisions_JFD_EgyptAkhenaten_Gempaaten = {}
	Decisions_JFD_EgyptAkhenaten_Gempaaten.Name = "TXT_KEY_DECISIONS_JFD_EGYPT_AKHENATEN_GEMPAATEN"
	Decisions_JFD_EgyptAkhenaten_Gempaaten.Desc = "TXT_KEY_DECISIONS_JFD_EGYPT_AKHENATEN_GEMPAATEN_DESC"
	Decisions_JFD_EgyptAkhenaten_Gempaaten.Pedia = "TXT_KEY_DECISIONS_JFD_GEMPAATEN_ART"
	HookDecisionCivilizationIcon(Decisions_JFD_EgyptAkhenaten_Gempaaten, "CIVILIZATION_JFD_EGYPT_AKHENATEN")
	Decisions_JFD_EgyptAkhenaten_Gempaaten.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if load(player, "Decisions_JFD_EgyptAkhenaten_Gempaaten") == true then
			Decisions_JFD_EgyptAkhenaten_Gempaaten.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_EGYPT_AKHENATEN_GEMPAATEN_ENACTED_DESC")
			return false, false, true 
		end
		local playerID = player:GetID()
		local goldCost = mathCeil(1300*iMod)
		Decisions_JFD_EgyptAkhenaten_Gempaaten.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_EGYPT_AKHENATEN_GEMPAATEN_DESC", goldCost)
		if player:GetReligionCreatedByPlayer() <= 0 then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetGold() < goldCost then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_EgyptAkhenaten_Gempaaten.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local goldCost = mathCeil(1300*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGold(-goldCost)
		if isUsingCPDLL then
			player:GetCapitalCity():SetNumFreeBuilding(buildingGempaatenID, 1)
		else
			player:GetCapitalCity():SetNumRealBuilding(buildingGempaatenID, 1)
		end
		save(player, "Decisions_JFD_EgyptAkhenaten_Gempaaten", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_EgyptAkhenaten_Gempaaten", Decisions_JFD_EgyptAkhenaten_Gempaaten)
--=======================================================================================================================
--=======================================================================================================================
