-- JFD_Bohemia_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's Bohemia Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if not (player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- EVENTS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_BOHEMIA"]
local mathCeil = math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- Bohemia: Czech Language
--------------------------------------------------------------------------------------------------------------------------
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"] 
local unitWriterID = GameInfoTypes["UNIT_WRITER"]
local Event_JFD_Bohemia_CzechLanguage = {}
	Event_JFD_Bohemia_CzechLanguage.Name = "TXT_KEY_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE"
	Event_JFD_Bohemia_CzechLanguage.Desc = "TXT_KEY_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE_DESC"
	Event_JFD_Bohemia_CzechLanguage.EventImage = 'Event_Bohemia_CzechLanguage.dds'
	Event_JFD_Bohemia_CzechLanguage.Weight = 10
	Event_JFD_Bohemia_CzechLanguage.CanFunc = (
		function(player)			
			if load(player, "Event_JFD_Bohemia_CzechLanguage") == true then return false end
			if player:GetCivilizationType() ~= civilizationID then return false end
			local goldCost = mathCeil(600*iMod)
			if player:GetGold() < goldCost then return false end
			if player:GetCurrentEra() < eraRenaissanceID then return false end
			Event_JFD_Bohemia_CzechLanguage.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE_DESC", goldCost)
			return true
		end
		)
	Event_JFD_Bohemia_CzechLanguage.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_Bohemia_CzechLanguage.Outcomes[1] = {}
	Event_JFD_Bohemia_CzechLanguage.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE_OUTCOME_1"
	Event_JFD_Bohemia_CzechLanguage.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE_OUTCOME_RESULT_1"
	Event_JFD_Bohemia_CzechLanguage.Outcomes[1].Weight = 5
	Event_JFD_Bohemia_CzechLanguage.Outcomes[1].CanFunc = (
		function(player)		
			local goldCost = mathCeil(600*iMod)
			Event_JFD_Bohemia_CzechLanguage.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE_OUTCOME_RESULT_1", goldCost)
			return true
		end
		)
	Event_JFD_Bohemia_CzechLanguage.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local capital = player:GetCapitalCity()
			local goldCost = mathCeil(600*iMod)
			player:ChangeGold(-goldCost)
			player:InitUnit(unitWriterID, capital:GetX(), capital:GetY())
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BOHEMIA_CZECH_LANGUAGE_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE_1", player:GetCivilizationShortDescription())) 
			save(player, "Event_JFD_Bohemia_CzechLanguage", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_Bohemia_CzechLanguage.Outcomes[2] = {}
	Event_JFD_Bohemia_CzechLanguage.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE_OUTCOME_2"
	Event_JFD_Bohemia_CzechLanguage.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE_OUTCOME_RESULT_2"
	Event_JFD_Bohemia_CzechLanguage.Outcomes[2].Weight = 0
	Event_JFD_Bohemia_CzechLanguage.Outcomes[2].CanFunc = (
		function(player)
			Event_JFD_Bohemia_CzechLanguage.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFD_Bohemia_CzechLanguage.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			player:ChangeNumResourceTotal(iMagistrate, 1)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BOHEMIA_CZECH_LANGUAGE_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE_2", player:GetCivilizationShortDescription(), player:GetName())) 
			save(player, "Event_JFD_Bohemia_CzechLanguage", true)
		end)
	
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_Bohemia_CzechLanguage", Event_JFD_Bohemia_CzechLanguage)
--------------------------------------------------------------------------------------------------------------------------
-- Bohemia: Defenestration of Prague
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_Bohemia_PragueDefenstration = {}
	Event_JFD_Bohemia_PragueDefenstration.Name = "TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION"
	Event_JFD_Bohemia_PragueDefenstration.Desc = "TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_DESC"
	Event_JFD_Bohemia_PragueDefenstration.EventImage = 'Event_Bohemia_Defenestration.dds'
	Event_JFD_Bohemia_PragueDefenstration.Weight = 10
	Event_JFD_Bohemia_PragueDefenstration.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilizationID then return false end
			if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
			Event_JFD_Bohemia_PragueDefenstration.Desc = "TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_DESC"
			return true
		end
		)
	Event_JFD_Bohemia_PragueDefenstration.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_Bohemia_PragueDefenstration.Outcomes[1] = {}
	Event_JFD_Bohemia_PragueDefenstration.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_OUTCOME_1"
	Event_JFD_Bohemia_PragueDefenstration.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_OUTCOME_RESULT_1"
	Event_JFD_Bohemia_PragueDefenstration.Outcomes[1].CanFunc = (
		function(player)
			Event_JFD_Bohemia_PragueDefenstration.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_Bohemia_PragueDefenstration.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			player:ChangeNumResourceTotal(iMagistrate, -1)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BOHEMIA_PRAGUE_DEFENESTRATION", player:GetCivilizationAdjective())) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_Bohemia_PragueDefenstration.Outcomes[2] = {}
	Event_JFD_Bohemia_PragueDefenstration.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_OUTCOME_2"
	Event_JFD_Bohemia_PragueDefenstration.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_OUTCOME_RESULT_2"
	Event_JFD_Bohemia_PragueDefenstration.Outcomes[2].CanFunc = (
		function(player)		
			local cultureCost = mathCeil(45*iMod)
			if player:GetJONSCulture() < cultureCost then return false end
			Event_JFD_Bohemia_PragueDefenstration.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_OUTCOME_RESULT_2", cultureCost)
			return true
		end
		)
	Event_JFD_Bohemia_PragueDefenstration.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cultureCost = mathCeil(45*iMod)
			player:ChangeNumResourceTotal(iMagistrate, -1)
			player:ChangeJONSCulture(-cultureCost)			
			player:GetCapitalCity():ChangeWeLoveTheKingDayCounter(5)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BOHEMIA_PRAGUE_DEFENESTRATION", player:GetCivilizationAdjective())) 
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_Bohemia_PragueDefenstration.Outcomes[3] = {}
	Event_JFD_Bohemia_PragueDefenstration.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_OUTCOME_3"
	Event_JFD_Bohemia_PragueDefenstration.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_OUTCOME_RESULT_3"
	Event_JFD_Bohemia_PragueDefenstration.Outcomes[3].CanFunc = (
		function(player)		
			local cultureReward = mathCeil(55*iMod)
			Event_JFD_Bohemia_PragueDefenstration.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_OUTCOME_RESULT_3", cultureReward)
			return true
		end
		)
	Event_JFD_Bohemia_PragueDefenstration.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cultureReward = mathCeil(55*iMod)
			player:GetCapitalCity():ChangeResistanceTurns(1)
			player:ChangeJONSCulture(cultureReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BOHEMIA_PRAGUE_DEFENESTRATION", player:GetCivilizationAdjective())) 
		end)
	
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_Bohemia_PragueDefenstration", Event_JFD_Bohemia_PragueDefenstration)
--=======================================================================================================================
--=======================================================================================================================


