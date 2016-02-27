-- JFD_ScotlandEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Scotland Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILITIES
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
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_SCOTLAND"]
local mathCeil		 = math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- Gunpowder Plot
--------------------------------------------------------------------------------------------------------------------------
local techGunpowderID = GameInfoTypes["TECH_GUNPOWDER"]
local Event_JFD_Scotland_GunpowderPlot = {}
	Event_JFD_Scotland_GunpowderPlot.Name = "TXT_KEY_EVENT_JFD_SCOTLAND_GUNPOWDER_PLOT"
	Event_JFD_Scotland_GunpowderPlot.Desc = "TXT_KEY_EVENT_JFD_SCOTLAND_GUNPOWDER_PLOT_DESC"
	Event_JFD_Scotland_GunpowderPlot.EventImage = 'Event_Scotland_GunpowderPlot.dds'
	Event_JFD_Scotland_GunpowderPlot.Weight = 10
	Event_JFD_Scotland_GunpowderPlot.CanFunc = (
		function(player)			
			if load(player, "Event_JFD_Scotland_GunpowderPlot") == true then return false end
			if player:GetCivilizationType() ~= civilizationID then return false end
			if (not Teams[player:GetTeam()]:IsHasTech(techGunpowderID)) then return false end
			return true
		end
		)
	Event_JFD_Scotland_GunpowderPlot.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_Scotland_GunpowderPlot.Outcomes[1] = {}
	Event_JFD_Scotland_GunpowderPlot.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_SCOTLAND_GUNPOWDER_PLOT_OUTCOME_1"
	Event_JFD_Scotland_GunpowderPlot.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_SCOTLAND_GUNPOWDER_PLOT_OUTCOME_RESULT_1"
	Event_JFD_Scotland_GunpowderPlot.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFD_Scotland_GunpowderPlot.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SCOTLAND_GUNPOWDER_PLOT_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_Scotland_GunpowderPlot.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			for city in player:Cities() do
				city:ChangeWeLoveTheKingDayCounter(5)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SCOTLAND_GUNPOWDER_PLOT_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SCOTLAND_GUNPOWDER_PLOT"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SCOTLAND_GUNPOWDER_PLOT", player:GetName(), player:GetCivilizationShortDescription())) 
			save(player, "Event_JFD_Scotland_GunpowderPlot", true)	
		end)
	
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_Scotland_GunpowderPlot", Event_JFD_Scotland_GunpowderPlot)
--------------------------------------------------------------------------------------------------------------------------
-- Scotland: Wealth of Nations
--------------------------------------------------------------------------------------------------------------------------
local eraRenaissanceID	= GameInfoTypes["ERA_RENAISSANCE"]
local unitMerchantID	= GameInfoTypes["UNIT_MERCHANT"]
local Event_JFD_Scotland_WealthofNations = {}
	Event_JFD_Scotland_WealthofNations.Name = "TXT_KEY_EVENT_JFD_SCOTLAND_WEALTH_OF_NATIONS"
	Event_JFD_Scotland_WealthofNations.Desc = "TXT_KEY_EVENT_JFD_SCOTLAND_WEALTH_OF_NATIONS_DESC"
	Event_JFD_Scotland_WealthofNations.EventImage = 'Event_Scotland_WealthofNations.dds'
	Event_JFD_Scotland_WealthofNations.Weight = 10
	Event_JFD_Scotland_WealthofNations.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilizationID then return false end
			if player:GetCurrentEra() ~= eraRenaissanceID then return false end
			return true
		end
		)
	Event_JFD_Scotland_WealthofNations.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_Scotland_WealthofNations.Outcomes[1] = {}
	Event_JFD_Scotland_WealthofNations.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_SCOTLAND_WEALTH_OF_NATIONS_OUTCOME_1"
	Event_JFD_Scotland_WealthofNations.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_SCOTLAND_WEALTH_OF_NATIONS_OUTCOME_RESULT_1"
	Event_JFD_Scotland_WealthofNations.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFD_Scotland_WealthofNations.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SCOTLAND_WEALTH_OF_NATIONS_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_Scotland_WealthofNations.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local capital = player:GetCapitalCity()
			player:InitUnit(unitMerchantID, capital:GetX(), capital:GetY()):SetName("Adam Smith")
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SCOTLAND_WEALTH_OF_NATIONS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SCOTLAND_WEALTH_OF_NATIONS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SCOTLAND_WEALTH_OF_NATIONS", player:GetCivilizationShortDescription())) 
		end)
	
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_Scotland_WealthofNations", Event_JFD_Scotland_WealthofNations)
--------------------------------------------------------------------------------------------------------------------------
-- Scotland: Wild Haggis
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_Scotland_WildHaggis = {}
	Event_JFD_Scotland_WildHaggis.Name = "TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS"
	Event_JFD_Scotland_WildHaggis.Desc = "TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS_DESC"
	Event_JFD_Scotland_WildHaggis.EventImage = 'Event_Scotland_WildHaggis.dds'
	Event_JFD_Scotland_WildHaggis.Weight = 10
	Event_JFD_Scotland_WildHaggis.CanFunc = (
		function(player)			
			if load(player, "Event_JFD_Scotland_WildHaggis") == true then return false end
			if player:GetCivilizationType() ~= civilizationID then return false end
			Event_JFD_Scotland_WildHaggis.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS_DESC")
			return true
		end
		)
	Event_JFD_Scotland_WildHaggis.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_Scotland_WildHaggis.Outcomes[1] = {}
	Event_JFD_Scotland_WildHaggis.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS_OUTCOME_1"
	Event_JFD_Scotland_WildHaggis.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS_OUTCOME_RESULT_1"
	Event_JFD_Scotland_WildHaggis.Outcomes[1].CanFunc = (
		function(player)			
			Event_JFD_Scotland_WildHaggis.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_Scotland_WildHaggis.Outcomes[1].DoFunc = (
		function(player) 
			str =  Locale.ConvertTextKey("TXT_KEY_CIV5_SCOTLAND_FACTOID_TEXT_TRUTH");
			local tquery = {"UPDATE Language_en_US SET Text = '".. str .."' WHERE Tag = 'TXT_KEY_CIV5_SCOTLAND_FACTOID_TEXT'"}
			for i, iQuery in pairs(tquery) do
				for result in DB.Query(iQuery) do
				end
			end
			-- refresh UI texts
			Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SCOTLAND_WILD_HAGGIS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS"))
			save(player, "Event_JFD_Scotland_WildHaggis", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_Scotland_WildHaggis.Outcomes[2] = {}
	Event_JFD_Scotland_WildHaggis.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS_OUTCOME_2"
	Event_JFD_Scotland_WildHaggis.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS_OUTCOME_RESULT_2"
	Event_JFD_Scotland_WildHaggis.Outcomes[2].CanFunc = (
		function(player)			
			local faithReward = mathCeil(100 * iMod)
			Event_JFD_Scotland_WildHaggis.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFD_Scotland_WildHaggis.Outcomes[2].DoFunc = (
		function(player) 
			str =  Locale.ConvertTextKey("TXT_KEY_CIV5_SCOTLAND_FACTOID_TEXT_TRUTH");
			local tquery = {"UPDATE Language_en_US SET Text = '".. str .."' WHERE Tag = 'TXT_KEY_CIV5_SCOTLAND_FACTOID_TEXT'"}
			for i, iQuery in pairs(tquery) do
				for result in DB.Query(iQuery) do
				end
			end
			-- refresh UI texts
			Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SCOTLAND_WILD_HAGGIS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS"))
			save(player, "Event_JFD_Scotland_WildHaggis", true)	
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_Scotland_WildHaggis.Outcomes[3] = {}
	Event_JFD_Scotland_WildHaggis.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS_OUTCOME_3"
	Event_JFD_Scotland_WildHaggis.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS_OUTCOME_RESULT_3"
	Event_JFD_Scotland_WildHaggis.Outcomes[3].CanFunc = (
		function(player)			
			Event_JFD_Scotland_WildHaggis.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_JFD_Scotland_WildHaggis.Outcomes[3].DoFunc = (
		function(player) 
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SCOTLAND_WILD_HAGGIS_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS"))
			save(player, "Event_JFD_Scotland_WildHaggis", true)	
		end)
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_Scotland_WildHaggis", Event_JFD_Scotland_WildHaggis)
--=======================================================================================================================
--=======================================================================================================================


