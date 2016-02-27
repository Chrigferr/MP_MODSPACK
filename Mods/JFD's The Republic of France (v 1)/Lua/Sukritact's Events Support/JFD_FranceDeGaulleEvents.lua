-- JFD_FranceDeGaulleEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's France (De Gaulle) Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
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
	if not (player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local cityState
local civilisationID	= GameInfoTypes["CIVILIZATION_JFD_FRANCE_DEGAULLE"]
local eraRenaissanceID	= GameInfoTypes["ERA_RENAISSANCE"]
local mathCeil			= math.ceil
--------------------------------------------------------------------------------------------------------------------------
--  Slander
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDFranceDeGaulleSlander = {}
	Event_JFDFranceDeGaulleSlander.Name = "TXT_KEY_EVENT_JFD_FRANCE_DEGAULLE_SLANDER"
	Event_JFDFranceDeGaulleSlander.Desc = "TXT_KEY_EVENT_JFD_FRANCE_DEGAULLE_SLANDER_DESC"
	Event_JFDFranceDeGaulleSlander.Weight = 5
	Event_JFDFranceDeGaulleSlander.CanFunc = (
		function(player)			
			if load(player, "Event_JFDFranceDeGaulleSlander") == true	then return false end
			if player:GetCivilizationType() ~= civilisationID			then return false end
			if player:GetCurrentEra() < eraRenaissanceID				then return false end

			local playerTeam = Teams[player:GetTeam()]
			local cityStates = {}
			local count = 1
			for minorID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
				local minorCiv = Players[minorID]
				if (Teams[player:GetTeam()]:IsHasMet(minorCiv:GetTeam()) and minorCiv:IsMinorCiv() and minorCiv:GetCapitalCity()) then
					cityStates[count] = minorCiv
					count = count + 1
				end
			end

			cityState = cityStates[GetRandom(1, #cityStates)]
			if cityState == nil then return false end
			
			Event_JFDFranceDeGaulleSlander.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_DEGAULLE_SLANDER_DESC", cityState:GetCivilizationShortDescription())
			return true
		end
		)
	Event_JFDFranceDeGaulleSlander.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDFranceDeGaulleSlander.Outcomes[1] = {}
	Event_JFDFranceDeGaulleSlander.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_FRANCE_DEGAULLE_SLANDER_OUTCOME_1"
	Event_JFDFranceDeGaulleSlander.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_FRANCE_DEGAULLE_SLANDER_OUTCOME_RESULT_1"
	Event_JFDFranceDeGaulleSlander.Outcomes[1].CanFunc = (
		function(player)
			local influenceCost = mathCeil(33 * iMod)
			local cultureReward = mathCeil(65 * iMod)
			Event_JFDFranceDeGaulleSlander.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_DEGAULLE_SLANDER_OUTCOME_RESULT_1", influenceCost, cityState:GetCivilizationShortDescription(), cultureReward)
			return true
		end
		)
	Event_JFDFranceDeGaulleSlander.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local influenceCost = mathCeil(33 * iMod)
			local cultureReward = mathCeil(65 * iMod)
			cityState:ChangeMinorCivFriendshipWithMajor(playerID, -influenceCost)
			player:ChangeJONSCulture(cultureReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FRANCE_DEGAULLE_SLANDER_OUTCOME_RESULT_1_NOTIFICATION", cityState:GetCivilizationShortDescription()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_DEGAULLE_SLANDER"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENT_FRANCE_DEGAULLE_SLANDER_1", cityState:GetCivilizationShortDescription()))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDFranceDeGaulleSlander.Outcomes[2] = {}
	Event_JFDFranceDeGaulleSlander.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_FRANCE_DEGAULLE_SLANDER_OUTCOME_2"
	Event_JFDFranceDeGaulleSlander.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_FRANCE_DEGAULLE_SLANDER_OUTCOME_RESULT_2"
	Event_JFDFranceDeGaulleSlander.Outcomes[2].CanFunc = (
		function(player)	
			local influenceReward = mathCeil(40 * iMod)
			Event_JFDFranceDeGaulleSlander.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_DEGAULLE_SLANDER_OUTCOME_RESULT_2", influenceReward, cityState:GetCivilizationShortDescription())
			return true
		end
		)
	Event_JFDFranceDeGaulleSlander.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local influenceReward = mathCeil(40 * iMod)
			cityState:ChangeMinorCivFriendshipWithMajor(playerID, influenceReward)

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FRANCE_DEGAULLE_SLANDER_OUTCOME_RESULT_2_NOTIFICATION", cityState:GetCivilizationShortDescription()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_DEGAULLE_SLANDER"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENT_FRANCE_DEGAULLE_SLANDER_2", cityState:GetCivilizationShortDescription()))
		end)

Events_AddCivilisationSpecific(civilisationID, "Event_JFDFranceDeGaulleSlander", Event_JFDFranceDeGaulleSlander)
--------------------------------------------------------------------------------------------------------------------------
--  Dreyfus Affair
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDFranceDeGaulleDreyfusAffair = {}
	Event_JFDFranceDeGaulleDreyfusAffair.Name = "TXT_KEY_EVENT_JFD_FRANCE_DEGAULLE_DREYFUS_AFFAIR"
	Event_JFDFranceDeGaulleDreyfusAffair.Desc = "TXT_KEY_EVENT_JFD_FRANCE_DEGAULLE_DREYFUS_AFFAIR_DESC"
	Event_JFDFranceDeGaulleDreyfusAffair.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID then return false end

			Event_JFDFranceDeGaulleDreyfusAffair.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_DEGAULLE_DREYFUS_AFFAIR_DESC")
			return true
		end
		)
	Event_JFDFranceDeGaulleDreyfusAffair.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDFranceDeGaulleDreyfusAffair.Outcomes[1] = {}
	Event_JFDFranceDeGaulleDreyfusAffair.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_FRANCE_DEGAULLE_DREYFUS_AFFAIR_OUTCOME_1"
	Event_JFDFranceDeGaulleDreyfusAffair.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_FRANCE_DEGAULLE_DREYFUS_AFFAIR_OUTCOME_RESULT_1"
	Event_JFDFranceDeGaulleDreyfusAffair.Outcomes[1].CanFunc = (
		function(player)	
			local goldenAgeReward = mathCeil(50 * iMod)
			Event_JFDFranceDeGaulleDreyfusAffair.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_DEGAULLE_DREYFUS_AFFAIR_OUTCOME_RESULT_1", goldenAgeReward)
			return true
		end
		)
	Event_JFDFranceDeGaulleDreyfusAffair.Outcomes[1].DoFunc = (
		function(player) 
			local goldenAgeReward = mathCeil(50 * iMod)
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			if JFD_GetRandom(1,100) <= 50 then
				player:GetCapitalCity():ChangeResistanceTurns(1)
				JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FRANCE_DEGAULLE_DREYFUS_AFFAIR_OUTCOME_RESULT_1_ALT_NOTIFICATION", player:GetCapitalCity():GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_DEGAULLE_DREYFUS_AFFAIR"))
			else
				JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FRANCE_DEGAULLE_DREYFUS_AFFAIR_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_DEGAULLE_DREYFUS_AFFAIR"))
			end
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDFranceDeGaulleDreyfusAffair.Outcomes[2] = {}
	Event_JFDFranceDeGaulleDreyfusAffair.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_FRANCE_DEGAULLE_DREYFUS_AFFAIR_OUTCOME_2"
	Event_JFDFranceDeGaulleDreyfusAffair.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_FRANCE_DEGAULLE_DREYFUS_AFFAIR_OUTCOME_RESULT_2"
	Event_JFDFranceDeGaulleDreyfusAffair.Outcomes[2].CanFunc = (
		function(player)	
			local cultureReward = mathCeil(30 * iMod)
			Event_JFDFranceDeGaulleDreyfusAffair.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_DEGAULLE_DREYFUS_AFFAIR_OUTCOME_RESULT_2", cultureReward)
			return true
		end
		)
	Event_JFDFranceDeGaulleDreyfusAffair.Outcomes[2].DoFunc = (
		function(player) 
			local cultureReward = mathCeil(30 * iMod)
			player:ChangeJONSCulture(cultureReward)
			if JFD_GetRandom(1,100) <= 50 then
				player:GetCapitalCity():ChangeResistanceTurns(2)
				JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FRANCE_DEGAULLE_DREYFUS_AFFAIR_OUTCOME_RESULT_2_ALT_NOTIFICATION", player:GetCapitalCity():GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_DEGAULLE_DREYFUS_AFFAIR"))
			else
				JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FRANCE_DEGAULLE_DREYFUS_AFFAIR_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANCE_DEGAULLE_DREYFUS_AFFAIR"))
			end
		end)

Events_AddCivilisationSpecificScheduled(civilisationID, "Event_JFDFranceDeGaulleDreyfusAffair", Event_JFDFranceDeGaulleDreyfusAffair, 1894, true)
--=======================================================================================================================
--=======================================================================================================================


