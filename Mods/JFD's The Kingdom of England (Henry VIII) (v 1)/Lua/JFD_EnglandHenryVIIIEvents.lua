-- JFD_RussiaNicholasIIEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Russia (Nicholas II) Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingPietyPrestige
--------------------------------------------------------------------------------------------------------------------------
function JFD_IsUsingPietyPrestige()
	local pietyPrestigeModID = "eea66053-7579-481a-bb8d-2f3959b59974"
	local isUsingPiety = false
	
	for _, mod in pairs(Modding.GetActivatedMods()) do
	  if (mod.ID == pietyPrestigeModID) then
	    isUsingPiety = true
	    break
	  end
	end

	return isUsingPiety
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
local civilisationID 				= GameInfoTypes["CIVILIZATION_JFD_HENRY_ENGLAND"]
local isUsingPietyPrestige			= JFD_IsUsingPietyPrestige()
local mathCeil 						= math.ceil
local policyRestraintOfAppealsID 	= GameInfoTypes["POLICY_JFD_HENRY_APPEALS"]
--------------------------------------------------------------------------------------------------------------------------
-- England (Henry VIII): Failure to Produce an Heir
--------------------------------------------------------------------------------------------------------------------------
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]

local Event_JFDEnglandHenryVIIIHeirFail = {}
	Event_JFDEnglandHenryVIIIHeirFail.Name = "TXT_KEY_EVENT_JFD_HENRY_VIII_HEIR_FAIL"
	Event_JFDEnglandHenryVIIIHeirFail.Desc = "TXT_KEY_EVENT_JFD_HENRY_VIII_HEIR_FAIL_DESC"
	Event_JFDEnglandHenryVIIIHeirFail.Weight = 10
	Event_JFDEnglandHenryVIIIHeirFail.CanFunc = (
		function(player)			
			if load(player, "Event_JFDEnglandHenryVIIIHeirSuccess") == true then return false end
			if player:GetCivilizationType() ~= civilisationID 				then return false end
			if player:GetCurrentEra() < eraMedievalID 						then return false end
			return true
		end
		)
	Event_JFDEnglandHenryVIIIHeirFail.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDEnglandHenryVIIIHeirFail.Outcomes[1] = {}
	Event_JFDEnglandHenryVIIIHeirFail.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_HENRY_VIII_HEIR_FAIL_OUTCOME_1"
	Event_JFDEnglandHenryVIIIHeirFail.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_HENRY_VIII_HEIR_FAIL_OUTCOME_RESULT_1"
	Event_JFDEnglandHenryVIIIHeirFail.Outcomes[1].Weight = 5
	Event_JFDEnglandHenryVIIIHeirFail.Outcomes[1].CanFunc = (
		function(player)			
			if (not player:HasPolicy(policyRestraintOfAppealsID)) then return false end
			local goldenAgeCost = mathCeil(player:GetGoldenAgeProgressMeter()* 40 / 100)
			Event_JFDEnglandHenryVIIIHeirFail.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HENRY_VIII_HEIR_FAIL_OUTCOME_RESULT_1", goldenAgeCost)
			return true
		end
		)
	Event_JFDEnglandHenryVIIIHeirFail.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldenAgeCost = mathCeil(player:GetGoldenAgeProgressMeter()* 40 / 100)
			player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)
			player:ChangeNumResourceTotal(iMagistrate, 1)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_HENRY_VIII_HEIR_FAIL_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HENRY_VIII_HEIR_FAIL"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDEnglandHenryVIIIHeirFail.Outcomes[2] = {}
	Event_JFDEnglandHenryVIIIHeirFail.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_HENRY_VIII_HEIR_FAIL_OUTCOME_2"
	Event_JFDEnglandHenryVIIIHeirFail.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_HENRY_VIII_HEIR_FAIL_OUTCOME_RESULT_2"
	Event_JFDEnglandHenryVIIIHeirFail.Outcomes[2].Weight = 3
	Event_JFDEnglandHenryVIIIHeirFail.Outcomes[2].CanFunc = (
		function(player)			
			if (not player:HasPolicy(policyRestraintOfAppealsID)) then return false end
			local reward = mathCeil(75 * iMod)
			local rewardType = "[ICON_PEACE] Faith"
			if isUsingPietyPrestige then 
				rewardType = "[ICON_JFD_PIETY] Piety"
				reward = mathCeil(23 * iMod)
			end
			Event_JFDEnglandHenryVIIIHeirFail.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HENRY_VIII_HEIR_FAIL_OUTCOME_RESULT_2", reward, rewardType)
			return true
		end
		)
	Event_JFDEnglandHenryVIIIHeirFail.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local reward = mathCeil(75 * iMod)
			if isUsingPietyPrestige then 
				reward = mathCeil(23 * iMod)
				JFD_ChangePiety(playerID, reward)
			else
				player:ChangeFaith(reward)
			end
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_HENRY_VIII_HEIR_FAIL_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HENRY_VIII_HEIR_FAIL"))
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDEnglandHenryVIIIHeirFail.Outcomes[3] = {}
	Event_JFDEnglandHenryVIIIHeirFail.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_HENRY_VIII_HEIR_FAIL_OUTCOME_3"
	Event_JFDEnglandHenryVIIIHeirFail.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_HENRY_VIII_HEIR_FAIL_OUTCOME_RESULT_3"
	Event_JFDEnglandHenryVIIIHeirFail.Outcomes[3].Weight = 1
	Event_JFDEnglandHenryVIIIHeirFail.Outcomes[3].CanFunc = (
		function(player)			
			if (player:HasPolicy(policyRestraintOfAppealsID)) then return false end
			Event_JFDEnglandHenryVIIIHeirFail.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HENRY_VIII_HEIR_FAIL_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_JFDEnglandHenryVIIIHeirFail.Outcomes[3].DoFunc = (
		function(player)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_HENRY_VIII_HEIR_FAIL_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HENRY_VIII_HEIR_FAIL"))
		end)

Events_AddCivilisationSpecific(civilisationID, "Event_JFDEnglandHenryVIIIHeirFail", Event_JFDEnglandHenryVIIIHeirFail)
--------------------------------------------------------------------------------------------------------------------------
--  England (Henry VIII): An Heir is Born!
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDEnglandHenryVIIIHeirSuccess = {}
	Event_JFDEnglandHenryVIIIHeirSuccess.Name = "TXT_KEY_EVENT_JFD_HENRY_VIII_HEIR_SUCCESS"
	Event_JFDEnglandHenryVIIIHeirSuccess.Desc = "TXT_KEY_EVENT_JFD_HENRY_VIII_HEIR_SUCCESS_DESC"
	Event_JFDEnglandHenryVIIIHeirSuccess.Weight = 2
	Event_JFDEnglandHenryVIIIHeirSuccess.CanFunc = (
		function(player)			
			if (not player:HasPolicy(policyRestraintOfAppealsID)) 	then return false end
			if player:GetCivilizationType() ~= civilisationID 		then return false end
			if player:GetCurrentEra() < eraMedievalID 				then return false end
			return true
		end
		)
	Event_JFDEnglandHenryVIIIHeirSuccess.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDEnglandHenryVIIIHeirSuccess.Outcomes[1] = {}
	Event_JFDEnglandHenryVIIIHeirSuccess.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_HENRY_VIII_HEIR_SUCCESS_OUTCOME_1"
	Event_JFDEnglandHenryVIIIHeirSuccess.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_HENRY_VIII_HEIR_SUCCESS_OUTCOME_RESULT_1"
	Event_JFDEnglandHenryVIIIHeirSuccess.Outcomes[1].Weight = 5
	Event_JFDEnglandHenryVIIIHeirSuccess.Outcomes[1].CanFunc = (
		function(player)			
			local wLtKD = mathCeil(25 * iGAMod)
			Event_JFDEnglandHenryVIIIHeirSuccess.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HENRY_VIII_HEIR_SUCCESS_OUTCOME_RESULT_1", wLtKD)
			return true
		end
		)
	Event_JFDEnglandHenryVIIIHeirSuccess.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local wLtKD = mathCeil(25 * iGAMod)
			for city in player:Cities() do
				city:ChangeWeLoveTheKingDayCounter(wLtKD)
			end

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_HENRY_VIII_HEIR_SUCCESS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HENRY_VIII_HEIR_SUCCESS"))
			save(player, "Event_JFDEnglandHenryVIIIHeirSuccess", true)
		end)
		
Events_AddCivilisationSpecific(civilisationID, "Event_JFDEnglandHenryVIIIHeirSuccess", Event_JFDEnglandHenryVIIIHeirSuccess)
--------------------------------------------------------------------------------------------------------------------------
--  England (Henry VIII): Religious Unrest
--------------------------------------------------------------------------------------------------------------------------
local rebellingCity = nil

local Event_JFDEnglandHenryVIIIPilgrimageOfGrace = {}
	Event_JFDEnglandHenryVIIIPilgrimageOfGrace.Name = "TXT_KEY_EVENT_JFD_ENGLAND_HENRY_PILGRIMAGE_OF_GRACE"
	Event_JFDEnglandHenryVIIIPilgrimageOfGrace.Desc = "TXT_KEY_EVENT_JFD_ENGLAND_HENRY_PILGRIMAGE_OF_GRACE_DESC"
	Event_JFDEnglandHenryVIIIPilgrimageOfGrace.Weight = 5
	Event_JFDEnglandHenryVIIIPilgrimageOfGrace.CanFunc = (
		function(player)			
			if load(player, "Event_JFDEnglandHenryVIIIPilgrimageOfGrace") == true 	then return false end
			if player:GetCivilizationType() ~= civilisationID 						then return false end
			if (not player:HasPolicy(policyRestraintOfAppealsID)) 					then return false end
			
			local cities = {}
			local count = 1
			for city in player:Cities() do
				if city:GetPopulation() > 1 then
					cities[count] = city
					count = count + 1
				end
			end
			
			rebellingCity = cities[JFD_GetRandom(1, #cities)]	
			if (not rebellingCity) then return false end
			Event_JFDEnglandHenryVIIIPilgrimageOfGrace.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ENGLAND_HENRY_PILGRIMAGE_OF_GRACE_DESC", rebellingCity:GetName())
			return true
		end
		)
	Event_JFDEnglandHenryVIIIPilgrimageOfGrace.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDEnglandHenryVIIIPilgrimageOfGrace.Outcomes[1] = {}
	Event_JFDEnglandHenryVIIIPilgrimageOfGrace.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_ENGLAND_HENRY_PILGRIMAGE_OF_GRACE_OUTCOME_1"
	Event_JFDEnglandHenryVIIIPilgrimageOfGrace.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_ENGLAND_HENRY_PILGRIMAGE_OF_GRACE_OUTCOME_RESULT_1"
	Event_JFDEnglandHenryVIIIPilgrimageOfGrace.Outcomes[1].Weight = 5
	Event_JFDEnglandHenryVIIIPilgrimageOfGrace.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFDEnglandHenryVIIIPilgrimageOfGrace.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ENGLAND_HENRY_PILGRIMAGE_OF_GRACE_OUTCOME_RESULT_1", rebellingCity:GetName())
			return true
		end
		)
	Event_JFDEnglandHenryVIIIPilgrimageOfGrace.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			rebellingCity:ChangeResistanceTurns(2)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ENGLAND_HENRY_PILGRIMAGE_OF_GRACE_OUTCOME_RESULT_1_NOTIFICATION", rebellingCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ENGLAND_HENRY_PILGRIMAGE_OF_GRACE"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ENGLAND_HENRY_PILGRIMAGE_OF_GRACE", rebellingCity:GetName())) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDEnglandHenryVIIIPilgrimageOfGrace.Outcomes[2] = {}
	Event_JFDEnglandHenryVIIIPilgrimageOfGrace.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_ENGLAND_HENRY_PILGRIMAGE_OF_GRACE_OUTCOME_2"
	Event_JFDEnglandHenryVIIIPilgrimageOfGrace.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_ENGLAND_HENRY_PILGRIMAGE_OF_GRACE_OUTCOME_RESULT_2"
	Event_JFDEnglandHenryVIIIPilgrimageOfGrace.Outcomes[2].Weight = 0
	Event_JFDEnglandHenryVIIIPilgrimageOfGrace.Outcomes[2].CanFunc = (
		function(player)	
			Event_JFDEnglandHenryVIIIPilgrimageOfGrace.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ENGLAND_HENRY_PILGRIMAGE_OF_GRACE_OUTCOME_RESULT_2", rebellingCity:GetName())
			return true
		end
		)
	Event_JFDEnglandHenryVIIIPilgrimageOfGrace.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			rebellingCity:ChangePopulation(-1, true)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ENGLAND_HENRY_PILGRIMAGE_OF_GRACE_OUTCOME_RESULT_2_NOTIFICATION", rebellingCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ENGLAND_HENRY_PILGRIMAGE_OF_GRACE"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ENGLAND_HENRY_PILGRIMAGE_OF_GRACE", rebellingCity:GetName())) 
			save(player, "Event_JFDEnglandHenryVIIIPilgrimageOfGrace", true)	
		end)
		
Events_AddCivilisationSpecificScheduled(civilisationID, "Event_JFDEnglandHenryVIIIPilgrimageOfGrace", Event_JFDEnglandHenryVIIIPilgrimageOfGrace, 1536, true)	
--=======================================================================================================================
--=======================================================================================================================


