-- JFD_Vandals_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's Vandals Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- MOD CHECKS
------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingHistoricalReligions
function JFD_IsUsingHistoricalReligions()
	local historicalReligionsModID = "6010e6f6-918e-48b8-9332-d60783bd8fb5"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == historicalReligionsModID) then
			return true
		end
	end
	return false
end
local isUsingHistoricalReligions = JFD_IsUsingHistoricalReligions()

-- JFD_IsUsingPiety
function JFD_IsUsingPiety()
	local pietyModID = "eea66053-7579-481a-bb8d-2f3959b59974"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == pietyModID) then
			return true
		end
	end
	return false
end
local isUsingPiety = JFD_IsUsingPiety()
------------------------------------------------------------------------------------------------------------------------
-- UTILS
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
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_THE_VANDALS"]
local mathCeil = math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- St. Augustine
--------------------------------------------------------------------------------------------------------------------------
local eventStAugustineCity = nil
local Event_JFD_Vandals_StAugustine = {}
	Event_JFD_Vandals_StAugustine.Name = "TXT_KEY_EVENT_JFD_THE_VANDALS_ST_AUGUSTINE"
	Event_JFD_Vandals_StAugustine.Desc = "TXT_KEY_EVENT_JFD_THE_VANDALS_ST_AUGUSTINE_DESC"
	Event_JFD_Vandals_StAugustine.EventImage = 'Event_Vandals_StAugustine.dds'
	Event_JFD_Vandals_StAugustine.Weight = 10
	Event_JFD_Vandals_StAugustine.CanFunc = (
		function(player)			
			if load(player, "Event_JFD_Vandals_StAugustine") == true then return false end
			if player:GetCivilizationType() ~= civilizationID then return false end
			local faithCost = mathCeil(200*iMod)
			if player:GetFaith() < faithCost then return false end
			local playerTeam = Teams[player:GetTeam()]
			for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
				local otherPlayer = Players[otherPlayerID]
				if (otherPlayer:IsAlive() and playerTeam:IsAtWar(otherPlayer:GetTeam())) then
					for city in otherPlayer:Cities() do
						if city:GetDamage() > 0 then
							local plot = Map.GetPlot(city:GetX(), city:GetY())
							local unitNearby = false
							for loopPlot in PlotAreaSweepIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
								if (loopPlot:GetUnit() and loopPlot:GetUnit():GetOwner() == player:GetID()) then
									eventStAugustineCity = city
									break
								end
							end
						end
					end
				end
			end
			if (not eventStAugustineCity) then return false end
			Event_JFD_Vandals_StAugustine.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_THE_VANDALS_ST_AUGUSTINE_DESC", eventStAugustineCity:GetName())
			return true
		end
		)
	Event_JFD_Vandals_StAugustine.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_Vandals_StAugustine.Outcomes[1] = {}
	Event_JFD_Vandals_StAugustine.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_THE_VANDALS_ST_AUGUSTINE_OUTCOME_1"
	Event_JFD_Vandals_StAugustine.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_THE_VANDALS_ST_AUGUSTINE_OUTCOME_RESULT_1"
	Event_JFD_Vandals_StAugustine.Outcomes[1].CanFunc = (
		function(player)	
			local faithCost = mathCeil(200*iMod)
			Event_JFD_Vandals_StAugustine.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_THE_VANDALS_ST_AUGUSTINE_OUTCOME_RESULT_1", faithCost, eventStAugustineCity:GetName())
			return true
		end
		)
	Event_JFD_Vandals_StAugustine.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local faithCost = mathCeil(200*iMod)
			player:ChangeFaith(-faithCost)
			if GetRandom(1,10) <= 5 then
				player:AcquireCity(eventStAugustineCity, false, true)
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_THE_VANDALS_ST_AUGUSTINE_OUTCOME_RESULT_1_ALT_NOTIFICATION", eventStAugustineCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_THE_VANDALS_ST_AUGUSTINE"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_THE_VANDALS_ST_AUGUSTINE_OUTCOME_RESULT_1_NOTIFICATION", eventStAugustineCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_THE_VANDALS_ST_AUGUSTINE"))
			end
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENT_THE_VANDALS_ST_AUGUSTINE_1", player:GetName(), player:GetCivilizationShortDescription(), eventStAugustineCity:GetName())) 	
			save(player, "Event_JFD_Vandals_StAugustine", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_Vandals_StAugustine.Outcomes[2] = {}
	Event_JFD_Vandals_StAugustine.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_THE_VANDALS_ST_AUGUSTINE_OUTCOME_2"
	Event_JFD_Vandals_StAugustine.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_THE_VANDALS_ST_AUGUSTINE_OUTCOME_RESULT_2"
	Event_JFD_Vandals_StAugustine.Outcomes[2].CanFunc = (
		function(player)	
			local faithReward = mathCeil(130*iMod)
			Event_JFD_Vandals_StAugustine.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_THE_VANDALS_ST_AUGUSTINE_OUTCOME_RESULT_2", eventStAugustineCity:GetName(), faithReward)
			return true
		end
		)
	Event_JFD_Vandals_StAugustine.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local faithReward = mathCeil(130*iMod)
			player:ChangeFaith(faithReward)
			eventStAugustineCity:ChangeDamage(-20)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_THE_VANDALS_ST_AUGUSTINE_OUTCOME_RESULT_2_NOTIFICATION", eventStAugustineCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_THE_VANDALS_ST_AUGUSTINE"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENT_THE_VANDALS_ST_AUGUSTINE_2", player:GetName(), player:GetCivilizationShortDescription(), eventStAugustineCity:GetName())) 	
			save(player, "Event_JFD_Vandals_StAugustine", true)	
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_Vandals_StAugustine.Outcomes[3] = {}
	Event_JFD_Vandals_StAugustine.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_THE_VANDALS_ST_AUGUSTINE_OUTCOME_3"
	Event_JFD_Vandals_StAugustine.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_THE_VANDALS_ST_AUGUSTINE_OUTCOME_RESULT_3"
	Event_JFD_Vandals_StAugustine.Outcomes[3].CanFunc = (
		function(player)	
			local goldReward = mathCeil(90*iMod)
			Event_JFD_Vandals_StAugustine.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_THE_VANDALS_ST_AUGUSTINE_OUTCOME_RESULT_3", eventStAugustineCity:GetName(), goldReward)
			return true
		end
		)
	Event_JFD_Vandals_StAugustine.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldReward = mathCeil(90*iMod)
			player:ChangeGold(goldReward)
			eventStAugustineCity:ChangeDamage(-10)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_THE_VANDALS_ST_AUGUSTINE_OUTCOME_RESULT_3_NOTIFICATION", eventStAugustineCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_THE_VANDALS_ST_AUGUSTINE"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENT_THE_VANDALS_ST_AUGUSTINE_3", player:GetName(), player:GetCivilizationShortDescription(), eventStAugustineCity:GetName())) 	
			save(player, "Event_JFD_Vandals_StAugustine", true)	
		end)
	
	
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_Vandals_StAugustine", Event_JFD_Vandals_StAugustine)
--------------------------------------------------------------------------------------------------------------------------
-- Vandals: Arian Heresy
--------------------------------------------------------------------------------------------------------------------------
local religionArianismID = GameInfoTypes["RELIGION_CHRISTIAN_ARIANISM"]
local Event_JFD_Vandals_ArianHeresy = {}
	Event_JFD_Vandals_ArianHeresy.Name = "TXT_KEY_EVENT_JFD_THE_VANDALS_ARIAN_HERESY"
	Event_JFD_Vandals_ArianHeresy.Desc = "TXT_KEY_EVENT_JFD_THE_VANDALS_ARIAN_HERESY_DESC"
	Event_JFD_Vandals_ArianHeresy.EventImage = 'Event_Vandals_ArianHeresy.dds'
	Event_JFD_Vandals_ArianHeresy.Weight = 20
	Event_JFD_Vandals_ArianHeresy.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilizationID then return false end
			if Game.GetNumReligionsFounded() < 2 then return false end
			if isUsingHistoricalReligions then 
				if player:GetReligionCreatedByPlayer() == religionArianismID then return false end
			end
			return true
		end
		)
	Event_JFD_Vandals_ArianHeresy.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_Vandals_ArianHeresy.Outcomes[1] = {}
	Event_JFD_Vandals_ArianHeresy.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_THE_VANDALS_ARIAN_HERESY_OUTCOME_1"
	Event_JFD_Vandals_ArianHeresy.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_THE_VANDALS_ARIAN_HERESY_OUTCOME_RESULT_1"
	Event_JFD_Vandals_ArianHeresy.Outcomes[1].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local yieldReward = mathCeil(100*iMod)
			local yieldRewardType = "[ICON_PEACE] Faith"
			if (isUsingPiety and player:HasStateReligion()) then
				yieldReward = mathCeil(30*iMod)
				yieldRewardType = "[ICON_JFD_PIETY] Piety"
			end
			Event_JFD_Vandals_ArianHeresy.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_THE_VANDALS_ARIAN_HERESY_OUTCOME_RESULT_1", yieldReward, yieldRewardType)
			return true
		end
		)
	Event_JFD_Vandals_ArianHeresy.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local yieldReward = mathCeil(100*iMod)
			if (isUsingPiety and player:HasStateReligion()) then
				yieldReward = mathCeil(30*iMod)
				player:ChangePiety(yieldReward)
			else
				player:ChangeFaith(yieldReward)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_THE_VANDALS_ARIAN_HERESY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_THE_VANDALS_ARIAN_HERESY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENT_THE_VANDALS_ARIAN_HERESY_1", player:GetName(), player:GetCivilizationShortDescription())) 	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_Vandals_ArianHeresy.Outcomes[2] = {}
	Event_JFD_Vandals_ArianHeresy.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_THE_VANDALS_ARIAN_HERESY_OUTCOME_2"
	Event_JFD_Vandals_ArianHeresy.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_THE_VANDALS_ARIAN_HERESY_OUTCOME_RESULT_2"
	Event_JFD_Vandals_ArianHeresy.Outcomes[2].CanFunc = (
		function(player)	
			if (not isUsingHistoricalReligions) then return false end
			Event_JFD_Vandals_ArianHeresy.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_THE_VANDALS_ARIAN_HERESY_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFD_Vandals_ArianHeresy.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local founderBeliefs = {}
			local followerBeliefs = {}
			local founderCount = 1
			local followerCount = 1
			for belief in GameInfo.Beliefs() do
				if belief.Founder then
					founderBeliefs[founderCount] = belief.ID
					founderCount = founderCount + 1
				end
				if belief.Follower then
					followerBeliefs[followerCount] = belief.ID
					followerCount = followerCount + 1
				end
			end
			local randomBelief1ID = founderBeliefs[GetRandom(1, #founderBeliefs)]
			local randomBelief2ID = followerBeliefs[GetRandom(1, #followerBeliefs)]
			if (not Game.GetHolyCityForReligion(religionArianismID, -1)) then
				Game.FoundReligion(playerID, religionArianismID, nil, randomBelief1ID, randomBelief2ID, -1, -1, player:GetCapitalCity()) 
			end
			for city in player:Cities() do
				city:AdoptReligionFully(religionArianismID)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_THE_VANDALS_ARIAN_HERESY_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_THE_VANDALS_ARIAN_HERESY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENT_THE_VANDALS_ARIAN_HERESY_2", player:GetName(), player:GetCivilizationShortDescription())) 	
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_Vandals_ArianHeresy.Outcomes[3] = {}
	Event_JFD_Vandals_ArianHeresy.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_THE_VANDALS_ARIAN_HERESY_OUTCOME_3"
	Event_JFD_Vandals_ArianHeresy.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_THE_VANDALS_ARIAN_HERESY_OUTCOME_RESULT_3"
	Event_JFD_Vandals_ArianHeresy.Outcomes[3].CanFunc = (
		function(player)	
			local goldReward = mathCeil(200*iMod)
			Event_JFD_Vandals_ArianHeresy.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_THE_VANDALS_ARIAN_HERESY_OUTCOME_RESULT_3", goldReward)
			return true
		end
		)
	Event_JFD_Vandals_ArianHeresy.Outcomes[3].DoFunc = (
		function(player) 
			local goldReward = mathCeil(200*iMod)
			player:ChangeGold(goldReward)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_THE_VANDALS_ARIAN_HERESY_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_THE_VANDALS_ARIAN_HERESY"))
		end)
	
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_Vandals_ArianHeresy", Event_JFD_Vandals_ArianHeresy)
--=======================================================================================================================
--=======================================================================================================================


