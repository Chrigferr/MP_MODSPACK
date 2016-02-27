-- JFD_Saxony_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Saxony Decisions: loaded")
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("FLuaVector.lua")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetEraAdjustedValue
local mathCeil = math.ceil
function JFD_GetEraAdjustedValue(playerID, num)
	local player = Players[playerID]
	local currentEraID = player:GetCurrentEra()
	local eraMod = GameInfo.Eras[currentEraID].ResearchAgreementCost
	return mathCeil(num * eraMod/100)
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
--------------------------------------------------------------------------------------------------------------------------
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- isUsingCPDLL
function JFD_IsUsingCPDLL()
	local cPDLLModID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == cPDLLModID) then
			return true
		end
	end
	return false
end
local isUsingCPDLL = JFD_IsUsingCPDLL()

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
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_SAXONY"]
-------------------------------------------------------------------------------------------------------------------------
-- Saxony: Sponsor Porcelain Manufactory
-------------------------------------------------------------------------------------------------------------------------
local resourcePorcelainID = GameInfoTypes["RESOURCE_PORCELAIN"]
local techChemistryID	= GameInfoTypes["TECH_CHEMISTRY"]
local Decisions_JFD_Saxony_Porcelain = {}
	Decisions_JFD_Saxony_Porcelain.Name = "TXT_KEY_DECISIONS_JFD_SAXONY_PORCELAIN"
	Decisions_JFD_Saxony_Porcelain.Desc = "TXT_KEY_DECISIONS_JFD_SAXONY_PORCELAIN_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_Saxony_Porcelain, "CIVILIZATION_JFD_SAXONY")
	Decisions_JFD_Saxony_Porcelain.CanFunc = (
	function(player)
		local playerID = player:GetID()
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if load(player, "Decisions_JFD_Saxony_Porcelain") == true then
			Decisions_JFD_Saxony_Porcelain.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SAXONY_PORCELAIN_ENACTED_DESC")
			return false, false, true 
		end
		local magistrateCost = 1
		local goldCost = mathCeil(900*iMod)
		Decisions_JFD_Saxony_Porcelain.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SAXONY_PORCELAIN_DESC", goldCost)
		if player:GetGold() < goldCost then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techChemistryID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Saxony_Porcelain.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local goldCost = mathCeil(900*iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(resourcePorcelainID, 2)
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SAXONY_PORCELAIN", player:GetName(), player:GetCivilizationShortDescription())) 
		save(player, "Decisions_JFD_Saxony_Porcelain", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_Saxony_Porcelain", Decisions_JFD_Saxony_Porcelain)
-------------------------------------------------------------------------------------------------------------------------
-- Saxony: Found the Order of the White Eagle
-------------------------------------------------------------------------------------------------------------------------
local eraEnlightenmentID = GameInfoTypes["ERA_ENLIGHTENMENT"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local policyWhiteEagleID = GameInfoTypes["POLICY_DECISIONS_JFD_SAXONY_WHITE_EAGLE"]
local unitPromotionWhiteEagleID = GameInfoTypes["PROMOTION_JFD_SAXONY_WHITE_EAGLE"]
local Decisions_JFD_Saxony_WhiteEagle = {}
	Decisions_JFD_Saxony_WhiteEagle.Name = "TXT_KEY_DECISIONS_JFD_SAXONY_WHITE_EAGLE"
	Decisions_JFD_Saxony_WhiteEagle.Desc = "TXT_KEY_DECISIONS_JFD_SAXONY_WHITE_EAGLE_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_Saxony_WhiteEagle, "CIVILIZATION_JFD_SAXONY")
	Decisions_JFD_Saxony_WhiteEagle.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyWhiteEagleID) then
			Decisions_JFD_Saxony_WhiteEagle.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SAXONY_WHITE_EAGLE_ENACTED_DESC")
			return false, false, true 
		end
		local cultureCost = mathCeil(500*iMod)
		local eraID = eraRenaissanceID
		local eraDesc = "Renaissance Era"
		if isUsingEnlightenmentEra then
			eraID = eraEnlightenmentID
			eraDesc = "Enlightenment Era"
		end
		Decisions_JFD_Saxony_WhiteEagle.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SAXONY_WHITE_EAGLE_DESC", eraDesc, cultureCost)
		if player:GetCurrentEra() < eraID then return true, false end
		if player:GetJONSCulture() < cultureCost then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Saxony_WhiteEagle.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local cultureCost = mathCeil(500*iMod)
		player:ChangeJONSCulture(-cultureCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyWhiteEagleID, true)
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SAXONY_WHITE_EAGLE", player:GetName(), player:GetCivilizationShortDescription())) 
	end
	)
	
	if isUsingCPDLL then
		Decisions_JFD_Saxony_WhiteEagle.Monitors = {}
		Decisions_JFD_Saxony_WhiteEagle.Monitors[GameEvents.UnitCreated] =  (
		function(playerID, unitID, unitTypeID, plotX, plotY)
			local player = Players[playerID]
			if player:HasPolicy(policyWhiteEagleID) then
				local unit = player:GetUnitByID(unitID)
				if (unit:IsGreatPerson() and (not unit:HasPromotion(unitPromotionWhiteEagleID))) then
					local reward = JFD_GetEraAdjustedValue(playerID, mathCeil(100*iMod))
					player:ChangeGoldenAgeProgressMeter(reward)
					if player:IsHuman() then
						local hex = ToHexFromGrid(Vector2(plotX, plotY))
						Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("+{1_Num} [ICON_GOLDEN_AGE]", reward), true)
						Events.GameplayFX(hex.x, hex.y, -1)	
					end
					unit:SetHasPromotion(unitPromotionWhiteEagleID, true)
				end
			end
		end
		)
	else
		Decisions_JFD_Saxony_WhiteEagle.Monitors = {}
		Decisions_JFD_Saxony_WhiteEagle.Monitors[Events.SerialEventUnitCreated] =  (
		function(playerID, unitID)
			local player = Players[playerID]
			if player:HasPolicy(policyWhiteEagleID) then
				local unit = player:GetUnitByID(unitID)
				if (unit:IsGreatPerson() and (not unit:IsHasPromotion(unitPromotionWhiteEagleID))) then
					local reward = JFD_GetEraAdjustedValue(playerID, mathCeil(100*iMod))
					player:ChangeGoldenAgeProgressMeter(reward)
					if player:IsHuman() then
						local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
						Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("+{1_Num} [ICON_GOLDEN_AGE]", reward), true)
						Events.GameplayFX(hex.x, hex.y, -1)	
					end
					unit:SetHasPromotion(unitPromotionWhiteEagleID, true)
				end
			end
		end
		)
	end
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_Saxony_WhiteEagle", Decisions_JFD_Saxony_WhiteEagle)
--=======================================================================================================================
--=======================================================================================================================
