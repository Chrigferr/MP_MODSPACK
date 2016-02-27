-- JFD_AustriaJosephII_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's Austria (Joseph II) Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingEnlightenmentEra
function JFD_IsUsingEnlightenmentEra()
	local enlightenmentEraID = "ce8aa614-7ef7-4a45-a179-5329869e8d6d"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == enlightenmentEraID) then
			return true
		end
	end
	return false
end
local isUsingEnlightenmentEra = JFD_IsUsingEnlightenmentEra()
--------------------------------------------------------------------------------------------------------------------------
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetEraAdjustedValue
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
--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_AUSTRIA_JOSEPH_II"]
local eraEnlightenmentID = GameInfoTypes["ERA_ENLIGHTENMENT"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local mathCeil = math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- Austria (Joseph II): Death Penalty
--------------------------------------------------------------------------------------------------------------------------
local cityStateID = nil
local Event_JFD_AustriaJosephII_DeathPenalty = {}
	Event_JFD_AustriaJosephII_DeathPenalty.Name = "TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_DEATH_PENALTY"
	Event_JFD_AustriaJosephII_DeathPenalty.Desc = "TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_DEATH_PENALTY_DESC"
	Event_JFD_AustriaJosephII_DeathPenalty.EventImage = 'Event_AustriaJosephII_DeathPenalty.dds'
	Event_JFD_AustriaJosephII_DeathPenalty.Weight = 10
	Event_JFD_AustriaJosephII_DeathPenalty.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilizationID then return false end
			if (isUsingEnlightenmentEra and player:GetCurrentEra() ~= eraEnlightenmentID) then 
				return false 
			elseif player:GetCurrentEra() ~= eraRenaissanceID then
				return false 
			end
			local playerTeam = Teams[player:GetTeam()]
			local minorPlayers = {}
			local count = 1
			for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
				local otherPlayer = Players[otherPlayerID]
				if (otherPlayer:IsMinorCiv() and otherPlayer:IsAlive()) then
					local otherPlayerTeamID = otherPlayer:GetTeam()
					if (playerTeam:IsHasMet(otherPlayerTeamID) and (not playerTeam:IsAtWar(otherPlayerTeamID))) then
						minorPlayers[count] = otherPlayerID
						count = count + 1
					end
				end
			end
			cityStateID = minorPlayers[GetRandom(1, #minorPlayers)]
			if (not cityStateID) then return false end
			local minorPlayer = Players[cityStateID]
			Event_JFD_AustriaJosephII_DeathPenalty.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_DEATH_PENALTY_DESC", minorPlayer:GetName())
			return true
		end
		)
	Event_JFD_AustriaJosephII_DeathPenalty.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_AustriaJosephII_DeathPenalty.Outcomes[1] = {}
	Event_JFD_AustriaJosephII_DeathPenalty.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_DEATH_PENALTY_OUTCOME_1"
	Event_JFD_AustriaJosephII_DeathPenalty.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_DEATH_PENALTY_OUTCOME_RESULT_1"
	Event_JFD_AustriaJosephII_DeathPenalty.Outcomes[1].Weight = 2
	Event_JFD_AustriaJosephII_DeathPenalty.Outcomes[1].CanFunc = (
		function(player)			
			Event_JFD_AustriaJosephII_DeathPenalty.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_DEATH_PENALTY_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_AustriaJosephII_DeathPenalty.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			player:GetCapitalCity():ChangeWeLoveTheKingDayCounter(10)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_AUSTRIA_JOSEPH_II_DEATH_PENALTY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_DEATH_PENALTY"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_AustriaJosephII_DeathPenalty.Outcomes[2] = {}
	Event_JFD_AustriaJosephII_DeathPenalty.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_DEATH_PENALTY_OUTCOME_2"
	Event_JFD_AustriaJosephII_DeathPenalty.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_DEATH_PENALTY_OUTCOME_RESULT_2"
	Event_JFD_AustriaJosephII_DeathPenalty.Outcomes[2].Weight = 5
	Event_JFD_AustriaJosephII_DeathPenalty.Outcomes[2].CanFunc = (
		function(player)			
			local minorPlayer = Players[cityStateID]
			local influenceReward = mathCeil(30*iMod)
			local goldenAgeReward = mathCeil(300*iMod)
			Event_JFD_AustriaJosephII_DeathPenalty.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_DEATH_PENALTY_OUTCOME_RESULT_2", influenceReward, minorPlayer:GetName(), goldenAgeReward)
			return true
		end
		)
	Event_JFD_AustriaJosephII_DeathPenalty.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local influenceReward = mathCeil(30*iMod)
			local goldenAgeReward = mathCeil(300*iMod)
			if cityStateID then
				local minorPlayer = Players[cityStateID]
				minorPlayer:ChangeMinorCivFriendshipWithMajor(playerID, influenceReward)			
			end
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			player:GetCapitalCity():ChangeResistanceTurns(2)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_AUSTRIA_JOSEPH_II_DEATH_PENALTY_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_DEATH_PENALTY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_AUSTRIA_JOSEPH_II_DEATH_PENALTY", player:GetName(), player:GetCivilizationShortDescription())) 
		end)

Events_AddCivilisationSpecific(civilizationID, "Event_JFD_AustriaJosephII_DeathPenalty", Event_JFD_AustriaJosephII_DeathPenalty)
--------------------------------------------------------------------------------------------------------------------------
--  Austria (Joseph II): Amadeus Mozart
--------------------------------------------------------------------------------------------------------------------------
local policyMozartID = GameInfoTypes["POLICY_EVENTS_JFD_AUSTRIA_JOSEPH_II_MOZART"]
local unitMozartID = GameInfoTypes["UNIT_EVENTS_JFD_AUSTRIA_JOSEPH_II_MOZART"]
local Event_JFD_AustriaJosephII_Mozart = {}
	Event_JFD_AustriaJosephII_Mozart.Name = "TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_MOZART"
	Event_JFD_AustriaJosephII_Mozart.Desc = "TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_MOZART_DESC"
	Event_JFD_AustriaJosephII_Mozart.EventImage = 'Event_AustriaJosephII_Mozart.dds'
	Event_JFD_AustriaJosephII_Mozart.Weight = 10
	Event_JFD_AustriaJosephII_Mozart.CanFunc = (
		function(player)			
			if load(player, "Event_JFD_AustriaJosephII_Mozart") == true then return false end
			if player:GetCivilizationType() ~= civilizationID then return false end
			if (isUsingEnlightenmentEra and player:GetCurrentEra() ~= eraEnlightenmentID) then 
				return false 
			elseif player:GetCurrentEra() ~= eraRenaissanceID then
				return false 
			end
			local goldCost = mathCeil(800*iMod)
			if player:GetGold() < goldCost then return false end
			return true
		end
		)
	Event_JFD_AustriaJosephII_Mozart.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_AustriaJosephII_Mozart.Outcomes[1] = {}
	Event_JFD_AustriaJosephII_Mozart.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_MOZART_OUTCOME_1"
	Event_JFD_AustriaJosephII_Mozart.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_MOZART_OUTCOME_RESULT_1"
	Event_JFD_AustriaJosephII_Mozart.Outcomes[1].Weight = 5
	Event_JFD_AustriaJosephII_Mozart.Outcomes[1].CanFunc = (
		function(player)			
			local goldCost = mathCeil(800*iMod)
			Event_JFD_AustriaJosephII_Mozart.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_MOZART_OUTCOME_RESULT_1", goldCost)
			return true
		end
		)
	Event_JFD_AustriaJosephII_Mozart.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = mathCeil(800*iMod)
			player:ChangeGold(-goldCost) 
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyMozartID, true)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_AUSTRIA_JOSEPH_II_MOZART_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_MOZART"))
			save(player, "Event_JFD_AustriaJosephII_Mozart", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_AustriaJosephII_Mozart.Outcomes[2] = {}
	Event_JFD_AustriaJosephII_Mozart.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_MOZART_OUTCOME_2"
	Event_JFD_AustriaJosephII_Mozart.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_MOZART_OUTCOME_RESULT_2"
	Event_JFD_AustriaJosephII_Mozart.Outcomes[2].Weight = 5
	Event_JFD_AustriaJosephII_Mozart.Outcomes[2].CanFunc = (
		function(player)			
			local goldCost = mathCeil(500*iMod)
			Event_JFD_AustriaJosephII_Mozart.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_MOZART_OUTCOME_RESULT_2", goldCost)
			return true
		end
		)
	Event_JFD_AustriaJosephII_Mozart.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = mathCeil(500*iMod)
			local capital = player:GetCapitalCity()
			player:ChangeGold(-goldCost) 
			if unitMozartID then
				player:InitUnit(unitMozartID, capital:GetX(), capital:GetY())
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_AUSTRIA_JOSEPH_II_MOZART_OUTCOME_RESULT_2_NOTIFICATION", cityList), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_MOZART"))
			save(player, "Event_JFD_AustriaJosephII_Mozart", true)
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_AustriaJosephII_Mozart.Outcomes[3] = {}
	Event_JFD_AustriaJosephII_Mozart.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_MOZART_OUTCOME_3"
	Event_JFD_AustriaJosephII_Mozart.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_MOZART_OUTCOME_RESULT_3"
	Event_JFD_AustriaJosephII_Mozart.Outcomes[3].Weight = 0
	Event_JFD_AustriaJosephII_Mozart.Outcomes[3].CanFunc = (
		function(player)			
			Event_JFD_AustriaJosephII_Mozart.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_MOZART_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_JFD_AustriaJosephII_Mozart.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_AUSTRIA_JOSEPH_II_MOZART_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AUSTRIA_JOSEPH_II_MOZART"))
			save(player, "Event_JFD_AustriaJosephII_Mozart", true)
		end)
		
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_AustriaJosephII_Mozart", Event_JFD_AustriaJosephII_Mozart)
--=======================================================================================================================
--=======================================================================================================================


