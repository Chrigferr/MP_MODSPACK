-- JFD_AmericaRooseveltEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's America (Roosevelt) Events: loaded")
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
	if (not player:IsActivePlayer()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_AMERICA_ROOSEVELT"]
local mathCeil = math.ceil
--------------------------------------------------------------------------------------------------------------------------
--  Divided Military
--------------------------------------------------------------------------------------------------------------------------
local majorCivID		= nil
local majorCiv			= nil
local unitScientistID	= GameInfoTypes["UNIT_SCIENTIST"]

local Event_JFDAmericaRooseveltConcernedCitizen = {}
	Event_JFDAmericaRooseveltConcernedCitizen.Name = "TXT_KEY_EVENT_JFD_AMERICA_ROOSEVELT_CONCERNED_CITIZEN"
	Event_JFDAmericaRooseveltConcernedCitizen.Desc = "TXT_KEY_EVENT_JFD_AMERICA_ROOSEVELT_CONCERNED_CITIZEN_DESC"
	Event_JFDAmericaRooseveltConcernedCitizen.Weight = 2
	Event_JFDAmericaRooseveltConcernedCitizen.CanFunc = (
		function(player)			
			if load(player, "Event_JFDAmericaRooseveltConcernedCitizen") == true 	then return false end
			if player:GetCivilizationType() ~= civilisationID 						then return false end

			local playerTeam = Teams[player:GetTeam()]
			local majorCivs = {}
			local count = 1
			for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
				local otherPlayer = Players[playerID]
				local otherPlayerTeamID = otherPlayer:GetTeam()
				local otherPlayerTeam = Teams[otherPlayerTeamID]
				local otherPlayerNumTechsKnown = otherPlayerTeam:GetTeamTechs():GetNumTechsKnown()
				if (playerID ~= player:GetID() and playerTeam:IsHasMet(otherPlayerTeamID) and otherPlayerNumTechsKnown > playerTeam:GetTeamTechs():GetNumTechsKnown()) then
					majorCivs[count] = playerID
					count = count + 1	
				end
			end
			
			majorCivID = majorCivs[GetRandom(1, #majorCivs)]
			if majorCivID == nil then return false end
			majorCiv = Players[majorCivID]
			
			Event_JFDAmericaRooseveltConcernedCitizen.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AMERICA_ROOSEVELT_CONCERNED_CITIZEN_DESC", majorCiv:GetCivilizationShortDescription())
			return true
		end
		)
	Event_JFDAmericaRooseveltConcernedCitizen.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDAmericaRooseveltConcernedCitizen.Outcomes[1] = {}
	Event_JFDAmericaRooseveltConcernedCitizen.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_AMERICA_ROOSEVELT_CONCERNED_CITIZEN_OUTCOME_1"
	Event_JFDAmericaRooseveltConcernedCitizen.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_AMERICA_ROOSEVELT_CONCERNED_CITIZEN_OUTCOME_RESULT_1"
	Event_JFDAmericaRooseveltConcernedCitizen.Outcomes[1].CanFunc = (
		function(player)		
			local goldCost = mathCeil(500 * iMod)
			if player:GetGold() < goldCost then return false end
			Event_JFDAmericaRooseveltConcernedCitizen.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AMERICA_ROOSEVELT_CONCERNED_CITIZEN_OUTCOME_RESULT_1", goldCost)
			return true
		end
		)
	Event_JFDAmericaRooseveltConcernedCitizen.Outcomes[1].DoFunc = (
		function(player)
			local playerID = player:GetID()
			local goldCost = mathCeil(500 * iMod)
			player:ChangeGold(-goldCost)
			player:InitUnit(unitScientistID, player:GetCapitalCity():GetX(), player:GetCapitalCity():GetY())
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_AMERICA_ROOSEVELT_CONCERNED_CITIZEN_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AMERICA_ROOSEVELT_CONCERNED_CITIZEN"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDAmericaRooseveltConcernedCitizen.Outcomes[2] = {}
	Event_JFDAmericaRooseveltConcernedCitizen.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_AMERICA_ROOSEVELT_CONCERNED_CITIZEN_OUTCOME_2"
	Event_JFDAmericaRooseveltConcernedCitizen.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_AMERICA_ROOSEVELT_CONCERNED_CITIZEN_OUTCOME_RESULT_2"
	Event_JFDAmericaRooseveltConcernedCitizen.Outcomes[2].CanFunc = (
		function(player)	
			return true
		end
		)
	Event_JFDAmericaRooseveltConcernedCitizen.Outcomes[2].DoFunc = (
		function(player) 
		local playerID = player:GetID()
		JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_AMERICA_ROOSEVELT_CONCERNED_CITIZEN_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AMERICA_ROOSEVELT_CONCERNED_CITIZEN"))
		end)
		
Events_AddCivilisationSpecific(civilisationID, "Event_JFDAmericaRooseveltConcernedCitizen", Event_JFDAmericaRooseveltConcernedCitizen)
--------------------------------------------------------------------------------------------------------------------------
-- Army Compensation
--------------------------------------------------------------------------------------------------------------------------
local veteranUnit = nil

local Event_JFDAmericaRooseveltArmyCompensation = {}
	Event_JFDAmericaRooseveltArmyCompensation.Name = "TXT_KEY_EVENT_JFD_AMERICA_ROOSEVELT_ARMY_COMPENSATION"
	Event_JFDAmericaRooseveltArmyCompensation.Desc = "TXT_KEY_EVENT_JFD_AMERICA_ROOSEVELT_ARMY_COMPENSATION_DESC"
	Event_JFDAmericaRooseveltArmyCompensation.Weight = 5
	Event_JFDAmericaRooseveltArmyCompensation.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID then return false end
			
			local unitCount = 1
			for unit in player:Units() do
				if unit:GetLevel() > 2 then
					veteranUnit = unit
					break
				end
			end
			
			if veteranUnit == nil then return false end
			
			Event_JFDAmericaRooseveltArmyCompensation.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AMERICA_ROOSEVELT_ARMY_COMPENSATION_DESC")
			return true
		end
		)
	Event_JFDAmericaRooseveltArmyCompensation.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDAmericaRooseveltArmyCompensation.Outcomes[1] = {}
	Event_JFDAmericaRooseveltArmyCompensation.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_AMERICA_ROOSEVELT_ARMY_COMPENSATION_OUTCOME_1"
	Event_JFDAmericaRooseveltArmyCompensation.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_AMERICA_ROOSEVELT_ARMY_COMPENSATION_OUTCOME_RESULT_1"
	Event_JFDAmericaRooseveltArmyCompensation.Outcomes[1].CanFunc = (
		function(player)	
			local goldenAgeCost = mathCeil(player:GetGoldenAgeProgressMeter() * 33 / 100)
			Event_JFDAmericaRooseveltArmyCompensation.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AMERICA_ROOSEVELT_ARMY_COMPENSATION_OUTCOME_RESULT_1", goldenAgeCost)
			return true
		end
		)
	Event_JFDAmericaRooseveltArmyCompensation.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldenAgeCost = mathCeil(player:GetGoldenAgeProgressMeter() * 33 / 100)
			player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)
			if JFD_GetRandom(1,10) <= 2 then
				veteranUnit:Kill(false, -1)
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_AMERICA_ROOSEVELT_ARMY_COMPENSATION_OUTCOME_RESULT_1_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AMERICA_ROOSEVELT_ARMY_COMPENSATION"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_AMERICA_ROOSEVELT_ARMY_COMPENSATION_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AMERICA_ROOSEVELT_ARMY_COMPENSATION"))
			end
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDAmericaRooseveltArmyCompensation.Outcomes[2] = {}
	Event_JFDAmericaRooseveltArmyCompensation.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_AMERICA_ROOSEVELT_ARMY_COMPENSATION_OUTCOME_2"
	Event_JFDAmericaRooseveltArmyCompensation.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_AMERICA_ROOSEVELT_ARMY_COMPENSATION_OUTCOME_RESULT_2"
	Event_JFDAmericaRooseveltArmyCompensation.Outcomes[2].CanFunc = (
		function(player)	
			local goldCost = mathCeil(player:GetNumMilitaryUnits() * 20)
			local goldenAgeReward = mathCeil(player:GetGoldenAgeProgressMeter() * 37 / 200)
			if player:GetGold() < goldCost then return false end
			Event_JFDAmericaRooseveltArmyCompensation.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AMERICA_ROOSEVELT_ARMY_COMPENSATION_OUTCOME_RESULT_2", goldCost, goldenAgeReward)
			return true
		end
		)
	Event_JFDAmericaRooseveltArmyCompensation.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = mathCeil(player:GetNumMilitaryUnits() * 20)
			local goldenAgeReward = mathCeil(player:GetGoldenAgeProgressMeter() * 37 / 200)
			player:ChangeGold(-goldCost)
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_AMERICA_ROOSEVELT_ARMY_COMPENSATION_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_AMERICA_ROOSEVELT_ARMY_COMPENSATION"))
		end)
		
Events_AddCivilisationSpecific(civilisationID, "Event_JFDAmericaRooseveltArmyCompensation", Event_JFDAmericaRooseveltArmyCompensation)
--=======================================================================================================================
--=======================================================================================================================


