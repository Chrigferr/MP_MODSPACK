-- JFD_Vandals_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Vandals Decisions: loaded")
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
-- UTILS
------------------------------------------------------------------------------------------------------------------------
-- JFD_GetNumConqueredCapitals
function JFD_GetNumConqueredCapitals(playerID)
	local player = Players[playerID]
	local numCapitals = 0
	for city in player:Cities() do
		if (city:IsOriginalCapital() and city:GetOriginalOwner() ~= playerID) then
			numCapitals = numCapitals + 1
		end
	end
	return numCapitals
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
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_THE_VANDALS"]
local mathCeil = math.ceil
local resourceDignitariesID	= GameInfoTypes["RESOURCE_JFD_DIGNITARIES"]
--------------------------------------------------------------------------------------------------------------------------
-- Vandals: Become King of the Alans
-------------------------------------------------------------------------------------------------------------------------
local policyAlansID	= GameInfoTypes["POLICY_DECISIONS_JFD_ALANS"]
local resourceHorseID = GameInfoTypes["RESOURCE_HORSE"]
local Decisions_JFD_Vandals_Alans = {}
	Decisions_JFD_Vandals_Alans.Name = "TXT_KEY_DECISIONS_JFD_THE_VANDALS_ALANS"
	Decisions_JFD_Vandals_Alans.Desc = "TXT_KEY_DECISIONS_JFD_THE_VANDALS_ALANS_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_Vandals_Alans, "CIVILIZATION_JFD_THE_VANDALS")
	Decisions_JFD_Vandals_Alans.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyAlansID) then
			Decisions_JFD_Vandals_Alans.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_THE_VANDALS_ALANS_ENACTED_DESC")
			return false, false, true
		end
		local cultureCost = mathCeil(230*iMod)
		local resourceID = iMagistrate
		local resourceType = "[ICON_MAGISTRATES] Magistrates"
		if isUsingClaimsColonies then
			resourceID = resourceDignitariesID
			resourceType = "[ICON_JFD_DIGNITARY] Dignitaries"
		end
		Decisions_JFD_Vandals_Alans.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_THE_VANDALS_ALANS_DESC", cultureCost, resourceType)
		if player:GetNumCities() < 3 then return true, false end
		if player:GetJONSCulture() < cultureCost then return true, false end
		if player:GetNumResourceAvailable(resourceID, false) < 1 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Vandals_Alans.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local cultureCost = mathCeil(230*iMod)
		local resourceID = iMagistrate
		if isUsingClaimsColonies then
			resourceID = resourceDignitariesID
		end
		player:ChangeJONSCulture(-cultureCost)
		player:ChangeNumResourceTotal(resourceID, -1)
		player:ChangeNumResourceTotal(resourceHorseID, 2)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyAlansID, true)
		PreGame.SetCivilizationAdjective(playerID, "TXT_KEY_CIV_JFD_THE_VANDALS_AND_ALANS_ADJ")
		PreGame.SetCivilizationDescription(playerID, "TXT_KEY_CIV_JFD_THE_VANDALS_AND_ALANS_DESC")
		PreGame.SetCivilizationShortDescription(playerID, "TXT_KEY_CIV_JFD_THE_VANDALS_AND_ALANS_SHORT_DESC")
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_THE_VANDALS_ALANS", player:GetName()))
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_Vandals_Alans", Decisions_JFD_Vandals_Alans)
-------------------------------------------------------------------------------------------------------------------------
-- Vandals: Impose Religious Taxes
-------------------------------------------------------------------------------------------------------------------------
local buildingImposeReligiousTaxesID = GameInfoTypes["BUILDING_DECISIONS_JFD_VANDAL_TAXES"]
local Decisions_JFD_Vandals_ReligiousTaxes = {}
	Decisions_JFD_Vandals_ReligiousTaxes.Name = "TXT_KEY_DECISIONS_JFD_THE_VANDALS_IMPOSE_RELIGIOUS_TAXES"
	Decisions_JFD_Vandals_ReligiousTaxes.Desc = "TXT_KEY_DECISIONS_JFD_THE_VANDALS_IMPOSE_RELIGIOUS_TAXES_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_Vandals_ReligiousTaxes, "CIVILIZATION_JFD_THE_VANDALS")
	Decisions_JFD_Vandals_ReligiousTaxes.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if load(player, "Decisions_JFD_Vandals_ReligiousTaxes") == true then
			Decisions_JFD_Vandals_ReligiousTaxes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_THE_VANDALS_IMPOSE_RELIGIOUS_TAXES_ENACTED_DESC")
			return false, false, true
		end
		local goldCost = mathCeil(200*iMod)
		Decisions_JFD_Vandals_ReligiousTaxes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_THE_VANDALS_IMPOSE_RELIGIOUS_TAXES_DESC", goldCost)
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if JFD_GetNumConqueredCapitals(player:GetID()) == 0 then return true, false end
		if player:GetGold() < goldCost then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Vandals_ReligiousTaxes.DoFunc = (
	function(player)
		local goldCost = mathCeil(200*iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		for city in player:Cities() do
			city:SetNumRealBuilding(buildingImposeReligiousTaxesID, 1)
		end
		save(player, "Decisions_JFD_Vandals_ReligiousTaxes", true)
	end
	)
	
	Decisions_JFD_Vandals_ReligiousTaxes.Monitors = {}
	Decisions_JFD_Vandals_ReligiousTaxes.Monitors[GameEvents.PlayerDoTurn] =  (
	function(playerID)
		local player = Players[playerID]
		if player:GetCivilizationType() ~= civilizationID then return end
		if load(player, "Decisions_JFD_Vandals_ReligiousTaxes") == true then
			for city in pPlayer:Cities() do
				if (not city:IsHasBuilding(buildingImposeReligiousTaxesID)) then
					city:SetNumRealBuilding(buildingImposeReligiousTaxesID, 1)
				end
			end
		end
	end
	)

Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_Vandals_ReligiousTaxes", Decisions_JFD_Vandals_ReligiousTaxes)
--=======================================================================================================================
--=======================================================================================================================
