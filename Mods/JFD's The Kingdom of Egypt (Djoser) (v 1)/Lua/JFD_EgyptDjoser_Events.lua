-- JFD_EgyptDjoser_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's Egypt (Djoser) Events: loaded")
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
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_EGYPT_DJOSER"]
local mathCeil = math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- Egypt (Djoser): Hebsed Festival
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_EgyptDjoser_Hebsed = {}
	Event_JFD_EgyptDjoser_Hebsed.Name = "TXT_KEY_EVENT_JFD_EGYPT_DJOSER_HEBSED"
	Event_JFD_EgyptDjoser_Hebsed.Desc = "TXT_KEY_EVENT_JFD_EGYPT_DJOSER_HEBSED_DESC"
	Event_JFD_EgyptDjoser_Hebsed.Weight = 5
	Event_JFD_EgyptDjoser_Hebsed.EventImage = 'Event_Egypt_Hebsed.dds'
	Event_JFD_EgyptDjoser_Hebsed.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilizationID then return false end
			return true
		end
		)
	Event_JFD_EgyptDjoser_Hebsed.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_EgyptDjoser_Hebsed.Outcomes[1] = {}
	Event_JFD_EgyptDjoser_Hebsed.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_EGYPT_DJOSER_HEBSED_OUTCOME_1"
	Event_JFD_EgyptDjoser_Hebsed.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_EGYPT_DJOSER_HEBSED_OUTCOME_RESULT_1"
	Event_JFD_EgyptDjoser_Hebsed.Outcomes[1].Weight = 5
	Event_JFD_EgyptDjoser_Hebsed.Outcomes[1].CanFunc = (
		function(player)			
			Event_JFD_EgyptDjoser_Hebsed.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EGYPT_DJOSER_HEBSED_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_EgyptDjoser_Hebsed.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			for city in player:Cities() do
				city:ChangeWeLoveTheKingDayCounter(5)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_EGYPT_DJOSER_HEBSED_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EGYPT_DJOSER_HEBSED"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_EGYPT_DJOSER_HEBSED_1", player:GetName(), player:GetCivilizationShortDescription())) 
		end)

Events_AddCivilisationSpecific(civilizationID, "Event_JFD_EgyptDjoser_Hebsed", Event_JFD_EgyptDjoser_Hebsed)
--------------------------------------------------------------------------------------------------------------------------
--  Egypt (Djoser): Khnum
--------------------------------------------------------------------------------------------------------------------------
local buildingTempleID = GameInfoTypes["BUILDING_TEMPLE"]
local Event_JFD_EgyptDjoser_Khnum = {}
	Event_JFD_EgyptDjoser_Khnum.Name = "TXT_KEY_EVENT_JFD_EGYPT_DJOSER_KHNUM"
	Event_JFD_EgyptDjoser_Khnum.Desc = "TXT_KEY_EVENT_JFD_EGYPT_DJOSER_KHNUM_DESC"
	Event_JFD_EgyptDjoser_Khnum.Weight = 10
	Event_JFD_EgyptDjoser_Khnum.EventImage = 'Event_Egypt_Khnum.dds'
	Event_JFD_EgyptDjoser_Khnum.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilizationID then return false end
			local faithCost = mathCeil(60*iMod)
			if player:GetFaith() < faithCost then return false end
			return true
		end
		)
	Event_JFD_EgyptDjoser_Khnum.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_EgyptDjoser_Khnum.Outcomes[1] = {}
	Event_JFD_EgyptDjoser_Khnum.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_EGYPT_DJOSER_KHNUM_OUTCOME_1"
	Event_JFD_EgyptDjoser_Khnum.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_EGYPT_DJOSER_KHNUM_OUTCOME_RESULT_1"
	Event_JFD_EgyptDjoser_Khnum.Outcomes[1].Weight = 5
	Event_JFD_EgyptDjoser_Khnum.Outcomes[1].CanFunc = (
		function(player)			
			local foodCost = mathCeil(20*iMod)
			Event_JFD_EgyptDjoser_Khnum.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EGYPT_DJOSER_KHNUM_OUTCOME_RESULT_1", foodCost)
			return true
		end
		)
	Event_JFD_EgyptDjoser_Khnum.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local foodCost = mathCeil(20*iMod)
			if GetRandom(1,10) <= 2 then 
				for city in player:Cities() do
					city:ChangeFood(-foodCost)
				end
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_EGYPT_DJOSER_KHNUM_OUTCOME_RESULT_1_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EGYPT_DJOSER_KHNUM"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_EGYPT_DJOSER_KHNUM_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EGYPT_DJOSER_KHNUM"))
			end
			save(player, "Event_JFD_EgyptDjoser_Khnum", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_EgyptDjoser_Khnum.Outcomes[2] = {}
	Event_JFD_EgyptDjoser_Khnum.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_EGYPT_DJOSER_KHNUM_OUTCOME_2"
	Event_JFD_EgyptDjoser_Khnum.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_EGYPT_DJOSER_KHNUM_OUTCOME_RESULT_2"
	Event_JFD_EgyptDjoser_Khnum.Outcomes[2].Weight = 5
	Event_JFD_EgyptDjoser_Khnum.Outcomes[2].CanFunc = (
		function(player)			
			local faithCost = mathCeil(70*iMod)
			local foodReward = mathCeil(20*iMod)
			Event_JFD_EgyptDjoser_Khnum.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EGYPT_DJOSER_KHNUM_OUTCOME_RESULT_2", faithCost, foodReward)
			return true
		end
		)
	Event_JFD_EgyptDjoser_Khnum.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local faithCost = mathCeil(60*iMod)
			local foodReward = mathCeil(20*iMod)
			local cityList = ""
			player:ChangeFaith(-faithCost)
			for city in player:Cities() do
				local rewardChance = 25
				if city:IsHasBuilding(buildingTempleID) then
					rewardChance = 50
				end
				if GetRandom(1,100) <= rewardChance then
					city:ChangeFood(foodReward)
					cityList = cityList .. "[NEWLINE]" .. city:GetName()
				end
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_EGYPT_DJOSER_KHNUM_OUTCOME_RESULT_2_NOTIFICATION", cityList), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EGYPT_DJOSER_KHNUM"))
			save(player, "Event_JFD_EgyptDjoser_Khnum", true)
		end)
		
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_EgyptDjoser_Khnum", Event_JFD_EgyptDjoser_Khnum)
--------------------------------------------------------------------------------------------------------------------------
--  Egypt (Djoser): Exceptional Courtier
--------------------------------------------------------------------------------------------------------------------------
local unitVizierID = GameInfoTypes["UNIT_JFD_VIZIER"]
local Event_JFD_EgyptDjoser_ExceptionalCourtier = {}
	Event_JFD_EgyptDjoser_ExceptionalCourtier.Name = "TXT_KEY_EVENT_JFD_EGYPT_DJOSER_EXCEPTIONAL_COURTIER"
	Event_JFD_EgyptDjoser_ExceptionalCourtier.Desc = "TXT_KEY_EVENT_JFD_EGYPT_DJOSER_EXCEPTIONAL_COURTIER_DESC"
	Event_JFD_EgyptDjoser_ExceptionalCourtier.Weight = 2
	Event_JFD_EgyptDjoser_ExceptionalCourtier.EventImage = 'Event_Egypt_ExceptionalCourtier.dds'
	Event_JFD_EgyptDjoser_ExceptionalCourtier.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilizationID then return false end
			return true
		end
		)
	Event_JFD_EgyptDjoser_ExceptionalCourtier.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_EgyptDjoser_ExceptionalCourtier.Outcomes[1] = {}
	Event_JFD_EgyptDjoser_ExceptionalCourtier.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_EGYPT_DJOSER_EXCEPTIONAL_COURTIER_OUTCOME_1"
	Event_JFD_EgyptDjoser_ExceptionalCourtier.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_EGYPT_DJOSER_EXCEPTIONAL_COURTIER_OUTCOME_RESULT_1"
	Event_JFD_EgyptDjoser_ExceptionalCourtier.Outcomes[1].Weight = 5
	Event_JFD_EgyptDjoser_ExceptionalCourtier.Outcomes[1].CanFunc = (
		function(player)			
			Event_JFD_EgyptDjoser_ExceptionalCourtier.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EGYPT_DJOSER_EXCEPTIONAL_COURTIER_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_EgyptDjoser_ExceptionalCourtier.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local capital = player:GetCapitalCity()
			local capitalX = capital:GetX()
			local capitalY = capital:GetY()
			player:InitUnit(unitVizierID, capitalX, capitalY)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_EGYPT_DJOSER_EXCEPTIONAL_COURTIER_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EGYPT_DJOSER_EXCEPTIONAL_COURTIER"))
			save(player, "Event_JFD_EgyptDjoser_ExceptionalCourtier", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_EgyptDjoser_ExceptionalCourtier.Outcomes[2] = {}
	Event_JFD_EgyptDjoser_ExceptionalCourtier.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_EGYPT_DJOSER_EXCEPTIONAL_COURTIER_OUTCOME_2"
	Event_JFD_EgyptDjoser_ExceptionalCourtier.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_EGYPT_DJOSER_EXCEPTIONAL_COURTIER_OUTCOME_RESULT_2"
	Event_JFD_EgyptDjoser_ExceptionalCourtier.Outcomes[2].Weight = 5
	Event_JFD_EgyptDjoser_ExceptionalCourtier.Outcomes[2].CanFunc = (
		function(player)			
			local cultureReward = mathCeil(300*iMod)
			Event_JFD_EgyptDjoser_ExceptionalCourtier.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EGYPT_DJOSER_EXCEPTIONAL_COURTIER_OUTCOME_RESULT_2", cultureReward)
			return true
		end
		)
	Event_JFD_EgyptDjoser_ExceptionalCourtier.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cultureReward = mathCeil(300*iMod)
			player:ChangeJONSCulture(cultureReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_EGYPT_DJOSER_EXCEPTIONAL_COURTIER_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EGYPT_DJOSER_EXCEPTIONAL_COURTIER"))
			save(player, "Event_JFD_EgyptDjoser_ExceptionalCourtier", true)
		end)
		
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_EgyptDjoser_ExceptionalCourtier", Event_JFD_EgyptDjoser_ExceptionalCourtier)
--=======================================================================================================================
--=======================================================================================================================


