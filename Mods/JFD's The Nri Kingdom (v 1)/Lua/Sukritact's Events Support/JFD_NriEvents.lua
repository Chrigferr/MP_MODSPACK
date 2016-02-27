-- JFD_NriEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Nri Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_GetHighestTributeCity
--------------------------------------------------------------------------------------------------------------------------
local yieldFaithID = GameInfoTypes["YIELD_FAITH"]

function JFD_GetHighestTributeCity(playerID)
    local player = Players[playerID]
	local highestTributeCity
	for city in player:Cities() do
		if (not city:IsCapital()) then
			local numFaithTribute = city:GetBaseYieldRate(yieldFaithID)
			for otherCity in player:Cities() do
				if otherCity:GetID() ~= city:GetID() then
					local numFaithTributeOther = otherCity:GetBaseYieldRate(yieldFaithID)
					if numFaithTribute > numFaithTributeOther then
						highestTributeCity = city
					end
				end
			end
		end
	end
	
	return highestTributeCity
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_IsAtPeace
--------------------------------------------------------------------------------------------------------------------------
function JFD_AtPeace(playerID)
	local atPeace = false
	if Teams[Players[playerID]:GetTeam()]:GetAtWarCount(true) == 0 then 
		atPeace = true 
	end

	return atPeace
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
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_NRI"]
local mathCeil = math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- Year Counting Ceremony
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDNriYearCounting = {}
	Event_JFDNriYearCounting.Name = "TXT_KEY_EVENT_JFD_NRI_YEAR_COUNTING"
	Event_JFDNriYearCounting.Desc = "TXT_KEY_EVENT_JFD_NRI_YEAR_COUNTING_DESC"
	Event_JFDNriYearCounting.Weight = 5
	Event_JFDNriYearCounting.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			if player:GetCivilizationType() ~= civilisationID 		then return false end
			if player:GetNumCities() < 3							then return false end
			if (not JFD_AtPeace(playerID))							then return false end
			if (not JFD_GetHighestTributeCity(playerID))			then return false end
			
			return true
		end
		)
	Event_JFDNriYearCounting.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDNriYearCounting.Outcomes[1] = {}
	Event_JFDNriYearCounting.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_NRI_YEAR_COUNTING_OUTCOME_1"
	Event_JFDNriYearCounting.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_NRI_YEAR_COUNTING_OUTCOME_RESULT_1"
	Event_JFDNriYearCounting.Outcomes[1].CanFunc = (
		function(player)	
			local weLoveTheKingDayReward = mathCeil(25 * iGAMod)
			Event_JFDNriYearCounting.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NRI_YEAR_COUNTING_OUTCOME_RESULT_1", weLoveTheKingDayReward)
			return true
		end
		)
	Event_JFDNriYearCounting.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local weLoveTheKingDayReward = mathCeil(25 * iGAMod)
			local cityBlessed = JFD_GetHighestTributeCity(playerID)		
			cityBlessed:ChangeWeLoveTheKingDayCounter(weLoveTheKingDayReward)
			
			if player:IsHuman() then
				local description = Locale.ConvertTextKey("TXT_KEY_JFD_NRI_YEAR_COUNTING_OUTCOME_RESULT_1_NOTIFICATION", cityBlessed:GetName())
				local shortDescription = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NRI_YEAR_COUNTING")
				Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_GENERIC"], description, shortDescription, cityBlessed:GetX(), cityBlessed:GetY())
			end
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NRI_YEAR_COUNTING", player:GetCivilizationDescription()))
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDNriYearCounting", Event_JFDNriYearCounting)
--------------------------------------------------------------------------------------------------------------------------
-- Runaway Slaves
--------------------------------------------------------------------------------------------------------------------------
local cityState = nil
local unitWorkerID = GameInfoTypes["UNIT_WORKER"]

local Event_JFDNriRunawaySlaves = {}
	Event_JFDNriRunawaySlaves.Name = "TXT_KEY_EVENT_JFD_NRI_RUNAWAY_SLAVES"
	Event_JFDNriRunawaySlaves.Desc = "TXT_KEY_EVENT_JFD_NRI_RUNAWAY_SLAVES_DESC"
	Event_JFDNriRunawaySlaves.Weight = 5
	Event_JFDNriRunawaySlaves.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID 	then return false end
			if (not JFD_AtPeace(player:GetID()))				then return false end
			
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
			
			Event_JFDNriRunawaySlaves.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NRI_RUNAWAY_SLAVES_DESC", cityState:GetCivilizationShortDescription())
			return true
		end
		)
	Event_JFDNriRunawaySlaves.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDNriRunawaySlaves.Outcomes[1] = {}
	Event_JFDNriRunawaySlaves.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_NRI_RUNAWAY_SLAVES_OUTCOME_1"
	Event_JFDNriRunawaySlaves.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_NRI_RUNAWAY_SLAVES_OUTCOME_RESULT_1"
	Event_JFDNriRunawaySlaves.Outcomes[1].CanFunc = (
		function(player)	
			local influenceReward = mathCeil(20 * iMod)
			Event_JFDNriRunawaySlaves.Outcomes[1].Name = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NRI_RUNAWAY_SLAVES_OUTCOME_1", cityState:GetCivilizationShortDescription())
			Event_JFDNriRunawaySlaves.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NRI_RUNAWAY_SLAVES_OUTCOME_RESULT_1", influenceReward, cityState:GetCivilizationShortDescription())
			return true
		end
		)
	Event_JFDNriRunawaySlaves.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local influenceReward = mathCeil(20 * iMod)
			cityState:ChangeMinorCivFriendshipWithMajor(playerID, influenceReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_NRI_RUNAWAY_SLAVES_OUTCOME_RESULT_1_NOTIFICATION", cityState:GetCivilizationShortDescription()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NRI_RUNAWAY_SLAVES"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDNriRunawaySlaves.Outcomes[2] = {}
	Event_JFDNriRunawaySlaves.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_NRI_RUNAWAY_SLAVES_OUTCOME_2"
	Event_JFDNriRunawaySlaves.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_NRI_RUNAWAY_SLAVES_OUTCOME_RESULT_2"
	Event_JFDNriRunawaySlaves.Outcomes[2].CanFunc = (
		function(player)	
			local influenceCost = mathCeil(40 * iMod)
			Event_JFDNriRunawaySlaves.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NRI_RUNAWAY_SLAVES_OUTCOME_RESULT_2", influenceCost, cityState:GetCivilizationShortDescription())
			return true
		end
		)
	Event_JFDNriRunawaySlaves.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local influenceCost = mathCeil(40 * iMod)
			cityState:ChangeMinorCivFriendshipWithMajor(playerID, -influenceCost)
			player:GetCapitalCity():ChangePopulation(1)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_NRI_RUNAWAY_SLAVES_OUTCOME_RESULT_2_NOTIFICATION", cityState:GetCivilizationShortDescription()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NRI_RUNAWAY_SLAVES"))
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDNriRunawaySlaves.Outcomes[3] = {}
	Event_JFDNriRunawaySlaves.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_NRI_RUNAWAY_SLAVES_OUTCOME_3"
	Event_JFDNriRunawaySlaves.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_NRI_RUNAWAY_SLAVES_OUTCOME_RESULT_3"
	Event_JFDNriRunawaySlaves.Outcomes[3].CanFunc = (
		function(player)	
			local influenceCost = mathCeil(50 * iMod)
			Event_JFDNriRunawaySlaves.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NRI_RUNAWAY_SLAVES_OUTCOME_RESULT_3", influenceCost, cityState:GetCivilizationShortDescription())
			return true
		end
		)
	Event_JFDNriRunawaySlaves.Outcomes[3].DoFunc = (
		function(player) 
			local influenceCost = mathCeil(50 * iMod)
			cityState:ChangeMinorCivFriendshipWithMajor(playerID, -influenceCost)
			player:InitUnit(unitWorkerID, player:GetCapitalCity():GetX(), player:GetCapitalCity():GetY())
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_NRI_RUNAWAY_SLAVES_OUTCOME_RESULT_3_NOTIFICATION", cityState:GetCivilizationShortDescription()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NRI_RUNAWAY_SLAVES"))
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDNriRunawaySlaves", Event_JFDNriRunawaySlaves)
--=======================================================================================================================
--=======================================================================================================================


