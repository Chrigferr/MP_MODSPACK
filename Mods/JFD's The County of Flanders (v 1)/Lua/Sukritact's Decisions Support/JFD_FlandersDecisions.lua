-- JFD_FlandersDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Flanders Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_SendWorldEvent
------------------------------------------------------------------------------------------------------------------------
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
local activePlayerTeam  = Teams[Game.GetActiveTeam()]
local civilisationID 	= GameInfoTypes["CIVILIZATION_JFD_FLANDERS"]
local mathCeil 			= math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- Flanders: Commission ClothTrade
-------------------------------------------------------------------------------------------------------------------------
local policyClothTradeID 	= GameInfoTypes["POLICY_JFD_FLANDERS_CLOTH_TRADE"]
local techCurrencyID 		= GameInfoTypes["TECH_CURRENCY"]

local Decisions_ClothTrade = {}
	Decisions_ClothTrade.Name = "TXT_KEY_DECISIONS_JFD_FLANDERS_CLOTH_TRADE"
	Decisions_ClothTrade.Desc = "TXT_KEY_DECISIONS_JFD_FLANDERS_CLOTH_TRADE_DESC"
	HookDecisionCivilizationIcon(Decisions_ClothTrade, "CIVILIZATION_JFD_FLANDERS")
	Decisions_ClothTrade.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end

		if load(player, "Decisions_ClothTrade") == true then
			Decisions_ClothTrade.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FLANDERS_CLOTH_TRADE_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = mathCeil(500 * iMod)
		Decisions_ClothTrade.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FLANDERS_CLOTH_TRADE_DESC", goldCost)
		if (not activePlayerTeam:IsHasTech(techCurrencyID)) 		then return true, false end
		if player:GetGold() < goldCost								then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end

		return true, true
	end
	)
	
	Decisions_ClothTrade.DoFunc = (
	function(player)
		local goldCost = mathCeil(500 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyClothTradeID, true)
		save(player, "Decisions_ClothTrade", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_ClothTrade", Decisions_ClothTrade)
-------------------------------------------------------------------------------------------------------------------------
-- Flanders: Patronise Baroque Painters
-------------------------------------------------------------------------------------------------------------------------
local eraRenaissanceID  = GameInfoTypes["ERA_RENAISSANCE"]
local unitBaroquePainterID = GameInfoTypes["UNIT_JFD_FLEMISH_PAINTER"]

local Decisions_BaroquePainting = {}
	Decisions_BaroquePainting.Name = "TXT_KEY_DECISIONS_JFD_FLANDERS_BAROQUE_PAINTING"
	Decisions_BaroquePainting.Desc = "TXT_KEY_DECISIONS_JFD_FLANDERS_BAROQUE_PAINTING_DESC"
	HookDecisionCivilizationIcon(Decisions_BaroquePainting, "CIVILIZATION_JFD_FLANDERS")
	Decisions_BaroquePainting.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end

		if load(player, "Decisions_BaroquePainting") == true then
			Decisions_BaroquePainting.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FLANDERS_BAROQUE_PAINTING_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = mathCeil(365 * iMod)
		Decisions_BaroquePainting.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FLANDERS_BAROQUE_PAINTING_DESC", goldCost)
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID 				then return true, false end
		
		return true, true
	end
	)
	
	Decisions_BaroquePainting.DoFunc = (
	function(player)
		local goldCost = mathCeil(365 * iMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGold(-goldCost)
		player:InitUnit(unitBaroquePainterID, player:GetCapitalCity():GetX(), player:GetCapitalCity():GetY())
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_FLANDERS_BAROQUE_PAINTING"))
		save(player, "Decisions_BaroquePainting", true)
	end
	)

Decisions_AddCivilisationSpecific(civilisationID, "Decisions_BaroquePainting", Decisions_BaroquePainting)
--=======================================================================================================================
--=======================================================================================================================
