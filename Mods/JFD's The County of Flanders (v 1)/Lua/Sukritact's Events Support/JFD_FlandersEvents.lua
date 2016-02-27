-- JFD_NriEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Nri Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
------------------------------------------------------------------------------------------------------------------------
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
-- Civ Specific Events
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID 	= GameInfoTypes["CIVILIZATION_JFD_FLANDERS"]
local eraMedievalID		= GameInfoTypes["ERA_MEDIEVAL"]	
local eraRenaissanceID 	= GameInfoTypes["ERA_RENAISSANCE"]
local mathCeil		 	= math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- Lion of Flanders
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDFlandersLionOfFlanders = {}
	Event_JFDFlandersLionOfFlanders.Name = "TXT_KEY_EVENT_JFD_FLANDERS_LION_OF_FLANDERS"
	Event_JFDFlandersLionOfFlanders.Desc = "TXT_KEY_EVENT_JFD_FLANDERS_LION_OF_FLANDERS_DESC"
	Event_JFDFlandersLionOfFlanders.Weight = 2
	Event_JFDFlandersLionOfFlanders.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			if load(player, "Event_JFDFlandersLionOfFlanders") == true 	then return false end
			if player:GetCivilizationType() ~= civilisationID 			then return false end
			if player:GetCurrentEra() < eraRenaissanceID				then return false end
			return true
		end
		)
	Event_JFDFlandersLionOfFlanders.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDFlandersLionOfFlanders.Outcomes[1] = {}
	Event_JFDFlandersLionOfFlanders.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_FLANDERS_LION_OF_FLANDERS_OUTCOME_1"
	Event_JFDFlandersLionOfFlanders.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_FLANDERS_LION_OF_FLANDERS_OUTCOME_RESULT_1"
	Event_JFDFlandersLionOfFlanders.Outcomes[1].CanFunc = (
		function(player)	
			local weLoveTheKingDayReward = mathCeil(10 * iGAMod)
			Event_JFDFlandersLionOfFlanders.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FLANDERS_LION_OF_FLANDERS_OUTCOME_RESULT_1", weLoveTheKingDayReward)
			return true
		end
		)
	Event_JFDFlandersLionOfFlanders.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local weLoveTheKingDayReward = mathCeil(10 * iGAMod)
			for city in player:Cities() do
				city:ChangeWeLoveTheKingDayCounter(weLoveTheKingDayReward)
			end
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FLANDERS_LION_OF_FLANDERS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FLANDERS_LION_OF_FLANDERS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FLANDERS_LION_OF_FLANDERS"))
			save(player, "Event_JFDFlandersLionOfFlanders", true)
		end)
	
Events_AddCivilisationSpecificScheduled(civilisationID, "Event_JFDFlandersLionOfFlanders", Event_JFDFlandersLionOfFlanders, 1838, true)
--------------------------------------------------------------------------------------------------------------------------
--  Linguistic Tensions
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDFlandersLinguisticTensions = {}
	Event_JFDFlandersLinguisticTensions.Name = "TXT_KEY_EVENT_JFD_FLANDERS_LINGUISTIC_TENSIONS"
	Event_JFDFlandersLinguisticTensions.Desc = "TXT_KEY_EVENT_JFD_FLANDERS_LINGUISTIC_TENSIONS_DESC"
	Event_JFDFlandersLinguisticTensions.Weight = 5
	Event_JFDFlandersLinguisticTensions.CanFunc = (
		function(player)	
			if load(player, "Event_JFDFlandersLinguisticTensions") == true 	then return false end
			if player:GetCivilizationType() ~= civilisationID 				then return false end
			
			Event_JFDFlandersLinguisticTensions.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FLANDERS_LINGUISTIC_TENSIONS_DESC")
			if player:GetCurrentEra() < eraMedievalID then return false end
			return true
		end
		)
	Event_JFDFlandersLinguisticTensions.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDFlandersLinguisticTensions.Outcomes[1] = {}
	Event_JFDFlandersLinguisticTensions.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_FLANDERS_LINGUISTIC_TENSIONS_OUTCOME_1"
	Event_JFDFlandersLinguisticTensions.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_FLANDERS_LINGUISTIC_TENSIONS_OUTCOME_RESULT_1"
	Event_JFDFlandersLinguisticTensions.Outcomes[1].CanFunc = (
		function(player)			
			local cultureCost = mathCeil(50 * iMod)
			local goldenAgeReward = mathCeil(player:GetGoldenAgeProgressMeter() * 20 / 100)
			if player:GetJONSCulture() < cultureCost then return false end
			Event_JFDFlandersLinguisticTensions.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FLANDERS_LINGUISTIC_TENSIONS_OUTCOME_RESULT_1", cultureCost, goldenAgeReward)
			return true
		end
		)
	Event_JFDFlandersLinguisticTensions.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cultureCost = mathCeil(50 * iMod)
			local goldenAgeReward = mathCeil(player:GetGoldenAgeProgressMeter() * 20 / 100)
			player:ChangeJONSCulture(-cultureCost)
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FLANDERS_LINGUISTIC_TENSIONS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FLANDERS_LINGUISTIC_TENSIONS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_FLANDERS_LINGUISTIC_TENSIONS")) 
			save(player, "Event_JFDFlandersLinguisticTensions", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDFlandersLinguisticTensions.Outcomes[2] = {}
	Event_JFDFlandersLinguisticTensions.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_FLANDERS_LINGUISTIC_TENSIONS_OUTCOME_2"
	Event_JFDFlandersLinguisticTensions.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_FLANDERS_LINGUISTIC_TENSIONS_OUTCOME_RESULT_2"
	Event_JFDFlandersLinguisticTensions.Outcomes[2].CanFunc = (
		function(player)			
			local cultureReward = mathCeil(50 * iMod)
			Event_JFDFlandersLinguisticTensions.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FLANDERS_LINGUISTIC_TENSIONS_OUTCOME_RESULT_2", cultureReward)
			return true
		end
		)
	Event_JFDFlandersLinguisticTensions.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cultureReward = mathCeil(50 * iMod)
			player:GetCapitalCity():ChangeResistanceTurns(1)
			player:ChangeJONSCulture(cultureReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FLANDERS_LINGUISTIC_TENSIONS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FLANDERS_LINGUISTIC_TENSIONS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_FLANDERS_LINGUISTIC_TENSIONS")) 
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDFlandersLinguisticTensions", Event_JFDFlandersLinguisticTensions)
--------------------------------------------------------------------------------------------------------------------------
-- Flanders
--------------------------------------------------------------------------------------------------------------------------
local leaderFlandersID = GameInfoTypes["LEADER_JFD_FLANDERS"]

local Event_JFDFlandersFlanders = {}
	Event_JFDFlandersFlanders.Name = "TXT_KEY_EVENT_JFD_FLANDERS_FLANDERS"
	Event_JFDFlandersFlanders.Desc = "TXT_KEY_EVENT_JFD_FLANDERS_FLANDERS_DESC"
	Event_JFDFlandersFlanders.Weight = 1
	Event_JFDFlandersFlanders.CanFunc = (
		function(player)			
			if (not player:IsHuman())								then return false end
			if load(player, "Event_JFDFlandersFlanders") == true 	then return false end
			if player:GetCivilizationType() ~= civilisationID 		then return false end
			
			return true
		end
		)
	Event_JFDFlandersFlanders.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDFlandersFlanders.Outcomes[1] = {}
	Event_JFDFlandersFlanders.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_FLANDERS_FLANDERS_OUTCOME_1"
	Event_JFDFlandersFlanders.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_FLANDERS_FLANDERS_OUTCOME_RESULT_1"
	Event_JFDFlandersFlanders.Outcomes[1].CanFunc = (
		function(player)	
			local goldenAgeReward = mathCeil(25 * iGAMod)
			Event_JFDFlandersFlanders.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FLANDERS_FLANDERS_OUTCOME_RESULT_1", goldenAgeReward)
			return true
		end
		)
	Event_JFDFlandersFlanders.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldenAgeReward = mathCeil(25 * iGAMod)
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FLANDERS_FLANDERS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FLANDERS_FLANDERS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FLANDERS_FLANDERS"))
			save(player, "Event_JFDFlandersFlanders", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDFlandersFlanders.Outcomes[2] = {}
	Event_JFDFlandersFlanders.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_FLANDERS_FLANDERS_OUTCOME_2"
	Event_JFDFlandersFlanders.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_FLANDERS_FLANDERS_OUTCOME_RESULT_2"
	Event_JFDFlandersFlanders.Outcomes[2].CanFunc = (
		function(player)	
			Event_JFDFlandersFlanders.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FLANDERS_FLANDERS_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFDFlandersFlanders.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			PreGame.SetLeaderType(playerID, leaderFlandersID)
			Events.AudioPlay2DSound("AS2D_LEADER_MUSIC_JFD_FLANDERS_PEACE")
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FLANDERS_FLANDERS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FLANDERS_FLANDERS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FLANDERS_FLANDERS"))
			save(player, "Event_JFDFlandersFlanders", true)
		end)
	
Events_AddCivilisationSpecificScheduled(civilisationID, "Event_JFDFlandersFlanders", Event_JFDFlandersFlanders, 1838, true)
--=======================================================================================================================
--=======================================================================================================================


