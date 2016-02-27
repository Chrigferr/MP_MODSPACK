-- JFD_RussiaPeter_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's Russia (Peter) Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILITIES
------------------------------------------------------------------------------------------------------------------------
--JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- EVENTS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_RUSSIA_PETER"]
local mathCeil = math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- Russia (Peter): The Grand Embassy
--------------------------------------------------------------------------------------------------------------------------
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local policyGrandEmbassy1ID = GameInfoTypes["POLICY_EVENTS_JFD_RUSSIA_PETER_GRAND_EMBASSY_1"]
local policyGrandEmbassy2ID = GameInfoTypes["POLICY_EVENTS_JFD_RUSSIA_PETER_GRAND_EMBASSY_2"]
local policyGrandEmbassy3ID = GameInfoTypes["POLICY_EVENTS_JFD_RUSSIA_PETER_GRAND_EMBASSY_3"]
local Event_JFD_RussiaPeter_GrandEmbassy = {}
	Event_JFD_RussiaPeter_GrandEmbassy.Name = "TXT_KEY_EVENT_JFD_RUSSIA_PETER_GRAND_EMBASSY"
	Event_JFD_RussiaPeter_GrandEmbassy.Desc = "TXT_KEY_EVENT_JFD_RUSSIA_PETER_GRAND_EMBASSY_DESC"
	Event_JFD_RussiaPeter_GrandEmbassy.Weight = 10
	Event_JFD_RussiaPeter_GrandEmbassy.CanFunc = (
		function(player)			
			if player:HasPolicy(policyGrandEmbassy1ID) then return false end
			if player:HasPolicy(policyGrandEmbassy2ID) then return false end
			if player:HasPolicy(policyGrandEmbassy3ID) then return false end
			if player:GetCivilizationType() ~= civilizationID then return false end
			if player:GetCurrentEra() < eraRenaissanceID then return false end
			return true
		end
		)
	Event_JFD_RussiaPeter_GrandEmbassy.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RussiaPeter_GrandEmbassy.Outcomes[1] = {}
	Event_JFD_RussiaPeter_GrandEmbassy.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_RUSSIA_PETER_GRAND_EMBASSY_OUTCOME_1"
	Event_JFD_RussiaPeter_GrandEmbassy.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_RUSSIA_PETER_GRAND_EMBASSY_OUTCOME_RESULT_1"
	Event_JFD_RussiaPeter_GrandEmbassy.Outcomes[1].Weight = 5
	Event_JFD_RussiaPeter_GrandEmbassy.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFD_RussiaPeter_GrandEmbassy.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PETER_GRAND_EMBASSY_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_RussiaPeter_GrandEmbassy.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyGrandEmbassy1ID, true)

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RUSSIA_PETER_GRAND_EMBASSY_OUTCOME_RESULT_1_NOTIFICATION", player:GetCivilizationDescription()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PETER_GRAND_EMBASSY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_RUSSIA_PETER_GRAND_EMBASSY_1", player:GetName(), player:GetCivilizationShortDescription())) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RussiaPeter_GrandEmbassy.Outcomes[2] = {}
	Event_JFD_RussiaPeter_GrandEmbassy.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_RUSSIA_PETER_GRAND_EMBASSY_OUTCOME_2"
	Event_JFD_RussiaPeter_GrandEmbassy.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_RUSSIA_PETER_GRAND_EMBASSY_OUTCOME_RESULT_2"
	Event_JFD_RussiaPeter_GrandEmbassy.Outcomes[2].Weight = 5
	Event_JFD_RussiaPeter_GrandEmbassy.Outcomes[2].CanFunc = (
		function(player)			
			Event_JFD_RussiaPeter_GrandEmbassy.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PETER_GRAND_EMBASSY_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFD_RussiaPeter_GrandEmbassy.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyGrandEmbassy2ID, true)
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RUSSIA_PETER_GRAND_EMBASSY_OUTCOME_RESULT_2_NOTIFICATION", player:GetCivilizationDescription()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PETER_GRAND_EMBASSY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_RUSSIA_PETER_GRAND_EMBASSY_2", player:GetName(), player:GetCivilizationShortDescription())) 
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_RussiaPeter_GrandEmbassy.Outcomes[3] = {}
	Event_JFD_RussiaPeter_GrandEmbassy.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_RUSSIA_PETER_GRAND_EMBASSY_OUTCOME_3"
	Event_JFD_RussiaPeter_GrandEmbassy.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_RUSSIA_PETER_GRAND_EMBASSY_OUTCOME_RESULT_3"
	Event_JFD_RussiaPeter_GrandEmbassy.Outcomes[3].Weight = 5
	Event_JFD_RussiaPeter_GrandEmbassy.Outcomes[3].CanFunc = (
		function(player)			
			Event_JFD_RussiaPeter_GrandEmbassy.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PETER_GRAND_EMBASSY_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_JFD_RussiaPeter_GrandEmbassy.Outcomes[3].DoFunc = (
		function(player)
			local playerID = player:GetID()
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyGrandEmbassy3ID, true)
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RUSSIA_PETER_GRAND_EMBASSY_OUTCOME_RESULT_3_NOTIFICATION", player:GetCivilizationDescription()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PETER_GRAND_EMBASSY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_RUSSIA_PETER_GRAND_EMBASSY_3", player:GetName(), player:GetCivilizationShortDescription())) 
		end)

Events_AddCivilisationSpecific(civilizationID, "Event_JFD_RussiaPeter_GrandEmbassy", Event_JFD_RussiaPeter_GrandEmbassy)
--------------------------------------------------------------------------------------------------------------------------
-- Russia (Peter): The Bulavin Rebellion
--------------------------------------------------------------------------------------------------------------------------
local playerBarbarian = Players[63]
local eraIndustrialID = GameInfoTypes["ERA_INDUSTRIAL"]
local unitCossackID = GameInfoTypes["UNIT_RUSSIAN_COSSACK"]
local Event_JFD_RussiaPeter_BulavinRebellion = {}
	Event_JFD_RussiaPeter_BulavinRebellion.Name = "TXT_KEY_EVENT_JFD_RUSSIA_PETER_BULAVIN_REBELLION"
	Event_JFD_RussiaPeter_BulavinRebellion.Desc = "TXT_KEY_EVENT_JFD_RUSSIA_PETER_BULAVIN_REBELLION_DESC"
	Event_JFD_RussiaPeter_BulavinRebellion.Weight = 5
	Event_JFD_RussiaPeter_BulavinRebellion.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilizationID then return false end	
			if player:GetCurrentEra() ~= eraIndustrialID then return false end		
			local goldCost = mathCeil(230*iMod)
			if player:GetGold() < goldCost then return false end
			local cultureCost = mathCeil(120*iMod)
			if player:GetJONSCulture() < cultureCost then return false end
			return true
		end
		)
	Event_JFD_RussiaPeter_BulavinRebellion.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RussiaPeter_BulavinRebellion.Outcomes[1] = {}
	Event_JFD_RussiaPeter_BulavinRebellion.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_RUSSIA_PETER_BULAVIN_REBELLION_OUTCOME_1"
	Event_JFD_RussiaPeter_BulavinRebellion.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_RUSSIA_PETER_BULAVIN_REBELLION_OUTCOME_RESULT_1"
	Event_JFD_RussiaPeter_BulavinRebellion.Outcomes[1].Weight = 5
	Event_JFD_RussiaPeter_BulavinRebellion.Outcomes[1].CanFunc = (
		function(player)
			Event_JFD_RussiaPeter_BulavinRebellion.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PETER_BULAVIN_REBELLION_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_RussiaPeter_BulavinRebellion.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local capital = player:GetCapitalCity()
			local plotX = capital:GetX() + GetRandom(1,3)
			local plotY = capital:GetY() + GetRandom(1,3)
			if unitCossackID then
				playerBarbarian:InitUnit(unitCossackID, plotX, plotY):JumpToNearestValidPlot()
				playerBarbarian:InitUnit(unitCossackID, plotX, plotY):JumpToNearestValidPlot()
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RUSSIA_PETER_BULAVIN_REBELLION_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PETER_BULAVIN_REBELLION"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_RUSSIA_PETER_BULAVIN_REBELLION_1", player:GetName(), player:GetCivilizationShortDescription())) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RussiaPeter_BulavinRebellion.Outcomes[2] = {}
	Event_JFD_RussiaPeter_BulavinRebellion.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_RUSSIA_PETER_BULAVIN_REBELLION_OUTCOME_2"
	Event_JFD_RussiaPeter_BulavinRebellion.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_RUSSIA_PETER_BULAVIN_REBELLION_OUTCOME_RESULT_2"
	Event_JFD_RussiaPeter_BulavinRebellion.Outcomes[2].Weight = 1
	Event_JFD_RussiaPeter_BulavinRebellion.Outcomes[2].CanFunc = (
		function(player)			
			local goldCost = mathCeil(230*iMod)
			local cultureCost = mathCeil(120*iMod)
			Event_JFD_RussiaPeter_BulavinRebellion.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PETER_BULAVIN_REBELLION_OUTCOME_RESULT_2", goldCost, cultureCost)
			return true
		end
		)
	Event_JFD_RussiaPeter_BulavinRebellion.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = mathCeil(230*iMod)
			local cultureCost = mathCeil(120*iMod)
			player:ChangeGold(-goldCost)
			player:ChangeJONSCulture(-cultureCost)
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RUSSIA_PETER_BULAVIN_REBELLION_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PETER_BULAVIN_REBELLION"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_RUSSIA_PETER_BULAVIN_REBELLION_2", player:GetName(), player:GetCivilizationShortDescription())) 
		end)
	
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_RussiaPeter_BulavinRebellion", Event_JFD_RussiaPeter_BulavinRebellion)
--=======================================================================================================================
--=======================================================================================================================


