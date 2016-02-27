-- JFD_AustriaJosephII_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Austria (Joseph II) Decisions: loaded")
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
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_AUSTRIA_JOSEPH_II"]
local mathCeil = math.ceil
-------------------------------------------------------------------------------------------------------------------------
-- Austria (Joseph II): Centralize Medical Care
-------------------------------------------------------------------------------------------------------------------------
local eraIndustrialID	= GameInfoTypes["ERA_INDUSTRIAL"]
local buildingViennaGeneralID = GameInfoTypes["BUILDING_DECISIONS_JFD_VIENNA_HOSPITAL"]
local Decisions_JFD_AustriaJosephII_Hospital = {}
	Decisions_JFD_AustriaJosephII_Hospital.Name = "TXT_KEY_DECISIONS_JFD_AUSTRIA_JOSEPH_II_HOSPITAL"
	Decisions_JFD_AustriaJosephII_Hospital.Desc = "TXT_KEY_DECISIONS_JFD_AUSTRIA_JOSEPH_II_HOSPITAL_DESC"
	Decisions_JFD_AustriaJosephII_Hospital.Pedia = "TXT_KEY_DECISIONS_JFD_VIENNA_HOSPITAL"
	HookDecisionCivilizationIcon(Decisions_JFD_AustriaJosephII_Hospital, "CIVILIZATION_JFD_AUSTRIA_JOSEPH_II")
	Decisions_JFD_AustriaJosephII_Hospital.CanFunc = (
	function(player)
		local playerID = player:GetID()
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if load(player, "Decisions_JFD_AustriaJosephII_Hospital") == true then
			Decisions_JFD_AustriaJosephII_Hospital.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_AUSTRIA_JOSEPH_II_HOSPITAL_ENACTED_DESC")
			return false, false, true 
		end
		local goldCost = mathCeil(900*iMod)
		Decisions_JFD_AustriaJosephII_Hospital.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_AUSTRIA_JOSEPH_II_HOSPITAL_DESC", goldCost)
		if player:GetGold() < goldCost then return true, false end
		if player:GetCurrentEra() < eraIndustrialID then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_AustriaJosephII_Hospital.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local goldCost = mathCeil(900*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGold(-goldCost)
		player:GetCapitalCity():SetNumRealBuilding(buildingViennaGeneralID, 1)
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_AUSTRIA_JOSEPH_II_VIENNA_HOSPITAL", player:GetName(), player:GetCivilizationShortDescription(), player:GetCapitalCity():GetName())) 
		save(player, "Decisions_JFD_AustriaJosephII_Hospital", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_AustriaJosephII_Hospital", Decisions_JFD_AustriaJosephII_Hospital)
-------------------------------------------------------------------------------------------------------------------------
-- Austria (Joseph II): Uniform the Chancelleries
-------------------------------------------------------------------------------------------------------------------------
local policyChancelleriesID	= GameInfoTypes["POLICY_DECISIONS_JFD_AUSTRIA_JOSEPH_II_CHANCELLERIES"]
local Decisions_JFD_AustriaJosephII_Chancelleries = {}
	Decisions_JFD_AustriaJosephII_Chancelleries.Name = "TXT_KEY_DECISIONS_JFD_AUSTRIA_JOSEPH_II_CHANCELLERIES"
	Decisions_JFD_AustriaJosephII_Chancelleries.Desc = "TXT_KEY_DECISIONS_JFD_AUSTRIA_JOSEPH_II_CHANCELLERIES_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_AustriaJosephII_Chancelleries, "CIVILIZATION_JFD_AUSTRIA_JOSEPH_II")
	Decisions_JFD_AustriaJosephII_Chancelleries.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyChancelleriesID) then
			Decisions_JFD_AustriaJosephII_Chancelleries.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_AUSTRIA_JOSEPH_II_CHANCELLERIES_ENACTED_DESC")
			return false, false, true 
		end
		local cultureCost = mathCeil((player:GetNumCities()*50)* iMod)
		local eraDesc = "Industrial"
		local eraID = eraIndustrialID
		if isUsingEnlightenmentEra then
			eraDesc = "Enlightenment"
			eraID = GameInfoTypes["ERA_ENLIGHTENMENT"]
		end
		Decisions_JFD_AustriaJosephII_Chancelleries.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_AUSTRIA_JOSEPH_II_CHANCELLERIES_DESC", eraDesc, cultureCost)
		if player:GetJONSCulture() < cultureCost then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if player:GetCurrentEra() < eraID then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_AustriaJosephII_Chancelleries.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local cultureCost = mathCeil((player:GetNumCities()*50)* iMod)
		player:ChangeJONSCulture(-cultureCost)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		for city in player:Cities() do
			if (not city:IsCapital()) then
				city:ChangeResistanceTurns(1)
			end
		end
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyChancelleriesID, true)
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_AUSTRIA_JOSEPH_II_CHANCELLERIES", player:GetName(), player:GetCivilizationShortDescription())) 
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_AustriaJosephII_Chancelleries", Decisions_JFD_AustriaJosephII_Chancelleries)
--=======================================================================================================================
--=======================================================================================================================
