-- JFD_Switzerland_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's Switzerland Events: loaded")
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
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_SWITZERLAND"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"] 
local mathCeil = math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- Promising Student
--------------------------------------------------------------------------------------------------------------------------
local unitPromotionExtraSight1ID = GameInfoTypes["PROMOTION_EXTRA_SIGHT_I"]
local Event_JFD_Switzerland_PromisingStudent = {}
	Event_JFD_Switzerland_PromisingStudent.Name = "TXT_KEY_EVENT_JFD_SWITZERLAND_PROMISING_STUDENT"
	Event_JFD_Switzerland_PromisingStudent.Desc = "TXT_KEY_EVENT_JFD_SWITZERLAND_PROMISING_STUDENT_DESC"
	Event_JFD_Switzerland_PromisingStudent.Weight = 5
	Event_JFD_Switzerland_PromisingStudent.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilizationID then return false end
			if player:GetCurrentEra() < eraRenaissanceID then return false end
			return true
		end
		)
	Event_JFD_Switzerland_PromisingStudent.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_Switzerland_PromisingStudent.Outcomes[1] = {}
	Event_JFD_Switzerland_PromisingStudent.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_SWITZERLAND_PROMISING_STUDENT_OUTCOME_1"
	Event_JFD_Switzerland_PromisingStudent.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_SWITZERLAND_PROMISING_STUDENT_OUTCOME_RESULT_1"
	Event_JFD_Switzerland_PromisingStudent.Outcomes[1].Weight = 5
	Event_JFD_Switzerland_PromisingStudent.Outcomes[1].CanFunc = (
		function(player)			
			Event_JFD_Switzerland_PromisingStudent.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SWITZERLAND_PROMISING_STUDENT_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_Switzerland_PromisingStudent.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			for unit in player:Units() do
				if unit:IsCombatUnit() then
					unit:ChangeExperience(5)
				end
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SWITZERLAND_PROMISING_STUDENT_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SWITZERLAND_PROMISING_STUDENT"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_Switzerland_PromisingStudent.Outcomes[2] = {}
	Event_JFD_Switzerland_PromisingStudent.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_SWITZERLAND_PROMISING_STUDENT_OUTCOME_2"
	Event_JFD_Switzerland_PromisingStudent.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_SWITZERLAND_PROMISING_STUDENT_OUTCOME_RESULT_2"
	Event_JFD_Switzerland_PromisingStudent.Outcomes[2].Weight = 3
	Event_JFD_Switzerland_PromisingStudent.Outcomes[2].CanFunc = (
		function(player)			
			Event_JFD_Switzerland_PromisingStudent.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SWITZERLAND_PROMISING_STUDENT_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFD_Switzerland_PromisingStudent.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			for unit in player:Units() do
				if unit:IsCombatUnit() then
					unit:SetHasPromotion(unitPromotionExtraSight1ID, true)
				end
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SWITZERLAND_PROMISING_STUDENT_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SWITZERLAND_PROMISING_STUDENT"))
		end)
	
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_Switzerland_PromisingStudent", Event_JFD_Switzerland_PromisingStudent)
--------------------------------------------------------------------------------------------------------------------------
-- Zuriputsch
--------------------------------------------------------------------------------------------------------------------------
local cityID = nil
local Event_JFD_Switzerland_ConservativeCoup = {}
	Event_JFD_Switzerland_ConservativeCoup.Name = "TXT_KEY_EVENT_JFD_SWITZERLAND_CONSERVATIVE_COUP"
	Event_JFD_Switzerland_ConservativeCoup.Desc = "TXT_KEY_EVENT_JFD_SWITZERLAND_CONSERVATIVE_COUP_DESC"
	Event_JFD_Switzerland_ConservativeCoup.Weight = 5
	Event_JFD_Switzerland_ConservativeCoup.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilizationID then return false end
			if player:GetCurrentEra() < eraRenaissanceID then return false end
			local cities = {}
			local count = 1
			for city in player:Cities() do
				cities[count] = city:GetID()
				count = count + 1
			end
			cityID = cities[GetRandom(1,#cities)]
			if cityID == nil then return false end
			local city = player:GetCityByID(cityID)
			Event_JFD_Switzerland_ConservativeCoup.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SWITZERLAND_CONSERVATIVE_COUP_DESC", city:GetName())
			return true
		end
		)
	Event_JFD_Switzerland_ConservativeCoup.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_Switzerland_ConservativeCoup.Outcomes[1] = {}
	Event_JFD_Switzerland_ConservativeCoup.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_SWITZERLAND_CONSERVATIVE_COUP_OUTCOME_1"
	Event_JFD_Switzerland_ConservativeCoup.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_SWITZERLAND_CONSERVATIVE_COUP_OUTCOME_RESULT_1"
	Event_JFD_Switzerland_ConservativeCoup.Outcomes[1].CanFunc = (
		function(player)	
			local city = player:GetCityByID(cityID)
			Event_JFD_Switzerland_ConservativeCoup.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SWITZERLAND_CONSERVATIVE_COUP_OUTCOME_RESULT_1", city:GetName())
			return true
		end
		)
	Event_JFD_Switzerland_ConservativeCoup.Outcomes[1].DoFunc = (
		function(player) 
			local city = player:GetCityByID(cityID)
			city:ChangeResistanceTurns(2)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SWITZERLAND_CONSERVATIVE_COUP_OUTCOME_RESULT_1_NOTIFICATION", city:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SWITZERLAND_CONSERVATIVE_COUP"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_Switzerland_ConservativeCoup.Outcomes[2] = {}
	Event_JFD_Switzerland_ConservativeCoup.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_SWITZERLAND_CONSERVATIVE_COUP_OUTCOME_2"
	Event_JFD_Switzerland_ConservativeCoup.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_SWITZERLAND_CONSERVATIVE_COUP_OUTCOME_RESULT_2"
	Event_JFD_Switzerland_ConservativeCoup.Outcomes[2].CanFunc = (
		function(player)	
			Event_JFD_Switzerland_ConservativeCoup.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SWITZERLAND_CONSERVATIVE_COUP_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFD_Switzerland_ConservativeCoup.Outcomes[2].DoFunc = (
		function(player) 
			player:GetCapitalCity():ChangeResistanceTurns(1)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SWITZERLAND_CONSERVATIVE_COUP_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SWITZERLAND_CONSERVATIVE_COUP"))
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_Switzerland_ConservativeCoup.Outcomes[3] = {}
	Event_JFD_Switzerland_ConservativeCoup.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_SWITZERLAND_CONSERVATIVE_COUP_OUTCOME_3"
	Event_JFD_Switzerland_ConservativeCoup.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_SWITZERLAND_CONSERVATIVE_COUP_OUTCOME_RESULT_3"
	Event_JFD_Switzerland_ConservativeCoup.Outcomes[3].CanFunc = (
		function(player)	
			local goldCost = mathCeil(278*iMod)
			if player:GetGold() < goldCost then return false end
			Event_JFD_Switzerland_ConservativeCoup.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SWITZERLAND_CONSERVATIVE_COUP_OUTCOME_RESULT_3", goldCost)
			return true
		end
		)
	Event_JFD_Switzerland_ConservativeCoup.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = mathCeil(278*iMod)
			player:ChangeGold(-goldCost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SWITZERLAND_CONSERVATIVE_COUP_OUTCOME_RESULT_3_NOTIFICATION", city:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SWITZERLAND_CONSERVATIVE_COUP"))
		end)
	
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_Switzerland_ConservativeCoup", Event_JFD_Switzerland_ConservativeCoup)
--=======================================================================================================================
--=======================================================================================================================


