-- JFD_Belgium_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's Belgium Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILS
------------------------------------------------------------------------------------------------------------------------
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
-- EVENTS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_BELGIUM"]
local mathCeil = math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- Belgium: Linguistic Tensions
--------------------------------------------------------------------------------------------------------------------------
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"] 
local languageTension = nil
local Event_JFD_Belgium_Tensions = {}
	Event_JFD_Belgium_Tensions.Name = "TXT_KEY_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS"
	Event_JFD_Belgium_Tensions.Desc = "TXT_KEY_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS_DESC"
	Event_JFD_Belgium_Tensions.EventImage = 'Event_Belgium_Tensions.dds'
	Event_JFD_Belgium_Tensions.Weight = 5
	Event_JFD_Belgium_Tensions.CanFunc = (
		function(player)	
			if player:GetCivilizationType() ~= civilizationID then return false end
			local language = {}
				language[1] = "Picard"
				language[2] = "French"
				language[3] = "Walloon"
			languageTension = language[GetRandom(1,3)]
			Event_JFD_Belgium_Tensions.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS_DESC", languageTension)
			if player:GetCurrentEra() < eraMedievalID then return false end
			return true
		end
		)
	Event_JFD_Belgium_Tensions.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_Belgium_Tensions.Outcomes[1] = {}
	Event_JFD_Belgium_Tensions.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS_OUTCOME_1"
	Event_JFD_Belgium_Tensions.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS_OUTCOME_RESULT_1"
	Event_JFD_Belgium_Tensions.Outcomes[1].CanFunc = (
		function(player)			
			local cultureReward = mathCeil(50*iMod)
			Event_JFD_Belgium_Tensions.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS_OUTCOME_RESULT_1", cultureReward)
			return true
		end
		)
	Event_JFD_Belgium_Tensions.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cultureReward = mathCeil(50*iMod)
			player:GetCapitalCity():ChangeResistanceTurns(1)
			player:ChangeJONSCulture(cultureReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BELGIUM_LINGUISTIC_TENSIONS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS", languageTension, player:GetCivilizationShortDescription())) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_Belgium_Tensions.Outcomes[2] = {}
	Event_JFD_Belgium_Tensions.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS_OUTCOME_2"
	Event_JFD_Belgium_Tensions.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS_OUTCOME_RESULT_2"
	Event_JFD_Belgium_Tensions.Outcomes[2].CanFunc = (
		function(player)			
			local goldenAgeCost = mathCeil((player:GetGoldenAgeProgressMeter()*20)/100)
			Event_JFD_Belgium_Tensions.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS_OUTCOME_RESULT_2", goldenAgeCost)
			return true
		end
		)
	Event_JFD_Belgium_Tensions.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldenAgeCost = mathCeil((player:GetGoldenAgeProgressMeter()*20)/100)
			player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BELGIUM_LINGUISTIC_TENSIONS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS", languageTension, player:GetCivilizationShortDescription())) 
		end)
	
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_Belgium_Tensions", Event_JFD_Belgium_Tensions)
--------------------------------------------------------------------------------------------------------------------------
-- Belgium: Profitable Year
--------------------------------------------------------------------------------------------------------------------------
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local improvementBelgianPlantationID = GameInfoTypes["IMPROVEMENT_JFD_BELGIAN_PLANTATION"]
local improvementPlantationID = GameInfoTypes["IMPROVEMENT_PLANTATION"]
local Event_JFD_Belgium_Profits = {}
	Event_JFD_Belgium_Profits.Name = "TXT_KEY_EVENT_JFD_BELGIUM_PROFITS"
	Event_JFD_Belgium_Profits.Desc = "TXT_KEY_EVENT_JFD_BELGIUM_PROFITS_DESC"
	Event_JFD_Belgium_Profits.EventImage = 'Event_Belgium_Profits.dds'
	Event_JFD_Belgium_Profits.Weight = 5
	Event_JFD_Belgium_Profits.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilizationID then return false end
			if (player:GetImprovementCount(improvementBelgianPlantationID) == 0 and player:GetImprovementCount(improvementPlantationID) == 0) then return false end
			if player:GetCurrentEra() < eraRenaissanceID then return false end
			return true
		end
		)
	Event_JFD_Belgium_Profits.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_Belgium_Profits.Outcomes[1] = {}
	Event_JFD_Belgium_Profits.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_BELGIUM_PROFITS_OUTCOME_1"
	Event_JFD_Belgium_Profits.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_BELGIUM_PROFITS_OUTCOME_RESULT_1"
	Event_JFD_Belgium_Profits.Outcomes[1].CanFunc = (
		function(player)			
			local improvementCount = (player:GetImprovementCount(improvementBelgianPlantationID) + player:GetImprovementCount(improvementPlantationID))
			local goldReward = mathCeil((improvementCount)*5)
			Event_JFD_Belgium_Profits.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BELGIUM_PROFITS_OUTCOME_RESULT_1", goldReward)
			return true
		end
		)
	Event_JFD_Belgium_Profits.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local improvementCount = (player:GetImprovementCount(improvementBelgianPlantationID)+player:GetImprovementCount(improvementPlantationID))
			local goldReward = mathCeil((improvementCount)*5)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BELGIUM_PROFITABLE_YEAR_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BELGIUM_PROFITS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BELGIUM_PROFITABLE_YEAR", player:GetCivilizationShortDescription())) 
		end)
	
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_Belgium_Profits", Event_JFD_Belgium_Profits)
--=======================================================================================================================
--=======================================================================================================================


