-- JFD_RussiaPutin_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's Russia (Putin) Events: loaded")
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
-- EVENTS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_RUSSIA_PUTIN"]
local mathCeil		 = math.ceil
--------------------------------------------------------------------------------------------------------------------------
--  Russia (Putin): Strongman Competition
--------------------------------------------------------------------------------------------------------------------------
local eventStrongmanPlayerID = nil
local Event_JFD_RussiaPutin_Strongman = {}
	Event_JFD_RussiaPutin_Strongman.Name = "TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_STRONGMAN"
	Event_JFD_RussiaPutin_Strongman.Desc = "TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_STRONGMAN_DESC"
	Event_JFD_RussiaPutin_Strongman.EventImage = 'Event_RussiaPutin_Strongman.dds'
	Event_JFD_RussiaPutin_Strongman.Weight = 10
	Event_JFD_RussiaPutin_Strongman.CanFunc = (
		function (player)			
			if player:GetCivilizationType() ~= civilizationID then return false end
			local playerID = player:GetID()
			local playerTeam = Teams[player:GetTeam()]
			local competingPlayers = {}
			local count = 1
			for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
				local otherPlayer = Players[otherPlayerID]
				local otherPlayerTeamID = otherPlayer:GetTeam()
				if (otherPlayerID ~= playerID and playerTeam:IsHasMet(otherPlayerTeamID) and (not playerTeam:IsAtWar(otherPlayerTeamID) and (not otherPlayer:IsDenouncedPlayer(playerID)) and (not otherPlayer:IsDenouncingPlayer(playerID)))) then
					competingPlayers[count] = otherPlayerID
					count = count + 1	
				end
			end
			eventStrongmanPlayerID = competingPlayers[JFD_GetRandom(1, #competingPlayers)]
			if (not eventStrongmanPlayerID) then return false end
			local competingPlayer = Players[eventStrongmanPlayerID]
			Event_JFD_RussiaPutin_Strongman.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_STRONGMAN_DESC", competingPlayer:GetName(), competingPlayer:GetCivilizationShortDescription())
			return true
		end
		)
	Event_JFD_RussiaPutin_Strongman.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RussiaPutin_Strongman.Outcomes[1] = {}
	Event_JFD_RussiaPutin_Strongman.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_STRONGMAN_OUTCOME_1"
	Event_JFD_RussiaPutin_Strongman.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_STRONGMAN_OUTCOME_RESULT_1"
	Event_JFD_RussiaPutin_Strongman.Outcomes[1].CanFunc = (
		function(player)	
			local goldenAgeCost = mathCeil(player:GetGoldenAgeProgressMeter()*30/100)
			Event_JFD_RussiaPutin_Strongman.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_STRONGMAN_OUTCOME_RESULT_1", goldenAgeCost)
			return true
		end
		)
	Event_JFD_RussiaPutin_Strongman.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local competingPlayer = Players[eventStrongmanPlayerID]
			if GetRandom(1,10) <= 5 then
				local goldenAgeCost = mathCeil(player:GetGoldenAgeProgressMeter()*30/100)
				player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RUSSIA_PUTIN_STRONGMAN_OUTCOME_RESULT_1_NOTIFICATION", competingPlayer:GetName(), competingPlayer:GetCivilizationShortDescription()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_STRONGMAN"))
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_RUSSIA_PUTIN_STRONGMAN", competingPlayer:GetName(), competingPlayer:GetCivilizationShortDescription()))
			else
				for city in player:Cities() do
					city:ChangeWeLoveTheKingDayCounter(5)
				end
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RUSSIA_PUTIN_STRONGMAN_OUTCOME_RESULT_1_ALT_NOTIFICATION", competingPlayer:GetName(), competingPlayer:GetCivilizationShortDescription()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_STRONGMAN"))
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_RUSSIA_PUTIN_STRONGMAN_ALT", competingPlayer:GetName(), competingPlayer:GetCivilizationShortDescription()))
			end
		end)

Events_AddCivilisationSpecific(civilizationID, "Event_JFD_RussiaPutin_Strongman", Event_JFD_RussiaPutin_Strongman)
--------------------------------------------------------------------------------------------------------------------------
-- Russia (Putin): Emo Plague
--------------------------------------------------------------------------------------------------------------------------
local colourBlackID = GameInfoTypes["COLOR_BLACK"]
local emoBands = {"Mayday Parade", "My Chemical Romance", "Blink 182", "Fall Out Boy", "Armor for Sleep", "Flyleaf", "A Day to Remember", "Sum 41", "Simple Plan", "Taking Back Sunday", "State Champs", "All Time Low"}
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local eventEmoCity = nil
local policyRussiaPutinEmos = GameInfoTypes["POLICY_EVENTS_JFD_RUSSIA_PUTIN_EMO_PLAGUE"]
local Event_JFD_RussiaPutin_EmoPlague = {}
	Event_JFD_RussiaPutin_EmoPlague.Name = "TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_EMOS"
	Event_JFD_RussiaPutin_EmoPlague.Desc = "TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_EMOS_DESC"
	Event_JFD_RussiaPutin_EmoPlague.EventImage = 'Event_RussiaPutin_EmoPlague.dds'
	Event_JFD_RussiaPutin_EmoPlague.Weight = 5
	Event_JFD_RussiaPutin_EmoPlague.CanFunc = (
		function(player)			
			if player:HasPolicy(policyRussiaPutinEmos) then return false end
			if load(player, "Event_JFD_RussiaPutin_EmoPlague") == true then return false end
			if player:GetCivilizationType() ~= civilizationID then return false end
			if player:GetCurrentEra() < eraRenaissanceID then return false end
			local cities = {}
			local count = 1
			for city in player:Cities() do
				if city:GetPopulation() > 2 then
					cities[count] = city
					count = count + 1	
				end
			end
			local emoBand = emoBands[GetRandom(1, #emoBands)]
			eventEmoCity = cities[GetRandom(1, #cities)]
			if (not eventEmoCity) then return false end
			Event_JFD_RussiaPutin_EmoPlague.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_EMOS_DESC", eventEmoCity:GetName(), emoBand)
			return true
		end
		)
	Event_JFD_RussiaPutin_EmoPlague.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RussiaPutin_EmoPlague.Outcomes[1] = {}
	Event_JFD_RussiaPutin_EmoPlague.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_EMOS_OUTCOME_1"
	Event_JFD_RussiaPutin_EmoPlague.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_EMOS_OUTCOME_RESULT_1"
	Event_JFD_RussiaPutin_EmoPlague.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFD_RussiaPutin_EmoPlague.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_EMOS_OUTCOME_RESULT_1", eventEmoCity:GetName())
			return true
		end
		)
	Event_JFD_RussiaPutin_EmoPlague.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyRussiaPutinEmos, true)
			eventEmoCity:ChangePopulation(-2, true)
			PreGame.SetPlayerColor(playerID, colourBlackID)
			Events.SerialEventCityInfoDirty()
			local count = 1
			for city in player:Cities() do
				local cityName = "TXT_KEY_JFD_RUSSIA_PUTIN_EMO_CITY_NAME_" .. count
				city:SetName(cityName)
				count = count + 1
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RUSSIA_PUTIN_EMOS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_EMOS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENT_RUSSIA_PUTIN_EMOS_1")) 
			save(player, "Event_JFD_RussiaPutin_EmoPlague", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RussiaPutin_EmoPlague.Outcomes[2] = {}
	Event_JFD_RussiaPutin_EmoPlague.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_EMOS_OUTCOME_2"
	Event_JFD_RussiaPutin_EmoPlague.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_EMOS_OUTCOME_RESULT_2"
	Event_JFD_RussiaPutin_EmoPlague.Outcomes[2].CanFunc = (
		function(player)	
			Event_JFD_RussiaPutin_EmoPlague.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_EMOS_OUTCOME_RESULT_2", eventEmoCity:GetName())
			return true
		end
		)
	Event_JFD_RussiaPutin_EmoPlague.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			eventEmoCity:ChangePopulation(-2, true)
			eventEmoCity:ChangeWeLoveTheKingDayCounter(25)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RUSSIA_PUTIN_EMOS_OUTCOME_RESULT_2_NOTIFICATION", eventEmoCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_EMOS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENT_RUSSIA_PUTIN_EMOS_2")) 
		end)
	
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_RussiaPutin_EmoPlague", Event_JFD_RussiaPutin_EmoPlague)
--------------------------------------------------------------------------------------------------------------------------
-- Russia (Putin): Powerful Oligarchs
--------------------------------------------------------------------------------------------------------------------------
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]
local eventEmoCity = nil
local policyRussiaPutinOligarchs = GameInfoTypes["POLICY_EVENTS_JFD_RUSSIA_PUTIN_OLIGARCH"]
local Event_JFD_RussiaPutin_Oligarchs = {}
	Event_JFD_RussiaPutin_Oligarchs.Name = "TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_OLIGARCHS"
	Event_JFD_RussiaPutin_Oligarchs.Desc = "TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_OLIGARCHS_DESC"
	Event_JFD_RussiaPutin_Oligarchs.EventImage = 'Event_RussiaPutin_Oligarchs.dds'
	Event_JFD_RussiaPutin_Oligarchs.Weight = 10
	Event_JFD_RussiaPutin_Oligarchs.CanFunc = (
		function(player)			
			if player:HasPolicy(policyRussiaPutinOligarchs) then return false end
			if load(player, "Event_JFD_RussiaPutin_Oligarchs") == true then return false end
			if player:GetCivilizationType() ~= civilizationID then return false end
			if player:GetCurrentEra() < eraMedievalID then return false end
			Event_JFD_RussiaPutin_Oligarchs.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_OLIGARCHS_DESC")
			return true
		end
		)
	Event_JFD_RussiaPutin_Oligarchs.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RussiaPutin_Oligarchs.Outcomes[1] = {}
	Event_JFD_RussiaPutin_Oligarchs.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_OLIGARCHS_OUTCOME_1"
	Event_JFD_RussiaPutin_Oligarchs.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_OLIGARCHS_OUTCOME_RESULT_1"
	Event_JFD_RussiaPutin_Oligarchs.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFD_RussiaPutin_Oligarchs.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_OLIGARCHS_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_RussiaPutin_Oligarchs.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyRussiaPutinOligarchs, true)
			if GetRandom(1,10) <= 3 then
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RUSSIA_PUTIN_OLIGARCHS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_OLIGARCHS"))
			else
				player:GetCapitalCity():ChangeResistanceTurns(3)
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RUSSIA_PUTIN_OLIGARCHS_OUTCOME_RESULT_1_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_OLIGARCHS"))
			end
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RussiaPutin_Oligarchs.Outcomes[2] = {}
	Event_JFD_RussiaPutin_Oligarchs.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_OLIGARCHS_OUTCOME_2"
	Event_JFD_RussiaPutin_Oligarchs.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_OLIGARCHS_OUTCOME_RESULT_2"
	Event_JFD_RussiaPutin_Oligarchs.Outcomes[2].CanFunc = (
		function(player)	
			local goldenAgeReward = ((player:GetGoldenAgeProgressMeter()*20)/100)
			Event_JFD_RussiaPutin_Oligarchs.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_OLIGARCHS_OUTCOME_RESULT_2", goldenAgeReward)
			return true
		end
		)
	Event_JFD_RussiaPutin_Oligarchs.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldenAgeReward = ((player:GetGoldenAgeProgressMeter()*20)/100)
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			if GetRandom(1,10) <= 5 then
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RUSSIA_PUTIN_OLIGARCHS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_OLIGARCHS"))
			else
				player:GetCapitalCity():ChangeResistanceTurns(1)
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RUSSIA_PUTIN_OLIGARCHS_OUTCOME_RESULT_2_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_OLIGARCHS"))
			end
			save(player, "Event_JFD_RussiaPutin_Oligarchs", true)
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_RussiaPutin_Oligarchs.Outcomes[3] = {}
	Event_JFD_RussiaPutin_Oligarchs.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_OLIGARCHS_OUTCOME_3"
	Event_JFD_RussiaPutin_Oligarchs.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_OLIGARCHS_OUTCOME_RESULT_3"
	Event_JFD_RussiaPutin_Oligarchs.Outcomes[3].CanFunc = (
		function(player)	
			Event_JFD_RussiaPutin_Oligarchs.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_OLIGARCHS_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_JFD_RussiaPutin_Oligarchs.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			player:ChangeNumResourceTotal(iMagistrate, -1)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RUSSIA_PUTIN_OLIGARCHS_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RUSSIA_PUTIN_OLIGARCHS"))
			save(player, "Event_JFD_RussiaPutin_Oligarchs", true)
		end)

Events_AddCivilisationSpecific(civilizationID, "Event_JFD_RussiaPutin_Oligarchs", Event_JFD_RussiaPutin_Oligarchs)
--=======================================================================================================================
--=======================================================================================================================


